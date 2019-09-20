var request = require('request');
var queryString = require('querystring');
var crypto = require('crypto');
var xml2jsparseString = require('xml2js').parseString;

//微信支付
function wxpayControler(){

    /**
     * 获取前端aja条用商品下单下单请求
     */
    this.orderPay = function(){
        var that = this;
        var data={};
        data.id = that.POST('id', { default: false });//获取数据id
        data.openid = that.POST('openid', { default: false });//获取数据id
        data.orderId = this.getId("W");
        data.ip = that.ipfun(this.req)
        var wxpay = this.model('Wxpay');        
        wxpay.updateOrderId(data, function(error,results,fields) {            
            if(results.affectedRows){
                wxpay.selectOrder(data.id,function(error,results,fields){
                    if(results[0].sum>0){
                        var obj ={};
                        obj.getId =data.orderId;
                        obj.total_fee = results[0].sum*100;
                        obj.openid = data.openid;
                        //obj.openid = 'oYrlD1oGRjBnyVDxZZsQVr8dYmjQ',
                        obj.ip = data.ip;
                        that.getPrepayId(obj);
                    }
                   
                })
            }
        });
    }


    /**
     * 余额充值
     */

    this.recharge = function(){
        var that = this;
        var data={};
        data.memerId = that.POST('usid', { default: false });//获取用户usid      
        data.orderAmount = that.POST('cash', { default: false });//获取用户充值钱
        data.openid = that.POST('openid', { default: false });//获取用户微信nopenid
        data.orderId = this.getId("R");
        data.ip = that.ipfun(this.req)
        var wxpay = this.model('Wxpay'); 
        console.log("data",data)      
        wxpay.addOrder(data, function(error,results,fields) {  
            if(results.affectedRows==1){
                if(results.affectedRows){
                    wxpay.selectOrder(data.id,function(error,results,fields){
                        if(results[0].sum>0){
                            var obj ={};
                            obj.getId =data.orderId;
                            obj.total_fee = data.orderAmount;
                            obj.openid = data.openid;
                            //obj.openid = 'oYrlD1oGRjBnyVDxZZsQVr8dYmjQ',
                            obj.ip = data.ip;
                            that.getPrepayId(obj);
                        }
                    
                    })
                 }
            } 
        });
    }










    /**
     * 同一下单
     * 获取微信统一下单的接口数据
     */
    this.getPrepayId = function(obj){
        var that = this;
        // 生成统一下单接口参数
        var UnifiedorderParams = {
            appid : appConf('wxpay.wxappid'),//公众号appid
            attach : "商品购买",//附加数据，在查询API和支付通知中原样返回，可作为自定义参数使用。
            body : '贵州染云科技有限公司',//商品简单描述
            mch_id : appConf('wxpay.mch_id'), //商户号
            nonce_str: this.createNonceStr(),//数据字符串
            notify_url : appConf('wxpay.notify_url'),// 微信付款后的回调地址
            openid : obj.openid, //用户openID
            out_trade_no : obj.getId, //订单号
            spbill_create_ip :obj.ip,//客户ip
           // total_fee : obj.total_fee,//价钱 分为单位
           total_fee : 1,
            trade_type : 'JSAPI',
            // sign : getSign(),//下面处理
        };

      
        // 获取 sign 参数
        UnifiedorderParams.sign = that.getSign(UnifiedorderParams);
        request.post({
                url : 'https://api.mch.weixin.qq.com/pay/unifiedorder', 
                body:JSON.stringify(that.getUnifiedorderXmlParams(UnifiedorderParams)
                )}, 
                function (error, response, body) {
                    if (!error && response.statusCode == 200) {
                        // 微信返回的数据为 xml 格式， 需要装换为 json 数据， 便于使用
                        xml2jsparseString(body, {async:true}, function (error, result) {
                           console.log("result.xml",result.xml)
                            //为前端调起微信的支付参数重新签名sgin
                            var datapay = {
                                appId:result.xml.appid[0],
                                timeStamp:Math.round(new Date().getTime()/1000).toString(),
                                nonceStr:result.xml.nonce_str[0],
                                package:"prepay_id="+result.xml.prepay_id[0],                              
                                signType:"MD5" 
                            }
                            datapay.paySign=that.getSign(datapay);

                            console.log("datapay",datapay);
                            that.renderJson(datapay);               
                        });
                    } else {
                        console.log(body);
                    }                   
                });
       
    }

    /**
     * 获取随机的NonceStr
     */
    this.createNonceStr = function() {
        return Math.random().toString(36).substr(2);
    };


    /**
     * 待微信支付的签名
     * @param payParams
     */
    this.getSign = function(signParams){
        // 按 key 值的ascll 排序
        var keys = Object.keys(signParams);
        keys = keys.sort();
        var newArgs = {};
        keys.forEach(function (val, key) {
            if (signParams[val]){
                newArgs[val] = signParams[val];
            }
        })
        var string = queryString.stringify(newArgs)+'&key='+ appConf('wxpay.wxpaykey');
        console.log(string);
        // 生成签名
        return crypto.createHash('md5').update(queryString.unescape(string), 'utf8').digest("hex").toUpperCase();
    }



    /**
     * 微信支付的所有参数
     * @param req 请求的资源, 获取必要的数据
     * @returns {{appId: string, timeStamp: Number, nonceStr: *, package: string, signType: string, paySign: *}}
     */
    this.getBrandWCPayParams = function( obj, callback ){
        var that = this;
        var prepay_id_promise = that.getPrepayId(obj);
        prepay_id_promise.then(function (prepay_id) {
            var prepay_id = prepay_id;
            var wcPayParams = {
                "appId" : appConf('wxpay.wxappid'),     //公众号名称，由商户传入
                "timeStamp" : parseInt(new Date().getTime() / 1000).toString(),//时间戳，自1970年以来的秒数
                "nonceStr" : that.createNonceStr(), //随机串                
                "package" : "prepay_id="+prepay_id,// 通过统一下单接口获取
                "signType" : "MD5",         //微信签名方式：
            };
            wcPayParams.paySign = that.getSign(wcPayParams); //微信支付签名
            callback(null, wcPayParams);
        },function (error) {
            callback(error);
        });
    }



    /**
     * 获取微信统一下单参数
     */
    this.getUnifiedorderXmlParams = function(obj){
        var body = '<xml> ' +
            '<appid>'+appConf('wxpay.wxappid')+'</appid> ' +
            '<attach>'+obj.attach+'</attach> ' +
            '<body>'+obj.body+'</body> ' +
            '<mch_id>'+appConf('wxpay.mch_id')+'</mch_id> ' +
            '<nonce_str>'+obj.nonce_str+'</nonce_str> ' +
            '<notify_url>'+obj.notify_url+'</notify_url>' +
            '<openid>'+obj.openid+'</openid> ' +
            '<out_trade_no>'+obj.out_trade_no+'</out_trade_no>'+
            '<spbill_create_ip>'+obj.spbill_create_ip+'</spbill_create_ip> ' +
            '<total_fee>'+obj.total_fee+'</total_fee> ' +
            '<trade_type>'+obj.trade_type+'</trade_type> ' +
            '<sign>'+obj.sign+'</sign> ' +
            '</xml>';
        return body;
    }

   /**
    * 生成订单号
    */
   this.getId = function(pre){
        let date = new Date();
        return pre + '' + date.getFullYear()+(date.getMonth()+1)+date.getDay()+date.getTime()+(Math.floor(Math.random()*10000)+10000);
    }

    /**
     * 获取客户ip
     */
    this.ipfun = function(req) {
		let ip = req.headers['x-forwarded-for'] ||
            req.ip ||
            req.connection.remoteAddress ||
            req.socket.remoteAddress ||
            req.connection.socket.remoteAddress || '';
		if(ip.split(',').length>0){
			ip = ip.split(',')[0]
        }
	    ip=ip.split(':')[ip.split(':').length-1];
		return ip;
	};
    
    /**
     * 回调接口
     */
    this.notify_url =function(){
        var data = this.POST()
        //console.log("post",data);
    }


}
module.exports = wxpayControler
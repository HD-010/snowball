


//支付宝支付
function alipayControler(){


     /**
     * 获取前端aja条用下单请求
     */
    this.orderPay = function(){
        var that = this;
        var data={};
        data.id = that.POST('id', { default: false });//获取数据id
        data.orderId = this.getId("A");
        var Alipay = this.model('Alipay');        
        Alipay.updateOrderId(data, function(error,results,fields) {            
            if(results.affectedRows){
                Alipay.selectOrder(data.id,function(error,results,fields){
                    if(results[0].sum>0){
                        var obj ={};
                        obj.getId =data.orderId;
                        obj.total_fee = results[0].sum;
                        obj.subject = "商品购买"
                        that.getPrepayId(obj);
                    }
                   
                })
            }
        });
    }

     /**
     * 获取前端aja条用下单请求
     */
    this.recharge = function(){
        var that = this;
        var data={};
        data.memerId = that.POST('usid', { default: false });//获取用户usid
        usid = data.memerId;
        data.orderAmount = that.POST('cash', { default: false });//获取用户充值钱d
        data.orderId = this.getId("R");
        var Alipay = this.model('Alipay');        
        Alipay.insertOrderId(data, function(error,results,fields){
            if(results.affectedRows==1){              
                var obj ={};
                obj.getId =data.orderId;
                obj.total_fee = data.orderAmount;
                obj.subject = "余额充值";
                that.getPrepayId(obj);                 
            }
        });
    }



      /**
     * 同一下单
     * 获取支付宝统一下单的接口数据
     */
    this.getPrepayId = function(obj){
        var that = this;        
        // 生成统一下单接口参数
        var UnifiedorderParams = {
            timestamp: that.getNowFormatDate(),//当前时间
            method: 'alipay.trade.wap.pay',//手机支付类型
            notify_url:appConf('alipay.notify_url'),
		    return_url:appConf('alipay.return_url'),
            app_id: appConf('alipay.app_id'),
            sign_type: appConf('alipay.sign_type'),
            charset:'utf-8',
            version: '1.0',
            biz_content: {
                timeout_express: '1m',//订单有效时间
                product_code: 'QUICK_MSECURITY_PAY',//销售产品码，商家和支付宝签约的产品码。
                total_amount: obj.total_fee,//商品价格
                subject: obj.subject,
                body: '贵州染云科技有限公司',
                out_trade_no:obj.getId
            }
        };

        var queryString = require('querystring');
        //将biz_content参数序列化为JSON格式字符串
        UnifiedorderParams.biz_content=JSON.stringify(UnifiedorderParams.biz_content);      
        // 获取 sign 参数
        UnifiedorderParams.sign = that.getSign(UnifiedorderParams);
        UnifiedorderParams = queryString.stringify(UnifiedorderParams);
        //console.log("sign",config.gatewayUrl+UnifiedorderParams);
        var list={
            href:appConf('alipay.gatewayUrl')+UnifiedorderParams
        }
        that.renderJson(list);      
       // that.redirect(config.gatewayUrl+UnifiedorderParams);//跳转支付
        // request.get({
        //     url : config.gatewayUrl+UnifiedorderParams, 
        // }, 
        // function (error, response, body) {
         
        //     //that.render({html:response.body},'/text');
        // });
       
    }

    /**
     * 支付宝支付回调
     */
    this.notify_url = function(){
        var that = this;
        var Alipay = this.model('Alipay');
        //获取支付宝支付成功回调的post 参数
        var data = this.POST()        
       //console.log("post",data);
        if(data.subject=='余额充值' && data.trade_status=='TRADE_SUCCESS'){
            let memberData = {
                memerId:usid,
                cash:data.total_amount
            }
           
            Alipay.updateMember(memberData,function(error,results,fields){
                if(results.affectedRows==1){
                    that.redirect('/h5/shop/rechargeDetail?cash='+memberData.cash);
                  // that.redirect('http://www.baidu.com');
                }
            })
        }


        if(data.subject=='商品购买' && data.trade_status=='TRADE_SUCCESS'){
            orderData={
                orderId:data.out_trade_no,
            }
            Alipay.updateOrderState(orderData,function(error,results,fields){
                if(results.affectedRows==1){
                   console.log("订单状态更改成功")
                }
            })
        }

        
    }

     /**
     * 获取支付宝的签名
     * @param payParams
     */
    this.getSign = function(signParams){
        var crypto=require('crypto');
        var signer=crypto.createSign('RSA-SHA256')
       //去除无效参数，排序并生成待签名字符串
        var preStr='';
        var keySet=[];
        for(var key of Object.keys(signParams).sort()){
            if(!signParams[key] || key=='sign'){
                continue;
            }
            keySet.push(key);
        }
        for(var i=0; i<keySet.length; i++){
            var key=keySet[i];
            var value = signParams[key];
            if(i==keySet.length-1){
                preStr = preStr + key + '=' + value + '';
            }else{
                preStr = preStr + key + '=' + value + '&';
            }
        }      
        if(appConf('alipay.sign_type') == 'RSA'){
            signer=crypto.createSign('RSA-SHA1');
        }
        console.log("preStr",preStr)
        signer.update(preStr);
        var sign=signer.sign(appConf('alipay.privateKey'), 'base64');
        return sign;
    }
   
     /**
    * 生成订单号
    */
   this.getId = function(pre){
        let date = new Date();
        return pre + '' + date.getFullYear()+(date.getMonth()+1)+date.getDay()+date.getTime()+(Math.floor(Math.random()*10000)+10000);
    }

    /***
     * 获取当前时间
     * 格式“yyyy-MM-dd HH:MM:SS”
     */
    this.getNowFormatDate = function () {
        var date = new Date();
        var seperator1 = "-";
        var seperator2 = ":";
        var month = date.getMonth() + 1;
        var strDate = date.getDate();
        var hours = date.getHours();
        var minutes = date.getMinutes();
        var seconds =date.getSeconds();
        if (month >= 1 && month <= 9) {
            month = "0" + month;
        }
        if (strDate >= 0 && strDate <= 9) {
            strDate = "0" + strDate;
        }
        if (hours >= 0 && hours <= 9) {
            hours = "0" + hours;
        }
        if (minutes >= 0 && minutes <= 9) {
            minutes = "0" + minutes;
        }
        if (seconds >= 0 && seconds <= 9) {
            seconds = "0" + seconds;
        }

        var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate
                + " " + hours + seperator2 + minutes
                + seperator2 + seconds;
        return currentdate;
    }

}
module.exports = alipayControler
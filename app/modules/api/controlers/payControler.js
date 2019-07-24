function payControler(){
    this.wxnotify = function(){
        let _key = "b3d0782ed9882fad5b374bcd4b603dfb";
        function raw1(args) {
            let keys = Object.keys(args);
            keys = keys.sort()
            let newArgs = {};
            keys.forEach(function (key) {
                if(key!='sign'){
                    newArgs[key] = args[key];
                }
            });
            let string = '';
            for (let k in newArgs) {
                if(typeof newArgs[k] === 'function') continue;
                string += '&' + k + '=' + newArgs[k];
            }
            string = string.substr(1);
            console.log(string)
            return string;
        };
        let obj = this.req.body.xml;
        console.log("==========wxnotify======")
        console.log(JSON.stringify(this.req.body))
        if(obj!=undefined){
            console.log(JSON.stringify(obj))
            let str = raw1(obj);
            str = str + '&key='+_key;
            let cypt = require('crypto');
            let ss=cypt.createHash('md5').update(str,'utf8').digest('hex').toUpperCase();
            console.log(ss)
            console.log(obj.sign)
            if(ss==obj.sign){
                let pay = this.service('pay');
                pay.wxnotify(obj,function(rs){
                    if(rs){
                        return '<xml><return_code><![CDATA[SUCCESS]]></return_code><return_msg><![CDATA[OK]]></return_msg></xml>';
                    }
                });
            }
        }
    }
    this.alinotify = function(){
        let jsn = this.req.body
        let sgn=jsn.body;
        let vf=this.decode(sgn);
        let oid=jsn.out_trade_no;
        let cash=jsn.total_amount;
        let cypt = require('crypto');
        let vv=cypt.createHash('md5').update(oid+cash,'utf8').digest('hex') ;
        //let vv = cypt.md5(oid+cash);
        console.log(JSON.stringify(jsn))
        console.log("============================================")
        console.log(vf)
        console.log(vv)
        console.log("============================================")
        if(vv==vf){
            let pay = this.service('pay');
            pay.alinotify(jsn,function(rs){
                
            });
        }
    }
    this.decode=function(str){
        if(str==''||str==null||str==undefined){
            return str+'';
        }
        let a=str.substr(0,1);
        let n=a*1;
        let d=0;
        if(n<5){
            d=5;
        }
        let rtn = "";
        let src=str.substr(1);
        let bb=n+d;
        while(src!=''){
            rtn += src.substr(0,bb);
            src=src.substr(bb+1);
        }
        return rtn;
    }
}
module.exports=payControler;
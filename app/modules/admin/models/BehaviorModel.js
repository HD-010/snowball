function BehaviorModel() {
    /**
     * 定义执行请求操作前执行的操作名称
     * 规则：
        {
            '*'              : ['func1',func2','...'],   //所有路由的请求，都在执行请求的操作前执行数组中的方法组
            '/dome/site/home': ['func1',func2','...'],   //指定符合该路由的请求时，在执行请求的操作前执行数组中的方法组
        }
     */
    this.ruler = {
        //'*'              : ['checkSignature'],     //所有路由的请求，都在执行请求的操作前执行数组中的方法组
    }


    /**
     * 成员方法的定义要求：
     * 回调函数的参数是一个对象，这个对象包含了该方法执行的状态信息。
     * 如果操作执行失败，则对象如：
        {
            error  : 1,
            message: "执行失败的描述",
        }
        如果操作执行成功，则对象如：
        {
            error  : 0,
            message: "执行成功的描述(通常不需要)",
        }
     */
    /**
     * 测试调用是否成功
     */
    this.func1 = function(data,callback){
        callback({
            error  : 0,
            message: '数据校验错误',
        });
    }

    /**
     * 验证签名
     */
    this.validSignature = function(){
        var data = {error:1};
        var openID = this.POST('openID');
        var openIDObj = parseOpenID(openID);
        var uid = parseInt(openIDOb.uid);
        var userInfor = this.model("passport:DataProcess").getUserInfo(uid);
        var signature = createSignature(this.req,userInfor);
        data.error = (signature === openIDObj.sg) ? 0 : 1;
        
        return callback(data);
    }

   

    
}

module.exports = BehaviorModel;
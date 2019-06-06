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
        '/admin/*'              : ['validSignature'],     //所有路由的请求，都在执行请求的操作前执行数组中的方法组
    }

    /**
     * 定义操作下不需要预执行的路由
     */
    this.notMatch = {
        validSignature: ['/admin/sign/_in','/admin/sign/_up','/admin/index/index','/err404'],
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
     * 用户登录后请求的数据需要验证签名,签名存储在redis，以uid为参考
     */
    this.validSignature = function(data, callback){
        var data = {error:0};
        var router = this.app.router.string;
        if(this.notMatch.validSignature.indexOf(router) != -1 ) return callback(data);
        var openID = this.POST('oid') || this.GET('oid') || "";
        if(!openID) return callback({error:1,uri:"/err404",message:"openID不存在"});
        if(typeof openID == 'object') openID = openID[0];
        var openIDObj = parseOpenID(openID);
        var uid = parseInt(openIDObj.id);
        
        var userInfor = this.model("passport:DataProcess").getUserInfo(uid);
        var signature = createSignature(this.req,userInfor[0]);
        if(!signature) return callback({error:1,uri:"/err404",message:"生成签名失败"});
        data = (signature === openIDObj.sg) ? {error:0}: {error:1, uri:"/err404"};
        return callback(data);
    }
}

module.exports = BehaviorModel;
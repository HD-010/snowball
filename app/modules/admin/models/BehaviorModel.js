function BehaviorModel() {
    var uid;
    /**
     * 定义执行请求操作前执行的操作名称
     * 规则：
        {
            '*'              : ['func1',func2','...'],   //所有路由的请求，都在执行请求的操作前执行数组中的方法组
            '/dome/site/home': ['func1',func2','...'],   //指定符合该路由的请求时，在执行请求的操作前执行数组中的方法组
        }
     */
    this.ruler = {
        '/admin/*'              : ['validSignature','validPermit'],     //所有路由的请求，都在执行请求的操作前执行数组中的方法组
    }

    /**
     * 定义操作下不需要预执行的路由
     */
    this.notMatch = {
        validSignature: [
            '/admin/sign/_in',
            '/admin/sign/_up',
            '/admin/sign/_check',
            '/admin/sign/_exit',
            '/admin/index/index',
            '/err404'
        ],
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
        log("-----------------------oid--------------------------");
        log("openID:",openID);
        log("POST:",this.POST());
        log("GET:",this.GET());
        log("query:",this.req.query);
        log("body:",this.req.body);
        log("-----------------------oid--------------------------");

        if(!openID) return callback({error:1,uri:"/admin/sign/_check",message:"openID不存在"});
        var openIDObj = parseOpenID(openID);
        uid = parseInt(openIDObj.id);
        var userInfor = this.model("passport:DataProcess").getUserInfo(uid)[0];
        if(!userInfor) return callback({error:1,uri:"/admin/sign/_check",message:'用户信息不存在'});
        var signature = createSignature(this.req,userInfor);
        if(!signature) return callback({error:1,uri:"/err404",message:"生成签名失败"});
        data = (signature === openIDObj.sg) ? {error:0}: {error:1, uri:"/err404"};
        
        return callback(data);
    }

    /**
     * 用户权限验证
     * 根据用户id获取用户权限列表
     */
    this.validPermit = function(data, callback){
        var that = this;
        var data = {error:0};
        var router = this.app.router.string;
        var redis = that.DB("Redis");
        var process = this.model("DataProcess");
        var permit = process.getUserInfo('PERMIT',uid);
        if(!permit) return callback({error:0,uri:"/admin/sign/_check",message:'权限调取失败，'});
        //向缓存获取所有菜单列表
        redis.get('MENU',function(error,res){
            if(error || !res || !(res.constructor.name == 'Array')){
                //向数据库获取所有菜单列表
                that.model('Menu').lists({tid: -1},(res)=>{
                    if(!res.length) return callback(data);
                    redis.set('MENU',res,function(err){
                        if(err) return callback({error:1,message:'MENU缓存失败'});
                        //检查访问权权限
                        //当前路由对应的id
                        return callback(check(res));
                    });
                });
            }else{
                //检查访问权权限
                return callback(check(res));
            }
        });

        function check(res){
            //将用户id暂存session
            process.setUserInfo(uid,'UID');
            //查找当前路由对应的菜单对象
            var menu = array2value(res,'url',router);
            //当前路由不在菜单列表
            if(!menu) return data;
            //当前路由在菜单列表,但免权限验证
            //log("=========menu.valid==========",menu.valid)
            if(menu.valid === '0') return data;
            var pagePermit = array2value(permit.permit,'url',router);
            //设置页面权限()
            process.setUserInfo(pagePermit,'PPER',uid);
            //log("=========pagePermit==========",pagePermit)
            //当前路由在菜单列表,验证权限通过
            if(pagePermit.enable === '1') return data;
            return {error: 1, message: '权限不足',uri:"/err404"};
        }
    }
}

module.exports = BehaviorModel;
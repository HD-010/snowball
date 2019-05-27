function BehaviorModel() {
    /**
     * 定义执行请求操作前执行的操作名称
     * 规则：
        {
            '*'              : ['func1',func2','...'],   //所有路由的请求，都在执行请求的操作前执行数组中的方法组
            '/dome/site/home': ['func1',func2','...'],   //指定符合该路由的请求时，在执行请求的操作前执行数组中的方法组
        }
        注意规则列表的先后顺序
     */
    this.ruler = {
        //'/h5/shop/parse' : ['modelsInfo'],     //所有路由的请求，都在执行请求的操作前执行数组中的方法组
        //'/h5/shop/*' : ['templateExists'],
        //'/h5/shop/*' : ['validUser'],
        //'/dome/site/home': ['showApp','func9'],   //指定符合该路由的请求时，在执行请求的操作前执行数组中的方法组
    }

    /**
     * 定义操作下不需要预执行的路由
     */
    this.notMatch = {
        modelsInfo: ['/h5/shop/uri','/err404'],
        templateExists: ['/h5/shop/uri','/h5/shop/parse','/h5/err/_404'],
        validUser: [
            '/h5/shop/reg',
            '/h5/shop/regg',
            '/h5/shop/login',
            '/h5/shop/home',
            '/h5/shop/parse',
            '/h5/shop/uri',
            '/h5/shop/shopList',
        ],
    }

    /**
     * 验证用户登录，如果没有登录，则跳转到登录页面
     */
    this.validUser = function(data, callback){
        let process = this.model('DataProcess');
        let router = this.app.router.string;
        
        if(this.notMatch.validUser.indexOf(router) !== -1 ) {
            callback({ error: 0 });
            return;
        }else
        if(!process.isSign()){
            callback({ 
                error: 1, 
                message: '错误：用表没有登录便访问：' + router, 
                uri: '/h5/shop/login'
            });
            return;
        }else{
            callback({ error: 0 });
            return ;

        }
    }

    /**
     * 成员方法的定义要求：
     * 回调函数的参数是一个对象，这个对象包含了该方法执行的姿态信息。
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
     * 设置商户模板信息
     */
    this.modelsInfo = function(data, callback){
        console.log('==========Behavior执行顺序：=========',1);
        let self = this;
        let process = this.model('DataProcess');
        let router = this.app.router.string;
        if(this.notMatch.modelsInfo.indexOf(router) !== -1 ) {
            callback({ error: 0 });
            return;
        }
        if(this.GET('rid')){
            self.model('Uri').parse({},(error,results,fields)=>{
                if(error || !results.length) {
                    console.log('==========Behavior执行错误：=========','e0001');
                    callback({ error: 1, message: '错误：没有模板数据', uri: '/h5/err/_404' });
                    return;
                }
                
                let uri = results[0].uri;
                let params = {
                    tpn : process.getQueryString(uri,'tpn'),
                    sid : process.getQueryString(uri,'sid'),
                }
                self.model('Template').models(params,(error,results,fields)=>{
                    if(error) {
                        console.log('==========Behavior执行错误：=========','e0002');
                        callback({ error: 1, message: '错误：没有模板数据', uri: '/h5/err/_404' });
                        return;
                    }
                    //设置用户模板信息
                    process.setUserInfo(JSON.parse(results[0].models),"TP");
                    callback({ error: 0});
                    return;
                });
            });
        }else{
            console.log('==========Behavior执行错误：=========','e0003');
            callback({ error: 1, message: '错误：没有模板数据', uri: '/h5/err/_404' });
        }
    }

    /**
     * 判断商家模板是否存在，如果不存在则跳转到404页面
     */
    this.templateExists = function(data, callback){
        console.log('==========执行顺序：=========',2);
        let router = this.app.router.string;
        if(this.notMatch.modelsInfo.indexOf(router) !== -1) {
            callback({ error: 0 });
            return;
        }

        viewModels = this.model('Template').pageModel();
        if(!viewModels) {
            callback({ error: 1, message: '错误：没有模板数据', uri: '/h5/err/_404' });
            return;
        }
        callback({ error: 0});
    }

    /**
     * 开发环境使用的调试模板加载特定方法
     */
    this.devLoadModel = function(data, callback){
        let self = this;
        let process = this.model('DataProcess');
        self.model('Uri').parse({rid:1},(error,results,fields)=>{
            let uri = results[0].uri;
            let params = {
                tpn : process.getQueryString(uri,'tpn'),
                sid : process.getQueryString(uri,'sid'),
            }
            self.model('Template').models(params,(error,results,fields)=>{
                if(error) {
                    console.log('==========Behavior执行错误：=========','e0002');
                    callback({ error: 1, message: '错误：没有模板数据', uri: '/h5/err/_404' });
                    return;
                }
                //设置用户模板信息
                process.setUserInfo(JSON.parse(results[0].models),"TP");
                callback({ error: 0});
                return;
            });
        });
        
    }
}

module.exports = BehaviorModel;

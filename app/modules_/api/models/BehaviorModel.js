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
    
    let h5_shop = [];
    h5_shop.push('validUser');

    this.ruler = {
        '/api/*' : ['frequentReq'],     //所有路由的请求，都在执行请求的操作前执行数组中的方法组
        '/api/user/addaddress':['parseTemplate'],
        '/api/user/address':['parseTemplate'],
        '/api/user/addressbyid':['parseTemplate'],
        '/api/user/uptadeaddress':['parseTemplate'],
        '/api/user/deladdress':['parseTemplate'],
    }
    

    /**
     * 定义操作下不需要预执行的路由
     */
    this.notMatch = {
        parseTemplate: ['/pc/err/_404','/m/err/_404'],
    }

    /**
     * 解决同一ip频繁请求一接口问题
     * 方案：同一1p 同一接口调间隔时间为2秒
     */
    this.frequentReq = function(params, callback){
        
        let that = this;
        if(this.req.method=="GET"){
             that.req.res.send({error:'非法接口请求'});
             that.req.res.end();
             return;
        }
        
        let rou = this.req.ip+this.req.url
       this.DB('Redis').get(rou,function(err,data){
            if(data){
                if((Date.parse(new Date())/1000-data) > 2 ){
                    that.DB('Redis').set(rou,Date.parse(new Date())/1000);
                    callback({error:0})
                }else{                   
                    //暂停两秒后在给数据
                    setTimeout(function(){
                        callback({error:0})
                    },2000);
                  
                }
            }else{//没有当前缓存数据 存入缓存
                that.DB('Redis').set(rou,Date.parse(new Date())/1000);
                callback({error:0})
            }
       })
       
    }
    /**
     * 解析店铺
     * 访问地址如：http://127.0.0.1:3005/h5/shop/parse?rid=2
     * 
     */
    this.parseTemplate = function(params, callback){
        let that = this;
        let userid = this.POST("userid");
        if(!userid) return that.req.res.send({errorcode:1,msg:"userid"});
        if(isNaN(userid)) return that.req.res.send({errorcode:1,msg:"userid非法"});
        //验证api接口token的合法性
        let token  = this.POST("token");
        if(!token) return that.req.res.send({errorcode:1,msg:"token"});
        //依据用户id到redis取出token与当前参数带来的token做一次合法校验
        this.DB("Redis").get(userid+"_user",function(error,data){
            if(!data) return that.req.res.send({errorcode:1,msg:"登录已过期或未登录"});
            if(token == data) return  callback({error:0});            
            return that.req.res.send({errorcode:1,msg:"登录已过期或未登录"}); 
        })  
    }
}

module.exports = BehaviorModel;

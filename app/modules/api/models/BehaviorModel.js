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
        '/api/*' : ['frequentReq','parseTemplate'],     //所有路由的请求，都在执行请求的操作前执行数组中的方法组
        
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
        console.log("===============POST参数",this.POST());
        callback({error:0})
        // var that = this;
        // var process, template,currTime;
        // var templateId = 1;
        // var data = {
        //     error: 1,
        //     uri: '/pc/err/_404'
        // }
        // let router = this.app.router.string;
        // if(this.notMatch.parseTemplate.indexOf(router) !== -1 )  return callback({ error: 0 });

        // //获取用户当前使用的模板
        // //如果用户没有自己的模板，则使用系统默认的模板(id为1)
        // //将模板信息保存到缓存，供后继使用
        // process = this.model('DataProcess');
        // template = this.model("Template");

        // //如果用户模板信息已有，则校验成功
        // if(process.getUserInfo('TP_' + that.GET('us',{default:1}),true)) return callback({error: 0});
        // //如果用户模板信息没有，则查询以校验
        // template.userTemplate({},function(error,results,fields){
        //     if(error) return callback(data);
        //     process.setUserInfo(that.GET('us',{default:1}), 'TPU');
        //     process.setUserInfo(results,'TP_' + that.GET('us', {default:1}), true);
        //     return callback({error: 0});
        // });
    }

}

module.exports = BehaviorModel;

function TemplateModel(){
    /**
     * 获取用户当前使用的模板
     */
    this.userTemplate = function(params,callback){
        params = params || {};
        var struct = {
            where  : [],
            groupBy: [],
            orderBy: [],
            limit  : [0,1]
        };

        //添加查询条件(如果用户没有自己的模板，则使用系统默认的模板(id为1,系统模板与超级管理员设定的模板一致))
        struct.where.push(" tu.userId =" + this.GET('us',{default:1}), 
            " tu.enable = '1' ",
            " tu.isdel = '0' ", 
            " tu.effectiveTime < NOW() ",
            " tu.expirationTime > NOW() ", 
            " t.enable = '1' ", 
            " t.isdel = '0' "); 


        //初始化构造查询对象
        var sqlStruct = this.SqlStruct(struct);
        
        //调用服务类进行查询
        var tp = this.service('Template');
        tp.userTemplate(sqlStruct,function(error,results,fields){
            callback(error,results,fields);
        });
    }

    /**
     * 查询用户模板下的模块配置
      params{
        tpn:number,
        sid:number
      }
     */
    this.models = function(params,callback){
        params = params || {};
        var struct = {
            where  : [],
            groupBy: [],
            orderBy: [],
            limit  : [0,1]
        };

        //添加查询条件
        if(params.tpn) struct.where.push(" id =" + params.tpn); 

        //初始化构造查询对象
        var sqlStruct = this.SqlStruct(struct);
        
        //调用服务类进行查询
        var tp = this.service('Template');
        tp.models(sqlStruct,function(error,results,fields){
            callback(error,results,fields);
        });
    }

    /**
     * 获取一个页面的模块配置
     */
    this.pageModel = function(){
        var process = this.model('DataProcess');
        var router = this.router() || ('/' + appConf('params.defaultRouter').join('/'));
        var model = router.replace(/\//g,'_');
        var fs =require('fs');
        // var modelPaths = JSON.parse(process.getUseInfo('TP'))[model];
        //模板所属的用户id
        var templateUserId = process.getUserInfo('TPU'); 
        var modelInfos = process.getUserInfo('TP_' + templateUserId, true);
        if(modelInfos && modelInfos[0]) {
            modelInfos = JSON.parse(modelInfos[0]['tModels']);
            var modelPaths = modelInfos[model];
            var style =  modelInfos['style'];
            var theme =  modelInfos['theme'];
        }
        
        if(modelPaths){
            for(var i = 0; i < modelPaths.length;  i ++){
                var path = this.viewDir()+ 'widgets/' + modelPaths[i] + '.html';
                if(!fs.existsSync(path)) {
                    console.log("当前模块不存在：",modelPaths[i]);
                    delete modelPaths[i];
                }
            }
        }
        
        return {
            models: modelPaths || '/snow/err/_404',
            style: style || "",
            theme: theme || {},
        }
    }
}

module.exports = TemplateModel;
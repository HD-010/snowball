function TemplateService(){
    
    /**
     * 获取用户的模板
     */
    this.userTemplate = function(sqlStruct,callback){
        var sql = `select tu.effectiveTime as permitEffectiveTime,tu.expirationTime as permitExpirationTime,
        t.id tId,t.name tName, t.industry as tIndustry, t.models as tModels,t.icon as tIcon 
        from youbang_sys_template_users as tu 
        left join youbang_sys_template as t 
        on t.id = tu.templateId` +
        sqlStruct.where() + 
        sqlStruct.limit();
        
        this.DB().log().select(sql,function(error,results,fields){
            callback(error,results,fields);
        });
    }

    
    this.models = function(sqlStruct,callback){
        var sql = 'select * from youbang_sys__template ' +
        sqlStruct.where() + 
        sqlStruct.limit();
        
        //console.log(sql);
        this.DB().select(sql,function(error,results,fields){
            callback(error,results,fields);
        });
    }
}

module.exports=TemplateService;
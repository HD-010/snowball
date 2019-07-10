function ComponentModel(){
    /**
     * 查询youbang_components，获取组件列表,获取获取组件字段信息
     */
    this.list = function(params,callback){
        //使用案例：实例化TestService并调用showApp()方法
        var conditions = {
            table:['youbang_components'],
            where:[],
            limit:[]
        }
        if(params.limit) conditions.limit.push(params.limit);
        if(params.id) conditions.where.push("id=" + params.id);
        if(params.ctag) conditions.where.push("nid='" + params.ctag + "'");
        
        this.DB().get(conditions,function(error,results,fields){
            var data = {};
            data.error = error ? 1 : 0;
            data.uri = "";
            data.results = recodeJsonParse(results,'fieldset');
            return callback(data);
        });
    }

}

module.exports = ComponentModel;
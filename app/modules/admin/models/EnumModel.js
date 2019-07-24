function EnumModel(){
    var that = this;

    /**
     * 枚举数据列表
     */
    this.list = function(params, callback){
        var data = {erro: 1,message: 'query enum params error!'}
        if(!params.enumtag) return callback(data);

        var conditions = {
            table: ['youbang_enum'],
            where: []
        }
        conditions.where.push('enumtag="' + params.enumtag + '"');
        
        this.DB().get(conditions,function(error,results){
            callback({
                error: error ? 1 : 0,
                enumtag: results,
                enumtagVal: queryresultKeyValue(results, 'value'),
                enumtagName: queryresultKeyValue(results, 'name')
            });
        });
    }

    /**
     * 枚举数据分类标识
     */
    this.tag = function(params, callback){
        var conditions = {
            table: ['youbang_enum'],
            fields: ['distinct enumtag']
        }

        this.DB().get(conditions,function(error,results){
            callback({
                error: error ? 1 : 0,
                enumtag: results
            });
        });
    }
}

module.exports = EnumModel;
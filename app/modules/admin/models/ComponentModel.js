function ComponentModel(){
    //获取组件列表
    this.list = function(params,callback){
        var data = {};
        var conditions = {
            table : ['youbang_components'],
            fields : ['*'],
            where: [],
            limit: []
        };

        if(params.limit) conditions.limit.push(params.limit);
        if(params.id) conditions.where.push("id=" + params.id);

        this.DB().get(conditions,function(error,res){
            data.error = error ? 1 : 0;
            data.data = res;
            return callback(data);
        });
    }
}

module.exports = ComponentModel;
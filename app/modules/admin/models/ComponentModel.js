function ComponentModel(){
    //获取组件列表
    this.list = function(params,callback){
        var data = {};
        var conditions = {
            table : ['youbang_components'],
            fields : ['*']
        };

        this.DB().log().get(conditions,function(error,res){
            data.error = error ? 1 : 0;
            data.data = res;
            return callback(data);
        });
    }
}

module.exports = ComponentModel;
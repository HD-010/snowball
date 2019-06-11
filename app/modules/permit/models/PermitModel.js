function PermitModel(){
    var that = this;

    /**
     * 获取指定用户id的权限
     */
    this.power = function(params,callback){
        var data = {error: 0};
        var condition = {
            table:["youbang_sys_permit"],             //查询的表名
            fields:['*'],           //被查询的字段名称（别名在此指定）
            where:[],               //查询条件
            orderBy:[]
        };
        condition.where.push(params.tagName + '=' + params.tagVal);
        condition.where.push("enable='1' adn show='1'");

        this.DB().get(condition,function(error,results){
            if(results.length === 0) data.error = -1;       //查询结果为空
            data.data = results;
            return callback(data);
        });
    }

    /**
     * 查询用户属组
     */
    this.group = function(params,callback){
        var data = {error: 0};
        var condition = {
            table:["youbang_sys_acount"],                                 //查询的表名
            fields:['pid'],             //被查询的字段名称（别名在此指定）
            where:[],                   //查询条件
        };
        condition.where.push("id=" + params.id);
        condition.where.push("enable='1' adn show='1'");

        this.DB().get(condition,function(error,results){
            if(error) data.error = 1;
            data.data = results;
            return callback(data);
        });
    }
}


module.exports = PermitModel;
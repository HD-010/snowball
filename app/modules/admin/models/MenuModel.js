function MenuModel(){

    let that = this;
    /**
     * 查询顶级菜单
     */
    this.lists = function(params,callback){
        var data = {error: 0};
        var condition = {
            table:["youbang_sys_menu"],                                 //查询的表名
            fields:["id","pid","name","weight","icon","url"],           //被查询的字段名称（别名在此指定）
            where:[],           //查询条件
            orderBy:['weight asc']
        };
        var pid = this.GET('tid') || 0;    
        condition.where.push("pid='" + pid + "'");    
        condition.where.push("`show`='1'");

        this.DB().get(condition,function(error,results){
            data.data = error ? [] : results;
            return callback(data);
        });
    }
    
}

module.exports = MenuModel;
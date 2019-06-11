function MenuModel(){

    var that = this;
    /**
     * 查询顶级菜单
     */
    this.lists = function(params,callback){
        var data = {error: 0};
        var uid = this.GET('uid') || this.POST('uid') || '';
        var pid = this.GET('tid') || 0;  
        var condition = {
            table:["youbang_sys_menu"],                                 //查询的表名
            fields:["id","pid","name","weight","icon","url"],           //被查询的字段名称（别名在此指定）
            where:[],           //查询条件
            orderBy:['pid asc',' weight asc']
        };
        (pid > 0) ? condition.where.push("pid='" + pid + "' or (pid in (select id from youbang_sys_menu where pid = '" + pid + "'))") :
        condition.where.push("pid='" + pid + "'");
        condition.where.push("`show`='1'");
        var process = this.model("DataProcess");
        this.DB().get(condition,function(error,results){
            //过滤禁止访问的菜单
            if(!error){
                var permit = process.getUserInfo("PERMIT",parseInt(uid)).permit; 
                for(var i in results){
                    if(array2value(permit,'menuId',results[i].id) === '') delete results[i];
                }
            }
            data.data = error ? [] : process.structMenu(results);
            return callback(data);
        });
    }
    
}

module.exports = MenuModel;
function permitModel(){

    var that = this;
    /**
     * 查询当前管理组所具有的权限
     * 条件 根据管理组id查询
     * 表名 youbang_sys_permit
     * 所取字段 id,userId,groupId,menuId,add,delete,edit,show
     * 必要条件 enable = 1
     */
    that.listPermits = function(params,callback){
        var id = that.GET('id') || that.POST('id') || '';
        var condition = {
            table:["youbang_sys_permit as p"],                                 //查询的表名
            fields:["p.id","p.`userId`","m.`name`","p.`menuId`","p.`add`","p.`delete`",'p.`edit`','p.`show`'],           //被查询的字段名称（别名在此指定）
            where:[],           //查询条件
            orderBy:['id asc'],
            joinOn:" LEFT JOIN youbang_sys_menu as m ON m.id = p.menuId "
        };

        //判断管理组id 
        if(id){ 
            condition.where.push("groupId ="+id);
            condition.where.push("enable = '1'");
            that.DB().log().get(condition,function(error,results){
                if(results) callback(results)
            });
        }       
    }
}

module.exports = permitModel;
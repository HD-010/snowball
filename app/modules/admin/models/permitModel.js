function permitModel(){

    var that = this;
    /**
     * 根据ID查询当前管理组所具有的权限
     * 条件 根据管理组id查询
     * 表名 youbang_sys_permit
     * 所取字段 id,userId,groupId,menuId,add,delete,edit,show
     * 必要条件 enable = 1
     */
    that.listPermits = function(params,callback){
        var data = {error: 0};
        var id = that.GET('id') || that.POST('id') || '';
        data.name = that.GET('name') || that.POST('name') || '';//获取管理组名称
        data.id = id;
        var condition = {
            table:["youbang_sys_permit as p"],                                 //查询的表名
            fields:["p.id as permitId","p.groupId","p.`userId`","m.`pid`","m.id","m.`name`","p.`menuId`","p.`add`","p.`delete`",'p.`edit`','p.`show`'],           //被查询的字段名称（别名在此指定）
            where:[],           //查询条件
            orderBy:['id asc'],
            joinOn:" LEFT JOIN youbang_sys_menu as m ON m.id = p.menuId "
        };

        var dataProcess = that.model('DataProcess'); 

        that.loginUserPermit(function(res){
            data.loginUserPermit = dataProcess.structMenu(res);
                if(id){ 
                    condition.where.push("groupId ="+id);
                    condition.where.push("enable = '1'");
                    that.DB().get(condition,function(error,results){
                        data.listPermits = results;
                        if(results) callback(data)
                    });
                }       
        })
           
       
       

       
    }

    /**
     * 获取当前登录用户有那些权限查单
     * 条件 根据用户id去查询有那些权限
     * 所取字段：id,userId,m.name,menuId,add,delete,edit,show
     */
    that.loginUserPermit = function(callback){
        //获取当前用户id
        var process =  that.model("DataProcess");
        var uid = process.getUserInfo('UID');        
        var condition = {
            table:["youbang_sys_permit as p"],                                 //查询的表名
            fields:["p.id as permitId","p.`userId`","p.groupId","m.id","m.`name`","m.pid","p.`menuId`","p.`add`","p.`delete`",'p.`edit`','p.`show`'],           //被查询的字段名称（别名在此指定）
            where:[],           //查询条件
            orderBy:['id asc'],
            joinOn:" LEFT JOIN youbang_sys_menu as m ON m.id = p.menuId "
        };

        //判断管理组id 
        if(uid){ 
            condition.where.push("userId ="+uid);
            condition.where.push("enable = '1'");
            that.DB().get(condition,function(error,results){
                //console.log("========================123",results);
                if(results) callback(results);
            });
        }       
    }

}

module.exports = permitModel;
function permitModel(){

    var that = this;
    /**
     列表
     */
    that.lists = function(params,callback){
        var data = {error: 0}; 
        var condition = {
            table:["youbang_sys_acount_group"],                                 //查询的表名
            fields:["id","pid","groupName","type","status","deleted",'addTime'],           //被查询的字段名称（别名在此指定）
            where:[],           //查询条件
            orderBy:['id asc']
        };
        // if(pid > 0) condition.where.push("pid=" + pid + " or (pid in (select id from youbang_sys_menu where pid = " + pid + "))");
        // if(pid === 0) condition.where.push("pid=" + pid );
        // if(pid != -1) condition.where.push("`show`='1'");

       // var process = this.model("DataProcess");
       that.DB().get(condition,function(error,results){
          if(results) callback(results)
        });
    }

    /**
     * 修改列表
     */
    that.updateGlist = function(params,callback){
        var data = {error: 0}; 
        //var id = that.GET(id);
        var id = that.GET('id');
        var condition = {
            table:["youbang_sys_acount_group"],                                 //查询的表名
            fields:["id","pid","groupName","type","status","deleted",'addTime'],           //被查询的字段名称（别名在此指定）
            where:[],           //查询条件
            orderBy:[]
        };
        // if(pid > 0) condition.where.push("pid=" + pid + " or (pid in (select id from youbang_sys_menu where pid = " + pid + "))");
         if(id) condition.where.push("id=" + id );
        // if(pid != -1) condition.where.push("`show`='1'");

       // var process = this.model("DataProcess");
       that.DB().get(condition,function(error,results){
          if(results) callback(results)
        });
    }
    
}

module.exports = permitModel;
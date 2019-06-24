function GroupModel(){
    var that = this;

    /**
     * 查询当前用户所有管理组信息
     * 表名 youbang_sys_acount_group
     * 查询字段 id,pid,groupName,type,status,addTime
     * 条件,传管理组id为查询单条信息，不传查询所有列表信息
     * 必要条件 deleted 是否可用(用户是否被删除) 0 可用,1 已删除
     * 回调 callback(results)
     */
    that.getGroup = function(params,callback){
        var data={};
        //获取当前用户
        var process =  that.model("DataProcess");
        var uid = process.getUserInfo('UID');        
        data.userInfo =process.getUserInfo(uid)[0];
        console.log("userinfo",data.userInfo)

        var id = that.GET('id') || that.POST('id') || '';//获取管理组ID
        var condition = {
            table:["youbang_sys_acount_group"],                                 //查询的表名
            fields:["id","pid","groupName","type","status",'addTime'],           //被查询的字段名称（别名在此指定）
            where:[],           //查询条件
            orderBy:['id asc']
        };
       
        if(id) condition.where.push("id=" + id );
        if(data.userInfo) condition.where.push(' pid= '+data.userInfo.pid);
        condition.where.push("deleted = 0 ");//查询可用
        that.DB().get(condition,function(error,results){
            data.results = results;
          if(results) callback(data)
        });
    }

}
module.exports = GroupModel;
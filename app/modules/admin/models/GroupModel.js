function GroupModel(){
    var that = this;


      /**
     * 获取管理员的所有类型
     */
    that.getAcountTypeAll = function(callback){
        var list = {};
        var condition = {
            table:["youbang_sys_acount_type"],                                 //查询的表名
            fields:["id","typeName","alias"],           //被查询的字段名称（别名在此指定）
            where:[],           //查询条件
            orderBy:['id asc']
        };
        condition.where.push("enable = '1' ");//查询启用
        that.DB().get(condition,function(error,results){
            list.results = results;
            callback(list)    
        });
    }


    /**
     * 添加管理组信息
     * 
     */
    that.saveGroup = function(callback){
        var data = {};
        //获取当前登录用户ID
        var process =  that.model("DataProcess");
        data.pid = process.getUserInfo('UID');
       //获取插入信息
       data.status = this.POST('status');
       data.groupName = this.POST('groupName');
       data.type = this.POST('type');
       var condition = {
            table:["youbang_sys_acount_group"],                                 //查询的表名
            fields:[{
                "pid":data.pid,
                "groupName":data.groupName,
                "type":data.type,
                "status":data.status,
                "addTime":'NOW()',
            }],           //被查询的字段名称（别名在此指定）
         
        };
        that.DB().set(condition,function(error,results){
            if(results.insertId){
                var obj={
                    message:"管理组添加成功!",
                    uri:"/admin/group/groupList",
                    error:0
                }
                callback(obj)
            }
        })
    }

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

    /**
     * 查询当前登录用户下的用户组类型及子账号的用户组类型
     */
    that.getGroupAll = function(params,callback){
        var process =  that.model("DataProcess");
        var uid = process.getUserInfo('UID');        
        var sql = " select id,pid,groupName,type,`status`,addTime from youbang_sys_acount_group where pid in (select id from youbang_sys_acount where pid= "+uid+") or pid in ("+uid+") AND deleted = 0";
        that.DB().query(sql,function(error,results){
            if(results) callback(results);
        })
    }

    /**
     * 修改用户组信息
     */
    that.editGroup = function(callback){
        var data = {};
        data.id = this.GET('id');//得到要编辑的ID

        //获取类型
        var condition = {
            table:["youbang_sys_acount_type"],                                 //查询的表名
            fields:["id","typeName","alias"],           //被查询的字段名称（别名在此指定）
            where:[],           //查询条件
            orderBy:['id asc']
        };
        condition.where.push("enable = '1' ");//查询启用
        that.DB().get(condition,function(error,results){
            data.results = results;
              if(data.results){
                  var sql = "select id,pid,groupName,type,status,addTime from youbang_sys_acount_group where id ="+data.id;
                  that.DB().query(sql,function(error,res){
                    data.list= res;
                    callback(data);
                  })
              }
        });
      
    }

    /**
     * 编辑用户组信息
     * 条件 根据用户组ID值修改
     */
    that.updateGroup = function(callback){
        var data = {};        
        //获取修改信息
        data.id = this.POST('id');
        data.status = this.POST('status');
        data.groupName = this.POST('groupName');
        data.type = this.POST('type');
        if(data){
             //获取类型
            var condition = {
                table:["youbang_sys_acount_group"],            //查询的表名
                fields:[{
                    groupName:data.groupName,
                    type:data.type,
                    status:data.status,
                    addTime:'NOW()'
                }],           //更新的字段名称（别名在此指定）
                where:[],           //更新条件
              
            };
            condition.where.push(" id = "+data.id);
            that.DB().set(condition,function(error,results){            
                if(results.insertId){
                    var obj={
                        message:"管理组编辑成功!",
                        uri:"/admin/group/groupList",
                        error:0
                    }
                    callback(obj)                }
            })
        }
    }

    /**
     * 删除用户组信息
     * 条件 根据用户组ID 删除
     */
    that.delGroup = function(callback){
        var data = {};
        data.id = that.GET("id");
        if(data){
            var condition = {
                table:["youbang_sys_acount_group"],          //查询的表名
                where:[]          //更新条件              
            };
            condition.where.push(" id = "+data.id);
            that.DB().del(condition,function(error,results){
                if(results.affectedRows){
                    var obj={
                        message:"管理组删除成功!",
                        uri:"/admin/group/groupList",
                        error:0
                    }
                    callback(obj)                
                }
            })
        }

    }

}
module.exports = GroupModel;
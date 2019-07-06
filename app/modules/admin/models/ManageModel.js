//管理员查找类
function ManageModel(){
    var that = this;

    /**
     * 获取当前登录用户下的所创建的用户信息及他子类与子类下所创建的用户信息
     */
    that.getChildManage = function(callback){
        var data = {};
        //获取当前用户id
        var process =  that.model("DataProcess");
        var uid = process.getUserInfo('UID');
        if(uid){
            var sql = "select ac.*,g.groupName from youbang_sys_acount as ac LEFT JOIN youbang_sys_acount_group as g ON ac.groupId = g.id where ac.id in ( SELECT c.id FROM (SELECT	a.id,IF(	FIND_IN_SET( a.pid, @pids ) > 0,IF(	length( @pids ) - length( REPLACE ( @pids, a.pid, '' ) ) > 1,IF(	length( @pids ) - length( REPLACE ( @pids, a.id, '' ) ) > 1,	@pids,	@pids := concat( @pids, ',', a.id )	),@pids := concat( @pids, ',', a.id )	),	0 	) AS 'plist',IF( FIND_IN_SET( a.pid, @pids ) > 0, @pids, 0 ) AS ischild FROM	( SELECT r.id, r.pid FROM youbang_sys_acount r ) a,	( SELECT @pids := "+uid+" ) b	) c WHERE	c.ischild != 0)";
            that.DB().query(sql,function(error,results){
                if(results) callback(results)
            })
        }
    }
    
   /**
    * 保存添加的用户
    */
   that.saveManage = function(callback){
        var data = {};
        //获取当前登录用户ID
        var process =  that.model("DataProcess");
        data.pid = process.getUserInfo('UID');
        //获取插入信息    
       
        data.acount = this.POST('!acount');
        data.userName = this.POST('userName');
        data.password = this.POST('!password');
        data.groupId = this.POST('groupId');
        data.tel = this.POST('tel');
        var condition = {
            table:["youbang_sys_acount"],                                 //查询的表名
            fields:[{
                "pid":data.pid,
                "acount": data.acount,
                "userName":data.userName,
                "password":data.password,
                "groupId":data.groupId,
                "tel":data.tel,
                "addTime":'NOW()',
            }],           //被查询的字段名称（别名在此指定）
        
        };
        that.DB().set(condition,function(error,results){
            if(results.insertId){
                var obj={
                    message:"用户组组添加成功!",
                    uri:"/admin/manage/listManage",
                    error:0
                }
                callback(obj)
            }
        })
   }

   /**
    * 根据管理者ID删除管理者信息
    */
   that.delManage = function(callback){
        var data = {};
        data.id = that.GET("id");
        data.id = data.id.split("_");
        if(data){
           var sql  = "delete from youbang_sys_acount where id in ("+data.id+")"; 
            that.DB().log().query(sql,function(error,results){
                if(results.affectedRows){
                    var obj={
                        message:"管理者删除成功!",
                        uri:"/admin/manage/listManage",
                        error:0
                    }
                    callback(obj)                
                }
            })
        }
   }

   /**
    * 根据管理员ID编辑管理员信息
    */
   that.editManage = function(callback){
       var data = {};
        var Group = that.model("Group");
        Group.getGroup({},function(res){
            if(res.results.length){
                data.results = res.results;
                data.id = that.GET("pid");
                var sql = "select id,acount,userName,password,tel,groupId from youbang_sys_acount where id = "+data.id;
                that.DB().query(sql,function(error,results){
                    if(results) data.manageInfo = results;
                    callback(data)
                })
            }
        })
   }

   /**
    * 修改管理员信息
    */
   that.updateManage = function(callback){
       var data = {};
        data.id = this.POST('id');       
        data.userName = this.POST('userName');    
        data.groupId = this.POST('groupId');
        data.tel = this.POST('tel');
        if(data){
            var sql = "update youbang_sys_acount set userName = '"+data.userName+"',tel = "+data.tel+",groupId = "+data.groupId+" where id = "+data.id;          
            that.DB().log().query(sql,function(error,results){
                if(results.affectedRows){
                    var obj={
                        message:"用户修改加成功!",
                        uri:"/admin/manage/listManage",
                        error:0
                    }
                    callback(obj)
                }
            })
        }
   }

   /**
    * 重置管理员账户密码
    */
   that.resetPassword = function(callback){
       var data = {};
       data.id = this.GET('userId');
       this.CURL({
        uri:"http://127.0.0.1:3005/passport/manager/resetPassword?password=123456",
        callback:(error,source)=>{
          if(source.password.password){
            var sql = "update youbang_sys_acount set password = '"+source.password.password+"',addTime = '"+source.password.time+"' where id ="+data.id;
            that.DB().query(sql,function(error,results){
                if(results.affectedRows){
                    var obj={
                        message:"密码重置成功!",
                        uri:"",
                        error:0
                    }
                    callback(obj)
                }
            })
          }
        }
    });
   }
}
module.exports = ManageModel;
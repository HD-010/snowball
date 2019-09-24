/*
 * @Description: In User Settings Edit
 * @Author: your name
 * @Date: 2019-06-24 17:27:06
 * @LastEditTime: 2019-08-28 17:51:06
 * @LastEditors: Please set LastEditors
 */
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
		var sql = "select ac.*,g.groupName from #@sys_acount as ac LEFT JOIN #@sys_acount_group as g ON ac.groupId = g.id where ac.id in ( SELECT c.id FROM (SELECT	a.id,IF(	FIND_IN_SET( a.pid, @pids ) > 0,IF(	length( @pids ) - length( REPLACE ( @pids, a.pid, '' ) ) > 1,IF(	length( @pids ) - length( REPLACE ( @pids, a.id, '' ) ) > 1,	@pids,	@pids := concat( @pids, ',', a.id )	),@pids := concat( @pids, ',', a.id )	),	0 	) AS 'plist',IF( FIND_IN_SET( a.pid, @pids ) > 0, @pids, 0 ) AS ischild FROM	( SELECT r.id, r.pid FROM #@sys_acount r ) a,	( SELECT @pids := "+uid+" ) b	) c WHERE	c.ischild != 0)";
		that.DB().query(sql,function(error,results){
			if(error) results = [];
			return callback(results)
		})
    }
    
   /**
    * 保存添加的用户
    */
   that.saveManage = function(callback){
        var data = {};
        //获取当前登录用户ID
        var process =  that.model("DataProcess");
		var passProcess = this.model("passport:DataProcess");
        data.pid = process.getUserInfo('UID');
        //获取插入信息    
       
        data.acount = this.POST('!acount');
        data.userName = this.POST('userName');
        data.groupId = this.POST('groupId') || 2000;
        data.tel = this.POST('tel');
		var passOjb = passProcess.createPasswd();
        var condition = {
            table:["#@sys_acount"],                                 //查询的表名
            fields:[{
                "pid":data.pid,
                "acount": data.acount,
                "userName":data.userName,
                "password":passOjb.password,
                "groupId":data.groupId,
                "tel":data.tel,
				"acountType": "manager",
                "addTime":passOjb.time,
            }],           //被查询的字段名称（别名在此指定）
        
        };
        that.DB().set(condition,function(error,results){
            if(results.insertId){
                var obj={
                    message:"用户组组添加成功!",
                    //uri:"/admin/manage/listManage",
					insertId: results.insertId,
                    error:0
                }
                return callback(obj);
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
           var sql  = "delete from #@sys_acount where id in ("+data.id+")"; 
            that.DB().query(sql,function(error,results){
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
			data.results = res.results;
			data.id = that.GET("pid");
			var sql = "select id,acount,userName,acountType,password,tel,groupId from #@sys_acount where id = "+data.id;
			that.DB().query(sql,function(error,results){
				if(results) data.manageInfo = results;
				callback(data)
			})
        })
   }

   /**
    * 修改管理员主表信息
    */
   that.updateManage = function(callback){
       var data = {};
        data.id = this.POST('id');       
        data.userName = this.POST('userName');
		if(!data.id || !data.userName) return callback({
			error: 1,
			message: "修改失败，参数错误！"
		});
        data.groupId = this.POST('groupId');
        data.tel = this.POST('tel');
		var conditions = {
			table: "#@sys_acount",
			fields: [],
			where: []
		}
		var recode = {};
		if(data.userName) recode.userName = data.userName;
		if(data.tel) recode.tel = data.tel;
		if(data.groupId) recode.groupId = data.groupId;
		conditions.fields.push(recode);
		conditions.where.push("id=" + data.id);
		that.DB().set(conditions,function(error,results){
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
   /**
	* 保存帐户付加表信息
	*/
   that.saveAddon = function(params, callback){
	   var data = {error: 1};
	   var conditions = {
		   table: "#@sys_acount_" + params.atag,
		   fields:[],
		   where:[]
	   }
	   var effectiveTime = this.POST('effectiveTime') || 'NOW()';
	   var recode = {
		   nick: this.POST('userName') || "",
		   mobile: this.POST('mobile') || "",
		   effectiveTime: effectiveTime,
		   expirationTime: this.POST('expirationTime') || "DATE_SUB(" + effectiveTime + ", INTERVAL -1 YEAR)" ,
		   openid: this.POST('openid') || "",
		   sex: this.POST('sex') || "0",
		   realName: this.POST('realName') || "",
		   IDNumber: this.POST('IDNumber') || "",
	   }
	   if(params.insertId) recode.acountid = params.insertId;
	   var birthday = this.POST('birthday');
	   if(birthday) recode.birthday = birthday;
	   conditions.fields.push(recode);
	   if(params.acountid) conditions.where.push("acountid = " + params.acountid);
	   that.DB().set(conditions, function(error, res, fields){
		   data.error = error ? 1 : 0;
		   data.message = error ? "错误，保存失败！" : "恭喜您，保存成功！";
		   data.results = res;
		   return callback(data);
	   })
   }
   
   /**
	* 获取账户信息付加表数据
	* @param {Object} callback
	*/
   that.addonAcount = async function(params){
	   var conditions = {
		   table: ['#@sys_acount_'+ params.userInfo.acountType],
		   fields:["*"],
		   where: [],
		   limit:[]
	   }
	   var results = [];
	   if(!params.userInfo.id) return results;
	   conditions.where.push("acountid = " + params.userInfo.id);
	   conditions.limit.push('0', '1');
	   results = await this.DB().log().syncGet(conditions);
	   
	   return results;
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
            var sql = "update #@sys_acount set password = '"+source.password.password+"',addTime = '"+source.password.time+"' where id ="+data.id;
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
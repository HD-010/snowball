/*
 * @Description: In User Settings Edit
 * @Author: your name
 * @Date: 2019-06-17 15:04:46
 * @LastEditTime: 2019-08-26 17:52:20
 * @LastEditors: Please set LastEditors
 */
function PermitModel(){

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
                    condition.where.push(" userId is null ");
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
        // var permit = process.getUserInfo('PERMIT',uid);
        // callback(permit);
        var userInfo =process.getUserInfo(uid)[0];
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
                
                if(results.length){
                    callback(results);
                    return;
                }else{//userId没有查询到用户信息,第二次根据组权限查询
                    condition.where.shift();
                    condition.where.push("groupId = "+userInfo.groupId);
                    that.DB().get(condition,function(error,res){
                        if(res.length) callback(res);
                        return;
                    })
                } 
            });
        }       
    }

    /***
     * 修改权限组权限信息
     * 
     */
    that.updatePermit = function(callback){
        var data = {};
        data.base64 = that.POST("!database64");
        try{
            var utility = require('utility');
            var getData = utility.base64decode(data.base64);       
            data.base64 = JSON.parse(getData);
        }catch(error){
            return callback({error:0})
        }

        var groupId = data.base64[0].groupId;
        var sql  = "delete from youbang_sys_permit where userId is null and groupId = "+groupId;
        that.DB().query(sql,function(error,results){
            var condition = {
                table:["youbang_sys_permit"],                                 //查询的表名
                fields:data.base64           //被查询的字段名称（别名在此指定）                       
            };
            that.DB().set(condition,function(error,results){
               if(results.affectedRows){
                var obj={
                    message:"组权限修改成功!",
                    uri:"/admin/permit/getGroupAll",
                    error:0
                }
                callback(obj)
               }
            })
        })       
    }

    /**
     * 根据用户ID 获取用户的权限
     */
    that.editAcountPermit = function(params,callback){
        var dataProcess = that.model('DataProcess'); 
        var data = {};
        data.userInfo = params;
        data.id = data.userInfo.id;
        data.name = data.userInfo.userName;
        data.groupId = data.userInfo.groupId;
        //获取登录用户的权限
        that.loginUserPermit(function(res){
            data.loginUserPermit = dataProcess.structMenu(res);
             //根据用户ID 获取用户信息
            if( data.id){           
                if(data.userInfo){
                    //根据用户id 查询权限，查不到 在根据用户的组ID查询
                    var condition = {
                        table:["youbang_sys_permit as p"],                                 //查询的表名
                        fields:["p.id as permitId","p.`userId`","p.groupId","m.id","m.`name`","m.pid","p.`menuId`","p.`add`","p.`delete`",'p.`edit`','p.`show`'],           //被查询的字段名称（别名在此指定）
                        where:[],           //查询条件
                        orderBy:['id asc'],
                        joinOn:" LEFT JOIN youbang_sys_menu as m ON m.id = p.menuId "
                    };
                    condition.where.push("userId ="+data.id);
                    that.DB().get(condition,function(error,res){
                        if(res.length){
                            data.listPermits = res;
                            callback(data);
                            return;
                        }else{
                            condition.where.shift();
                            condition.where.push(" groupId = "+data.userInfo.groupId);
                            condition.where.push(" userId is null ");
                            that.DB().get(condition,function(error,res){
                                data.listPermits = res;
                                callback(data);
                                return; 
                            });
                        }
                    })
                }
               
            }
        })
    }

    
    /**
     * 根据用户ID获取用户信息
     * 
     */
    that.getUserById = function(id,callback){
        that.CURL({
            uri:"http://127.0.0.1:3005/passport/sign/getUserById?id=" + id,
            callback:(error,source)=>{
              callback(source)
            }
        });
    }



    /***
     * 修改用户权限信息
     * 
     */
    that.updateAcountPermit = function(callback){
        var data = {};
        data.base64 = that.POST("!database64");
        try{
            var utility = require('utility');
            var getData = utility.base64decode(data.base64);       
            data.base64 = JSON.parse(getData);
        }catch(error){
            return callback({error:0})
        }

        var groupId = data.base64[0].groupId;
        var userId = data.base64[0].userId;
        var sql  = "delete from youbang_sys_permit where userId = "+userId+" and groupId = "+groupId;
        that.DB().query(sql,function(error,res){
            var condition = {
                table:["youbang_sys_permit"],                                 //查询的表名
                fields:data.base64           //被查询的字段名称（别名在此指定）                       
            };
            that.DB().set(condition,function(error,results){
               if(results.affectedRows){
                var obj={
                    message:"用户权限修改成功!",
                    uri:"/admin/permit/getAcountAll",
                    error:0
                }
                callback(obj)
               }
            })
        })       
    }

    /**
     * 向权限表写入新增组件的menuid
     */
    that.add = function(params, callback){
        var data = {};
        var sql = "insert into `youbang_sys_permit`\
        (`userId`, `groupId`,`menuId`,`add`,`delete`,`edit`,`show`,`enable`) \
        values \
        (null, 1, " + params.menuid + ", '1', '1', '1', '1', '1'),\
        (null, 1, "+ parseInt(params.menuSubid - 4) +", '1', '1', '1', '1', '1'),\
        (null, 1, "+ parseInt(params.menuSubid - 3) +", '1', '1', '1', '1', '1'),\
        (null, 1, "+ parseInt(params.menuSubid - 2) +", '1', '1', '1', '1', '1'),\
        (null, 1, "+ parseInt(params.menuSubid - 1) +", '1', '1', '1', '1', '1'),\
        (null, 1, "+ params.menuSubid +", '1', '1', '1', '1', '1')";

        this.DB().insert(sql, function(error, results){
            data.error = error ? 1 : 0;
            callback(data);
        })
    }

    /**
     * 从权限表删除menuid
     */
    that.del = function(params, callback){
        let data = {error:1, message: ["删除成功！","参数menuId错误！"]};
        let condition = {
            table: '#@sys_permit',
            where:[]
        }
        if(!params.menuId.length) return callback(data);
        condition.where.push('menuId in('+params.menuId.join(',')+')');
        this.DB().log().del(condition, (error, results)=>{
            data.error = error ? 1: 0;
            data.results = results;
            return callback(data);
        });
    }
}



module.exports = PermitModel;
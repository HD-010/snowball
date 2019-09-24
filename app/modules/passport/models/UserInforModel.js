function UserInforModel() {
    //根据用户帐号查询用户信息：
    this.infors = function(data,callback){
        //使用案例：实例化ShimService并调用成员方法查询
        var struct = {
            where  : [],
            groupBy: [],
            orderBy: [],
            limit  : []
        };
        //添加查询条件
        var acount = this.POST('!email',{reg:'email',default:false});
        if(!acount) {
            callback({error:1,message: "帐号不能为空！"});
            return;
        }
        struct.where.push(" acount = '" + acount + "'"); 

        var password = this.POST('!password',{default:false});
        if(!password) {
            callback({error:1,message: "密码不能为空！"});
            return;
        }

        //初始化构造查询对象
        var sqlStruct = this.SqlStruct(struct);
        
        //调用服务类进行查询
        var _acount = this.service('Acount');
        
        _acount.querySysAcount(sqlStruct,function(error,results,fields){
            var data = {};
            if(error){
                data = {
                    error  : 2,
                    message: "登录失败"
                };
                callback(data);
                return;
            }
            data = (error || !results.length) ?
            {error  : 1,uri: '/admin/sign/_in',data:[], message: "帐号或者用户名错误"} : 
            {error: 0,data : results};
			
			if(results[0].enable != '1') {
				data.error = 1;
				data.message = "您的当前帐户不可用！";
			}
            
            return callback(data);
        });
    }

    this.acountExists = function(params,callback){
        //使用案例：实例化ShimService并调用成员方法查询
        var struct = {
            where  : [],
            groupBy: [],
            orderBy: [],
            limit  : []
        };

        //添加查询条件
        var acount = this.POST('!email',{reg:'email',default:false});
        if(!acount) {
            callback({error:1,message: "登录帐号不能为空！"});
            return;
        }
        struct.where.push(" acount = '" + acount + "'"); 
        //初始化构造查询对象
        var sqlStruct = this.SqlStruct(struct);
        //调用服务类进行查询
        var _acount = this.service('Acount');
        _acount.querySysAcount(sqlStruct,function(error,results,fields){
            results = results.length ? {error: 1, message: "当前Email已经注册过"} : {error: 0}
            callback(results);
            return;
        });
    }

    /**
     * 读取用户权限，保存在session 中
     */
    this.getPermit = function(params,callback){
        var dataProcess = this.model('DataProcess');
        this.CURL({
            uri:"http://127.0.0.1:3005/permit/permit/p-list?uid=" + params.uid,
            callback:(error,source)=>{
                if(error || !source.data.length) source.message = '禁止访问！请联系管理员受予访问权';
                source.permit = source.data;
                delete source.data;
                dataProcess.setUserInfo(source,'PERMIT',params.uid);
                return callback(source);
            }
        });
    }

    /**
     * 写入用户注册 信息
     */
    this.insertRegInfo = function(params,callback){
        //返回的数据格式
        var data = {
            error  : 1,
            message: "数据校验失败"
        };

        var acount = this.POST('!email',{default: false});
        if(acount === false){
            data.message = "您没有填写帐号！";
            callback(data);
            return;
        }

        var userName = this.POST('uname',{default: false});
        if(userName === false){
            data.message = "您没有填写用户名！";
            callback(data);
            return;
        }

        var tel = this.POST('tel',{default: false});
        if(tel === false){
            data.message = "您没有绑定手机号！";
            callback(data);
            return;
        }
        
        if(!this.POST('!password')){
            data.message = "您没有填写密码！";
            callback(data);
            return;
        }

        //使用密码生成器生成密码
        var pwd    = this.model('DataProcess').createPasswd();
        var struct = [
            //待写入的第一组数据,默认pid为2000,即新用户组id
            {
                pid       : this.POST('pid') || 2000,
                userName  : userName,
                acount    : acount,
                tel       : tel,
                password  : pwd.password,
                acountType: "manager",
                groupId   : 2000,
                enable    : '1',
                addTime   : pwd.time,
            },
        ];
        
        //初始化构造查询对象
        var sqlStruct = this.SqlStruct(struct);
        
        var _acount = this.service('Acount');
        
        _acount.addSysAcount(sqlStruct,function(error,results,fields){
            data = error ?
            {error: 1, message: "数据写入失败！"}: {error: 0,message:'注册成功，正登录跳转...',uri:'/admin/index/index'};
            callback(data);
        });
    }

    /**
     * 写入代理商注册 信息
     */
    this.insertAgentRegInfo = function(params,callback){
        var that = this;
        //返回的数据格式
        var data = {
            error  : 1,
            message: "数据校验失败"
        };

        var acount = this.POST('!email',{default: false});
        if(acount === false){
            data.message = "您没有填写帐号！";
            callback(data);
            return;
        }

        var userName = this.POST('uname',{default: false});
        if(userName === false){
            data.message = "您没有填写用户名！";
            callback(data);
            return;
        }
        
        if(!this.POST('!password')){
            data.message = "您没有填写密码！";
            callback(data);
            return;
        }

        //使用密码生成器生成密码
        var dataProcess = this.model('DataProcess');
        var pwd    = dataProcess.createPasswd();
        var pid = dataProcess.getUseInfo()[0].id || '2000';
        
        var struct = [
            //待写入的第一组数据,默认pid为2000,即新用户组id
            {
                pid       : pid,
                userName  : userName,
                acount    : acount,
                password  : pwd.password,
                acountType: "agent",
                groupId   : 2000,
                enable    : '1',
                addTime   : pwd.time,
            },
        ];
        
        //初始化构造查询对象
        var sqlStruct = this.SqlStruct(struct);
        
        var _acount = this.service('Acount');
        
        _acount.addSysAcount(sqlStruct,function(error,results,fields){
            if(error){
                data = {error: 1, message: "数据写入失败！"};
                callback(data);
                return;
            }else{
                var insertId = results.insertId;
                that.addAddonAcount((results)=>{
                    if(results.error){
                        callback(data);
                        return;
                    }
                    data.error = 0;
                    data.message = '添加成功，正在跳转到详情页';
                    data.uri = '/admin/agent/agentEdt?id='+ insertId +'&tp=agent';
                    callback(data);
                },{id:insertId});
            }
            
        });
    }
    

    /**
     * 清除用户登录信息
     */
    this.clear = function(callback){
        var uid = this.POST('uid') || this.GET('uid');
        uid = (typeof uid === 'number') ? uid : this.sessionID();
        var session = this.session();
        //删除用户信息
        var key     = "U_" + uid;
        delete session[key];
        //删除权限表
        key = "PERMIT_" + uid;
        delete session[key]; 

        var data    = {
            error  : 0,
            message: "成功退出登录！",
            uri    : "/admin/sign/signin"
        };

        callback(data);
    }

    /**
     * 获取用户列表
     */
    this.list = function(callback,params){
        var data   = {error:0};
        var pageNo = this.GET('pageNo') || 1;
        var pageSize = this.GET('pageSize') || 20;
        var struct = {
            where  : [],
            groupBy: [],
            orderBy: [],
            limit  : []
        };

        //添加查询条件
        struct.where.push(" a.enable < '2' ");　//禁止加载为删除状态的记录
        //添加关键字查询
        if(this.POST('sk')){
            struct.where.push(
                " (a.acount like '" + this.POST('!sk') + "%' or "+
                " a.userName like '" + this.POST('sk') + "%' or " +
                " a.acountType like '" + this.POST('sk') + "%' or " +
                " g.merchNo like '" + this.POST('sk') + "%' or " +
                " g.merchName like '" + this.POST('sk') + "%' or " +
                " m.nick like '" + this.POST('sk') + "%' or " +
                " m.realName like '" + this.POST('sk') + "%')"
            ); 
        }
        if('type' in params) struct.where.push(" a.`acountType` = '" + params.type + "' ");
        
        var start = (pageNo - 1) * pageSize;
        struct.limit.push(start,pageSize);

        //初始化构造查询对象
        var sqlStruct = this.SqlStruct(struct);
        
        //调用服务类查询用户列表
        var acount = this.service('Acount');
        acount.queryAcountList(sqlStruct,function(error,results,fields){
            if(error || (results.length === 0)){
                data.error = 1;
                end(1);
                return;
            }
            data.users = results;
            end();
        });
        
        //调用服务类统计符合条件的用户数量
        acount.countAcountList(sqlStruct,function(error,results,fields){
            if(error || (results.length === 0)){
                data.error = 1;
                end(1);
                return;
            }
            data.total = results[0].total;
            data.pageNo = pageNo;
            data.pageSize = pageSize;
            end();
        });

        function end(tag){
            if(tag) {
                callback(data);
                return;
            }
            if(('total' in data) && ('users' in data)) callback(data);
        }

    }

    /**
     * 更新数据
     */
    this.upAcount = function(callback,params){
        var data   = {error:0,message:'操作成功，正在刷新页面！',uri:""};
        var struct = {
            feilds: {},
            where : []
         };
        var id     = this.POST('id') || this.GET('id');
        var enable = this.POST('enable') || this.GET('enable') || '1';
        if(!id) {
            data.error   = 1;
            data.message = "操作失败，请重试！";
            callback(data);
            return;
        }
        if(this.POST('un')) struct.feilds.userName           = this.POST('un');
        if(this.POST('acountType')) struct.feilds.acountType = this.POST('acountType');
        if(this.POST('groupId')) struct.feilds.groupId       = this.POST('groupId');
        if(this.POST('!password')){
            var param = [{addTime:this.POST('!addTime')}]
            var pawd  = this.model('DataProcess').createPasswd(param);
            struct.feilds.password = pawd;
        } 
        struct.feilds.enable = enable;
        struct.where.push("id = " + id);
        if('type' in params) struct.where.push(" acountType = '" + params.type  + "'");
        //初始化构造查询对象
        var sqlStruct = this.SqlStruct(struct);

        var acount = this.service('Acount');
        acount.updateAcount(sqlStruct,function(error,results,fields){
            
            if(error){
                data.error   = 1;
                data.message = "操作失败，请重试！"
            }
            
            callback(data);
        })
    }

    /**
     * 获取一个用户的所有信息
     */
    this.aUser = function(data,callback){
        //使用案例：实例化ShimService并调用成员方法查询
        var struct = {
            where  : [],
            groupBy: [],
            orderBy: [],
            limit  : []
        };
        struct.limit.push(1);

        //添加查询条件
        if(this.GET('id')) struct.where.push(" a.id =" + this.GET('id')); 
        if(data.id) struct.where.push(" a.id =" + data.id);

        //初始化构造查询对象
        var sqlStruct = this.SqlStruct(struct);
        
        //调用服务类进行查询
        var acount = this.service('Acount');
        var type   = this.GET('tp');
        if(data.tp) type = data.tp;
        
        acount[type + 'Info'](sqlStruct,function(error,results,fields){
            callback(error,results,fields)
        });
    }

    /**
     * 更新帐户附加表
     */
    this.upAddonAcount = function(callback){
        var data   = {error:0,message:'操作成功，正在刷新页面！',uri:""};
        var type = this.POST('acountType');
        //注，没有agent 和　manager标识的字段可能是两张表共有的字段
        var agent = (type === 'agent') ? true: false;
        var manager = (type === 'manager') ? true: false;
        //构造结构查询结构
        var struct = {
            feilds: {},
            where : []
         };
        var id     = this.POST('addonId');
        if(!id){
            data.error   = 1;
            data.message = "操作失败，请重试！";
            callback(data);
            return;
        }
        
        //代理商数据表字段
        if(this.POST('merchName')) struct.feilds.merchName = this.POST('merchName');
        if(this.POST('agentCate')) struct.feilds.agentCate = this.POST('agentCate');
        if(this.POST('desc')) struct.feilds.desc = this.POST('desc');
        if(this.POST('realName')) struct.feilds.realName = this.POST('realName');
        if(this.POST('mobile')) struct.feilds.mobile = this.POST('mobile');
        if(this.POST('status')) struct.feilds.status = this.POST('status');
        if(this.POST('accountTime')) struct.feilds.accountTime = this.POST('accountTime');
        if(this.POST('accountTotal')) struct.feilds.accountTotal = this.POST('accountTotal');
        if(this.POST('remark')) struct.feilds.remark = this.POST('remark');
        if(this.POST('logo')) struct.feilds.logo = this.POST('logo');
        if(this.POST('payopenid')) struct.feilds.payopenid = this.POST('payopenid');
        if(this.POST('payrate')) struct.feilds.payrate = this.POST('payrate');
        if(this.POST('isrecommand')) struct.feilds.isrecommand = this.POST('isrecommand');
        if(this.POST('cateid')) struct.feilds.cateid = this.POST('cateid');
        if(this.POST('address')) struct.feilds.address = this.POST('address');
        if(this.POST('tel')) struct.feilds.tel = this.POST('tel');
        if(this.POST('lat')) struct.feilds.lat = this.POST('lat');
        if(this.POST('lng')) struct.feilds.lng = this.POST('lng');
       
        //管理用户数据表字段
        if(this.POST('nick') && manager) struct.feilds.nick = this.POST('nick');
        if(this.POST('mobile')) struct.feilds.mobile = this.POST('mobile');
        if(this.POST('effectiveTime')) struct.feilds.effectiveTime = this.POST('effectiveTime');
        if(this.POST('expirationTime')) struct.feilds.expirationTime = this.POST('expirationTime');
        if(this.POST('sex')) struct.feilds.sex = this.POST('sex');
        if(this.POST('realName')) struct.feilds.realName = this.POST('realName');
        if(this.POST('IDNumber')) struct.feilds.IDNumber = this.POST('IDNumber');
        if(this.POST('birthday')) struct.feilds.birthday = this.POST('birthday');
        
        //修改条件
        struct.where.push("id = " + id);
        //初始化构造查询对象
        var sqlStruct = this.SqlStruct(struct);
        var acount = this.service('Acount');
        acount[type + 'Up'](sqlStruct,function(error,results,fields){
            if(error){
                data.error = 1;
                data.message = "操作失败，请重试！"
            }
            callback(data);
        })
    }

    /**
     * 在附加表增加一条记录
     */
    this.addAddonAcount = function(callback,params){
        params = params || {};
        var data = {error:0,message:'操作成功，正在刷新！',uri:''}
        var struct = [
            //待写入的第一组数据
            {
                accountTotal: 0,
                joinTime: 'NOW()',
            },
        ];
        if(params.id) struct[0].acountid = params.id;
        if(this.POST('id')) struct[0].acountid = this.POST('id');

        //初始化构造查询对象
        var sqlStruct = this.SqlStruct(struct);
        var acount = this.service('Acount');
        acount.agentAdd(sqlStruct,function(error,results,fields){
            if(error){
                data.error = 1;
                data.message = "操作失败，请重试！";
            }
            callback(data);
        });
    }
    
    /**
     * 根据用户ID 查询用户信息
     */
    this.getUserById = function(data,callback){
         //使用案例：实例化ShimService并调用成员方法查询
         var struct = {
            where  : [],
            groupBy: [],
            orderBy: [],
            limit  : []
        };
        struct.limit.push(1);

        //添加查询条件
        if(this.GET('id')) struct.where.push(" id =" + this.GET('id')); 

        //初始化构造查询对象
        var sqlStruct = this.SqlStruct(struct);        
        //调用服务类进行查询
        var acount = this.service('Acount'); 
        
        acount.querySysAcount(sqlStruct,function(error,results,fields){
            callback(results,fields)
        });
    }

}


module.exports = UserInforModel;
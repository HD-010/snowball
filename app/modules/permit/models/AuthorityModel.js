function AuthorityModel(){
    /**
     * 判断当前用户有没有访问当前路由的权限
     */
    this.powers = function(params,callback){
        var auList;
        var that   = this;
        var router = this.app.router.string;
        //获取数据处理模型
        var dataProcess = this.model('DataProcess');
        //获取访问者的用户信息 
        var userInfo = dataProcess.getUseInfo();
            if(!userInfo){
                callback({error:1,message:'系统错误，没有执行身份验证',uri:'/admin/sign/signin'});
                return;
            }
        
        var userId = userInfo[0].id;
        var groupId = userInfo[0].groupId;
        var struct = {
            where  : [],
            groupBy: [],
            orderBy: [],
            limit  : []
        };

        //添加查询条件
        struct.where.push(" a.`enable` = '1'"); 
        struct.where.push(" a.gounpId =" + groupId, " a.userId = " + userId); 
        //调用服务类进行查询用户属组权限
        var authority = this.service('Authority');

        //初始化构造查询对象
        var sqlStruct = this.SqlStruct(struct);
        authority.list(sqlStruct,function(error,results,fields){
            if(error || results.length === 0){
                struct.where = [];
                struct.where.push(" a.`enable` = '1'"); 
                struct.where.push(" a.gounpId =" + groupId, " a.userId is null ");
                sqlStruct = that.SqlStruct(struct);
                authority.list(sqlStruct,function(error,results,fields){
                    //这里的组权限是系统值，默认赋初值
                    if(error || results.length === 0){
                        //错误
                        callback({error: 1,message: '当前用户没有被受权访问',uri: '/admin/index/err404'});
                        return;
                    }
                    auList = results;
                    end();
                    return;
                });
                return;
            }
            auList = results;
            end();
            return;
        });
        
        function end(){
            var results = auList;
            /**
             * 设置权限值
             * 记录当前用户组在系统拥有的访问权限
             * 在controler 或 model可以通过
             * dataProcess.getUserInfo('AG');获取系统权限
             * 通过 this.res.authority获取当前页面的获取
             * 或者在控制器通过this.authority获取当前页面的操作权限
             * */
            dataProcess.setGroupInfo(results,groupId,'AG');
            
            results = that.userAu(results,userId);
            for(var i = 0; i < results.length; i ++){
                if(((typeof results[i]) === 'object') && 
                (results[i].valid === '0') && 
                (results[i].url === router)){
                    callback({error:0});
                    return;
                }else{
                    if((results[i].url === router) && 
                    (results[i].show == '1') || 
                    ((results[i].add == '1') || 
                    (results[i].delete == '1') || 
                    (results[i].edit == '1'))){ 
                        /**
                         * 设置权限值
                         * 记录当前用户在系统拥有的访问权限(最大权限等于所属用户组的权限)
                         * 在controler 或 model可以通过
                         * dataProcess.getUserInfo('AU');获取系统权限
                         * 通过 this.res.authority获取当前页面的获取
                         * 或者在控制器通过this.authority获取当前页面的操作权限
                         * */
                        dataProcess.setUserInfo(results,'AU');
                        //记录当前用户在当前页面的权限
                        that.res.authority = results[i];
                        
                        callback({error:0});
                        return;
                    }
                }
            }
        }
    }

    /**
     * 获取用户的访问权限，当没有uid对应用户的访问权限时，返回组权限作为用户的访问权限
     */
    this.userAu = function(groupAu,uid){
        var authorities = [];
        groupAu = groupAu || [];

        for(var i = 0; i < groupAu.length; i++){
            if(groupAu[i].userId == uid) authorities.push(groupAu[i]);
        }
        if(authorities.length === 0) authorities = groupAu;
        
        return authorities;
    }

    /**
     * 保存改变的数据
     */
    this.saveAuthorities = function(params,callback){
        var data = {error: 1,message: '数据格式错误',uri: '/admin/index/err404'};
        var items = JSON.parse(this.POST('!items'));
        var groupId = this.POST('groupId') || '';
        var userId = this.POST('userId') || '';
        if(!groupId){
            console.log("groupid不存在");
            callback(data);
            return;
        }
        
        var dataProcess = this.model('DataProcess');
        var auBack = dataProcess.getUseInfo('AU_BACK');

        //写入一条新的数据
        var struct = [];
        for(var i = 0; i < items.length; i ++){
            //过滤与权限无关的数据
            if(items[i].indexOf('item_') === -1) continue;
            var menuId = items[i].replace('item_','');
            var item = this.POST(items[i]) || false;
            if(!item) continue;
           
            var stru = {};
            //处理表单传入的值
            if(typeof item === 'object'){
                stru.show = (Object.inArray(item,'show')) === false ? '0' : '1';
                stru.add = (Object.inArray(item,'add')) === false ? '0' : '1';
                stru.edit = (Object.inArray(item,'edit')) === false ? '0' : '1';
                stru.delete = (Object.inArray(item,'delete')) === false ? '0' : '1';
            }

            if(typeof item === 'string'){
                stru.show = (item == 'show') ? '1' :'0';
                stru.add = (item == 'add') ? '1' :'0';
                stru.edit = (item == 'edit') ? '1' :'0';
                stru.delete = (item == 'delete') ? '1' :'0';
            }

            if(!item){
                stru.show = '0';
                stru.add = '0';
                stru.edit = '0';
                stru.delete = '0';
            }
            
            //被受权的菜单id
            stru.menuId = menuId;
            //统一数据表中原始的，不可变的值
            //检查菜单受权项的无操作项
            //当前菜单对应的auBack
            var backItem = this.getMenuItem(auBack,'menuId',menuId);
            if(!backItem){
                data.message = "权限值被改变，错误！";
                callback(data);
                return;
            }
            
            if(backItem.show === '-1') stru.show = '-1';
            if(backItem.add === '-1') stru.add = '-1';
            if(backItem.edit === '-1') stru.edit = '-1';
            if(backItem.delete === '-1') stru.delete = '-1';
            
            if(userId) stru.userId = userId;
            if(groupId) stru.gounpId = groupId;
            stru.enable = '1';
            struct.push(stru);
        }

        console.log(struct);
        //初始化构造查询对象
        var sqlStruct = this.SqlStruct(struct);
        var authority = this.service('Authority');
        authority.add(sqlStruct,function(error,results,fields){
            if(!error){
                data.error = 0;
                data.message = "写入权限数据成功";
                data.uri = '';
                callback(data);
                return;
            }
            data.message = "写入权限数据失败";
            callback(data);
            return;
        });
    }

    //返回有key => val的对象
    this.getMenuItem = function(arr,key,val){
        for(var i = 0; i < arr.length; i ++){
            if(arr[i][key] == val) return arr[i];
        }
        return false;
    }

    /**
     * 删除权限值
     */
    this.del = function(params,callback){
        var data = {error: 1,message: '数据格式错误',uri: '/admin/index/err404'};
        var tp = this.POST('tp',{default:false});
        var userId = this.POST('userId');
        var groupId = this.POST('groupId');
        var struct= {where:[]};
        if(!tp || (((tp == 'U') && !userId) || ((tp == 'G') && !groupId))) {
            
            data.message = "ID 与类型不一致";
            callback(data);
            return;
        }
        if(tp == 'G') struct.where.push(' `userId` is null ',' `gounpId` = ' + groupId + ' ');
        if(tp == 'U') struct.where.push(' `userId` = ' + userId + ' ');
        var sqlStruct = this.SqlStruct(struct);
        var authority = this.service('Authority');
        authority.del(sqlStruct,function(error,results,fields){
            if(error){
                data.message = "删除旧版本权限出错";
                callback(data);
                return;
            }
            data.error = 0;
            data.message = "成功删除旧版本权限"
            callback(data)
            return;
        })

    }

    /**
     * 分配组的基本权限
     *  */
    this.insertBaseAu = function(params,callback){
        var authority = this.service('Authority');
        authority.cpAu(params,function(error,results,fields){
            data = error ? { error: 1, message: "权限初始化失败！" } : { error: 0, 
                message: '权限初始化成功，正返回列表...', 
                uri: '/admin/role/list' };
            callback(data);
        });
    }
}


module.exports = AuthorityModel;
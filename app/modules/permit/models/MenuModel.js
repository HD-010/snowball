function MenuModel(){

    this.list = function(data,callback){
        //获取当前用户登录信息
        var dataProcess = this.model('DataProcess');
        var userInfo    = dataProcess.getUseInfo();
        //获取当前用户被受权的菜单id
        var authoritiedMenuId = dataProcess.getAuthoritiedMenuId();
        var that = this;
        that.DB('Redis').get('Menu_' + userInfo[0].id,(error,results)=>{
            if(!error && results != null){
                console.log('＝＝＝＝＝＝＝＝＝＝＝＝＝list数据由redis提供：＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝');
                callback(results);
                return;
            }
       
            //实例化MenuService并调用成员方法查询菜单列表
            var struct = {
                where  : [],
                groupBy: [],
                orderBy: [],
                limit  : []
            };

            //添加查询条件
            if(authoritiedMenuId.length > 0) struct.where.push(" id in (" + authoritiedMenuId.join(', ') +")"); 
            struct.where.push(" `show` = '1' ");
            struct.orderBy.push(" `weight` desc ");

            //初始化构造查询对象
            var sqlStruct = this.SqlStruct(struct);
            
            //调用服务类进行查询
            var menu = this.service('Menu');
            menu.list(sqlStruct,function(error,results,fields){
                var menus = error ? [] : dataProcess.structMenu(results);
                //that.DB('Redis').set('Menu_' + userInfo[0].id,menus);
                callback(menus);              
            });
        });
        
    }

    /**
     * 判断被受权用户在权限表中是否有已受权的数据，如果有则使用,如果没有，
     * 则采用当前用户的权限作为最大权限受予
     */
    this.groupList = function(params,callback){
        //获取当前用户登录信息
        var dataProcess = this.model('DataProcess');
        var userInfo    = dataProcess.getUseInfo();
        var groupId = userInfo[0].groupId;
        
        //获取当前用户被受权的菜单id
        var authoritiedMenuId = dataProcess.getAuthoritiedMenuId();
        
        var that = this;
        
        //实例化MenuService并调用成员方法查询菜单列表
        var struct = {
            where  : [],
            groupBy: [],
            orderBy: [],
            limit  : []
        };

        //添加查询条件
        struct.where.push(" a.`enable` = '1' ");
        struct.orderBy.push(" m.`weight` desc ");
        if(authoritiedMenuId.length === 0){
            callback({error:1,message:'没有源权限可受予',uri:'/admin/index/err404'});
            return;
        }
        struct.where.push(" m.`id` in " + "(" + authoritiedMenuId.join(",") + ") ",
        " a.userId is null ",
        " gounpId = " + groupId
         );
        

        //初始化构造查询对象
        var sqlStruct = this.SqlStruct(struct);
        
        //调用服务类进行查询
        var menu = this.service('Menu');
        var data = {};
        menu.listAddonAuthorities(sqlStruct,function(error,results,fields){
            data.refMenus = JSON.parse(JSON.stringify(results));
            //保存菜单数据，在写入权限时需要与编辑过的权限进行对比
            dataProcess.setUserInfo(results,'AU_BACK');
            data.menus = error ? [] : dataProcess.structMenu(results);
            callback(data);                
        });
    }

    /**
     * 获取当前被编辑用户已经拥有的权限列表
     */
    this.aboutUser = function(params,callback){
        //获取当前用户登录信息
        var dataProcess = this.model('DataProcess');
        var userInfo    = dataProcess.getUseInfo();
        var groupId = userInfo[0].groupId;
        var gid = this.GET('gid');
        var uid = this.GET('id');
        //判断用户在权限表中是否有已受权的数据，如果有则使用，
        
        var that = this;
        
        //实例化MenuService并调用成员方法查询菜单列表
        var struct = {
            where  : [],
            groupBy: [],
            orderBy: [],
            limit  : []
        };

        //添加查询条件
        struct.where.push(" a.`enable` = '1' ");
        struct.where.push(" a.`userId` = " + uid);
        struct.orderBy.push(" m.`weight` desc ");
        

        //初始化构造查询对象
        var sqlStruct = this.SqlStruct(struct);
        
        //调用服务类进行查询
        var menu = this.service('Menu');
        var data = {};
        menu.listAddonAuthorities(sqlStruct,function(error,results,fields){
            data.refMenus = JSON.parse(JSON.stringify(results));
            //保存菜单数据，在写入权限时需要与编辑过的权限进行对比
            dataProcess.setUserInfo(results,'AU_BACK');
            data.menus = error ? [] : dataProcess.structMenu(results);
            callback(data);                
        });
    }

    /**
     * 获取当前被编辑组已经拥有的权限列表
     */
    this.aboutGroup = function(params,callback){
        //获取当前用户登录信息
        var dataProcess = this.model('DataProcess');
        var userInfo    = dataProcess.getUseInfo();
        var groupId = userInfo[0].groupId;
        var gid = this.GET('gid');
        var uid = this.GET('id');
        //判断用户在权限表中是否有已受权的数据，如果有则使用，
        
        var that = this;
        
        //实例化MenuService并调用成员方法查询菜单列表
        var struct = {
            where  : [],
            groupBy: [],
            orderBy: [],
            limit  : []
        };

        //添加查询条件
        struct.where.push(" a.`enable` = '1' ");
        struct.where.push(" a.`gounpId` = " + gid," a.userId is null ");
        struct.orderBy.push(" m.`weight` desc ");

        //初始化构造查询对象
        var sqlStruct = this.SqlStruct(struct);
        
        //调用服务类进行查询
        var menu = this.service('Menu');
        var data = {};
        menu.listAddonAuthorities(sqlStruct,function(error,results,fields){
            data.refMenus = JSON.parse(JSON.stringify(results));
            //保存菜单数据，在写入权限时需要与编辑过的权限进行对比
            dataProcess.setUserInfo(results,'AU_BACK');
            data.menus = error ? [] : dataProcess.structMenu(results);
            callback(data);                
        });
    }

    
}

module.exports = MenuModel;
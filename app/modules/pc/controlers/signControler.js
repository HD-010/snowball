function signControler(){
    /**
     * 系统-登录页面
     */
    this._in = function(){
        var data = {error:0,title:"内容管理系统首页"};

        //获取视图模块配置
        data.viewModels = this.model('Template').pageModel();

        return this.renderLayer(data);
    }

    /**
     * 系统-注册页面
     */
    this._up = function(){
        var data = {error:0,title:"内容管理系统首页"};

        //获取视图模块配置
        data.viewModels = this.model('Template').pageModel();
        
        return this.renderLayer(data);
    }
    
    /**
     * 系统-忘记密码fg:forget
     */
    this._fg = function(){
        var data = {error:0,title:"内容管理系统首页"};

        //获取视图模块配置
        data.viewModels = this.model('Template').pageModel();
        
        return this.renderLayer(data);
    }

    /**
     * 系统-修改用户资料（upProfiles）
     */
    this._upp = function(){
        var data = {error:0,title:"内容管理系统首页"};

        //获取视图模块配置
        data.viewModels = this.model('Template').pageModel();
        
        return this.renderLayer(data);
    }

    /**
     * 系统-修改密码（modifyPasswword)
     */
    this._mp = function(){
        var data = {error:0,title:"内容管理系统首页"};

        //获取视图模块配置
        data.viewModels = this.model('Template').pageModel();
        
        return this.renderLayer(data);
    }


    /**
     * 系统-退出登录
     */
    this._exit = function(){
        var data = {error:0,title:"内容管理系统首页"};

        //获取视图模块配置
        data.viewModels = this.model('Template').pageModel();
        
        return this.renderLayer(data);
    }
}

module.exports = signControler;
function signControler(){
    var that = this;
    
    /**
     * 登录视图控制
     */
    this._in = function(){
        that.render({});
    }

    /**
     * 注册视图控制
     */
    this._up = function(){
        that.render({});
    }

    /**
     * 退出视图控制
     */
    this._exit = function(){
        that.render({});
    }

    
    /**
     * 检查用户信息，如查服务端session过期，或盗链接。则跳转到登录页
     */
    this._check = function(){
        that.render({});
    }

}

module.exports = signControler;
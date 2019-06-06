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
}

module.exports = signControler;
/**
 * 用户登录流程说明：sign._in()操作输出登录视图,向passport:sign._in()操作请求数据验证。
 * 验证成功时保存登录用户信息到session，并返回用户信息到客户端暂存于sessionStorage
 */
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
        this.DB('Redis').set("MENU",'');
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
function sysControler(){
    var that = this;
    // 基本设置
    this.base = function(){       
        that.render({});
    }

    //安全设置
    this.securitySet = function(){
        that.render({});
    }
    
    //验证码设置
    this.code = function(){
        that.render({});
    }
}

module.exports = sysControler;
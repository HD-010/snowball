function permitControler(){
    var that = this;

    //管理组权限
    that.glist = function(){
        that.render({});
    }
    
    //管理组用户权限
    that.userRights = function(){
        that.render({});
    }

    //添加权限组
    that.addGlist = function(){
        that.render({});
    }
}
module.exports = permitControler;
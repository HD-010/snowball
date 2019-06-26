//用户管理
function manageControler(){
    var that = this;

    //添加用户
    that.addManage = function(){
        var Group = that.model("Group");
        Group.getGroup({},function(res){
            that.render(res);
        })
       
    }

    //查询用户列表信息
    that.listManage = function(){
        var Manage = that.model("Manage");
        Manage.getChildManage(function(res){
            that.render({list:res});
        })
       
    }

    //保存用户
    that.saveManage = function(){
        var Manage = that.model("Manage");
        Manage.saveManage(function(res){
            that.renderJson(res);
        })
    }

    /**
     * 删除管理者用户信息
     */
    that.delManage = function(){
        var Manage = that.model("Manage");
        Manage.delManage(function(res){
            that.renderJson(res);
        })
    }

    /**
     * 编辑管理员信息
     */
    that.editManage = function(){
        var Manage = that.model("Manage");
        Manage.editManage(function(res){
            that.render(res);
        })
    }

    /**
     * update管理员信息
     */
    that.updateManage = function(){
        var Manage = that.model("Manage");
        Manage.updateManage(function(res){
            that.renderJson(res);
        })
    }

    /**
     * 重置管理员密码
     */
    that.resetPassword = function(){
        var Manage  = that.model("Manage");
        Manage.resetPassword(function(res){
            that.renderJson(res);
        })
    }
}
module.exports = manageControler;
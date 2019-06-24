//用户管理
function manageControler(){
    var that = this;

    //添加用户
    that.addManage = function(){
        that.render({});
    }

    //查询用户列表信息
    that.listManage = function(){
        var Manage = that.model("Manage");
        Manage.getChildManage(function(res){
            that.render({list:res});
        })
       
    }

}
module.exports = manageControler;
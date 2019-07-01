function permitControler(){
    var that = this;

    /** 
     * 获取当前用户管理组权限信息列表
     * 查询管理组所有信息
    */
    that.getGroupAll = function(){
         var GroupModel = that.model("Group");
         GroupModel.getGroup({},function(res){
            if(res){
                that.render(res);
            }
         })
        
    }
    
     /**
      * 编辑当前用户下组权限信息
      * 传值 管理组id
      */
     that.editGlist = function(){
        var permit = that.model("permit"); 
        permit.listPermits({},function(res){
            that.render(res);
        })     
        
    }

    /**
     * 查询管理用户权限丽列表信息
     */
    that.getAcountAll = function(){
        var manageModel = that.model("Manage");
        manageModel.getChildManage(function(res){
           if(res){
                that.render({list:res});
           }
        })
    }

    /**
     * 修改权限组权限信息
     */
    that.updatePermit = function(){
        var permit = that.model("permit"); 
        permit.updatePermit(function(res){
            that.renderJson(res);
        })     
    }

    /**
     * 编辑用户的权限
     * 
     */
    that.editAcountPermit = function(){
        var permit = that.model("permit"); 
        permit.editAcountPermit(function(res){
            that.render(res);
        })     
    }

}
module.exports = permitControler;
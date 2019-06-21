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
      * 修改当前用户下组权限信息
      * 传值 管理组id
      */
     that.editGlist = function(){
        var permit = that.model("permit"); 
        permit.listPermits({},function(res){
            //console.log("===========================",res)
            that.render(res);
        })     
        
    }

}
module.exports = permitControler;
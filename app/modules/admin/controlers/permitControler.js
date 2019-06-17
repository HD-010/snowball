function permitControler(){
    var that = this;
   
    /** 
     * 管理组权限信息列表
     * 查询管理组所有信息
    */
    that.getGroupAll = function(){
         var GroupModel = that.model("Group");
         GroupModel.getGroup({},function(res){
            if(res){
                that.render({data:res});
            }
         })
        
    }
    
     /**
      * 修改当前组权限
      * 传值 管理组id
      */
     that.editGlist = function(){
        var permit = that.model("permit"); 
        permit.listPermits({},function(res){
            console.log(res)
            that.render({});
        })     
        
    }

}
module.exports = permitControler;
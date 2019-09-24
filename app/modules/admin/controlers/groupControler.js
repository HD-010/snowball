function GroupControler(){
    var that = this;

    /**
     * 获取栏目列表
     */
    that.addGroup = function(){ 
        //获取管理员类型列表
        var Group = that.model("Group");
        Group.getAcountTypeAll(function(res){
            if(res){
                that.render(res);
            }
        })      
          
    }


    /**
     * 保存管理组
     */
    that.saveGroup = function(){
        var group = that.model("Group");
        group.saveGroup(function(res){
            that.renderJson(res);
        })
        
    }




    /**
     * 
     * 查询管理用户组列表
     */
    that.groupList = function(){
        var Group = that.model("Group");
        Group.getGroupAll({},function(res){
            that.render({list:res});
        })
        
    }

    /**
     * 修改用户组
     */
    that.editGroup = function(){
        var Group = that.model("Group");
        Group.editGroup(function(res){
            if(res){
                that.render(res);
            }
            
        })
       
    }

    /**
     * 编辑用户组信息
     */
    that.updateGroup =function(){
        var Group = that.model("Group");
        Group.updateGroup(function(res){
            if(res){
                that.renderJson(res);
            }
        })
        
    }

    /**
     * 删除用户组信息
     * 但是没有删除用户组的权限信息
     */
    that.delGroup = function(){
        var Group = that.model("Group");
        Group.delGroup(function(res){
            if(res){
                that.renderJson(res);
            }
        })
    }
}

module.exports = GroupControler;
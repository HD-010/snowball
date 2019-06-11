function GroupControler(){
    var that = this;

    /**
     * 获取栏目列表
     */
    this.addGroup = function(){       
        that.render({});  
    }

    /**
     * 
     * 管理用户组
     */
    this.groupList = function(){
        that.render({});
    }
}

module.exports = GroupControler;
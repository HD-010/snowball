function permitControler (){
    var that = this;
    /**
     * 获取用户权限列表
     * 根据id获取用户权限列表，如果用户权限列表为空，
     * 则,根据gid获取组权限列表作为用户权限列表。
     */
    this.pList = function(){
        var data = {error:1,message:"参数错误"};
        var permit = that.model("Permit");
        var uid = that.POST('uid') || that.GET('uid') || '';
        if(!uid) return that.renderJson(data);
        permit.power({
            tagName : 'userId',
            tagVal : uid
        },function(result){
            //查询出错
            if(result.error == 1){
                result.data = [];
                return that.renderJson(result);
            }

            //查询到相应数据
            if(!result.error) {
                result.message = "查询成功"
                return that.renderJson(result);
            }

            //查询不到数据
            if(result.error == -1) {
                permit.group({id:uid},function(results){
                    if(results.error) return that.renderJson(data);
                    that.gList(results.data[0].groupId);
                });
            }
        });
    }

    /**
     * 获取组权限列表
     * 根据gid获取组权限列表
     */
    this.gList = function(pid){
        var data = {error:1,message:"参数错误"};
        var permit = that.model("Permit");
        pid = (pid === undefined) ? that.POST('gid',{default: that.GET('gid')}) : pid;
        if(pid === false) return that.renderJson(data);
        permit.power({
            tagName : 'groupId',
            tagVal : pid
        },function(resulst){
            if(resulst.error) resulst.data = []; 
            return that.renderJson(resulst)
        })

    }

    /**
     * 保存用户权限
     */
    this.save = function(){

    }
    

}

module.exports = permitControler;
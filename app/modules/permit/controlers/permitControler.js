function permitControler (){
    var that = this;
    /**
     * 获取个人用户权限列表
     * 根据id获取用户权限列表，如果用户权限列表为空，
     * 则,根据gid获取组权限列表作为用户权限列表。
     */
    this.pList = function(){
        var data = {error:1,message:"参数错误"};
        var permit = that.model("Permit");

        if(!that.POST('id')) return that.renderJson(data);
        
        permit.power({
            tagName : 'userId',
            tagVal : that.POST('id')
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
                permit.group({id:that.POST('id')},function(results){
                    if(results.error) return that.renderJson(data);
                    that.gList(results.data[0].pid);
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
        pid = (pid != undefined) || that.POST('gid');
        if(!pid) return that.renderJson(data);
        
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
function permitControler(){
    var that = this;

    //管理组权限
    that.glist = function(){
         var permit = that.model("permit");
         permit.lists({},function(res){
            if(res){
                console.log(res)
                that.render({data:res});
            }
         })
        
    }
    
    //管理组用户权限
    that.userRights = function(){
        that.render({});
    }

    //添加权限组
    that.addGlist = function(){
        that.render({});
    }
    
    //修改权限组
    that.updateGlist = function(){
        var permit = that.model("permit");
         permit.updateGlist({},function(res){
            if(res){
                console.log(res)
                that.render({data:res});
            }
         })
    }

    //删除权限组
    that.delGlist = function(){
        that.render({});
    }
}
module.exports = permitControler;
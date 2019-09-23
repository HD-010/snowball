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
    that.editManage = async function(){
		var params = {};
        var manage = that.model("Manage");
        manage.editManage(async function(res){
			params.userInfo = res.manageInfo[0];
			res.atag = params.userInfo.acountType;
			var addonInfo = await manage.addonAcount(params);
			addonInfo = addonInfo.results.length ? addonInfo.results[0] : {};
			res.manageInfo[0] = mergeObj([addonInfo,res.manageInfo[0]]);
			log("@#################----------######################:::", res);
            that.render(res);
        })
    }

    /**
     * update管理员信息
     */
    that.updateManage = function(){
		var ps = 1;
		var params = {};
        var manage = that.model("Manage");
		params.atag = this.POST('atag');
		params.acountid = this.POST("id");
		
		//保存主表信息
        manage.updateManage(function(res){
            that.renderJson(res);
        })
		//保存付加表信息
		if(params.atag && params.acountid){
			log("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$:", params.acountid)
			ps ++;
			manage.saveAddon(params,(error, results)=>{
			});
		}
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
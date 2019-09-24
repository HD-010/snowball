//用户管理
function manageControler(){
    var that = this;
	
	//个人中心
	that.user = async function(){
		var params = {};
		var manage = that.model("Manage");
		var res = await manage.user();
		//获取上传文件组件信息
		var oid = that.GET('oid') || that.POST('oid');
		res = mergeObj([res, that.model("File").upload({oid: oid})]);
		
		this.render(res);
	}

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
		var data = {error: 1, message: '数据保存失败'};
        var manage = that.model("Manage");
		var params = {};
        manage.saveManage(function(res){
			if(res.error) return that.renderJson(data);
			//保存附加表信息
			params.insertId = res.insertId;
			params.atag = "manager";
			manage.saveAddon(params, (results)=>{
				data = mergeObj([data, results]);
				return that.renderJson(data);
			});
        })
    }

    /**
     * 删除管理者用户信息
     */
    that.delManage = function(){
        var manage = that.model("Manage");
        manage.delManage(function(res){
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
            ps = that.testRenderJson(res, ps);
        })
		//保存付加表信息
		if(params.atag && params.acountid){
			ps ++;
			manage.saveAddon(params,(res)=>{
				ps = that.testRenderJson(res, ps);
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
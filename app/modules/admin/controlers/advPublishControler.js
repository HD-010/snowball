function advPublishControler(){
	var that = this;
	
	/**
	 * 查看任务列表
	 */
	this.tasks = function(){
		that.render({});
	}
	
	/**
	 * 添加任务计划
	 */
	this.tasksAdd = async function(){
		var data,params = {};
		
		var process = this.model('DataProcess');
		var classify = this.model("Classify");
		//获取设备分类数据
		params.ctag = "device";
		params.macid = process.getUserInfo()[0].groupId;
		params.enable = 1;
		data = objList(await classify.get(params), ["error", "classifyDevice"]);
		that.render(data);
	}
	
	/**
	 * 编辑任务计划
	 */
	this.tasksEdt = function(){
		that.render({});
	}
	
	/**
	 * 保存任务计划
	 */
	this.tasksSave = async function(){
		var params = {};
		var advPublish = that.model("AdvPublish");
		//保存任务列表
		var res = await advPublish.taskSave(params);
		if(res.error) return this.renderJson(res);
		//新增任务的id
		params.insertId = res.results.insertId;
		//保存执行任务的设备列表
		var res = await advPublish.deviceSave(params);
		if(res.error) return this.renderJson(res);
		//保存任务列表详情
		var res = await advPublish.taskDetailSave(params);
		if(res.error) return this.renderJson(res);
		var data = this.suc("保存任务成功");
		data.data = {taskId: params.insertId};
		
		return this.renderJson(data);
	}
	
	/**
	 * 任务状态管理
	 */
	this.tasksState = function(){
		that.render({});
	}
	
	/**
	 * 获取任务资源
	 */
	this.taskRes = async function(){
		var media = this.POST('mdeia');
		var size = this.POST('size');
		var params = {};
		var data = {
			error: 1,
			message: '参数错误'
		}
		if(!media || !size) return this.renderJson(data) ;
		size = cleanNull(size.match(/(\d*)/g));	
		if(size.length<2) return this.renderJson(data) ;
		params.ctag = "programs" + media;
		params.macid = this.model("DataProcess").getUserInfo()[0].groupId;
		params.enable = 1;
		params.media = media;
		var classify = this.model("Classify");
		var results = await classify.get(params);
		if(results.error) return that.renderJson(mergeObj([data, results]));
		//分类信息
		var classsify = JSON.parse(recodeBase64decode(results.results, 'classify'));
		//分类标识
		params.classify = treeValue(classsify, 'name', function(str){
			var reg = new RegExp(size[0]+"\\D*[\*x]\\D*"+size[1]);
			return str.match(reg) ? true : false;
		} , 'val');
		//如查分类标不存在，终止查询
		if(!params.classify.length) return that.renderJson(data);
		//查看符合分类的资源
		var publishModel = that.model('AdvPublish');
		results = await publishModel.resList(params);
		
		return that.renderJson({
			error: results.error || !results.results.length ? 1: 0,
			data: results.results
		});
	}
	
	/**
	 * 设备列表 
	 */
	this.deviceList = async function(){
		var params = {};
		var publishModel = that.model('AdvPublish');
		var process = this.model('DataProcess');
		params.macid = process.getUserInfo()[0].groupId;
		var device = await publishModel.deviceList(params);
		
		return this.renderJson(device);
	}
	
	
}

module.exports = advPublishControler;
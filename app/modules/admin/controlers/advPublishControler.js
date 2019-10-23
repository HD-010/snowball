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
	this.tasksAdd = function(){
		that.render({});
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
		var res = await advPublish.taskSave(params);
		if(res.error) return this.renderJson(res);
		params.insertId = res.results.insertId;
		var res = await advPublish.taskDetailSave(params);
		if(res.error) return this.renderJson(res);
		return this.renderJson(this.suc("保存任务成功"));
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
		
		this.model("Classify").get(params, async function(results){
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
		});
	}
	
	
}

module.exports = advPublishControler;
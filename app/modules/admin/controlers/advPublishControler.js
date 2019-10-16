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
		var params = {};
		var data = {
			error: 1,
			message: '参数错误'
		}
		if(!media) return this.renderJson(data) ;
		params.ctag = "programs" + media;
		params.macid = this.model("DataProcess").getUserInfo()[0].groupId;
		params.enable = 1;
		
		this.model("Classify").get(params, async function(results){
			if(results.error) that.renderJson(mergeObj([data, results]));
			var classsify = JSON.parse(recodeBase64decode(results.results, 'classify'));
			log("=====================classsify==", classsify);
			//params
			var publishModel = that.model('AdvPublish');
			var res = await publishModel.resList();
			that.renderJson(classsify)
		});
	}
	
	
}

module.exports = advPublishControler;
function AdvPublisModel(){
	var that = this;
	
	/**
	 * 查询任务列表
	 */
	this.taskList = async function(params){
		var conditions = {
			table: ["#@taskhives"],
			fileds: [],
			where: [],
			limit: [1],
		}
		if(!params.taskId) return this.err("参数错误：extaskList01");
		conditions.where.push("id=" + params.taskId);
		
		var res = await this.DB().syncGet(conditions);
		res = objList(res, ['error', 'results']);
		return res;
	}
	
	/**
	 * 查询任务明细列表
	 */
	this.taskDetail = async function(params){
		var conditions = {
			table: ["#@taskaddondetail"],
			fileds: [],
			where: []
		}
		if(!params.taskId) return this.err("参数错误：extaskList01");
		conditions.where.push("tid = " + params.taskId);
		var res = await this.DB().syncGet(conditions);
		res = objList(res, ['error', 'results']);
		
		return res;
	}
}

module.exports = AdvPublisModel
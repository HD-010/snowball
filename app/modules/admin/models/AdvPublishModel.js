function AdvPublishModel(){
	
	/**
	 * 获取资源列表
	 */
	this.resList = async function(params){
		var conditions = {
			table: ['#@archives as h'],
			where: [],
			joinOn: ''
		}
		//只查看可用的
		conditions.where.push("h.state='1'");
		conditions.where.push("(NOW() BETWEEN a.effecttime and a.overduetime)");
		conditions.where.push("a.views='" + params.classify + "'");
		conditions.joinOn = " left join #@addonprograms" + params.media + " as a on h.id = a.aid";
		return await this.DB().syncGet(conditions);
	}
}

module.exports = AdvPublishModel;
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
		
		conditions.where.push("a.views='" + params.classify + "'");
		conditions.joinOn = " left join #@addonprograms" + params.media + " as a on h.id = a.aid";
		return await this.DB().syncGet(conditions);
	}
}

module.exports = AdvPublishModel;
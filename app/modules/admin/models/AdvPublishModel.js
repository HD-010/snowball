function AdvPublishModel(){
	
	/**
	 * 获取资源列表
	 */
	this.resList = async function(){
		var media = this.POST('mdeia');
		var size = this.POST('size');
		var conditions = {
			table: ['#@archives as h'],
			where: [],
			joinOn: ''
		}
		
		conditions.where.push();
		conditions.joinOn = " left join #@addonprograms" + media + " as a on h.id = a.aid";
		return await this.DB().syncGet(conditions);
	}
}

module.exports = AdvPublishModel;
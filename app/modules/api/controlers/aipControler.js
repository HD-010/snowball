function aipControler(){
	var that = this;
	/**
	 * 通用文字识别
	 */
	this.general = function(){
		var data = {};
		//获取上传文件组件信息
		var oid = that.GET('oid') || that.POST('oid');
		data = mergeObj([data, that.model("File").upload({
		    oid: oid
		})]);
		that.render(data);
	}
}

module.exports = aipControler;
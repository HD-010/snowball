function deviceControler(){
	
	this.reg = function(){
		var data = {
			error: 0,
			message: "设备注册成功！",
			data:{
				id: 1598,
				sn: this.POST('id'),
				task: "jsonString"
			}
		}
		this.renderJson(data);
	}
	
}

module.exports = deviceControler
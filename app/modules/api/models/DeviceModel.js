function DeviceModel(){
	var that = this;
	
	
	/**
	 * 注册设备信息(主表)
	 * @param {Object} params
	 */
	this.registDeviceHives = async function(params){
		//设备UUID
		uuid = this.POST("uuid"),
		//设备序列号
		sn = this.POST("sn");
		if(!uuid) return this.err("参数错误：exuuid null")
		var conditions.fields. = {
			table: ["#@archives"],
			fields: []
		}
		var recoder = {}
		recoder.state = 1;
		recoder.title = sn;
		recoder.component = "device";
		recoder.groupid = this.POST("macid");
		conditions.fields.push(recoder);
		var res = await this.DB().syncSet(conditions);
		res = objList(res, ["error", "results"]);
		
		if(res.error || !res.results.insertId) return this.err("错误：exhives");
		return res;
		
	}
	
	/**
	 * 注册设备信息(付加表)
	 * @param {Object} params
	 */
	this.registDeviceAddon = function(params){
		//设备型号
		var mode = this.POST("mode"),
		//设备厂商
		vendor= this.POST("vendor"),
		//设备IMEI
		imei = this.POST("imei"),
		//设备UUID
		uuid = this.POST("uuid"),
		//设备序列号
		sn = this.POST("sn");
		if(!uuid) return this.err("参数错误：exuuid null")
		var conditions = {
			table: ["#@addondevice"],
			fields: []
		}
		var recoder = {}
		recoder.imei = imei;
		recoder.mode = mode; 									//系统版本
		recoder.vendor = vendor; 								//系统版本
		recoder.componentid = "device";
		recoder.aid = params.insertId;
		recoder.address = this.POST("address") : ''; 			//设备地址
		recoder.devicesize = this.POST("devicesize") : ''; 		//设备像素
		recoder.ioversion = this.POST("ioversion") : ''; 		//系统版本
		recoder.viewtype = this.POST("viewtype") : ''; 			//横竖屏
		recoder.ioversion = this.POST("ioversion") : ''; 		//系统版本
		conditions.fields.push(recoder);
		var res = await this.DB().syncSet(conditions);
		res = objList(res, ["error", "results"]);
		
		if(res.error || !res.results.insertId) return this.err("错误：exaddon");
		return res;
	}
	
	/**
	 * 注册设备（用户id）帐号
	 * @param {Object} params
	 */
	this.registDeviceAcount = function(params){
		var sn = this.POST("sn");
		if(!sn) return this.err("参数错误：exsn null");
		var conditions = {
			table: ["#@addondevice"],
			fields: []
		}
		var recoder = {};
		recoder.userName =sn; 
		recoder.password = "0x"; 
		recoder.addTime = 'NOW()';
		recoder.acount = sn + "@device.io"; 
		recoder.enable = this.POST("enable");
		recoder.groupid = this.POST("macid");
		conditions.fields.push(recoder);
		var res = await this.DB().syncSet(conditions);
		res = objList(res, ["error", "results"]);
		
		if(res.error || !res.results.insertId) return this.err("错误：exaccount");
		return res;
	}
}

module.exports = DeviceModel;
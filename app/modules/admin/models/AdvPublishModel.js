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
	
	/**
	 * 保存任务列表
	 */
	this.taskSave = async function(params){
		var conditions = {
			table: "#@taskhives",
			fields: [],
			where:[]
		}
		var fields = {};
		fields.title = this.POST('title');
		if(!fields.title) return this.err("任务名称不能为空！");
		fields.mode = this.POST('mode');
		if(!fields.mode) return this.err("任务执行方式不能为空！");
		fields.starttime = this.POST("!starttime");
		if(fields.mode == 'current')  fields.starttime = 'NOW()';
		fields.endtime = this.POST("!endtime");
		if(fields.mode == "fool" && !fields.endtime) return this.err("您制定了一个循环任务，必须其它指定任务结束时间！");
		fields.endtime = fields.endtime || ((fields.mode == 'current') ? 'NOW()' : fields.starttime);
		fields.playstart = this.POST('!playstart');
		fields.playdone = this.POST('!playdone');
		if(fields.mode == "time"){
			if(!fields.playstart.length) return this.err("请为您的节目列表指定播放开始时间！");
			if(!fields.playdone.length) return this.err("请为您的节目列表指定播放结束时间！");
		}
		fields.piecesn = this.POST('piecesn');
		if(!fields.piecesn) return this.err("没有选择屏幕分区方式，请选择！");
		if(!this.POST("tasklist")) return this.err("任务列表不能为空！");
		fields.state = this.POST('state') || 0;
		conditions.fields.push(fields);
		var res = await this.DB().syncSet(conditions);
		if(res.error) res.message = "faild:01，请尝试刷新后再添加任务！";
		
		return res;
	}
	
	/**
	 * 保存任务列表详情
	 */
	this.taskDetailSave = async function(params){
		var utility = require("utility");
		var conditions = {
			table: "#@taskaddondetail",
			fields: [],
			where:[]
		}
		var tasklist = this.POST("tasklist");
		if(!tasklist) return this.err("任务列表不能为空");
		tasklist = JSON.parse(decodeURI(utility.base64decode(tasklist)));
		
		tasklist.forEach(function(o, i){
			o.tid = params.insertId;
			o.style = JSON.stringify(o.style);
			o.list = JSON.stringify(o.list);
			conditions.fields.push(o);
		})
		
		return await this.DB().syncSet(conditions);
	}
	
	/**
	 * 保存执行任务的设备列表
	 */
	this.deviceSave = async function(params){
		var devicelist = this.POST('devicelist');
		if(!devicelist) return this.err("错误：ex0201");
		
		var conditions = {
			table: ["#@taskaddondevice"],
			fields: [],
		}
		var field = {};
		devicelist.split('-').forEach(function(o, i){
			field.tid = params.insertId;
			field.deviceid = o;
			conditions.fields.push(field);
		});
		
		var res = await this.DB().syncSet(conditions);
		if(res.error) return this.err("错误：ex0202");
		if(!res.results.insertId) return this.err("错误：ex0203");
		return res;
	}
	
	/**
	 * 获取设备列表 
	 */
	this.deviceList = async function(params){
		var classify = this.POST('classify');
		if(!classify) return err("错误：ex01 ");
		var conditions = {
			table: ["#@archives as h"],
			fields: ['h.*', 'a.*', 'c.id as deviceuid'],
			where: [],
			joinOn: ''
		}
		
		conditions.where.push("a.devicesize = '" + classify + "'");
		conditions.where.push("h.state = 1");
		conditions.where.push("h.groupid = " +  params.macid);
		conditions.joinOn = " left join #@addondevice as a on a.aid = h.id left join #@sys_acount as c ON concat( a.sn, '@device.io' ) = c.acount ";
		var res = await this.DB().syncGet(conditions);
		res.error = (res.erro || !res.results.length) ? 1 : 0;
		res = objList(res, ['error', 'data'])
		
		return res;
	}
}

module.exports = AdvPublishModel;
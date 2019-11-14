/**
 * 任务分发有两种方式：
 * 1 客户端请求分发
 * 2 服务器主动分发
 */
function taskControler() {
	var that = this;
	
	/**
	 * 默认播放列表
	 * 用于生成 初始播放列表
	 * 客户端请求分发（适应但不限于设备连接成功后，首次请求的任务列表）
	 */
	this.list = function() {
		//任务列表数据模型说明：
		var	data = {
			//任务请求状态0，成功；1失败
			error: 0,
			//任务请求状态描述
			message: "成功获取任务列表",  
			//type 请求类型标识， 可有以下值
			//task_list 要求执行任务列表
			//oper_play 要求屏幕执行播放
			//oper_play 要求屏幕停止播放
			type: "task_list",
			//任务识别信息
			unid: 0,
			taskId: 0,
			//任务持久标识persistent 可有以下值
			//true持久任务（永久或期限内），会被保存到客户端（应用场景：如执行完插播任务后，接着执行当前任务); 
			//false 插播任务,任务列表不会被保存到客户端
			persistent: false,
			//任务开始时间
			//0 表示永久不过期
			//限制时间段表示在这时间段内循环执行任务
			//可取具体时间|0, 如果开始时间大于0，但小于当前时间时，则执行当前列表任务
			//当同一时刻有多个任务列表有效时，执行最后一次下发的任务
			startTime: 0,
			//任务结束时间
			//可取具体时间|0, 如果开始时间大于0，但小于当前时间时，当前列表将被删除
			endTime: 0,
			//播放开始时间
			playStart: '13:00:00',
			//播放结束时间
			playDone: '15:23:00',
			//任务分区表
			list: [						
				//一区播放任务
				{
					//type 任务成员类型，可有以下值 
					//img  任务成员为图片
					//video 任务成员为视频。可支持本地视频(mp4/flv)，网络视频地址（mp4/flv/m3u8）及流媒体（rtmp/hls/rtsp）
					//notice
					type: 'img', //播放图片
					//taskTag 任务成员标识
					taskTag: 't1',
					//style 任务成员样式
					style: {width:'20%',height:'33.3%',right:0},
					//enable 任务成员是否启用，
					//true 启用，客户端展示当前成员
					//false 不启用，客户端不展示当前成员
					enable: true,
					//style 任务成员元素列表
					list: [
						{
							//资源地址
							url:'/img/01.png',	
							//播放时长（单位：秒）
							duration: 2  			
						},
						{
							url:'/img/02.png',
							duration: 2  			
						},
						{
							url:'/img/03.png',
							duration: 2
						}
					]
				},
				//一区播放任务
				{
					type: 'img', //播放图片
					taskTag: 't4',
					style: {width:'20%',height:'33.3%',right:0,top:'33.3%'},
					enable: true,
					list: [
						{
							url:'/img/02.png',
							duration: 2
						},
						{
							url:'/img/03.png',		//资源地址
							duration: 2  			//播放时长（单位：秒）
						},
						{
							url:'/img/01.png',
							duration: 2  			
						}
					]
				},
				//一区播放任务
				{
					type: 'img', //播放图片
					taskTag: 't5',
					style: {width:'20%',height:'33.3%',right:0,top:'66.6%'},
					enable: true,
					list: [
						{
							url:'/img/03.png',
							duration: 2  			
						},
						{
							url:'/img/01.png',		//资源地址
							duration: 2  			//播放时长（单位：秒）
						},
						{
							url:'/img/02.png',
							duration: 2
						}
					]
				},
				//二区播放任务
				/**
				 * 视频播放数据模型
				 * 样式说明: 客户端定位position: static
				 */
				{
					type: 'video', //播放图片
					taskTag: 't2',
					style: {'height':'80%', 'width':'80%'},
					enable: true,
					list: [
						{
							url:'/video/01.mp4',
							duration: 20
						},
						{
							url:'/video/02.mp4',
							duration: 25
						},
						{
							url:'/video/03.mp4',
							duration: 10
						}
					]
				},
				//三区播放任务
				{
					type: 'notice', //播放图片
					taskTag: 't3',
					style: {'height':'20%', 'width':'80%','top':'80%'},
					enable: true,
					list: [
						{
							title:'祝70周年国庆',
							content:'中华人民共和国万岁！中华人民共和国万岁！',
							duration: 20
						},
						{
							title:'祝70周年国庆2',
							content:'中华人民共和国万岁,万岁！',
							duration: 20
						},
						{
							title:'祝70周年国庆3',
							content:'中华人民共和国万岁,万岁,万万岁！',
							duration: 20
						}
					]
				}
			]
		}
	
		this.renderJson(data);
	}
	
	/**
	 * 服务端主动发送任务列表
	 * 用于发送： 插播广告， 轮播广告任务，定时轮播广告任务，限期定时轮播广告任务
	 */
	this.sendTask = async function(){
		var params = {}
		params.mode = "current";
		params.unid = this.POST('unid');
		params.taskId = this.POST('taskId');
		if(!params.taskId) return this.renderJson(this.err("参数错误：extaskId"));
		//接收任务的客户端id
		params.deviceId = this.POST('deviceId');
		if(!params.deviceId) return this.renderJson(this.err("参数错误：exdeviceId"));
		params.deviceId = params.deviceId.split("-");
		console.log("========发送给devices:", params.deviceId);
		console.log("========在线devices uniClients:", uniClients);
		
		//分派到广告屏客户端
		var data = {
			//任务请求状态0，成功；1失败
			error: 0,
			//任务请求状态描述
			message: "成功获取任务列表",  
			//任务识别信息
			unid: params.unid,
			taskId: params.taskId,
			//type 请求类型标识， 可有以下值
			//task_list 要求执行任务列表
			//oper_play 要求屏幕执行播放
			//oper_play 要求屏幕停止播放
			type: "task_list",
			//任务持久标识persistent 可有以下值
			//true持久任务，会被保存到客户端（应用场景：如执行完插播任务后，接着执行当前任务); 
			//false 插播任务,任务列表不会被保存到客户端
			persistent: false,
			//任务开始时间
			//0 表示永久不过期
			//限制时间段表示在这时间段内循环执行任务
			//可取具体时间|0, 如果开始时间大于0，但小于当前时间时，则执行当前列表任务
			//当同一时刻有多个任务列表有效时，执行最后一次下发的任务
			startTime: 0,
			//任务结束时间
			//可取具体时间|0, 如果开始时间大于0，但小于当前时间时，当前列表将被删除
			endTime: 0,
			//播放开始时间(只适用于定时任务)
			playStart: 0,
			//播放结束时间（只适用于定时任务）
			playDone: 0,
			//任务分区表
			list: []
		}
		//查询任务列表
		var publisher = this.model("AdvPublis");
		var task = await publisher.taskList(params);
		if(task.error) return this.renderJson(task);
		data.startTime = task.results[0].starttime;
		data.endTime = task.results[0].endtime;
		if(task.results[0].mode == 'current') data.persistent = false;
		if(task.results[0].mode == 'fool') data.persistent = true;
		data.startTime = this.checkDate(task.results[0].starttime, '1970');
		data.endTime = this.checkDate(task.results[0].endtime, '1970');
		data.playStart = this.checkTime(task.results[0].playstart, '00:00:00');
		data.playDone = this.checkTime(task.results[0].playdone, '00:00:00');
		//查询任务详情
		var taskDetail = await publisher.taskDetail(params);
		if(taskDetail.error) return this.renderJson(taskDetail);
		
		for(var i = 0; i < taskDetail.results.length; i ++){
			var list = {};
			list.type = taskDetail.results[i].type;
			list.taskTag = taskDetail.results[i].taskTag;
			eval(('list.style = '+taskDetail.results[i].style));
			list.enable = (taskDetail.results[i].enable == 1) ? true : false;
			list.list = JSON.parse(taskDetail.results[i].list.replace(/\s/g, ''));
			data.list.push(list);
		}
		
		console.log("=++++++++data+++++++：",data, "|mode|:", task.results[0].mode);
		//this.sendClients({error: 0, message: '正在向客户端发送任务...'})
		return this.sendClients(data, params.deviceId);
		//this.sendClients({error: 0, message: '向客户端发送任务己完成！'})
	}
	
	/**
	 * 定时任务
	 * 用于发送： 定时播放任务
	 */
	this.sendTaskTimeout = async function(){
		var params = {}
		params.mode = "current";
		params.unid = this.POST('unid');
		params.taskId = this.POST('taskId');
		if(!params.taskId) return this.renderJson(this.err("参数错误：extaskId"));
		//接收任务的客户端id
		params.deviceId = this.POST('deviceId');
		if(!params.deviceId) return this.renderJson(this.err("参数错误：exdeviceId"));
		params.deviceId = params.deviceId.split("-");
		console.log("========发送给devices:", params.deviceId);
		console.log("========在线devices uniClients:", uniClients);
		
		//分派到广告屏客户端
		var data = {
			//任务请求状态0，成功；1失败
			error: 0,
			//任务请求状态描述
			message: "成功获取任务列表",  
			//任务识别信息
			unid: params.unid,
			taskId: params.taskId,
			//type 请求类型标识， 可有以下值
			//task_list 要求执行任务列表
			//oper_play 要求屏幕执行播放
			//oper_play 要求屏幕停止播放
			type: "task_list",
			//任务持久标识persistent 可有以下值
			//true持久任务，会被保存到客户端（应用场景：如执行完插播任务后，接着执行当前任务); 
			//false 插播任务,任务列表不会被保存到客户端
			persistent: false,
			//任务开始时间
			//0 表示永久不过期
			//限制时间段表示在这时间段内循环执行任务
			//可取具体时间|0, 如果开始时间大于0，但小于当前时间时，则执行当前列表任务
			//当同一时刻有多个任务列表有效时，执行最后一次下发的任务
			startTime: 0,
			//任务结束时间
			//可取具体时间|0, 如果开始时间大于0，但小于当前时间时，当前列表将被删除
			endTime: 0,
			//播放开始时间(只适用于定时任务)
			playStart: 0,
			//播放结束时间（只适用于定时任务）
			playDone: 0,
			//任务分区表
			list: []
		}
		//查询任务列表
		var publisher = this.model("AdvPublis");
		var task = await publisher.taskList(params);
		if(task.error) return this.renderJson(task);
		data.startTime = this.checkDate(task.results[0].starttime, '1970');
		data.endtime = this.checkDate(task.results[0].endtime, '1970');
		data.playStart = this.checkTime(task.results[0].playstart, '00:00:00');
		data.playDone = this.checkTime(task.results[0].playdone, '00:00:00');
		//查询任务详情
		var taskDetail = await publisher.taskDetail(params);
		if(taskDetail.error) return this.renderJson(taskDetail);
		
		for(var i = 0; i < taskDetail.results.length; i ++){
			var list = {};
			list.type = taskDetail.results[i].type;
			list.taskTag = taskDetail.results[i].taskTag;
			eval(('list.style = '+taskDetail.results[i].style));
			list.enable = (taskDetail.results[i].enable == 1) ? true : false;
			list.list = JSON.parse(taskDetail.results[i].list.replace(/\s/g, ''));
			data.list.push(list);
		}
		
		console.log("=++++++++发布的定时任务数据+++++++：",data, "|mode|:", task.results[0].mode);
		//this.sendClients({error: 0, message: '正在向客户端发送任务...'})
		return this.sendClients(data, params.deviceId);
	}
	
	/**
	 * 验证字符串str是否包含sstr， 如果是则返回0，否则返回str
	 * @param {Object} str
	 * @param {Object} sstr
	 */
	this.checkDate = this.checkTime = function(str, sstr){
		console.log(str);
		if(str.toString().indexOf(sstr) > -1) return 0;
		return str;
	}
	
	
}

module.exports = taskControler

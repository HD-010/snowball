/**
 * 任务分发有两种方式：
 * 1 客户端请求分发
 * 2 服务器主动分发
 */
function taskControler() {
	var that = this;
	/**
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
			//任务持久标识persistent 可有以下值
			//true持久任务，会被保存到客户端（应用场景：如执行完插播任务后，接着执行当前任务); 
			//false 插播任务,任务列表不会被保存到客户端
			persistent: true,
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
							url:'/video/04.mp4',
							duration: 180
						},
						{
							url:'/video/02.mp4',
							duration: 180
						},
						{
							url:'/video/03.mp4',
							duration: 180
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
		
		//分派到广告屏客户端
		var data = {
			//任务请求状态0，成功；1失败
			error: 0,
			//任务请求状态描述
			message: "成功获取任务列表",  
			//type 请求类型标识， 可有以下值
			//task_list 要求执行任务列表
			//oper_play 要求屏幕执行播放
			//oper_play 要求屏幕停止播放
			type: "task_list",
			//任务持久标识persistent 可有以下值
			//true持久任务，会被保存到客户端（应用场景：如执行完插播任务后，接着执行当前任务); 
			//false 插播任务,任务列表不会被保存到客户端
			persistent: false,
			//任务分区表
			list: []
		}
		//查询任务列表
		var publisher = this.model("AdvPublis");
		var task = await publisher.taskList(params);
		if(task.error) return this.renderJson(task);
		var taskDetail = await publisher.taskDetail(params);
		if(taskDetail.error) return this.renderJson(taskDetail);
		
		for(var i = 0; i < taskDetail.results.length; i ++){
			var list = {};
			list.type = taskDetail.results[i].type;
			list.taskTag = taskDetail.results[i].taskTag;
			list.style = taskDetail.results[i].style;
			list.enable = (taskDetail.results[i].enable == 1) ? true : false;
			list.list = JSON.parse(taskDetail.results[i].list.replace(/\s/g, ''));
			data.list.push(list);
		}
		
		// this.renderJson(data);
		this.sendClients(data)
		
	}
	
	/**
	 * 定时任务
	 */
	this.sendTaskTimeout = function(){
		var data = {
			error: 0,
			message: "服务端主动发送任务列表"
		}
		
		this.renderJson(data);
	}
	
	/**
	 * 定时循环任务
	 */
	this.sendTaskInterval = function(){
		var data = {
			error: 0,
			message: "服务端主动发送任务列表"
		}
		
		this.renderJson(data);
	}

}

module.exports = taskControler

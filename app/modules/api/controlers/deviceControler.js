function deviceControler(){
	/**
	 * 设备注册
	 * 1 将设备的以下信息写入表
	 * mode	设备型号
	 * vendor 设备厂商
	 * imei  设备IMEI
	 * uuid	设备UUID
	 * sn	设备序列号（以上信息的md5串）
	 * macid 高家id(在sys_acount表中以groupid存在)
	 */
	this.reg = async function(){
		var process = `/**
 * 视频播放器控制对象
 */
var player = {
	self: null,	  //video对象
	state: false, //当前播放状态
	/**
	 * 实例化播放器
	 */
	init: function() {
		player.self = new plus.video.VideoPlayer('video', {
			src: "",
			loop: true,
			autoplay: true,
			objectFit: "cover"
		});
		//监听播放事件
		player.self.addEventListener('play', function() {
			//updatePlaying(true);
		}, false);
		//监听暂停事件
		player.self.addEventListener('pause', function() {
			//updatePlaying(false);
		}, false)
		return player;
	}
}

/**
 * 业务逻辑处理器
 */
var process = {
	//所有任务主体，访问任务主体：$(process.tasks['t1'])。 't1' 为 'taskTag'
	tasks:{},  
	
	/**
	 * 暂存数据
	 * 被暂存的数据需要有 persistent = true 标识
	 */
	storTask: function(data){
		//alert(JSON.stringify(data));
		if(!data.persistent) return;
		setItem("task_list", data);
	},
	
	/**
	 * 读有效的任务列表
	 */
	readTask: function(){
		var taskList = getItem('task_list') || {};
		return taskList.list;
		
	},

	/**
	 * 处理任务列表的方法
	 * 接收到任务时，把任务列表储存起来，供后续调用（如执行插播任务后再次调用任务列表）
	 * @param {Object} data
	 */
	task_list: function(data) {
		//任务主体
		var task;	
		data = data || process.readTask(); //优先执行插播任务的任务列表
		if(!data){
			setTimeout(function(){
				app.notice({error: 1, message:"播放任务为空！"});
			}, 3000)
			return;
		} 
		$("#contents").html('');
		for (var i = 0; i < data.length; i++) {
			if (!data[i].enable) continue;
			!data[i].type in process
			eval(('var typeFunc = ' + data[i].type))
			if(typeof typeFunc != 'function') continue;
			//将任务内容装到任务主体
			task = $(views[data[i].type])[0].outerHTML;
			//加载附加样式
			task= $(task).attr('data-tag', data[i].taskTag); 
			if(data[i].style) task.css(data[i].style);
			//将任务主体索引到任务主体对象列表
			$("#contents").append(task);
			//实现媒体功能
			process.tasks[data[i].taskTg] = new typeFunc();
			process.tasks[data[i].taskTg].lists = data[i];
			process.tasks[data[i].taskTg].play();
		}  
	}
};

/**
 * 消息任务执行成员
 */
function notice(){
	var me = this;
	this.lists ={};
	//节目序号
	this.num = 0;

	this.play = function(){
		var obj = this.lists;
		//视频播放列表
		var title = obj.list[this.num].title;
		var content = obj.list[this.num].content;
		$('[data-tag=' + obj.taskTag + ']').find('.icon-notice').html(title);
		$('[data-tag=' + obj.taskTag + ']').find('.noticeText').html(content);
		setTimeout(function(){
			me.play(obj);
		},obj.list[this.num].duration * 1000);
		if(this.num == obj.list.length-1){
			//如果当前执行的不是循环任务列表，则重新执行循环任务列表的任务
			if(!process.persistent) return process.task_list();
			return this.num = 0;
		}
		this.num ++;
	}
}

/**
 * 视频任务执行成员
 */
function video(){
	var me = this;
	player.init();
	this.lists = {};
	//节目序号
	this.num = 0;
	//播放列表
	this.play = function() {
		//视频播放列表
		var obj = this.lists;
		var url = obj.list[this.num].url;
		if (url && url.length > 0) {
			if (!url.match(/(http:)|(https:)/)) url = conf.host + url;
			player.self.setOptions({
				src: url
			});
			player.self.play();
		}
		setTimeout(function(){
			me.play(obj);
		},obj.list[this.num].duration * 1000);
		if(this.num == obj.list.length-1){
			//如果当前执行的不是循环任务列表，则重新执行循环任务列表的任务
			if(!process.persistent) return process.task_list();
			return this.num = 0;
		} 
		this.num ++;
	}
}

/**
 * 图片任务执行成员
 */
function img(){
	var me = this;
	this.lists = {};
	//节目序号
	this.num = 0;
	this.play = function(){
		var obj = this.lists;
		//视频播放列表
		var url = obj.list[this.num].url;
		if (url && url.length > 0) {
			if (!url.match(/(http:)|(https:)/)) url = conf.host + url;
			$('[data-tag=' + obj.taskTag + ']').find('img').attr('src',url);
		}
		setTimeout(function(){
			me.play(obj);
		},obj.list[me.num].duration * 1000);
		if(this.num == obj.list.length-1){
			//如果当前执行的不是循环任务列表，则重新执行循环任务列表的任务
			if(!process.persistent) return process.task_list();
			return this.num = 0;
		} 
		this.num ++;
	}
}`;
		
		var params = {};
		params.component = 52;
		//将设备信息写入设备信息表
		var device = this.model("Device");
		//注册设备信息(主表)
		var regRes = await device.registDeviceHives(params);
		if(regRes.error) return this.sendClients(regRes);
		params.insertId = regRes.results.insertId;
		//注册设备信息(付加表)
		regRes = await device.registDeviceAddon(params);
		log(regRes);
		if(regRes.error) return this.sendClients(regRes);
		//注册设备（用户id）帐号
		regRes = await device.registDeviceAcount(params);
		if(regRes.error) return this.sendClients(regRes);
		var data = {
			error: 0,			//代号说明：0注册成，1注册失败，2已经注册过
			message: ["设备注册成功！","设备注册失败，尝试重新启动设备再次注册","访问受权成功"],
			data:{
				id: regRes.results.insertId,
				sn: this.POST('sn'),
				process: process
			}
		}
		
		console.log("======================)))：", data);
		this.renderJson(data);
	}
	
}

module.exports = deviceControler
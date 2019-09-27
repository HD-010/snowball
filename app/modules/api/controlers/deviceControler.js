function deviceControler(){
	
	this.reg = function(){
		var process = `{
	//所有任务主体，访问任务主体：$(process.tasks['t1'])。 't1' 为 'taskTag'
	tasks:{},  
	//视频任务执行成员
	video: {
		//初始化播放器
		init: function() {
			// 创建视频播放控件
			player.init();
			return process.video;
		},
		//播放列表
		play: function(obj) {
			//alert("正在播放..."+JSON.stringify(obj))
			//视频播放列表
			var url = obj[0].url;
			//alert(url)
			if (url && url.length > 0) {
				if (!url.match(/(http:)|(https:)/)) url = conf.host + url;
				player.self.setOptions({
					src: url
				});
				player.self.play();
			}
		}
	},
	//图片任务执行成员
	img: {
		init: function(){
			return process.img;
		},
		play: function(obj){
			
		}
	},
	//消息任务执行成员
	notice: {
		init: function(){
			return process.img;
		},
		play: function(obj){
			
		}
	},
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
		data = process.readTask() || data;
		if(!data){
			setTimeout(function(){
				app.notice({error: 1, message:"播放任务为空！"});
			}, 3000)
			return;
		} 
		$("#contents").html('');
		for (var i = 0; i < data.length; i++) {
			//将任务内容装到任务主体
			task = $(views[data[i].type]);
			//将任务主体索引到任务主体对象列表
			process.tasks[data[i].taskTag] = task;  
			$("#contents").append(task);
			//实现媒体功能
			if (data[i].type in process) process[data[i].type].init({}).play(data[i].list);
		}
		
	}
}`;
		var data = {
			error: 0,
			message: "设备注册成功！",
			data:{
				id: 1598,
				sn: this.POST('id'),
				process: process
			}
		}
		
		this.renderJson(data);
	}
	
}

module.exports = deviceControler
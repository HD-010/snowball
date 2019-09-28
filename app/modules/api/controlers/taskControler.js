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
			error: 0,					//任务请求状态0，成功；1失败
			message: "成功获取任务列表",  //任务请求状态描述
			type: "task_list",			//请求类型标识
			persistent: true,			//true持久任务，会被保存到客户端（应用场景：如执行完插播任务后，接着执行当前任务); fals 插播任务
			list: [						//任务列表
				//一区播放任务
				{
					type: 'img', //播放图片
					taskTag: 't1',
					style: "",
					enable: true,
					list: [
						{
							url:'/img/01.png',		//资源地址
							duration: 2  			//播放时长（单位：秒）
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
					style: '',
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
					style: '',
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
				{
					type: 'video', //播放图片
					taskTag: 't2',
					style: "",
					enable: true,
					list: [
						{
							url:'/video/01.mp4',
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
					style: '',
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
				},
				//三区播放任务
				{
					type: 'notice', //播放图片
					taskTag: 't6',
					style: '',
					enable: true,
					list: [
						{
							title:'祝70周年国庆4',
							content:'中华人民共和国万岁！中华人民共和国万岁！',
							duration: 20
						},
						{
							title:'祝70周年国庆5',
							content:'中华人民共和国万岁,万岁！',
							duration: 20
						},
						{
							title:'祝70周年国庆6',
							content:'中华人民共和国万岁,万岁,万万岁！',
							duration: 20
						}
					]
				}
			]
		}
		this.renderJson(data);
	}

}

module.exports = taskControler

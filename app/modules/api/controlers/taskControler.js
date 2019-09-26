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
		var	data = {
			error: 0,
			message: "成功获取任务列表",
			msgType: "task_list",
			list: [
				//一区播放任务
				{
					type: 'img', //播放图片
					taskTag: 't-1',
					style: '',
					list: [
						{url:'/img/01.jpg'},
						{url:'/img/02.jpg'},
						{url:'/img/03.jpg'}
					]
				},
				//二区播放任务
				{
					type: 'video', //播放图片
					taskTag: 't-2',
					style: '',
					list: [
						{url:'/video/01.mp4'},
						{url:'/video/02.mp4'},
						{url:'/video/03.mp4'}
					]
				},
				//三区播放任务
				{
					type: 'notice', //播放图片
					taskTag: 't-3',
					style: '',
					list: [
						{url:'/video/01.mp4}',
						{url:'/video/02.mp4}',
						{url:'/video/03.mp4}'
					]
				}
			]
		}
		this.renderJson(data);
	}

}

module.exports = taskControler

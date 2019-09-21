/*
 * @Description: In User Settings Edit
 * @Author: your name
 * @Date: 2019-08-27 17:09:11
 * @LastEditTime: 2019-08-27 17:33:16
 * @LastEditors: Please set LastEditors
 */
function FileModel(){
    var that = this;

    /**
     * 上传图片
     */
    this.upload = function(params){
        var data = {};
        // 获取前端逻辑处理代码
        data.cropperView = that.plug('Uploads',{
            accept         : 'image/jpg,image/jpeg,image/png',     //在弹窗中可以选择的文件类型
            cropper_css    : '/stylesheets/lib/cropper.min.css',
            imgCropping_css: '/stylesheets/lib/ImgCropping.css',
            cropper_js     : '/javascripts/lib/cropper.min.js'
        }).cropperView;
        // 获取前端逻辑处理代码
        data.cropperAsync = that.plug('Uploads',{
            aspectRatio   : 1 / 1,           //默认比例
            viewMode      : 1,
            preview       : '.previewImg',   //预览视图
            guides        : true,            //裁剪框的虚线(九宫格)
            autoCropArea  : 0.8,             //0-1之间的数值，定义自动剪裁区域的大小，默认0.8
            movable       : true,            //是否允许移动图片
            dragCrop      : true,            //是否允许移除当前的剪裁框，并通过拖动来新建一个剪裁框区域
            movable       : true,            //是否允许移动剪裁框
            resizable     : false,           //是否允许改变裁剪框的大小
            zoomable      : true,            //是否允许缩放图片大小
            mouseWheelZoom: true,            //是否允许通过鼠标滚轮来缩放图片
            touchDragZoom : true,            //是否允许通过触摸移动来缩放图片
            rotatable     : true,            //是否允许旋转图片
            responsive    : false,
            crop          : function(e) {
                console.log(e)// 输出结果数据裁剪图像。
            },
            url: '/admin/upload/img?oid='+params.oid,   //上传图片的服务地址
        }).cropperAsync;
        return data;
    }

	/**
	 * 通用文字识别
	 */
	var generalBasic = function(params, callback){
		//新建一个AipOcrClient
		var AipOcrClient = require("baidu-aip-sdk").ocr;
		// 设置APPID/AK/SK
		var APP_ID = "17302357";
		var API_KEY = "7YpU4E20aabNI3W7KV5EUdFl";
		var SECRET_KEY = "24jaa8GcPqdSGdLvNtGC4nu92uBDwKxq";
		// 新建一个对象，建议只保存一个对象调用服务接口
		var client = new AipOcrClient(APP_ID, API_KEY, SECRET_KEY);
		
		//设置全局参数和全局请求拦截器的方法
		var HttpClient = require('baidu-qip-sdk').HttpClient;
		//设置request库的一些参数，例如代理服务地址，超时时间等
		HttpClient.setRequestOptions({timeout: 10000});
		HttpClient.setRequestInterceptor(function(requestOptions) {
		    // 查看参数
		    console.log(requestOptions)
		    // 修改参数
		    requestOptions.timeout = 10000;
		    // 返回参数
		    return requestOptions;
		});
		
		//用户向服务请求识别某张图中的所有文字
		var fs = require('fs');
		var image = fs.readFileSync("assets/example.jpg").toString("base64");
		// 调用通用文字识别, 图片参数为本地图片
		client.generalBasic(image).then(function(result) {
		    console.log(JSON.stringify(result));
			return callback(result);
		}).catch(function(err) {
		    // 如果发生网络错误
		    console.log(err);
		});
	}
}

module.exports = FileModel;
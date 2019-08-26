/*
 * @Description: In User Settings Edit
 * @Author: your name
 * @Date: 2019-06-15 14:22:07
 * @LastEditTime: 2019-08-26 17:51:25
 * @LastEditors: Please set LastEditors
 */
function componentControler(){
    var that = this;
    //展示所有应用
    this.index = function(){
        var component = that.model('Component');
        //获取组件列表
        component.list({},function(res){
            that.render(res);
        });
        
    }
    //添加应用
    this.add = function(){
        var data = {error: 0};
        // 获取前端逻辑处理代码
        data.cropperView = that.plug('Uploads',{
            accept         : 'image/jpg,image/jpeg,image/png',     //在弹窗中可以选择的文件类型
            cropper_css    : '/stylesheets/lib/cropper.min.css',
            imgCropping_css: '/stylesheets/lib/ImgCropping.css',
            cropper_js     : '/javascripts/lib/cropper.min.js'
        }).cropperView;
        // 获取前端逻辑处理代码
        var oid = that.GET('oid') || that.POST('oid');
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
            rotatable     : false,           //是否允许旋转图片
            responsive    : false,
            crop          : function(e) {
                console.log(e)// 输出结果数据裁剪图像。
            },
            url: '/admin/upload/img?oid='+oid,   //上传图片的服务地址
        }).cropperAsync;
        
        return that.render(data);
    }

    //编辑应用
    this.edit = function(){
        var cid = this.GET('cid');
        if(!cid) return this.render({},"/err404");
        var component = that.model('Component');
        //获取组件信息
        var param = {limit: 1,id: cid};
        component.list(param,function(res){
            
            that.render(res);
        });
    }

    //保存数据
    this.save = function(){
        var params = {};
        var data = {error: 1, message: ['恭喜，创建应用成功！', '错误，填写的参数有误！']};
        var ps = 1;
        var compponent = this.model("Component");
        params.comname = this.POST('comname') || '';
        params.icon = this.POST('icon') || '';
        params.nid = this.POST('nid') || '';
        if(!params.comname || !params.nid) return that.renderJson(data);
        //保存组件信息
        compponent.save(params, function(res){
            if(res.error) return that.renderJson(data);
            //创建与组件信息匹配的数据表
            params.comInfos = res.comInfos;
            compponent.create(params, function(res){
                data = mergeObj([data, res]);
                ps = that.testRenderJson(data, ps);
            });
        });

        if(this.POST('isadd')){
            //将组件管理写入菜单表
            ps ++;
            var menu = this.model("Menu");
            menu.add(params, function(res){
                data = mergeObj([data, res]);
                if(res.error) return renderJson(data);
                
                //将菜单id写入权限表
                that.model('Permit').add(res, function(res){
                    data = mergeObj([data, res]);
                    //ps = that.testRenderJson(data, ps);
                })
            })
            
        }
    }
}

module.exports = componentControler;
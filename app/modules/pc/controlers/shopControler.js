function shopControler(){
    /**
     * 解析店铺
     * 访问地址如：http://127.0.0.1:3005/snow/shop/parse?rid=2
     */
    this.parse = function(){
        var data = {};
        var self = this;
        var process = this.model('DataProcess');

       if (!this.GET('rid')) {
           this.renderJson({error:1});
           return;
       };

       this.model('Uri').parse({},(error,results,fields)=>{
            if(!error) {
                var uri = results[0].uri;
                //商家id
                process.setUserInfo(process.getQueryString(uri,'sid'),'SID');
                //首页地址
                uri = uri.substr(0,uri.indexOf('?'));

                return self.redirect(uri);
            }
            self.renderJson({error:1});
       });


    }

    /**
     * 生成店铺分享链接
     * get请求：http://127.0.0.1:3005/h5/shop/uri?&type=home&tpn=1&sid=2&tid=5&gid=5000&sk=苹果
     * params object 形式如：
     * {
        type: 'index',  //页面类型(home|list|detail)
        tpn: 1,         //模板id
        sid: 2,         //商家id
        tid: 5,         //商品分类id
        gid: 5000,      //商品id
        sk: '苹果'      //搜索关键字
        }
        如需要添加关键字请告知
     * return string 如：http://127.0.0.1:3005/h5/shop/parse?rid=1
     */
    this.uri = function(){
        var params = this.GET();
        var data = {error: 1,message: '分享的页面类型错误！'};
        var objKeys = Object.keys(params);
        var that = this;

        if(objKeys.indexOf('type') == -1) {
            this.renderJson(data);
            return;
        }
        if(parseInt(params.tpn) < 1){
            data.message = '分享的页面模板id不能为空！';
            this.renderJson(data);
            return;
        }
        
        if(parseInt(params.sid) < 1){
            data.message = '分享的页面商户id不能为空！';
            this.renderJson(data);
            return;
        }

        var uri = '/h5/shop/';
        uri += params.type + '?';

        for(var i = 0; i < objKeys.length; i ++){
            var key = objKeys[i];
            if(key === 'type' || key === 'h') continue;
            uri += key + '=' + params[key] + '&';
        }
        uri = uri.substr(0,uri.length-1);

        var cliUri = 'http://h5.ranyunkj.com/h5/shop/parse?rid=';

        that.model('Uri').add({uri:uri},function(error,results,fields){
            if(error) data.message = '写入数据失败';
            if(!error){
                data.error = 0;
                data.uri = cliUri + results.insertId;
                data.message = 'ok';
            }
            that.renderJson(data);
        });
    }

    /**
     * 商店列表页
     */
    this.home = function(){
        let data = {error:0,title:"商城首页"};
        let self = this;
        let process = this.model('DataProcess');
        data.sid = process.getUseInfo('SID');

        //获取视图模块配置
        data.viewModels = self.model('Template').pageModel();
        
        data.userInfo = process.getUseInfo();
        self.renderLayer(data);
    }


    /**
     * 商店列表页
     */
    this.list = function(){
        let data = {error:0,title:"商城首页"};
        let self = this;

        //获取视图模块配置
        data.viewModels = self.model('Template').pageModel();
        
        self.renderLayer(data);
    }

    /**
     * 商店详情页
     */
    this.detail = function(){
        let data = {error:0,title:"商城首页"};
        let that = this;

        //获取视图模块配置
        data.viewModels = that.model('Template').pageModel();
        
        
        that.renderLayer(data);
    }

    /**
     * 商店购物车
     */
    this.cart = function(){
        var data = {error:0,title:"商城首页"};
        var self = this;

        //获取视图模块配置
        data.viewModels = self.model('Template').pageModel();
        
        self.renderLayer(data);
    }

    /**
     * 联系客服
     */
    this.chat = function(){
        var data = {error:0,title:"联系客服"};
        var self = this;

        //获取视图模块配置
        data.viewModels = self.model('Template').pageModel();
        
        self.renderLayer(data);
    }

    /**
     * 余额充值
     */
    this.recharge = function(){
        var data = {error:0,title:"余额充值"};
        var self = this;

        //获取视图模块配置
        data.viewModels = self.model('Template').pageModel();
        
        self.renderLayer(data);
    }

    /**
     * 充值详情
     */
    this.rechargeDetail = function(){
        var data = {error:0,title:"充值详情"};
        var self = this;

        //获取视图模块配置
        data.viewModels = self.model('Template').pageModel();
        
        self.renderLayer(data);
    }

    /**
     * VIP
     */
    this.shopVip = function(){
        var data = {error:0,title:"VIP"};
        var self = this;

        //获取视图模块配置
        data.viewModels = self.model('Template').pageModel();
        
        self.renderLayer(data);
    }

    /**
     * 我的订单
     */
    this.order = function(){
        var data = {error:0,title:"我的订单"};
        var self = this;

        //获取视图模块配置
        data.viewModels = self.model('Template').pageModel();
        
        self.renderLayer(data);
    }

    /**
     * 确认订单
     */
    this.orderPay = function(){
        var data = {error:0,title:"确认订单"};
        var self = this;

        //获取视图模块配置
        data.viewModels = self.model('Template').pageModel();
        
        self.renderLayer(data);
    }
    
    /**
     * 商店订单详情
     */
    this.orderDetail = function(){
        var data = {error:0,title:"订单详情"};
        var self = this;

        //获取视图模块配置
        data.viewModels = self.model('Template').pageModel();
        
        self.renderLayer(data);
    }

    /**
     * 订单评价
     */
    this.orderEvaluate = function(){
        var data = {error:0,title:"订单评价"};
        var self = this;
        var params = {};
        params.cropperView = this.plug('Uploads',{
            accept         : 'image/jpg,image/jpeg,image/png',     //在弹窗中可以选择的文件类型
            cropper_css    : '/stylesheets/lib/cropper.min.css',
            imgCropping_css: '/stylesheets/lib/ImgCropping.css',
            cropper_js     : '/javascripts/lib/cropper.min.js'
        }).cropperView;
        // 获取前端逻辑处理代码
        params.cropperAsync = this.plug('Uploads',{
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
                console.log("=========AAAAAAAAAA:",e)// 输出结果数据裁剪图像。
            },
            url: '/h5/upload/img',   //上传图片的服务地址
        }).cropperAsync;

        //传入视图参数
        data.params = params;

        //获取视图模块配置
        data.viewModels = self.model('Template').pageModel();
        
        self.renderLayer(data);
    }
    
     /**
     * 商店分类页
     */
    this.type = function(){
        var data = {error:0,title:"商品分类页面"};
        var self = this;


        //获取视图模块配置
        data.viewModels = self.model('Template').pageModel();
        
        self.renderLayer(data);
    }
    
     /**
     * 个人中心页面
     */
    this.user = function(){
        var data = {error:0,title:"个人中心页面"};
        var self = this;
        

        //获取视图模块配置
        data.viewModels = self.model('Template').pageModel();
        
        self.renderLayer(data);
    }
    /**
     * 编辑个人中心页面
     */
    this.editUser = function(){
        var data = {error:0,title:"编辑个人中心页面"};
        var self = this;

        var params = {};
        params.cropperView = this.plug('Uploads',{
            accept         : 'image/jpg,image/jpeg,image/png',     //在弹窗中可以选择的文件类型
            cropper_css    : '/stylesheets/lib/cropper.min.css',
            imgCropping_css: '/stylesheets/lib/ImgCropping.css',
            cropper_js     : '/javascripts/lib/cropper.min.js'
        }).cropperView;
        // 获取前端逻辑处理代码
        params.cropperAsync = this.plug('Uploads',{
            aspectRatio   : 1 / 1,           //默认比例
            viewMode      : 2,
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
                console.log("=========AAAAAAA:",e)// 输出结果数据裁剪图像。
            },
            url: '/h5/upload/img',   //上传图片的服务地址
        }).cropperAsync;

        //传入视图参数
        data.params = params;

        //获取视图模块配置
        data.viewModels = self.model('Template').pageModel();
        
        self.renderLayer(data);
    }
     /**
     * 地址列表页面
     */
    this.addressList = function(){
        var data = {error:0,title:"地址列表页面"};
        var self = this;


        //获取视图模块配置
        data.viewModels = self.model('Template').pageModel();
        
        self.renderLayer(data);
    }
    /**
     * 地址添加页面
     */
    this.addAddress = function(){
        var data = {error:0,title:"地址列表页面"};
        var self = this;


        //获取视图模块配置
        data.viewModels = self.model('Template').pageModel();
        
        self.renderLayer(data);
    }
    /**
     * 地址编辑页面
     */
    this.editAddress = function(){
        var data = {error:0,title:"地址编辑页面"};
        var self = this;


        //获取视图模块配置
        data.viewModels = self.model('Template').pageModel();
        
        self.renderLayer(data);
    }
    
      /**
     * 个人卡卷中心
     */
    this.card = function(){
        var data = {error:0,title:"个人卡卷中心"};
        var self = this;


        //获取视图模块配置
        data.viewModels = self.model('Template').pageModel();
        
        self.renderLayer(data);
    }

    
	 /**
     * 我的收藏
     */
    this.collection = function(){
        var data = {error:0,title:"我的收藏"};
        var self = this;


        //获取视图模块配置
        data.viewModels = self.model('Template').pageModel();
        
        self.renderLayer(data);
    }

     /**
     * 申请退款
     */
    this.requestRefund = function(){
        var data = {error:0,title:"申请退款"};
        var self = this;
        var params = {};
        params.cropperView = this.plug('Uploads',{
            accept         : 'image/jpg,image/jpeg,image/png',     //在弹窗中可以选择的文件类型
            cropper_css    : '/stylesheets/lib/cropper.min.css',
            imgCropping_css: '/stylesheets/lib/ImgCropping.css',
            cropper_js     : '/javascripts/lib/cropper.min.js'
        }).cropperView;
        // 获取前端逻辑处理代码
        params.cropperAsync = this.plug('Uploads',{
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
                console.log("=========AAAAAAA:",e)// 输出结果数据裁剪图像。
            },
            url: '/h5/upload/img',   //上传图片的服务地址
        }).cropperAsync;

        //传入视图参数
        data.params = params;

        //获取视图模块配置
        data.viewModels = self.model('Template').pageModel();
        self.renderLayer(data);
    }
    
     /**
     * 退款/售后
     */
    this.refund = function(){
        var data = {error:0,title:"退款/售后"};
        var self = this;


        //获取视图模块配置
        data.viewModels = self.model('Template').pageModel();
        
        self.renderLayer(data);
    }

    /**
     * 商品列表
     */
    this.shopList = function(){
        var data = {error:0,title:"商品列表"};
        var self = this;


        //获取视图模块配置
        data.viewModels = self.model('Template').pageModel();
        
        self.renderLayer(data);
    }
    
     /**
     * 登录页面
     */
    this.login = function(){
        var self = this;
        var data = {error:0,title:"登录页面"};
        var process = this.model('DataProcess');
        if(this.GET('!usIfo')){
            process.setUserInfo(JSON.parse(this.GET('!usIfo')));
            var referer = process.getUseInfo('referer');
            
            self.redirect(process.beforLogin());// 有此用户  
            return;
        }
        
        //退出当前帐号时清除用户信息
        process.clearUserInfo();
        process.setUserInfo('referer',this.headers('referer'));
        //获取视图模块配置
        data.viewModels = self.model('Template').pageModel();
        
        self.renderLayer(data);
    }
     /**
     * 注册页面
     */
    this.reg = function(){
        var data = {error:0,title:"注册"};
        var self = this;


        //获取视图模块配置
        data.viewModels = self.model('Template').pageModel();
        
        self.renderLayer(data);
    }

      /**
     * 注册页面1
     */
    this.regg = function(){
        var data = {error:0,title:"注册1"};
        var self = this;


        //获取视图模块配置
        data.viewModels = self.model('Template').pageModel();
        
        self.renderLayer(data);
    }

    /**
     * 搜索商品页
     */
    this.search =function(){
        var data = {error:0,title:"商品页"};
        var self = this;

        //获取视图模块配置
        data.viewModels = self.model('Template').pageModel();
        
        self.renderLayer(data);
    }
}


module.exports = shopControler;
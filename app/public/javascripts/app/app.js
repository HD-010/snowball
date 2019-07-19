/** ==============================请求与接口=========================== */
/**
 * 该类配合autoLoad 类使用最佳
 */
var app = {
    datsync: $(document).find('[data-sync]'),           //获取同请求对象
    dataAsync: $(document).find('[data-async]'),        //获取对象
    dataAsyncPull: $(document).find('[data-async-pull]'),        //获取对象
    formAsync: $(document).find('[data-form-async]'),
    //表单项记忆对象
    formMemory: $(document).find('form'),
    action:'',
    //请求附加参数（在发起请求时自动加入）
    addonParams : {},
    host: (window.Hosts) ? Hosts[0] : '',

    /**
     * 接口驱动--同步请求 
     * 使用场景：当元素被点击时，将会跳转到 data-uri 指向的地址。data-uri 中的参数会被保存在sessionStorage对象中。
     * 当跳转到data-uri指向的页面时，会根据接口（加载此处存储的参数）请求数据
     * data-sync="get" 永远只有get有效（就使用场景来说）
     * 示列 <a href="#" class="" data-sync="get" data-uri="/admin/manager/addManager?">添加管理员</a>
     * @attr {data-sync} 必填属性 @param get或post 请求
     * @attr {data-uri}  必填属性 @param url 请求的方法或渲染页面的方法
     * @param {event} 事件监听 
     * @param {obj} 对象本身 
     * @param {callback} 回调函数 
     */
    syncProcess: function(event, obj, callback) {
        event.preventDefault(); //默认阻止提交
        var uri = $(obj).attr('data-uri');
        if(!uri.length) return;
        if(uri.indexOf("?") !== -1){
            uri += '&'+app.serializeParams();
            var data = uri.substr(uri.indexOf("?") + 1);
            data = this.parseQuery(data);
            var query_params = uri.substr(0,uri.indexOf("?"));
            var query_params = $.md5(query_params);
            sessionStorage.setItem(query_params,JSON.stringify(data));
        }else{
            uri += '?'+ app.serializeParams();
        }
        //return; 
        console.log("=====数据请求地址：",uri);
        location.href = uri;        
    },
    
    /**
     * 按钮--异步请求
     * 使用场景：
     * 当点击铵钮来异步删除数据时。操作成功或失败，显示提示信息页面不跳转时使用。
     * 请求方式：post | get
     * 示列 <a href="#" class="" data-async="post" data-uri="/admin/manager/del">删除管理员</a>
     * @attr {data-async} 必填属性 @param get或post 请求
     * @attr {data-uri}  必填属性 @param url 请求的方法或渲染页面的方法
     * @param {event} 事件监听 
     * @param {obj} 对象本身 
     * @param {callback} 回调函数 
     */
    asyncProcess: function(event, obj, callback) {
        event.preventDefault(); //默认阻止提交
        var meched = $(obj).attr('data-async').toLowerCase($(obj).attr('data-async'));  //获取提交方式
        var dataUri = $(obj).attr('data-uri');
        this.initAction(dataUri);
        var uri = app.host + dataUri;
        var type = $(obj).attr('data-type') || 'json';
        if(!uri.length) return false;
        uri += (uri.indexOf("?") != -1) ? "&" + app.serializeParams() : "?" + app.serializeParams();
        var vars = (uri.substr(uri.indexOf("?")+1)).split('&');
        var obj = {};
        for(var i=0;i<vars.length;i++){
            obj[vars[i].split("=")[0]]= vars[i].split("=")[1];
        }

        // var point = uri.indexOf('?');
        // var start = uri.lastIndexOf('/')+1;
        // app.action = (point != -1) ? uri.substr(start,point-start) : uri.substr(start);
        //判断是post提交还是个get提交
        console.log("=====数据请求地址：",uri);
        console.log("=====数据请求参数：",obj);
        $.ajax({
            url : uri,
            type : meched,
            data : obj,
            dataType : type,
            success : callback,
        });
    },

    /**
     * 示列 <a href="#" class="" data-async-pull="post" data-uri="/admin/manager/addManager">添加管理员</a>
     * @attr {data-async} 必填属性 @param get或post 请求
     * @attr {data-uri}  必填属性 @param url 请求的方法或渲染页面的方法
     * @param {event} 事件监听 
     * @param {obj} 对象本身 
     * @param {callback} 回调函数 
     */
    asyncProcessPull: function(event, obj, callback) {
        event.preventDefault(); //默认阻止提交
        var meched = $(obj).attr('data-async-pull').toLowerCase($(obj).attr('data-async-pull'));  //获取提交方式
        var uri    = app.host + $(obj).attr('data-uri');
        // var query = uri.search.substring(1);
        var vars = (uri.substr(uri.indexOf("?")+1)).split('&');
        var obj = {};
        for(var i=0;i<vars.length;i++){
       	    obj[vars[i].split("=")[0]]= vars[i].split("=")[1];
        }
      
        //return;
        if (!uri) {
            alert('请写入url');
            return false;
        }
        //判断是post提交还是个get提交
        if (meched == 'post') {
            console.log("=====数据请求地址：",uri);
            $.ajax({
                url : uri,
                type : 'post',
                data :  obj,
                dataType: 'json',
                success : callback
            });
        } else {
            alert('data-async-pull参数错误');
            return false;
        }
    },

    /**
     * 提交表单--异步请求
     * dataType : json
     * 示列 <form method="post"  data-form-async='json' action="/admin/index/form">
     * @attr {method} @param {post} 必填属性及参数
     * @attr {data-form-async}必写属性 @param {html/json} 必填参数 希望返回的格式是html还是json
     * @attr {action}必写属性 @param {url} 必填参数 请求的方法路劲
     * @param {event} 事件监听 
     * @param {obj} 对象本身 
     * @param {callback} 回调函数 
     * 用户可以自定义操作回调，与action对应的操作名称相同（多用于请求接口后的非统一回调）
     * 作为统一回调，不需要定义操作。函数会根据返回的json对象状态码在界面跳出提示信息
     * 返回对象格式如：
     * {
          error : 0 || 1 || 2 || 3,
          message : "提示信息内容,如果空则无提示信息",
          uri : "跳转到页面的uri,为空则重载当前面，没有当前属性则不做任何操作"
     * }
     */
    formProcess: function(event, obj, callback) {
        event.preventDefault(); //默认阻止提交
        //获取对象的提交方式及请求的url
        var action = $(obj).attr('action');
        var url = app.host + action;
        if (!url) {
            alert('请填写action属性的正确值');
            return false;
        }
        var method = $(obj).attr('method').toLowerCase($(obj).attr('method'));
        console.log("==-=-=-",method);
        if ((method != 'post') && (method != 'get')) {
            alert('请填写method属性的正确值:');
            return false;
        }
        var async = $(obj).attr('data-form-async').toLowerCase($(obj).attr('data-form-async'));
        if (async != 'html' && async != 'json') {
            alert('请填写data-form-async属性的正确值');
            return false;
        }
        this.initAction(action);
        // var point = action.indexOf('?');
        // var start = action.lastIndexOf('/')+1;
        // app.action = (point != -1) ? action.substr(start,point-start) : action.substr(start);
        
        //获取对象的值
        var formData = $(obj).serialize() + "&" + app.serializeParams();
        
        //console.log(formData)
        console.log("=====数据请求地址：",url);
        $.ajax({
            url     : url,
            type    : method,
            data    : formData,
            dataType: async,
            success : callback
        });

    },

    /**
     * 初始化请求附加参数
     * @param {*} obj 
     * @param {*} callback 
     */
    serializeParams: function(){
        return $.param(app.addonParams);
    },

    /**
     * 顶部提示信息
     * obj.message 提示消息
     * obj.uri 跳转的url
     * obj.error 显示对应提示的信息样式 错误编号notice_0 notice_1 notice_2 notice_3
     * function callback 
     */
    notice: function(obj, callback) {
        var box = {
            notice_0: '<div id="notice_0" class="alert alert-success" role="alert">' + obj.message + '</div>',
            notice_1: '<div id="notice_1" class="alert alert-warning" role="alert">' + obj.message + '</div>',
            notice_2: '<div id="notice_2" class="alert alert-info" role="alert">' + obj.message + '</div>',
            notice_3: '<div id="notice_3" class="alert alert-danger" role="alert">' + obj.message + '</div>',
            notice_4: '',
        }
        var order = obj.error || obj.errcode || 0;
        var notice = 'notice_' + obj.error;
        $('body').prepend($(box[notice]).css({
            'text-align': 'center',
            'position'  : 'fixed',
            'width'     : '100%',
            'z-index'   : 999999999999,
        }));
        setTimeout(function() {
            $("#" + notice).remove();
            if(typeof callback === 'function') return callback();
            if(obj.go) history.go(obj.go);
            if(obj.uri){
                obj.uri += !(obj.uri.indexOf('?')+1) ? 
                "?" + app.serializeParams() : 
                "&" + app.serializeParams();
                location.href = obj.uri;
            }
            if(!obj.uri && ('uri' in obj)) location.reload();
        }, 2000);
    },

    /**
     * 
     * @param {获取url参数} name 
     */
    getQueryString: function(name) { 
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i"); 
        var r = window.location.search.substr(1).match(reg); 
        if (r != null) return unescape(r[2]); 
        return null; 
    }, 

    /**
     * 将表单项的值存储到表单记忆
     * 作用场景：
     * 搜索框中键入关键字，提交请求后在刷新后的搜索框中显示请求前输入的内容
     * 使用方法：
     * 使用该方法不需要作任何处理，也不需要调用。它会表求监视表单提交。
     * 在恢复显示时需要作唯一的处理就是，当value没有值时，将其设置为' '。注意这是一个空格
     */
    memory: function(){
        app.formMemory.submit(function(){
            $(app.formMemory).find('input').each(function(item,value){
                sessionStorage.setItem($(value).attr('name'),$(value).val());
            });
            $(app.formMemory).find('select').each(function(item,value){
                sessionStorage.setItem($(value).attr('name'),$(value).val());
            });
            $(app.formMemory).find('textarea').each(function(item,value){
                sessionStorage.setItem($(value).attr('name'),$(value).val());
            });
        });
    },

    /**
     * 恢复表单记忆值
     * 会自动配合memory方法使用
     */
    remember: function(){
        $(app.formMemory).find('input').each(function(item,value){
            var key = $(value).attr('name');
            if($(value).val() === ' '){
                $(value).val(sessionStorage.getItem(key));
            }
        });
        $(app.formMemory).find('select').each(function(item,value){
            var key = $(value).attr('name');
            if($(value).val() === ' '){
                $(value).val(sessionStorage.getItem(key));
            }
        });
    },

    /**
     * 初始化action名称
     */
    initAction: function(dataUri){
        var firstLine,firstQ,router;
        var lastPoint = dataUri.lastIndexOf('.'); //用于判断有没有.com 类似的字符串
        dataUri = (lastPoint == -1) ? dataUri : dataUri.substr(lastPoint);
        firstLine = dataUri.indexOf('/');
        firstQ = dataUri.indexOf('?');
        if(firstQ == -1) firstQ = dataUri.length;
        dataUri = dataUri.substr(firstLine + 1, firstQ - firstLine - 1);
        router = dataUri.split('/');
        this.action = (router.length % 2) ? router[2] : router[1];
    },

    /**
     * 调用：
        parseQuery("userID=JeoOrCXxyiOFxbYaGL40kw==&userPwd=sdFo2ziUw8HyLRKd4i6GAQ==&userName=高聪")
        返回:{}
     * @param {"请求参数，不带?"} query 
     */
    parseQuery : function (query) {
        var reg = /([^=&\s]+)[=\s]*([^&\s]*)/g;
        var obj = {};
        var temp;
        while (reg.exec(query)) {
            if((RegExp.$1 in obj) && (typeof obj[RegExp.$1] != 'object')){
                temp = obj[RegExp.$1];
                obj[RegExp.$1] = [];
                obj[RegExp.$1].push(temp);
            }
            (RegExp.$1 in obj) ? 
            obj[RegExp.$1].push(RegExp.$2) :
            obj[RegExp.$1] = RegExp.$2;
        }
        return obj;
    },

    /**
     * 绑定相关事件
     */
    load : function(el){
        el = (typeof el === 'string') ? el : document;
        // 记忆表单项
        app.memory();
            
        // 恢复表单项记忆
        app.remember();
        //异步请求
        
        $(el).find('[data-async]').unbind('click').on('click',function(event) {
            app.asyncProcess(event, this, function(res) {
                //调用用户义的与操作名称同名的回调函数
                try{eval((app['action'] + '(res);'));}catch(err){
                    app.notice(res);
                }
            });
        });

        //同步请求
        $(el).find('[data-sync]').unbind('click').on('click',function(event) {
            app.syncProcess(event, this, function(res) {});
        });

        //form表单提交不跳转
        $(el).find('[data-form-async]').unbind('submit').on('submit',function(event) {
            event.preventDefault();
            app.formProcess(event, this, function(res) {
                //调用用户义的与操作名称同名的回调函数
                try{eval((app['action'] + '(res);'));}catch(err){
                    app.notice(res);
                }
            });
        });
    },

};
/** ===========================请求与接口 end========================= */

/** ===========================scroll事件监听========================= */
/**
     * 调用说明：
     * 该方法用于监测选定元素（默认）上边框距浏览器窗口上边框的距离（单位:px）
     * 用于业务调用的方法有 isUp（） 和 offset（）两个。
     * liscenScrolling(selector,border) 用于初始化该元素的滚动事件
     * selector： 元素的元素器，建议使用id告选择器：'#id',
     * border:指定是边框，可用top、bottom
     * isup(callback)方法用于判断页面是向上还是向下滚动，分别返加 8 和 2；
     * 当callback 是函数时，会在页面滚动时回调，传入的参数为8或2。
     * 
     * offset（data,callback）方法用于监测选定的元素（默认）上边框距浏览器窗口上边框的距离
     * 当data 为0 或不填写表示，选定的元素（默认）上边框距浏览器窗口上边框的距离为0时调用回调函数或返回true
     * 当data 为 +- number 表示，选定的元素（默认）上边框距浏览器窗口上边框的距离为+-number时调用回调函数或返回true
        调用案例1：
        var ls = new liscenScrolling("#s4");
        window.onscroll = function(e){
            console.log("方向：",ls.isUp(),"#s4临bottom：",ls.offset());   //方向： 8 #s4临bottom： true
        }
     * 
     * **/
    function liscenScrolling(selector,border) {
        this.border = border;
        this.element = $(selector);
        this.temData = [];
        this.nowOffset = null;

        //更新监听数据
        this.upData = function(){
            this.temData.push(this.nowOffset);
            if(this.temData.length > 2) this.temData.shift();
        }

        //验证最后加入的这个数，如果大于上次加入的那个数，
        //返回8表示页面向上滚动。用2表示页面向下滚动
        this.isUp = function(callback){
            this.liscening();
            if(typeof this.temData[0] != 'number') return false;
            //console.log(this.temData[1]);
            var arrow = (this.temData[1] > this.temData[0]) ? 2 : 8;
            if(typeof callback === 'function') return callback(arrow);
            
            return arrow
        }

        //边框是否刚好与视窗边界对齐 top | bottom
        this.offset = function(data,callback){
            data = (typeof data === 'number') ? data : 0;

            //遇到临界点，越减数的绝对值越大
            if(Math.abs(this.temData[0] - data) <= Math.abs(this.temData[1] - this.temData[0])){
                if(typeof callback === 'function') return callback();
                return true;
            }
        }

        //监听滚动事件
        this.liscening = function(){
            var elementHeight = 0;
            if(this.border === 'bottom') elementHeight = this.element.height();
            this.nowOffset = (this.element.offset().top + elementHeight) - $(document).scrollTop();
            this.upData();
        }

        return this;
    }
/** ===========================scrool事件监听 end====================== */

/** ==============================效果插件============================= */
var effect = {
    /**
     * 开关效果
     * html 代码 ：<label><input class="mui-switch mui-switch-anim" type="checkbox" checked><em></em></label> 
     * 属性 checked 表示默认打开状态
     * @param {*} selecter 事件监听的元素
     * @param {*} on 打开状态显示的字样
     * @param {*} off 关闭状态显示的字样
     */
    switch: function(selecter,onVal,offVal){
        var cl  = $(selecter);
        for(var i=0;i<cl.length;i++){
            if(cl[i].checked){
                cl[i].nextSibling.innerText = onVal;
                cl[i].nextSibling.style.color = "#FFFFFF";
                cl[i].nextSibling.style.marginLeft = '0px';
            }else{
                cl[i].nextSibling.innerText = offVal;
                cl[i].nextSibling.style.color="#D2D2D2";
                cl[i].nextSibling.style.marginLeft='16px';
            }
        }
        cl.unbind('click').on('click',function(){
            if(this.checked){
                this.nextSibling.innerText = onVal;
                this.nextSibling.style.color = "#FFFFFF";
                this.nextSibling.style.marginLeft = '0px';
            }else{
                this.nextSibling.innerText = offVal;
                this.nextSibling.style.color = "#D2D2D2";
                this.nextSibling.style.marginLeft='16px';                
            }
        })
    },

    /**
     * 显示默认值
     * html代码结构：
        <input type="text" class="form-control" name="title" data-def="默认值" placeholder="标题" value=" "/>
     * 
     */
    setDefVal: function(selecter){
        selecter = selecter || document;
        $(selecter).find('input').each(function(index,item){
            var defVal = $(item).attr('data-def'); 
            if(typeof defVal != 'undefined') $(item).val(defVal);
        });
    },

    /**
     * 设置注释
     * html代码结构：
     *  <parent>
            <div class="form-group col-xs-4">
                <input type="text" class="form-control" name="title" data-comments="注释内容" placeholder="标题" value=" "/>
            </div>
            <span style="line-height: 40px;"><i class="iconfont icon-tishi comment" style="color: #1C66A7;"></i>&nbsp;如：新闻</span>
        </parent>
     * 
     */
    setComments: function(selecter){
        selecter = selecter || document;
        $(selecter).find('input').each(function(index,item){
            var comment = $(item).attr('data-comment'); 
            if(typeof comment != 'undefined') $(item).parent().siblings().find('.comment').after(comment);
        });
    },

    /**
     * 设置checkbox选项
     * @param {*} selecter 
     * html代码结构：
     *  <div class="btn-group 监听的选择器" data-toggle="buttons">
            <label class="btn btn-outline btn-success dim">
                <input type="checkbox" data-key='选项1val-选项2val' data-val='选项1名称-选项2名称' > 注册会员<i class="fa fa-check"></i><!--<i class="fa fa-times"></i>-->
            </label>                                   
        </div>
     */
    setCheckbox: function(selecter){
        if(!selecter) return;
        $(selecter).each(function(index,item){
            var itemAttr = $(item).find("input[type='checkbox']");
            var key = itemAttr.attr('data-key').split('-');
            var val = itemAttr.attr('data-val').split('-');
            var defVal = itemAttr.attr('data-def') ? itemAttr.attr('data-def').split('-') : [];
            var htmlCode = item.outerHTML;
            var temCode = '';
            for(var i=0; i < key.length; i ++){
                var curCode = $(htmlCode);
                if(defVal.indexOf(key[i]) +1) curCode.find("input[type='checkbox']").parent().addClass('active');//.prop('checked',true);
                curCode.find("input[type='checkbox']").val(key[i]);
                curCode.find("input[type='checkbox']").after(val[i]);
                
                temCode += curCode[0].outerHTML;
            }
            $(item).replaceWith(temCode);
            loadEvent();
        });
        function loadEvent(){
            $('[data-toggle="buttons"] .btn').unbind('click').on('click',function(e){
                var curCheckbox = $(this).find('[type="checkbox"]');
                curCheckbox.click();
                (curCheckbox.prop('checked')) ?
                $(this).addClass('active'):
                $(this).removeClass('active');
            });
        }
    },

    /**
     * 
     * @param {*} selecter 
     */
    setRadio: function(selecter){
        if(!selecter) return;
        $(selecter).each(function(index,item){
            var itemAttr = $(item).find("input[type='radio']");
            var dataKey = itemAttr.attr('data-key');
            var key = dataKey ? dataKey.split('-') :[];
            var val = dataKey ? itemAttr.attr('data-val').split('-') : [];
            var defVal = itemAttr.attr('data-def') ? itemAttr.attr('data-def').split('-') : [];
            var htmlCode = item.outerHTML;
            var temCode = '';
            for(var i=0; i < key.length; i ++){
                var curCode = $(htmlCode);
                if(defVal.indexOf(key[i]) != -1) curCode.find("input[type='radio']").prop('selected',true);
                curCode.find("input[type='radio']").val(key[i]);
                curCode.find("input[type='radio']").after(val[i]);
                
                temCode += curCode[0].outerHTML;
            }
            $(item).replaceWith(temCode);
        });
    },

    /**
     * 设置select选项
     * @param {*} selecter 
     * html代码结构：
     *  <div class="col-sm-4 col-xs-4 监听的选择器">
            <select data-key='选项1val-选项2val' data-val='选项1名称-选项2名称' data-def='被tf'></select>
        </div>
     */
    setSelect: function(selecter){
        if(!selecter) return;
        $(selecter).each(function(index,item){
            var itemAttr = $(item).find("select");
            var dataKey = itemAttr.attr('data-key');
            var key = dataKey ? dataKey.split('-') : [];
            var val = dataKey ? itemAttr.attr('data-val').split('-') : [];
            var defVal = itemAttr.attr('data-def') ? itemAttr.attr('data-def').split('-') : [];
            var htmlCode = item.outerHTML;
            var optHtml = '';
            var stlected;
            for(var i=0; i < key.length; i ++){
                stlected = (defVal.indexOf(key[i]) + 1) ? 'selected' : '';
                optHtml += '<option value="' + key[i] + '" ' + stlected + '>' + val[i] + '</option>';
            }
            $(item).find("select").html(optHtml);
        });
    },

    /**
     * 全选选项关联事件
     * html代码：
     * 项目选框(注: class="union-child" data-union="union-top" 必须)
     * <label class="checkbox-inline"><input type="checkbox" class="union-child" data-union="union-top" value="{{id}}" /></label>
     * 全选框（注：class="union-top" data-union="union-child" 必须)
     * <label class="checkbox-inline"><input type="checkbox" class="union-top" data-union="union-child" /> 全选</label>
     * */
    unionSelect: function(){
        $("input[data-union]").on('change',function(){
            var me = $(this);
            var tab = me.parentsUntil('table').parent();
            var val = me.prop('checked');
            var unionTag = me.attr('data-union');
            var all = true; 
            
            if(unionTag == 'union-top'){
                tab.find('.union-child').each(function(index,item){
                    if(!$(item).prop('checked')) all = false;
                });
            }
            if(unionTag == 'union-child'){
                all = val;
                tab.find("." + unionTag).prop('checked',val);
            }
            tab.find('.union-top').prop('checked',all);
        });
    },

    /**
     * nestable结构输出
     * 环境：jquery2 bootstrap3
     * 需要在页面引入：<script src="/bootstrap/js/plugins/nestable/jquery.nestable.js"></script>
     * results object 代结构的数据
     * error 0 | 1  是results的状态标识 0表示结构数据合法，1表示不合法
     * appendid id选择器，指定输入的视图追加在appendid的容器内
     * initElem 初始化的nestable id 如：nestable-spec， 可为空
     * results数据结构如：
     * [
            {
                "val":"classify_init",
                "name":"分类名称",
                "children":[
                    {"val":"classify_1562384668706","name":"分类名称"},
                    {"val":"classify_1562384668490","name":"分类名称"}
                ]
            },
            {
                "val":"classify_1562384668258",
                "name":"分类名称"
            },
            {
                "val":"classify_1562384672690",
                "name":"分类名称"
            }
        ]

        完整案例：
            var error = <%- error; %>;
            var updateOutput = function (e) {
                var list = e.length ? e : $(e.target),
                output = list.data('output');
            };

            //分类相关
            $("#oper-classify").click(function(){
                $("#oper-classify-nes").fadeToggle();
            })

            var results = <%- error ? false : results %>;
            //初始化nestable数据结构
            effect.nestable(results,error,'#oper-classify-nes');
            
            // activate Nestable for list 2
            $('#nestable2').nestable({group: 1}).on('change', updateOutput);
            $('.dd').nestable('collapseAll');   
        
            //以下为动作事件
            //隐藏编辑按钮
            $('.dd-edit').hide();
            $(".dd-addon-handel").removeClass('hidden')

            //设置被选择的值及效果
            $('.handel-nestable2').click(function(e){
                $("#oper-classify").text($(this).parent().find(".dd-val").html());
                $("#oper-classify").siblings('input[ name="classify"]').val($(this).parent().attr('data-val'));
                $("#oper-classify-nes").fadeToggle();
            });
     */
    nestable: function(results,error,appendid,initElem){
        var nesId = initElem;
        if(!initElem){
            nesId = $(".dd").eq(0).attr('id');
            nesId = nesId ? 'nestable' + (parseInt(nesId.replace(/[^0-9]/ig,'')) + 1) : 'nestable2';
        }
        var nesPreBox = `<div class='hidden' id='nesTemCode'></div>`;
        var nesBox = `<style>
                        .dd-list>li .dd-edit{position:absolute;right:1em;top:0.6em;height:1.5em;line-height:2em;}
                        .dd-list>li .dd-addon-handel{position:absolute;right:0;top:0.6em;height:2em;border:0;left:5em;}
                        .dd-list>li .dd-edit span{margin-right:0.5em;}
                    </style>
                    <div class="dd" id="`+ nesId +`">
                        <ol class="dd-list"></ol>
                    </div>`;
        var initCode =  `<li class="dd-item" data-val="classify_init">
                            <div class="dd-handle">
                                <span class="label label-info"><i class="fa fa-cog"></i></span> 
                                <span class="dd-val" style="font-weight:100;">分类名称</span>
                            </div>
                            <div class="dd-edit">
                                <input class="hidden" type="text" name="spec" value="规格名称" />
                                <span class="fa fa-edit"></span>
                                <span class="fa fa-minus-square-o minus"></span>
                                <span class="fa fa-plus-square-o plus"></span>
                            </div>
                            <div class="dd-addon-handel handel-`+ nesId +` hidden"></div>
                        </li>`;
        $("#nesTemCode").html('');
        $('body').append(nesPreBox);
        $(appendid).find('#' + nesId).remove();
        $(appendid).append(nesBox);
        if(error) return $("#" + nesId + " ol").html(initCode);
        loadItem();
        $("#" + nesId + " ol").html($("#nesTemCode").html());
        /**
         * 组织项目结构
         **/
        function loadItem(res,farther){
            res = res || results;
            res.forEach(function(item,index){
                var code = $(initCode);
                code.attr('data-val',item.val);
                code.attr('data-name',item.name);
                code.find('.dd-val').html(item.name);
                code = code[0].outerHTML;
                (!farther) ?
                $("#nesTemCode").append(code) :
                $("#nesTemCode").find('li[data-val="' + farther + '"]').append('<ol class="dd-list">' + code + '</ol>');
                if(item.children) loadItem(item.children, item.val)
            });
        }
    },


}

/** ============================效果插件 end=========================== */
/** ===============================tools============================== */
/**
 * 返回请求时暂存的参数，如果参数不存在则返回null
 * @param {string} parNmae 
 */
function getItem(tag){
    var query_params = $.md5(location.pathname);
    tag = tag || query_params;
    var str = sessionStorage.getItem(tag);
    try{
        str = JSON.parse(str);
    } catch (e){}
    return str;
}

/**
 * @param {string} parNmae 
 */
function setItem(name,data){
    try{
        data = JSON.stringify(data);
    }catch(e){}
    //if(typeof data === 'object') data = JSON.stringify(data);
    sessionStorage.setItem(name,data);
}

/**
 * 获取url参数
 * 
 */
function getUrlParams(variable)
{
   var query = window.location.search.substring(1);
   var vars = query.split("&");
   for (var i=0;i<vars.length;i++) {
           var pair = vars[i].split("=");
           if(pair[0] == variable){return pair[1];}
   }
   return(false);
}

/**
 * 获取url参数2
 * 
 */
function getParamsUrl(url,key)
{
    var query;
    if(url){
        query = url.substring(url.indexOf('?')+1);
    }else{
        query = window.location.search.substring(1);
    }    
   var vars = query.split("&");  
   for (var i=0;i<vars.length;i++) {
           var pair = vars[i].split("=");
           if(pair[0] == key){return pair[1];}
   }
   return(false);
}

/**
 * 在数组对象中查找 key2 的值， 条件是：key1 == value
 * 如果 key2 为空则返回 key1 => value 所在的对象
 */
function array2value (array,key1,value,key2) {
	array = array || [];
    if(!array.length) return '';

    for(var i = 0; i < array.length; i ++){
		if(array[i][key1] == value) {
            return (key2  === undefined) ? array[i] : array[i][key2];
        }
	}
	return '';
}

/**
 * 判断是否是微信浏览器的函数
 */
function isWeiXin(){
    //window.navigator.userAgent属性包含了浏览器类型、版本、操作系统类型、浏览器引擎类型等信息，这个属性可以用来判断浏览器类型
    var ua = window.navigator.userAgent.toLowerCase();
    //通过正则表达式匹配ua中是否含有MicroMessenger字符串
    if(ua.match(/MicroMessenger/i) == 'micromessenger'){
        return true;
    }else{
        return false;
    }
} 

/**
 * 时间转换方法
 * @param date 中国标准时间 
 */
function getStandardDate(date,defaultVal) {
	defaultVal = defaultVal || '';
    if(!date) return defaultVal;
	var d = new Date(date);
	var Y =d.getFullYear();
	var m  = (d.getMonth().valueOf() + 1);
	var D = d.getDate();
	var h = d.getHours();
	var mi = d.getMinutes();
	var s = d.getSeconds();
	m = m > 9 ? m : '0' + m;
    return Y + '-' + m + '-' + D + ' ' + h + ':' + mi + ':' + s;
}

/**
 * %Y %m %d %H %M %S 分别表示年月日时分秒
 *  */
function dateFormate(formate,time){
	var date = new Date(time);
	var Y = date.getFullYear();
	var m = date.getMonth() > 9 ? date.getMonth() : date.getMonth() + 1;
	var d = date.getDate();
	var H = date.getHours();
	var M = date.getMinutes();
	var S = date.getSeconds();
	var str = formate;
	str = str.replace('%Y',Y);
	str = str.replace('%m',m);
	str = str.replace('%d',d);
	str = str.replace('%H',H);
	str = str.replace('%M',M);
	str = str.replace('%S',S);
	return str;
}

/**
 * 限制文字字数，超出用省略号......表示
 */
function limitPrint(str,len){
    if(str.length > len){
        str=str.substring(0,len-2)+"......";  //使用字符串截取，获取前30个字符，多余的字符使用“......”代替
    }
    return str;
}

/**
 * 数组去重
 * @param {*} arr 
 */
function unique(arr){
    var res = [];
    for(var i=0; i<arr.length; i++){
        if( !res.includes(arr[i]) ){ // 如果res新数组包含当前循环item
            res.push(arr[i]);
        }
    }
    return res;
}




/** ===============================tools end============================== */

/**
	 * jQuery MD5 hash algorithm function
	 * 
	 * 	<code>
	 * 		Calculate the md5 hash of a String 
	 * 		String $.md5 ( String str )
	 * 	</code>
	 * 
	 * Calculates the MD5 hash of str using the » RSA Data Security, Inc. MD5 Message-Digest Algorithm, and returns that hash. 
	 * MD5 (Message-Digest algorithm 5) is a widely-used cryptographic hash function with a 128-bit hash value. MD5 has been employed in a wide variety of security applications, and is also commonly used to check the integrity of data. The generated hash is also non-reversable. Data cannot be retrieved from the message digest, the digest uniquely identifies the data.
	 * MD5 was developed by Professor Ronald L. Rivest in 1994. Its 128 bit (16 byte) message digest makes it a faster implementation than SHA-1.
	 * This script is used to process a variable length message into a fixed-length output of 128 bits using the MD5 algorithm. It is fully compatible with UTF-8 encoding. It is very useful when u want to transfer encrypted passwords over the internet. If you plan using UTF-8 encoding in your project don't forget to set the page encoding to UTF-8 (Content-Type meta tag). 
	 * This function orginally get from the WebToolkit and rewrite for using as the jQuery plugin.
	 * 
	 * Example
	 * 	Code
	 * 		<code>
	 * 			$.md5("I'm Persian."); 
	 * 		</code>
	 * 	Result
	 * 		<code>
	 * 			"b8c901d0f02223f9761016cfff9d68df"
	 * 		</code>
	 * 
	 * @alias Muhammad Hussein Fattahizadeh < muhammad [AT] semnanweb [DOT] com >
	 * @link http://www.semnanweb.com/jquery-plugin/md5.html
	 * @see http://www.webtoolkit.info/
	 * @license http://www.gnu.org/licenses/gpl.html [GNU General Public License]
	 * @param {jQuery} {md5:function(string))
	 * @return string
	 */
	(function($){
		var rotateLeft = function(lValue, iShiftBits) {
			return (lValue << iShiftBits) | (lValue >>> (32 - iShiftBits));
		}
		var addUnsigned = function(lX, lY) {
			var lX4, lY4, lX8, lY8, lResult;
			lX8 = (lX & 0x80000000);
			lY8 = (lY & 0x80000000);
			lX4 = (lX & 0x40000000);
			lY4 = (lY & 0x40000000);
			lResult = (lX & 0x3FFFFFFF) + (lY & 0x3FFFFFFF);
			if (lX4 & lY4) return (lResult ^ 0x80000000 ^ lX8 ^ lY8);
			if (lX4 | lY4) {
				if (lResult & 0x40000000) return (lResult ^ 0xC0000000 ^ lX8 ^ lY8);
				else return (lResult ^ 0x40000000 ^ lX8 ^ lY8);
			} else {
				return (lResult ^ lX8 ^ lY8);
			}
		}
		var F = function(x, y, z) {
			return (x & y) | ((~ x) & z);
		}
		var G = function(x, y, z) {
			return (x & z) | (y & (~ z));
		}
		var H = function(x, y, z) {
			return (x ^ y ^ z);
		}
		var I = function(x, y, z) {
			return (y ^ (x | (~ z)));
		}
		var FF = function(a, b, c, d, x, s, ac) {
			a = addUnsigned(a, addUnsigned(addUnsigned(F(b, c, d), x), ac));
			return addUnsigned(rotateLeft(a, s), b);
		};
		var GG = function(a, b, c, d, x, s, ac) {
			a = addUnsigned(a, addUnsigned(addUnsigned(G(b, c, d), x), ac));
			return addUnsigned(rotateLeft(a, s), b);
		};
		var HH = function(a, b, c, d, x, s, ac) {
			a = addUnsigned(a, addUnsigned(addUnsigned(H(b, c, d), x), ac));
			return addUnsigned(rotateLeft(a, s), b);
		};
		var II = function(a, b, c, d, x, s, ac) {
			a = addUnsigned(a, addUnsigned(addUnsigned(I(b, c, d), x), ac));
			return addUnsigned(rotateLeft(a, s), b);
		};
		var convertToWordArray = function(string) {
			var lWordCount;
			var lMessageLength = string.length;
			var lNumberOfWordsTempOne = lMessageLength + 8;
			var lNumberOfWordsTempTwo = (lNumberOfWordsTempOne - (lNumberOfWordsTempOne % 64)) / 64;
			var lNumberOfWords = (lNumberOfWordsTempTwo + 1) * 16;
			var lWordArray = Array(lNumberOfWords - 1);
			var lBytePosition = 0;
			var lByteCount = 0;
			while (lByteCount < lMessageLength) {
				lWordCount = (lByteCount - (lByteCount % 4)) / 4;
				lBytePosition = (lByteCount % 4) * 8;
				lWordArray[lWordCount] = (lWordArray[lWordCount] | (string.charCodeAt(lByteCount) << lBytePosition));
				lByteCount++;
			}
			lWordCount = (lByteCount - (lByteCount % 4)) / 4;
			lBytePosition = (lByteCount % 4) * 8;
			lWordArray[lWordCount] = lWordArray[lWordCount] | (0x80 << lBytePosition);
			lWordArray[lNumberOfWords - 2] = lMessageLength << 3;
			lWordArray[lNumberOfWords - 1] = lMessageLength >>> 29;
			return lWordArray;
		};
		var wordToHex = function(lValue) {
			var WordToHexValue = "", WordToHexValueTemp = "", lByte, lCount;
			for (lCount = 0; lCount <= 3; lCount++) {
				lByte = (lValue >>> (lCount * 8)) & 255;
				WordToHexValueTemp = "0" + lByte.toString(16);
				WordToHexValue = WordToHexValue + WordToHexValueTemp.substr(WordToHexValueTemp.length - 2, 2);
			}
			return WordToHexValue;
		};
		var uTF8Encode = function(string) {
			string = string.replace(/\x0d\x0a/g, "\x0a");
			var output = "";
			for (var n = 0; n < string.length; n++) {
				var c = string.charCodeAt(n);
				if (c < 128) {
					output += String.fromCharCode(c);
				} else if ((c > 127) && (c < 2048)) {
					output += String.fromCharCode((c >> 6) | 192);
					output += String.fromCharCode((c & 63) | 128);
				} else {
					output += String.fromCharCode((c >> 12) | 224);
					output += String.fromCharCode(((c >> 6) & 63) | 128);
					output += String.fromCharCode((c & 63) | 128);
				}
			}
			return output;
		};
		$.extend({
			md5: function(string) {
				var x = Array();
				var k, AA, BB, CC, DD, a, b, c, d;
				var S11=7, S12=12, S13=17, S14=22;
				var S21=5, S22=9 , S23=14, S24=20;
				var S31=4, S32=11, S33=16, S34=23;
				var S41=6, S42=10, S43=15, S44=21;
				string = uTF8Encode(string);
				x = convertToWordArray(string);
				a = 0x67452301; b = 0xEFCDAB89; c = 0x98BADCFE; d = 0x10325476;
				for (k = 0; k < x.length; k += 16) {
					AA = a; BB = b; CC = c; DD = d;
					a = FF(a, b, c, d, x[k+0],  S11, 0xD76AA478);
					d = FF(d, a, b, c, x[k+1],  S12, 0xE8C7B756);
					c = FF(c, d, a, b, x[k+2],  S13, 0x242070DB);
					b = FF(b, c, d, a, x[k+3],  S14, 0xC1BDCEEE);
					a = FF(a, b, c, d, x[k+4],  S11, 0xF57C0FAF);
					d = FF(d, a, b, c, x[k+5],  S12, 0x4787C62A);
					c = FF(c, d, a, b, x[k+6],  S13, 0xA8304613);
					b = FF(b, c, d, a, x[k+7],  S14, 0xFD469501);
					a = FF(a, b, c, d, x[k+8],  S11, 0x698098D8);
					d = FF(d, a, b, c, x[k+9],  S12, 0x8B44F7AF);
					c = FF(c, d, a, b, x[k+10], S13, 0xFFFF5BB1);
					b = FF(b, c, d, a, x[k+11], S14, 0x895CD7BE);
					a = FF(a, b, c, d, x[k+12], S11, 0x6B901122);
					d = FF(d, a, b, c, x[k+13], S12, 0xFD987193);
					c = FF(c, d, a, b, x[k+14], S13, 0xA679438E);
					b = FF(b, c, d, a, x[k+15], S14, 0x49B40821);
					a = GG(a, b, c, d, x[k+1],  S21, 0xF61E2562);
					d = GG(d, a, b, c, x[k+6],  S22, 0xC040B340);
					c = GG(c, d, a, b, x[k+11], S23, 0x265E5A51);
					b = GG(b, c, d, a, x[k+0],  S24, 0xE9B6C7AA);
					a = GG(a, b, c, d, x[k+5],  S21, 0xD62F105D);
					d = GG(d, a, b, c, x[k+10], S22, 0x2441453);
					c = GG(c, d, a, b, x[k+15], S23, 0xD8A1E681);
					b = GG(b, c, d, a, x[k+4],  S24, 0xE7D3FBC8);
					a = GG(a, b, c, d, x[k+9],  S21, 0x21E1CDE6);
					d = GG(d, a, b, c, x[k+14], S22, 0xC33707D6);
					c = GG(c, d, a, b, x[k+3],  S23, 0xF4D50D87);
					b = GG(b, c, d, a, x[k+8],  S24, 0x455A14ED);
					a = GG(a, b, c, d, x[k+13], S21, 0xA9E3E905);
					d = GG(d, a, b, c, x[k+2],  S22, 0xFCEFA3F8);
					c = GG(c, d, a, b, x[k+7],  S23, 0x676F02D9);
					b = GG(b, c, d, a, x[k+12], S24, 0x8D2A4C8A);
					a = HH(a, b, c, d, x[k+5],  S31, 0xFFFA3942);
					d = HH(d, a, b, c, x[k+8],  S32, 0x8771F681);
					c = HH(c, d, a, b, x[k+11], S33, 0x6D9D6122);
					b = HH(b, c, d, a, x[k+14], S34, 0xFDE5380C);
					a = HH(a, b, c, d, x[k+1],  S31, 0xA4BEEA44);
					d = HH(d, a, b, c, x[k+4],  S32, 0x4BDECFA9);
					c = HH(c, d, a, b, x[k+7],  S33, 0xF6BB4B60);
					b = HH(b, c, d, a, x[k+10], S34, 0xBEBFBC70);
					a = HH(a, b, c, d, x[k+13], S31, 0x289B7EC6);
					d = HH(d, a, b, c, x[k+0],  S32, 0xEAA127FA);
					c = HH(c, d, a, b, x[k+3],  S33, 0xD4EF3085);
					b = HH(b, c, d, a, x[k+6],  S34, 0x4881D05);
					a = HH(a, b, c, d, x[k+9],  S31, 0xD9D4D039);
					d = HH(d, a, b, c, x[k+12], S32, 0xE6DB99E5);
					c = HH(c, d, a, b, x[k+15], S33, 0x1FA27CF8);
					b = HH(b, c, d, a, x[k+2],  S34, 0xC4AC5665);
					a = II(a, b, c, d, x[k+0],  S41, 0xF4292244);
					d = II(d, a, b, c, x[k+7],  S42, 0x432AFF97);
					c = II(c, d, a, b, x[k+14], S43, 0xAB9423A7);
					b = II(b, c, d, a, x[k+5],  S44, 0xFC93A039);
					a = II(a, b, c, d, x[k+12], S41, 0x655B59C3);
					d = II(d, a, b, c, x[k+3],  S42, 0x8F0CCC92);
					c = II(c, d, a, b, x[k+10], S43, 0xFFEFF47D);
					b = II(b, c, d, a, x[k+1],  S44, 0x85845DD1);
					a = II(a, b, c, d, x[k+8],  S41, 0x6FA87E4F);
					d = II(d, a, b, c, x[k+15], S42, 0xFE2CE6E0);
					c = II(c, d, a, b, x[k+6],  S43, 0xA3014314);
					b = II(b, c, d, a, x[k+13], S44, 0x4E0811A1);
					a = II(a, b, c, d, x[k+4],  S41, 0xF7537E82);
					d = II(d, a, b, c, x[k+11], S42, 0xBD3AF235);
					c = II(c, d, a, b, x[k+2],  S43, 0x2AD7D2BB);
					b = II(b, c, d, a, x[k+9],  S44, 0xEB86D391);
					a = addUnsigned(a, AA);
					b = addUnsigned(b, BB);
					c = addUnsigned(c, CC);
					d = addUnsigned(d, DD);
				}
				var tempValue = wordToHex(a) + wordToHex(b) + wordToHex(c) + wordToHex(d);
				return tempValue.toLowerCase();
			}
		});
    })(jQuery);

    /** ===============================md5 end============================== */

    

/**
 * 扩展Array方法, 去除数组中空白数据
 * 调用方法
    var a = [1, 2, undefined, 4, "", 5, null, 7, 0, 8];
    var b = a.notempty();
    输出b    [1, 2, 4, 5, 7, 0, 8]
 */
function arrNotempty(array){
    var arr = [];
    array.map(function(val, index) {
        //过滤规则为，不为空串、不为null、不为undefined，也可自行修改
        if (val !== "" && val != undefined) {
            arr.push(val);
        }
    });
    return arr;
}
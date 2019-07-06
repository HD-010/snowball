function sysControler(){
    var that = this;
    // 基本设置
    that.bases = function(){ 
        var process = that.model("DataProcess");
        var userInfor = process.getUserInfo();
        var ppermit = process.getUserInfo('PPER',1)
        that.render({});
    }

    //安全设置
    that.securitySet = function(){
        that.render({});
    }
    
    //验证码设置
    that.code = function(){
        that.render({});
    }

     //logo设置
     that.logo = function(){
        that.render({});
    }
  
    //地图设置
    that.mapSet = function (){
        that.render({});
    }
    

     //保存缓存设置
     that.saveCacheSet = function(){
        console.log("123135456543154=======================");
        var sys = that.model("Sys")
        sys.saveCacheSet(function(res){
            that.renderJson(res);
        });
    }
  
    //缓存设置
    that.cache = function (){
        var sys = that.model("Sys")
        sys.cacheSet(function(res){
            console.log("cache",res)
            that.render({list:res});
        });
    }

    //上传设置
    that.upload = function (){
        var sys = that.model("Sys")
        sys.updateSet(function(res){
            that.render({list:res});
        });
        
    }

    //保存上传设置
    that.saveUpdateSet = function(){
        var sys = that.model("Sys")
        sys.saveUpdateSet(function(res){
            that.renderJson(res);
        });
    }

   //友情链接
   that.flink = function (){
       var sys = that.model("Sys")
       sys.getFlink(function(res){
            that.render({list:res});
       });        
    }

    //添加友情链接
    that.addFlink = function(){
        var data = {};
        var oid = that.GET('oid') || that.POST('oid');
        data.normalAsync = that.plug('Uploads',{
          url:'/admin/sys/ajaxImg?oid=' + oid,      //上传文件的服务端地址
          control:'#fileInput',                   //载入文件的input框id
          form:'#testForm',                       //承载input框的form元素的id
          successCallback:'imgfun',
          faileCallback:'errorfun',
      }).normalAsync;
        that.render(data);
    }


    /**
     * 图片上传路径
     */
    that.ajaxImg = function(){
        that.app.model.upload({
            req    : that.req,
            res    : that.res,
            path   : 'files/',   //上传文件大分类名称
            typeDir: true        //需要分类管理文件（按日期分类）
        });
        
    }


    /**
     * 保存友情连接信息
     */
    that.saveFlink = function(){
        var sys = that.model("Sys");
        sys.saveFlink(function(res){
            that.renderJson(res);
        })
    }

    /**
     * 删除友情链接
     */
    that.delFlink = function(){
        var sys = that.model("Sys");
        sys.delFlink(function(res){
            that.renderJson(res);
        })
    }

    /**
     * 编辑友情链接信息
     * 
     */
    that.editFlink = function(){
        var data = {};
        
        var oid = that.GET('oid') || that.POST('oid');        
        data.normalAsync = that.plug('Uploads',{
          url:'/admin/sys/ajaxImg?oid=' + oid,      //上传文件的服务端地址
          control:'#fileInput',                   //载入文件的input框id
          form:'#testForm',                       //承载input框的form元素的id
          successCallback:'imgfun',
          faileCallback:'errorfun',
      }).normalAsync;
        var sys = that.model("Sys");

        sys.getFlink(function(res){
            data.list = res;
            that.render(data);
        })
    }

    /**
     * 修改友情链接信息
     */
    that.updateFlink = function(){
        var sys = that.model("Sys");
        sys.saveFlink(function(res){
            that.renderJson(res);
        })
    }

}



module.exports = sysControler;
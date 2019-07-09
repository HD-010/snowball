function sysControler(){
    var that = this;


    //保存基本设置
    that.saveBase = function(){
        var sys = that.model("Sys")
        sys.saveBase(function(res){
            that.renderJson(res);
        });
    }


    // 基本设置
    that.bases = function(){ 
        var process = that.model("DataProcess");
        var userInfor = process.getUserInfo();
        var ppermit = process.getUserInfo('PPER',1)
        var data = {};
        var sys = that.model("Sys");
        sys.getSysInfo("SYS_BASIC",function(res){
            data.list = res;
            console.log("+++++++++",data.list[0].key1)
            that.render(data);
        })
    }


     //保存安安全设置
     that.saveSecuritySet = function(){
        var sys = that.model("Sys")
        sys.saveSecuritySet(function(res){
            that.renderJson(res);
        });
    }


    //安全设置
    that.securitySet = function(){
        var data = {};
        var sys = that.model("Sys");
        sys.getSysInfo("SYS_SECUR",function(res){
            data.list = res;
            that.render(data);
        })
    }


    //保存验证码设置
    that.saveCodeSet = function(){
        var sys = that.model("Sys")
        sys.saveCodeSet(function(res){
            that.renderJson(res);
        });
    }

    
    //验证码设置
    that.code = function(){
        var data = {};
        var sys = that.model("Sys");
        sys.getSysInfo("SYS_CODE",function(res){
            data.list = res;
            that.render(data);
        })
    }


     //保存上传设置
     that.saveLogoSet = function(){
        var sys = that.model("Sys")
        sys.saveLogoSet(function(res){
            that.renderJson(res);
        });
    }

     //logo设置
     that.logo = function(){
        var data = {};
        var oid = that.GET('oid') || that.POST('oid');
        data.normalAsync = that.plug('Uploads',{
          url:'/admin/sys/ajaxImg?oid=' + oid,      //上传文件的服务端地址
          control:'.fileInput',                   //载入文件的input框id
          form:'#testForm',                       //承载input框的form元素的id
          successCallback:'imgfun',
          faileCallback:'errorfun',
      }).normalAsync;
      var sys = that.model("Sys");
      sys.getSysInfo("SYS_LOGO",function(res){
          data.list = res;
          that.render(data);
      })
    }

     //保存地图设置
     that.saveMapSet = function(){
        var sys = that.model("Sys")
        sys.saveMapSet(function(res){
            that.renderJson(res);
        });
    }

    //地图设置
    that.mapSet = function (){
        var sys = that.model("Sys")
        sys.mapSet(function(res){
            that.render({list:res});
        });
        
    }
    

     //保存缓存设置
     that.saveCacheSet = function(){
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
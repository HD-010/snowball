function sysControler(){
    var that = this;
    // 基本设置
    this.bases = function(){ 
        var process = this.model("DataProcess");
        var userInfor = process.getUserInfo();
        var ppermit = process.getUserInfo('PPER',1)
        that.render({});
    }

    //安全设置
    this.securitySet = function(){
        that.render({});
    }
    
    //验证码设置
    this.code = function(){
        that.render({});
    }

     //logo设置
     this.logo = function(){
        that.render({});
    }
  
    //地图设置
    this.mapSet = function (){
        that.render({});
    }
    
  
    //缓存设置
    this.cache = function (){
         that.render({});
    }

    //上传设置
    this.upload = function (){
        that.render({});
    }

   //友情链接
   this.flink = function (){
       var sys = this.model("Sys")
       sys.getFlink(function(res){
            that.render({list:res});
       });        
    }

    //添加友情链接
    that.addFlink = function(){
        var data = {};
        var oid = that.GET('oid') || that.POST('oid');
        data.normalAsync = this.plug('Uploads',{
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

}



module.exports = sysControler;
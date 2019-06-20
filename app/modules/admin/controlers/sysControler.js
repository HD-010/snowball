function sysControler(){
    var that = this;
    // 基本设置
    this.base = function(){ 
        var process = this.model("DataProcess");
        var userInfor = process.getUserInfo();
        var ppermit = process.getUserInfo('PPER',1)
        log('*********************',ppermit)
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
        console.log("=====================================")
        that.render({});
   }
   //友情链接
   this.flink = function (){
    console.log("=====================================")
    that.render({});
}


}



module.exports = sysControler;
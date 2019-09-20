function SysModel(){
    var that = this;


    that.getSysInfo = function(tagname,callback){
        //根据网站基本配置信息
        var condition = {
            table:["youbang_sys_option"],//查询的表名
            where:[],           //更新条件
          
        };
        if(tagname) condition.where.push(" tagname= '"+tagname+"'");
        that.DB().get(condition,function(error,res){
            res[0].key1 = JSON.parse(res[0].key1);
            if(res.length) callback(res);
        });
    }
    
    /**
     * 友情链接信息查新
     */
    that.getFlink = function(callback){
        var data = {};
        //根据ID 获取友情链接信息
        var id = that.POST("fid") || this.GET("fid");
        var condition = {
            table:["youbang_flink"],//查询的表名
            where:[],           //更新条件
          
        };
        if(id) condition.where.push(" id= "+id);
        that.DB().get(condition,function(error,res){
            if(res.length) callback(res);
        });
    }

    /**
     * 保存友情链接信息
     */
    that.saveFlink = function(callback){
        var data = {};
          //获取插入信息
        data.id = this.POST('id');
        data.litpic = this.POST('litpic');
        data.title = this.POST('title');
        data.linkurl = this.POST('linkurl');
        data.enable = this.POST('enable') || 0;
       console.log(data);
       var condition = {
            table:["youbang_flink"],                                 //查询的表名
            fields:[{
                "litpic":data.litpic,
                "title":data.title,
                "linkurl":data.linkurl,
                "enable":data.enable,
                "addtime":'NOW()',
            }],
            where:[],         //被查询的字段名称（别名在此指定）
         
        };
        if(data.id) condition.where.push(" id = "+data.id);
        that.DB().set(condition,function(error,results){
            if(results.insertId){
               if(data.id){
                    var obj={
                        message:"友情链接修改成功!",
                        uri:"/admin/sys/flink",
                        error:0
                    }
                    callback(obj)
               }else{
                var obj={
                        message:"友情链接添加成功!",
                        uri:"/admin/sys/flink",
                        error:0
                    }
                    callback(obj)
               }
            }
        })
    }

    /**
     * 删除友情信息
     * 条件 根据友情链接ID 删除
     */
    that.delFlink = function(callback){
        var data = {};
        data.id = that.GET("id");
        if(data){
            var condition = {
                table:["youbang_flink"],          //查询的表名
                where:[]          //更新条件              
            };
            condition.where.push(" id = "+data.id);
            that.DB().del(condition,function(error,results){
                if(results.affectedRows){
                    var obj={
                        message:"友情链接删除成功!",
                        uri:"/admin/sys/flink",
                        error:0
                    }
                    callback(obj)                
                }
            })
        }

    }
    /**
     * 文件及图片的上传设置
     */
    that.updateSet = function(callback){
        var tagname  = "SYS_UPDATE";
        that.getSysInfo(tagname,function(results){
            if(results.length){
                callback(results);
            }
        });
    }


     /**
     * 缓存设置
     */
    that.cacheSet = function(callback){
        var tagname  = "SYS_CACHE";
        that.getSysInfo(tagname,function(results){
            if(results.length){
                callback(results);
            }
        });
    }

     /**
     * 地图设置
     */
    that.mapSet = function(callback){
        var tagname  = "SYS_MAP";
        that.getSysInfo(tagname,function(results){
            if(results.length){
                callback(results);
            }
        });
    }

    /**
     * 文件及图片的上传设置
     */
    that.saveUpdateSet = function(callback){
        var tagname  = "SYS_UPDATE";
        var data = {};
        data.updateData = that.POST("!updateData");
        var sql  = "update youbang_sys_option set key1 = '"+data.updateData+"' where tagname = '"+tagname+"'";
        that.DB().query(sql,function(error,results){
            if(results.affectedRows){
                var obj={
                    message:"上传设置修改成功!",
                    uri:"/admin/sys/upload",
                    error:0
                }
                callback(obj)     
            }
        })
    }

     /**
     * 缓存设置
     */
    that.saveCacheSet = function(callback){
        var tagname  = "SYS_CACHE";
        var data = {};
        data.updateData = that.POST("!updateData");
        console.log("得到的数据",data.updateData);
        var sql  = "update youbang_sys_option set key1 = '"+data.updateData+"' where tagname = '"+tagname+"'";
        that.DB().query(sql,function(error,results){
            if(results.affectedRows){
                var obj={
                    message:"缓存修改成功!",
                    uri:"/admin/sys/cache",
                    error:0
                }
                callback(obj)     
            }
        })
    }

    /**
     * 地图设置
     */
    that.saveMapSet = function(callback){
        var tagname  = "SYS_MAP";
        var data = {};
        data.updateData = that.POST("!updateData");
        console.log("得到的数据",data.updateData);
        var sql  = "update youbang_sys_option set key1 = '"+data.updateData+"' where tagname = '"+tagname+"'";
        that.DB().query(sql,function(error,results){
            if(results.affectedRows){
                var obj={
                    message:"地图修改成功!",
                    uri:"/admin/sys/mapSet",
                    error:0
                }
                callback(obj)     
            }
        })
    }

     /**
     * logo设置
     */
    that.saveLogoSet = function(callback){
        var tagname  = "SYS_LOGO";
        var data = {};
        data.updateData = that.POST("!updateData");
        console.log("得到的数据",data.updateData);
        var sql  = "update youbang_sys_option set key1 = '"+data.updateData+"' where tagname = '"+tagname+"'";
        that.DB().query(sql,function(error,results){
            if(results.affectedRows){
                var obj={
                    message:"logo修改成功!",
                    uri:"/admin/sys/logo",
                    error:0
                }
                callback(obj)     
            }
        })
    }


     /**
     * 验证码设置
     */
    that.saveCodeSet = function(callback){
        var tagname  = "SYS_CODE";
        var data = {};
        data.updateData = that.POST("!updateData");
        console.log("得到的数据",data.updateData);
        var sql  = "update youbang_sys_option set key1 = '"+data.updateData+"' where tagname = '"+tagname+"'";
        that.DB().query(sql,function(error,results){
            if(results.affectedRows){
                var obj={
                    message:"验证码修改成功!",
                    uri:"/admin/sys/code",
                    error:0
                }
                callback(obj)     
            }
        })
    }


    /**
     * 安全设置
     */
    that.saveSecuritySet = function(callback){
        var tagname  = "SYS_SECUR";
        var data = {};
        data.updateData = that.POST("!updateData");
        console.log("得到的数据",data.updateData);
        var sql  = "update youbang_sys_option set key1 = '"+data.updateData+"' where tagname = '"+tagname+"'";
        that.DB().query(sql,function(error,results){
            if(results.affectedRows){
                var obj={
                    message:"验证码修改成功!",
                    uri:"/admin/sys/securitySet",
                    error:0
                }
                callback(obj)     
            }
        })
    }

     /**
     * 安全设置
     */
    that.saveBase = function(callback){
        var tagname  = "SYS_BASIC";
        var data = {};
        data.updateData = that.POST("!updateData");
        console.log("得到的数据",data.updateData);
        var sql  = "update youbang_sys_option set key1 = '"+data.updateData+"' where tagname = '"+tagname+"'";
        that.DB().query(sql,function(error,results){
            if(results.affectedRows){
                var obj={
                    message:"基本设置修改成功!",
                    uri:"/admin/sys/bases",
                    error:0
                }
                callback(obj)     
            }
        })
    }

}
module.exports = SysModel;
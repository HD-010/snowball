function SysModel(){
    var that = this;


    that.getSysInfo = function(tagname){
        //根据网站基本配置信息
        var condition = {
            table:["youbang_sys_option"],//查询的表名
            where:[],           //更新条件
          
        };
        if(tagname) condition.where.push(" tagname= '"+tagname+"'");
        that.DB().log().get(condition,function(error,res){
            if(res.length) return res;
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
        that.DB().log().set(condition,function(error,results){
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
        console.log(that.getSysInfo(tagname))
    }

    /**
     * 文件及图片的上传设置
     */
    that.saveUpdateSet = function(callback){
        var tagname  = "SYS_UPDATE";
        var data = {};
        data.updateData = that.POST("!updateData");
        console.log("上传设置",data.updateData);
    }

}
module.exports = SysModel;
function SysModel(){
    var that = this;
    
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
}
module.exports = SysModel;
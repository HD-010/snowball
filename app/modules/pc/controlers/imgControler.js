function imgControler(){
    var that = this;
   
    /**
     * 图集列表
     */
    this.list = function(){
        var data = {
            error : 1,
            message : '查询错误'
        };
        that.model("Img").list({},function(error,results,fields){
            if(error) return that.renderJson(data);
            data.error = 0;
            data.message = "ok";
            data.data = results;
            return that.renderJson(data);
        });
    }

    /**
     * 图集内容
     */
    this.contents = function(){
        var data = {
            error : 1,
            message : 'aid is null'
        };
        if(!this.POST('aid')) return that.renderJson(data);
        that.model("Img").contents({},function(error,results,fields){
            if(error) return that.renderJson(data);
            data.error = 0;
            data.message = "ok";
            data.data = results[0];
            return that.renderJson(data);
        });
    }

}

module.exports = imgControler;
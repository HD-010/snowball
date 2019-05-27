function articleControler(){
    var that = this ;

    /**
     * 文章列表
     */
    that.list = function(){
        var data = {
            error : 1,
            message : '查询错误'
        };
        that.model("Article").list({},function(error,results,fields){
            if(error) return that.renderJson(data);
            data.error = 0;
            data.message = "ok";
            data.data = results;
            
            return that.renderJson(data);
        });
    }

    /**
     * 文章内容
     */
    that.contents = function(){
        var data = {
            error : 1,
            message : 'aid is null'
        };
        if(!this.POST('aid')) return that.renderJson(data);
        that.model("Article").contents({},function(error,results,fields){
            if(error) return that.renderJson(data);
            data.error = 0;
            data.message = "ok";
            data.data = results[0];
            return that.renderJson(data);
        });
    }
}

module.exports = articleControler;
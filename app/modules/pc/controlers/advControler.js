function advControler(){
    var that = this;
    
    /**
     * 接口提供广告信息
     */
    this.list = function(){
        var data = {
            error : 1,
            message : '查询错误'
        };
        that.model("Adv").list({},function(error,results,fields){

            if(error) return that.renderJson(data);
            data.error = 0;
            data.message = "ok";
            data.data = results;
            return that.renderJson(data);
        });
    }

    

}


module.exports = advControler;
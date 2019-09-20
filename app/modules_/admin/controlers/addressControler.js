function addressControler(){
    var that = this;

    /**
     * 根据reid(上一级id)查询省或市或县名称
     */
    this.names = function(){
        var data = {error:1, message: ''};
        that.model("Address").names({},function(res){
            data = mergeObj([data, res]);
            that.renderJson(data);
        });

    };

    /**
     * 查看地址
     */
    this.show = function(){
        this.model("Address").show({},(res)=>{
            that.renderJson(res);
        });
    }

    /**
     * 保存地址
     */
    this.save = function(){
        this.model("Address").save({},(res)=>{
            that.renderJson(res);
        });
    }

}

module.exports = addressControler;
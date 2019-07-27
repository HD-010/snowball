function tranceControler(){
    var that = this;
    /**
     * 保存数据
     */
    this.set = function(){
        var trance = that.model("Trance");
        trance.set({}, function(res){
            that.renderJson(res);
        });
    }
}

module.exports = tranceControler;
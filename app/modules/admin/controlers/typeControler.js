function typeControler(){
    var that = this;

    //展示所有栏目
    this.index = function(){
        var type = that.model("Type");
        //获取栏目列表
        type.list({},(res)=>{
            that.render(res)
        });
    }

}

module.exports = typeControler;
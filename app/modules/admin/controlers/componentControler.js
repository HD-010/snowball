function componentControler(){
    var that = this;
    //展示所有应用
    this.index = function(){
        var component = that.model('Component');
        //获取组件列表
        component.list({},function(res){
            that.render(res);
        });
        
    }

    //编辑应用
    this.edit = function(){

        that.renderJson({message:"this is component edit"});
    }
}

module.exports = componentControler;
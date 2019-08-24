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
        var cid = this.GET('cid');
        if(!cid) return this.render({},"/err404");
        var component = that.model('Component');
        //获取组件信息
        var param = {limit: 1,id: cid};
        component.list(param,function(res){
            
            that.render(res);
        });
    }

    //保存数据
    this.save = function(){
        var params = {};
        var compponent = this.model("Component");

        compponent.save(params, function(results){

            that.renderJson(results);
        });
    }
}

module.exports = componentControler;
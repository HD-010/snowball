function menuControler(){
    var that = this;

    /**
     * 获取栏目列表
     */
    this.type = function(){
        console.log("3423534534获取栏目列表53453453453");
        var menu = this.model("Menu");
        menu.lists({},function(results){
            that.renderJson(results);
        });
    }

}

module.exports = menuControler;
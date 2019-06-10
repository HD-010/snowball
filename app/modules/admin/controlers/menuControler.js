function menuControler(){
    var that = this;

    /**
     * 获取栏目列表
     */
    this.type = function(){
        var menu = this.model("Menu");
        menu.lists({},function(results){
            that.renderJson(results);
        });
    }

}

module.exports = menuControler;
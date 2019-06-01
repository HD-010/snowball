function menuControler(){
    var that = this;

    /**
     * 获取顶级栏目
     */
    this.top = function(){
        var menu = this.model("Menu");
        menu.lists({},function(results){
            that.renderJson(results);
        });
    }

    /**
     * 获取栏目下的子菜单
     */
    this.type = function(){
        var menu = this.model("Menu");
        menu.lists({},function(results){
            that.renderJson(results);
        });
    }

}

module.exports = menuControler;
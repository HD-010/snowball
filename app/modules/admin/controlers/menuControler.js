function menuControler(){
    var that = this;

    this.home = function(){
        that.renderJson([
            {id:23,title:"系统设置"},
            {id:24,title:"管理设置"},
        ]);
    }

}

module.exports = menuControler;
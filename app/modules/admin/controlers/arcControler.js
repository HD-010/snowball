function arcControler(){
    var that = this;

    /**
     * 添加文章
     */
    this.add = function(){
        //组件youbang_components中nid字段
        this.go();
        var nid = 'infos';
        var viewer = 'add_' + nid;
        that.render({},viewer);
    }
}

module.exports = arcControler;
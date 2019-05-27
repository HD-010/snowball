function adminControler(){
    /**
     * 系统-后台首页
     */
    this.index = function(){
        var data = {error:0,title:"后台首页"};

        //获取视图模块配置
        data.viewModels = this.model('Template').pageModel();

        return this.renderLayer(data);
    }

    
}

module.exports = adminControler;
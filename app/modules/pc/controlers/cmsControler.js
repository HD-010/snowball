function cmsControler(){
    var that = this;

    /**
     * 内容管理系统-首页
     */
    this.home = function(){
        var data = {error:0,title:"首页"};

        //获取视图模块配置
        data.viewModels = this.model('Template').pageModel();
        log("this is data ",data);
        this.renderLayer(data);
    }

    /**
     * 内容管理系统-搜索（列表）页
     */
    this.search = function(){
        var data = {error:0,title:"搜索"};

        //获取视图模块配置
        data.viewModels = this.model('Template').pageModel();
        
        this.renderLayer(data);
    }

    /**
     * 内容管理系统-图集（列表）页
     */
    this.typeImage = function(){
        var data = {error:0,title:"图集（列表）"};

        //获取视图模块配置
        data.viewModels = this.model('Template').pageModel();

        this.renderLayer(data);
    }

    /**
     * 内容管理系统-文章（列表）页
     */
    this.typeArticle = function(){
        var data = {error:0,title:"文章（列表）"};

        //获取视图模块配置
        data.viewModels = this.model('Template').pageModel();
        
        this.renderLayer(data);
    }

    /**
     * 内容管理系统-视频（内容）页
     */
    this.typeVideos = function(){
        var data = {error:0,title:"视频（内容)"};

        //获取视图模块配置
        data.viewModels = this.model('Template').pageModel();
        
        this.renderLayer(data);
    }

    /**
     * 内容管理系统-音频（内容）页
     */
    this.typeAudios = function(){
        var data = {error:0,title:"音频（内容)"};

        //获取视图模块配置
        data.viewModels = this.model('Template').pageModel();
        
        this.renderLayer(data);
    }

    /**
     * 内容管理系统-图集（内容）页
     */
    this.images = function(){
        var data = {error:0,title:"图集"};

        //获取视图模块配置
        data.viewModels = this.model('Template').pageModel();
        log(data);
        this.renderLayer(data);
    }

    /**
     * 内容管理系统-文章（内容）页
     */
    this.article = function(){
        var data = {error:0,title:"文章内容页"};

        //获取视图模块配置
        data.viewModels = this.model('Template').pageModel();
        log(data);
        this.renderLayer(data);
    }

    /**
     * 内容管理系统-视频（内容）页
     */
    this.video = function(){

    }

    /**
     * 内容管理系统-音频（内容）页
     */
    this.audio = function(){

    }

}

module.exports = cmsControler;
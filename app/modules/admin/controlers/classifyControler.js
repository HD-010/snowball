function classifyControler(){
    var that = this;
    /**
     * 分类列表
     */
    this.index = function(){
        var params = {};
        var ctag = this.param('ctag');
        if(!ctag) return that.render('/err404');

        var process = this.model("DataProcess");
        params.ctag = ctag;
        params.macid = process.getUserInfo('UID');    //商户id，暂以登录用户id表示
        params.enable = '1';
        
        //获取当前商户的分类列表
        var classify = this.model("Classify");
        classify.get(params, function(res){
            res.ctag = ctag;
            that.render(res);
        });
    }
    
    /**
     * 保存分类信息
     */
    this.save = function(){
        if(!this.POST('classify')) return this.renderJson({error: 1, message: '非法访问，操作已经被取消'});
        var classify = this.model("Classify");
        var params = {
            nid: that.param('ctag')
        };
        classify.save(params,function(res){
            that.renderJson(res);
        });
    }

    /**
     * 删除分类
     */
    this.del = function(){
        that.render({});
    }

}

module.exports = classifyControler;
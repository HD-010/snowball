function classifyControler(){
    var that = this;
    /**
     * 分类列表
     */
    this.index = function(){
        var data = {};
        var ctag = this.param('ctag');
        if(!ctag) that.render('/err404');
        var process = this.model("DataProcess");
        data.ctag = ctag;
        data.uid = process.getUserInfo('UID');
        that.render(data);
    }

    /**
     * 添加分类
     */
    this.add = function(){
        that.render({});
    }

    /**
     * 编辑分类
     */
    this.edt = function(){
        that.render({});
    }

    /**
     * 保存分类信息
     */
    this.save = function(){
        if(!this.POST('classify')) return this.renderJson({error: 1, message: '非法访问，操作已经被取消'});
        var classify = this.model("Classify");
        var params = {};
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
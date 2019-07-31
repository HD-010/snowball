function classifyControler(){
    var that = this;
    /**
     * 分类列表
     */
    this.index = function(){
        var params = data = {};
        var ctag = this.param('ctag');
        if(!ctag) return that.render('/err404');

        var process = this.model("DataProcess");
        params.ctag = ctag;
        params.macid = process.getUserInfo('UID');    //商户id，暂以登录用户id表示
        params.enable = '1';
        //获取组件表中字段为列表的字段信息
        this.model('Component').list(params,function(res){
            if(res.error) return that.render(res);
            //[ '所属分类', '投标分类' ]
            data.className = array2value(res.results[0].addoninfos, 'islist', '!','islist',true);
            //获取当前商户的分类列表
            var classify = that.model("Classify");
            classify.get(params, function(res){
                res.ctag = ctag;
                data.error = res.error;
                data.results = classify.struc(JSON.parse(res.results), data.className);
                that.render(data);
            });
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
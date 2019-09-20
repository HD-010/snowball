function typeControler(){
    var that = this;

    /**
     * 查询文章分类
     */
    that.arc = function(){
        that.model('Type').arc({},function(results){
            that.renderJson(results);
        });
    }

    /**
     * 查询广告分类
     */
    that.adv = function(){
        that.model('Type').adv({},function(results){
            that.renderJson(results);
        });
    }
}

module.exports = typeControler;
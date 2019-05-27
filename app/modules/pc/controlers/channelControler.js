function channelControler(){
    var that = this;

    /**
     * 查询channel
     */
    that.lists = function(){
        that.model('Channel').lists({},function(results){
            that.renderJson(results);
        });
    }
    
}

module.exports = channelControler;
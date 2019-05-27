function ArticleModel(){
    var that = this;
    
    /**
     * 文章列表
     */
    this.list = function(params, callback){
        
        var conditions = {
            table:['snowball_archives'],
            where:[],
            having:[],
            groupBy:[],
            orderBy:[],
            limit:[]
        }
        var channel = that.POST('cl');
        if(channel) conditions.where.push('channel=' + channel);
        var typeid = that.POST('tid');
        if(typeid) conditions.where.push('typeid=' + typeid);
        var flag = that.POST('fg');
        if(flag) conditions.where.push('flag=' + flag);
        var limit = that.POST('limit');
        if(limit &&  (parseInt(limit) > 1)) conditions.limit.push(parseInt(limit));
        
        this.DB().get(conditions,function(error,results,fields){
            callback(error,results,fields);
        });
    }

    /**
     * 文章内容
     */
    this.contents = function(params,callback){
        var conditions = {
            table:['snowball_archives as a','snowball_addonarticle as o'],
            joinOn : ' left join snowball_addonarticle as o on a.id = o.aid ',
            fields:['a.*','o.*'], 
            where:[],
            limit : [1]
        }
        conditions.where.push('a.id=' + that.POST('aid'));

        this.DB().get(conditions,function(error,results,fields){
            callback(error,results,fields);
        });
    }

}

module.exports = ArticleModel;
function ImgModel(){
    var that = this;
    
    /**
     * 图集列表
     */
    this.list = function(params, callback){
        
        var conditions = {
            table:['snowball_archives as a','snowball_addonimages as o'],
            joinOn : ' left join snowball_addonimages as o on a.id = o.aid ',
            fields:['a.*','o.*'], 
            where:[],
            limit : []
        }
        var channel = that.POST('cl');
        if(channel) conditions.where.push('channel=' + channel);
        var typeid = that.POST('tid');
        if(typeid) conditions.where.push('a.typeid=' + typeid);
        var limit = that.POST('limit');
        if(limit &&  (parseInt(limit) > 1)) conditions.limit.push(parseInt(limit));
        
        this.DB().get(conditions,function(error,results,fields){
            if(!error && results.length) results = recodeJsonParse(results,'imgurls');
            callback(error,results,fields);
        });
    }

    /**
     * 图集内容
     */
    this.contents = function(params,callback){
        var conditions = {
            table:['snowball_archives as a','snowball_addonimages as o'],
            joinOn : ' left join snowball_addonimages as o on a.id = o.aid ',
            fields:['a.*','o.*'], 
            where:[],
            limit : [1]
        }
        conditions.where.push('a.id=' + that.POST('aid'));

        this.DB().get(conditions,function(error,results,fields){
            if(!error && results.length) results = recodeJsonParse(results,'imgurls');
            callback(error,results,fields);
        });
    }

}

module.exports = ImgModel;
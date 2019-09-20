function ChannelModel(){
    var that = this;

    that.lists = function(params, callback){
        var cnlData = that.model('DataProcess').getUserInfo('CNL');
        if(cnlData) return callback(cnlData);

        var data = {error : 1, message : "查询失败", data : []};
        var conditions = {
            table : ['snowball_channeltype'],
            where : [],
            limit : []
        }

        that.DB().get(conditions,function(error, results,fields){
            if(error) return callback(data);
            data.error = 0;
            data.message = "ok";
            if(!results.length) data.message = "查询数据为空";
            data.data = results;
            that.model('DataProcess').setUserInfo(data,'CNL',true);
            
            return callback(data);
        })
    }
}

module.exports = ChannelModel;
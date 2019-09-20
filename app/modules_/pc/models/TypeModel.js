function TypeModel(){
    var that = this;

    that.arc = function(params, callback){
        var arcData = that.model('DataProcess').getUserInfo('ARC');
        if(arcData) return callback(arcData);

        var data = {error : 1, message : "查询失败", data : []};
        var conditions = {
            table : ['snowball_arctype'],
            where : [],
            having : [],
            groupBy : [],
            limit : []
        }

        that.DB().get(conditions,function(error, results,fields){
            if(error) return callback(data);
            data.error = 0;
            data.message = "ok";
            if(!results.length) data.message = "查询数据为空";
            data.data = results;
            that.model('DataProcess').setUserInfo(data,'ARC',true);
            
            return callback(data);
        })
    }

    that.adv = function(params, callback){
        var arcData = that.model('DataProcess').getUserInfo('ADV');
        if(arcData) return callback(arcData);

        var data = {error : 1, message : "查询失败", data : []};
        var conditions = {
            table : ['snowball_advtype'],
            where : [],
            having : [],
            groupBy : [],
            limit : []
        }

        that.DB().get(conditions,function(error, results,fields){
            if(error) return callback(data);
            data.error = 0;
            data.message = "ok";
            if(!results.length) data.message = "查询数据为空";
            data.data = results;
            that.model('DataProcess').setUserInfo(data,'ADV',true);
            
            return callback(data);
        })
    }
}

module.exports = TypeModel;
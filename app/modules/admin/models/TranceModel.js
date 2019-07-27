function TranceModel(){
    this.set = function(params, callback){
        "feature=SDFGDFGDFGDFG&refrerence=id-1-number&val=1";
        var data = {error: 1, message: "error"};
        var feature = this.POST("feature");
        var refrerence = this.POST("refrerence");
        if(!(refrerence.indexOf('-') + 1)) return callback(data);
        refrerence = refrerence.split('-');                    //数据格式: [ 'id', '1', 'number' ]
        if(refrerence.length != 3) return callback(data);
        feature = this.model('TranceConfs').get(feature);      
        if(!feature.table) return callback(data);
        if(!(refrerence[2] in feature)) return callback(data);
        var value = this.POST("val");

        var sql = "update "+ feature.table +" set `" + refrerence.pop() + "`='" + value + "'";
        var where = [];
        for(var i = 0; i < refrerence.length; i += 2){
            where.push("`" + refrerence[i] +"` = '" + refrerence[i+1] + "'");
        }
        if(!where.length) return callback(data);
        sql += " where " + where.join(' and ');
        console.log("@@@@@@@@@@@@@@@@@@",sql);
        this.DB().update(sql,function(error,results){
            return callback({
                error: error ? 1 : 0,
                message: "操作成功！"
            });
        });
    }
}

module.exports = TranceModel;
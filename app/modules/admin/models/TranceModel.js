/*
 * @Description: In User Settings Edit
 * @Author: your name
 * @Date: 2019-08-16 15:28:18
 * @LastEditTime: 2019-08-27 16:27:45
 * @LastEditors: Please set LastEditors
 */
function TranceModel(){
    /**
     * 保存数据
     */
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
        this.DB().update(sql,function(error,results){
            return callback({
                error: error ? 1 : 0,
                message: "操作成功！"
            });
        });
    }

    /**
     * 检测字段有没有值
     */
    this.valExists = function(params, callback){
        var data = {error:1, message:['参数有效，请继续填写...','参数错误']};
        var tab = this.POST('tab');
        var name = this.POST('name');
		var noValid = this.GET('nv') || 0;
        var val = noValid ? this.POST('!val') : this.POST('val');
        if(!tab) return callback(data)
        var condition = {
            table: ['#@'+tab],
            fields: ['count(1) as rec'],
            where: ["`" + name + "`='" + val + "'"]
        }
        this.DB().log().get(condition, function(error, results){
            data.rec = results[0].rec;
            data.error = data.rec || error ? 1 : 0; 
            
            return callback(data);
        })
    }
}

module.exports = TranceModel;
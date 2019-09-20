/*
 * @Description: In User Settings Edit
 * @Author: your name
 * @Date: 2019-08-16 15:28:18
 * @LastEditTime: 2019-08-28 17:50:30
 * @LastEditors: Please set LastEditors
 */
function EnumModel(){
    var that = this;

    /**
     * 枚举数据列表
     */
    this.list = function(params, callback){
        var data = {erro: 1,message: 'query enum params error!'}
        if(!params.enumtag) return callback(data);

        var conditions = {
            table: ['#@enum'],
            fields:['*', 'value as val'],
            where: [],
        }
        conditions.where.push('enumtag="' + params.enumtag + '"');
        
        this.DB().get(conditions,function(error,results){
            callback({
                error: error ? 1 : 0,
                enumtag: results,
                enumtagVal: queryresultKeyValue(results, 'value'),
                enumtagName: queryresultKeyValue(results, 'name')
            });
        });
    }

    /**
     * 枚举数据分类标识
     */
    this.tag = function(params, callback){
        var conditions = {
            table: ['#@enum'],
            fields: ['distinct enumtag']
        }

        this.DB().get(conditions,function(error,results){
            callback({
                error: error ? 1 : 0,
                enumtag: results
            });
        });
    }
}

module.exports = EnumModel;
/*
 * @Description: In User Settings Edit
 * @Author: your name
 * @Date: 2019-05-27 09:47:19
 * @LastEditTime: 2019-08-28 17:53:27
 * @LastEditors: Please set LastEditors
 */
function PermitModel(){
    var that = this;

    /**
     * 获取指定用户id的权限
     */
    this.power = function(params,callback){
        var data = {error: 0};
        var condition = {
            table:["#@sys_permit"],             //查询的表名
            fields:['*'],           //被查询的字段名称（别名在此指定）
            where:[],               //查询条件
            orderBy:[]
        };
        condition.where.push(params.tagName + '=' + params.tagVal);
        condition.where.push("`enable`='1' and `show`='1'");
        if(params.tagName === 'groupId') condition.where.push('userId is null');

        this.DB().get(condition,function(error,results){
            if(results.length === 0) data.error = -1;       //查询结果为空
            data.data = results;
            return callback(data);
        });
    }

    /**
     * 查询用户属组
     */
    this.group = function(params,callback){
        var data = {error: 0};
        var condition = {
            table:["#@sys_acount"],                                 //查询的表名
            fields:['groupId'],             //被查询的字段名称（别名在此指定）
            where:[],                   //查询条件
        };
        condition.where.push("id=" + params.id);

        this.DB().get(condition,function(error,results){
            if(error) data.error = 1;
            data.data = results;
            return callback(data);
        });
    }
}


module.exports = PermitModel;
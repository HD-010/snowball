/*
 * @Description: In User Settings Edit
 * @Author: your name
 * @Date: 2019-06-15 09:46:04
 * @LastEditTime: 2019-08-28 17:51:26
 * @LastEditors: Please set LastEditors
 */
function SysOptionModel(){

    /**
     * 读取系统参数
     */
    this.options = function(params,callback){
        var contions = {
            table : ['#@sys_option'],
            fields : ['*']
        };
        this.DB().get(contions,function(error,res){
            if(error) return callback({error:1,message:"查询系统参数失败"});
            return callback({error:0, data:res});
        });
    }
}

module.exports = SysOptionModel;
function SysOptionModel(){

    /**
     * 读取系统参数
     */
    this.options = function(params,callback){
        var contions = {
            table : ['youbang_sys_option'],
            fields : ['*']
        };
        this.DB().get(contions,function(error,res){
            if(error) return callback({error:1,message:"查询系统参数失败"});
            return callback({error:0, data:res});
        });
    }
}

module.exports = SysOptionModel;
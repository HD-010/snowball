function AgentModel(){
    /**
     * 获取用户列表
     */
    this.list = function(callback){
        var data   = {error:0};
        var struct = {
            where  : [],
            groupBy: [],
            orderBy: [],
            limit  : []
        };
        //添加查询条件
        struct.where.push(" a.enable < '2' ");　//禁止加载为删除状态的记录
        //添加关键字查询
        if(this.POST('keyWords')){
            struct.where.push(
                " (a.acount like '" + this.POST('!keyWords') + "%' or "+
                " a.userName like '" + this.POST('keyWords') + "%' or " +
                " a.acountType like '" + this.POST('keyWords') + "%' or " +
                " g.merchNo like '" + this.POST('keyWords') + "%' or " +
                " g.merchName like '" + this.POST('keyWords') + "%' or " +
                " m.nick like '" + this.POST('keyWords') + "%' or " +
                " m.realName like '" + this.POST('keyWords') + "%')"
            ); 
        }

        //初始化构造查询对象
        var sqlStruct = this.SqlStruct(struct);
        
        //调用服务类查询用户列表
        var agent = this.service('Agent');
        agent.agentList(sqlStruct,function(error,results,fields){
            if(error || (results.length === 0)){
                data.error = 1;
                end(1);
                return;
            }
            data.users = results;
            end();
        });
        
        //调用服务类统计符合条件的用户数量
        agent.agentCount(sqlStruct,function(error,results,fields){
            if(error || (results.length === 0)){
                data.error = 1;
                end(1);
                return;
            }
            data.total = results[0].total;
            end();
        });

        function end(tag){
            if(tag) {
                callback(data);
                return;
            }
            if(('total' in data) && ('users' in data)) callback(data);
        }

    }

    /**
     * 下级代理商
     */
    this.son = function(params,callback){
        var data   = {error:0};
        var pid = this.model('DataProcess').getUseInfo()[0].id;
        var struct = {
            where  : [],
            groupBy: [],
            orderBy: [],
            limit  : []
        };

        struct.where.push(" pid = " + pid );
        //初始化构造查询对象
        var sqlStruct = this.SqlStruct(struct);

        //调用服务类查询用户列表
        var agent = this.service('Agent');
        agent.agentList(sqlStruct,function(error,results,fields){
            if(error || (results.length === 0)){
                data.error = 1;
                data.message = '查询代理商失败';
            }
            data.users = results;
            callback(data);
        });
    } 
}
module.exports = AgentModel;
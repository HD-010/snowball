function AgentService(){
    /**
     * 查询代理商列表
     */
    this.agentList = function(sqlStruct,callback){
        var sql = 'select a.* ,' +
        ' g.id gid, g.merchNo, g.merchName regName,' +
        ' m.id mid,m.nick,m.realName regName ' + 
        'from #@sys_acount as a left join #@sys_acount_agent as g on a.id = g.acountid left join #@sys_acount_manager as m on a.id = m.acountid' +
        sqlStruct.where() + 
        sqlStruct.groupBy() + 
        sqlStruct.orderBy() + 
        sqlStruct.limit();
        
        this.DB().select(sql,function(error,results,fields){
            callback(error,results,fields);
        });
    }

    /**
     * 统计代理商数量
     */
    this.agentCount = function(sqlStruct,callback){
        var sql = 'select count(*) total ' +
        'from #@sys_acount as a left join #@sys_acount_agent as g on a.id = g.acountid left join #@sys_acount_manager as m on a.id = m.acountid' +
        sqlStruct.where() + 
        sqlStruct.groupBy() + 
        sqlStruct.orderBy() + 
        sqlStruct.limit();
        
        this.DB().select(sql,function(error,results,fields){
            callback(error,results,fields);
        });
    }
}
module.exports=AgentService;
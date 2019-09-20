function SupplierService(){
    /**
     * 查询代理商列表
     */
    this.list = function(sqlStruct,callback){
        var sql = 'select a.*,b.merchName,b.acountid from #@suppliers as a LEFT JOIN #@sys_acount_agent as b ON a.agentId=b.id' +
        sqlStruct.where() + 
        sqlStruct.groupBy() + 
        sqlStruct.orderBy() + 
        sqlStruct.limit();
        
        this.DB().select(sql,function(error,results,fields){
            callback(error,results,fields);
        });
    }

     /**
     * 统计商户数量
     */
    this.countSup = function (sqlStruct, callback) {
        var sql = "select count(id) as total from #@suppliers" +
            sqlStruct.where() +
            sqlStruct.groupBy() +
            sqlStruct.orderBy();
        this.DB().select(sql, function(error, results, fields) {
            callback(error, results, fields);
        });
    }
}
module.exports=SupplierService;
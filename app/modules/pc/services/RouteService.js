function RouteService(){
    this.realUrl = function(sqlStruct,callback){
        var sql = 'select * from snowball_route ' +
        sqlStruct.where() + 
        sqlStruct.limit();
        log(sql)
        this.DB().select(sql,function(error,results,fields){
            callback(error,results,fields);
        });
    }

    //写入数据
    this.addUri = function(sqlStruct,callback){
        var st  = sqlStruct;
        var sql = 'insert into snowball_route ' +
        st.insertNames() +
        st.insertValues();
        this.DB().insert(sql,function(error,results,fields){
            callback(error,results,fields);
        });
    }
    
}

module.exports = RouteService;
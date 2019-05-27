function TestService() {
    this.showApp = function(data,callback){
        var sql = 'show tables';
        
        var db = this.DB();
        db.select(sql,function(error,results,fields){
            callback(results);
        });
    }
}

module.exports = TestService;
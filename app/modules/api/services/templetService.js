function templetService(){
    this.industry = function(callback){
        let sql = "select id,name,icon from ranyun_industry";
        this.DB().query(sql,function(rs){
            if(rs==false){
                callback(false);
            }else{
                callback(rs)
            }
        });
    };
    this.list = function(id,callback){
        let sql = "select id,name,icon from ranyun_template where enable='1' and industry="+id;
        this.DB().query(sql,function(rs){
            if(rs==false){
                callback(false);
            }else{
                callback(rs)
            }
        });
    }
}

module.exports = templetService;
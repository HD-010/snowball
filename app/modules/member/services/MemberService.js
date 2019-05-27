function MemberService(){
    //更新数据
    this.updateInfo = function(sqlStruct,callback){
        var st  = sqlStruct;
        var sql = 'update ranyun_member set '+
        st.updateFeilds() + 
        st.where();

        console.log(sql);
        this.DB().update(sql,function(error,results,fields){

            callback(error,results,fields);
        })
    }
}

module.exports = MemberService;
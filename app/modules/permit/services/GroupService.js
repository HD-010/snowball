function GroupService() {
    //添加加色
    this.addSysGroup = function(sqlStruct, callback) {
        var st = sqlStruct;
        var sql = 'insert into ranyun_sys_acount_group ' +
            st.insertNames() +
            st.insertValues();
        this.DB().insert(sql, function(error, results, fields) {
            callback(error, results, fields);
        });
    }

    //查询角色
    this.selectSysGroup = function(sqlStruct, callback) {
            var st = sqlStruct;
            var sql = 'select * from ranyun_sys_acount_group ' +
                st.where() +
                st.groupBy() +
                st.orderBy() +
                st.limit();
            this.DB().select(sql, function(error, results, fields) {
                callback(error, results, fields);
            });
        }
        //删除角色
    this.deleteSysGroup = function(sqlStruct, callback) {
            var st = sqlStruct;
            var sql = 'delete from ranyun_sys_acount_group ' +
                st.where();
            console.log(sql);
            this.DB().delete(sql, function(error, results, fields) {
                callback(error, results, fields);
            });
        }
        //修改角色
    this.updateSysGroup = function(sqlStruct, callback) {
        var st = sqlStruct;
        var sql = 'update ranyun_sys_acount_group set ' +
            st.updateFeilds() +
            st.where();
        console.log(sql);
        this.DB().update(sql, function(error, results, fields) {
            callback(error, results, fields);
        });
    }

    //获取表总记录数
    this.count = function(sqlStruct, callback) {
        var st = sqlStruct;
        var sql = 'select count(*) as num from ranyun_sys_acount_group ' + st.where();
        
        this.DB().select(sql, function(error, results, fields) {
            callback(error, results, fields);
        });
    }
}
module.exports = GroupService;
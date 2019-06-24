//管理员查找类
function ManageModel(){
    var that = this;

    /**
     * 获取当前登录用户下的所创建的用户信息及他子类与子类下所创建的用户信息
     */
    that.getChildManage = function(callback){
        var data = {};
        //获取当前用户id
        var process =  that.model("DataProcess");
        var uid = process.getUserInfo('UID');
        if(uid){
            var sql = "select ac.*,g.groupName from youbang_sys_acount as ac LEFT JOIN youbang_sys_acount_group as g ON ac.groupId = g.id where ac.id in ( SELECT c.id FROM (SELECT	a.id,IF(	FIND_IN_SET( a.pid, @pids ) > 0,IF(	length( @pids ) - length( REPLACE ( @pids, a.pid, '' ) ) > 1,IF(	length( @pids ) - length( REPLACE ( @pids, a.id, '' ) ) > 1,	@pids,	@pids := concat( @pids, ',', a.id )	),@pids := concat( @pids, ',', a.id )	),	0 	) AS 'plist',IF( FIND_IN_SET( a.pid, @pids ) > 0, @pids, 0 ) AS ischild FROM	( SELECT r.id, r.pid FROM youbang_sys_acount r ) a,	( SELECT @pids := "+uid+" ) b	) c WHERE	c.ischild != 0)";
            that.DB().query(sql,function(error,results){
                if(results) callback(results)
            })
        }
    }
}
module.exports = ManageModel;
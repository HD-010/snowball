function MenuModel(){

    var that = this;
    /**
     * 查询(顶级)菜单
     * 核心在于pid的取值:
     * >0  返回当前pid在的记录和其子记录
     * == 0 返回当前pid在的记录
     * == -1 返回所有记录
     */
    this.lists = function(params,callback){
        var data = {error: 0};
        var uid = this.GET('uid') || this.POST('uid') || '';
        var pid = params.tid || this.GET('tid') || 0;    
        var condition = {
            table:["youbang_sys_menu"],                                 //查询的表名
            fields:["id","pid","name","weight","icon","url","valid"],           //被查询的字段名称（别名在此指定）
            where:[],           //查询条件
            orderBy:['pid asc',' weight asc']
        };
        if(pid > 0) condition.where.push("pid=" + pid + " or (pid in (select id from youbang_sys_menu where pid = " + pid + "))");
        if(pid === 0) condition.where.push("pid=" + pid );
        if(pid != -1) condition.where.push("`show`='1'");

        var process = this.model("DataProcess");
        this.DB().get(condition,function(error,results){
            //返回全原部菜单列表
            if(pid == -1) return callback(results);
            //过滤禁止访问的菜单
            if(!error){
                var permit = process.getUserInfo("PERMIT",parseInt(uid)).permit; 
                var tmpRes = [];
                for(var i in results){
                    var search = array2value(permit,'menuId',results[i].id)
                    if(search) tmpRes.push(results[i]);
                }
            }
            data.data = error ? [] : process.structMenu(tmpRes);
            return callback(data);
        });
    }

    /**
     * 添加组件到菜单
     */
    this.add = function(params,callback){
        var data = {error: 0};
        var topid = params.topid || 0;
        var url = params.topid ? 'url' : '';
        var sql = "select max(id)+1 as pid from `youbang_sys_menu` where pid="+topid;
        this.DB().select(sql, function(error, results){
            data.error = error ? 1 : 0; 
            if(error) return callback(data);
            log("7777777777777777777777777777777results:", results);

            var sql = "insert into `youbang_sys_menu` values \
            ("+ results[0].pid+", "+ topid +", '"+ params.icon +"', '"+ params.comname +"', 0, '"+ url +"', '1', '1')";
            
            log("7777777777777777777777777777777sql:", sql);
            that.DB().insert(sql, function(error, results){
                data.error = error ? 1 : 0; 
                callback(data);
            })
        })
        
    }
    
}

module.exports = MenuModel;
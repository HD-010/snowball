/*
 * @Description: In User Settings Edit
 * @Author: your name
 * @Date: 2019-06-04 10:32:08
 * @LastEditTime: 2019-08-28 17:51:19
 * @LastEditors: Please set LastEditors
 */
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
            table:["#@sys_menu"],                                 //查询的表名
            fields:["id","pid","name","weight","icon","url","valid"],           //被查询的字段名称（别名在此指定）
            where:[],           //查询条件
            orderBy:['pid asc',' weight asc']
        };
        if(pid > 0) condition.where.push("pid=" + pid + " or (pid in (select id from #@sys_menu where pid = " + pid + "))");
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
     * 根据nid查找菜单id
     */
    this.listByNid = async function(params){
        var condition = {
            table:["#@sys_menu"],    //查询的表名
            fields:["id"],           //被查询的字段名称（别名在此指定）
            where:[]                 //查询条件
        };
        var data = {
            error: 1,
            message: ['删除成功','参数错误，删除失败']
        }
        if(!params.nid) return data;
        condition.where.push("comid='" + params.nid + "'");
        var results = await this.DB().syncGet(condition);

        return mergeObj([data, results]);
    }


    /**
     * 添加组件到菜单
     */
    this.add = function(params,callback){
        var data = {error: 0};
        var topid = params.topid || 3;
        var ctag = '/ctag/' + params.nid;
        var sql0 = "select max(id)+1 as pid from `#@sys_menu` where pid="+topid;
        
        this.DB().select(sql0, function(error, results){
            data.error = error ? 1 : 0; 
            if(error) return callback(data);
            var sql = "insert into `#@sys_menu` values \
            ("+ results[0].pid+", "+ topid +", 'icon', '"+ params.comname +"', 0, '', '1', '1','"+ params.nid+"')";
            that.DB().insert(sql, function(error, results){
                data.error = error ? 1 : 0; 
                if(!error) data.menuid = results.insertId;
                that.DB().select(sql0, function(error, results){
                    data.error = error ? 1 : 0; 
                    if(error) return callback(data);
                    var sql1 = "insert into `#@sys_menu` values \
                    ("+ parseInt(data.menuid) * 10 + 1 +", "+ data.menuid +", '', '查看"+ params.comname +"', 0, '/admin/arc/show"+ ctag +"', '1', '1','"+ params.nid+"'),\
                    ("+ parseInt(data.menuid) * 10 + 2 +", "+ data.menuid +", '', '创建"+ params.comname +"', 0, '/admin/arc/add"+ ctag +"', '1', '1','"+ params.nid+"'),\
                    ("+ parseInt(data.menuid) * 10 + 3 +", "+ data.menuid +", '', '添加栏目', 0, '/admin/type/add"+ ctag +"', '1', '1','"+ params.nid+"'),\
                    ("+ parseInt(data.menuid) * 10 + 4 +", "+ data.menuid +", '', '查看栏目', 0, '/admin/type/index"+ ctag +"', '1', '1','"+ params.nid+"'),\
                    ("+ parseInt(data.menuid) * 10 + 5 +", "+ data.menuid +", '', '管理分类', 0, '/admin/classify/index"+ ctag +"', '1', '1','"+ params.nid+"')";

                    that.DB().insert(sql1, function(error, results){
                        data.error = error ? 1 : 0;
                        if(!error) data.menuSubid = results.insertId;
                        callback(data);
                    });
                })
            })
        })
    }

    /**
     * 根据comid删除菜单
     */
    this.del = function(params, callback){
        let data = {error:1, message: ["删除成功！","参数nid错误！"]};
        let conditions = {
            table: "#@sys_menu",
            where: []
        }
        if(!params.nid) return callback(data);
        conditions.where.push("comid='" +params.nid+ "'");
        that.DB().del(conditions, function(error, results){
            data.error = error ? 1: 0;
            data.results = results;
            return callback(data);
        });
    }


}

module.exports = MenuModel;
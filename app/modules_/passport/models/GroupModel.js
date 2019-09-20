//用户分组
function GroupModel() {
    //插入分组信息
    this.insertGroup = function(params, callback) {
        //返回的数据格式
        var data = {
            error: 1,
            message: "数据校验失败"
        };
        var groupName = this.POST('groupName', { default: false });
        if (groupName === false) {
            data.message = "您没有填写帐号！";
            callback(data);
            return;
        }
        var status = this.POST('status', { default: false });
        if (status === false) {
            data.message = "您没有填写用户名！";
            callback(data);
            return;
        }
        var pid = this.POST('pid');
        if(!pid){
            data.message = "系统错误！";
            callback(data);
            return;
        }
        //写入数据
        var struct = [
            //待写入的第一组数据,默认pid为2000,即新用户组id
            {
                groupName: groupName,
                status: status,
                pid: pid,
            },
        ];

        if(this.POST('type')) struct[0].type = this.POST('type');

        //初始化构造查询对象 
        var sqlStruct = this.SqlStruct(struct);
        //实例服务层去插入数据库
        var _group = this.service('Group');
        _group.addSysGroup(sqlStruct, function(error, results, fields) {
            data = error ? { error: 1, message: "数据写入失败！" } : { error: 0, 
                insertId: results.insertId,
                message: '添加成功，正返回列表...', 
                uri: '/admin/role/list' };
            callback(data);
        });
    }

    //查询角色
    this.allGroup = function(params, callback) {
        //返回的数据格式
        var data = {
            error: 1,
            message: "数据校验失败"
        };

        //查询数据的SQL
        var struct = {
            where: [],
            groupBy: [],
            orderBy: [],
            limit: []
        };
        
        struct.where.push(" deleted = 0 ");
        //初始化构造查询对象
        var sqlStruct = this.SqlStruct(struct);

        var _group = this.service('Group');
        _group.selectSysGroup(sqlStruct, function(error, results, fields) {
            if (error || (results.length === 0)) {
                callback(data);
                return;
            }
            
            callback(results);
        });
    }

    //查询角色
    this.selectGroup = function(params, callback) {
        //返回的数据格式
        var data = {
            error: 1,
            message: "数据校验失败"
        };

        //分页信息 
        //获取当前页页面
        var pageNo = this.GET('pageNo', { default: false });
        if (!pageNo) {
            pageNo = 1
        }
        //获取前端传说的数据
        var dataObj = this.GET('!dataObj', { default: false });
        //字符转换成对象
        console.log('dataObj12', JSON.parse(dataObj));
        data.pageNo = pageNo;
        //定义每页显示数量
        var pageSize = 5;
        data.pageSize = pageSize;

        //查询数据的SQL
        var struct = {
            where: [],
            groupBy: [],
            orderBy: [],
            limit: [
                (pageNo - 1) * pageSize,
                pageSize
            ]
        };

        struct.where.push(" deleted = 0 ");
        if(params.type) struct.where.push(" type = '" + params.type + "'");
        struct.orderBy.push(' id asc ');
        //初始化构造查询对象
        var sqlStruct = this.SqlStruct(struct);

        var _group = this.service('Group');
        // 获取表总记录数据

        _group.count(sqlStruct, function(error, results, fields) {
            if (error) {
                end(1)
                return;
            }
            data.total = results[0].num;
            end();
        });

        _group.selectSysGroup(sqlStruct, function(error, results, fields) {
            data.lists = results;
            if (error || (results.length === 0)) {
                end(1)
                return;
            }
            end();
        });


        function end(tag) {
            if (tag) {
                callback(data);
                return;
            }
            if (('total' in data) && ('lists' in data)) {
                callback(data);
            }
        }

    }

    //删除角色
    this.deleteGroup = function(data, callback) {
        //返回的数据格式
        var data = {
            error: 1,
            message: "数据校验失败"
        };
        var struct = {
            where: [],
        };
        var id = this.GET('id', { default: false });
        if (id === false) {
            data.message = "参数错误！";
            callback(data);
            return;
        }
        struct.where.push(" id = " + id);

        //初始化构造查询对象
        var sqlStruct = this.SqlStruct(struct);
        var _group = this.service('Group');
        _group.deleteSysGroup(sqlStruct, function(error, results, fields) {
            data = error ? { error: 1, message: "数据删除失败！" } : { error: 0, message: '删除成功，正登录跳转...', uri: '' };
            callback(data);
        });
    }




    //编辑角色
    this.editGroup = function(data, callback) {
        //返回的数据格式
        var data = {
            error: 1,
            message: "数据校验失败"
        };
        var id = this.GET('id', { default: false });
        if (id === false) {
            data.message = "参数错误！";
            callback(data);
            return false;
        }
        var struct = {
            where: [],
            groupBy: [],
            orderBy: [],
            limit: []
        };
        struct.where.push(" id = " + id);
        //初始化构造查询对象
        var sqlStruct = this.SqlStruct(struct);
        var _group = this.service('Group');

        _group.selectSysGroup(sqlStruct, function(error, results, fields) { //errro 等1 查询数据失败  等 0 数据返回成功
            data = error ? { error: 1, message: "获取数据失败！" } : { error: 4, data: results };
            callback(data);
        });
    }

    //update角色
    this.updateGroup = function(data, callback) {
        //返回的数据格式
        var data = {
            error: 1,
            message: "数据校验失败"
        };

        var id = this.POST('id', { default: false });
        if (id === false) {
            data.message = "参数错误！";
            callback(data);
            return false;
        }
        var groupName = this.POST('groupName', { default: false });
        if (groupName === false) {
            data.message = "您没有填写帐号！";
            callback(data);
            return;
        }
        var status = this.POST('status', { default: false });
        if (status === false) {
            data.message = "您没有填写用户名！";
            callback(data);
            return;
        }
        //构造sql
        var struct = {
            feilds: {
                groupName: groupName,
                status: status,
            },
            where: [
                'id = ' + id,
            ],
            groupBy: [],
            orderBy: [],
            limit: []
        };

        if(this.POST('type')) struct.feilds.type = this.POST('type');

        //初始化构造查询对象
        var sqlStruct = this.SqlStruct(struct);
        var _group = this.service('Group');
        _group.updateSysGroup(sqlStruct, function(error, results, fields) { //errro 等1 查询数据失败  等 0 数据返回成功
            data = error ? { error: 1, message: "数据修改失败！" } : { error: 0, message: '修改成功，正在跳转...', uri: '/admin/role/list' };
            callback(data);
        });
    }
}
module.exports = GroupModel;
function SupplierModel(){
    this.allSuppliers = function(params,callback){
        var data   = {error:0};
        var struct = {
            where  : [],
            groupBy: [],
            orderBy: [],
            limit  : []
        };
        
        //初始化构造查询对象
        var sqlStruct = this.SqlStruct(struct);

        //调用服务类查询用户列表
        var supplier = this.service('Supplier');
        supplier.list(sqlStruct,function(error,results,fields){
            if(error || (results.length === 0)){
                data.error = 1;
                data.message = '查询代理商失败';
            }
            data.users = results;
            callback(data);
        });
    } 


    //查询所有商户及商户所属代理商
    this.suppliersAll = function(params,callback){
        var data={};

        //分页信息 
        //获取当前页页面
        var pageNo = this.GET('pageNo', { default: false });
        if (!pageNo) {
            pageNo = 1
        }
        data.pageNo = pageNo;
        //定义每页显示数量
        var pageSize = 6;
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
        //获取总记录数sql
        var structt = {
            where: [],
            groupBy: [],
            orderBy: [],
            limit: []
        };

        //初始化构造查询对象
        var sqlStruct = this.SqlStruct(struct);
        var sqlStructt = this.SqlStruct(structt);
       

        //调用服务类查询用户列表
        var supplier = this.service('Supplier');
        supplier.list(sqlStruct,function(error,results,fields){
            if (error || results.length==0) {
                end(1)
                return;
            }
            data.list = results;
            end()
        });

         // 获取表总记录数据
         supplier.countSup(sqlStructt, function(error, results, fields) {
            if (error) {
                end(1)
                return;
            }
            data.total = results[0].total;
            end();
        });

        function end(tag) {
            if (tag) {
                callback(data);
                return;
            }
            if (('total' in data) && ('list' in data)) {
               
                callback(data);
            }
        }
       
    }
}
module.exports = SupplierModel;
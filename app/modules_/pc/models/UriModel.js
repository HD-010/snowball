function UriModel() {
    //查询案例2：
    this.parse = function(params,callback){
        let struct = {
            where  : [],
            groupBy: [],
            orderBy: [],
            limit  : [0,1]
        };
        //添加查询条件
        let rid = 1;
        if(this.GET('rid')) rid = this.GET('rid');
        if(params.rid) rid = params.rid;
        struct.where.push(" id =" + this.GET('rid')); 

        //初始化构造查询对象
        let sqlStruct = this.SqlStruct(struct);
        
        //调用服务类进行查询
        let route = this.service('Route');
        route.realUrl(sqlStruct,function(error,results,fields){
            callback(error,results,fields);
        });
    }

    //写入uri
    this.add = function(data,callback){
        let struct = [{uri: data.uri}];

        //初始化构造查询对象
        let sqlStruct = this.SqlStruct(struct);

        let route = this.service('Route');
        route.addUri(sqlStruct,function(error,results,fields){
            callback(error,results,fields);
        });
    }
    

}

module.exports = UriModel;
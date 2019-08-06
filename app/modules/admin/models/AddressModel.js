function AddressModel(){
    var that = this;

    /**
     * 根据reid(上一级id)查询省或市或县名称
     */
    that.names = function(params, callback){
        var data = {error: 1};
        var reid = this.POST('reid') || 0;
        var conditions = {
            table: ['youbang_sys_area'],
            where: []
        }
        conditions.where.push("reid='"+ reid +"'");

        that.DB().log().get(conditions,function(error,results){
            data.error = (error || !results.length) ? 1 : 0;
            data.names = results;
            data.name = queryresultKeyValue(results,'name'),
            data.id = queryresultKeyValue(results,'id'),
            callback(data);
        });
    }

    /**
     * 查看地址
     */
    this.show = function(params, callback){
        var data = {error: 1,message:"参数错误"}
        var type = this.POST('type');
        var id =  this.POST('id');
        if(!id || !type) return callback(data);
        var conditions = {
            table: ['youbang_addresslist'],
            where: []
        }

        conditions.where.push('id=' + id, 'type="' + type + '"');
        this.DB().log().get(conditions,(error, results, fields)=>{
            data.error = (error || results.length) ? 1 : 0;
            if(!error) data.message = "ok";
            data.addr = results;
            return callback(data);
        });
    }

    /**
     * 保存地址
     */
    that.save = function(params,callback){
        var data = {error: 1, message: '参数错误'};
        var addr = this.POST('addr');
        var type = this.POST('type');
        var edt = this.POST('edt') ;
        var id = this.POST('id') ;
        if(!addr || !type) return callback(data);
        addr = addr.split('-');

        var conditions = {
            table: ['youbang_addresslist'],
            fields:[],
            where: []
        }
        var recod = {type: type}
        if(type == 'infos') {
            recod.provinceid = addr[0];
            recod.cityid = addr[1];
            recod.countyid = addr[2];
            recod.detail = addr[3];
        }
        if(!edt) recod.addtime = 'DATE_FORMAT(now(),"%Y-%m-%d %H:%i:%s")';
        if(edt) conditions.where.push('id=' + id);
        conditions.fields.push(recod);

        this.DB().log().set(conditions, function(error, results){
            data.error = error ? 1 : 0;
            if(error){
                data.error = 1;
                data.message = "操作失败";
                return callback(data);
            }
            data.newId = results.insertId;
            data.message = "保存操作成功";
            return callback(data);
        });


        

    }
    
}
module.exports = AddressModel;
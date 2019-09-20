function MemberModel(){
    var that = this;

    /**
     * 根据 mid 查询会员信息
     */
    that.info = function(params, callback){
        var data = {error : 1, message : "查询失败", data : []};
        var conditions = {
            table : ['snowball_sys_acount'],
            where : [],
            having : [],
            groupBy : [],
            limit : []
        }
        var mid = this.POST('mid');
        if(!mid) {
            data.message = "mid is null";
            return callback(data);
        }
        conditions.where.push(" id = " + mid );

        that.DB().get(conditions,function(error, results,fields){
            if(error) return callback(data);
            data.error = 0;
            data.message = "ok";
            if(!results.length) data.message = "查询数据为空";
            data.data = results[0];
            
            return callback(data);
        })
    }

    //更新数据
    this.infoUpdate = function(params,callback){
        var struct = {
            feilds:{},
            where:['id = ' + this.POST('id') ],
         };
         
         if(this.POST('face')) struct.feilds['face'] = this.app.param('apiHost')[1] + "/"+this.POST('face');
         if(this.POST('nick')) struct.feilds['nick'] = this.POST('nick');
         if(this.POST('sex')) struct.feilds['sex'] = this.POST('sex');
         if(this.POST('birthday')) struct.feilds['birthday'] = this.POST('birthday');
         if(this.POST('mobile')) struct.feilds['mobile'] = this.POST('mobile');
         if(this.POST('password')) {
             var mask =  parseInt(500*Math.random());
             struct.feilds['mask'] = mask;
             let utility = require('utility');
             struct.feilds['password'] = utility.md5(this.POST('password') + mask);
            }
            
            console.log(struct);
        //初始化构造查询对象
        var sqlStruct = this.SqlStruct(struct);

        this.service('Member').updateInfo(sqlStruct,function(error,results,fields){
            callback(error,results,fields);
        })
    }
}

module.exports = MemberModel;
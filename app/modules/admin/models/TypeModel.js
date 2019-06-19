function TypeModel(){
    var that = this;
    /**
     * 查询栏目列表
     */
    this.list = function(params,callback){
        var data = {};
        var conditions = {
            table : ['youbang_arctype'],
            fields : ['*'],
            where : [],
            orderBy:['topid asc', 'id desc'],
        };
        if(params.id) conditions.where.push("id=" + params.id);

        this.DB().get(conditions,function(error,res){
            data.error = error ? 1 : 0;
            data.data = res;
            return callback(data);
        });
    }

    /**
     * 保存栏目编辑后的信息
     */
    this.save = function(param, callback){
        var data = {
            error: 1,
            message:"参数错误"
        };
        var id = this.POST('atid');
        if(!id) return callback(data);
        var conditions = {
            table:'youbang_arctype',
            where:[],
            fields:[]
        }
        
        if(id) conditions.where.push("id=" + id);
        var upData = {};
        upData.typename = this.POST('typename') || "";
        upData.ishidden = parseInt(this.POST('ishidden')) || 0;
        upData.topid = parseInt(this.POST('topid')) || 0;
        upData.issend = parseInt(this.POST('issend')) || 0;
        upData.maxpage = parseInt(this.POST('maxpage')) || 1;
        upData.corank = parseInt(this.POST('corank')) || 0;
        upData.seotitle = this.POST('seotitle') || '';
        upData.keywords = this.POST('keywords') || '';
        upData.description = this.POST('description') || '';
        upData.sitepath = this.POST('sitepath') || '';
        upData.siteurl = this.POST('siteurl') || '';
        conditions.fields.push(upData);

        this.DB().set(conditions,function(error,results,fields){
            data.error = error?1:0;
            data.data = results
            if(error) data.message = "保存数据失败";
            if(!error) data.message = '数据保存成功,正在跳转到列表...';
            return callback(data);
        });
    }

}

module.exports = TypeModel;
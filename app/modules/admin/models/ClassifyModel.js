function ClassifyModel(){
    var that = this;

    this.get = function(params,callback){
        var conditions = {
            table: ['youbang_arcclass'],
            where: []
        }
        conditions.where.push("comtag='" + params.ctag + "'");
        conditions.where.push("macid='" + params.macid + "'");
        conditions.where.push("enable='" + params.enable + "'");  //按分类是否启用为条件查找

        this.DB().log().get(conditions,function(error,results){
            var data = {};
            //data.error =  (error || !results.length) ? 1 : 0;
            data.error =  error ? 1 : 0;
            data.results = (!results.length) ? [] :
            decodeURI(recodeBase64decode(results,'classify')[0].classify);
            data.macid = params.macid;
            data.ctag = params.ctag;
            data.id = results[0] ? results[0].id : '';
            data.enable = results[0] ? results[0].enable : '0';
            
            callback(data);
        })
    }

    this.save = function(params,callback){
        var conditions = {
            table: 'youbang_arcclass',
            fields: [],
            where: []
        }
        var data = {};
        var macid = this.POST('macid');
        if(macid) data.macid = macid;
        var classify = this.POST('classify');
        if(classify) data.classify = classify;
        var enable = this.POST('usespec');
        data.enable = enable ? '1' : '0';
        var comtag = this.POST('component');
        if(comtag) data.comtag = comtag;
        conditions.fields.push(data);
        var id = this.POST('id');
        if(id) conditions.where.push('id=' + id);

        this.DB().set(conditions,function(error,results){
            var data = {};
            data.error = 1;
            data.message = "操作成功，请稍后再试";
            if(!error){
                data.error = 0;
                data.message = '操作成功，正在刷新';
                data.uri = '/admin/classify/index/ctag/' + params.nid;
            }
            data.results = results;
            callback(data);
        });
    }

}

module.exports = ClassifyModel;
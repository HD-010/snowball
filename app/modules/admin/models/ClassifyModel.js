function ClassifyModel(){
    var that = this;

    this.get = function(params,callback){
        var conditions = {
            table: ['youbang_arcclass'],
            where: []
        }
        conditions.where.push("comtag='" + params.ctag + "'");
        conditions.where.push("macid='" + params.macid + "'");

        this.DB().get(conditions,function(error,results){
            var data = {};
            data.error =  (error || !results.length) ? 1 : 0;
            if(!results.length) data.results = {};
            data.results = decodeURI(recodeBase64decode(results,'classify')[0].classify);
            data.macid = params.macid;
            data.ctag = params.ctag;
            data.id = results[0] ? results[0].id : '';
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
        if(enable) data.enable = '1' || '0';
        var comtag = this.POST('component');
        if(comtag) data.comtag = comtag;
        conditions.fields.push(data);
        var id = this.POST('id');
        if(id) conditions.where.push('id=' + id);

        this.DB().log().set(conditions,function(error,results){
            var data = {};
            data.error = 1;
            data.message = "操作成功，请稍后再试";
            if(!error){
                data.error = 0;
                data.message = '操作成功，正在刷新';
                data.uri = '/admin/classify/add/ctag/infos';
            }
            data.results = results;
            callback(data);
        });
    }

}

module.exports = ClassifyModel;
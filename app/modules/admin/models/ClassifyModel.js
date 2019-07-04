function ClassifyModel(){
    var that = this;

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
            data.error = error ? 1 : 0;
            data.results = results;
            callback(data);
        });
    }

}

module.exports = ClassifyModel;
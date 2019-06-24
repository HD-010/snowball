function ArcModel(){
    /**
     * 
     * 保存数据到主表
     */
    this.saveHives = function(params,callback){
        var conditions = {
            table:'youbang_archives',
            where:[],
            fields:[],
        }
        var record = {};
        var flag = this.POST('flag');
        flag = (typeof flag == 'object') ? flag : [flag];
        record.flag = "'" + flag.join("','") + "'";
        record.title = this.POST('title') || '';
        record.shorttitle = this.POST('shorttitle') || '';
        record.component = this.POST('component') || '1';
        record.keywords = this.POST('keywords') || '';
        record.description = this.POST('description') || '';
        record.weight = this.POST('weight') || 0;
        record.litpic = this.POST('litpic') || '';
        conditions.fields.push(record);

        this.DB().log().set(conditions,function(error,results,fields){
            var data = {};
            data.error = error ? 1 : 0;
            data.results = results;
            callback(data);
        });
    }

    /**
     * 
     * 保存数据到附加表
     */
    this.saveAddon = function(params,callback){
        var listfields = params.listfields.split(',');
        var conditions = {
            table:'youbang_addoninfos',
            fields: [],
            where : []
        }
        var record = {};
        var field = "";
        for(var i in listfields){
            field = this.POST(listfields[i]);
            record[listfields[i]] = field ? field : 
            array2value(params.fieldset,'field',listfields[i],'default');
            field = "";
        }
        record.aid = params.aid;
        conditions.fields.push(record);
        this.DB().log().set(conditions,function(error,results,fields){
            callback(results);
        });
    }

    /**
     * 查询附加表字段信息
     */
    this.addonTableInfor = function(params,callback){
        //使用案例：实例化TestService并调用showApp()方法
        var conditions = {
            table:['youbang_components'],
            where:[],
            limit:[1]
        }
        if(params.nid) conditions.where.push("nid='" + params.nid + "'");
        this.DB().get(conditions,function(error,results,fields){
            var data = {};
            data.error = error ? 1 : 0;
            data.results = recodeJsonParse(results,'fieldset');
            callback(data);
        });
    }

}

module.exports = ArcModel;
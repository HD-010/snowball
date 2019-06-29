function ArcModel(){
    /**
     * 查询（文章）列表
     */
    this.lists = function(params,callback){
        var noVAlid = ['body'];     //定义的字段会被base64编码
        var conditions = {
            table: ['youbang_archives'],
            fields: ['youbang_archives.*', params.addonTab + '.*'],
            joinOn: ' left join ' + params.addonTab + ' on youbang_archives.id=' + params.addonTab + '.aid',
            where: [],
            limit: []
        };
        if(params.id) {
            conditions.where.push('youbang_archives.id=' + params.id);
            conditions.limit.push(1);
        }
        conditions.where.push(params.addonTab + '.aid is not null');
        this.DB().get(conditions,(error,results)=>{
            var data = {};
            data.error = error ? 1 : 0;
            data.results = error ? [] : recodeBase64decode(results,noVAlid);
            callback(data);
        });
    }
    
    /**
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
        record.flag = flag.join('-');
        record.title = this.POST('title') || '';
        record.shorttitle = this.POST('shorttitle') || '';
        record.component = this.POST('component') || '1';
        record.keywords = this.POST('keywords') || '';
        record.description = this.POST('description') || '';
        record.weight = this.POST('weight') || 0;
        record.litpic = this.POST('litpic') || '';
        conditions.fields.push(record);
        var id = this.POST('id');
        if(id) conditions.where.push('id=' + id);

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
        var utility = require('utility');
        var noVAlid = ['body'];     //定义的字段会被base64编码
        var listfields = queryresultKeyValue(params.fieldset,'field');
        var conditions = {
            table: params.addtable,
            fields: [],
            where : []
        }
        var record = {};
        for(var i in listfields){
            var field = "";
            var saveField = false;      //是还安全字段
            field = listfields[i];
            saveField = noVAlid.indexOf(field) + 1;
            if(saveField) field =  '!' + listfields[i];
            field = this.POST(field) || "";
            if(saveField) field = utility.base64encode(field);
            if(typeof field == 'object') field = field.join('-');
            record[listfields[i]] = field ? field : 
            array2value(params.fieldset,'field',listfields[i],'default');
        }
        record.aid = params.aid;
        conditions.fields.push(record);
        var aid = this.POST('id');
        if(aid) conditions.where.push('aid=' + aid);
        
        this.DB().log().set(conditions,function(error,results,fields){
            var data = {};
            data.error = error ? 1 : 0;
            data.message = "保存成功！";
            data.results = results
            callback(data);
        });
    }

    /**
     * 查询youbang_components，获取附加表字段信息
     */
    this.addonTableInfor = function(params,callback){
        //使用案例：实例化TestService并调用showApp()方法
        var conditions = {
            table:['youbang_components'],
            where:[],
            limit:[1]
        }
        if(params.ctag) conditions.where.push("nid='" + params.ctag + "'");
        this.DB().get(conditions,function(error,results,fields){
            var data = {};
            data.error = error ? 1 : 0;
            data.uri = "";
            data.results = recodeJsonParse(results,'fieldset');
            callback(data);
        });
    }

    /**
     * 删除主表记录
     */
    this.delHives = function(params, callback){
        var conditions = {
            table:'youbang_archives',
            where:[]
        }
        if(params.id) conditions.where.push("id in (" + params.id.replace(/_/g,',') + ")");
        this.DB().log().del(conditions,(error,results)=>{
            var data = {
                error: error,
                results: results
            }
            callback(data);
        });
    }

    /**
     * 删除附加表记录
     */
    this.delAddon = function(params, callback){
        var conditions = {
            table: params.addtable,
            where:[]
        }
        if(params.id) conditions.where.push("aid in (" + params.id.replace(/_/g,',') + ")");
        this.DB().log().del(conditions,(error,results)=>{
            var data = {
                error: error,
                results: results
            }
            callback(data);
        });
    }

}

module.exports = ArcModel;
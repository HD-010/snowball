/*
 * @Description: In User Settings Edit
 * @Author: your name
 * @Date: 2019-06-22 14:16:39
 * @LastEditTime: 2019-08-28 17:49:42
 * @LastEditors: Please set LastEditors
 */
function ArcModel(){
    var that = this;

    /**
     * 查询主附表数据（文章）列表
     */
    this.lists = function(params,callback){
        params.SEDate = this.POST('SEDate',{default:this.GET('SEDate')}) || params.SEDate || [];
        if(typeof params.SEDate != 'object') callback({error: 1, message: '时间参数错误!'});
        var sky = this.POST('sky');
        var noVAlid = array2value(params.addoninfos,'novaild',1,'field',true); //定义的字段会被base64编码
        var conditions = {
            table: ['#@archives'],
            fields: ['#@archives.*', params.addonTab + '.*'],
            joinOn: ' left join ' + params.addonTab + ' on #@archives.id=' + params.addonTab + '.aid',
            where: [],
            limit: []
        };
        if(params.id) {
            conditions.where.push('#@archives.id=' + params.id);
            conditions.limit.push(1);
        }
        if(params.SEDate.length){
            typeof params.SEDate[1] == 'number' ?
            conditions.where.push('addtime between subdate("' + params.SEDate[0] + '",interval ' + params.SEDate[1]+ ' day) and subdate("' + params.SEDate[0] + '",interval -1 day)'):
            conditions.where.push('addtime between "' + params.SEDate[0] + '" and subdate("' + params.SEDate[1] + '",interval -1 day)');
        }
        if(sky) conditions.where.push("( #@archives.title like '%" + sky + 
        "%' or #@archives.shorttitle like '%" + sky + 
        "%' or #@archives.description like '%" + sky + 
        "%' or #@archives.writer like '%" + sky + 
        "%' or #@archives.keywords like '%" + sky + "%')");
        conditions.where.push(params.addonTab + '.aid is not null');
        this.DB().log().get(conditions,(error,results)=>{
            var data = {};
            data.error = results.length ? 0 : 1;
            data.results = error ? [] : recodeBase64decode(results,noVAlid);
            callback(data);
        });
    }

    /**
     * 获取第三类表数据
     * 注：当前第三类表查询，只支持
     */
    this.thirdList = function(params,callback){
        var ps = 0;
        var tempTab = [];
        var tempWhere = [];
        var data = {error: 0, thirdList:[]};
        var tab = params.effectTabs || [];
        var noVAlid = array2value(params.addoninfos,'novaild',1,'field',true); //定义的字段会被base64编码
        if(!params.id) return callback(data);
        for(var j = 0; j < tab.length; j ++){
            if(tab[j] == 'main' || tab[j] == 'addon') continue;
            tempTab.push(tab[j].substring(4) + ' as `_'+ j +'`');
            tempWhere.push('`_' + j + '`.aid=' + params.id);
        } 
        if(!tempTab.length) return callback(data);
        var sql = 'select * from ' + tempTab.join(',') + ' where ' + tempWhere.join(' and ');
        this.DB().select(sql,function(error,results,fields){
            data.error = error ? 1 : 0;
            data.thirdList = error ? [] : recodeBase64decode(results,noVAlid);
            return callback(data);
        });
    }

    
    /**
     * 保存数据到主表
     */
    this.saveHives = function(params,callback){
        
        var data = {error: 1, message: '请填完整必填项！'};
        var classify = this.POST('classify');
        if(!classify) return callback(data);
        var litpic = this.POST('litpic');
        var conditions = {
            table:'#@archives',
            where:[],
            fields:[],
        }
        var record = {};
        var flag = this.POST('flag');
        flag = (typeof flag == 'object') ? flag : [flag];
        record.flag = flag.join('-');
        record.title = this.POST('title') || '';
        record.classify = classify;
        record.typeid = parseInt(this.POST('typeid')) || 0;
        record.shorttitle = this.POST('shorttitle') || '';
        record.component = this.POST('component') || '1';
        record.keywords = this.POST('keywords') || '';
        record.description = this.POST('description') || '';
        record.weight = this.POST('weight') || 0;
        record.state = this.POST('state') || 0;
        record.litpic = litpic || '';
        record.addtime = this.POST('!addtime') || 'now()';
        record.mid = that.model("DataProcess").uid();
        conditions.fields.push(record);
        var id = this.POST('id');
        if(id) conditions.where.push('id=' + id);

        this.DB().set(conditions,function(error,results,fields){
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
        var addoninfos =  params.addoninfos;
        var conditions = {
            table: params.addtable,
            fields: [],
            where : []
        }
        var record = {};
        for(var i in addoninfos){
            if((addoninfos[i].effect && addoninfos[i].effect != 'addon') || !addoninfos[i].fieldset) continue;
            var field = "";
            field = addoninfos[i].field;
            field = addoninfos[i].novaild ? this.POST('!' + field) : this.POST(field);
            field = field || array2value(addoninfos, 'field', field, 'default');
            if(addoninfos[i].novaild) field = utility.base64encode(field);
            if(field.constructor.name == 'Array') field = field.join('-');
            record[addoninfos[i].field] = field ? field : 
            array2value(addoninfos,'field',addoninfos[i].field,'default');
        }
        record.aid = params.aid;
        record.typeid = parseInt(this.POST('typeid')) || 0;
        conditions.fields.push(record);
        var aid = this.POST('id');
        if(aid) conditions.where.push('aid=' + aid);
        this.DB().set(conditions,function(error,results,fields){
            var data = {};
            data.error = error ? 1 : 0;
            data.message = "保存成功！";
            data.results = results;
            callback(data);
        });
    }

    /**
     * 保存第三类表数据
     */
    this.saveThirdTab = function(params, callback){
        var ps = 0;
        var conditions,aid;
        var data = {error: 1};
        var tab = params.effectTabs || [];
        var addoninfos =  params.addoninfos;
        for(var j = 0; j < tab.length; j ++){
            if(tab[j] == 'main' || tab[j] == 'addon') continue;
            ps ++;

            conditions = {
                table: tab[j].substring(4),
                fields: [],
                where : []
            }
            for(var i in addoninfos){
                if(addoninfos[i].effect != tab[j]) continue;
                var field = "";
                field = addoninfos[i].field;
                field = addoninfos[i].novaild ? this.POST('!' + field) : this.POST(field);
                field = field || array2value(addoninfos, 'field', field, 'default');
                if(addoninfos[i].novaild) field = utility.base64encode(field);
                
                if(field.constructor.name != 'Array') field = [field];
                for(var k = 0; k < field.length; k ++){
                    if(!conditions.fields[k]) conditions.fields[k] = {};
                    conditions.fields[k][addoninfos[i].field] = field[k] ? field[k] : 
                    array2value(addoninfos,'field',addoninfos[i].field,'default');
                    conditions.fields[k]['aid'] = params.aid;
                }
            }
            aid = this.POST('id');
            if(aid) conditions.where.push('aid=' + aid);

            this.DB().log().set(conditions,function(error,results,fields){
                var data = {};
                data.error = error ? 1 : 0;
                data.message = "保存成功！";
                data.results = results;
                end(data);
            });
        }
        
        function end(data){
            ps --;
            if(ps===0 || data.error) callback(data);
        }
    }

    
    /**
     * 删除主表记录
     */
    this.delHives = function(params, callback){
        var conditions = {
            table:'#@archives',
            where:[]
        }
        if(!params.id) return callback({error:1, message:'参数错误，删除失败'});
        conditions.where.push("id in (" + params.id.replace(/_/g,',') + ")");
        this.DB().del(conditions,(error,results)=>{
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
        if(!params.id) return callback({error:1, message:'参数错误，删除失败'});
        conditions.where.push("aid in (" + params.id.replace(/_/g,',') + ")");
        this.DB().del(conditions,(error,results)=>{
            var data = {
                error: error,
                results: results
            }
            callback(data);
        });
    }

    /**
     * 删除第三类表数据
     */
    this.delThirdTab = function(params, callback){
        var ps = 0;
        var conditions;
        var data = {error: 1};
        var tab = params.effectTabs || [];
        if(!params.id) return callback({error:1, message:'参数错误，删除失败'});
        //var addoninfos =  params.addoninfos;
        for(var j = 0; j < tab.length; j ++){
            if(tab[j] == 'main' || tab[j] == 'addon') continue;
            ps ++;

            conditions = {
                table: tab[j].substring(4),
                where : []
            }
            conditions.where.push("aid in (" + params.id.replace(/_/g,',') + ")");
            this.DB().del(conditions,function(error,results,fields){
                var data = {};
                data.error = error ? 1 : 0;
                end(data);
            });
        }
        
        function end(data){
            ps --;
            if(ps===0 || data.error) callback(data);
        }
    }

}

module.exports = ArcModel;
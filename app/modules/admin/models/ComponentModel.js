/*
 * @Description: In User Settings Edit
 * @Author: your name
 * @Date: 2019-06-15 14:46:48
 * @LastEditTime: 2019-08-31 08:47:31
 * @LastEditors: Please set LastEditors
 */
function ComponentModel(){
    var utility = require('utility');
    var that = this;
    /**
     * 组件配置原数据
     */
    var originData = {
        field: "",			        //字段标识
        itemname: "",			    //字段名称(显示有页面)
        type: "int",				//数据表中数据类型
        maxlength: "",			    //字段最大长度
        isnull: false,				//数据表中是否允许为null
        islist: "",			        //数据表中值是否为列表(如果是列表，其值为列表名称；否则为空)
        default: '',				//字段默认值
        effect: "",					//作用于表，可选值main(itemnamet和islist项同时作用于主表）|""(默认附加表) | "tab_表名"（各项属性适用于对应名称的表）
        fieldget: 0,				//是否采集数据（如果设置1，则在视图输出该字段的输入框；返回之不输出。）
        fieldset: 0,				//是否写入数据（如果设置1，则在model中获取客户后台客户端采集到的数据，将其保存到数据库中；返回之不保存。）
        limit: 1,					//限制图片上传的张数，或限制address的层级数
        novaild: 0,					//如果为true，对字段不需要特殊字符过滤
        inputtype:"input",			//输入框类型 input|checkbox|radio|select|textarea|uediter|uploader|nesmodal|address|freemodal
        attr: " data-comment=如：这是注释" //视图中输入框属性
    }

    /**
     * 查询#@components，获取组件列表,获取获取组件字段信息
     */
    this.list = function(params,callback){
        //使用案例：实例化TestService并调用showApp()方法
        var conditions = {
            table:['#@components'],
            where:[],
            limit:[]
        }
        if(params.limit) conditions.limit.push(params.limit);
        if(params.id) conditions.where.push("id=" + params.id);
        if(params.ctag) conditions.where.push("nid='" + params.ctag + "'");
        if(params.id || params.ctag) conditions.limit.push(1);
        
        this.DB().get(conditions,function(error,results,fields){
            var data = {};
            data.error = (error || !results.length) ? 1 : 0;
            data.uri = "";
            data.results = recodeJsonParse(recodeBase64decode(results,'addoninfos'),'addoninfos');
            return callback(data);
        });
    }

    /**
     * 保存数据
     */
    this.save = function(params,callback){
        var fields,temField,conditions,names,temData,addonInfos;
        var data = {
            error: 1,
            message:["保存成功","请检查填写项，输入有误！！"]
        }
        conditions = {
            table: '#@components',
            fields: [],
            where: []
        }
        fields = this.POST('field');
        if(typeof fields != "object") fields = [fields];
        addonInfos = [];
        for(var i = 0; i < fields.length; i ++ ){
            if(!fields[i]) continue;
            if(!names) names  = Object.keys(originData);
            temField = {};
            for(var j = 0; j < names.length; j ++){
                temData = this.POST(names[j]);
                if(typeof temData == 'undefined') temData = [];
                if(!temData[i]) continue;
                if(typeof temData != 'object') temData = [temData];
                if(names[j] == 'field'){
                    temField[names[j]] = temData[i].replace(/\s/g,'');  //字段名称不能有空格
                    continue;
                }
                if((names[j] == 'effect') && 
                (temData[i] != 'main' && temData[i] != 'addon' && temData[i])){
                    temData[i] = temData[i].replace(/tab_#@/g, '');
                    temField[names[j]] = 'tab_#@' + temData[i].replace(/\s/g,'');  //表名稱不能有空格
                    continue;
                }
                temField[names[j]] = temData[i];
                
            }
            addonInfos.push(mergeObj([originData, temField]));
        }
        
        if(!addonInfos.length) return callback(data);
        var nid = that.POST('nid');
        if(!nid) return callback(data);
        nid = nid.toLowerCase();
        conditions.fields.push({
            nid: nid,
            comname: params.comname,
            maintable: '#@archives',
            addtable:  '#@addon' + nid,
            addoninfos: utility.base64encode(JSON.stringify(addonInfos)),
            issystem: 0,
            isshow: 1,
            icon: params.icon
        })
        
        data.comInfos = conditions.fields[0];
        var comid = this.POST('comid');
        if(comid) conditions.where.push('id="' + comid + '"');
        this.DB().set(conditions, function(error, results){
            data.error = error? 1: 0;
            
            return callback(data);
        });
    }

    /**
     * 创建组件信息表
     */
    this.create = async function(params,callback){
        var tabSql = {};
        //第二类表固定字段
        var addonSFields = ['aid', 'typeid', 'componentid', 'arcrank', 'mid'] ;
        var addonFields = [
            "`aid` bigint(13) NOT NULL DEFAULT '1'",
            "`typeid` int(11) NOT NULL DEFAULT '1' COMMENT '栏目id'",
            "`componentid` smallint(6) NOT NULL DEFAULT '1' COMMENT '组件id'",
            "`arcrank` smallint(6) NOT NULL DEFAULT '0' COMMENT '排序'",
            "`mid` mediumint(8) unsigned NOT NULL COMMENT '发布人id'"
        ];

        //第三类表固定字段
        var otherSFields = ['id', 'aid', 'mid'];
        var otherFields = [
            "`id` bigint(13) not null primary key AUTO_INCREMENT ",
            "`aid` bigint(13) NOT NULL DEFAULT '1'",
            "`mid` mediumint(8) unsigned NOT NULL COMMENT '发布人id'"
        ]
        var data = {
            error: 1,
            message:["保存成功","请检查填写项，输入有误！！"]
        }
        var fieldInfos = JSON.parse(utility.base64decode(params.comInfos.addoninfos));
        var _null,_default;
        var tab = params.comInfos.addtable.replace(/\s/g, '');
        
        for(var i = 0; i < fieldInfos.length; i ++){
            var field = [];
            var 
            _null = '';
            _default = '';
            //创建附加表字段
            if(!params.effect[i]) params.effect[i] = 'addon';
            var fieldName = fieldInfos[i]['field'].replace(/\s/g,'');
            //过滤表固有的字段
            if(params.effect[i] == 'main') continue;
            if((params.effect[i] == 'addon') && (addonSFields.indexOf(fieldName) + 1)) continue;
            if(((params.effect[i] != 'main') && ((params.effect[i] != 'addon'))) && (otherSFields.indexOf(fieldName) + 1)) continue;
            field.push('`' + fieldName + '`');
            field.push(fieldInfos[i]['type']);
            field.push(fieldInfos[i]['maxlength']?'(' + fieldInfos[i]['maxlength'] + ')':'');
            _null = fieldInfos[i]['isnull'] ? 'NULL' : 'NOT NULL';
            field.push( _null );
            _default = fieldInfos[i]['default'] ? 'DEFAULT '+ fieldInfos[i]['default'] : '';
            field.push( _default );
            field.push('COMMENT "' + fieldInfos[i]['itemname'] + '"');
            if(!tabSql[params.effect[i]]) tabSql[params.effect[i]] = [];
            var fieldSql = field.join(" ");
            tabSql[params.effect[i]].push(fieldSql);
        }
        var sql = sSql = allSql = ctab = '';
        for(var k in tabSql){
            allSql = tabSql[k];
            k = k.replace(/^tab_/g,'');
            sql =  (k == 'addon') ? 
            'drop table if exists `'+ tab +'`' :
            'drop table if exists `#@' + k + '`';
            var drop = await this.DB().syncQuery(sql);
            if(drop.error) return callback(data);
            sSql = (k == 'addon') ? addonFields : otherFields;
            allSql = allSql.concat(sSql);
            ctab = (k == 'addon') ? tab : '#@' + k;
            sql = 'create table '+ctab+'(' + allSql.join(',') + '\
            )ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;';
            var creat = await this.DB().syncQuery(sql);
            if(creat.error) return callback(data);
        }
        data.error = 0;
        return callback(data);
    }
    
}

module.exports = ComponentModel;
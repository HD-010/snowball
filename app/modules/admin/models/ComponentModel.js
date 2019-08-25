function ComponentModel(){
    var that = this;
    /**
     * 组件配置原数据
     */
    var originData = {
        field: "",			//字段标识
        itemname: "",			//字段名称(显示有页面)
        type: "int",					//数据表中数据类型
        maxlength: "10",				//字段最大长度
        isnull: true,					//数据表中是否允许为null
        islist: "信息分类",				//数据表中值是否为列表(如果是列表，其值为列表名称；否则为空)
        default: 0,					//字段默认值
        effect: "",					//作用于表，可选值main(itemnamet和islist项同时作用于主表）|""(默认附加表) | "tab_表名"（各项属性适用于对应名称的表）
        fieldget: 1,					//是否采集数据（如果设置1，则在视图输出该字段的输入框；返回之不输出。）
        fieldset: 1,					//是否写入数据（如果设置1，则在model中获取客户后台客户端采集到的数据，将其保存到数据库中；返回之不保存。）
        limit: 1,						//限制图片上传的张数，或限制address的层级数
        novaild: 1,					//如果为true，对字段不需要特殊字符过滤
        inputtype:"input",			//输入框类型 input|checkbox|radio|select|textarea|uediter|uploader|nesmodal|address|freemodal
        attr: " disabled data-def=4 data-comment=如：这是注释" //视图中输入框属性
    }

    /**
     * 查询youbang_components，获取组件列表,获取获取组件字段信息
     */
    this.list = function(params,callback){
        //使用案例：实例化TestService并调用showApp()方法
        var conditions = {
            table:['youbang_components'],
            where:[],
            limit:[]
        }
        if(params.limit) conditions.limit.push(params.limit);
        if(params.id) conditions.where.push("id=" + params.id);
        if(params.ctag) conditions.where.push("nid='" + params.ctag + "'");
        if(params.id || params.ctag) conditions.limit.push(1);
        
        this.DB().get(conditions,function(error,results,fields){
            var data = {};
            data.error = error ? 1 : 0;
            data.uri = "";
            data.results = recodeJsonParse(results,'addoninfos');
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
            table: 'youbang_components',
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
                if(!temData[i]) continue;
                if(typeof temData != 'object') temData = [temData];
                temField[names[j]] = temData[i];
            }
            addonInfos.push(mergeObj([originData, temField]));
        }
        
        if(!addonInfos.length) return callback(data);comname
        var nid = that.POST('nid');
        if(!nid) return callback(data);
        var comname = that.POST('comname');
        if(!comname) return callback(data);
        conditions.fields.push({
            nid: nid,
            comname: comname,
            maintable: 'youbang_archives',
            addtable:  'youbang_addon' + nid,
            addoninfos: JSON.stringify(addonInfos),
            issystem: 0,
            isshow: 1,
            icon: this.POST('icon')
        })
        var comid = this.POST('comid');
        if(comid) conditions.where.push('id=' + comid);
        this.DB().log().set(conditions, function(error, results){
            data.error = error? 1: 0;
            
            return callback(data);
        });
    }
}

module.exports = ComponentModel;
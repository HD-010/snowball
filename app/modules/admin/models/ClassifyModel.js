/*
 * @Description: In User Settings Edit
 * @Author: your name
 * @Date: 2019-08-16 15:28:18
 * @LastEditTime: 2019-08-31 15:30:14
 * @LastEditors: Please set LastEditors
 */
function ClassifyModel(){
    var that = this;

    /**
     * 获取分类列表
	 * 支持同步（callback为null）和异步调用
	 * 参数： 
	 * ctag
	 * macid
	 * enable
     */
    this.get = async function(params,callback){
		var data = {};
        var conditions = {
            table: ['#@arcclass'],
            where: []
        }
        conditions.where.push("comtag='" + params.ctag + "'");
        conditions.where.push("macid='" + params.macid + "'");
        conditions.where.push("enable='" + params.enable + "'");  //按分类是否启用为条件查找
		if(!callback) {
			var results = await this.DB().syncGet(conditions);
			data.error = results.error;
			data.results = data.classify = (!results.results.length) ? [] :
			decodeURI(recodeBase64decode(results.results,'classify')[0].classify);
			data.macid = params.macid;
			data.ctag = params.ctag;
			data.id = results[0] ? results[0].id : '';
			data.enable = results[0] ? results[0].enable : '0';
			return  data;
		}
        this.DB().get(conditions,function(error,results){
            //data.error =  (error || !results.length) ? 1 : 0;
            data.error =  error ? 1 : 0;
            data.results = data.classify = (!results.length) ? [] :
            decodeURI(recodeBase64decode(results,'classify')[0].classify);
            data.macid = params.macid;
            data.ctag = params.ctag;
            data.id = results[0] ? results[0].id : '';
            data.enable = results[0] ? results[0].enable : '0';
            
            return callback(data);
        })
    }

    /**
     * 保存分类数据
     */
    this.save = function(params,callback){
        var conditions = {
            table: '#@arcclass',
            fields: [],
            where: []
        }
        var data = {};
		var process = this.model("DataProcess");
        var macid = process.getUserInfo()[0].groupId;    //商户id用组id表示
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


    /**
     * 根据组件中的islist列表数据初始化分类列表结构
     */
    this.struc = function(classifies,listName){
        var tem = [];
        var temObj;
        for(var i = 0; i < listName.length; i ++){
            if(!listName[i].length) continue;
            temObj = array2value(classifies, 'name', listName[i]);
            if(!temObj) temObj = {name: listName[i], val: "classify_" + (new Date()).valueOf() + i};
            tem.push(temObj);
        }
        return tem;
    }
}

module.exports = ClassifyModel;
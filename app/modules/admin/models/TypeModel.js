/*
 * @Description: In User Settings Edit
 * @Author: your name
 * @Date: 2019-06-17 09:39:20
 * @LastEditTime: 2019-08-20 17:08:39
 * @LastEditors: Please set LastEditors
 */
function TypeModel(){
    var that = this;
    /**
     * 查询栏目列表
     */
    this.list = function(params,callback){
        var data = {};
        var conditions = {
            table : ['youbang_arctype'],
            fields : ['*', 'id as val','typename as name','topid as pid'],
            where : [],
            orderBy:['topid asc', 'id asc'],
        };
        if(params.id) conditions.where.push("id=" + params.id);
        if(params.nid) conditions.where.push("componentid=(select id from youbang_components where nid='" + params.nid + "')");    //查看组件id
        
        this.DB().get(conditions,function(error,res){
            data.error = error ? 1 : 0;
            data.data = (params.addTop) ? [{id: 1, pid: 0, name: "顶级栏目", val:1, typename: '顶级栏目'}] : []
            data.data = data.data.concat(res);
            
            return callback(data);
        });
    }

    /**
     * 保存栏目信息
     * 当前方法供栏目信息修改后保存，新增栏目信息保存调用
     */
    this.save = function(param, callback){
        var data = {
            error: 1,
            message:"参数错误"
        };
        if(((param.tag == 'edt') && (!param.atid)) ||
        ((param.tag != 'edt') && (param.tag != 'add'))) {
            return callback(data);
        }
        var componentid = this.POST('cmid');
        if(!componentid) return callback(data);

       var conditions = {
            table:'youbang_arctype',
            where:[],
            fields:[]
        }
        
        if(param.atid) conditions.where.push("id=" + param.atid);
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
        upData.componentid = componentid;
        conditions.fields.push(upData);
        
        this.DB().set(conditions,function(error,results,fields){
            data.error = error?1:0;
            data.data = results;
            if(param.ctag) data.ctag =  '/ctag/' + param.ctag;
            if(error) data.message = "保存数据失败";
            if(!error) data.message = '数据保存成功,正在跳转到列表...';
            return callback(data);
        });
    }

    /**
     * 删除栏目信息
     */
    this.del = function(params, callback){
        this.counSub(params, function(res){
            if(res.error) return callback(res);
            if(res.results[0].total) return callback(res);
            var sql = `delete from youbang_arctype where componentid=` + params.componentId + ` and id=`+ params.atid;
            that.DB().log().delete(sql, function(error, results){
                res.error = error? 1: 0;
                res.results = results;
                return callback(res);
            });
        })
        
    }

    /**
     * 统计栏目id下有多少子栏目
     */
    this.counSub = function(params, callback){
        var sql = 'select count(*) as total from youbang_arctype where topid=' + params.atid;
        this.DB().select(sql, function(error, results){
            var data = {
                error: error? 1: 0,
                results: results
            }

            return callback(data);
        })
    }

}

module.exports = TypeModel;
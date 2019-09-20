function CommodityModel(){
    var that = this;
    

    /**
     * 构造规格项树型结构
     * @param {*} results 
     */
    function specTree(results){
        var specTree = [];
        var pid = '';
        if(!results.length) return specTree;
        for(var i = 0; i < results.length; i ++){
            if(!pid || (pid != results[i].specid)) {
                pid = results[i].specid;
                specTree.push({
                    val: results[i].specid,
                    name: results[i].spectitle,
                    specid: results[i].specid,
                    commodityid: results[i].commodityid,
                    spectitle: results[i].spectitle,
                    children:[]
                });
            }
            specTree[specTree.length - 1].children.push({
                val: results[i].itemid,
                name: results[i].itemtitle,
                itemid: results[i].itemid,
                commodityid: results[i].commodityid,
                itemid: results[i].itemid
            });
        }
        return specTree;
    }

    /**
     * params {} 必须属性commodityId
     */
    this.spec = function(params, callback){
        var data = {error: 1, message: '参数错误'}
        if(!params.commodityId) return callback(data);
        var sql = `SELECT
                m.id AS specid,
                m.commodityid,
                m.title AS spectitle,
                i.id AS itemid,
                i.title AS itemtitle 
            FROM
                youbang_commidity_spec AS m
                LEFT JOIN youbang_commidity_specitem AS i ON i.specid = m.id 
            WHERE
                m.commodityid = `+ params.commodityId +` 
                AND i.SHOW = '1' 
            order by m.id asc, i.id asc`;

        this.DB().select(sql,function(error,results){
            data.error = error ? 1 : 0;
            data.message = "";
            data.spec = results;
            data.specTree = specTree(results);
            //log("@@@@@@@@@@@@@@@@@@@@@@@@@::",data);
            return callback(data);
        })
    }

    /**
     * params {} 必须属性commodityId
     */
    this.specoption = function(params, callback){
        var data = {error: 1, message: '参数错误'}
        if(!params.commodityId) return callback(data);
        var conditions = {
            table: ['youbang_commidity_specoption'],
            where: ['commodityid = '+ params.commodityId],
            orderBy: ['id asc']
        }

        this.DB().get(conditions,function(error,results){
            data.error = error ? 1 : 0;
            data.message = "";
            data.specoption = results;
            //log("@@@@@@@@@@@@@@@@@@@@@@@@@::",data);
            return callback(data);
        })
    }

    /**
     * 保存商品规格
     * @param {*} params  必须属性 aid(商品id)
     * @param {*} callback 
     */
    this.specSave = function(params, callback){
        var data = {error: 1, message: '参数错误'}
        this.specDel(params,function(res){
            if(res.error) callback(res);
            //保存specname
            var conditions = {
                table:'youbang_commidity_spec',
                fields:[]
            }

            for(var i = 0; i < params.specname.length; i++){
                conditions.fields.push({
                    commodityid: params.aid,
                    title: params.specname[i]
                });
            }
            that.DB().set(conditions,function(error,results,fields){
                if(error){
                    data.message = '保存spec失败....';
                    return callback(data);
                }
                params.specId = results.insertId;
                
                //保存specitem
                conditions = {
                    table:'youbang_commidity_specitem',
                    fields:[]
                }
                params.items = [];
                for(i = 0; i < params.specitem.length; i++ ){
                    for(var j = 0; j < params.specitem[i].length; j ++){
                        conditions.fields.push({
                            specid: params.specId + i,
                            title: params.specitem[i][j],
                            show: '1'
                        });
                        params.items.push(params.specitem[i][j]);
                    }
                }
                that.DB().set(conditions,function(error,results,fields){
                    if(error) callback(data);
                    params.itemsId = results.insertId;
                    //保存youbang_commidity_specoption
                    conditions = {
                        table:'youbang_commidity_specoption',
                        fields:[]
                    }
                    for(i = 0; i < params.specoption.length; i++ ){
                        var title = params.specoption[i].title.split(',');
                        var specs = [];
                        for(var k = 0; k < title.length; k ++){
                            specs.push(parseInt(params.items.indexOf(title[k])) + params.itemsId)
                        }
                        conditions.fields.push({
                            commodityid: params.aid,
                            title: title.join('_'),
                            specs: specs.join('_')
                        });
                        var options = params.specoption[i].options;
                        for(j = 0; j < options.length; j ++){
                            conditions.fields[i][options[j].name.replace('spec_','')] = options[j].value;
                        }
                    }
                    that.DB().set(conditions,function(error,results,fields){
                        data.error = error ? 1 : 0;
                        data.message = error ? 'specoption保存失败' : '操作成功，正在跳转';
                        data.results = results;
                        callback(data);
                    });
                });
            });
        })
    }

    /**
     * 删除规格项
     * @param {*} params  必须属性 aid(商品id)
     * @param {*} callback 
     */
    this.specDel = function(params,callback){
        var data = {error: 1, message: 'params error!'}
        //删除commodityId对应的值
        var conditions = {
            table:'youbang_commidity_spec',
            where:[]
        }
        if(!params.aid) return callback(data);
        conditions.where.push("commodityid=" + params.aid);

        that.DB().del(conditions, (error,results,fields)=>{
            data.error = error;
            data.results = results;
            callback(data);
        });
    }

    /**
     * 获取订单列表
     */
    this.order = function(params,callback){
        var data = {error: 1, message: 'params error!'}
        params.SEDate = this.POST('SEDate',{default:this.GET('SEDate')}) || params.SEDate;
        if(typeof params.SEDate != 'object') callback({error: 1, message: '时间参数错误!'});
        var orderSate = this.POST('ost') || params.state;
        if(typeof orderSate != 'object') orderSate = [orderSate];
        var sky = this.POST('sky');
        if(!params.SEDate) return callback(data);
        var conditions = {
            table: ['youbang_commodities_orders'],
            where: [],
            orderBy:['addtime asc']
        }
        
        typeof params.SEDate[1] == 'number' ?
        conditions.where.push('addtime between subdate("' + params.SEDate[0] + '",interval ' + params.SEDate[1]+ ' day) and "' + params.SEDate[0] + '"'):
        conditions.where.push('addtime between "' + params.SEDate[0] + '" and "' + params.SEDate[1] + '"');
        if(params.merchantid) conditions.where.push(' merchantid="' + params.merchantid + '"');
        if(sky) conditions.where.push("(merchantid='" + sky + "' or sn='" + sky + "' or merchan like '%" + sky + "%' or title like '%" + sky + "%')");
        if(orderSate) conditions.where.push("state in ('" + orderSate.join("','") + "')");
        
        that.DB().get(conditions, (error,results,fields)=>{
            data.error = error || !results.length ? 1 : 0;
            data.orders = results;
            callback(data);
        });
    }

    /**
     * 根据订单id查询一组订单的信息
     */
    this.aOrder = function(params,callback){
        var orderId = parseInt(this.GET('cmid'));
        
        if(typeof orderId != 'number') return callback({error: 1,message: 'message error'});
        var conditions = {
            table: ['youbang_commodities_orders as a '],
            fields:['b.*'],
            joinOn:'left join youbang_commodities_orders as b on a.merchantid=b.merchantid and a.sn=b.sn ',
            where: ['a.id = ' + orderId],
            limit:[1]
        }
        
        this.DB().get(conditions,function(error,results,fields){
            callback({
                error: error ? 1 : 0,
                order: results,
            });
        });
    }
}

module.exports = CommodityModel;
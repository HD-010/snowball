/**
 * 商品模块
 */
function GoodsModel(){
    var that = this;
    /**
     * 获取商品分类信息
     * 接口/api/goods/goodstype
     */
    that.goodstype = function(callback){
        //获取商品分信息
        var commodities = 'commodities';//商品类的标识
        that.model("Type").getclass(commodities,function(res){
            if(!res.length) return callback(1,['no data']);
            let sql = "select DISTINCT(classify), litpic, id from youbang_archives where component = (select id from youbang_components where nid = '"+commodities+"') GROUP BY classify";
            that.DB().query(sql,function(error,results,fields){
                let a;
                for(let i in results){
                    a = a || res;
                    a =  treeSet(a,'val',results[i].classify,'litpic',results[i].litpic);
                }
                return callback(a)                
            });
            
        });
       
    }

    /**
     * 查询 一级分类
     * 接口/api/goods/goodstype
     */
    that.goodstypeone = function(callback){
        let data = [];
        that.goodstype(function(goodstype){
            if(!goodstype[0].children.length) return callback(1,['no data']);
            for(let i in goodstype[0].children){                
               data.push({name:goodstype[0].children[i].name,val:goodstype[0].children[i].val,litpic:goodstype[0].children[i].litpic==undefined?"":goodstype[0].children[i].litpic})
            }
            if(!data.length) return callback(1,['no data']);
            return callback(0,data);
        });
       
    }

    /**
     * 获取二级 三级分类
     * 接口：/api/goods/goodstypeall
     * 参数val：一级分类的val 如：classify_1564640192804
     */
    that.goodstypeall = function(callback){
        let data = [];
        that.goodstype(function(goodstype){
            if(!goodstype[0].children.length) return callback(1,['no data']);
            let val  = that.POST('val');
            for(let i in goodstype[0].children){
                if(val == goodstype[0].children[i].val){
                    data.push(goodstype[0].children[i]);
                }            
            }
            if(!data.length) return callback(1,['no data']);
            return callback(0,data[0]);
        });
    }

    /**
     * 根据分类id查询当前分类下的商品
     * 接口:/api/goods/getgoodsbyclass
     * 参数：val 分类id 示例：val=classify_1564640192804
     * 返回分类下的商品信息
     */
    that.getgoodsbyclass = function(callback){
        let val  = that.POST('val');
        that.DB('Redis').get(val+"_goods",function(error,data){
            if(data) return callback(0,data);
            let sql = "select ar.*,c.*  from youbang_addoncommodities as c left JOIN youbang_archives as ar on c.aid = ar.id where ar.classify='"+val+"' and  ar.component = (select id from youbang_components where nid = 'commodities')";
            that.DB().query(sql,function(error,results,fields){
                if(!results.length) return callback(1,['no date']);
                that.DB('Redis').set(val+"_goods",results);
                return callback(0,results);
            })
        });
    }

    /**
     * 根据商品id 获取商品详细信息
     *  接口：/api/goods/getgoodbyid
        参数：id   商品id 示例：id=184
        返回值：商品信息
     */
    that.getgoodbyid = function(callback){
        let id = that.POST('id');
        if(isNaN(id)) return callback(1,["id参数有误"]);
        that.DB('Redis').get(id+"_goods",function(error,data){
            if(data) return callback(0,data);
            let sql = "select ar.*,c.*  from youbang_addoncommodities as c left JOIN youbang_archives as ar on c.aid = ar.id where c.aid = "+id+" and ar.component = (select id from youbang_components where nid = 'commodities')";
            that.DB().query(sql,function(error,results,fields){
                if(!results.length) return callback(1,['no date']);
                that.DB('Redis').set(id+"_goods",results);
                return callback(0,results);
            })
        });
    }
    /**
     * 根据id获取商品规格
     * 接口：/api/goods/getgoodspec
     * 参数 商品id  必填
     * 返回值：返回改商品规格
     */
    that.getgoodspec = function(callback){
        let id = that.POST('id');
        if(isNaN(id)) return callback(1,["id参数有误"]);
        that.DB('Redis').get(id+"_spec",function(error,data){
            if(data) return callback(0,data);
            let sql = "select * from youbang_commidity_specoption where commodityid = "+id;
            that.DB().query(sql,function(error,results,fields){
                if(!results.length) return callback(1,['no date']);
                that.DB('Redis').set(id+"_spec",results);
                return callback(0,results);
            })
        });
    }

}
module.exports = GoodsModel;
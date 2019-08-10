/**
 * 操作分类模块
 */
function TypeMpdel(){
    var that = this;
    /**
     * 接口/api/type/getType
     * 获取分类信息
     * 参数：type 传入要查询的分类 infos表示项目信息分类
     */
    that.getclass = function(prm,callback){
        let sql = " select classify from youbang_arcclass where comtag = '"+prm+"'";
        that.DB("Redis").get(prm,function(res){
            if(res) return callback(res);
            that.DB().query(sql,(error,results,fields)=>{
                if(results.length){
                    results = JSON.parse(decodeURI(recodeBase64decode(results,"classify")[0].classify));
                    that.DB('Redis').set(prm, results);               
                }
                return callback(results);
            })
        });
        
    }

    /**
     * 查询所有栏目
     * 接口:/api/type/arctype
     * componentid 栏目ID 必填
     */
    that.arctype = function(callback){
        let prm = that.POST("componentid");
        if(isNaN(prm)){
            callback(1,["参数有误"]);
            return;
        }
        let sql = "select * from youbang_arctype where componentid = "+prm;
        that.DB("Redis").get(prm,function(res){
            if(res) return callback(res);
            that.DB().query(sql,(error,results,fields)=>{
                if(results.length){
                    that.DB('Redis').set(prm, results);
                    return callback(0,results);           
                }
                return callback(1,["no data"]);
            })
        });
    }
    
}
module.exports = TypeMpdel;
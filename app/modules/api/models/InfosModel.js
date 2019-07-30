/**
 * 信息操作
 */
function InfosModel(){
    var that = this;
    
    /**
     * 获取首页推荐信息列表
     * (1)接口:/api/infos/infos
            ②参数2：flag  
                1)值：h 代表“首页” c代表推荐 'h,c' 代表首页推荐，z代表资讯
     */
    that.infos = function(callback){
        let type = that.model("Type");
        type.getclass("infos",function(res){
            if(!res) return callback(1,["no data"]);
            let flag = that.POST("!flag");
            //let componentid = that.POST("componentid");
            let sql = "select \
            ar.*,DATE_FORMAT(ar.addtime,'%Y-%m-%d %H:%i:%s') addtime,i.*, ae.name as areaname \
            from youbang_archives as ar \
            left join \
            youbang_addoninfos as i \
            on ar.id = i.aid \
            LEFT join \
            youbang_sys_area as ae \
            on ae.id = SUBSTRING_INDEX(i.areaid,'_',-1) \
            where i.componentid = -8 and INSTR(ar.flag,'"+flag+"') \
            ORDER BY ar.addtime desc";
            that.DB().query(sql,function(error,results,fields){
                if(results.length){
                    for(let i in results){                
                        results[i].classify = treeValue(res,"val",results[i].classify,'name');                   
                    }
                    return callback(0,results);
                }else{
                    return callback(1,["no data"]);
                }         
            });
        });       
        
    }

     /**
     * 根据ID值获取信息列表
     * (1)接口:/api/infos/infosbyid
            ②参数1：id
     */
    that.infosbyid = function(callback){
        that.getclass("infos",function(res){
            if(!res) return callback(1,["no data"]);
            let id = that.POST("id");
            if(isNaN(id)){
                callback(1,["id参数有误"]);
                return;
            }
            let sql = "select \
            ar.*,DATE_FORMAT(ar.addtime,'%Y-%m-%d %H:%i:%s') addtime,i.*, ae.name as areaname \
            from youbang_archives as ar \
            left join \
            youbang_addoninfos as i \
            on ar.id = i.aid \
            LEFT join \
            youbang_sys_area as ae \
            on ae.id = SUBSTRING_INDEX(i.areaid,'_',-1) \
            where i.componentid = -8 and ar.id = "+id+" \
            ORDER BY ar.addtime desc";
            that.DB().query(sql,function(error,results,fields){
                if(results.length){
                    for(let i in results){                
                        results[i].classify = treeValue(res,"val",results[i].classify,'name');                   
                    }
                    return callback(0,results);
                }else{
                    return callback(1,["no data"]);
                }         
            });
        });       
    }


    /**
     * 更改信息阅读量
     * (1)接口:/api/infos/infosbyid
            ②参数1：id
     */
    that.onclick = function(callback){
        let id = that.POST("id");
        if(isNaN(id)){
            callback(1,["id参数有误"]);
            return;
        }
        let sql = "update youbang_archives set click=click+1 where id = "+id;
        that.DB().query(sql,function(error,results,fields){
            if(results.affectedRows){
                return callback(0,["Success"]);
            }else{
                return callback(1,["fail"]);
            }         
        });   
    }
    
}
module.exports = InfosModel;
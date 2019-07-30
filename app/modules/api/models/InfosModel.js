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
        let type = that.model("Type");
        type.getclass("infos",function(res){
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

    /**
     * 查询所有的工程信息列表
     * 接口：/api/infos/getInfosAll
     *  参数：areaid 地区 根据地区 参数类型 父类id_子类id结构 如：'26_2607'
     *       classify 根据类型 类型val值传递过来 如：'classify_1562310091110'
     *       typeid 根据类型  类型的id 如：14
     * 没有参数查询所有工程信息
     */
    that.getInfosAll = function(callback){
        let type = that.model("Type");
        type.getclass("infos",function(res){
            if(!res) return callback(1,["no data"]);
            let areaid = that.POST("!areaid",{default:""});
            let classify = that.POST("classify",{default:""});
            let typeid = that.POST("typeid",{default:""});
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
            where i.componentid = -8 and i.areaid LIKE '%"+areaid+"%' and ar.classify like '%"+classify+"%' and ar.typeid like '%"+typeid+"%' \
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
    
}
module.exports = InfosModel;
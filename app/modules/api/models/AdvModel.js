function AdvModel(){
    var that = this;
    
    /**
     * 查询广告 
     * (1)广告位置接口:/api/adv/adv
            ①参数1：advtype 广告类型 必填
            1)值：3 轮播图片
            2)值：2 图片广告
            3)值:	1 公告广告
            ②参数2：flag 广告位置 必填
            1)值：h 代表“首页”
     */
    that.adv = function(callback){
        let advtype = that.POST('advtype');// 广告类型标识1为图片广告，2为文字广告，3为轮播广告
        if(isNaN(advtype)){
            callback(1,["参数不合法"]);
            return;
        }        
        let flag = that.POST('flag');// 广告位置 h 代表首页
        console.log(flag.substring(0,1))
        var sql = "select \
                  id,topid,title,description,content,link,isdel,DATE_FORMAT(effectivetime,'%Y-%m-%d %H:%i:%s') effectivetime,DATE_FORMAT(expirationtime,'%Y-%m-%d %H:%i:%s') expirationtime,advtype,enable,flag \
                  from youbang_addonadv \
                  where advtype = "+advtype+" and enable = 1 and INSTR(flag,'"+flag+"')";
        that.DB().query(sql,function(error,results,fields){        
           if(results.length){
            callback(0,results);
           }else{
            callback(1,["no data"]);
           }         
        });
    }


     /**
     * 根据id查询广告 
     * (1)广告位置接口:/api/adv/advbyid
            ①参数1：advtype 广告类型 必填
            1)值：3 轮播图片
            2)值：2 图片广告
            3)值: 1 公告广告
            id 广告id 必填            
     */
    that.advbyid = function(callback){
        let advtype = that.POST('advtype');// 广告类型标识1为图片广告，2为文字广告，3为轮播广告
        if(isNaN(advtype)){
            callback(1,["advtype参数有误"]);
            return;
        }
        let id = that.POST('id');// 广告位置 h 代表首页
        if(isNaN(id)){
            callback(1,["id参数有误"]);
            return;
        }                
        var sql = "select \
                  id,topid,title,description,content,link,isdel,DATE_FORMAT(effectivetime,'%Y-%m-%d %H:%i:%s') effectivetime,DATE_FORMAT(expirationtime,'%Y-%m-%d %H:%i:%s') expirationtime,advtype,enable,flag \
                  from youbang_addonadv \
                  where advtype = "+advtype+" and enable = 1 and id = "+id;
        that.DB().log().query(sql,function(error,results,fields){        
           if(results.length){
            callback(0,results);
           }else{
            callback(1,["no data"]);
           }         
        });
    }

}

module.exports = AdvModel;
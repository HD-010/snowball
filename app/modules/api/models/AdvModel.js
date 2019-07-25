function AdvModel(){
    var that = this;
    
    /**
     * 查询轮播广告
     */
    that.adv = function(callback){
        let type = that.POST('typeId');
        let advId = that.POST('advId');
        var sql = advId ? "select id,topid,title,description,content,link,type,isdel,DATE_FORMAT(effectivetime,'%Y-%m-%d %H:%i:%s') effectivetime,DATE_FORMAT(expirationtime,'%Y-%m-%d %H:%i:%s') expirationtime from youbang_adv where id = "+advId+" and type = "+type
                  :"select id,topid,title,description,content,link,type,isdel,DATE_FORMAT(effectivetime,'%Y-%m-%d %H:%i:%s') effectivetime,DATE_FORMAT(expirationtime,'%Y-%m-%d %H:%i:%s') expirationtime from youbang_adv where type = "+type;             
        that.DB().query(sql,function(error,results,fields){        
           if(results.length){
            callback(0,results);
           }else{
            callback(1,["no data"]);
           }         
        });
    }
     /**
     * 修改轮播广告
     */
    that.update = function(param,callback){
        let id = that.POST('id')
        let data = {};
        data.title = that.POST('title')
        data.content = that.POST('content')
        data.description = that.POST('description',{default:""})
        data.link = that.POST('link',{default:"http://www.baidu.com"})
        data.type = that.POST('typeId')
        data.effectivetime = that.POST('effectivetime')
        data.expirationtime = that.POST('expirationtime')
     }  

}

module.exports = AdvModel;
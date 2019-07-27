function AdvModel(){
    var that = this;
    
    /**
     * 查询轮播广告
     */
    that.adv = function(callback){
        let id = that.POST('id');//广告ID 
        let advtype = that.POST('advtype');// 广告类型标识1为图片广告，2为文字广告，3为轮播广告
        let flag = that.POST('flag');// 广告位置 h 代表首页
        var sql = id ? "select \
        id,topid,title,description,content,link,isdel,DATE_FORMAT(effectivetime,'%Y-%m-%d %H:%i:%s') effectivetime,DATE_FORMAT(expirationtime,'%Y-%m-%d %H:%i:%s') expirationtime,advtype,enable,flag \
        from youbang_addonadv \
        where id = "+id+" and advtype = "+advtype+" and enable = 1 and INSTR(flag,'"+flag+"')"
                  :"select \
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
// 收藏模型
function FavoriteModel(){
    var that = this;
    /**
     * 点击收藏接口
     * 接口/api/favorite/favorite
     * 参数1: id 收藏信息的id 必填 示例：180
     * 参数2: uid 用户id 必填 示例：1
     * 参数3: componentsid 类型id 示例：-8
     * 返回值：data:
     *              1 代表收藏成功
     *              0 代表未收藏
     */
    that.favorite = function(callback){
       
        //获取参数
        let id  = that.POST("id");
        let uid = that.POST("userid");
        let componentsid = that.POST('componentsid');
        if(isNaN(id)) return callback(1,["id参数有误"]);
        if(isNaN(uid)) return callback(1,["uid参数有误"]);
        if(isNaN(componentsid)) return callback(1,["componentsid参数有误"]);
        let sql = "select deleted from youbang_member_favorite where favoriteid = "+id+" and mid = "+uid+" and componentsid = "+componentsid;
        that.DB().query(sql,(error,results,fields)=>{                    
            if(results.length){
                let sql1 = results[0].deleted==1? " update youbang_member_favorite set deleted = '0' where favoriteid = "+id+" and mid = "+uid+" and componentsid = "+componentsid: " update youbang_member_favorite set deleted = '1' where favoriteid = "+id+" and mid = "+uid+" and componentsid = "+componentsid;
                that.DB().query(sql1,function(error,res,fields){
                    if(res.affectedRows) return callback(0,results[0].deleted==0?"1":"0");
                })
            }else{
                let sql2 = "insert into youbang_member_favorite(mid,favoriteid,createtime,deleted,componentsid) VALUES("+uid+","+id+",NOW(),'1',"+componentsid+")"; 
                that.DB().log().query(sql2,function(error,res1,fields){
                    if(res1.affectedRows) return callback(0,res1.affectedRows);
                })
            }
        })
            
        
    }
}
module.exports = FavoriteModel;
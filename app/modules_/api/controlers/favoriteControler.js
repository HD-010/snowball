//收藏控制器
function favoriteControler(){
    var that = this;
    //点击收藏
    that.favorite = function(){
        let prm = ["id","userid","componentsid"];//必填字段
        let obj = that.checkParm(prm);
        if (obj.errcode == 1) {
            that.sendJson(1, obj.errlist);
            return;
        }
        let favorite = that.model("Favorite");
        favorite.favorite((error,obj)=>{
            return that.sendJson(error,obj);
        })
    }
}
module.exports = favoriteControler;
/***
 * app 数据接口
 * 操作轮播广告
 */
function advControler() {
    var that = this;
    /**
     * 查询轮播广告
     * 接口：/api/adv/adv/
     * advtype 广告类型 参数值：1、图片广告，2、文字广告，3、轮播广告
     * flag 广告位子 参数值:h、首页，c、推荐，r、热点，z、资讯
     */
    that.adv = function(){
        let prm = ["advtype","flag"];//必填字段
        let obj = that.checkParm(prm);
        if (obj.errcode == 1) {
            that.sendJson(1, obj.errlist);
            return;
        }
        var advModel = that.model('Adv');
        advModel.adv((errocode,obj)=>{
            if(errocode) return that.sendJson(errocode,obj);
            //要返回的字段
            let fieldarr = ["id","link","title","content"];
            //重新组装数据   为true 代表多个对象返回，为false 代表是一个对象返回,说面渲染页面不需要循环
            obj = getNewData(obj,fieldarr);
            console.log(obj.length)
            if(obj.length>1){
                return that.sendJson(errocode,obj)
            }else if(obj.length=1){
                return that.sendJson(errocode,obj[0])
            }
        })
    }
    /***
     * 根据id 查询广告
     * advId 根据ID查询
     * advtype 广告类型
     */
    that.advbyid = function(){
        let prm = ["advtype","id"];//必填字段
        let obj = that.checkParm(prm);
        if (obj.errcode == 1) {
            that.sendJson(1, obj.errlist);
            return;
        }
        var advModel = that.model('Adv');
        advModel.advbyid((errocode,obj)=>{
            if(errocode) return that.sendJson(errocode,obj);
            //要返回的字段
            let fieldarr = [];
            //重新组装数据   为true 代表多个对象返回，为false 代表是一个对象返回,说面渲染页面不需要循环
            obj = getNewData(obj,fieldarr);
            if(obj){
                return that.sendJson(errocode,obj[0])
            }
        })
    }   
    
}
module.exports = advControler;
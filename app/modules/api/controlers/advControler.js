/***
 * app 数据接口
 * 操作轮播广告
 */
function advControler() {
    var that = this;
    /**
     * 查询轮播广告
     * advtype 广告类型
     * flag 广告位子
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
            let fieldarr = ["id","link","title"];
            //重新组装数据   为true 代表多个对象返回，为false 代表是一个对象返回,说面渲染页面不需要循环
            obj = getNewData(obj,fieldarr);
            if(obj){
                return that.sendJson(errocode,obj)
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
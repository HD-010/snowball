/***
 * app 数据接口
 * 操作轮播广告
 */
function advControler() {
    var that = this;
    /**
     * 查询轮播广告
     * advId 有就根据ID查询、没有查询全部
     */
    that.adv = function(){
        let prm = ["typeId"];//必填字段
        let obj = that.checkParm(prm);
        if (obj.errcode == 1) {
            that.sendJson(1, obj.errlist);
            return;
        }
        var advModel = that.model('Adv');
        advModel.adv((errocode,obj)=>{
            that.sendJson(errocode,obj)
        })
    }
    /**
     * 修改轮播广告
     * 根据Id修改 和要修改的字段
     */
    that.update = function(){      
        let prm = ["id","title","content","typeId"];//必填字段
        let obj = that.checkParm(prm);
        if (obj.errcode == 1) {
            that.sendJson(1, obj.errlist);
            return;
        }
        var advModel = that.model('Adv');
        advModel.update((errocode,obj)=>{
            that.sendJson(errocode,obj)
        })
    }
    
}
module.exports = advControler;
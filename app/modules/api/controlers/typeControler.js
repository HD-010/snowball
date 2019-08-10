/**
 * 获取分类信息
 */
function typeControler(){
    var that = this;
    /**
     * 获取所有分类信息
     */
    that.getType = function(){
        let prm = ['type'];//验证必填字段
        let obj = that.checkParm(prm)
        if (obj.errcode == 1) {
            that.sendJson(1, obj.errlist);
            return;
        }
        var type = that.model('Type');
        var typecalss = that.POST('type');
        type.getclass(typecalss,(obj)=>{
           if(obj.length) return that.sendJson(0,obj);
           return that.sendJson(1,['no data'])
        })
    }

     /**
     * 获取所有栏目分类
     */
    that.arctype = function(){
        let prm = ['componentid'];//验证必填字段
        let obj = that.checkParm(prm)
        if (obj.errcode == 1) {
            that.sendJson(1, obj.errlist);
            return;
        }
        var type = that.model('Type');
        type.arctype((errorcode,obj)=>{
            if(errorcode) return that.sendJson(errorcode,obj);
            //要返回的字段
            let fieldarr = ["id","componentid","typename"];
            //重新组装数据   为true 代表多个对象返回，为false 代表是一个对象返回,说面渲染页面不需要循环
            obj = getNewData(obj,fieldarr);         
            return that.sendJson(0,obj)
        })
    }
}
module.exports = typeControler;
//商品控制器
function goodsControler(){
    var that = this;
    /**
     * 获取商品分类
     */
    that.goodstype = function(){
        let goods = that.model("Goods");
        goods.goodstypeone(function(error,res){
            return that.sendJson(error,res)
        });
    }

    /**
     * 获取商品二级三级分类
     * 
     */
    that.goodstypeall = function(){
        let prm = ['val'];//验证必填字段
        let obj = that.checkParm(prm)
        if (obj.errcode == 1) {
            that.sendJson(1, obj.errlist);
            return;
        }
        let goods = that.model("Goods");
        goods.goodstypeall(function(error,res){
            return that.sendJson(error,res)
        });
    }

    /**
     * 根据分类查询分类下的所有商品     * 
     */
    that.getgoodsbyclass = function(){
        let prm = ['val'];//验证必填字段
        let obj = that.checkParm(prm)
        if (obj.errcode == 1) {
            that.sendJson(1, obj.errlist);
            return;
        }
        let goods = that.model("Goods");
        goods.getgoodsbyclass(function(error,res){
            if(error) return that.sendJson(error,res);            
             //要返回的字段
             let fieldarr = ['id','title','shorttitle','price','selled','area','cost','litpic'];
             //重新组装数据   为true 代表多个对象返回，为false 代表是一个对象返回,说面渲染页面不需要循环
             res = getNewData(res,fieldarr);
            return that.sendJson(error,res)
        });
    }
    /**
     *  根据商品id查询商品信息
     */
    that.getgoodbyid = function(){
        let prm = ['id'];//验证必填字段
        let obj = that.checkParm(prm)
        if (obj.errcode == 1) {
            that.sendJson(1, obj.errlist);
            return;
        }
        let goods = that.model("Goods");
        goods.getgoodbyid(function(error,res){
            if(error) return that.sendJson(error,res);
             //要返回的字段
             let fieldarr = [];
             //重新组装数据   为true 代表多个对象返回，为false 代表是一个对象返回,说面渲染页面不需要循环
             res = getNewData(res,fieldarr,false);
            return that.sendJson(error,res[0])
        });
    }

    /**
     * 根据商品id 查询商品规格
     */
    that.getgoodspec = function(){
        let prm = ['id'];//验证必填字段
        let obj = that.checkParm(prm)
        if (obj.errcode == 1) {
            that.sendJson(1, obj.errlist);
            return;
        }
        let goods = that.model("Goods");
        goods.getgoodspec(function(error,res){
            if(error) return that.sendJson(error,res);
             //要返回的字段
             let fieldarr = [];
             //重新组装数据   为true 代表多个对象返回，为false 代表是一个对象返回,说面渲染页面不需要循环
             res = getNewData(res,fieldarr,false);
            return that.sendJson(error,res)
        });
    }

}
module.exports = goodsControler;
function orderControler(){
    var that = this;
    this.index = function(){
        var ps = 2;
        var params = {};
        var data = {error: 1, message: 'query faild! please try again'};
        var auto = this.POST('auto') ? true : false;
        //获取订单状态列表
        var em = this.model("Enum");
        params.enumtag = 'order_state';
        params.state = '1';
        em.list(params,function(res){
            data = mergeObj([data,res]);
            ps = that.testRender(data, ps, auto);
        });
       
        //获取订单列表
        var commodity = this.model("Commodity");
        params.SEDate = [dateFormate('%Y-%m-%d'),1];
        commodity.order(params,function(res){
            data = mergeObj([data,res]);
            ps = that.testRender(data, ps, auto);
        });
    }

    /**
     * 查找定单
     */
    this.search = function(){
        var params = {};
        var data = {error: 1};
        //获取订单列表
        var commodity = this.model("Commodity");
        params.SEDate = [dateFormate('%Y-%m-%d'),1];
        params.state = '1';
        commodity.order(params,function(res){
            data = mergeObj([data,res]);
            ps = that.renderJson(data);
        });
    }

    /**
     * 修改订单
     */
    this.detail = this.edt = function(){
        var ps = 2;
        var params = {};
        var data = {error: 1};
        //获取订单列表
        var em = this.model("Enum");
        var commodity = this.model("Commodity");

        params.enumtag = 'order_state';
        em.list(params,function(res){
            data = mergeObj([data,res]);
            ps = that.testRender(data, ps);
        });
        
        commodity.aOrder(params,function(res){
            data = mergeObj([data,res]);
            data.buyer = list(data.order[0],['buyer','buyerid','sn','address','buytel','addtime','state']);
            data.seller = list(data.order[0],['merchan','merchantid','maddress','mtel']);
            data.count = list(data.order[0],['totalprice','trancefree','coupon']);
            ps = that.testRender(data, ps);
        });
    }

}

module.exports = orderControler;
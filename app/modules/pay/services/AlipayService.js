function AlipayService(){
    this.updateOrderId = function(params,callback){
        var sql = 'update ranyun_order set orderId="'+params.orderId+'" where id in('+params.id+')';
        console.log("sql",sql);
        this.DB().update(sql,function(error,results,fields){
            callback(error,results,fields);
        })
    }

    this.selectOrder = function(params,callback){
        var sql = 'SELECT sum(orderAmount) as sum from ranyun_order where id in('+params+')';
        console.log("sql",sql);
        this.DB().update(sql,function(error,results,fields){
            callback(error,results,fields);
        })
    }

    this.insertOrder = function(params,callback){
        var sql = 'insert ranyun_order(orderId,memerId,orderAmount) values("'+params.orderId+'",'+params.memerId+','+params.orderAmount+')';
        console.log("sql",sql);
        this.DB().update(sql,function(error,results,fields){
            callback(error,results,fields);
        })
    }
    

    this.updateMember = function(params,callback){
        var sql = 'update ranyun_member set cash = cash+'+params.cash+' where id = '+params.memerId;
        console.log("sql",sql);
        this.DB().update(sql,function(error,results,fields){
            callback(error,results,fields);
        })
    }

    this.updateOrderState = function(params,callback){
        var sql = 'update ranyun_order set payState = 2 where orderId = "'+params.orderId+'"';
        console.log("sql",sql);
        this.DB().update(sql,function(error,results,fields){
            callback(error,results,fields);
        })
    }
}

module.exports = AlipayService;
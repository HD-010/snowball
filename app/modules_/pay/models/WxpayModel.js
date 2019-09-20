function WxpayModel() {
    //修改订单号
    this.updateOrderId = function(params,callback){        
        //调用服务类进行查询
        var wxpay = this.service('Wxpay');
        wxpay.updateOrderId(params,function(error,results,fields){
            callback(error,results,fields);
        });
    }
    //查询金额
    this.selectOrder = function(params,callback){        
        //调用服务类进行查询
        var wxpay = this.service('Wxpay');
        wxpay.selectOrder(params,function(error,results,fields){
            callback(error,results,fields);
        });
    }

     //添加余额充值订单
     this.addOrder = function(params,callback){        
        //调用服务类进行查询
        var wxpay = this.service('Wxpay');
        wxpay.insertOrder(params,function(error,results,fields){
            callback(error,results,fields);
        });
    }

      //修改会员余额信息
    this.updateMember = function(params,callback){        
        //调用服务类进行查询
        var wxpay = this.service('Wxpay');
        wxpay.updateMember(params,function(error,results,fields){
            callback(error,results,fields);
        });
    }
}
module.exports = WxpayModel;
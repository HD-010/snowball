function AlipayModel() {
    //查询案例2：
    this.updateOrderId = function(params,callback){        
        //调用服务类进行查询
        var Alipay = this.service('Alipay');
        Alipay.updateOrderId(params,function(error,results,fields){
            callback(error,results,fields);
        });
    }
    //查询案例2：
    this.selectOrder = function(params,callback){        
        //调用服务类进行查询
        var Alipay = this.service('Alipay');
        Alipay.selectOrder(params,function(error,results,fields){
            callback(error,results,fields);
        });
    }

    //添加余额充值订单
    this.insertOrderId = function(params,callback){        
        //调用服务类进行查询
        var Alipay = this.service('Alipay');
        Alipay.insertOrder(params,function(error,results,fields){
            callback(error,results,fields);
        });
    }

      //修改会员余额信息
    this.updateMember = function(params,callback){        
        //调用服务类进行查询
        var Alipay = this.service('Alipay');
        Alipay.updateMember(params,function(error,results,fields){
            callback(error,results,fields);
        });
    }

      //修改会员余额信息
      this.updateOrderState = function(params,callback){        
        //调用服务类进行查询
        var Alipay = this.service('Alipay');
        Alipay.updateOrderState(params,function(error,results,fields){
            callback(error,results,fields);
        });
    }
}
module.exports = AlipayModel;
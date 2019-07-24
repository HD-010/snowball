function payService(){
    this.wxnotify = function(data,callback){
        let self=this;
        let cash=data.total_fee*1/100;
        let sql = "select orderId from ranyun_depositrecord where orderId='"+data.out_trade_no+"'";
        let sqla = "insert into ranyun_depositrecord(orderId,type,transactionId,payAcount,money,addTime,endTime,flg) values('"+data.out_trade_no+"','1','"+data.transaction_id+"','"+data.openid+"',"+cash+",now(),'"+data.time_end+"',1)";
        console.log(sql)
        console.log(sqla)
        self.DB().query(sql,function(rsa){
            console.log("=======rsa=========="+rsa)
            if(rsa==false){
                self.DB().excute(sqla,function(rs){
                    console.log("=======rs=========="+rs)
                    callback(rs);
                });
            }else{
                callback(false);
            }
        });
    }
    this.alinotify = function(data,callback){
        let self=this;
        let cash=data.total_amount;
        let sql = "select orderId from ranyun_depositrecord where orderId='"+data.out_trade_no+"'";
        let sqla = "insert into ranyun_depositrecord(orderId,type,transactionId,payAcount,money,addTime,endTime,flg) values('"+data.out_trade_no+"','2','"+data.trade_no+"','"+data.buyer_logon_id+"',"+cash+",now(),'"+data.gmt_create+"',0)";
        self.DB().query(sql,function(rsa){
            if(rsa==false){
                self.DB().excute(sqla,function(rs){
                    callback(rs);
                });
            }else{
                callback(false);
            }
        });
    }
}
module.exports=payService;
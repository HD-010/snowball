function orderService(){
    this.tlist = function(data,callback){
        let self=this;
        let size = 20;
        if(data.page<1){
            data.page=1;
        }
        let snum=(data.page-1)*size;
        let spd="";
        if(data.suppid>0){
            spd=" and a.suppliersId="+data.suppid;
        }
        let sts=" and a.orderState in('5','7')";
        let sql="select a.id,a.orderId,a.suppliersId,(select b.status from ranyun_exchange b where b.orderId=a.id order by b.id desc limit 1)status,(select b.type from ranyun_exchange b where b.orderId=a.id order by b.id desc limit 1)type,(select name from ranyun_suppliers where id="+data.suppid+")sname,a.orderAmount,a.orderState,a.fee,a.coupon from ranyun_order a where a.memerId="+data.usid+spd+sts+" and a.delState=0 order by a.id desc limit "+snum+","+size;
        console.log(sql)
        self.DB().query(sql,function(rs){
            if(rs==false){
                callback(rs);
            }else{
                let str = "";
                let obj={};
                for(let i=0;i<rs.length;i++){
                    obj[rs[i].id]=[];
                    if(str==""){
                        str = ""+rs[i].id;
                    }else{
                        str += ","+rs[i].id;
                    }
                }
                let sqla = "select a.id,a.orderId,a.commidityId,a.commidityName,a.litpic,a.salePrice,a.marketValue,a.number,a.sname,a.attr,a.coupon,ifnull(a.unit,'')unit,a.freeEmail,ifnull(a.fee,0)fee from ranyun_orderdetails a where a.orderId in("+str+") ";
                console.log(sqla)
                self.DB().query(sqla,function(rsa){
                    if(rsa==false){
                        for(let i=0;i<rs.length;i++){
                            rs[i].list=[];
                        }
                        callback(rs);
                    }else{
                        for(let n=0;n<rsa.length;n++){
                            let oid=rsa[n].orderId;
                            delete rsa[n].orderId;
                            obj[oid].push(rsa[n]);
                        }
                        for(let i=0;i<rs.length;i++){
                            rs[i].list= obj[rs[i].id];
                        }
                        callback(rs);
                    }
                })
            }
        });
    }
    this.list = function(data,callback){
        let self=this;
        let size = 10;
        if(data.page<1){
            data.page=1;
        }
        let snum=(data.page-1)*size;
        let spd="";
        if(data.suppid>0){
            spd=" and suppliersId="+data.suppid;
        }
        let sts = "";
        if(data.state==0){//全部订单
            sts=" and orderState in('1','2','3','4','5','6','7','8')";
        }else if(data.state==1){//待付款
            sts=" and orderState in('1')";
        }else if(data.state==2){//待发货
            sts=" and orderState in('2')";
        }else if(data.state==3){//待收货
            sts=" and orderState in('3','4','5')";
        }else if(data.state==4){//待评价
            sts=" and orderState in('6','7','8')";
        }
        let sql="select id,orderId,suppliersId,(select name from ranyun_suppliers where id="+data.suppid+")sname,orderAmount,orderState,fee,coupon from ranyun_order where memerId="+data.usid+spd+sts+" and delState=0 order by id desc limit "+snum+","+size;
        console.log(sql)
        self.DB().query(sql,function(rs){
            if(rs==false){
                callback(rs);
            }else{
                let str = "";
                let obj={};
                for(let i=0;i<rs.length;i++){
                    obj[rs[i].id]=[];
                    if(str==""){
                        str = ""+rs[i].id;
                    }else{
                        str += ","+rs[i].id;
                    }
                }
                let sqla = "select a.id,a.orderId,a.commidityId,a.commidityName,a.litpic,a.salePrice,a.marketValue,a.number,a.sname,a.attr,a.coupon,ifnull(a.unit,'')unit,a.freeEmail,ifnull(a.fee,0)fee from ranyun_orderdetails a where a.orderId in("+str+") ";
                console.log(sqla)
                self.DB().query(sqla,function(rsa){
                    if(rsa==false){
                        for(let i=0;i<rs.length;i++){
                            rs[i].list=[];
                        }
                        callback(rs);
                    }else{
                        for(let n=0;n<rsa.length;n++){
                            let oid=rsa[n].orderId;
                            delete rsa[n].orderId;
                            obj[oid].push(rsa[n]);
                        }
                        for(let i=0;i<rs.length;i++){
                            rs[i].list= obj[rs[i].id];
                        }
                        callback(rs);
                    }
                })
            }
        });
    }
    this.del = function(data,callback){
        let act = data.act;
        let sql = "";
        if(act=="del"){
            sql = "update ranyun_order set delState=1 where id="+data.orderid+" and orderState in('7','8')";
        }else if(act=="cnl"){
            sql = "delete from ranyun_order where id="+data.orderid+" and orderState in('0','1')";
        }
        if(sql==""){
            callback(false);
        }else{
            this.DB().excute(sql,function(rs){
                callback(rs);
            });
        }
    }
    this.detail = function(data,callback){
        let self = this;
        let sql = "select a.*,(select b.name from ranyun_suppliers b where b.id=a.suppliersId)sname from ranyun_order a where a.id="+data.id+" and a.memerId="+data.usid;
        let sqla="select * from ranyun_orderdetails where orderId="+data.id;
        console.log(sql)
        console.log(sqla)
        self.DB().query(sql,function(rs){
            if(rs==false){
                callback(rs);
            }else{
                self.DB().query(sqla,function(rsa){
                    let obj = rs[0];
                    obj.list=rsa;
                    callback(obj);
                });
            }
        });
    }
    this.apply = function(data,callback){
        let self = this;
        let sql = "update ranyun_order set orderState='5' where id="+data.id+" and payState='2' and memerId="+data.usid;
        let sqla="insert into ranyun_exchange(`type`,`orderId`,`status`,`case`,`imgurl`,`remark`) values('"+data.type+"',"+data.id+",'0','"+data.case+"','"+data.imgurl+"','"+data.remark+"')";
        self.DB().excute(sql,function(rs){
            if(rs==false){
                callback(rs);
            }else{
                self.DB().excute(sqla,function(rsa){
                    callback(rs);
                })
            }
        });
    }
    this.comment = function(data,callback){
        let self = this;
        let sql = "select id from ranyun_order where id="+data.id+" and memerId="+data.usid;
        self.DB().query(sql,function(rs){
            if(rs==false){
                callback(rs);
            }else{
                let sqla="insert into ranyun_commoditycomment(orderId,commodityId,userId,content,grade,addTime,imgurl) select "+data.id+",commidityId,"+data.usid+",'"+data.remark+"','"+data.score+"',now(),'"+data.imgurl+"' from ranyun_orderdetails where orderId="+data.id;
                self.DB().excute(sqla,function(rsa){
                    callback(rsa);
                })
            }
        })
    }
    this.receive = function(data,callback){
        let self = this;
        let sql = "update ranyun_order set orderState='6' where id="+data.id+" and orderState>'2' and memerId="+data.usid;
        console.log(sql)
        self.DB().excute(sql,function(rs){
            callback(rs);
        })
    }
    this.month = function(data,callback){
        let self=this;
        let suppid = data.suppid;
        let sdate = new Date(data.month);
        let stm = sdate.getFullYear()+"-"+((sdate.getMonth()+101)+'').substr(1,2);
        let etm = "";
        let mth = sdate.getMonth();
        if(sdate.getMonth()==0){
            mth = 11;
            etm = (sdate.getFullYear()-1)+'-'+(mth+101+'').substr(1,2);
        }else{
            mth -= 1;
            etm = sdate.getFullYear()+'-'+(mth+101+'').substr(1,2);
        }
        let sql = "select ifnull(sum(orderAmount),0)cash,DATE_FORMAT(payTime,'%Y-%m')tjsj,count(id)num from ranyun_order where DATE_FORMAT(payTime,'%Y-%m')='"+stm+"' and suppliersId="+suppid+" group by tjsj";
        let sqla = "select ifnull(sum(orderAmount),0)cash,DATE_FORMAT(payTime,'%Y-%m')tjsj,count(id)num from ranyun_order where DATE_FORMAT(payTime,'%Y-%m')='"+etm+"' and suppliersId="+suppid+" group by tjsj";
        let sqlb = "select ifnull(sum(orderAmount),0)cash,DATE_FORMAT(payTime,'%d')dd from ranyun_order where DATE_FORMAT(payTime,'%Y-%m')='"+stm+"' and suppliersId="+suppid+" group by dd";
        let sqlc = "select ifnull(sum(orderAmount),0)cash,payType from ranyun_order where DATE_FORMAT(payTime,'%Y-%m')='"+stm+"' and payState='2' and suppliersId="+suppid+" group by payType;";
        
        self.DB().query(sql,function(rs){
            self.DB().query(sqla,function(rsa){
                self.DB().query(sqlb,function(rsb){
                    self.DB().query(sqlc,function(rsc){
                        let obj = {};
                        if(rs==false){
                            obj.isa = 1;
                        }else{
                            obj.isa = 0;
                            obj.lsta = rs[0];
                        }
                        if(rsa==false){
                            obj.isb = 1;
                        }else{
                            obj.isb = 0;
                            obj.lstb = rsa[0];
                        }
                        if(rsb==false){
                            obj.isc = 1;
                        }else{
                            obj.isc = 0;
                            obj.lstc = rsb;
                        }
                        if(rsc==false){
                            obj.isd = 1;
                        }else{
                            obj.isd = 0;
                            obj.lstd = rsc;
                        }
                        callback(obj);
                    })
                })
            })
        });
    }
    this.sendgoods = function(data,callback){
        let self = this;
        let sql = "update ranyun_order set orderState='3',postNo='"+data.expno+"',postName='"+data.expname+"',postTime=now() where id="+data.orderid+" and orderState='2' and payState='2' and suppliersId="+data.suppid;
        console.log(sql)
        self.DB().excute(sql,function(rs){
            callback(rs);
        })
    }
    this.ordernum=function(data,callback){
        let self = this;
        let sql = "select count(id)num,orderState from ranyun_order where suppliersId="+data.suppid+" and orderState in('1','2') group by orderState";
        console.log(sql)
        self.DB().query(sql,function(rs){
            callback(rs);
        })
        
    }
}
module.exports=orderService;
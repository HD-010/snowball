function memberService(){
    this.info = function(data,callback){
        let self=this;
        let suppid = data.suppid;
        let sql = "select * from ranyun_base_member where id="+suppid;
        self.DB().query(sql,function(rs){
            if(rs==false){
                callback(false);
            }else{
                let sqla = "select * from ranyun_base_member_level where suppid="+suppid;
                self.DB().query(sqla,function(rsa){
                    let obj = rs[0];
                    obj.list=rsa;
                    callback(obj);
                });
            }
        })
    }
    this.edit = function(data,callback){
        let self=this;
        let suppid = data.suppid;
        let sql = "select count(id)num from ranyun_base_member where id="+suppid;
        let funx = function(sqlx){
            self.DB().excute(sqlx,function(rsx){
                callback(rsx);
            });
        }
        let fun = function(flg,sqlx){
            let sqlc = "delete fron ranyun_base_member_level where suppid="+suppid;
            if(flg==1){
                self.DB().excute(sqlc,function(rs){
                    funx(sqlx);
                })
            }else{
                funx(sqlx);
            }
        }
        self.DB().query(sql,function(rs){
            let num = rs[0].num;
            let sqla = "";
            if(num > 0){
                sqla = "update ranyun_base_member set brand='"+data.brand+"',title='"+data.title+"',title='"+data.remark+"',balance="+data.balance+",cash="+data.cash+",recharge="+data.recharge+",expire="+data.expire+" where id="+suppid;
            }else{
                sqla = "insert into ranyun_base_member(id,brand,title,remark,balance,cash,recharge,expire,addtime) values("+suppid+",'"+data.brand+"','"+data.title+"','"+data.remark+"',"+data.balance+","+data.cash+","+data.recharge+","+data.expire+",now())";
            }
            let jsn = JSON.parse(data.ranks);
            let sqlb = "";
            for(let i=0;i<jsn.length;i++){
                if(sqlb==""){
                    sqlb="("+suppid+",'"+jsn[i].title+"',"+jsn[i].exp+","+jsn[i].discount+")";
                }else{
                    sqlb += ",("+suppid+",'"+jsn[i].title+"',"+jsn[i].exp+","+jsn[i].discount+")";
                }
            }
            sqlb = "insert into ranyun_base_member_level(suppid,title,exp,discount) values"+sqlb;
            self.DB().excute(sqla,function(rsa){
                if(rsa==false){
                    if(num>0){
                        fun(1,sqlb);
                    }else{
                        callback(rsa);
                    }
                }else{
                    if(num>0){
                        fun(1,sqlb);
                    }else{
                        fun(0,sqlb);
                    }
                }
            })
        });
    }
    this.usmember = function(data,callback){
        let self=this;
        let suppid=data.suppid;
        let usid=data.usid;
        let sql = "select a.id,a.score,b.title,b.exp from ranyun_suppliers_member a LEFT JOIN ranyun_base_member_level b on a.suppliersId=b.suppid where a.memerId="+usid+" and a.suppliersId="+suppid+" and a.score>=b.exp order by b.exp desc limit 1";
        self.DB().query(sql,function(rs){
            callback(rs)
        })
    }
    this.list = function(data,callback){
        let self=this;
        let suppid=data.suppid;
        let page=data.page;
        let sch = data.sch;
        let size = 15;
        if(page<1){
            page = 1;
        }
        let whjt = "";
        if(sch!=''){
            whjt = " and b.nick like '%"+sch+"%'";
        }
        let snum = (page-1)*size;
        let sql = "select a.id,b.face,b.mobile,b.sex,b.nick,ifnull(DATE_FORMAT(b.birthday,'%Y-%m-%d %H:%i'),'')birthday,DATE_FORMAT(b.addtime,'%Y-%m-%d %H:%i')addtime from ranyun_suppliers_member a,ranyun_member b where a.suppliersId="+suppid+" and a.memerId=b.id "+whjt+" limit "+snum+","+size;
        self.DB().query(sql,function(rs){
            callback(rs)
        })
    }
    this.usinfo = function(data,callback){
        let self=this;
        let mid=data.id;
        let sql = `select a.id,a.memerId,b.face,b.mobile,b.sex,b.nick,ifnull(DATE_FORMAT(b.birthday,'%Y-%m-%d'),'')birthday,DATE_FORMAT(b.addtime,'%Y-%m-%d %H:%i')addtime,a.cash,a.score,
        (select count(k.id) from ranyun_membercoupon k where k.suppliersId=a.suppliersId and k.memberId=a.memerId)cpnum,
        ifnull((select title from ranyun_base_member_level k where k.suppid=a.suppliersId and k.exp<=a.score order by k.exp desc limit 1),'')title,
        ifnull((select DATE_FORMAT(k.payTime,'%Y-%m-%d %H:%i') from ranyun_order k where k.suppliersId=a.suppliersId and k.memerId=a.memerId and k.payState='2' order by k.id desc limit 1),'')sutime
        from ranyun_suppliers_member a,ranyun_member b where a.id=`+mid+` and a.memerId=b.id`;
        self.DB().query(sql,function(rs){
            callback(rs);
        });
    }
    this.hscash = function(data,callback){
        let self=this;
        let mid=data.id;
        let sql = `select ifnull(sum(a.orderAmount),0)cash from ranyun_order a,ranyun_suppliers_member b where a.payState='2' and a.suppliersId=b.suppliersId and a.memerId=b.memerId and b.id=`+mid;
        self.DB().query(sql,function(rs){
            callback(rs);
        })
    }
    this.suppmemday = function(data,callback){
        let self=this;
        let mid=data.id;
        let sql = `select DATE_FORMAT(a.payTime,'%Y-%m-%d')payTime,ifnull(sum(a.orderAmount),0)cash from ranyun_order a,ranyun_suppliers_member b where a.payState='2' and a.suppliersId=b.suppliersId and a.memerId=b.memerId and b.id=`+mid+` group by payTime order by payTime desc`;
        self.DB().query(sql,function(rs){
            callback(rs);
        })
    }
    this.suppmemrecord = function(data,callback){
        let self=this;
        let mid=data.id;
        let page = data.page;
        if(page < 1){
            page = 1;
        }
        let size = 15;
        let snum = (page-1)*size;
        let sql = `select DATE_FORMAT(a.payTime,'%Y-%m-%d')payTime,a.orderAmount,a.payType,DATE_FORMAT(a.payTime,'%H:%i:%s')ptime from ranyun_order a,ranyun_suppliers_member b where a.payState='2' and a.suppliersId=b.suppliersId and a.memerId=b.memerId and b.id=`+mid+` order by payTime desc limit `+snum+`,`+size;
        self.DB().query(sql,function(rs){
            callback(rs);
        });
    }
    this.suppmemlst = function(data,callback){
        let self=this;
        let mid=data.suppid;
        let sql = `select a.id,b.face from ranyun_suppliers_member a,ranyun_member b where a.memerId=b.id and a.suppliersId=`+mid+` order by b.face desc limit 4`;
        self.DB().query(sql,function(rs){
            callback(rs);
        });
    }
}
module.exports=memberService;
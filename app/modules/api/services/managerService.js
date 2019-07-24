function managerService() {
    this.goodsnum = function(data,callback){
        let self=this;
        let usid=data.usid;
        let sid=data.suppid;
        let sql="select (select count(id) from ranyun_commidity where enable='1' and stock>0 and suppliersId="+sid+")snum,"+
        "(select count(id) from ranyun_commidity where enable='1' and stock<1 and suppliersId="+sid+")fnum,"+
        "(select count(id) from ranyun_commidity where enable='0' and suppliersId="+sid+")knum from dual";
        self.DB().query(sql,function(rs){
            callback(rs)
        });
    }
    this.goodslist = function(data,callback){
        let self=this;
        let usid=data.usid;
        let flg=data.flg;
        let sid=data.suppid;
        let page = data.page;
        if(page<1){
            page=1;
        }
        let size = 10;
        let snum = (page-1)*size;
        let wtj = "";
        if(flg==1){//出售中
            wtj = "enable='1' and stock>0 and ";
        }else if(flg==2){//售馨
            wtj = "enable='1' and stock<1 and ";
        }else if(flg==3){//仓库中
            wtj = "enable='0' and";
        }else if(flg==4){//全部
            wtj = "";
        }
        let sql = "select id,title,litPic,stock,marketPrice,currentPrice,salePrice,vipPrice,unit,salesVolume,enable from ranyun_commidity where "+wtj+" suppliersId="+sid+" order by id desc limit "+snum+","+size;
        console.log(sql)
        self.DB().query(sql,function(rs){
            callback(rs)
        });
    }
    this.gdsedit = function(data,callback){
        let self=this;
        let sid=data.suppid;
        let flg=data.flg;
        let gid=data.gid;
        let sql="";
        if(flg==1){
            sql="update ranyun_commidity set enable='1' where id="+gid+" and suppliersId="+sid;
        }else if(flg==2){
            sql="update ranyun_commidity set enable='0' where id="+gid+" and suppliersId="+sid;
        }else if(flg==3){
            sql="delete from ranyun_commidity where id="+gid+" and suppliersId="+sid;
        }
        console.log(sql)
        if(sql!=""){
            self.DB().query(sql,function(rs){
                callback(rs)
            });
        }else{
            callback(false)
        }
    }
    this.goodstype = function(data,callback){
        let self=this;
        let usid=data.usid;
        let sid=data.suppid;
        let sql="select a.id,a.pid,a.title,a.weight,a.icon,ifnull(a.imgurl,'')imgurl,(select count(b.id) from ranyun_commidity b where b.typeId=a.id)num from ranyun_commoditytype a where a.suppliersId="+sid;
        console.log(sql)
        self.DB().query(sql,function(rs){
            callback(rs)
        });
    }
    this.addtype = function(data,callback){
        let self=this;
        let usid=data.usid;
        let sid=data.suppid;
        let title=data.title;
        let sql="insert into ranyun_commoditytype(pid,title,suppliersId,addTime) values(0,'"+title+"',"+sid+",now())";
        console.log(sql)
        self.DB().excute(sql,function(rs){
            callback(rs)
        });
    }
    this.goodsadd = function(data,callback){
        let self=this;
        let sid=data.suppid;
        let gid=data.gid;
        let fee = data.fee;
        let isfee="0";
        if(fee<0.01){
            isfee="1";
        }
        let sql="";
        if(gid<1){
            let ekk = "0"
            if(data.recmd==1){
                ekk = "1"
            }
            sql=`insert into ranyun_commidity(typeId,title,recommend,litPic,mainPic,description,stock,detail,marketPrice,currentPrice,salePrice,vipPrice,
                addTime,author,suppliersId,freeEmail,fee,weight,enable) values(`+data.tpid+`,'`+data.title+`','`+data.recmd+`','`+data.litpic+`','`+data.mainpic+`'
                ,'',`+data.stock+`,'`+data.detail+`',`+data.price+`,`+data.price+`,`+data.price+`,`+data.price+`,now(),`+data.usid+`,`+sid+`,'`+isfee+`',`+fee+`,50,'`+ekk+`')`;
        }else{
            sql=`update ranyun_commidity set typeId=`+data.tpid+`,title='`+data.title+`',recommend='`+data.recmd+`',litPic='`+data.litpic+`',mainPic='`+data.mainpic+`'
            ,stock=`+data.stock+`,detail='`+data.detail+`',marketPrice=`+data.price+`,currentPrice=`+data.price+`,salePrice=`+data.price+`,vipPrice=`+data.price+`
            ,freeEmail=`+isfee+`,fee=`+fee+`,modifyTime=now(),modifyId=`+data.usid+` where id=`+gid;
        }
        console.log(sql)
        let jsx={};
        if(data.spec=='spec'){
            jsx.spec=[];
            jsx.gds=[];
        }else{
            jsx=JSON.parse(data.spec);
        }
        let jsn = jsx.spec;
        let glst = jsx.gds;
        let fun_id = function(){//获取新添加商品ID
            let sqla="select max(id)id from ranyun_commidity where suppliersId="+sid+" and author="+data.usid;
            console.log(sqla);
            self.DB().query(sqla,function(rs){
                if(rs!=false){
                    gid=rs[0].id;
                    fun_spec();
                }else{
                    fun_id();
                }
            });
        }
        let splst=[];
        let obj={};
        let fun_spec = function(){//添加规格
            let sqlx="";
            for(let i=0;i<jsn.length;i++){
                if(sqlx==""){
                    sqlx = "("+gid+",'"+jsn[i].name+"')"
                }else{
                    sqlx += ",("+gid+",'"+jsn[i].name+"')"
                }
            }
            sqlx = "insert into ranyun_commidity_spec(goodsid,title) values"+sqlx;
            console.log(sqlx);
            self.DB().excute(sqlx,function(rsa){
                if(rsa==false){
                    //fun_spec();
                }else{
                    fun_spec_id();
                }
            });
        }
        let fun_spec_id = function(){//获取规格ID
            let sqlv = "select id,title from ranyun_commidity_spec where goodsid="+gid;
            console.log(sqlv);
            self.DB().query(sqlv,function(rsb){
                if(rsb==false){
                    fun_spec_id();
                }else{
                    for(let i=0;i<rsb.length;i++){
                        for(let n=0;n<jsn.length;n++){
                            if(rsb[i].title==jsn[n].name){
                                jsn[n].id=rsb[i].id;
                                break;
                            }
                        }
                    }
                    fun_itm();
                }
            });
        }
        let fun_itm = function(){//添加规格项
            let sqln = "";
            splst=[];
            for(let i=0;i<jsn.length;i++){
                let lst = jsn[i].list;
                for(let n=0;n<lst.length;n++){
                    if(sqln==""){
                        sqln = "("+jsn[i].id+",'"+lst[n].name+"')";
                    }else{
                        sqln += ",("+jsn[i].id+",'"+lst[n].name+"')";
                    }
                    splst.push({idx:lst[n].id,name:lst[n].name});
                }
            }
            sqln = "insert into ranyun_commidity_specitem(specid,title) values"+sqln;
            console.log(sqln);
            self.DB().excute(sqln,function(rsv){
                if(rsv==false){
                    fun_itm();
                }else{
                    func_item_id();
                }
            })
        }
        let func_item_id = function(){//获取规格项ID
            let sqla = "select id,title from ranyun_commidity_specitem where specid in(select id from ranyun_commidity_spec where goodsid="+gid+")";
            console.log(sqla);
            self.DB().query(sqla,function(rs){
                if(rs==false){
                    func_item_id();
                }else{
                    for(let n=0;n<splst.length;n++){
                        for(let i=0;i<rs.length;i++){
                            //console.log(splst[n].name+"============"+rs[i].title)
                            if(splst[n].name==rs[i].title){
                                obj[splst[n].idx]=rs[i].id;
                                break;
                            }
                        }
                    }
                    func_gds();
                }
            });
        }
        function sortNumber(a, b)
        {
            return a - b;
        }
        let func_gds = function(){//添加规格详情
            let sql="";
            console.log(splst)
            console.log(obj)
            for(let i=0;i<glst.length;i++){
                let itm = glst[i];
                let lst = itm.id.split("_");
                for(let n=0;n<lst.length;n++){
                    lst[n]=obj[lst[n]];
                }
                lst.sort(sortNumber);
                let idx = lst.join("_");
                if(sql==""){
                    sql = "("+gid+",'"+itm.spec+"',"+itm.price+","+itm.price+","+itm.price+","+itm.price+","+itm.stock+",'"+idx+"')";
                }else{
                    sql += ",("+gid+",'"+itm.spec+"',"+itm.price+","+itm.price+","+itm.price+","+itm.price+","+itm.stock+",'"+idx+"')";
                }
            }
            sql="insert into ranyun_commidity_option(goodsid,title,productprice,marketprice,costprice,presellprice,stock,specs) values"+sql;
            console.log(sql);
            self.DB().excute(sql,function(rs){
                if(rs==false){
                    func_gds();
                }else{

                }
            });
        }
        let fun_del = function(){
            let sql="delete from ranyun_commidity_specitem where specid in(select id from ranyun_commidity_spec where goodsid="+gid+")";
            let sqla="delete from ranyun_commidity_spec where goodsid="+gid;
            let sqlb="delete from ranyun_commidity_option where goodsid="+gid;
            self.DB().excute(sql,function(rs){
                self.DB().excute(sqla,function(rs){
                    self.DB().excute(sqlb,function(rs){
                        fun_spec();
                    });
                });
            });
        }
        self.DB().excute(sql,function(rs){//添加或修改商品
            if(rs!=false){
                if(data.spec!="spec"){//有规格
                    if(gid<1){//商品是否新增
                        fun_id();
                    }else{
                        if(data.flg==1){
                            fun_del();
                        }
                    }
                }
            }
            callback(rs)
        });
    }
    this.goodsinfo = function(data,callback){
        let self=this;
        let gid=data.gid;
        let sid=data.suppid;
        let sql="select a.*,c.title tpname,(select count(b.id) from ranyun_commidity_spec b where b.goodsid=a.id)ispec from ranyun_commidity a,ranyun_commoditytype c where a.id="+gid+" and a.typeId=c.id and a.suppliersId="+sid;
        self.DB().query(sql,function(rs){
            if(rs!=false){
                let obj = rs[0];
                if(obj.ispec>0){
                    let sqla = "select id,title name from ranyun_commidity_spec where goodsid="+gid;
                    let sqlb = "select id,specid,title name from ranyun_commidity_specitem where specid in(select id from ranyun_commidity_spec where goodsid="+gid+")";
                    let sqlc = "select specs id,title spec,marketprice price,stock from ranyun_commidity_option where goodsid="+gid;
                    self.DB().query(sqla,function(rsa){
                        if(rsa==false){
                            callback(false);
                        }else{
                            self.DB().query(sqlb,function(rsb){
                                if(rsb==false){
                                    callback(false);
                                }else{
                                    self.DB().query(sqlc,function(rsc){
                                        if(rsc==false){
                                            callback(false);
                                        }else{
                                            for(let i=0;i<rsa.length;i++){
                                                rsa[i].list=[];
                                                for(let n=0;n<rsb.length;n++){
                                                    if(rsb[n].specid==rsa[i].id){
                                                        delete rsb[n].specid;
                                                        rsa[i].list.push(rsb[n]);
                                                    }
                                                }
                                            }
                                            obj.speclist=rsa;
                                            obj.specinfo=rsc;
                                            callback(obj);
                                        }
                                    });
                                }
                            });
                        }
                    });
                }else{
                    obj.speclist=[];
                    obj.specinfo=[];
                    callback(obj);
                }
            }else{
                callback(rs);
            }
        });
    }
    this.gdslst = function(data,callback){
        let supid = data.suppliersId;
        let self=this;
        let sql = "select id,title from ranyun_commidity where suppliersId="+supid;
        console.log(sql);
        self.DB().query(sql,function(rs){
            callback(rs);
        });
    }
    this.iconlist = function(data,callback){
        let sch = data.sch;
        let page = data.page;
        if(page<2){
            page = 1;
        }
        let size = 20;
        let snum = (page-1)*size;
        let self=this;
        let swtj = "";
        if(sch!=""){
            swtj = " where name like '%"+sch+"%'";
        }
        let sql = "select id,imgurl from ranyun_sysicon "+swtj+" limit "+snum+","+size;
        self.DB().query(sql,function(rs){
            callback(rs);
        });
    }
    this.order = function(data,callback){
        let self=this;
        let state = data.state;
        let page = data.page;
        if(page<1){
            page = 1;
        }
        let size = 15;
        let slst = state.split(",");
        let suppid = data.suppid;
        let snum = (page-1)*size;
        let ostate = "";
        for(let i=0;i<slst.length;i++){
            if(ostate==""){
                ostate = "'"+slst[i]+"'";
            }else{
                ostate += ",'"+slst[i]+"'";
            }
        }
        let sql=`select id,idkey,memerId,orderAmount,DATE_FORMAT(addTime,'%Y-%m-%d %h:%i:%s')addTime,payState,orderState,
        buyer,mobile,address,addon,fee,coupon from ranyun_order where suppliersId=`+suppid+` and orderState in(`+ostate+`) limit `+snum+`,`+size;
        console.log(sql);
        self.DB().query(sql,function(rs){
            if(rs==false){
                callback(rs);
            }else{
                let wtj = "";
                for(let i=0;i<rs.length;i++){
                    if(wtj==""){
                        wtj = ""+rs[i].id;
                    }else{
                        wtj += ","+rs[i].id;
                    }
                }
                let sqla="select * from ranyun_orderdetails where orderId in("+wtj+")";
                console.log(sqla);
                self.DB().query(sqla,function(rsa){
                    if(rsa==false){
                        callback(false);
                    }else{
                        for(let i=0;i<rs.length;i++){
                            rs[i].list=[];
                            for(let n=0;n<rsa.length;n++){
                                if(rs[i].id==rsa[n].orderId){
                                    rs[i].list.push(rsa[n]);
                                }
                            }
                        }
                        callback(rs);
                    }
                });
            }
        });
    }
    this.advise = function(data,callback){
        let self=this;
        let suppid = data.suppid;
        let dd = data.detail;
        let jsn = JSON.parse(dd);
        let sql = "update ranyun_advertisement set imgurl='"+jsn.imgurl+"',goodsId="+jsn.goodsId+",linkType="+jsn.linkType+",openType="+jsn.openType+",linkUrl='"+jsn.linkUrl+"' where id="+jsn.id+" and suppliersId="+suppid;
        self.DB().excute(sql,function(rs){
            callback(rs);
        });
    }
    this.typadv = function(data,callback){
        let self=this;
        let suppid = data.suppid;
        let tid = data.tid;
        let imgurl = data.imgurl;
        let sql = "update ranyun_commoditytype set imgurl='"+imgurl+"' where id="+tid+" and suppliersId="+suppid;
        console.log(sql)
        self.DB().excute(sql,function(rs){
            callback(rs);
        });
    }
    this.isbuy = function(data,callback){
        let self=this;
        let suppid = data.suppid;
        let sql = "select count(id)num from ranyun_buyRecord where suppid="+suppid;
        console.log(sql)
        self.DB().query(sql,function(rs){
            callback(rs);
        });
    }
    this.delbuy = function(data,callback){
        let self=this;
        let suppid = data.suppid;
        let sql = "delete from ranyun_buyRecord where suppid="+suppid;
        self.DB().excute(sql,function(rs){
            callback(rs);
        });
    }
    this.todaycount = function(data,callback){
        let self=this;
        let suppid = data.suppid;
        let sql = "select (select icon from ranyun_suppliers where id="+suppid+")icon,(select name from ranyun_suppliers where id="+suppid+")name,ifnull((select sum(orderAmount) from ranyun_order where payState='2' and suppliersId="+suppid+" and DATE_FORMAT(payTime,'%Y-%m-%d')=DATE_FORMAT(now(),'%Y-%m-%d')),0)cash,(select count(id) from ranyun_order where payState='2' and suppliersId="+suppid+" and DATE_FORMAT(payTime,'%Y-%m-%d')=DATE_FORMAT(now(),'%Y-%m-%d'))onum,(select count(id) from ranyun_suppliers_member where suppliersId="+suppid+" and DATE_FORMAT(addtime,'%Y-%m-%d')=DATE_FORMAT(now(),'%Y-%m-%d'))mnum from dual";
        self.DB().query(sql,function(rs){
            callback(rs);
        });
    }
    this.monthcount = function(data,callback){
        let self=this;
        let suppid = data.suppid;
        let sql = "select (select name from ranyun_suppliers where id="+suppid+")name,ifnull((select title from ranyun_sys_notice where suppliersId="+suppid+" order by id desc limit 1),'')title,ifnull((select sum(orderAmount) from ranyun_order where payState='2' and suppliersId="+suppid+" and DATE_FORMAT(payTime,'%Y-%m-%d')=DATE_FORMAT(now(),'%Y-%m-%d')),0)dcash,ifnull((select sum(orderAmount) from ranyun_order where payState='2' and suppliersId="+suppid+" and DATE_FORMAT(payTime,'%Y-%m')=DATE_FORMAT(now(),'%Y-%m')),0)cash,(select count(id) from ranyun_order where payState='2' and suppliersId="+suppid+" and DATE_FORMAT(payTime,'%Y-%m')=DATE_FORMAT(now(),'%Y-%m'))onum,(select count(id) from ranyun_suppliers_member where suppliersId="+suppid+" and DATE_FORMAT(addtime,'%Y-%m')=DATE_FORMAT(now(),'%Y-%m'))mnum from dual";
        self.DB().query(sql,function(rs){
            callback(rs);
        });
    }
    this.lastweek = function(data,callback){
        let self=this;
        let suppid = data.suppid;
        let sql = "select (DAYOFWEEK(payTime)-1)xaxis,sum(orderAmount)yaxis from ranyun_order where suppliersId="+suppid+" and DATE_FORMAT(payTime,'%Y-%m-%d')>DATE_FORMAT(date_sub(now(),interval 1 week),'%Y-%m-%d') group by xaxis order by payTime;";
        let sqla = "select (DAYOFWEEK(date_sub(now(),interval 6 day))-1)num from dual";
        self.DB().query(sqla,function(rs){
            let num = rs[0].num;
            self.DB().query(sql,function(rsa){
                let obj = {};
                let lst = [];
                for(let i=0;i<7;i++){
                    obj[i] = {xaxis:i,yaxis:0};
                }
                if(rsa!=false){
                    for(let i=0;i<rsa.length;i++){
                        obj[rsa[i].xaxis] = rsa[i];
                    }
                }
                for(let i=0;i<7;i++){
                    let n = num + i;
                    n = n%7;
                    lst.push(obj[n]);
                }
                callback(lst);
            });
        });
    }
    this.bookcount = function(data,callback){
        let self=this;
        let suppid = data.suppid;
        let sdate = new Date(data.stime);
        let edate = new Date(data.etime);
        let stm = sdate.getFullYear()+"-"+((sdate.getMonth()+101)+'').substr(1,2)+"-"+((sdate.getDate()+100)+'').substr(1,2);
        let etm = edate.getFullYear()+"-"+((edate.getMonth()+101)+'').substr(1,2)+"-"+((edate.getDate()+100)+'').substr(1,2);
        let sql = "select DATE_FORMAT(payTime,'%Y-%m-%d')payTime,sum(orderAmount)cash from ranyun_order where suppliersId="+suppid+" and DATE_FORMAT(payTime,'%Y-%m-%d')>='"+stm+"' and DATE_FORMAT(payTime,'%Y-%m-%d')<='"+etm+"' group by payTime order by payTime desc";
        console.log(sql)
        self.DB().query(sql,function(rs){
            callback(rs);
        });
    }
    this.bookrecord = function(data,callback){
        let self=this;
        let suppid = data.suppid;
        let sdate = new Date(data.stime);
        let edate = new Date(data.etime);
        let page = data.page;
        let size = 10;
        if(page<1){
            page = 1;
        }
        let snum = (page-1)*size;
        let stm = sdate.getFullYear()+"-"+((sdate.getMonth()+101)+'').substr(1,2)+"-"+((sdate.getDate()+100)+'').substr(1,2);
        let etm = edate.getFullYear()+"-"+((edate.getMonth()+101)+'').substr(1,2)+"-"+((edate.getDate()+100)+'').substr(1,2);
        let sql="select id,DATE_FORMAT(payTime,'%Y-%m-%d')dtime,DATE_FORMAT(payTime,'%H:%i:%s')mtime,payType,orderAmount,orderState from ranyun_order where suppliersId="+suppid+" and payState='2' and DATE_FORMAT(payTime,'%Y-%m-%d')>='"+stm+"' and DATE_FORMAT(payTime,'%Y-%m-%d')<='"+etm+"' order by payTime desc limit "+snum+","+size;
        console.log(sql)
        self.DB().query(sql,function(rs){
            callback(rs);
        });
    }
    this.certification = function(data,callback){
        let self=this;
        let suppid = data.suppid;
        let sql = "select count(id)num from ranyun_certification where suppliersId="+suppid;
        self.DB().query(sql,function(rs){
            let num = rs[0].num;
            let sqla = "";
            if(num>0){
                sqla="update ranyun_certification set name='"+data.name+"',legal='"+data.legal+"',idcard='"+data.idcard+"',face='"+data.face+"',back='"+data.back+"',licence_no='"+data.lno+"',licence_img='"+data.limg+"',permitId='"+data.permitId+"',permitImg='"+data.permitImg+"',lastime=now() where suppliersId="+suppid;
            }else{
                sqla="insert into ranyun_certification(suppliersId,type,name,legal,idcard,face,back,licence_no,licence_img,addtime,permitId,permitImg) values("+suppid+","+data.type+",'"+data.name+"','"+data.legal+"','"+data.idcard+"','"+data.face+"','"+data.back+"','"+data.lno+"','"+data.limg+"',now(),'"+data.permitId+"','"+data.permitImg+"')";
            }
            self.DB().excute(sqla,function(rsa){
                callback(rsa,num);
            });
        })
    };
    this.suppliers = function(data,callback){
        let self=this;
        let usid = data.usid;
        let sql = "select * from ranyun_suppliers where memberId="+usid;
        console.log(sql)
        self.DB().query(sql,function(rs){
            callback(rs);
        })
    };
    this.bank = function(data,callback){
        let self=this;
        let usid = data.usid;
        let code = data.code;
        let db = self.DB("Redis");
        let ky = "yzm_"+data.phone;
        let checkTimer = function(stm){
            let mm = new Date().getTime();
            let rtn = (mm-stm)/1000;
            return rtn;
        }
        let sql = "update ranyun_suppliers set cname='"+data.name+"',bankid='"+data.bankid+"',bank='"+data.bank+"',phone='"+data.phone+"' where memberId="+usid+" and id="+data.suppid;
        db.getRedis(ky,function(dd){
            if(dd!=false){
                let jsn = JSON.parse(dd);
                if(code==jsn.code){
                    let lng = checkTimer(jsn.time);
                    if(lng<120){//验证码在有效期内时添加数据
                        console.log(sql)
                        self.DB().excute(sql,function(rs){
                            callback(rs);
                        })
                    }else{
                        callback(false);
                    }
                }else{
                    callback(false);
                }
            }else{
                callback(false);
            }
        });
    };
    this.wxcash = function(data,callback){
        let self=this;
        let usid = data.usid;
        let code = data.code;
        let openid = data.openid;
        let db = self.DB("Redis");
        let ky = "yzm_"+data.phone;
        let checkTimer = function(stm){
            let mm = new Date().getTime();
            let rtn = (mm-stm)/1000;
            return rtn;
        }
        let sqla = "select id,ifnull(openid3,'')openid,nick from ranyun_member where mobile='"+data.phone+"'";
        console.log(sqla)
        db.getRedis(ky,function(dd){
            if(dd!=false){
                let jsn = JSON.parse(dd);
                if(code==jsn.code){
                    let lng = checkTimer(jsn.time);
                    if(lng<120){//验证码在有效期内时添加数据
                        self.DB().query(sqla,function(rsa){
                            if(rsa==false){
                                callback(false);
                            }else{
                                let obj = rsa[0];
                                if(usid==obj.id){
                                    if(obj.openid==''){
                                        obj.nick=data.nick;
                                        let sqlb = "update ranyun_member set openid3='"+openid+"' where id="+usid;
                                        console.log(sqlb)
                                        self.DB().excute(sqlb,function(rsx){})
                                    }
                                    let sql = "update ranyun_suppliers set openid='"+openid+"',phone_wx='"+data.phone+"',wname='"+obj.nick+"' where id="+data.suppid;
                                    console.log(sql)
                                    self.DB().excute(sql,function(rsx){
                                        callback(rsx);
                                    })
                                }else{
                                    callback(false);
                                }
                            }
                        })
                    }else{
                        callback(false);
                    }
                }else{
                    callback(false);
                }
            }else{
                callback(false);
            }
        });
    }
    this.bindlist = function(data,callback){
        let self=this;
        let suppid = data.suppid;
        let sql = "select ifnull(bankid,'')bankid,ifnull(openid,'')openid from ranyun_suppliers where id="+suppid;
        self.DB().query(sql,function(rs){
            callback(rs);
        })
    };
    this.withdraw = function(data,callback){
        let self=this;
        let tocnt = "";
        console.log(data)
        if(data.flg==1){
            tocnt = "cname,bankid,bank";
        }else if(data.flg==2){
            tocnt = "wname,openid,'微信'";
        }else{
            callback(false);
            return;
        }
        let sql = "insert into ranyun_withdraw(usid,suppid,cash,addtime,state,flg,cname,account,bank) select "+data.usid+",id,"+data.cash+",now(),0,"+data.flg+","+tocnt+" from ranyun_suppliers where id="+data.suppid;
        console.log(sql)
        self.DB().excute(sql,function(rs){
            callback(rs);
        })
    };
    this.means = function(data,callback){
        let self=this;
        let sql = "select ifnull((select sum(orderAmount) from ranyun_order where suppliersId="+data.suppid+" and orderState in('2','3','4','6')),0)wrz,ifnull((select sum(orderAmount) from ranyun_order where suppliersId="+data.suppid+" and orderState='8'),0)yrz,ifnull((select sum(cash) from ranyun_withdraw where suppid="+data.suppid+" and state in(0,1)),0)ytx from dual;"
        console.log(sql)
        self.DB().query(sql,function(rs){
            callback(rs);
        })
    };
    this.withdrawcash = function(data,callback){
        let self=this;
        let sql = "select ifnull(sum(cash),0)cash from ranyun_withdraw where suppid="+data.suppid+" and state in(0,1)";
        self.DB().query(sql,function(rs){
            callback(rs);
        })
    }
    this.withdrawrecord = function(data,callback){
        let self=this;
        let page = data.page;
        if(page<1){
            page = 1;
        }
        let size = 15;
        let snum = (page-1)*size;
        let sql = "select id,usid,suppid,cash,DATE_FORMAT(addTime,'%Y-%m-%d')addtime,DATE_FORMAT(addTime,'%h:%i:%s')timex,state,ifnull(DATE_FORMAT(oktime,'%Y-%m-%d %h:%i:%s'),'')oktime,flg,account,bank,cname from ranyun_withdraw where suppid="+data.suppid+" order by id desc limit "+snum+","+size;
        console.log(sql)
        self.DB().query(sql,function(rs){
            callback(rs);
        });
    };
    this.suppedit = function(data,callback){
        let self=this;
        let sql = "update ranyun_suppliers set icon='"+data.imgurl+"' where id="+data.suppid;
        self.DB().excute(sql,function(rs){
            callback(rs);
        })
    };
}
module.exports = managerService;
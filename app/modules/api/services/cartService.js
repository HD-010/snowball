function cartService() {
    this.add = function (ky, suppid, data, callback) {
        let gds = JSON.parse(data)
        let db = this.DB("Redis");
        db.getRedis(ky, function (rs) {
            let obj = {};
            if (rs != false) {
                obj = JSON.parse(rs);
            }
            if (obj[suppid] == undefined) {
                obj[suppid] = {};
            }
            obj[suppid][gds.id] = gds;

            db.setRedis(ky, obj, function (rsa) {
                callback(rsa);
            });
        });
    }
    this.del = function (ky, data, callback) {
        let gds = JSON.parse(data)
        let db = this.DB("Redis");
        db.getRedis(ky, function (rs) {
            let obj = {};
            if (rs != false) {
                obj = JSON.parse(rs);
            }
            for (let i=0;i<gds.length;i++) {
                let gg=gds[i];
                for(let g in gg){
                    let lst = gg[g];
                    if (typeof (lst) == 'function') continue;
                    for(let n=0;n<lst.length;n++){
                        console.log(lst[n])
                        if(obj[g]!=undefined){
                            delete obj[g][lst[n]];
                        }
                    }
                }
            }
            db.setRedis(ky, obj, function (rsa) {
                callback(rsa);
            });
        });
    }
    this.getdata = function (data, usid, suppid, callback) {
        let obj = data;
        let idx = "";
        let spec = "";
        let self = this;
        try {
            if (suppid > 0) {
                for (let itm in obj) {
                    if (typeof (obj[itm]) == 'function') continue;
                    if (itm == suppid) {
                        for (let item in obj[itm]) {
                            let gds = obj[itm][item];
                            if (typeof (gds) == 'function') continue;
                            if (idx == "") {
                                idx = "" + gds.id;
                            } else {
                                idx += "," + gds.id;
                            }
                            if (gds.spec != "") {
                                if (spec == "") {
                                    spec = "'" + gds.spec + "'";
                                } else {
                                    spec += ",'" + gds.spec + "'";
                                }
                            }
                        }
                    }
                }
            } else {
                for (let itm in obj) {
                    if (typeof (obj[itm]) == 'function') continue;
                    for (let item in obj[itm]) {
                        let gds = obj[itm][item];
                        if (typeof (gds) == 'function') continue;
                        console.log("obj", gds)
                        console.log("obj-d", gds.id)
                        if (idx == "") {
                            idx = "" + gds.id;
                        } else {
                            idx += "," + gds.id;
                        }
                        if (gds.spec != "") {
                            if (spec == "") {
                                spec = "'" + gds.spec + "'";
                            } else {
                                spec += ",'" + gds.spec + "'";
                            }
                        }
                    }
                }
            }
            let wtj = "";
            if (spec != "") {
                wtj = " x.specs in (" + spec + ") or ";
            }
            let sql = `select * from (
            select a.id,a.title,a.litPic,a.coupon,a.unit,a.currentPrice,a.marketPrice,a.salePrice,a.stock,a.freeEmail,a.fee,ifnull(b.stock,0)stocka,
            ifnull(b.title,'')sname,ifnull(b.marketprice,0)specprice,ifnull(b.productprice,0)prodprice,ifnull(b.presellprice,0)presellprice,
            a.suppliersId,ifnull((select c.name from ranyun_suppliers c where c.id=a.suppliersId),'')suppliersname,
            b.goodsid,ifnull(b.specs,'')specs from ranyun_commidity a left join ranyun_commidity_option b on a.id = b.goodsid where 
            a.id in(`+ idx + `)) x where ` + wtj + `x.goodsid is null`;
            console.log(sql)
            self.DB().query(sql, function (rsa) {
                if (rsa == false) {
                    callback(rsa);
                } else {
                    let lst = {};
                    console.log(obj)
                    for (let i = 0; i < rsa.length; i++) {
                        let sid = rsa[i].suppliersId;
                        if (lst[sid] == undefined) {
                            lst[sid] = {};
                            lst[sid].id = rsa[i].suppliersId;
                            lst[sid].name = rsa[i].suppliersname;
                            lst[sid].cash = 0;
                            lst[sid].fee = 0;
                            lst[sid].list = [];
                        }
                        delete rsa[i].suppliersId;
                        delete rsa[i].suppliersname;
                        console.log(obj[sid])
                        console.log(rsa[i])
                        rsa[i].num = obj[sid][rsa[i].id].num;
                        if (rsa[i].presellprice > 0) {
                            lst[sid].cash += (rsa[i].num * rsa[i].presellprice);
                        } else {
                            lst[sid].cash += (rsa[i].num * rsa[i].salePrice);
                        }
                        if (rsa[i].freeEmail == '0') {
                            lst[sid].fee += (rsa[i].num * rsa[i].fee);
                        }
                        lst[sid].list.push(rsa[i]);
                    }
                    let ctj = "";
                    for (let kk in lst) {
                        if (typeof (lst[kk]) == 'function') continue;
                        if (ctj == "") {
                            ctj = "(suppliersId=" + kk + " and money<" + lst[kk].cash + ")";
                        } else {
                            ctj += " or (suppliersId=" + kk + " and money<=" + lst[kk].cash + ")";
                        }
                    }
                    let sqla = `select id,suppliersId,title,money,value from ranyun_membercoupon where memberId=` + usid + ` and effect<=now() and expirate>=now() and status='0' and (` + ctj + `)`;
                    //console.log(sqla)
                    self.DB().query(sqla, function (rs) {
                        if (rs != false) {
                            for (let k = 0; k < rs.length; k++) {
                                if (lst[rs[k].suppliersId].cpn == undefined) {
                                    lst[rs[k].suppliersId].cpn = rs[k];
                                } else {
                                    if (lst[rs[k].suppliersId].cpn.value < rs[k].value) {
                                        lst[rs[k].suppliersId].cpn = rs[k];
                                    }
                                }
                            }
                        }
                        let lsts = [];
                        for (let kk in lst) {
                            if (typeof (lst[kk]) == 'function') continue;
                            if (lst[kk].cpn == undefined) {
                                lst[kk].cpn = { id: 0 };
                            }
                            lsts.push(lst[kk]);
                        }
                        callback(lsts);
                    })
                }
            })
        } catch (e) {

        }
    }
    this.list = function (usid, suppid, callback) {
        let ky = "cart_user_" + usid;
        let db = this.DB("Redis");
        let self = this;
        db.getRedis(ky, function (rs) {
            if (rs == false) {
                callback(rs);
            } else {
                let obj = JSON.parse(rs);
                self.getdata(obj, usid, suppid, function (dd) {
                    callback(dd);
                })
            }
        });
    }
    this.confirm = function (data, callback) {
        let self = this;
        let usid = data.usid;
        let jsn = JSON.parse(data.gdslist);
        let obj = {};
        for (let itm in jsn) {
            let lst = jsn[itm];
            if (typeof (lst) == 'function') continue;
            for (let i = 0; i < lst.length; i++) {
                if (obj[itm] == undefined) {
                    obj[itm] = {};
                }
                obj[itm][lst[i].id] = lst[i];
            }
        }
        let sql = "select id,name,mobile,ifnull(preAddress,'')preAddress,address from ranyun_recivingaddress where memberId=" + usid + " order by def desc limit 0,1";
        self.getdata(obj, usid, 0, function (dd) {
            if (dd == false) {
                callback(dd);
            } else {
                self.DB().query(sql, function (rs) {
                    let cbs = { list: dd }
                    if (rs == false) {
                        cbs.dz = { id: 0 };
                    } else {
                        cbs.dz = rs[0];
                    }
                    callback(cbs);
                });
            }
        });
    }
    this.order = function (data, callback) {
        let self = this;
        let usid = data.usid;
        let dzid = data.dzid;
        let jsn = JSON.parse(data.gds);
        let cpn = JSON.parse(data.cpn);
        let bz = JSON.parse(data.addon);
        let obj = {};
        if(dzid<1){
            callback(false);
            return;
        }
        for (let itm in jsn) {
            let lst = jsn[itm];
            if (typeof (lst) == 'function') continue;
            for (let i = 0; i < lst.length; i++) {
                if (obj[itm] == undefined) {
                    obj[itm] = {};
                }
                obj[itm][lst[i].id] = lst[i];
            }
        }
        let funcorder = function (oid, idky, suppid, cash, addon, exfee, cpnfee, cllbk) {
            let sql = "insert into ranyun_order(orderId,idkey,memerId,suppliersId,orderAmount,addTime,payType,payState,orderState,buyer,mobile,address,addon,fee,coupon)" +
                "select '" + oid + "','" + idky + "','" + usid + "','" + suppid + "'," + cash + ",now(),'0','0','1',name,mobile,CONCAT(ifnull(preAddress,''),ifnull(address,'')),'" + addon + "'," + exfee + "," + cpnfee + " from ranyun_recivingaddress where id=" + dzid;
            let sqla = "select id from ranyun_order where idkey='" + idky + "'";
            console.log(sql)
            self.DB().excute(sql, function (rs) {
                self.DB().query(sqla, function (rsa) {
                    if (rsa == false) {
                        funcorder(oid, idky, suppid, cash, addon, exfee, cpnfee, cllbk);
                    } else {
                        cllbk(rsa[0].id);
                    }
                });
            });
        }
        
        self.getdata(obj, usid, 0, function (dd) {
            if (dd == false) {
                callback(dd);
            } else {
                let oid = self.getId("");
                let ddje = 0;
                let idlst = [];
                for (let i = 0; i < dd.length; i++) {
                    let idky = self.getId("");
                    let cpnv = 0;
                    if (cpn[dd[i].id] != 0 && cpn[dd[i].id] == dd[i].cpn.id) {
                        cpnv = dd[i].cpn.value;
                    }
                    let cash = dd[i].cash + dd[i].fee - cpnv;
                    ddje += cash;
                    //let sql = "insert into ranyun_orderdetails(commidityId,orderId,commidityName,litpic,salePrice,marketValue,number,attr,coupon,unit)"

                    funcorder(oid, idky, dd[i].id, cash, bz[dd[i].id], dd[i].fee, cpnv, function (idx) {
                        idlst.push(idx);
                        let sql = "";
                        let lst = dd[i].list;
                        for (let k = 0; k < lst.length; k++) {
                            let price = lst[k].salePrice;
                            let mprice = lst[k].marketPrice;
                            if (lst[k].presellprice > 0) {
                                price = lst[k].presellprice;
                                mprice = lst[k].specprice;
                            }
                            if (sql == "") {
                                sql = "(" + lst[k].id + "," + idx + ",'" + lst[k].title + "','" + lst[k].litPic + "'," + price + "," + mprice + "," + lst[k].num + ",'" + lst[k].specs + "','" + lst[k].coupon + "','" + lst[k].unit + "','" + lst[k].freeEmail + "'," + lst[k].fee + ")";
                            } else {
                                sql += ",(" + lst[k].id + "," + idx + ",'" + lst[k].title + "','" + lst[k].litPic + "'," + price + "," + mprice + "," + lst[k].num + ",'" + lst[k].specs + "','" + lst[k].coupon + "','" + lst[k].unit + "','" + lst[k].freeEmail + "'," + lst[k].fee + ")";
                            }
                        }
                        sql = "insert into ranyun_orderdetails(commidityId,orderId,commidityName,litpic,salePrice,marketValue,number,attr,coupon,unit,freeEmail,fee) values" + sql;
                        let sqla = "update ranyun_orderdetails set sname=ifnull((select title from ranyun_commidity_option where specs=attr limit 1),'') where orderId="+idx;
                        self.DB().excute(sql, function (rs) { 
                            self.DB().excute(sqla, function (rs) {});
                        });
                        if (idlst.length == dd.length) {
                            callback({ id: idlst.toString(), cash: ddje });
                        }
                    });
                }
            }
        });
    }
}
module.exports = cartService;
function goodsService(){
    this.home = function(suppid,callback){
        let sql = "select id,title,litPic,description,salePrice,vipPrice,salesVolume from ranyun_commidity where recommend='1' and enable='1' and suppliersId="+suppid+" order by weight desc,click desc,id asc limit 0,20";
        this.DB().query(sql,function(rs){
            if(rs==false){
                callback(false);
            }else{
                callback(rs)
            }
        });
    };
    this.search = function(data,callback){
        let size = 15;
        let page = data.page;
        let suppid=data.suppid;
        if(page<1){
            page = 1;
        }
        let snum = (page-1)*size;
        let whjt = "";
        if(data.sch!=''){
            whjt = " and title like '%"+data.sch+"%'";
        }
        let sql = "select id,title,litPic,description,salePrice,vipPrice,salesVolume from ranyun_commidity where enable='1' and suppliersId="+suppid+whjt+" order by weight desc,click desc,id asc limit "+snum+","+size;
        console.log(sql)
        this.DB().query(sql,function(rs){
            if(rs==false){
                callback(false);
            }else{
                callback(rs)
            }
        });
    };
    this.banner = function(suppid,callback){
        let sql="select id,title,imgurl,goodsId,openType,linkType,linkUrl from ranyun_banner where suppliersId="+suppid;
        console.log(sql);
        this.DB().query(sql,function(rs){
            if(rs==false){
                callback(false);
            }else{
                callback(rs)
            }
        });
    };
    this.notice = function(suppid,callback){
        let sql="select id,message,goodsId,linkType,linkUrl,openType from ranyun_message where suppliersId="+suppid;
        console.log(sql);
        this.DB().query(sql,function(rs){
            if(rs==false){
                callback(false);
            }else{
                callback(rs[0])
            }
        });
    };
    this.advise = function(suppid,callback){
        let sql="select id,imgurl,goodsId,mark,openType,linkType,linkUrl from ranyun_advertisement where suppliersId="+suppid;
        this.DB().query(sql,function(rs){
            if(rs==false){
                callback(false);
            }else{
                callback(rs)
            }
        });
    };
    this.detail = function(gid,usid,callback){
        let self=this;
        let wdsc='0';
        if(usid>0){
            wdsc= "(select count(id) from ranyun_myfavorites b where b.goodsId=a.id and b.memberId="+usid+")";
        }
        let sql="select a.id,a.litPic,a.description,a.suppliersId,a.detail,a.mainPic,a.marketPrice,a.currentPrice,a.salePrice,a.vipPrice,a.title,a.freeEmail,a.stock,ifnull(a.fee,0)fee,(select count(id) from ranyun_myfavorites b where b.goodsId=a.id)collectionNum,"+wdsc+" isCollection,(select count(id) from ranyun_commidity_spec b where b.goodsid=a.id)ispec,ifnull(max(c.marketprice),0)maxprice,ifnull(min(c.marketprice),0)minprice from ranyun_commidity a left join ranyun_commidity_option c on c.goodsid=a.id where a.id="+gid;
        let fun = function(uid,sid){
            let sqlx = "select * from ranyun_suppliers_member where memerId="+uid+" and suppliersId="+sid;
            self.DB().query(sqlx,function(rs){
                if(rs==false){
                    let sqla = "insert into ranyun_suppliers_member(suppliersId,memerId,score,addtime) values("+sid+","+uid+",0,now())";
                    self.DB().excute(sqla,function(rsa){});
                }
            });
        }
        self.DB().query(sql,function(rs){
            if(rs==false){
                callback(false);
            }else{
                let obj=rs[0];
                if(obj.id>0){
                    console.log("==================detail==============="+usid)
                    if(usid>0){
                        fun(usid,obj.suppliersId);
                    }
                    callback(obj);
                }else{
                    callback(false);
                }
            }
        });
    };
    this.hometype = function(num,suppid,callback){
        let self=this;
        let sql="select count(id) num from ranyun_commoditytype where suppliersId="+suppid+" and pid in(select id from ranyun_commoditytype where pid=0)";
        let sqla="select id,title,imgurl from ranyun_commoditytype where suppliersId="+suppid+" order by weight desc,id asc limit 0,"+num;
        let sqlb="select id,title,imgurl from ranyun_commoditytype where suppliersId="+suppid+" and pid in(select id from ranyun_commoditytype where pid=0) order by weight desc,id asc limit 0,"+num;
        let fun = function(ndx,list){
            let sqlv = "select id,title,litPic,description,salePrice,vipPrice,salesVolume from ranyun_commidity where enable='1' and suppliersId="+suppid+" and typeId="+list[ndx].id+" order by weight desc,id asc limit 0,3";
            self.DB().query(sqlv,function(rs){
                if(rs==false){
                    list[ndx].list=[];
                }else{
                    list[ndx].list=rs;
                }
                if(ndx<list.length-1){
                    fun(ndx+1,list);
                }else{
                    callback(list);
                }
            })
        }
        self.DB().query(sql,function(rs){
            if(rs==false){
                callback(false);
            }else{
                let sqlx = sqlb;
                if(rs[0].num==0){
                    sqlx = sqla;
                } 
                self.DB().query(sqlx,function(rsa){
                    if(rsa==false){
                        callback(false);
                    }else{
                        fun(0,rsa);
                    }
                })
            }
        });
    };
    this.homeicon = function(suppid,callback){
        let sql="select id,title,imgurl,openType,jumpParm,linkType,linkUrl from ranyun_homeIcon where suppliersId="+suppid;
        this.DB().query(sql,function(rs){
            if(rs==false){
                callback(false);
            }else{
                if(rs[0].id>0){
                    callback(rs);
                }else{
                    callback(false);
                }
            }
        });
    };
    this.specs = function(gid,callback){
        let self=this;
        let sql="select b.id,b.title,a.title name,a.goodsid,b.specid from ranyun_commidity_spec a,ranyun_commidity_specitem b where b.specid=a.id and a.goodsid="+gid;
        self.DB().query(sql,function(rs){
            if(rs==false){
                callback(false);
            }else{
                let lst={};
				for(let i=0;i<rs.length;i++){
					if(lst[rs[i].specid]==undefined){
						lst[rs[i].specid]={id:rs[i].specid,title:rs[i].name,list:[]};
					}
					let obj={};
					obj.id=rs[i].id;
					obj.title=rs[i].title;
					lst[rs[i].specid].list.push(obj);
				}
				let lsts=[];
				for(let itm in lst){
                    if(typeof lst[itm] == 'function') continue;
					lsts.push(lst[itm]);
                }
                let sqla="select id,title,productprice,marketprice,costprice,presellprice,stock,specs from ranyun_commidity_option where goodsid="+gid;
                self.DB().query(sqla,function(rsa){
                    let rlst={};
                    rlst.spec=lsts;
                    if(rsa==false){
                        rlst.lst=[];
                    }else{
                        rlst.lst=rsa;
                    }
                    callback(rlst);
                });
            }
        });
    };
    this.collect = function(data,callback){
        let usid = data.usid;
        let gid = data.gdsid;
        let sql = "select id from ranyun_myfavorites where memberId="+usid+" and goodsId="+gid;
        let self=this;
        self.DB().query(sql,function(rs){
            if(rs==false){
                let sqla="insert into ranyun_myfavorites(memberId,goodsId,addTime) values("+usid+","+gid+",now())";
                self.DB().excute(sqla,function(rsa){
                    callback(rsa);
                });
            }else{
                let sqlb="delete from ranyun_myfavorites where memberId="+usid+" and goodsId="+gid;
                self.DB().excute(sqlb,function(rsa){
                    callback(rsa);
                });
            }
        })
    };
    this.discuss = function(data,callback){
        let gid = data.gdsid;
        let page = data.page;
        if(page<1){
            page = 1;
        }
        let size = 15;
        let snum = (page-1)*size;
        let sql = "select a.id,a.orderId,a.commodityId,a.imgurl,a.userId,(select b.mobile from ranyun_member b where b.id=a.userId)phone,a.content,a.grade,DATE_FORMAT(a.addTime,'%Y-%m-%d %H:%i')addTime from ranyun_commoditycomment a where a.commodityId="+gid+" order by a.id desc limit "+snum+","+size;
        let self=this;
        self.DB().query(sql,function(rs){
            callback(rs);
        })
    };
    this.category = function(data,callback){
        let suppid = data.suppid;
        let sql = "select id,title from ranyun_commoditytype where suppliersId="+suppid+" order by id desc";
        let self=this;
        self.DB().query(sql,function(rs){
            callback(rs);
        })
    };
    this.list = function(data,callback){
        let tpid = data.typeid;
        let page = data.page;
        if(page<1){
            page = 1;
        }
        let size = 20;
        let snum = (page-1)*size;
        let wjt = "";
        if(tpid>0){
            wjt = " where typeId="+tpid;
        }
        let sql = "select id,typeId,title,litPic,description,salePrice from ranyun_commidity "+wjt+" order by weight desc limit "+snum+","+size;
        let self=this;
        self.DB().query(sql,function(rs){
            callback(rs);
        })
    };
}

module.exports = goodsService;
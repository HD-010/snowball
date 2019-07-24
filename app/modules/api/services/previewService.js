function previewService(){//数据库中supplierid为模板id
    this.banner = function(data,callback){
        let suppid = data.suppliersId;
        let sql = "select id,title,imgurl,goodsId,openType,linkType,linkUrl from ranyun_banner_preview where suppliersId="+suppid;
        this.DB().query(sql,function(rs){
            callback(rs);
        })
    }
    this.homeicon = function(data,callback){
        let suppid = data.suppliersId;
        let sql = "select id,title,imgurl,openType,jumpParm,linkType,linkUrl from ranyun_homeIcon_preview where suppliersId="+suppid;
        this.DB().query(sql,function(rs){
            callback(rs);
        })
    }
    this.notice = function(data,callback){
        let suppid = data.suppliersId;
        let sql = "select id,message,goodsId,linkType,linkUrl,openType from ranyun_message_preview where suppliersId="+suppid;
        this.DB().query(sql,function(rs){
            callback(rs);
        })
    }
    this.advise = function(data,callback){
        let suppid = data.suppliersId;
        let sql = "select id,imgurl,goodsId,mark,openType,linkType,linkUrl from ranyun_advertisement_preview where suppliersId="+suppid;
        this.DB().query(sql,function(rs){
            callback(rs);
        })
    }
    this.home = function(data,callback){
        let suppid = data.suppliersId;
        let sql = "select id,title,litPic,description,salePrice,vipPrice,salesVolume from ranyun_commidity_preview where suppliersId="+suppid;
        this.DB().query(sql,function(rs){
            callback(rs);
        })
    }
    this.detail = function(data,callback){
        let self=this;
        let gid=data.gid;
        let sql="select id,litPic,description,detail,mainPic,marketPrice,currentPrice,salePrice,vipPrice,title,freeEmail,stock,ifnull(fee,0)fee,0 collectionNum,0 isCollection,0 ispec,0 maxprice,0 minprice from ranyun_commidity_preview where id="+gid;
        self.DB().query(sql,function(rs){
            if(rs==false){
                callback(false);
            }else{
                let obj=rs[0];
                callback(obj);
            }
        });
    }
    this.hometype = function(data,callback){
        let self=this;
        let suppid=data.suppliersId;
        let num = data.num;
        let sql="select count(id) num from ranyun_commoditytype_preview where suppliersId="+suppid+" and pid in(select id from ranyun_commoditytype_preview where pid=0)";
        let sqla="select id,title,imgurl from ranyun_commoditytype_preview where suppliersId="+suppid+" order by weight desc,id asc limit 0,"+num;
        let sqlb="select id,title,imgurl from ranyun_commoditytype_preview where suppliersId="+suppid+" and pid in(select id from ranyun_commoditytype_preview where pid=0) order by weight desc,id asc limit 0,"+num;
        let fun = function(ndx,list){
            let sqlv = "select id,title,litPic,description,salePrice,vipPrice,salesVolume from ranyun_commidity_preview where suppliersId="+suppid+" and typeId="+list[ndx].id+" order by weight desc,id asc limit 0,3";
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
}
module.exports=previewService;

function decorateService(){
    this.banner = function(data,callback){
        let self=this;
        let usid = data.usid;
        let suppid = data.suppid;
        let sql = "delete from ranyun_banner where suppliersId="+suppid;
        let sqlx="";
        let lst = JSON.parse(data.detail);
        for(let i=0;i<lst.length;i++){
            let itm = lst[i];
            let ttl = itm.title==undefined?"":itm.title;
            if(sqlx==""){
                sqlx = "('"+ttl+"','"+itm.imgurl+"',"+itm.goodsId+","+suppid+",now(),"+itm.openType+","+itm.linkType+",'"+itm.linkUrl+"',50)";
            }else{
                sqlx += ",('"+ttl+"','"+itm.imgurl+"',"+itm.goodsId+","+suppid+",now(),"+itm.openType+","+itm.linkType+",'"+itm.linkUrl+"',50)";
            }
        }
        sqlx = "insert into ranyun_banner(title,imgurl,goodsId,suppliersId,addtime,openType,linkType,linkUrl,weight) values"+sqlx;
        self.DB().query(sql,function(rs){
            self.DB().excute(sqlx,function(rsa){
                callback(rsa);
            })
        });
    }
    this.homeicon = function(data,callback){
        let self=this;
        let usid = data.usid;
        let suppid = data.suppid;
        let lurl = data.linkUrl;
        if(lurl=="0"){
            lurl=""
        }
        let sql = "update ranyun_homeIcon set title='"+data.title+"',imgurl='"+data.imgurl+"',linkType="+data.linkType+",linkUrl='"+lurl+"',jumpParm="+data.jumpParm+",openType="+data.openType+" where id="+data.id+" and suppliersId="+suppid;
        console.log(sql)
        self.DB().excute(sql,function(rs){
            callback(rs);
        });
    }
    this.notice = function(data,callback){
        let self=this;
        let usid = data.usid;
        let suppid = data.suppid;
        let lurl = data.linkUrl;
        if(lurl=="0"){
            lurl=""
        }
        let sql = "update ranyun_message set message='"+data.title+"',linkType="+data.linkType+",linkUrl='"+lurl+"',goodsId="+data.jumpParm+",openType="+data.openType+" where id="+data.id+" and suppliersId="+suppid;
        console.log(sql)
        self.DB().excute(sql,function(rs){
            callback(rs);
        });
    }
}
module.exports = decorateService;
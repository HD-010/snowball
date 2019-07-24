function addressService(){
    this.setDef=function(usid,def,callback){
        let sql = "update ranyun_recivingaddress set def='0' where memberId="+usid;
        if(def=="1"){
            this.DB().excute(sql,function(rs){
                callback(rs)
            });
        }else{
            callback(false)
        }
    }
    this.add = function(data,callback){
        let self=this;
        if(data.def!="1"){
            data.def="0";
        }
        let sql = "insert into ranyun_recivingaddress(memberId,name,mobile,preAddress,address,def) values"+
            "("+data.usid+",'"+data.name+"','"+data.phone+"','"+data.pre+"','"+data.address+"','"+data.def+"')";
        self.setDef(data.usid,data.def,function(rsa){
            self.DB().excute(sql,function(rs){
                callback(rs)
            });
        })
    }
    this.list = function(usid,callback){
        let self=this;
        let sql = "select id,name,mobile,preAddress,address,def from ranyun_recivingaddress where memberId="+usid;
        self.DB().query(sql,function(rs){
            callback(rs)
        });
    }
    this.del = function(data,callback){
        let self=this;
        let sql = "delete from ranyun_recivingaddress where id="+data.id+" and memberId="+data.usid;
        self.DB().excute(sql,function(rs){
            callback(rs)
        });
    }

    this.edit = function(data,callback){
        let self=this;
        if(data.def!="1"){
            data.def="0";
        }
        let sql = "update ranyun_recivingaddress set name='"+data.name+"',mobile='"+data.phone+"',preAddress='"+data.pre+"',address='"+data.address+"',def='"+data.def+"' where id="+data.id+" and memberId="+data.usid;
        self.setDef(data.usid,data.def,function(rsa){
            self.DB().excute(sql,function(rs){
                callback(rs)
            });
        });
    }
}
module.exports=addressService;
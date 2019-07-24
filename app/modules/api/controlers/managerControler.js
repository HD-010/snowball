function managerControler() {
    this.goodsnum = function(){
        let self = this;
        let prm = ["usid","suppid"];
        let obj = self.checkParm(prm);
        if (obj.errcode == 1) {
            self.sendJson(1, obj.errlist);
            return;
        }
        let manager = this.service('manager');
        manager.goodsnum(obj.data,function(rs){
            if(rs==false){
                self.sendJson(1,["Fail"]);
            }else{
                self.sendJson(0,rs[0]);
            }
        });
    }
    this.goodslist = function(){
        let self = this;
        let prm = ["usid","suppid","page","flg"];
        let obj = self.checkParm(prm);
        if (obj.errcode == 1) {
            self.sendJson(1, obj.errlist);
            return;
        }
        console.log(obj.data)
        let manager = this.service('manager');
        manager.goodslist(obj.data,function(rs){
            if(rs==false){
                self.sendJson(1,["Fail"]);
            }else{
                self.sendJson(0,rs);
            }
        });
    }
    this.gdsedit=function(){
        let self = this;
        let prm = ["suppid","flg","gid"];
        let obj = self.checkParm(prm);
        if (obj.errcode == 1) {
            self.sendJson(1, obj.errlist);
            return;
        }
        let manager = this.service('manager');
        manager.gdsedit(obj.data,function(rs){
            if(rs==false){
                self.sendJson(1,["Fail"]);
            }else{
                self.sendJson(0,rs);
            }
        });
    }
    this.goodstype = function(){
        let self = this;
        let prm = ["usid","suppid"];
        let obj = self.checkParm(prm);
        if (obj.errcode == 1) {
            self.sendJson(1, obj.errlist);
            return;
        }
        let manager = this.service('manager');
        manager.goodstype(obj.data,function(rs){
            if(rs==false){
                self.sendJson(1,["Fail"]);
            }else{
                self.sendJson(0,rs);
            }
        });
        
    }
    this.addtype = function(){
        let self = this;
        let prm = ["usid","suppid","title"];
        let obj = self.checkParm(prm);
        if (obj.errcode == 1) {
            self.sendJson(1, obj.errlist);
            return;
        }
        let manager = this.service('manager');
        manager.addtype(obj.data,function(rs){
            if(rs==false){
                self.sendJson(1,["Fail"]);
            }else{
                self.sendJson(0,rs);
            }
        });
        
    }
    this.goodsadd = function(){
        let self = this;
        let prm = ["gid","recmd","litpic","!mainpic","title","fee","!detail","tpid","!spec","usid","price","stock","suppid","flg"];
        let obj = self.checkParm(prm);
        console.log(obj)
        if (obj.errcode == 1) {
            self.sendJson(1, obj.errlist);
            return;
        }
        console.log("============================")
        let manager = this.service('manager');
        manager.goodsadd(obj.data,function(rs){
            if(rs==false){
                self.sendJson(1,["Fail"]);
            }else{
                self.sendJson(0,rs);
            }
        });
    }
    this.goodsinfo = function(){
        let self = this;
        let prm = ["gid","suppid"];
        let obj = self.checkParm(prm);
        if (obj.errcode == 1) {
            self.sendJson(1, obj.errlist);
            return;
        }
        let manager = this.service('manager');
        manager.goodsinfo(obj.data,function(rs){
            if(rs==false){
                self.sendJson(1,["Fail"]);
            }else{
                self.sendJson(0,rs);
            }
        });
    }
    this.gdslst = function(){
        let self = this;
        let prm = ["suppliersId"];
        let obj = self.checkParm(prm);
        if (obj.errcode == 1) {
            self.sendJson(1, obj.errlist);
            return;
        }
        let manager = this.service('manager');
        manager.gdslst(obj.data,function(rs){
            if(rs==false){
                self.sendJson(1,["Fail"]);
            }else{
                self.sendJson(0,rs);
            }
        });
    }
    this.iconlist = function(){
        let self = this;
        let sch=this.POST('sch',{default: ""});
        let page=this.POST('page',{default: 1});
        let manager = this.service('manager');
        manager.iconlist({sch:sch,page:page},function(rs){
            if(rs==false){
                self.sendJson(1,["Fail"]);
            }else{
                self.sendJson(0,rs);
            }
        });
    }
    this.order = function(){
        let self = this;
        let prm = ["!state","page","suppid"];
        let obj = self.checkParm(prm);
        if (obj.errcode == 1) {
            self.sendJson(1, obj.errlist);
            return;
        }
        let manager = this.service('manager');
        manager.order(obj.data,function(rs){
            if(rs==false){
                self.sendJson(1,["Fail"]);
            }else{
                self.sendJson(0,rs);
            }
        });
    }
    this.advise = function(){
        let self = this;
        let prm = ["suppid","!detail"];
        let obj = self.checkParm(prm);
        if (obj.errcode == 1) {
            self.sendJson(1, obj.errlist);
            return;
        }
        let manager = this.service('manager');
        manager.advise(obj.data,function(rs){
            if(rs==false){
                self.sendJson(1,["Fail"]);
            }else{
                self.sendJson(0,rs);
            }
        });
    }
    this.typadv = function(){
        let self = this;
        let prm = ["suppid","tid","imgurl"];
        let obj = self.checkParm(prm);
        if (obj.errcode == 1) {
            self.sendJson(1, obj.errlist);
            return;
        }
        let manager = this.service('manager');
        manager.typadv(obj.data,function(rs){
            if(rs==false){
                self.sendJson(1,["Fail"]);
            }else{
                self.sendJson(0,rs);
            }
        });
    }
    this.isbuy = function(){
        let self = this;
        let prm = ["suppid"];
        let obj = self.checkParm(prm);
        if (obj.errcode == 1) {
            self.sendJson(1, obj.errlist);
            return;
        }
        let manager = this.service('manager');
        manager.isbuy(obj.data,function(rs){
            if(rs==false){
                self.sendJson(1,["Fail"]);
            }else{
                if(rs[0].num>0){
                    rs[0].title="染云提示您，您有新的订单，请注意查收!";
                }
                self.sendJson(0,rs[0]);
            }
        });
    }
    this.delbuy = function(){
        let self = this;
        let prm = ["suppid"];
        let obj = self.checkParm(prm);
        if (obj.errcode == 1) {
            self.sendJson(1, obj.errlist);
            return;
        }
        let manager = this.service('manager');
        manager.delbuy(obj.data,function(rs){
            if(rs==false){
                self.sendJson(1,["Fail"]);
            }else{
                self.sendJson(0,rs);
            }
        });
    }
    this.todaycount = function(){
        let self = this;
        let prm = ["suppid"];
        let obj = self.checkParm(prm);
        if (obj.errcode == 1) {
            self.sendJson(1, obj.errlist);
            return;
        }
        let manager = this.service('manager');
        manager.todaycount(obj.data,function(rs){
            if(rs==false){
                self.sendJson(1,["Fail"]);
            }else{
                console.log(rs)
                self.sendJson(0,rs[0]);
            }
        });
    }
    this.monthcount = function(){
        let self = this;
        let prm = ["suppid"];
        let obj = self.checkParm(prm);
        if (obj.errcode == 1) {
            self.sendJson(1, obj.errlist);
            return;
        }
        let manager = this.service('manager');
        manager.monthcount(obj.data,function(rs){
            if(rs==false){
                self.sendJson(1,["Fail"]);
            }else{
                self.sendJson(0,rs[0]);
            }
        });
    }
    this.lastweek = function(){
        let self = this;
        let prm = ["suppid"];
        let obj = self.checkParm(prm);
        if (obj.errcode == 1) {
            self.sendJson(1, obj.errlist);
            return;
        }
        let manager = this.service('manager');
        manager.lastweek(obj.data,function(rs){
            if(rs==false){
                self.sendJson(1,["Fail"]);
            }else{
                self.sendJson(0,rs);
            }
        });
    }
    this.bookcount = function(){
        let self = this;
        let prm = ["suppid","stime","etime"];
        let obj = self.checkParm(prm);
        if (obj.errcode == 1) {
            self.sendJson(1, obj.errlist);
            return;
        }
        let manager = this.service('manager');
        manager.bookcount(obj.data,function(rs){
            if(rs==false){
                self.sendJson(1,["Fail"]);
            }else{
                self.sendJson(0,rs);
            }
        });
    }
    this.bookrecord = function(){
        let self = this;
        let prm = ["suppid","stime","etime","page"];
        let obj = self.checkParm(prm);
        if (obj.errcode == 1) {
            self.sendJson(1, obj.errlist);
            return;
        }
        let manager = this.service('manager');
        manager.bookrecord(obj.data,function(rs){
            if(rs==false){
                self.sendJson(1,["Fail"]);
            }else{
                self.sendJson(0,rs);
            }
        });
    }
    this.certification = function(){
        let self = this;
        let legal = self.POST('legal',{default: ""});
        let lno = self.POST('lno',{default: ""});
        let permitId = self.POST('permitId',{default: ""});
        let permitImg = self.POST('permitImg',{default: ""});
        let prm = ["suppid","name","type","idcard","face","back","limg"];
        let obj = self.checkParm(prm);
        obj.data.legal=legal;
        obj.data.lno=lno;
        obj.data.permitId=permitId;
        obj.data.permitImg=permitImg;
        if(obj.data.type==1){
            if(legal==""){
                obj.errcode = 1;
                obj.errlist.push("legal");
            }
            if(lno==""){
                obj.errcode = 1;
                obj.errlist.push("lno");
            }
            if(permitId==""){
                obj.errcode = 1;
                obj.errlist.push("permitId");
            }
            if(permitImg==""){
                obj.errcode = 1;
                obj.errlist.push("permitImg");
            }
        }else if(obj.data.type==2){
            if(permitId==""){
                obj.errcode = 1;
                obj.errlist.push("permitId");
            }
            if(permitImg==""){
                obj.errcode = 1;
                obj.errlist.push("permitImg");
            }
        }
        if (obj.errcode == 1) {
            self.sendJson(1, obj.errlist);
            return;
        }
        
        let manager = this.service('manager');
        manager.certification(obj.data,function(rs,num){
            if(rs==false){
                self.sendJson(1,["Fail"]);
            }else{
                self.sendJson(0,num);
            }
        });
    }
    this.suppliers = function(){
        let self = this;
        let prm = ["usid"];
        let obj = self.checkParm(prm);
        if (obj.errcode == 1) {
            self.sendJson(1, obj.errlist);
            return;
        }
        let manager = this.service('manager');
        manager.suppliers(obj.data,function(rs){
            if(rs==false){
                self.sendJson(1,["Fail"]);
            }else{
                let obj = rs[0];
                if(obj.agentId==null||obj.agentId=='null'){
                    obj.agentId=0;
                }
                self.sendJson(0,obj);
            }
        });
    }
    this.bank = function(){
        let self = this;
        let prm = ["usid","suppid","name","bankid","bank","phone","code"];
        let obj = self.checkParm(prm);
        if (obj.errcode == 1) {
            self.sendJson(1, obj.errlist);
            return;
        }
        let manager = this.service('manager');
        manager.bank(obj.data,function(rs){
            if(rs==false){
                self.sendJson(1,["Fail"]);
            }else{
                self.sendJson(0,rs);
            }
        });
    }
    this.wxcash = function(){
        let self = this;
        let prm = ["usid","suppid","openid","phone","code","nick"];
        let obj = self.checkParm(prm);
        if (obj.errcode == 1) {
            self.sendJson(1, obj.errlist);
            return;
        }
        let manager = this.service('manager');
        manager.wxcash(obj.data,function(rs){
            if(rs==false){
                self.sendJson(1,["Fail"]);
            }else{
                self.sendJson(0,rs);
            }
        });
    }
    this.bindlist = function(){
        let self = this;
        let prm = ["suppid"];
        let obj = self.checkParm(prm);
        if (obj.errcode == 1) {
            self.sendJson(1, obj.errlist);
            return;
        }
        let manager = this.service('manager');
        manager.bindlist(obj.data,function(rs){
            if(rs==false){
                self.sendJson(1,["Fail"]);
            }else{
                self.sendJson(0,rs);
            }
        });
    }
    this.withdraw = function(){
        let self = this;
        let prm = ["suppid","cash","flg","usid"];
        let obj = self.checkParm(prm);
        if (obj.errcode == 1) {
            self.sendJson(1, obj.errlist);
            return;
        }
        let manager = this.service('manager');
        manager.withdraw(obj.data,function(rs){
            if(rs==false){
                self.sendJson(1,["Fail"]);
            }else{
                self.sendJson(0,rs);
            }
        });
    }
    this.means = function(){
        let self = this;
        let prm = ["suppid","rnd","sign"];
        let obj = self.checkParm(prm);
        if (obj.errcode == 1) {
            self.sendJson(1, obj.errlist);
            return;
        }
        let utility = require('utility');
        let dd = obj.data;
        let vf  = utility.md5(dd.suppid + ""+dd.rnd);
        if(vf!=dd.sign){
            self.sendJson(1,"[shit]");
            return;
        }
        let manager = this.service('manager');
        manager.means(dd,function(rs){
            if(rs==false){
                self.sendJson(1,["Fail"]);
            }else{
                let kk = rs[0];
                console.log(kk)
                self.sendJson(0,{kcash:(kk.yrz-kk.ytx),ycash:kk.yrz,wcash:kk.wrz});
            }
        });
    }
    this.withdrawcash=function(){
        let self = this;
        let prm = ["suppid","rnd","sign"];
        let obj = self.checkParm(prm);
        if (obj.errcode == 1) {
            self.sendJson(1, obj.errlist);
            return;
        }
        let utility = require('utility');
        let dd = obj.data;
        let vf  = utility.md5(dd.suppid + ""+dd.rnd);
        if(vf!=dd.sign){
            self.sendJson(1,"[shit]");
            return;
        }
        let manager = this.service('manager');
        manager.withdrawcash(dd,function(rs){
            if(rs==false){
                self.sendJson(1,["Fail"]);
            }else{
                self.sendJson(0,rs[0]);
            }
        });
    }
    this.withdrawrecord=function(){
        let self = this;
        let prm = ["suppid","page","rnd","sign"];
        let obj = self.checkParm(prm);
        if (obj.errcode == 1) {
            self.sendJson(1, obj.errlist);
            return;
        }
        let utility = require('utility');
        let dd = obj.data;
        let vf  = utility.md5(dd.suppid + ""+dd.page+dd.rnd);
        if(vf!=dd.sign){
            self.sendJson(1,"[shit]");
            return;
        }
        let manager = this.service('manager');
        manager.withdrawrecord(dd,function(rs){
            if(rs==false){
                self.sendJson(1,["Fail"]);
            }else{
                self.sendJson(0,rs);
            }
        });
    }
    this.suppedit=function(){
        let self = this;
        let prm = ["suppid","imgurl"];
        let obj = self.checkParm(prm);
        if (obj.errcode == 1) {
            self.sendJson(1, obj.errlist);
            return;
        }
        let manager = this.service('manager');
        manager.suppedit(obj.data,function(rs){
            if(rs==false){
                self.sendJson(1,["Fail"]);
            }else{
                self.sendJson(0,rs);
            }
        });
    }
}
module.exports = managerControler;
function memberControler(){
    this.info = function(){
        let self=this;
        let prm = ["suppid"];
        let obj = self.checkParm(prm);
        if (obj.errcode == 1) {
            self.sendJson(1, obj.errlist);
            return;
        }
        let member = this.service('member');
        member.info(obj.data,function(rs){
            if(rs==false){
                self.sendJson(1,"[没有数据]");
            }else{
                self.sendJson(0,rs);
            }
        });
    }
    this.edit = function(){
        let self=this;
        let prm = ["suppid", "brand","title","remark","balance","cash","recharge","expire","!ranks"];
        let obj = self.checkParm(prm);
        if (obj.errcode == 1) {
            self.sendJson(1, obj.errlist);
            return;
        }
        let member = this.service('member');
        member.edit(obj.data,function(rs){
            if(rs==false){
                self.sendJson(1,"[没有数据]");
            }else{
                self.sendJson(0,rs);
            }
        });
    }
    this.usmember = function(){
        let self=this;
        let prm = ["suppid", "usid"];
        let obj = self.checkParm(prm);
        if (obj.errcode == 1) {
            self.sendJson(1, obj.errlist);
            return;
        }
        let member = this.service('member');
        member.usmember(obj.data,function(rs){
            if(rs==false){
                self.sendJson(1,"[没有数据]");
            }else{
                self.sendJson(0,rs[0]);
            }
        });
    }
    this.list = function(){
        let self=this;
        let prm = ["suppid","page"];
        let obj = self.checkParm(prm);
        if (obj.errcode == 1) {
            self.sendJson(1, obj.errlist);
            return;
        }
        let member = this.service('member');
        member.list(obj.data,function(rs){
            if(rs==false){
                self.sendJson(1,"[没有数据]");
            }else{
                self.sendJson(0,rs);
            }
        });
    }
    this.list = function(){
        let self=this;
        let prm = ["suppid","page"];
        let obj = self.checkParm(prm);
        if (obj.errcode == 1) {
            self.sendJson(1, obj.errlist);
            return;
        }
        let sch=this.POST('sch',{default: ""});
        obj.data.sch=sch;
        let member = this.service('member');
        member.list(obj.data,function(rs){
            if(rs==false){
                self.sendJson(1,"[没有数据]");
            }else{
                self.sendJson(0,rs);
            }
        });
    }
    this.usinfo = function(){
        let self=this;
        let prm = ["id"];
        let obj = self.checkParm(prm);
        if (obj.errcode == 1) {
            self.sendJson(1, obj.errlist);
            return;
        }
        let member = this.service('member');
        member.usinfo(obj.data,function(rs){
            if(rs==false){
                self.sendJson(1,"[没有数据]");
            }else{
                self.sendJson(0,rs[0]);
            }
        });
    }
    this.hscash = function(){
        let self=this;
        let prm = ["id"];
        let obj = self.checkParm(prm);
        if (obj.errcode == 1) {
            self.sendJson(1, obj.errlist);
            return;
        }
        let member = this.service('member');
        member.hscash(obj.data,function(rs){
            if(rs==false){
                self.sendJson(1,"[没有数据]");
            }else{
                self.sendJson(0,rs[0]);
            }
        });
    }
    this.suppmemday = function(){
        let self=this;
        let prm = ["id"];
        let obj = self.checkParm(prm);
        if (obj.errcode == 1) {
            self.sendJson(1, obj.errlist);
            return;
        }
        let member = this.service('member');
        member.suppmemday(obj.data,function(rs){
            if(rs==false){
                self.sendJson(1,"[没有数据]");
            }else{
                self.sendJson(0,rs);
            }
        });
    }
    this.suppmemrecord = function(){
        let self=this;
        let prm = ["id","page"];
        let obj = self.checkParm(prm);
        if (obj.errcode == 1) {
            self.sendJson(1, obj.errlist);
            return;
        }
        let member = this.service('member');
        member.suppmemrecord(obj.data,function(rs){
            if(rs==false){
                self.sendJson(1,"[没有数据]");
            }else{
                self.sendJson(0,rs);
            }
        });
    }
    this.suppmemlst = function(){
        let self=this;
        let prm = ["suppid"];
        let obj = self.checkParm(prm);
        if (obj.errcode == 1) {
            self.sendJson(1, obj.errlist);
            return;
        }
        let member = this.service('member');
        member.suppmemlst(obj.data,function(rs){
            if(rs==false){
                self.sendJson(1,"[没有数据]");
            }else{
                self.sendJson(0,rs);
            }
        });
    }
}
module.exports=memberControler;
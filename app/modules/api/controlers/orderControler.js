function orderControler(){
    this.tlist = function(){
        let self=this;
        let prm = ["usid", "suppid","page"];
        let obj = self.checkParm(prm);
        if (obj.errcode == 1) {
            self.sendJson(1, obj.errlist);
            return;
        }
        let order = this.service('order');
        order.tlist(obj.data,function(rs){
            if(rs==false){
                self.sendJson(1,"[没有数据]");
            }else{
                self.sendJson(0,rs);
            }
        });
    }
    this.list = function(){
        let self=this;
        let prm = ["usid", "suppid","state","page"];
        let obj = self.checkParm(prm);
        if (obj.errcode == 1) {
            self.sendJson(1, obj.errlist);
            return;
        }
        let order = this.service('order');
        order.list(obj.data,function(rs){
            if(rs==false){
                self.sendJson(1,"[没有数据]");
            }else{
                self.sendJson(0,rs);
            }
        });
    }
    this.del = function(){
        let self=this;
        let prm = ["act","orderid","rnd","sign"];
        let obj = self.checkParm(prm);
        if (obj.errcode == 1) {
            self.sendJson(1, obj.errlist);
            return;
        }
        let utility = require('utility');
        let vf = utility.md5(obj.data.act+obj.data.orderid+obj.data.rnd);
        if(vf!=obj.data.sign){
            self.sendJson(1,"[shit]");
            return;
        }
        let order = this.service('order');
        order.del(obj.data,function(rs){
            if(rs==false){
                self.sendJson(1,"[没有数据]");
            }else{
                self.sendJson(0,rs);
            }
        });
    }
    this.detail = function(){
        let self=this;
        let prm = ["usid","id"];
        let obj = self.checkParm(prm);
        if (obj.errcode == 1) {
            self.sendJson(1, obj.errlist);
            return;
        }
        let order = this.service('order');
        order.detail(obj.data,function(rs){
            if(rs==false){
                self.sendJson(1,"[没有数据]");
            }else{
                self.sendJson(0,rs);
            }
        });
    }
    this.apply = function(){
        let self=this;
        let prm = ["id","usid","type","case","imgurl","remark"];
        let obj = self.checkParm(prm);
        if (obj.errcode == 1) {
            self.sendJson(1, obj.errlist);
            return;
        }
        let order = this.service('order');
        order.apply(obj.data,function(rs){
            if(rs==false){
                self.sendJson(1,"[没有数据]");
            }else{
                self.sendJson(0,rs);
            }
        });
    }
    this.comment = function(){
        let self=this;
        let prm = ["id","usid","score","remark"];
        let obj = self.checkParm(prm);
        if (obj.errcode == 1) {
            self.sendJson(1, obj.errlist);
            return;
        }
        obj.data.imgurl = this.POST('imgurl', { default: '' });
        let order = this.service('order');
        order.comment(obj.data,function(rs){
            if(rs==false){
                self.sendJson(1,"[没有数据]");
            }else{
                self.sendJson(0,rs);
            }
        });
    }
    this.receive = function(){
        let self=this;
        let prm = ["id","usid","rnd","sign"];
        let obj = self.checkParm(prm);
        if (obj.errcode == 1) {
            self.sendJson(1, obj.errlist);
            return;
        }
        let utility = require('utility');
        let vf = utility.md5(obj.data.id+''+obj.data.usid+obj.data.rnd);
        if(vf!=obj.data.sign){
            self.sendJson(1,"[shit]");
            return;
        }
        let order = this.service('order');
        order.receive(obj.data,function(rs){
            if(rs==false){
                self.sendJson(1,"[没有数据]");
            }else{
                self.sendJson(0,rs);
            }
        });
    }
    this.month = function(){
        let self=this;
        let prm = ["suppid","month"];
        let obj = self.checkParm(prm);
        if (obj.errcode == 1) {
            self.sendJson(1, obj.errlist);
            return;
        }
        let order = this.service('order');
        order.month(obj.data,function(rs){
            if(rs==false){
                self.sendJson(1,"[没有数据]");
            }else{
                self.sendJson(0,rs);
            }
        });
    }
    this.sendgoods = function(){
        let self=this;
        let prm = ["orderid","suppid","expno","expname"];
        let obj = self.checkParm(prm);
        if (obj.errcode == 1) {
            self.sendJson(1, obj.errlist);
            return;
        }
        let order = this.service('order');
        order.sendgoods(obj.data,function(rs){
            if(rs==false){
                self.sendJson(1,"[没有数据]");
            }else{
                self.sendJson(0,rs);
            }
        });
    }
    this.ordernum = function(){
        let self=this;
        let prm = ["suppid"];
        let obj = self.checkParm(prm);
        if (obj.errcode == 1) {
            self.sendJson(1, obj.errlist);
            return;
        }
        let order = this.service('order');
        order.ordernum(obj.data,function(rs){
            if(rs==false){
                self.sendJson(1,"[没有数据]");
            }else{
                self.sendJson(0,rs);
            }
        });
    }
}
module.exports=orderControler;
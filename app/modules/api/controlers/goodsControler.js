
function goodsControler() {
    /**
     * 首页推荐商品数据
     */
    this.home = function() {
        let self=this;
        let suppid=this.POST('suppliersId',{default: false});
        if(suppid == false || suppid < 1){
            this.sendJson(1,["suppliersId"]);
            return;
        }
        let goods = this.service('goods');
        goods.home(suppid,function(rs){
            if(rs==false){
                self.sendJson(1,["没有数据"]);
            }else{
                self.sendJson(0,rs);
            }
        });
    };
    this.search = function(){
        let self = this;
        let prm = ["suppid","page"];
        let obj = self.checkParm(prm);
        if (obj.errcode == 1) {
            self.sendJson(1, obj.errlist);
            return;
        }
        let sch=this.POST('sch',{default: ""});
        obj.data.sch=sch;
        let goods = this.service('goods');
        goods.search(obj.data,function(rs){
            if(rs==false){
                self.sendJson(1,["没有数据"]);
            }else{
                self.sendJson(0,rs);
            }
        });
    }
    /**
     * 首页轮播
     */
    this.banner = function(){
        let self=this;
        let suppid=this.POST('suppliersId',{default: false});
        if(suppid == false || suppid < 1){
            this.sendJson(1,["suppliersId"]);
            return;
        }
        let goods = this.service('goods');
        goods.banner(suppid,function(rs){
            if(rs==false){
                self.sendJson(1,["没有数据"]);
            }else{
                self.sendJson(0,rs);
            }
        });
    };
    this.notice = function(){
        let self=this;
        let suppid=this.POST('suppliersId',{default: false});
        if(suppid == false || suppid < 1){
            this.sendJson(1,["suppliersId"]);
            return;
        }
        let goods = this.service('goods');
        goods.notice(suppid,function(rs){
            if(rs==false){
                self.sendJson(1,["没有数据"]);
            }else{
                self.sendJson(0,rs);
            }
        });
    }
    this.advise=function(){
        let self=this;
        let suppid=this.POST('suppliersId',{default: false});
        if(suppid == false || suppid < 1){
            this.sendJson(1,["suppliersId"]);
            return;
        }
        let goods = this.service('goods');
        goods.advise(suppid,function(rs){
            if(rs==false){
                self.sendJson(1,["没有数据"]);
            }else{
                self.sendJson(0,rs);
            }
        });
    }
    this.detail = function(){
        let self=this;
        let gid=this.POST('goodsId',{default: false});
        let usid=this.POST('usid',{default: 0});
        if(gid == false || gid < 1){
            this.sendJson(1,["goodsId"]);
            return;
        }
        let goods = this.service('goods');
        goods.detail(gid,usid,function(rs){
            if(rs==false){
                self.sendJson(1,["没有数据"]);
            }else{
                self.sendJson(0,rs);
            }
        });
    };
    this.hometype = function(){
        let self=this;
        let prm = ["num", "suppliersId"];
        let obj = self.checkParm(prm);
        if (obj.errcode == 1) {
            self.sendJson(1, obj.errlist);
            return;
        }
        let goods = this.service('goods');
        goods.hometype(obj.data.num,obj.data.suppliersId,function(rs){
            if(rs==false){
                self.sendJson(1,["没有数据"]);
            }else{
                self.sendJson(0,rs);
            }
        });
    };
    this.homeicon = function(){
        let self=this;
        let suppid=this.POST('suppliersId',{default: false});
        if(suppid == false || suppid < 1){
            this.sendJson(1,["suppliersId"]);
            return;
        }
        let goods = this.service('goods');
        goods.homeicon(suppid,function(rs){
            if(rs==false){
                self.sendJson(1,["没有数据"]);
            }else{
                self.sendJson(0,rs);
            }
        });
    }
    this.specs = function(){
        let self=this;
        let gid=this.POST('gid',{default: false});
        if(gid == false || gid < 1){
            this.sendJson(1,["gid"]);
            return;
        }
        let goods = this.service('goods');
        goods.specs(gid,function(rs){
            if(rs==false){
                self.sendJson(1,["没有数据"]);
            }else{
                self.sendJson(0,rs);
            }
        });
    }
    this.collect = function(){
        let self=this;
        let prm = ["usid", "gdsid"];
        let obj = self.checkParm(prm);
        if (obj.errcode == 1) {
            self.sendJson(1, obj.errlist);
            return;
        }
        let goods = this.service('goods');
        goods.collect(obj.data,function(rs){
            if(rs==false){
                self.sendJson(1,["失败"]);
            }else{
                self.sendJson(0,rs);
            }
        });
    }
    this.discuss = function(){
        let self=this;
        let prm = ["gdsid","page"];
        let obj = self.checkParm(prm);
        if (obj.errcode == 1) {
            self.sendJson(1, obj.errlist);
            return;
        }
        let goods = this.service('goods');
        goods.discuss(obj.data,function(rs){
            if(rs==false){
                self.sendJson(1,["失败"]);
            }else{
                self.sendJson(0,rs);
            }
        });
    }
    this.category = function(){
        let self=this;
        let prm = ["suppid"];
        let obj = self.checkParm(prm);
        if (obj.errcode == 1) {
            self.sendJson(1, obj.errlist);
            return;
        }
        let goods = this.service('goods');
        goods.category(obj.data,function(rs){
            if(rs==false){
                self.sendJson(1,["失败"]);
            }else{
                self.sendJson(0,rs);
            }
        });
    }
    this.list = function(){
        let self=this;
        let prm = ["typeid","page"];
        let obj = self.checkParm(prm);
        if (obj.errcode == 1) {
            self.sendJson(1, obj.errlist);
            return;
        }
        let goods = this.service('goods');
        goods.list(obj.data,function(rs){
            if(rs==false){
                self.sendJson(1,["失败"]);
            }else{
                self.sendJson(0,rs);
            }
        });
    }
}
module.exports = goodsControler;
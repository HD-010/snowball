function cartControler() {
    this.add = function(){
        let self = this;
        let prm = ["usid","suppid", "!gds"];
        let obj = self.checkParm(prm);
        if (obj.errcode == 1) {
            self.sendJson(1, obj.errlist);
            return;
        }
        let ky = "cart_user_"+obj.data.usid;
        let cart = this.service('cart');
        cart.add(ky,obj.data.suppid,obj.data.gds,function(rs){
            if(rs==false){
                self.sendJson(1,["Fail"]);
            }else{
                self.sendJson(0,["success"]);
            }
        });
    }
    this.del = function(){
        let self = this;
        let prm = ["usid", "!gds"];
        let obj = self.checkParm(prm);
        if (obj.errcode == 1) {
            self.sendJson(1, obj.errlist);
            return;
        }
        console.log(obj.data)
        let ky = "cart_user_"+obj.data.usid;
        let cart = this.service('cart');
        cart.del(ky,obj.data.gds,function(rs){
            if(rs==false){
                self.sendJson(1,["Fail"]);
            }else{
                self.sendJson(0,["success"]);
            }
        });
    }
    this.list = function(){
        let self=this;
        let usid=this.POST('usid',{default: false});
        let suppid=this.POST('suppid',{default: 0});
        if(usid == false || usid < 1){
            self.sendJson(1,["usid"]);
            return;
        }
        let cart = this.service('cart');
        cart.list(usid,suppid,function(rs){
            self.sendJson(0,rs);
        });
    }
    this.confirm = function(){
        let self=this;
        let prm = ["usid","!gdslist"];
        let obj = self.checkParm(prm);
        if (obj.errcode == 1) {
            self.sendJson(1, obj.errlist);
            return;
        }
        let cart = this.service('cart');
        cart.confirm(obj.data,function(rs){
            if(rs==false){
                self.sendJson(1,"[没有数据]");
            }else{
                self.sendJson(0,rs);
            }
            
        })
    }
    this.order = function(){
        let self=this;
        let prm = ["usid","dzid","!gds","!cpn","!addon"];
        let obj = self.checkParm(prm);
        if (obj.errcode == 1) {
            self.sendJson(1, obj.errlist);
            return;
        }
        let cart = this.service('cart');
        console.log(obj.data)
        cart.order(obj.data,function(rs){
            if(rs==false){
                self.sendJson(1,"[创建订单失败]");
            }else{
                self.sendJson(0,rs);
            }
        })
    }
}
module.exports = cartControler;
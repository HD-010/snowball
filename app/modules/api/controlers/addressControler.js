function addressControler(){
    this.add = function(){
        let self=this;
        let prm = ["usid", "name","phone","pre","address","def"];
        let obj = self.checkParm(prm);
        if (obj.errcode == 1) {
            self.sendJson(1, obj.errlist);
            return;
        }
        let address = this.service('address');
        address.add(obj.data,function(rs){
            if(rs==false){
                self.sendJson(1,"[失败]");
            }else{
                self.sendJson(0,rs);
            }
        });
    }
    this.list = function(){
        let self=this;
        let usid=this.POST('usid',{default: false});
        if(usid == false || usid < 1){
            self.sendJson(1,["usid"]);
            return;
        }
        let address = this.service('address');
        address.list(usid,function(rs){
            if(rs==false){
                self.sendJson(1,"[失败]");
            }else{
                self.sendJson(0,rs);
            }
        });
    }
    this.del = function(){
        let self=this;
        let prm = ["usid", "id"];
        let obj = self.checkParm(prm);
        if (obj.errcode == 1) {
            self.sendJson(1, obj.errlist);
            return;
        }
        let address = this.service('address');
        address.del(obj.data,function(rs){
            if(rs==false){
                self.sendJson(1,"[失败]");
            }else{
                self.sendJson(0,rs);
            }
        });
    }
    this.edit = function(){
        let self=this;
        let prm = ["id","usid", "name","phone","pre","address","def"];
        let obj = self.checkParm(prm);
        if (obj.errcode == 1) {
            self.sendJson(1, obj.errlist);
            return;
        }
        let address = this.service('address');
        address.edit(obj.data,function(rs){
            if(rs==false){
                self.sendJson(1,"[失败]");
            }else{
                self.sendJson(0,rs);
            }
        });
    }
}
module.exports=addressControler;
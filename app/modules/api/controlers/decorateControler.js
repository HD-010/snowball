
function decorateControler(){
    this.banner = function(){
        let self=this;
        let prm = ["usid", "suppid","!detail"];
        let obj = self.checkParm(prm);
        if (obj.errcode == 1) {
            self.sendJson(1, obj.errlist);
            return;
        }
        let decorate = this.service('decorate');
        console.log(obj.data)
        decorate.banner(obj.data,function(rs){
            if(rs==false){
                self.sendJson(1,["失败"]);
            }else{
                self.sendJson(0,rs);
            }
        });
    }
    this.homeicon = function(){
        let self=this;
        let prm = ["usid", "suppid", "id","title","imgurl","openType","jumpParm","linkUrl","linkType"];
        let obj = self.checkParm(prm);
        if (obj.errcode == 1) {
            self.sendJson(1, obj.errlist);
            return;
        }
        let decorate = this.service('decorate');
        console.log(obj.data)
        decorate.homeicon(obj.data,function(rs){
            if(rs==false){
                self.sendJson(1,["失败"]);
            }else{
                self.sendJson(0,rs);
            }
        });
    }
    this.notice = function(){
        let self=this;
        let prm = ["usid", "suppid", "id","title","openType","jumpParm","linkUrl","linkType"];
        let obj = self.checkParm(prm);
        console.log(obj.data)
        if (obj.errcode == 1) {
            self.sendJson(1, obj.errlist);
            return;
        }
        let decorate = this.service('decorate');
        console.log(obj.data)
        decorate.notice(obj.data,function(rs){
            if(rs==false){
                self.sendJson(1,["失败"]);
            }else{
                self.sendJson(0,rs);
            }
        });
    }
}
module.exports = decorateControler;
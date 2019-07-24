function templetControler() {
    /**
     * 用户登录，act=pwd手机号密码，act=code验证码
     */
    this.industry = function() {
        let self=this;
        let templet = this.service('templet');
        templet.industry(function(rs){
            if(rs==false){
                self.sendJson(1,"没有数据");
            }else{
                self.sendJson(0,rs);
            }
        });
    };
    this.list = function() {
        let self=this;
        let id = this.POST('id',{default: false});
        if(id == false || id < 1){
            this.sendJson(1,"模板ID错误");
            return;
        }
        let templet = this.service('templet');
        templet.list(id,function(rs){
            if(rs==false){
                self.sendJson(1,"没有数据");
            }else{
                self.sendJson(0,rs);
            }
        })
    }
}
module.exports = templetControler;
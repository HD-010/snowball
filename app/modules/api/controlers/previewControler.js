function previewControler(){
    this.banner = function(){
        let self = this;
        let prm = ["suppliersId"];
        let obj = self.checkParm(prm);
        if (obj.errcode == 1) {
            self.sendJson(1, obj.errlist);
            return;
        }
        let prvw = this.service('preview');
        prvw.banner(obj.data,function (rs) {
            if (rs == false) {
                self.sendJson(1, "没有数据");
            } else {
                self.sendJson(0, rs);
            }
        })
    }
    this.homeicon = function(){
        let self = this;
        let prm = ["suppliersId"];
        let obj = self.checkParm(prm);
        if (obj.errcode == 1) {
            self.sendJson(1, obj.errlist);
            return;
        }
        let prvw = this.service('preview');
        prvw.homeicon(obj.data,function (rs) {
            if (rs == false) {
                self.sendJson(1, "没有数据");
            } else {
                self.sendJson(0, rs);
            }
        })
    }
    this.notice = function(){
        let self = this;
        let prm = ["suppliersId"];
        let obj = self.checkParm(prm);
        if (obj.errcode == 1) {
            self.sendJson(1, obj.errlist);
            return;
        }
        let prvw = this.service('preview');
        prvw.notice(obj.data,function (rs) {
            if (rs == false) {
                self.sendJson(1, "没有数据");
            } else {
                self.sendJson(0, rs);
            }
        })
    }
    this.advise = function(){
        let self = this;
        let prm = ["suppliersId"];
        let obj = self.checkParm(prm);
        if (obj.errcode == 1) {
            self.sendJson(1, obj.errlist);
            return;
        }
        let prvw = this.service('preview');
        prvw.advise(obj.data,function (rs) {
            if (rs == false) {
                self.sendJson(1, "没有数据");
            } else {
                self.sendJson(0, rs);
            }
        })
    }
    this.home = function(){
        let self = this;
        let prm = ["suppliersId"];
        let obj = self.checkParm(prm);
        if (obj.errcode == 1) {
            self.sendJson(1, obj.errlist);
            return;
        }
        let prvw = this.service('preview');
        prvw.home(obj.data,function (rs) {
            if (rs == false) {
                self.sendJson(1, "没有数据");
            } else {
                self.sendJson(0, rs);
            }
        })
    }
    this.detail = function(){
        let self = this;
        let prm = ["gid"];
        let obj = self.checkParm(prm);
        if (obj.errcode == 1) {
            self.sendJson(1, obj.errlist);
            return;
        }
        let prvw = this.service('preview');
        prvw.detail(obj.data,function (rs) {
            if (rs == false) {
                self.sendJson(1, "没有数据");
            } else {
                self.sendJson(0, rs);
            }
        })
    }
    this.hometype = function(){
        let self = this;
        let prm = ["suppliersId","num"];
        let obj = self.checkParm(prm);
        if (obj.errcode == 1) {
            self.sendJson(1, obj.errlist);
            return;
        }
        let prvw = this.service('preview');
        prvw.hometype(obj.data,function (rs) {
            if (rs == false) {
                self.sendJson(1, "没有数据");
            } else {
                self.sendJson(0, rs);
            }
        })
    }
}
module.exports=previewControler;
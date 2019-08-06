function userControler() {
    var that = this;

    /**
     * 添加用户地址
     */
    that.addaddress = function(){
        let prm = ["type","mainid","provinceid","cityid","countyid","detail","default","realname","tel"];
        let obj = that.checkParm(prm);
        if (obj.errcode == 1) {
            console.log(obj);
            that.sendJson(1, obj.errlist);
            return;
        }
        let user = that.model('User');
        user.addaddress(function(errorcode,results){
            return that.sendJson(errorcode, results);
            
        })
    }

    /**
     * 查询用户地址
     */
    that.address = function(){
        let prm = ["type","mainid"];
        let obj = that.checkParm(prm);
        if (obj.errcode == 1) {
            that.sendJson(1, obj.errlist);
            return;
        }
        let user = that.model('User');
        user.address(function(errocode,results){
            if(errocode) return that.sendJson(errocode,results);
            //要返回的字段
            let fieldarr = [];
            //重新组装数据   为true 代表多个对象返回，为false 代表是一个对象返回,说面渲染页面不需要循环
            results = getNewData(results,fieldarr);
            if(results){
                return that.sendJson(errocode,results)
            }                
        })
    }

    /**
     * 根据地址id查询地址
     */
    that.addressbyid = function(){
        let prm = ['id','userid'];
        let obj  = that.checkParm(prm);
        if(obj.errcode == 1){
          return that.sendJson(1,obj.errlist);
        } 
        let user = that.model('User');
        user.addressbyid(function(errocode,results){
            if(errocode) return that.sendJson(errocode,results);
            //要返回的字段
            let fieldarr = [];
            //重新组装数据   为true 代表多个对象返回，为false 代表是一个对象返回,说面渲染页面不需要循环
            results = getNewData(results,fieldarr,false);
            if(results){
                return that.sendJson(errocode,results[0])
            }            
        });
    }


    /**
     * 根据id修改地址
     */
    that.uptadeaddress = function(){
        let prm = ["id","type","mainid","provinceid","cityid","countyid","detail","default","realname","tel"];
        let obj  = that.checkParm(prm);
        if(obj.errcode == 1){
          return that.sendJson(1,obj.errlist);
        } 
        let user = that.model('User');
        user.uptadeaddress(function(errocode,results){
            return that.sendJson(errocode,results);
        });
    }

    /**
     * 根据地址id删除地址
     */
    that.deladdress = function(){
        let prm = ["id"];
        let obj  = that.checkParm(prm);
        if(obj.errcode == 1){
          return that.sendJson(1,obj.errlist);
        } 
        let user = that.model('User');
        user.deladdress(function(errocode,results){
            return that.sendJson(errocode,results);
        });
    }



























    /**
     * 用户注册
     */
    this.reg = function(){
        console.log("1234645");
        let self = this;
        //act=开放平台(wxkf),微信小程序(wxxcx),微信公众号(wxgzh),无授权数据(cnn)
        let prm = ["act","phone","pwd","code"];
        let obj = self.checkParm(prm);
        if (obj.errcode == 1) {
            console.log(obj);
            self.sendJson(1, obj.errlist);
            return;
        }
        obj.data.unionid = this.POST('unionid', { default: '' });
        obj.data.openid = this.POST('openid', { default: '' });
        obj.data.sex = this.POST('sex', { default: 0 });
        obj.data.face = this.POST('face', { default: '' });
        obj.data.nick = this.POST('nick', { default: '' });
        let user = this.service('user');
        user.reg(obj.data,function (rs,flg) {
            if (rs == false) {
                if(flg==1){
                    self.sendJson(1, "账号已存在请直接登录！");
                }else{
                    self.sendJson(1, "没有数据");
                }
            } else {
                self.sendJson(0, rs);
            }
        });
    }
    this.loginother = function(){
        let self = this;
        let prm = ["openid","act"];
        let obj = self.checkParm(prm);
        if (obj.errcode == 1) {
            self.sendJson(1, obj.errlist);
            return;
        }
        let suppid = this.POST('suppid', { default: 0 });
        obj.data.suppid = suppid;
        let user = this.service('user');
        user.loginother(obj.data,function (rs) {
            if (rs == false) {
                self.sendJson(1, "没有数据");
            } else {
                self.sendJson(0, rs);
            }
        })
    }
    /**
     * 用户登录，act=pwd手机号密码，act=code验证码
     */
    this.login = function () {
        let self = this;
        let act = this.POST('act', { default: false });
        if (act == false || act == "") {
            this.sendJson(1, "请选择登录方式");
            return;
        }
        let phone = this.POST('phone', { default: false });
        if (phone == false || phone.length != 11) {
            this.sendJson(1, "请填写正确的电话号码");
            return;
        }
        let pwd = this.POST('pwd', { default: false });
        if (pwd == false || pwd == "") {
            this.sendJson(1, "密码错误");
            return;
        }
        let suppid = this.POST('suppid', { default: 0 });
        if (act == "pwd" || act == "code") {
            let user = this.service('user');
            user.login(phone, pwd, act,suppid, function (rs) {
                if (rs == false) {
                    self.sendJson(1, "没有数据");
                } else {
                    self.sendJson(0, rs);
                }
            })
        } else {
            this.sendJson(1, "登录方式不正确");
        }
    }
    this.code = function(){
        let self = this;
        let prm = ["phone"];
        let obj = self.checkParm(prm);
        console.log(JSON.stringify(obj))
        if (obj.errcode == 1) {
            self.sendJson(1, obj.errlist);
            return;
        }
        let user = this.service('user');
        user.code(obj.data,function (rs) {
            if (rs == false) {
                self.sendJson(1, "没有数据");
            } else {
                self.sendJson(0, rs);
            }
        })
    }
    this.apply = function () {
        let self = this;
        let prm = ["memberId","name", "preAddress", "address", "realName", "idcard", "templateId"];
        let obj = self.checkParm(prm);
        if (obj.errcode == 1) {
            self.sendJson(1, obj.errlist);
            return;
        }
        let date=new Date();
        obj.data.addTime=date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate()+" "+date.getHours()+":"+date.getMinutes()+":"+date.getSeconds();
        let struct = [obj.data];
        //初始化构造查询对象
        let sqlStruct = this.SqlStruct(struct);
        let user = this.service('user');
        user.apply(sqlStruct,obj.data.memberId,function (rs) {
            if (rs == false) {
                self.sendJson(1, "没有数据");
            } else {
                self.sendJson(0, rs);
            }
        })
    }
    this.collect=function(){
        let self = this;
        let usid = this.POST('usid', { default: false });
        let suppid = this.POST('suppid', { default: 0 });
        let page = this.POST('page', { default: 1 });
        if (usid == false || usid<1) {
            this.sendJson(1, "[usid]");
            return;
        }
        let user = this.service('user');
        user.collect(usid,suppid,page,function (rs) {
            if (rs == false) {
                self.sendJson(1, "[没有数据]");
            } else {
                self.sendJson(0, rs);
            }
        })
    }
    this.coupon=function(){
        let self = this;
        let prm = ["usid", "suppid"];
        let obj = self.checkParm(prm);
        if (obj.errcode == 1) {
            self.sendJson(1, obj.errlist);
            return;
        }
        let user = this.service('user');
        user.coupon(obj.data,function (rs) {
            if (rs == false) {
                self.sendJson(1, "[没有数据]");
            } else {
                self.sendJson(0, rs);
            }
        })
    }
    this.info = function(){
        let self = this;
        let prm = ["usid"];
        let obj = self.checkParm(prm);
        if (obj.errcode == 1) {
            self.sendJson(1, obj.errlist);
            return;
        }
        let user = this.service('user');
        user.info(obj.data,function (rs) {
            if (rs == false) {
                self.sendJson(1, "[没有数据]");
            } else {
                self.sendJson(0, rs);
            }
        })
    }
    this.addnotice = function(){
        let self = this;
        let prm = ["type","content","stype","rtype","sender","recipient"];
        let obj = self.checkParm(prm);
        if (obj.errcode == 1) {
            self.sendJson(1, obj.errlist);
            return;
        }
        let user = this.service('user');
        user.addnotice(obj.data,function (rs) {
            if (rs == false) {
                self.sendJson(1, "[没有数据]");
            } else {
                self.sendJson(0, rs);
            }
        });
    }
    this.notice = function(){
        let self = this;
        let prm = ["rtype","recipient","page","type"];
        let obj = self.checkParm(prm);
        if (obj.errcode == 1) {
            self.sendJson(1, obj.errlist);
            return;
        }
        let user = this.service('user');
        user.notice(obj.data,function (rs) {
            if (rs == false) {
                self.sendJson(1, "[没有数据]");
            } else {
                self.sendJson(0, rs);
            }
        });
    }
    this.edit = function(){
        let self = this;
        let prm = ["imgurl","usid"];
        let obj = self.checkParm(prm);
        if (obj.errcode == 1) {
            self.sendJson(1, obj.errlist);
            return;
        }
        obj.data.nick = this.POST('nick', { default: '' });
        let user = this.service('user');
        user.edit(obj.data,function (rs) {
            if (rs == false) {
                self.sendJson(1, "[没有数据]");
            } else {
                self.sendJson(0, rs);
            }
        });
    }
}
module.exports = userControler;
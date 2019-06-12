/**
 * 用户身份验证接口
 */
function signControler(){
    var that = this;

    /**
     * 用户登录接口
     * 参数：
     * email,password
     * 测试参数：1@qq.com,1
     * 请求地址：/passport/sign/_in
     */
    this._in = function(){
        //查询用户信息
        var dataProcess = this.model("DataProcess");
        var userInfor = this.model('UserInfor');
        userInfor.infors({}, function(res) {
            if (res.error) return that.render(res.data,true);
            var infors = res.data[0];
            
            //校验密码
            if (res.data.length === 0) {
                return that.render({
                    error: 1,
                    message: "登录的帐户不存在！"
                });
            }
            res = dataProcess.loginValid(res.data);
            delete infors.password;
            res.infors = infors;
            //获取openID
            res.openID = createOpenID(that.req,infors);
            //读取用户权限列表
            userInfor.getPermit({uid:infors.id},function(res1){
                var results = mergeObj([res,res1]);
                return that.render(results,true);
            });

        });
    }

    /**
     * 用户注册接口
     * 参数：
     * email，uname，password
     * 请求地址：/passport/sign/_up
     */
    this._up = function(){
        var userInfor = this.model('UserInfor');
        userInfor.acountExists({}, function(res) {
            if (res.error === 1) {
                that.render(res,true);
                return;
            }
            userInfor.insertRegInfo({}, function(res) {
                that.render(res,true);
            });
        });
    }

    /**
     * 系统-忘记密码fg:forget
     */
    this._fg = function(){
        this.renderJson({error:0,message:'修改成功！',uri:""});
    }

    /**
     * 系统-修改用户资料（upProfiles）
     */
    this._upp = function(){
        this.renderJson({error:0,message:'修改成功！',uri:""});
    }

    /**
     * 系统-修改密码（modifyPasswword)
     */
    this._mp = function(){
        this.renderJson({error:0,message:'修改成功！',uri:""});
    }

    /**
     * 退出登录接口
     */
    this._exit = function(){
        this.model("UserInfor").clear(function(res) {
            if (!res.error) return that.render(res,true);
            return that.render({error:1,message:'系统错误，没有成功退出！'},true);
        });
    }


}


module.exports = signControler;
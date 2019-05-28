/**
 * 该模型专注于数据处理
 *  请将数据处理的代码写在该模型
 */
function DataProcessModel() {
        /**
     * 验证用户登录密码是否合法
     */
    this.loginValid = function(data) {
        var inputPass = this.createPasswd(data);
        if (inputPass === data[0].password) {
            //保存用户登录信息到session
            this.setUserInfo(data);
            return {
                error  : 0,
                message: '登录成功，正在跳转...',
                uri    : '/admin/index/index'
            }
        } else {
            return {
                error  : 1,
                message: '帐号或者用户名错误！',
            }
        }
    }

    /**
     *  密码生成器
     */
    this.createPasswd = function(params) {
        var d       = new Date();
        var timeStr = Date.parse(d);
        var mask    = (params && typeof params === 'object') ?
            (new Date(params[0].addTime)).valueOf(): 
            timeStr + '';
        var utility = require('utility');
        var passwd  = utility.md5(this.POST('!password') + mask);
        if (!params) {
            return {
                password: passwd,
                time    : d.toLocaleDateString() + ' ' + d.getHours() + ":" + d.getMinutes() + ":" + d.getSeconds()
            }
        }

        return passwd;
    }


    /**
     * 记录用户登录状态
     * data 要求是对象
     * tag 是存为session的key前缀，用大写标识
     * 如果不写tag,默认是'U'(该前缀值对应的是用户登录成功时写入的用户基本信息),
     * uid 如果uid不为假，则用户信息的存储参考为uid,否则为sessionID
     */
    this.setUserInfo = function(data, tag, uid) {
        tag = (typeof tag === 'string') ? tag : 'U';
        uid = (typeof uid === 'number') ? uid : this.sessionID();
        let jsonStr = data;
        try{
            jsonStr = JSON.stringify(data);
        }catch(err){};
        this.session()[tag + '_' + uid] = jsonStr;
    }

    /**
     * 返回用户登录状态
     * 如果没有找到当前访问都信息，则返回false
     * tag 是存为session的key前缀，用大写标识
     * 如果不写tag,默认是'U'(该前缀值对应的是用户登录成功时写入的用户基本信息),
     * uid 如果uid不为假，则用户信息的存储参考为uid,否则为sessionID
     */
    this.getUserInfo = function(tag,uid) {
        uid = (typeof uid === 'number') ? uid : this.sessionID();
        tag = (typeof tag === 'string') ? tag : 'U';
        let sessinon = this.session()
        let str = sessinon[tag + '_' + uid] || false;
        try{
            str = JSON.parse(str);
        }catch(err){};
        
        return str;
    }

    /**
     * 获取被受权菜单id
     */
    this.getAuthoritiedMenuId = function() {
        let authorites = this.getUseInfo('AU');
        let menuid     = queryresultKeyValue(authorites, 'menuId');
        return menuid;
    }

    this.clearUserInfo = function(){
        this.session()['U_' + this.sessionID()] = null;
    }

    /**
     * 
     * @param {获取url参数} name 
     */
    this.getQueryString = function(href,name) { 
        let reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i"); 
        let r = href.substr(href.indexOf("?") + 1).match(reg); 
        if (r != null) return unescape(r[2]); 
        return null; 
    }

    /**
     * 判断用户是否已经登录
     */
    this.isSign = function(){
        return this.getUseInfo() ? true : false;
    }

    /**
     * 获取登录前访问的页面地址
     */
    this.beforLogin = function(){
        return this.getUseInfo('referer') || '/h5/shop/home';
    }
    
}

module.exports = DataProcessModel;
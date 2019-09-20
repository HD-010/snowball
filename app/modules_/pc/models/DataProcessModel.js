/**
 * 该模型专注于数据处理
 *  请将数据处理的代码写在该模型
 */
function DataProcessModel() {
    /**
     * 记录用户登录状态
     * data 要求是对象
     * tag 是存为session的key前缀，用大写标识
     * common 如果为真，则设置为公共的，否则是会话私有的。默认为false
     * 如果不写tag,默认是'U'(该前缀值对应的是用户登录成功时写入的用户基本信息),
     */
    this.setUserInfo = function(data, tag, common) {
        tag = tag || 'U';
        common = common || false;
        let jsonStr = data;
        try{
            jsonStr = JSON.stringify(data);
        }catch(err){};
        let tagSub = (!common) ? '_' + this.sessionID() : "";
        this.session()[tag + tagSub] = jsonStr;
    }

    /**
     * 返回用户登录状态
     * 如果没有找到当前访问都信息，则返回false
     * tag 是存为session的key前缀，用大写标识
     * common 如果为真，则设置为公共的，否则是会话私有的。默认为false
     * 如果不写tag,默认是'U'(该前缀值对应的是用户登录成功时写入的用户基本信息),
     */
    this.getUserInfo = function(tag,common) {
        tag = tag || 'U';
        common = common || false;
        let sessinon = this.session();
        let tagSub = (!common) ? '_' + this.sessionID() : "";
        let str = sessinon[tag + tagSub] || false;
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
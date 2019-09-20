/**
 * 该模型专注于数据处理
 *  请将数据处理的代码写在该模型
 */
function DataProcessModel() {
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
                time    : d.getFullYear() + '/'+ (d.getMonth()+1) + '/' + d.getDate() + ' ' + d.getHours() + ":" + d.getMinutes() + ":" + d.getSeconds()
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
     * 记录用户组信息
     * data 要求是对象
     * tag 是存为session的key前缀，用大写标识
     * 如果不写tag,默认是'G',
     */
    this.setGroupInfo = function(data, groupId,tag) {
        tag = tag || 'G';
        if (Object.keys(data).length > 0) {
            this.session()[tag + '_' + groupId] = JSON.stringify(data);
            return true;
        }
        return false;
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
     * 返回用户组信息
     * 如果没有找到当前访问都信息，则返回false
     * tag 是存为session的key前缀，用大写标识
     * 如果不写tag,默认是'G',
     */
    this.getGroupInfo = function(groupId,tag) {
        var sessinon = this.session()
            tag      = tag || 'G';
        var str      = sessinon[tag + '_' + groupId];
        var jsonObj;
        try{
            jsonObj = JSON.parse(str);
        }catch(e){}

        return jsonObj || false;
    }


    /**
     * 获取被受权菜单id
     */
    this.getAuthoritiedMenuId = function() {
        var authorites = this.getUseInfo('AU');
        var menuid     = queryresultKeyValue(authorites, 'menuId');
        return menuid;
    }

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
     * 组织三级菜单
     * results, 查询数据表得到的结果
     */
    this.structMenu = function(results){
        var menus = [];
        var pid;
        if(results.length){
            //找出项级菜单
            for(var i = 0; i < results.length; i ++){
                if(pid === undefined) pid = results[i].pid;
                if(results[i].pid === pid){
                    menus.push(results[i]);
                    delete results[i];
                }
            }
            //组装二级菜单
            for(var i in menus){
                var   menuid       = menus[i].id;
                menus[i].childrens = [];
                for(var j in results){
                    if(results[j].pid === menuid){
                        //组装三级菜单
                        var     thId         = results[j].id;
                        results[j].childrens = [];
                        for(var k in results){
                            if(results[k].pid === thId){
                                results[j].childrens.push(results[k]);
                                delete results[k];
                            }
                        }
                        menus[i].childrens.push(results[j]);
                        delete results[j];
                    }
                }
            }
        }
        return menus;
    }

    /**
     * 生成日期时间轴
     */
    this.dateAxis = function(start,leng){
        var date = (new Date(start)).valueOf();
        var axis = [];
        for(var i = 0; i < leng; i ++){
            date -=  3600 * 24 *1000;
            var dateStr = getStandardDate(date);
            axis.push(dateStr.substr(0,dateStr.indexOf(' ')));
        }
        return axis;
    }

    /**
     * 生成周时间轴
     */
    this.weekAxis = function(start,leng){
        var axis = [];
        for(var i = 0; i < leng; i ++){
            var dateStr = start - i;
            if(dateStr < 1) dateStr += 53;
            axis.push(dateStr);
        }
        return axis;
    }

    /**
     * 生成周时间轴
     */
    this.monthAxis = function(start,leng){
        var axis = [];
        for(var i = 0; i < leng; i ++){
            var dateStr = start - i;
            if(dateStr < 1) dateStr += 12;
            axis.push(dateStr);
        }
        return axis;
    }

    /**
     * 当前登录的用户id
     */
    this.uid = function(){
        var openID = this.POST('oid') || this.GET('oid') || "";
        return parseInt(parseOpenID(openID).id)
    }
}

module.exports = DataProcessModel;
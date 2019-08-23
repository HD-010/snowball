/*
 * @Description: In User Settings Edit
 * @Author: your name
 * @Date: 2019-05-27 11:31:33
 * @LastEditTime: 2019-08-23 15:57:55
 * @LastEditors: Please set LastEditors
 */
function indexControler(){
    var that = this;
    this.index = function(){
        // var userInfor = {
        //     loginTime:'2019/05/27 17:50:00',
        //     uid : 124898
        // };
        
        //var openID = createOpenID(this.req,userInfor);
       
        // log(parseOpenID(openID))
        var referer = this.req.headers.referer || this.req.headers.refererd;
        
        return that.renderLayer({});
    }
}

module.exports = indexControler;
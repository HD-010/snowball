/*
 * @Description: In User Settings Edit
 * @Author: your name
 * @Date: 2019-05-27 11:31:33
 * @LastEditTime: 2019-08-22 10:55:02
 * @LastEditors: Please set LastEditors
 */
function indexControler(){
    var that = this;
    this.index = function(){
        // var userInfor = {
        //     loginTime:'2019/05/27 17:50:00',
        //     uid : 124898
        // };
        
        // var openID = createOpenID(this.req,userInfor);
       
        // log(parseOpenID(openID))
        var referer = this.req.headers.referer || this.req.headers.refererd;
        referer == 'http://127.0.0.1:3005/admin/sign/_in' ? 
        that.renderLayer({}) : 
        that.render({});
    }
}

module.exports = indexControler;
/*
 * @Description: In User Settings Edit
 * @Author: your name
 * @Date: 2019-05-27 11:31:33
 * @LastEditTime: 2019-08-23 15:57:55
 * @LastEditors: Please set LastEditors
 */
function indexControler(){
    var that = this;
    this.index = async function(){
        var data =  {error: 0};
        // var userInfor = {
        //     loginTime:'2019/05/27 17:50:00',
        //     uid : 124898
        // };
        
        //var openID = createOpenID(this.req,userInfor);
        // log(parseOpenID(openID))
        if(that.GET('lay') == 'no') return that.render({});
        data.sysOptions = await that.DB("Redis").syncGet("SYS_OPTIONS");
        data.sysOptions = recodeJsonParse(data.sysOptions.results);
        data.sysBasic = array2value(data.sysOptions, 'tagname', 'SYS_BASIC','key1');
        return that.renderLayer(data);
    }
}

module.exports = indexControler;
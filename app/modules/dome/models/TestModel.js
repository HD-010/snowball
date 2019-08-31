/*
 * @Description: In User Settings Edit
 * @Author: your name
 * @Date: 2019-05-27 09:47:19
 * @LastEditTime: 2019-08-31 09:29:26
 * @LastEditors: Please set LastEditors
 */
function TestModel() {
    this.attr = "attr in model Test";
    this.showApp = function(data,callback){
        //使用案例：实例化TestService并调用showApp()方法
        var service = this.service('Test');
        service.showApp(data,function(error, results, fields){
            callback(error, results, fields);
        });
        
    }

    
    this.testSql = async function(){
        var sql = "select * from youbang_addonadv";
        var res = await this.DB().syncQuery(sql);
        return res;
    }
    this.testSql2 = async function(){
        var sql = "select * from youbang_arcatt";
        var res = await this.DB().syncQuery(sql);
        return res;
    }
}

module.exports = TestModel;
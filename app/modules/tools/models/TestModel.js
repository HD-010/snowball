/*
 * @Description: In User Settings Edit
 * @Author: your name
 * @Date: 2019-05-27 09:47:19
 * @LastEditTime: 2019-08-31 09:04:44
 * @LastEditors: Please set LastEditors
 */
function TestModel(){
    this.showApp = function(data,callback){
        //callback = callback || function(){};
        //使用案例：实例化TestService并调用showApp()方法
        var service = this.service('Test');
        
        service.showApp(data,function(res){
            callback(res);

        });
        
    }

}

module.exports = TestModel;
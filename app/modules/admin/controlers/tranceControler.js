/*
 * @Description: In User Settings Edit
 * @Author: your name
 * @Date: 2019-08-16 15:28:18
 * @LastEditTime: 2019-08-27 14:47:49
 * @LastEditors: Please set LastEditors
 */
function tranceControler(){
    var that = this;
    /**
     * 保存数据
     */
    this.set = function(){
        var trance = that.model("Trance");
        trance.set({}, function(res){
            that.renderJson(res);
        });
    }

    /**
     * 检测字段有没有值
     */
    this.valExists = function(){
        var trance = that.model("Trance");
        trance.valExists({}, function(res){
            that.renderJson(res);
        })
    }
	
}

module.exports = tranceControler;
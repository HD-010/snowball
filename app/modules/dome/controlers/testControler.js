/*
 * @Description: In User Settings Edit
 * @Author: your name
 * @Date: 2019-05-27 09:47:19
 * @LastEditTime: 2019-08-31 16:40:52
 * @LastEditors: Please set LastEditors
 */
function testControler(){
    var that = this;
    this.test = function(){
        let that = this;
        this.model("Test").showApp({},function(error,results,fields){
            that.renderJson(results);
        });
    }

    this.viewRequire = function(){
        this.render();
    }

    /**
     * 测试mysql数据库同步查询
     */
    this.testSql = async function(){
        var res1 = await this.model("Test").testSql();
        //log("---------------------------res1-----------------------", res1);
        var res2 = await this.model("Test").testSql2();
        //log("---------------------------res2-----------------------", res2);
        //log("---------------------------resInfo-----------------------");

        that.render({res1: res1, res2: res2})
    }
}

module.exports = testControler;
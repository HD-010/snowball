function testControler(){
    this.test = function(){
        let that = this;
        this.model(":Test").showApp({},function(error,results,fields){
            that.renderJson(results);
        });
    }
}

module.exports = testControler;
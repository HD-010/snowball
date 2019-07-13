function testControler(){
    this.test = function(){
        let that = this;
        this.model("Test").showApp({},function(error,results,fields){
            that.renderJson(results);
        });
    }

    this.viewRequire = function(){
        this.render();
    }
}

module.exports = testControler;
function testControler(){
    this.ab = function(){
        this.model("Test").showApp({},function(res){
            console.log(res);
        })
        this.render();
    }


}

module.exports = testControler;
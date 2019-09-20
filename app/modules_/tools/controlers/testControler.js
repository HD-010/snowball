function testControler(){
	var that = this;
    this.ab = function(){
        this.model("Test").showApp({},function(res){
            console.log(res);
			that.renderJson({error:0, data:res})
        })
        //this.render();
    }


}

module.exports = testControler;
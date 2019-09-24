function wsControler(){
	
	this.t1 = function(){
		console.log("00000000000000000000000000000000000000000");
		//console.log(this.res)
		this.renderJson(this.req.body)
	}
}

module.exports = wsControler;
function BehaviorModel(){
	this.ruler = {
		'/*' : ['def']
	}
	
	this.def = function(params,callback){
		return callback({
			error: 0,
			message:'def_func'
		});
	}
}
module.exports = BehaviorModel;
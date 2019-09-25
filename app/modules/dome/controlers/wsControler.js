function wsControler(){
	
	this.t1 = function(){
		//console.log(this.res)
		//clients[this.req.curCliId].send()；//向当前客户端发送信息
		var cli = uni2cli(34);				//获取uniId为34的客户端
		if(cli) return cli.send(JSON.stringify(this.req.body)); 	//向指定客户端发送信息
		clients[this.req.curCliId].send(JSON.stringify({error: 1, message:'对象商户端不在线！'}))
		// for(var a in clients){
		// 	clients[a].send(JSON.stringify(this.req.body))
		// }
		//this.renderJson(this.req.body)
	}
}

module.exports = wsControler;
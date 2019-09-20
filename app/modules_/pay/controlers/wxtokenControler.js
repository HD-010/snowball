var request = require('request');
//配置公众号相关信息
var options={
	appID:'wx291baa9e8b464c2b',
	appsecret:'b3d0782ed9882fad5b374bcd4b603dfb',
	url:encodeURIComponent('http://h5.ranyunkj.com/wechat/token/getAccessToken'),//回调url
}
function wxtokenControler(){
	var self = this;


	/**
	 * 跳转授权
	 * 根据公众号appid,scope(授权方式),code回调的方法
	 */
	this.getCode = function(){
			var scope = 'snsapi_userinfo';			
			self.redirect('https://open.weixin.qq.com/connect/oauth2/authorize?appid='+options.appID+'&redirect_uri='+options.url+'&response_type=code&scope='+scope+'&state=STATE#wechat_redirect');
	}

	/**
	 * 获取微信accessToken
	 * 此方法是code的回调方法
	 */
	this.getAccessToken=function(){
		var code = this.GET('code', { default: false });//获取code
		if(code){
			this.sendAccessToken(code);//发送请求accessToken方法
		}else{
			this.getCode();//返回继续获取code为止
		}	
	}



	/**
	 * 获取accessToken
	 * param 微信code 公众号appID 公众号appsecret
	 */
	this.sendAccessToken = function(code){		
		request.get({
			uri:'https://api.weixin.qq.com/sns/oauth2/access_token?appid='+options.appID+'&secret='+options.appsecret+'&code='+code+'&grant_type=authorization_code',
			json: true,
		},
		(err, res, body) => {
			if(body){
				body.expires_in = new Date().getTime() + body.expires_in;//获取当前时间
				console.log("AccessToken等相关信息",body)
				self.DB('Redis').set('accesssToken',JSON.stringify(body))//把access_token的相关信息保存到缓存中
				this.getMember(body.openid);//根据openid去数据库查询此用户信息是否存在
			}			
		})
	}


	/**
	 * 查询用户信息
	 * 根据openid去数据库查询此用户信息是否存在
	 */
	this.getMember= function(openid){
		var process = this.model('/../../h5/models/DataProcess');

		request.post({
			uri:'http://api.ranyunkj.com/api/user/loginother',//凯哥接口
			json: true,
			header: {'content-type': 'application/json'},
			body:{act:"wxgzh",openid:openid}
		},
		(err, res, body) => {
			console.log("用户是否注册信息",body);
			if(body.errcode==1){
				//无此用户(新注册) 获取用户详细信息
				this.getUserInfo(openid);
			}else{
				body.data.openid = openid;
				process.setUserInfo(body.data);
			console.log("========WWWWWWWWWWWWWWWW:",body);	
				self.redirect(process.beforLogin());// 有此用户  跳转到首页
			}
			
		})

	}



	/**
	 * 获取用户的详细信息
	 * param 用户openid  获取到的accessToken
	 */
	this.getUserInfo = function(openid){
		//从缓存获取accessToken等相关信息
		self.DB('Redis').get('accesssToken',function(err,res){
			if(res){
				var redis = JSON.parse(res);
				if(redis.expires_in > new Date().getTime()){//当前时间小于accessToken过期时间
					//获取用户详细信息
					request.get({
						uri:'https://api.weixin.qq.com/sns/userinfo?access_token='+redis.access_token+'&openid='+openid+'&lang=zh_CN',
						json:true,
					},
					(err, res, body)=>{
						//把用户详细信息 暂时存入缓存
						self.DB('Redis').set('userInfo',JSON.stringify(body))
						console.log("获取到微信新用户信息",body)						
						///self.redirect('http://api.cnxym.cn/h5/shop/reg');//跳转到注册页面让用户填写相信的注册信息
						var data = {
							viewModels:['shop/login/reg'],
							data:body,
							title:"注册页面"
						}
						self.renderLayer(data);
					 })

				}else{//accessToken失效处理 方法1，刷新accessToken 或 方法2.重心获取accessToken
					//方法2
					self.getCode();
				}
			}else{
				//没有accessToken重新获取授权在存入缓存
				self.getCode();
			}
		})
	}


}
module.exports = wxtokenControler;

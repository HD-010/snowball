function memberControler(){
    var that = this;
    
    /**
     * 返回会员信息
     */
    this.info = function(){
        that.model('Member').info({},function(results){
            that.renderJson(results);
        });
    }
    

    //保存用户中心变更信息
    this.saveInfo = function(){
        var that = this;
        var data = {error:1,message:'参数错误'};
        if(!this.POST('id')) return data;

        var info = this.model("Member");
        info.infoUpdate({},function(error,results,fields){
            if(!error) {
                data.error = 0;
                data.message = '修改成功，正在刷新';
                data.uri = "";
            }
            that.renderJson(data);
        });
    }

    /**
     * 退出当前帐号
     */
    this.exit = function(){
        var process = this.model('../../h5/models/DataProcess');
        process.clearUserInfo();
        this.renderJson({error:0,uri:'/h5/shop/login',message:'成功退出....'});
    }
}

module.exports = memberControler;
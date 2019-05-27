function agentControler(){
    /*
    *添加代理商
    */
    this.add = function(){
        this.render({title:'site'});
    }

    /**
     * 删除代理商
     */
    this.del = function(){
        var acount = this.model('UserInfor');
        acount.upAcount((res)=>{
            this.renderJson(res);
        },{type:'agent'});
    }

    /**
     * 写入代理商注册信息
     */
    this.regist = function() {
        var that = this;
        var userInfor = this.model('UserInfor');
        userInfor.acountExists({}, function(res) {
            if (res.error === 1) {
                res.uri = '/admin/agent/add';
                that.renderJson(res);
                return;
            }
            userInfor.insertAgentRegInfo({}, function(res) {
                that.renderJson(res);
            });
        });

    }

    /*
    *操作员列表
    */
   this.list = function(){
    var that = this;
    //获取用户列表
    var acount = this.model('UserInfor');
    //获取分类
    var group = this.model('Group');
    var data = {};
    data.userInfo = this.model('dataProcess').getUseInfo()[0];
    
    acount.list((res)=>{
        data.title = "染云小店后台管理系统--代理商列表"
        if(res.error ){
            that.render(res,'searchNull');
            return;
        } 
        data.users = res.users;
        data.total = res.total;
        data.pageNo = res.pageNo;
        data.pageSize = res.pageSize;
        group.allGroup({},(res)=>{
            if(res.error ){
                that.render(res,'searchNull');
                return;
            } 
            data.groups = res;
            that.render(data);
        });
        },{type:'agent'});
    }

    /**
     * 编辑用户信息
     */
    this.agentVie = function(vie){
        var that = this;
        var data = {
            title: "染云小店后台管理系统--查看代理商信息",
        }
        //获取分类
        var group = this.model('Group');
        
        group.allGroup({},(res)=>{
            data.types = res;
            res.error ? end(1) : end();
        });
        //获取用户列表
        var acount = this.model('UserInfor');
        acount.aUser({},(error,res,fields)=>{
            data.uInfo = res[0];
            (error || (res.length === 0)) ? end(1) : end();
        });

        function end(tag){
            if(tag){
                that.render(data,'/admin/index/err404');
                return;
            }
            if(('types' in data) && ('uInfo' in data)){
                that.render(data);
                return;
            }
        }
    }

    /**
     * 编辑用户信息
     */
    this.agentEdt = function(){
        var that = this;
        var data = {
            title: "染云小店后台管理系统--编辑代理商信息",
        }
        //用户类型
        var type = this.GET('tp');
        //获取分类
        var group = this.model('Group');
        
        group.allGroup({},(res)=>{
            data.types = res;
            res.error ? end(1) : end();
        });
        //获取用户列表
        var acount = this.model('UserInfor');
        acount.aUser({},(error,res,fields)=>{
            data.uInfo = res[0];
            (error || (res.length === 0)) ? end(1) : end();
            
        });

        function end(tag){
            if(tag){
                that.render(data,'/admin/index/err404');
                return;
            }
            if(('types' in data) && ('uInfo' in data)){
                that.render(data);
            }
        }
    }

    /**
     * 保存用户资料
     */
    this.save = function(){
        var tp     = this.POST('tp');
        var type   = this.POST('acountType');
        var acount = this.model('UserInfor');
        var that   = this;
        var times = 0;
        var data = {};
        //如果　tp === type　，则存在数据．如果不等，则删除原有类型的帐户，
        //新增当前类型的帐户，并更新数据到最新状态
        if(tp == type){
            //更新数据
            acount.upAcount((res)=>{
                data = res;
                if(res.error){
                    end(1);
                    return;
                }
                times ++;
                end();
            },{});
            //更新帐户附加表
            acount.upAddonAcount((res)=>{
                data = res;
                if(res.error){
                    end(1);
                    return;
                }
                times ++;
                end();
            });
        }else{
            data.error = 1;
            data.message = '不支持代理商帐户向管理员帐户变更！';
            data.uri = '/admin/manager/list';
            end(1)
        }

        function end(tag){
            if(tag){
                that.renderJson(data);
                return;
            }
            if(times === 2){
                data.error = 0;
                data.message = '代理商信息提交成功，将在２个工作日内完成审核！';
                data.uri = '';
                that.renderJson(data);
                return;
            }
        }

        
    }

    /*
    *代理商分组列表
    */
   this.group = function(){
    
        var that = this;
        var group = this.model('Group');
        var userInfo = this.model('dataProcess').getUseInfo();
        group.selectGroup({type:'agent'}, function(res) {
            res.userInfo = userInfo[0];
            if (res.error) {
                that.render(res)
            }
            that.render(res);
        });

   }

   /*
    *添加代理商分组
    */
    this.groupAdd = function(){
        var data = this.model('dataProcess').getUseInfo()[0];
        data.title = '添加代理商分组';
        this.render(data);
    }

    /*
     *添加代理商保存
     */
    this.addSave = function() {
        var that = this;
        var group = this.model('Group');
        group.insertGroup({}, function(res) {
            res.uri = "/admin/agent/group";
            that.renderJson(res);
        });
    }
}
module.exports = agentControler;
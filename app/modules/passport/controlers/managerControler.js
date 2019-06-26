function managerControler(){
    /*
    *添加操作员
    */
    this.add = function(){
        this.render({title:'site'});
    }

    /**
     * 写入注册信息
     */
    this.regist = function() {
        var that = this;
        var data = {};
        var state = 0;
        var userInfor = this.model('UserInfor');
        userInfor.acountExists({}, function(res) {
            if (res.error === 1) {
                res.uri = '/admin/manager/add';
                that.renderJson(res);
                return;
            }

            userInfor.insertRegInfo({}, function(res) {
                res.uri = '/admin/manager/list';
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
            data.title = "染云小店后台管理系统--用户列表"
            if(res.error ){
                that.render(data,'searchNull');
                return;
            } 
            data.users = res.users;
            data.total = res.total;
            data.pageNo = res.pageNo;
            data.pageSize = res.pageSize;
            group.allGroup({},(res)=>{  
                if(res.error ){
                    that.render(data,'searchNull');
                    return;
                } 
                data.groups = res;
                that.render(data);
            });
        },{});

    }

    

    /**
     * 删除用户
     */
    this.del = function(){
        var acount = this.model('UserInfor');
        acount.upAcount((res)=>{
            this.renderJson(res);
        },{});
    }

    this.agentSave = function(){
        this.save();
    }

    this.managerSave = function(){
        this.save();
    }

    this.m2aSave = function(){
        this.save();
    }

    this.agentEdt = function(){
        this.edt();
    }

    this.managerEdt = function(){
        this.edt();
    }

    this.m2aEdt = function(){
        this.edt('m2a');
    }
    
    this.managerVie = function(){
        this.vie('manager');
    }

    this.agentVie = function(){
        this.vie('agent');
    }

    /**
     * 编辑用户信息
     */
    this.vie = function(vie){
        var that = this;
        var data = {
            title: "染云小店后台管理系统--编辑用户信息",
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
                that.render(data,vie + 'Vie');
                return;
            }
        }
    }

    /**
     * 编辑用户信息
     */
    this.edt = function(vie){
        var that = this;
        var data = {
            title: "染云小店后台管理系统--编辑用户信息",
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
                vie = vie || type;
                that.render(data,vie + 'Edt');
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
        console.log("@@@@@:",'tp:',tp,'type:',type);
        //如果　tp === type　，则存在数据．如果不等，则删除原有类型的帐户，
        //新增当前类型的帐户，并更新数据到最新状态
        if(tp == type){
            //更新数据
            acount.upAcount((res)=>{
                data = res;
                console.log(data);
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
        }else if(type == 'agent'){
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
            //在附加表增加一条记录
            acount.addAddonAcount((res)=>{
                data = res;
                if(res.error){
                    end(1);
                    return;
                }
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
                data.message = '操作成功，正在刷新页面！';
                data.uri = '';
                that.renderJson(data);
                return;
            }
        }

        
    }

    /**
     * 重置密码
     */
    this.resetPassword = function(){
        var dataProcess  = this.model("dataProcess");
        var pass = dataProcess.createPasswd();
        var results = {};
        results.error = 0;
        results.password = pass;
        if(results.password) return  this.renderJson(results);
    }

}
module.exports = managerControler;
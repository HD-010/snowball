/*
 * @Description: In User Settings Edit
 * @Author: your name
 * @Date: 2019-06-15 14:22:07
 * @LastEditTime: 2019-08-27 17:55:47
 * @LastEditors: Please set LastEditors
 */
function componentControler(){
    var that = this;
    //展示所有应用
    this.index = function(){
        var component = that.model('Component');
        //获取组件列表
        component.list({},function(res){
            that.render(res);
        });
    }

    //添加应用
    this.add = function(){
        var data = {error: 0};
        var oid = that.GET('oid') || that.POST('oid');
        data = mergeObj([data, this.model("File").upload({oid: oid})]);
        
        return that.render(data);
    }

    //编辑应用
    this.edit = function(){
        var data = {error: 0};
        var param ={};
        var cid = this.GET('cid');
        if(!cid) return this.render({},"/err404");
        param.id = cid;
        var component = that.model('Component');
        
        //获取上传文件组件信息
        var oid = that.GET('oid') || that.POST('oid');
        data = mergeObj([data, this.model("File").upload({oid: oid})]);
         
        //获取组件信息
        component.list(param,function(res){
            data = mergeObj([data, res]);
            that.render(data);
        });
    }

    //保存数据
    this.save = function(){
        var params = {};
        var data = {error: 1, message: ['恭喜，创建应用成功！', '错误，填写的参数有误！']};
        var ps = 1;
        var compponent = this.model("Component");
        params.comname = this.POST('comname') || '';
        params.icon = this.POST('icon') || '';
        params.nid = this.POST('nid') || '';
        if(!params.comname || !params.nid) return that.renderJson(data);
        //保存组件信息
        compponent.save(params, function(res){
            if(res.error) return that.renderJson(data);
            //创建与组件信息匹配的数据表
            params.comInfos = res.comInfos;
            compponent.create(params, function(res){
                data = mergeObj([data, res]);
                ps = that.testRenderJson(data, ps);
            });
        });

        if(this.POST('isadd')){
            //将组件管理写入菜单表
            ps ++;
            var menu = this.model("Menu");
            menu.add(params, function(res){
                data = mergeObj([data, res]);
                if(res.error) return renderJson(data);
                
                //将菜单id写入权限表
                that.model('Permit').add(res, function(res){
                    data = mergeObj([data, res]);
                    ps = that.testRenderJson(data, ps);
                })
            })
            
        }
    }
}

module.exports = componentControler;
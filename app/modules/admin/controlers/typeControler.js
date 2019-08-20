/*
 * @Description: In User Settings Edit
 * @Author: your name
 * @Date: 2019-06-17 08:56:43
 * @LastEditTime: 2019-08-20 14:44:27
 * @LastEditors: Please set LastEditors
 */
function typeControler(){
    var that = this;

    //展示所有栏目
    this.index = function(){
        var params = {};
        var ctag = this.param("ctag");
        var data = {ctag: ctag};
        params.nid = ctag
        var type = that.model("Type");
        //获取栏目列表
        type.list(params,(res)=>{
            data = mergeObj([data,res]);
            that.render(data)
        });
    }

    /**
     * 添加栏目信息
     */
    this.add = function(){
        var data = {};
        var params = {};
        params.atid = that.GET('atid');
        params.addTop = true;
        data.ctag = params.nid = params.ctag = this.param("ctag");
        //获取组件id
        var component = that.model('Component');
        component.list(params,(res)=>{
            if(res.error || !res.results.length) {
                res.error = 1;
                return that.render(res, '/notice');
            }
            data.componentId = res.results[0].id;
            var type = that.model('Type');
            //所有栏目信息或当前组件下的栏目信息
            type.list(params,(res)=>{
                data.error = res.error;
                data.allType = treeStrcut(res.data);
                that.render(data);
            })
        });
    }

    /**
     * 编辑栏目信息
     */
    this.edt = function(){
        var ps = 2;
        var data = {};
        var atid = that.GET('atid');
        var nid = this.param("ctag");
        data.ctag = nid;
        var type = that.model('Type');
        //被编辑栏目信息
        type.list({id: atid},(res)=>{
            data.error = res.error;
            data.aType = res.data;
            ps = that.testRender(data, ps);
        })
        //当前组件的所有栏目信息
        type.list({nid: nid, addTop: true},(res)=>{
            data.error = res.error;
            data.allType = treeStrcut(res.data);
            ps = that.testRender(data, ps);
        })
    }

    /**
     * 保存栏目编辑后的信息
     */
    this.save = function(){
        var params = {
            tag: that.POST('tag'),
            atid: that.POST('atid'),
            ctag: that.POST('!ctag')
        };
        this.model("Type").save(params,function(res){
            that.renderJson(res);
        });
    }

    /**
     * 删除栏目信息
     */
    this.del = function(){
        var data = {
            error: 0,
            message: ["删除成功，正在跳转","当前栏目下有子栏目或参数错误，删除失败！"]
        }
        var params = {
            atid: that.POST('atid'),
            ctag: this.param("ctag")
        }
        //获取应用标识
        this.model("Component").list(params, function(res){
            if(data.error) return that.renderJson(mergeObj([data, res]));
            params.componentId = res.results[0].id;
            that.model("Type").del(params, function(res){
                data = mergeObj([data, res]);
                data.ctag = params.ctag;
                return that.renderJson(data);
            });
        });
    }

}

module.exports = typeControler;
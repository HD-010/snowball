/*
 * @Description: In User Settings Edit
 * @Author: your name
 * @Date: 2019-06-17 08:56:43
 * @LastEditTime: 2019-08-19 17:24:39
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
        var ps = 1;
        var data = {};
        var params = {};
        params.atid = that.GET('atid');
        params.addTop = true;
        params.nid = params.ctag = this.param("ctag");
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
                data.allType = res.data;
                that.render(data);
            })
        });
    }

    /**
     * 编辑栏目信息
     */
    this.edt = function(){
        var type = that.model('Type');
        var ps = 2;
        var data = {};
        var atid = that.GET('atid');
        var nid = this.param("ctag");
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

}

module.exports = typeControler;
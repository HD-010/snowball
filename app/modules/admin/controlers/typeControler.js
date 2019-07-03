function typeControler(){
    var that = this;

    //展示所有栏目
    this.index = function(){
        var params = {};
        params.nid = this.param("ctag");
        var type = that.model("Type");
        //获取栏目列表
        type.list(params,(res)=>{
            that.render(res)
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
        params.nid = this.param("ctag");
        var type = that.model('Type');
        //所有栏目信息或当前组件下的栏目信息
        type.list(params,(res)=>{
            data.error = res.error;
            data.allType = res.data;
            end(data);
        })
        
        function end(data){
            ps--;
            if(data.error) return that.render(data,'/notice');
            if(!ps) return that.render(data);
        }
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
            end(data);
        })
        //当前组件的所有栏目信息
        type.list({nid: nid, addTop: true},(res)=>{
            data.error = res.error;
            data.allType = res.data;
            end(data);
        })

        function end(data){
            ps--;
            if(data.error) return render(data);
            if(!ps) return that.render(data);
        }
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
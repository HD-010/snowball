function typeControler(){
    var that = this;

    //展示所有栏目
    this.index = function(){
        var type = that.model("Type");
        //获取栏目列表
        type.list({},(res)=>{
            that.render(res)
        });
    }

    /**
     * 添加栏目信息
     */
    this.add = function(){
        var type = that.model('Type');
        var ps = 1;
        var data = {};
        var atid = that.GET('atid');
       
        //所有栏目信息
        type.list({},(res)=>{
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
     * 编辑栏目信息
     */
    this.edt = function(){
        var type = that.model('Type');
        var ps = 2;
        var data = {};
        var atid = that.GET('atid');
        //被编辑栏目信息
        type.list({id:atid},(res)=>{
            data.error = res.error;
            data.aType = res.data;
            end(data);
        })
        //所有栏目信息
        type.list({},(res)=>{
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
        var param = {
            tag: that.POST('tag'),
            atid: that.GET('atid')
        };
        this.model("Type").save(param,function(res){
            that.renderJson(res);
        });
    }

}

module.exports = typeControler;
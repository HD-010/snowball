/**
 * 注：添加删除修改查看的关键参数 nid
 */
function arcControler(){
    var that = this;

    /**
     * 添加文章
     */
    this.add = function(){
        var ctag = this.param('ctag')   // || 'infos';   //这是组件标识，由客户端传来
        //var viewer = 'add_' + ctag;
        var data = {};
        var params = {ctag: ctag};
        var arc = this.model("Arc");
        //查询附加表字段信息
        arc.addonTableInfor(params,function(res){
            if(res.error) {
                res.message = "查询表信息失败，请稍后重试";
                return that.render(res);
            }
            
            data.addInfo = res.results[0].fieldset;  //附加表字段信息
            data.addlist = res.results[0].listfields.split(',');
            that.render(data);
        });
    }

    /**
     * 查看文章
     */
    this.show = function(){
        var ctag = this.param('ctag')   // || 'infos';   //这是组件标识，由客户端传来
        var params = {ctag: ctag};
        var arc = this.model('Arc');
        //查询附加表的信息
        arc.addonTableInfor(params,function(res){
            if(res.error || !res.results.length) {
                res.message = "查询表信息失败，请稍后重试";
                return that.render(res);
            }
            params.addonTab = res.results[0].addtable;
            arc.lists(params, (res)=>{
                that.render(res);
            });
        });
    }

    /**
     * 保存内容
     */
    this.save = function(){
        var ctag = this.param('ctag')   // || 'infos';          //这是组件标识，由客户端传来
        var arc = this.model("Arc");
        var params = {};
        params.ctag = ctag;
        //保存数据到主表
        arc.saveHives({},function(res){
            if(res.error) {
                res.message = "数据写入失败，请稍后重试";
                return that.render(res);
            }
            params.aid = res.results.insertId;
            //查询附加表字段信息
            arc.addonTableInfor(params,function(res){
                if(res.error) {
                    res.message = "查询表信息失败，请稍后重试";
                    return that.render(res);
                }
                params.fieldset = res.results[0].fieldset;
                arc.saveAddon(params,function(res){
                    that.renderJson(res)
                });
            });

        });
    }

    /**
     * 删除记录
     */
    this.del = function(){
        var ctag = this.param('ctag')   // || 'infos';          //这是组件标识，由客户端传来
        var data = {
            error: 0,
            message: '成功删除 1 条记录 ' + ctag,
            uri: '/admin/arc/show/ctag/infos'
        }
        
        this.renderJson(data);
    }

    /**
     * 编辑记录
     */
    this.edt = function(){
        var ctag = this.param('ctag')   // || 'infos';          //这是组件标识，由客户端传来
        var data = {}
        var params = {ctag: ctag};
        var arc = this.model("Arc");
        //查询附加表字段信息
        arc.addonTableInfor(params,function(res){
            if(res.error) {
                res.message = "查询表信息失败，请稍后重试";
                return that.render(res);
            }
            //获取当前被编辑的记录
            params.id = that.GET('id');
            params.addonTab = res.results[0].addtable;
            if(!params.id) {
                res.message = "参数错误，请稍后重试";
                return that.render(res);
            }
            data.addInfo = res.results[0].fieldset;  //附加表字段信息
            data.addlist = res.results[0].listfields.split(',');
            arc.lists(params,(res)=>{
                if(res.error) {
                    res.message = "查询数据失败，请稍后重试";
                    return that.render(res);
                }
                data.error = res.error;
                data.data = res.results;
                that.render(data);
            });
        });
    }


    /**
     * 返回ueditor组件
     */
    this.ueditor = function(){
        this.render();
    }

    /**
     * 获取附加表节构
     */
    this.addonSheam = function(){
        var nid = 'infos';

        that.renderJson({});
    }
}

module.exports = arcControler;
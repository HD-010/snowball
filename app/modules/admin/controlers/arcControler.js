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
        var ps = 3;         
        var data = {};
        var params = {};
        var process = this.model("DataProcess");
        var addonTable = this.model('Component');

        //获取当前组件的栏目列表
        params.nid = ctag;
        var type = this.model('Type');
        type.list(params,function(res){
            if(res.error){
                res.message = "查询栏目信息失败，请稍后重试";
                return that.testRender(res,ps);
            }
            data.types = treeStrcut(res.data); 
            ps = that.testRender(data,ps);
        });
        
        //获取当前商户的分类列表
        var classify = this.model("Classify");
        //查询分类需要参数：ctag,macid,enable
        params.ctag = ctag;
        params.macid = process.getUserInfo('UID');    //商户id，暂以登录用户id表示
        params.enable = '1';
        classify.get(params, function(res){
            data = mergeObj([data,res]);
            ps = that.testRender(data,ps);
        });

        //查询附加表字段信息
        addonTable.list(params,function(res){
            if(res.error) {
                res.message = "查询表信息失败，请稍后重试";
                return that.testRender(res,ps);
            }
            
            data.addInfo = res.results[0].fieldset;  //附加表字段信息
            data.addlist = res.results[0].listfields.split(',');
            ps = that.testRender(data,ps);
        });
    }

    /**
     * 查看文章
     */
    this.show = function(){
        var ctag = this.param('ctag')   // || 'infos';   //这是组件标识，由客户端传来
        var params = {ctag: ctag};
        var arc = this.model('Arc');
        var addonTable = this.model('Component');
        //查询附加表的信息
        addonTable.list(params,function(res){
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
        var addonTable = this.model('Component');
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
            addonTable.list(params,function(res){
                if(res.error) {
                    res.message = "查询表信息失败，请稍后重试";
                    return that.render(res);
                }
                params.fieldset = res.results[0].fieldset;
                params.addtable = res.results[0].addtable;
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
        var id = this.POST('id');
        var data = {
            error: 1,
            message: '操作错误，请选择你需要删除的对象！',
        }
        if(!ctag || !id) return this.renderJson(data);
        var arc = this.model("Arc");
        var addonTable = this.model('Component');
        var params = {
            ctag: ctag,
            id: id
        }
        //查询附加表字段信息
        addonTable.list(params,function(res){
            if(res.error) {
                res.message = "查询表信息失败，请稍后重试";
                return that.render(res);
            }
            params.addtable = res.results[0].addtable;
            
            arc.delHives(params,(res)=>{
                data.error = res.error ? 1 : 0;
                if(res.error) {
                    data.message = '操作失败，请稍后再试！'
                    return that.renderJson(data);
                }
                arc.delAddon(params,(res)=>{
                    data.error = res.error ? 1 : 0;
                    if(res.error) {
                        data.message = '删除附加表数据出错！';
                        return that.renderJson(data);
                    }
                    data.message = "操作成功，删除了" + res.results.affectedRows + "条记录";
                    data.uri = '/admin/arc/show/ctag/infos';
                    that.renderJson(data);
                });
            });
        });
        
    }

    /**
     * 编辑记录
     */
    this.edt = function(){
        var ctag = this.param('ctag')   // || 'infos';          //这是组件标识，由客户端传来
        var data = {}
        var params = {ctag: ctag};
        var arc = this.model("Arc");
        var addonTable = this.model('Component');
        //查询附加表字段信息
        addonTable.list(params,function(res){
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
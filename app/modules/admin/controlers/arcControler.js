function arcControler(){
    var that = this;

    /**
     * 添加文章
     */
    this.add = function(){
        var nid = 'infos';
        var viewer = 'add_' + nid;
        that.render({},viewer);
    }

    /**
     * 保存内容
     */
    this.save = function(){
        var nid = 'infos';
        var arc = this.model("Arc");
        var params = {};
        params.nid = nid;
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
                params.listfields = res.results[0].listfields;
                arc.saveAddon(params,function(res){
                    log(res)
                });
            });

        });

        
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
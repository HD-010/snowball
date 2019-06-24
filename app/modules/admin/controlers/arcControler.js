/**
 * 注：添加删除修改查看的关键参数 nid
 */
function arcControler(){
    var that = this;

    /**
     * 添加文章
     */
    this.add = function(){
        var nid = 'infos';   //这是组件标识，由客户端传来
        var viewer = 'add_' + nid;
        var data = {};
        var params = {nid: nid};
        var arc = this.model("Arc");
        //查询附加表字段信息
        arc.addonTableInfor(params,function(res){
            if(res.error) {
                res.message = "查询表信息失败，请稍后重试";
                return that.render(res);
            }
            
            data.addInfo = res.results[0].fieldset;  //附加表字段信息
            data.addlist = res.results[0].listfields.split(',');
            that.render(data,viewer);
        });
    }

    /**
     * 保存内容
     */
    this.save = function(){
        var nid = 'infos';          //这是组件标识，由客户端传来
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
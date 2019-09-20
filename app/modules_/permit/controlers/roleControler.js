function roleControler() {

    /*
     *添加角色页面渲染
     */
    this.add = function() {
        var userInfo = this.model('dataProcess').getUseInfo();
        this.render(userInfo[0]);
    }

    /*
     *添加角色保存
     */
    this.addSave = function() {
        var that = this;
        var group = this.model('Group');
        
        //写入组名称
        group.insertGroup({}, function(results) {
            if(results.error) {
                that.renderJson(results);
                return;
            }

            var authority = that.model("Authority");
            //分配组的基本权限
            authority.insertBaseAu({
                gId: results.insertId
            },(results)=>{
                that.renderJson(results);
                return;
            });
            
        });
        
    }


    /*
     *角色列表 分页
     */
    this.list = function() {
        var that = this;
        var group = this.model('Group');
        var userInfo = this.model('dataProcess').getUseInfo();
        group.selectGroup({}, function(res) {
            res.userInfo = userInfo[0];
            if (res.error) {

                //that.render(res)
            }
            that.render(res);
        });
    }

    /*
     *删除角色
     */
    this.delete = function() {
        var that = this;
        var group = this.model('Group');
        group.deleteGroup({}, function(res) {
            that.renderJson(res);
        });
    }

    /*
     *编辑角色
     */
    this.edit = function() {
        var that = this;
        var group = this.model('Group');
        group.editGroup({}, function(res) {
            console.log(res)
            that.render(res);
        });
    }

    /*
     *修改角色
     */
    this.update = function() {
        var that = this;
        var group = this.model('Group');
        group.updateGroup({}, function(res) {
            that.renderJson(res);
        });
    }



}
module.exports = roleControler;
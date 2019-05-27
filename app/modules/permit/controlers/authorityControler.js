function authorityControler (){
    this.authorities = function(){
        
    }

    /**
     *　受给用户权限
     *  判断被受权用户在权限表中是否有已受权的数据，如果有则使用,如果没有，
     *  则采用当前用户的权限作为最大权限受予
     */
    this.permit = function(){
        var that = this;
        var userId = this.GET('id');
        var groupId = this.GET('gid');
        var data = {
            title:'用户受权'
        };
        var tmpData = {};

        var menu = this.model('Menu');
        //尝试按userId查询权限数据
        if(userId){
            menu.aboutUser({},(results)=>{
                tmpData.aboutUser = results;
                end();
            });
        }
        //尝试按groupId查询权限数据
        if(groupId){
            menu.aboutGroup({},(results)=>{
                tmpData.aboutGroup = results;
                end();
            });
        }
        menu.groupList({},(results)=>{
            tmpData.groupList = results;
            end();
        });
        function end(tag){
            //处理受权用户权限
            if(((userId && 'aboutUser' in tmpData) &&
            (groupId && 'aboutGroup' in tmpData) &&
            ('groupList' in tmpData)) ||
            //处理受权组权限
            ((!userId && 'aboutGroup' in tmpData) &&
            ('groupList' in tmpData))
            ){
                data.lists = [];
                if(tmpData.groupList.menus.length > 0) {
                    data.lists = tmpData.groupList;
                    data.maxPermit = tmpData.groupList;
                    console.log("========groupList========")
                }
                if(tmpData.aboutGroup.menus.length > 0) {
                    data.lists = tmpData.aboutGroup;
                    data.maxPermit = tmpData.groupList;
                    console.log("========aboutGroup========")
                }
                if(userId && tmpData.aboutUser.menus.length > 0) {
                    data.lists = tmpData.aboutUser;
                    data.maxPermit = (tmpData.aboutGroup.menus.length > 0) ? tmpData.aboutGroup: tmpData.groupList;
                    console.log("========aboutUser========")

                }
                
                if(data.lists.length === 0){
                    data.error = 1;
                    data.message = '获取权限数据出错！';
                    that.render(data,'/admin/index/err404');
                    return;
                }

                data.userId = userId;
                data.groupId = groupId;
                that.render(data);
            }
        }
    }

    /**
     *　保存访问权限
     */
    this.save = function(){
        var that = this;
        var authority = this.model('Authority');

        //删除之前的权限值
        authority.del({},(results)=>{
            if(results.error){
                that.renderJson(results);
                return;
            }
            //清除缓存数据
            this.model('DataProcess');
            
            //写入当前设置的权限值
            authority.saveAuthorities({},(results)=>{
                that.renderJson(results);
                return;
            });
        });

    }
}

module.exports = authorityControler;
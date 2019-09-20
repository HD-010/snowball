function AuthorityService() {
    
    this.list = function(sqlStruct,callback){
        //获取数据处理模型
        var dataProcess = this.model('DataProcess');
        var userInfo = dataProcess.getUseInfo();
        var groupAuthoirties = dataProcess.getGroupInfo(userInfo[0].groupId,'AG');
        if(groupAuthoirties) {
            callback(null,groupAuthoirties,null);
            return;
        }

        var sql = 'select a.*,m.url,m.valid from #@authority as a left join #@sys_menu as m on a.menuId = m.id' +
        sqlStruct.where() + 
        sqlStruct.groupBy() + 
        sqlStruct.orderBy() + 
        sqlStruct.limit();
        
        this.DB().select(sql,function(error,results,fields){
            callback(error,results,fields);
        });
    }

    /**
     * 保存权限数据
     */
    this.add = function(sqlStruct,callback){
        var st  = sqlStruct;
        var sql = 'insert into #@authority ' +
        st.insertNames() +
        st.insertValues();

        this.DB().insert(sql,function(error,results,fields){
            callback(error,results,fields);
        });
    }

    this.del = function(sqlStruct,callback){
        var st  = sqlStruct;
        var sql = 'delete from #@authority ' + st.where();
        this.DB().delete(sql,function(error,results,fields){
            callback(error,results,fields);
        });
    }


    /**
     * 写入组的基本权限
     *  */
    this.cpAu = function(params,callback){
        var sql = 'INSERT INTO #@authority (`gounpId`,	`menuId`,	`add`,	`delete`,	`edit`,	`show`,	`enable`) ' +
        'SELECT ' + params.gId + ' as `gounpId`,`menuId`,`add`,`delete`,`edit`,`show`,`enable`	FROM #@authority WHERE	gounpId = 2000';
        console.log(sql);
        this.DB().insert(sql,function(error,results,fields){
            callback(error,results,fields);
        });
    }
}

module.exports = AuthorityService;
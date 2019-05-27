function AcountService(){
    //查询案例2：
    this.querySysAcount = function(sqlStruct,callback){
        var sql = 'select * from snowball_sys_acount ' +
        sqlStruct.where() + 
        sqlStruct.groupBy() + 
        sqlStruct.orderBy() + 
        sqlStruct.limit();

        this.DB().select(sql,function(error,results,fields){
            callback(error,results,fields);
        });
    }

    /**
     * 添加系统用户帐号
     */
    this.addSysAcount = function(sqlStruct,callback){
        var st  = sqlStruct;
        var sql = 'insert into snowball_sys_acount ' +
        st.insertNames() +
        st.insertValues();
       
        this.DB().insert(sql,function(error,results,fields){
            callback(error,results,fields);
        });
    }

    /**
     * 查询用户列表
     */
    this.queryAcountList = function(sqlStruct,callback){
        var sql = 'select a.* ,' +
        ' g.id gid, g.merchNo, g.merchName regName,' +
        ' m.id mid,m.nick,m.realName regName ' + 
        'from snowball_sys_acount as a left join snowball_sys_acount_agent as g on a.id = g.acountid left join snowball_sys_acount_manager as m on a.id = m.acountid' +
        sqlStruct.where() + 
        sqlStruct.groupBy() + 
        sqlStruct.orderBy() + 
        sqlStruct.limit();
        
        this.DB().select(sql,function(error,results,fields){
            callback(error,results,fields);
        });
    }

    /**
     * 统计用户列表
     */
    this.countAcountList = function(sqlStruct,callback){
        var sql = 'select count(*) total ' +
        'from snowball_sys_acount as a left join snowball_sys_acount_agent as g on a.id = g.acountid left join snowball_sys_acount_manager as m on a.id = m.acountid' +
        sqlStruct.where() + 
        sqlStruct.groupBy() + 
        sqlStruct.orderBy() + 
        sqlStruct.limit();
        
        this.DB().select(sql,function(error,results,fields){
            callback(error,results,fields);
        });
    }
    
    
    //更新数据,该服务数据表字段更新，可以为同类业务的model提供服务
    this.updateAcount = function(sqlStruct,callback){
        var st  = sqlStruct;
        var sql = 'update snowball_sys_acount set '+
        st.updateFeilds() + 
        st.where();
        this.DB().update(sql,function(error,results,fields){
            callback(error,results,fields);
        })
    }

    


    /**
     * 查询一个agent的全部信息
     */
    this.managerInfo = function(sqlStruct,callback){
        var sql = 'select a.*,m.* ' +
        'from snowball_sys_acount as a left join snowball_sys_acount_manager as m on a.id = m.acountid ' +
        sqlStruct.where() + 
        sqlStruct.groupBy() + 
        sqlStruct.orderBy() + 
        sqlStruct.limit();
        
        this.DB().select(sql,function(error,results,fields){
            callback(error,results,fields);
        });
    }

    /**
     * 查询一个manager的全部信息
     */
    this.agentInfo = function(sqlStruct,callback){
        var sql = 'select a.*,g.* ' +
        'from snowball_sys_acount as a left join snowball_sys_acount_agent as g on a.id = g.acountid ' +
        sqlStruct.where() + 
        sqlStruct.groupBy() + 
        sqlStruct.orderBy() + 
        sqlStruct.limit();
        this.DB().select(sql,function(error,results,fields){
            callback(error,results,fields);
        });
    }

    /**
     * 更新一个manager的信息
     */
    this.managerUp = function(sqlStruct,callback){
        var st  = sqlStruct;
        var sql = 'update snowball_sys_acount_manager set '+
        st.updateFeilds() + 
        st.where();

        this.DB().update(sql,function(error,results,fields){
            callback(error,results,fields);
        })
    }
    
    /**
     * 更新一个agent的信息
     */
    this.agentUp = function(sqlStruct,callback){
        var st  = sqlStruct;
        var sql = 'update snowball_sys_acount_agent set '+
        st.updateFeilds() + 
        st.where();
        
        this.DB().update(sql,function(error,results,fields){
            callback(error,results,fields);
        })
    }

    /**
     * 添加条代理商信息
     */
    this.agentAdd = function(sqlStruct,callback){
        var st  = sqlStruct;
        var sql = 'insert into snowball_sys_acount_agent ' +
        st.insertNames() +
        st.insertValues();
        
        this.DB().insert(sql,function(error,results,fields){
            callback(error,results,fields);
        });
    }
    
}

module.exports = AcountService;
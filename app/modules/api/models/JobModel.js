//劳务人才模块
function JobModel(){
    var that = this;
    /**
     * 获取所有的求职者信息
     * 接口/api/job/getJobAll
     */
    that.getJobAll = function(callback){
        let type = that.model("Type");
        type.getclass("jobwanted",function(res){
            if(!res) return callback(1,["no data"]);
            let nid = "jobwanted"; //查询标识        
            that.DB('Redis').get(nid+"_job",(error,data)=>{
                if(data) return callback(0,data);
                let gender = that.POST('gender',{default:""});//根据性别筛选
                let job_experience = that.POST('job_experience',{default:""});//根据经验筛选
                let sql = "SELECT	ar.*,	j.*,	a.NAME AS provincename,	b.NAME AS cityename,m.onlien,c.NAME AS countyname \
                FROM	\
                youbang_archives AS ar	LEFT JOIN youbang_addonjobwanted AS j ON ar.id = j.aid	\
                LEFT JOIN youbang_sys_area AS a ON a.id = j.provinceid\
                    LEFT JOIN youbang_sys_area AS b ON b.id = j.cityid	\
                    LEFT JOIN youbang_sys_area AS c ON c.id = j.countyid \
                    RIGHT JOIN youbang_acount_member as m on m.mid = ar.mid\
                    where componentid = (select id from youbang_components where nid = '"+nid+"') and j.gender like '%"+gender+"%' and j.job_experience like '%"+job_experience+"%'";
                that.DB().query(sql,function(error,results,fields){
                    if(!results.length) return callback(1,['no date']);
                    for(let i in results){                
                        results[i].classify = treeValue(res,"val",results[i].classify,'name');
                        results[i].job_education = treeValue(res,"val",results[i].job_education,'name');
                        results[i].job_experience = treeValue(res,"val",results[i].job_experience,'name');
                        results[i].job_salary = treeValue(res,"val",results[i].job_salary,'name');                   
                    }                    
                    that.DB('Redis').set(nid+"_job");
                    return callback(0,results);
                });
            })
        });
    }

    /***
     * 获取求职经验接口
     * 接口:/api/job/getExperience
     */
    that.getExperience = function(callback){
        let lable = 'classify_15651596090111';//求职者经验标识
        let type = that.model("Type");        
        type.getclass("jobwanted",function(res){
        var results = {};
          for(let i in res){
              if(res[i].val == lable){
                results = res[i].children;   
              }                
          }
          if(!results.length)  return callback(1,['no data']);
          return callback(0,results);
        });
    }

    /**
     * 根据id查询求职者的详细信息
     * 接口:/api/job/getJobById
     * 参数：id 求职信息id
     * 返回值:返回改id的详细信息
     */
    that.getJobById = function(callback){
        let type = that.model("Type");
        type.getclass("jobwanted",function(res){
            if(!res) return callback(1,["no data"]);
            let jid = that.POST('id');; //查询id
            if(isNaN(jid)) return callback(1,['id参数有误！']);
            let nid = "jobwanted"; //查询标识 
            that.DB('Redis').get(jid+"_job",(error,data)=>{
                if(data) return callback(0,data);
                let sql = "SELECT	ar.*,	j.*,	a.NAME AS provincename,	b.NAME AS cityename,m.onlien,c.NAME AS countyname \
                FROM	\
                youbang_archives AS ar	LEFT JOIN youbang_addonjobwanted AS j ON ar.id = j.aid	\
                LEFT JOIN youbang_sys_area AS a ON a.id = j.provinceid\
                    LEFT JOIN youbang_sys_area AS b ON b.id = j.cityid	\
                    LEFT JOIN youbang_sys_area AS c ON c.id = j.countyid \
                    RIGHT JOIN youbang_acount_member as m on m.mid = ar.mid\
                    where componentid = (select id from youbang_components where nid = '"+nid+"') and j.aid = "+jid;
                that.DB().query(sql,function(error,results,fields){
                    if(!results.length) return callback(1,['no date']);
                    for(let i in results){                
                        results[i].classify = treeValue(res,"val",results[i].classify,'name');
                        results[i].job_education = treeValue(res,"val",results[i].job_education,'name');
                        results[i].job_experience = treeValue(res,"val",results[i].job_experience,'name');
                        results[i].job_salary = treeValue(res,"val",results[i].job_salary,'name');                   
                    }                    
                    that.DB('Redis').set(jid+"_job",results);
                    return callback(0,results);
                });
            })
        });
    }

    /***
     * 根据id 获取求职者的经验信息
     * 接口：/api/job/getJobExperience
     * 参数:求职者信息id
     * 返回值:求职者的工作经验信息
     */
    that.getJobExperience  = function(callback){
        //获取id参数
        let jid = that.POST('id');
        if(isNaN(jid)) return callback(1,['id 参数有误！']);
        that.DB('Redis').get(jid+"_experience",function(error,data){
            if(data) return callback(0,data);
            let  sql = " select * from  youbang_jobexperience where aid = "+jid;
            that.DB().query(sql,function(error,results,fields){
                if(!results.length) return callback(1,['no data']);
                that.DB('Redis').set(jid+"_experience",results);
                return callback(0,results);
            });
        });
    }


}
module.exports = JobModel;
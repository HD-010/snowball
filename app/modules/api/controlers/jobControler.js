//劳务人才控制器
function jobControler(){
    var that = this;
    /**
     * 获取所有求职者信息
     */
    that.getJobAll = function(){
        // let prm = ['type'];//验证必填字段
        // let obj = that.checkParm(prm)
        // if (obj.errcode == 1) {
        //     that.sendJson(1, obj.errlist);
        //     return;
        // }
        var job = that.model('Job');      
        job.getJobAll((errocode,results)=>{          
            if(errocode) return that.sendJson(errocode,results);
            //要返回的字段
            let fieldarr = ['id','uname','age','job_education','job_experience','classify','job_salary','gender','litpic','areaname','onlien'];
            //重新组装数据   为true 代表多个对象返回，为false 代表是一个对象返回,说面渲染页面不需要循环
            results = getNewData(results,fieldarr);
            if(results.length) return that.sendJson(errocode,results);
            
        })
    }

    /***
     * 获取求职经验分类
     */
    that.getExperience = function(){
        var job = that.model('Job');      
        job.getExperience((errocode,results)=>{          
            if(errocode) return that.sendJson(errocode,results);
            //要返回的字段
            let fieldarr = [];
            //重新组装数据   为true 代表多个对象返回，为false 代表是一个对象返回,说面渲染页面不需要循环
            results = getNewData(results,fieldarr);
            if(results.length) return that.sendJson(errocode,results);
            
        })
    }

    /**
     * 根据id 查询求职者详细信息
     */
    that.getJobById = function(){
        let prm = ['id'];//验证必填字段
        let obj = that.checkParm(prm)
        if (obj.errcode == 1) {
            that.sendJson(1, obj.errlist);
            return;
        }
        var job = that.model('Job');      
        job.getJobById((errocode,results)=>{          
            if(errocode) return that.sendJson(errocode,results);
            //要返回的字段
            let fieldarr = ['id','uname','age','job_education','job_experience','updatetiem','addtime','delivery','browse','classify','job_salary','provincename','cityename','countyname','phone','level'];
            //重新组装数据   为true 代表多个对象返回，为false 代表是一个对象返回,说面渲染页面不需要循环
            results = getNewData(results,fieldarr);
            if(results.length) return that.sendJson(errocode,results[0]);
            
        })
    }


    /**
     * 根据id 获取求职经验
     * 
     */
    that.getJobExperience  = function(){
        let prm = ['id'];//验证必填字段
        let obj = that.checkParm(prm)
        if (obj.errcode == 1) {
            that.sendJson(1, obj.errlist);
            return;
        }
        var job = that.model('Job');      
        job.getJobExperience((errocode,results)=>{          
            if(errocode) return that.sendJson(errocode,results);
            //要返回的字段
            let fieldarr = [];
            //重新组装数据   为true 代表多个对象返回，为false 代表是一个对象返回,说面渲染页面不需要循环
            results = getNewData(results,fieldarr);
            if(results.length) return that.sendJson(errocode,results);
            
        })
    }
}
module.exports = jobControler;
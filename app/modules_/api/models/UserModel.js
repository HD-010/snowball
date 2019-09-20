/**
 * 用户控制器
 */
function UserModel(){
    var that = this;

    /**
     * 判断用户是否登录
     * 用法
     * that.model("User").judgeuserlogin(function(res){
     *    if(!res) return callback(1,"未登录或登录已过期");
     *      ......代码块
     *  });
       
     */
    that.judgeuserlogin = function(callback){
        //获取用户userid
        let userid = that.POST("userid");
        if(isNaN(userid)) return callback(false);
        //获取验证token
        let token = that.POST('token');
        if(!token) return callback(false);
        //缓存中获取用户
      return that.DB('Redis').get(userid+"_u",function(error,data){
            if(!data) return callback(false);
            if(data==token) return callback(true);
        });
    }

    /**
     * 获取用户类型
     */
    that.getUserType = function(userid,callback){
        if(isNaN(userid)) return callback({errocode:""});
        let sql = "select acountType from #@sys_acount where id = "+userid;
        that.DB().query(sql,function(error,results,fields){
           if(results[0].acountType) return callback(results[0].acountType);
           return callback({errocode:""});
        });
    }


    /**
     * 用户地址添加
     * 接口：/api/user/addaddress
     * 参数1：type 地址类型（值：member-代表用户地址，order-订单地址，infos-信息地址）; 必填
     * 参数2：mainid 地址所属主体id 必填
     * 参数3：provinceid 省id   必填
     * 参数4：cityid 城市id 必填
     * 参数5：countyid 县id 必填
     * 参数6：detail 详细地址
     * 参数7：default 值：0或1 是否默认地址，当前适用于收货地址
     */
    that.addaddress = function(callback){
        let arr = ['member','order','infos'];        
        let type = that.POST('type');
        if(arr.indexOf(type)==-1) return callback(1,"type非法");
        let mainid = that.POST("mainid");
        if(isNaN(mainid)) return callback(1,"mainid非法");
        let provinceid = that.POST('provinceid');
        if(isNaN(provinceid)) return callback(1,"provinceid非法");
        let cityid = that.POST('cityid');
        if(isNaN(cityid)) return callback(1,"cityid非法");
        let countyid = that.POST('countyid');
        if(isNaN(countyid)) return callback(1,"countyid非法");
        let detail = that.POST('detail');
        let defaultt = that.POST('default');
        if(isNaN(defaultt)) return callback(1,"default非法");
        let realname = that.POST('realname');        
        let tel = that.POST('tel');
        if(isNaN(tel)) return callback(1,"tel非法");
        if(defaultt==1){
            let sql = "update #@addresslist set `default`= '0' where type='"+type+"' and mainid = "+mainid;
            that.DB().query(sql,function(error,res,fields){
                let sql1 = "insert into #@addresslist(`type`,`mainid`,`provinceid`,`cityid`,`countyid`,`detail`,`addtime`,`default`,`realname`,`tel`) \
                values('"+type+"',"+mainid+","+provinceid+","+cityid+","+countyid+",'"+detail+"',NOW(),'"+defaultt+"','"+realname+"','"+tel+"')";
                that.DB().query(sql1,function(error,results,fields){
                    if(results.affectedRows){
                        return callback(0,"Success");
                    }
                    return callback(1,results);
                });
            })
        }else{            
            let sql2 = "insert into #@addresslist(`type`,`mainid`,`provinceid`,`cityid`,`countyid`,`detail`,`addtime`,`default`) \
            values('"+type+"',"+mainid+","+provinceid+","+cityid+","+countyid+",'"+detail+"',NOW(),'"+defaultt+"','"+realname+"','"+tel+"')";
            that.DB().query(sql2,function(error,results,fields){
                if(results.affectedRows){
                    return callback(0,"Success");
                }
                return callback(1,results);
            });
        }  
    }

    /**
     * 根据type和mianid查询地址
     * 接口:/api/user/address
     * 参数1：type 地址类型（值：member-代表用户地址，order-订单地址，infos-信息地址）; 必填
     * 参数2：mainid 地址所属主体id 必填
     */
    that.address = function(callback){
        let arr = ['member','order','infos'];        
        let type = that.POST('type');
        if(arr.indexOf(type)==-1) return callback(1,"type非法");
        let mainid = that.POST("mainid");
        if(isNaN(mainid)) return callback(1,"mainid非法");
        //缓存
        that.DB('Redis').get(type+"_"+mainid+"_address",function(error,data){
            if(data) return callback(0,data);
            let sql = "SELECT	\
            ad.*,	a.NAME AS province,	b.NAME AS city,	c.NAME AS county \
            FROM	#@addresslist AS ad	\
            LEFT JOIN #@sys_area a ON a.id = ad.provinceid	\
            LEFT JOIN #@sys_area b ON b.id = ad.cityid	\
            LEFT JOIN #@sys_area c ON c.id = ad.countyid \
            where ad.type = '"+type+"' and ad.mainid = "+mainid+" order by id";
            that.DB().query(sql,function(error,results,fields){
                if(!results.length) return callback(1,['no date']);
                that.DB('Redis').set(type+"_"+mainid+"_address",results);
                return callback(0,results);
            });
        })
    }

    /**
     * 根据地址id查询地址信息
     * 接口：/api/user/addressbyid
     * 参数1：id 地址id 必填;
     * 参数2：userid 用户id 必填;
     * 返回值：返回id对应的地址
     */
    that.addressbyid = function(callback){
        console.log('------------------------')
        let id = that.POST('id');
        if(isNaN(id)) return callback(1,'地址id非法');
        let userid = that.POST('userid');
        if(isNaN(userid)) return callback(1,'用户userid非法');
        that.DB('Redis').get(id+"_"+userid+"_address",function(error,data){
            if(data) return callback(0,data);
            let sql = "SELECT	\
            ad.*,	a.NAME AS province,	b.NAME AS city,	c.NAME AS county \
            FROM	#@addresslist AS ad	\
            LEFT JOIN #@sys_area a ON a.id = ad.provinceid	\
            LEFT JOIN #@sys_area b ON b.id = ad.cityid	\
            LEFT JOIN #@sys_area c ON c.id = ad.countyid \
            where ad.id = "+id+" and ad.mainid = "+userid+" order by id";
            that.DB().log().query(sql,function(error,results,fields){
                if(!results.length) return callback(1,['no date']);
               
                that.DB('Redis').set(id+"_"+userid+"_address",results);
                return callback(0,results);
            });
        })
    }


    /**
     * 根据id 修改地址
     * 接口：/api/user/uptadeaddress
     * 参数：id 地址id 必填
     * 参数1：type 地址类型（值：member-代表用户地址，order-订单地址，infos-信息地址）; 必填
     * 参数2：mainid 地址所属主体id 必填
     * 参数3：provinceid 省id   必填
     * 参数4：cityid 城市id 必填
     * 参数5：countyid 县id 必填
     * 参数6：detail 详细地址
     * 参数7：default 值：0或1 是否默认地址，当前适用于收货地址
     */
    that.uptadeaddress = function(callback){
        let arr = ['member','order','infos'];        
        let type = that.POST('type');
        if(arr.indexOf(type)==-1) return callback(1,"type非法");
        let id = that.POST("id");
        if(isNaN(id)) return callback(1,"id非法");
        let mainid = that.POST("mainid");
        if(isNaN(mainid)) return callback(1,"mainid非法");
        let provinceid = that.POST('provinceid');
        if(isNaN(provinceid)) return callback(1,"provinceid非法");
        let cityid = that.POST('cityid');
        if(isNaN(cityid)) return callback(1,"cityid非法");
        let countyid = that.POST('countyid');
        if(isNaN(countyid)) return callback(1,"countyid非法");
        let detail = that.POST('detail');
        let realname = that.POST('realname');        
        let tel = that.POST('tel');
        if(isNaN(tel)) return callback(1,"tel非法");
        let defaultt = that.POST('default');
        if(isNaN(defaultt)) return callback(1,"default非法");
        defaultt = parseInt(defaultt)+1;
        if(defaultt==1){
            let sql = "update #@addresslist set `default`= '0' where type='"+type+"' and mainid = "+mainid;
            that.DB().log().query(sql,function(error,res,fields){
                let sql1 = "update #@addresslist set `type`='"+type+"',mainid="+mainid+",provinceid="+provinceid+",cityid ="+cityid+",countyid="+countyid+",detail='"+detail+"',`default`="+defaultt+",`realname`='"+realname+"',`tel`='"+tel+"',addtime=NOW() where id ="+id;
                that.DB().log().query(sql1,function(error,results,fields){
                    if(results.affectedRows){
                        return callback(0,"Success");
                    }
                    return callback(1,results);
                });
            })
        }else{            
            let sql2 = "update #@addresslist set \
            `type` = '"+type+"',mainid = "+mainid+", provinceid = "+provinceid+", cityid = "+cityid+", countyid = "+countyid+", detail = '"+detail+"',`default` ="+defaultt+",`realname`='"+realname+"',`tel`='"+tel+"',addtime = NOW() \
            where id = "+id;
            that.DB().log().query(sql2,function(error,results,fields){
                if(results.affectedRows){
                    return callback(0,"Success");
                }
                return callback(1,results);
            });
        }  
    }

    /**
     * 根据地址id删除地址
     * 接口：/api/user/deladdress
     * 参数：id 地址id 必填
     */
    that.deladdress = function(callback){
        let id = that.POST('id');
        if(isNaN(id)) return callback(1,"id非法");
        let sql = "delete from #@addresslist where id = "+id;
        that.DB().query(sql,function(error,results,fields){
            if(results.affectedRows){
                return callback(0,"Success");
            }
            return callback(1,'fail');
        })
    }

}
module.exports = UserModel;
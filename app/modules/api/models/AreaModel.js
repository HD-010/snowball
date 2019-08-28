/*
 * @Description: In User Settings Edit
 * @Author: your name
 * @Date: 2019-08-16 15:28:18
 * @LastEditTime: 2019-08-28 17:52:04
 * @LastEditors: Please set LastEditors
 */
/**
 * 获取城市信息
 */
function AreaModel(){
    var that = this;
    that.area = function(callback){
        that.DB('Redis').get("area",(error,data)=>{
            if(data) return callback(0,data);
            let sql = "select id,name,reid as pid from #@sys_area ORDER BY reid asc,id asc";
            that.DB().query(sql,function(error,results,fields){
                if(results.length){
                    results = treeStrcut(results);
                    //存入缓存
                    that.DB('Redis').set("area",results);
                    return callback(0,results);     
                }else{
                    return callback(1,["no data"]);     
                }
                
            })           
        })       
    }


    that.getAdress = function(id,callback){        
        that.DB('Redis').get(id+"_addresslist",(error,data)=>{
            if(data) return callback(data);
            let sql = "SELECT	ad.*,a.NAME as provincename,	ar.NAME as cityname,are.NAME as countyname FROM	#@addresslist AS ad LEFT join #@sys_area AS a ON a.id = ad.provinceid LEFT join #@sys_area AS ar ON ad.cityid = ar.id LEFT join #@sys_area AS are ON ad.countyid = are.id WHERE	ad.id = "+id;
            that.DB().query(sql,function(e,r,f){
                if(r) return callback(r);
                return callback(0);
            })
        })
    }
} 
module.exports = AreaModel;
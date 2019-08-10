/**
 * 获取城市信息
 */
function AreaModel(){
    var that = this;
    that.area = function(callback){
        that.DB('Redis').get("area",(error,data)=>{
            if(data) return callback(0,data);
            let sql = "select id,name,reid as pid from youbang_sys_area ORDER BY reid asc,id asc";
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
} 
module.exports = AreaModel;
function AdvModel(){
    var that = this;
    
    /**
     * 接口提供广告信息
     */
    this.list = function(params, callback){
        
        var conditions = {
            table:['snowball_adv'],
            where:['type=1'],
            having:[],
            groupBy:[],
            orderBy:[],
            limit:[]
        }
        
        this.DB().get(conditions,function(error,results,fields){
            callback(error,results,fields);
        });
    }

    

}

module.exports = AdvModel;
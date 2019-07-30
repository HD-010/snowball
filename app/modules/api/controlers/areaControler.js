/**
 * 获取城市列表信息
 */
function areaControler(){
    var that = this;
     /**
      * 接口：/api/area/area
     * 获取城市列表
     */
    that.area = function(){
        var area = that.model('Area');
        area.area((errocode,res)=>{
            return that.sendJson(errocode,res)
        })
    }

}
module.exports = areaControler;
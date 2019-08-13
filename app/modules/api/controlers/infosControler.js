/**
 * 信息操作
 */
function infosControler(){
    var that = this;
    
    /**
     * 获取推荐列表信息
     */
    that.infos = function(){
        let prm = ["flag"];//必填字段
        let obj = that.checkParm(prm);
        if (obj.errcode == 1) {
            that.sendJson(1, obj.errlist);
            return;
        }
        let Infos = that.model("Infos");
        Infos.infos((errocode,obj)=>{
            if(errocode) return that.sendJson(errocode,obj);
            //要返回的字段
            let fieldarr = ["id","addtime","title","areaname","classify","litpic","click","levelid","favorite"];
            //重新组装数据   为true 代表多个对象返回，为false 代表是一个对象返回,说面渲染页面不需要循环
            obj = getNewData(obj,fieldarr);
            if(obj){
                return that.sendJson(errocode,obj)
            }           
        })

    }


     /**
     * 获取咨询列表信息
     */
    that.infoscon = function(){
        let prm = ["flag"];//必填字段
        let obj = that.checkParm(prm);
        if (obj.errcode == 1) {
            that.sendJson(1, obj.errlist);
            return;
        }
        let Infos = that.model("Infos");
        Infos.infoscon((errocode,obj)=>{
            if(errocode) return that.sendJson(errocode,obj);
            //要返回的字段
            let fieldarr = ["id","addtime","title","shorttitle","litpic","levelid","click","description","icon"];
            //重新组装数据   为true 代表多个对象返回，为false 代表是一个对象返回,说面渲染页面不需要循环
            obj = getNewData(obj,fieldarr);
            if(obj){
                return that.sendJson(errocode,obj)
            }          
        })
    }


    /**
     * 根据id 查询信息 
     */
    that.infosbyid = function(){
        let prm = ["id"];//必填字段
        let obj = that.checkParm(prm)
        if (obj.errcode == 1) {
            that.sendJson(1, obj.errlist);
            return;
        }
        let Infos = that.model("Infos");
        Infos.infosbyid((errocode,obj)=>{
            if(errocode) return that.sendJson(errocode,obj);
            //要返回的字段
            let fieldarr = [];
            //重新组装数据   为true 代表多个对象返回，为false 代表是一个对象返回,说面渲染页面不需要循环
            obj = getNewData(obj,fieldarr);
            //解吗64
            obj = recodeBase64decode(obj,"body");
            if(obj){
                return that.sendJson(errocode,obj[0])
            }           
        })

    }

    /**
     * 更改工程系信息阅读数
     *  参数:id  
     */
    that.onclick = function(){
        let prm = ["id"];//必填字段
        let obj = that.checkParm(prm)
        if (obj.errcode == 1) {
            that.sendJson(1, obj.errlist);
            return;
        }
        let Infos = that.model("Infos");
        Infos.onclick((errocode,obj)=>{
            if(obj){
                return that.sendJson(errocode,obj)
            }           
        })
    }

    /**
     * 筛选获取分类信息
     */
    that.getInfosAll = function(){
        let Infos = that.model("Infos");
        Infos.getInfosAll((errocode,obj)=>{
            if(errocode) return that.sendJson(errocode,obj);
            //要返回的字段
            let fieldarr = ["id","addtime","title","areaname","classify","favorite"];
            //重新组装数据   为true 代表多个对象返回，为false 代表是一个对象返回,说面渲染页面不需要循环
            obj = getNewData(obj,fieldarr);
            if(obj){
                return that.sendJson(errocode,obj)
            }                
        })
    }
}
module.exports = infosControler;
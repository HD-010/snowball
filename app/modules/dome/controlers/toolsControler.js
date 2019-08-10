function toolsControler(){
    /**
     * http请求测试工具
     */
    this.request = function(){
        console.log("this is request");
        //this.renderJson({id:'kd',e23:"dkfk"});
        return this.render({});
    }

    this.retest = function(){
        log({type:'get',e23:"dkfk"});
        if(this.GET('id')) return this.renderJson({type:'get',e23:"dkfk"});
        if(this.POST('id')) return this.renderJson({type:'post',e23:"dkfk"});
       // return this.renderJson({id:'kd',e23:"dkfk"});
    }

}

module.exports = toolsControler;
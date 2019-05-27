function suppliersControler(){
    /*
    *商户列表
    */
    this.list = function(){
        var that=this;
        var Supplier = this.model('Supplier');
        var list={};
        Supplier.suppliersAll({},(res)=>{
          
            if(res.error){
                that.render(data,'/admin/index/err404');
                return;
            }     
            that.render({res});
        });
    }

    
}
module.exports = suppliersControler;
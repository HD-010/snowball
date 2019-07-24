
function uploadControler(){
    this.img = function(){
        this.upload({
            req    : this.req,
            res    : this.res,
            path   : 'uploads/',   //上传文件大分类名称
            typeDir: true        //需要分类管理文件（按日期分类）
        });
    }
}
module.exports = uploadControler;
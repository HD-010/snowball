function errControler(){
    var that = this;
    this._404 = function(){
        console.log("123465464")
        return that.renderJson({error:"没有此接口"});
    }
}

module.exports = errControler;
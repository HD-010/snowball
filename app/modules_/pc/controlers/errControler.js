function errControler(){
    var that = this;
    this._404 = function(){
        return this.render({},'/err404');
    }
}

module.exports = errControler;
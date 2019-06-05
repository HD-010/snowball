function signControler(){
    var that = this;
    this._in = function(){
        that.render({});
    }

    this._out = function(){
        that.render({error:0,message:"退出成功"});
    }
}

module.exports = signControler;
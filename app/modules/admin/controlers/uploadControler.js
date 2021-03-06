function uploadControler(){
    var that = this;
    this.img = function (){
        that.upload({
            req    : that.req,
            res    : that.res,
            path   : 'img/',   //上传文件大分类名称
            typeDir: true        //需要分类管理文件（按日期分类）
        });
    }
	
	/**
	 * 系统图标使用上传接口
	 */
	this.sysIcon = function (){
	    that.upload({
	        req    : that.req,
	        res    : that.res,
	        path   : 'img/sys/',   //上传文件大分类名称
	        typeDir: true        //需要分类管理文件（按日期分类）
	    });
	}
	
	this.video = function (){
	    that.upload({
	        req    : that.req,
	        res    : that.res,
	        path   : 'video/',   //上传文件大分类名称
	        typeDir: true        //需要分类管理文件（按日期分类）
	    });
	}

    this.doc = function (){
        that.upload({
            req    : that.req,
            res    : that.res,
            path   : 'doc/',   //上传文件大分类名称
            typeDir: true        //需要分类管理文件（按日期分类）
        });
    }

    this.excel = function (){
        that.upload({
            req    : that.req,
            res    : that.res,
            path   : 'excel/',   //上传文件大分类名称
            typeDir: true        //需要分类管理文件（按日期分类）
        });
    }

    this.text = function (){
        that.upload({
            req    : that.req,
            res    : that.res,
            path   : 'text/',   //上传文件大分类名称
            typeDir: true        //需要分类管理文件（按日期分类）
        });
    }

}

module.exports = uploadControler;
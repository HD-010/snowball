function uploadControler(){
    var that = this;
	/**
	 * 上传图片接口
	 */
    this.img = function (){
        that.upload({
            req    : that.req,
            res    : that.res,
            path   : 'img/',   //上传文件大分类名称
            typeDir: true        //需要分类管理文件（按日期分类）
        });
    }

	/**
	 * 上传doc文档接口
	 */
    this.doc = function (){
        that.upload({
            req    : that.req,
            res    : that.res,
            path   : 'doc/',   //上传文件大分类名称
            typeDir: true        //需要分类管理文件（按日期分类）
        });
    }

	/**
	 * 上传excel工作表接口
	 */
    this.excel = function (){
        that.upload({
            req    : that.req,
            res    : that.res,
            path   : 'excel/',   //上传文件大分类名称
            typeDir: true        //需要分类管理文件（按日期分类）
        });
    }

	/**
	 * 上传text文档接口
	 */
    this.text = function (){
        that.upload({
            req    : that.req,
            res    : that.res,
            path   : 'text/',   //上传文件大分类名称
            typeDir: true        //需要分类管理文件（按日期分类）
        });
    }
	
	/**
	 * 通用文字识别接口
	 */
	this.generalBasic = function(){
		that.upload({
		    req    : that.req,
		    res    : that.res,
		    path   : 'generalBasic/',   //上传文件大分类名称
		    typeDir: true        		//需要分类管理文件（按日期分类）
		}, (res)=>{
			//log(res);
			that.model('File').generalBasic(res,()=>{
				
			});
		});
	}

}

module.exports = uploadControler;
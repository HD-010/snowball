字段设置案例：
{
	"field": "componentid",			//字段标识
	"itemname": "组件id",			//字段名称(显示有页面)
	"type": "int",					//数据表中数据类型
	"maxlength": "10",				//字段最大长度
	"isnull": true,					//数据表中是否允许为null
	"islist": 1,					//数据表中值是否为列表(如果是列表，其值为列表名称；否则为空)
	"default": 0,					//字段默认值
	"fieldget": 1,					//是否采集数据（如果设置1，则在视图输出该字段的输入框；返回之不输出。）
	"fieldset": 1,					//是否写入数据（如果设置1，则在model中获取客户后台客户端采集到的数据，将其保存到数据库中；返回之不保存。）
	"limit": 4,						//限制图片上传的张数，或限制address的层级数
	"novaild": 1,					//如果为true，对字段不需要特殊字符过滤
	"inputtype":"input",			//输入框类型 input|checkbox|radio|select|textarea|uediter|uploader|nesmodal|address
	"attr": " disabled data-def=4 data-comment=如：这是注释" //视图中输入框属性
}
关于 输入框类型的说明：
 input：
 checkbox: 
 radio:
 select:
 textarea:
 uediter:	
 uploader: 上传图片控件
 nesmodal: 是modal(模态框)与nestable 结相结和的输入对话框
 address：联动地址模块
 
 


//youbang_addoninfos 表字自动填充字段配置信息：(当前与表一致)
[
  {
    "field": "classify",
    "itemname": "所属分类",
    "type": "text",
    "maxlength": "1024",
    "isnull": true,
    "islist": "工程信息分类",
    "default": 0,
    "fieldget": 0,
    "fieldset": 0,
    "inputtype": "nesmodal",
    "attr": " disabled data-def=4 data-comment=如：这是注释"
  },
  {
    "field": "componentid",
    "itemname": "组件id",
    "type": "int",
    "maxlength": "10",
    "isnull": true,
    "islist": "",
    "default": 0,
    "fieldget": 0,
    "fieldset": 1,
    "inputtype": "input",
    "attr": " disabled data-def=4 data-comment=如：这是注释"
  },
  {
    "field": "title",
    "itemname": "标题",
    "type": "varchar",
    "maxlength": "72",
    "isnull": false,
    "islist": "",
    "default": "",
    "fieldget": 0,
    "fieldset": 1,
    "inputtype": "input",
    "attr": " disabled data-def=4 data-comment=标题长度最多15个字符"
  },
  {
    "field": "litpic",
    "itemname": "缩略图",
    "type": "varchar",
    "maxlength": "255",
    "isnull": true,
    "islist": "",
    "default": "",
    "fieldget": 0,
    "fieldset": 1,
    "inputtype": "input",
    "attr": " disabled data-def=4 data-comment=标题长度最多15个字符"
  },
  {
    "field": "arcrank",
    "itemname": "受权浏览",
    "type": "int",
    "maxlength": "5",
    "isnull": "true",
    "islist": "",
    "default": "0",
    "fieldget": 0,
    "fieldset": 1,
    "inputtype": "radio",
    "attr": "type=number checked disabled"
  },
  {
    "field": "mid",
    "itemname": "会员id",
    "type": "int",
    "maxlength": "8",
    "isnull": "true",
    "islist": "",
    "default": "0",
    "fieldget": 0,
    "fieldset": 1,
    "inputtype": "input",
    "attr": "type=number disabled "
  },
  {
    "field": "click",
    "itemname": "点击",
    "type": "int",
    "maxlength": "10",
    "isnull": "true",
    "islist": "",
    "default": "0",
    "fieldget": 0,
    "fieldset": 1,
    "inputtype": "input",
    "attr": "type=number disabled "
  },
  {
    "field": "userip",
    "itemname": "会员IP",
    "type": "text",
    "maxlength": "15",
    "isnull": "true",
    "islist": "",
    "default": "0",
    "fieldget": 0,
    "fieldset": 1,
    "inputtype": "input",
    "attr": "type=text disabled"
  },
  {
    "field": "senddate",
    "itemname": "发布时间",
    "type": "int",
    "maxlength": "10",
    "isnull": "true",
    "islist": "",
    "default": "0",
    "fieldget": 0,
    "fieldset": 1,
    "inputtype": "input",
    "attr": "type=datetime"
  },
  {
    "field": "flag",
    "itemname": "推荐属性",
    "type": "checkbox",
    "maxlength": "10",
    "isnull": "true",
    "islist": "",
    "default": "0",
    "fieldget": 1,
    "fieldset": 1,
    "inputtype": "checkbox",
    "attr": "type=checkbox data-key=hot-home-recomend data-val=热点-首页-推荐"
  },
  {
    "field": "lastpost",
    "itemname": "最后评论时间",
    "type": "int",
    "maxlength": "10",
    "isnull": "true",
    "islist": "",
    "default": "0",
    "fieldget": 0,
    "fieldset": 1,
    "inputtype": "input",
    "attr": "type=datetime disabled"
  },
  {
    "field": "scores",
    "itemname": "评论积分",
    "type": "int",
    "maxlength": "8",
    "isnull": "true",
    "islist": "",
    "default": "0",
    "fieldget": 1,
    "fieldset": 1,
    "inputtype": "input",
    "attr": "type=number disabled"
  },
  {
    "field": "goodpost",
    "itemname": "好评数",
    "type": "int",
    "maxlength": "8",
    "isnull": "true",
    "islist": "",
    "default": "0",
    "fieldget": 1,
    "fieldset": 1,
    "inputtype": "input",
    "attr": "type=number disabled"
  },
  {
    "field": "badpost",
    "itemname": "差评数",
    "type": "int",
    "maxlength": "8",
    "isnull": "true",
    "islist": "",
    "default": "0",
    "fieldget": 1,
    "fieldset": 1,
    "inputtype": "input",
    "attr": "type=number disabled"
  },
  {
    "field": "nativeplace",
    "itemname": "地区",
    "type": "stepselect",
    "maxlength": "250",
    "isnull": "true",
    "islist": "",
    "default": "0",
    "fieldget": 1,
    "fieldset": 1,
    "inputtype": "input",
    "attr": "data-key=area1-area2-area3 data-val=城市1-城市2-城市3"
  },
  {
    "field": "infotype",
    "itemname": "信息类型",
    "type": "stepselect",
    "maxlength": "250",
    "isnull": "true",
    "islist": "",
    "default": "0",
    "fieldget": 1,
    "fieldset": 1,
    "inputtype": "select",
    "attr": ""
  },
  {
    "field": "body",
    "itemname": "信息内容",
    "type": "htmltext",
    "maxlength": "250",
    "isnull": "true",
    "islist": "",
    "default": "",
    "fieldget": 1,
    "fieldset": 1,
    "novaild": 1,
    "inputtype": "uediter",
    "attr": "type=text"
  },
  {
    "field": "endtime",
    "itemname": "截止日期",
    "type": "datetime",
    "maxlength": "250",
    "isnull": "true",
    "islist": "",
    "default": "",
    "fieldget": 1,
    "fieldset": 1,
    "inputtype": "input",
    "attr": "type=datetime"
  },
  {
    "field": "tel",
    "itemname": "联系电话",
    "type": "text",
    "maxlength": "50",
    "isnull": "true",
    "islist": "",
    "default": "",
    "fieldget": 1,
    "fieldset": 1,
    "inputtype": "input",
    "attr": "type=tel"
  },
  {
    "field": "email",
    "itemname": "电子邮箱",
    "type": "text",
    "maxlength": "50",
    "isnull": "true",
    "islist": "",
    "default": "",
    "fieldget": 1,
    "fieldset": 1,
    "inputtype": "input",
    "attr": "type=email"
  },
  {
    "field": "linkman",
    "itemname": "联系人",
    "type": "text",
    "maxlength": "50",
    "isnull": "true",
    "islist": "",
    "default": "",
    "fieldget": 1,
    "fieldset": 1,
    "inputtype": "input",
    "attr": "type=text"
  },
  {
    "field": "address",
    "itemname": "地址",
    "type": "text",
    " maxlength": "100",
    "isnull": "true",
    "islist": "",
    "default": "",
    "fieldget": 1,
    "fieldset": 1,
    "inputtype": "address",
    "attr": ""
  }
]


youbang_addoncommodities 表字自动填充字段配置信息:
[
  {
    "field": "componentid",			
    "itemname": "组件id",			
    "type": "int",					
	"maxlength": "10",				
    "isnull": true,					
	"islist": 1,					
	"default": 0,					
	"fieldget": 1,					
	"fieldset": 1,					
	"novaild": 1,					
	"inputtype":"input",			
    "attr": " disabled data-def=4 data-comment=如：这是注释" 
  },
  {
    "field": "title",			
    "itemname": "标题",			
    "type": "text",					
	"maxlength": "25",				
    "isnull": false,					
	"islist": 0,					
	"default": 0,					
	"fieldget": 0,					
	"fieldset": 1,					
	"novaild": 0,					
	"inputtype":"input",			
    "attr": "data-comment=标题长度最多15个字符" 
  },
  {
    "field": "litpic",			
    "itemname": "缩略图",			
    "type": "text",					
	"maxlength": 0,				
    "isnull": true,					
	"islist": 0,					
	"default": '',					
	"fieldget": 0,					
	"fieldset": 1,					
	"novaild": 0,					
	"inputtype":"input",			
    "attr": "data-comment=缩略图，限1张" 
  },
  {
    "field": "mainpic",			
    "itemname": "商品主图",			
    "type": "text",					
	"maxlength": 0,				
    "isnull": true,					
	"islist": 0,					
	"default": '',					
	"fieldget": 1,					
	"fieldset": 1,					
	"novaild": 0,					
	"inputtype":"uploader",	
	"limit": 5,
    "attr": "data-comment=端口主图，最多5张" 
  },
  {
    "field": "spec",			
    "itemname": "商品规格",			
    "maxlength": 0,				
    "fieldget": 1,					
	"fieldset": 0,					
	"novaild": 0,					
	"inputtype":"spec",	
	"attr": "data-comment=填写商品分类" 
  }
]


youbang_addonjobwanted 表字自动填充字段配置信息:
[
  {
    "field": "componentid",			
    "itemname": "组件id",			
    "type": "int",					
	"maxlength": "10",				
    "isnull": true,					
	"islist": "",					
	"default": 0,					
	"fieldget": 0,					
	"fieldset": 1,					
	"novaild": 1,					
	"inputtype":"input",			
    "attr": " disabled data-def=4 data-comment=如：这是注释" 
  },
  {
    "field": "title",			
    "itemname": "标题",			
    "type": "text",					
	"maxlength": "25",				
    "isnull": false,					
	"islist": 0,					
	"default": 0,					
	"fieldget": 0,					
	"fieldset": 1,					
	"novaild": 0,					
	"inputtype":"input",			
    "attr": "data-comment=标题长度最多15个字符" 
  },
  {
    "field": "litpic",			
    "itemname": "头像",			
    "type": "text",					
	"maxlength": 0,				
    "isnull": true,					
	"islist": 0,					
	"default": '',					
	"fieldget": 0,					
	"fieldset": 1,					
	"novaild": 0,					
	"inputtype":"input",
	"limit":1,
    "attr": "data-comment=上传头像" 
  },
  {
	"field": "uname",			
	"itemname": "姓名",			
	"type": "text",					
	"maxlength": "20",				
	"isnull": false,					
	"islist": "",					
	"default": 0,					
	"fieldget": 1,					
	"fieldset": 1,					
	"limit": 4,						
	"novaild": 0,					
	"inputtype":"input",			
	"attr": " data-comment=如：这是注释" //视图中输入框属性
   },
   {
	"field": "litpic",			
	"itemname": "头像",			
	"type": "text",					
	"maxlength": "255",				
	"isnull": false,					
	"islist": "",					
	"default": 0,					
	"fieldget": 1,					
	"fieldset": 1,					
	"limit": 1,						
	"novaild": 0,					
	"inputtype":"uploader",			
	"attr": " data-def=4 data-comment=如：这是注释" //视图中输入框属性
   },
   {
	"field": "gender",			
	"itemname": "性别",			
	"type": "varchar",					
	"maxlength": "2",				
	"isnull": false,					
	"islist": "",					
	"default": 0,					
	"fieldget": 1,					
	"fieldset": 1,					
	"limit": 1,						
	"novaild": 0,					
	"inputtype":"checkbox",			
	"attr": " data-val='男-女' data-key='0-1' data-def=0 data-comment=如：这是注释" //视图中输入框属性
   },
   
   {
	"field": "job_education",			
	"itemname": "求职者学历",			
	"type": "varchar",					
	"maxlength": "11",				
	"isnull": false,					
	"islist": "求职者学历",					
	"default": 0,					
	"fieldget": 1,					
	"fieldset": 1,					
	"novaild": 0,					
	"inputtype":"nesmodal",			
	"attr": " data-comment=如：这是注释" //视图中输入框属性
   },
   {
	"field": "job_experience",			
	"itemname": "求职者经验",			
	"type": "varchar",					
	"maxlength": "11",				
	"isnull": false,					
	"islist": "求职者经验",					
	"default": 0,					
	"fieldget": 1,					
	"fieldset": 1,					
	"novaild": 0,					
	"inputtype":"nesmodal",			
	"attr": " data-comment=如：这是注释" //视图中输入框属性
   },
   {
	"field": "age",			
	"itemname": "年龄",			
	"type": "int",					
	"maxlength": "2",				
	"isnull": false,					
	"islist": "",					
	"default": 0,					
	"fieldget": 1,					
	"fieldset": 1,					
	"novaild": 0,					
	"inputtype":"input",			
	"attr": " type=number data-comment=如：这是注释" //视图中输入框属性
   },
   {
	"field": "classify",			
	"itemname": "职位",			
	"type": "int",					
	"maxlength": "7",				
	"isnull": false,					
	"islist": "职位分类",					
	"default": 0,					
	"fieldget": 1,					
	"fieldset": 1,					
	"novaild": 0,					
	"inputtype":"nesmodal",			
	"attr": " type=text data-comment=如：这是注释" //视图中输入框属性
   },
   {
	"field": "job_salary",			
	"itemname": "职位",			
	"type": "int",					
	"maxlength": "7",				
	"isnull": false,					
	"islist": "期望薪资",					
	"default": 0,					
	"fieldget": 1,					
	"fieldset": 1,					
	"novaild": 0,					
	"inputtype":"nesmodal",			
	"attr": " type=number data-comment=如：这是注释" //视图中输入框属性
   },
   {
	"field": "job_industry",			
	"itemname": "从事行业",			
	"type": "varchar",					
	"maxlength": "128",				
	"isnull": false,					
	"islist": "从事行业",					
	"default": 0,					
	"fieldget": 1,					
	"fieldset": 1,					
	"novaild": 0,					
	"inputtype":"nesmodal",			
	"attr": " type=text data-comment=如：这是注释" //视图中输入框属性
   },
   {
	"field": "job_Nature",			
	"itemname": "工作性质",			
	"type": "varchar",					
	"maxlength": "128",				
	"isnull": false,					
	"islist": "工作性质",					
	"default": 0,					
	"fieldget": 1,					
	"fieldset": 1,					
	"novaild": 0,					
	"inputtype":"nesmodal",			
	"attr": " type=text data-comment=如：这是注释" //视图中输入框属性
   },
   {
	"field": "phone",			
	"itemname": "联系电话",			
	"type": "int",					
	"maxlength": "7",				
	"isnull": false,					
	"islist": "",					
	"default": 0,					
	"fieldget": 1,					
	"fieldset": 1,					
	"novaild": 0,					
	"inputtype":"input",			
	"attr": " type=tell data-comment=如：这是注释" //视图中输入框属性
   }
]
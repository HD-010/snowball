字段设置案例：
{
    "field": "componentid",			//字段标识
    "itemname": "组件id",			//字段名称
    "type": "int",					//数据表中数据类型
	"maxlength": "10",				//字段最大长度
    "isnull": true,					//数据表中是否允许为null
	"islist": 1,					//数据表中值是否为列表
	"default": 0,					//字段默认值
	"fieldget": 1,					//是否采集数据（如果设置1，则在视图输出该字段的输入框；返回之不输出。）
	"fieldset": 1,					//是否写入数据（如果设置1，则在model中获取客户后台客户端采集到的数据，将其保存到数据库中；返回之不保存。）
	"novaild": 1,					//如果为true，对字段不需要特殊字符过滤
	"inputtype":"input",			//输入框类型 input|inputCheckbox|inputRadio|select|textarea|uediter
    "attr": " disabled data-def=4 data-comment=如：这是注释" //视图中输入框属性
  },



//youbang_addoninfos 表字自动填充字段配置信息：
[
  {
    "field": "componentid",			
    "itemname": "组件id",			
    "type": "int",					
	"maxlength": "10",				
    "isnull": true,				
	"islist": 1,					
	"default": 0,					
	"fieldget": 0,					
	"fieldset": 1,	
	"inputtype":"input",	
    "attr": " disabled data-def=4 data-comment=如：这是注释" 
  },
  {
    "field": "title",			
    "itemname": "标题",			
    "type": "varchar",					
	"maxlength": "72",				
    "isnull": false,				
	"islist": 0,					
	"default": '',					
	"fieldget": 0,					
	"fieldset": 1,	
	"inputtype":"input",	
    "attr": " disabled data-def=4 data-comment=标题长度最多15个字符" 
  },
  {
    "field": "litpic",			
    "itemname": "缩略图",			
    "type": "varchar",					
	"maxlength": "255",				
    "isnull": true,				
	"islist": 0,					
	"default": '',					
	"fieldget": 0,					
	"fieldset": 1,	
	"inputtype":"input",	
    "attr": " disabled data-def=4 data-comment=标题长度最多15个字符" 
  },
  {
    "field": "arcrank",
    "itemname": "受权浏览",
    "type": "int",
	"maxlength": "5",
    "isnull": "true",
    "islist": "1",
    "default": "0",
    "fieldget": 0,					
	"fieldset": 1,
	"inputtype":"radio",
    "attr": "type=number checked disabled"
  },
  {
    "field": "mid",
    "itemname": "会员id",
    "type": "int",
	"maxlength": "8",
    "isnull": "true",
    "islist": "1",
    "default": "0",
    "fieldget": 0,					
	"fieldset": 1,
	"inputtype":"input",
    "attr": "type=number disabled "
  },
  {
    "field": "click",
    "itemname": "点击",
    "type": "int",
    "maxlength": "10",
    "isnull": "true",
    "islist": "1",
    "default": "0",
	"fieldget": 0,					
	"fieldset": 1,
	"inputtype":"input",
    "attr": "type=number disabled "
  },
  {
    "field": "userip",
    "itemname": "会员IP",
    "type": "text",
    "maxlength": "15",
    "isnull": "true",
    "islist": "0",
    "default": "0",
	"fieldget": 0,					
	"fieldset": 1,
	"inputtype":"input",
    "attr": "type=text disabled"
  },
  {
    "field": "senddate",
    "itemname": "发布时间",
    "type": "int",
    "maxlength": "10",
    "isnull": "true",
    "islist": "1",
    "default": "0",
	"fieldget": 0,					
	"fieldset": 1,
	"inputtype":"input",
	"attr": "type=datetime"
  },
  {
    "field": "flag",
    "itemname": "推荐属性",
    "type": "checkbox",
    "maxlength": "10",
    "isnull": "true",
    "islist": "1",
    "default": "0",
	"fieldget": 1,					
	"fieldset": 1,
	"inputtype":"checkbox",
    "attr": "type=checkbox data-key=hot-home-recomend data-val=热点-首页-推荐"
  },
  {
    "field": "lastpost",
    "itemname": "最后评论时间",
    "type": "int",
    "maxlength": "10",
    "isnull": "true",
    "islist": "1",
    "default": "0",
	"fieldget": 0,					
	"fieldset": 1,
	"inputtype":"input",
    "attr": "type=datetime disabled"
  },
  {
    "field": "scores",
    "itemname": "评论积分",
    "type": "int",
    "maxlength": "8",
    "isnull": "true",
    "islist": "1",
    "default": "0",
	"fieldget": 1,					
	"fieldset": 1,
	"inputtype":"input",
    "attr": "type=number disabled"
  },
  {
    "field": "goodpost",
    "itemname": "好评数",
    "type": "int",
    "maxlength": "8",
    "isnull": "true",
    "islist": "1",
    "default": "0",
	"fieldget": 1,					
	"fieldset": 1,
	"inputtype":"input",
    "attr": "type=number disabled"
  },
  {
    "field": "badpost",
    "itemname": "差评数",
    "type": "int",
    "maxlength": "8",
    "isnull": "true",
    "islist": "1",
    "default": "0",
	"fieldget": 1,					
	"fieldset": 1,
	"inputtype":"input",
    "attr": "type=number disabled"
  },
  {
    "field": "nativeplace",
    "itemname": "地区",
    "type": "stepselect",
    "maxlength": "250",
    "isnull": "true",
    "islist": "1",
    "default": "0",
	"fieldget": 1,					
	"fieldset": 1,
	"inputtype":"input",
    "attr": "data-key=area1-area2-area3 data-val=城市1-城市2-城市3"
  },
  {
    "field": "infotype",
    "itemname": "信息类型",
    "type": "stepselect",
    "maxlength": "250",
    "isnull": "true",
    "islist": "1",
    "default": "0",
	"fieldget": 1,					
	"fieldset": 1,
	"inputtype":"select",
    "attr": ""
  },
  {
    "field": "body",
    "itemname": "信息内容",
    "type": "htmltext",
    "maxlength": "250",
    "isnull": "true",
    "islist": "0",
    "default": "",
	"fieldget": 1,					
	"fieldset": 1,
	"novaild": 1,
	"inputtype":"uediter",
    "attr": "type=text"
  },
  {
    "field": "endtime",
    "itemname": "截止日期",
    "type": "datetime",
    "maxlength": "250",
    "isnull": "true",
    "islist": "1",
    "default": "",
	"fieldget": 1,					
	"fieldset": 1,
	"inputtype":"input",
    "attr": "type=datetime"
  },
  {
    "field": "tel",
    "itemname": "联系电话",
    "type": "text",
    "maxlength": "50",
    "isnull": "true",
    "islist": "0",
    "default": "",
	"fieldget": 1,					
	"fieldset": 1,
	"inputtype":"input",
    "attr": "type=tel"
  },
  {
    "field": "email",
    "itemname": "电子邮箱",
    "type": "text",
    "maxlength": "50",
    "isnull": "true",
    "islist": "0",
    "default": "",
	"fieldget": 1,					
	"fieldset": 1,
	"inputtype":"input",
    "attr": "type=email"
  },
  {
    "field": "linkman",
    "itemname": "联系人",
    "type": "text",
    "maxlength": "50",
    "isnull": "true",
    "islist": "0",
    "default": "",
	"fieldget": 1,					
	"fieldset": 1,
	"inputtype":"input",
    "attr": "type=text"
  },
  {
    "field": "address",
    "itemname": "地址",
    "type": "text",
    " maxlength": "100",
    "isnull": "true",
    "islist": "0",
    "default": "",
	"fieldget": 1,					
	"fieldset": 1,
	"inputtype":"input",
    "attr": "type=address"
  }
]


youbang_addoncommodities 表数据采集字段：
componentid,arcrank,mid,click,userip,senddate,flag,lastpost,scores,body
youbang_addoninfos 表字自动填充字段配置信息：
[
  {
    "field": "componentid",
    "itemname": "组件id",
    "autofield": "0",
    "notsend": "0",
    "type": "int",
    "isnull": "true",
    "islist": "1",
    "default": "0",
    "maxlength": "10",
    "page": "",
    "attr": " disabled data-def=4 data-comment=如：这是注释"
  },
  {
    "field": "arcrank",
    "itemname": "受权浏览",
    "autofield": "0",
    "notsend": "0",
    "type": "int",
    "isnull": "true",
    "islist": "1",
    "default": "0",
    "maxlength": "5",
    "page": "",
    "attr": "type=number checked disabled"
  },
  {
    "field": "mid",
    "itemname": "会员id",
    "autofield": "0",
    "notsend": "0",
    "type": "int",
    "isnull": "true",
    "islist": "1",
    "default": "0",
    "maxlength": "8",
    "page": "",
    "attr": "type=number disabled "
  },
  {
    "field": "click",
    "itemname": "点击",
    "autofield": "0",
    "notsend": "0",
    "type": "int",
    "isnull": "true",
    "islist": "1",
    "default": "0",
    "maxlength": "10",
    "page": "",
    "attr": "type=number disabled "
  },
  {
    "field": "title",
    "itemname": "标题",
    "autofield": "0",
    "notsend": "0",
    "type": "text",
    "isnull": "true",
    "islist": "1",
    "default": "0",
    "maxlength": "60",
    "page": "",
    "attr": "type='text'"
  },
  {
    "field": "userip",
    "itemname": "会员IP",
    "autofield": "0",
    "notsend": "0",
    "type": "text",
    "isnull": "true",
    "islist": "0",
    "default": "0",
    "maxlength": "15",
    "page": "",
    "attr": "type=text disabled"
  },
  {
    "field": "senddate",
    "itemname": "发布时间",
    "autofield": "0",
    "notsend": "0",
    "type": "int",
    "isnull": "true",
    "islist": "1",
    "default": "0",
    "maxlength": "10",
    "page": "",
    "attr": "type=datetime"
  },
  {
    "field": "flag",
    "itemname": "推荐属性",
    "autofield": "0",
    "notsend": "0",
    "type": "checkbox",
    "isnull": "true",
    "islist": "1",
    "default": "0",
    "maxlength": "10",
    "page": "",
    "attr": "type=checkbox data-key=hot-home-recomend data-val=热点-首页-推荐"
  },
]
/*
 Navicat Premium Data Transfer

 Source Server         : 本地mariadb
 Source Server Type    : MariaDB
 Source Server Version : 100038
 Source Host           : localhost:3306
 Source Schema         : youbang

 Target Server Type    : MariaDB
 Target Server Version : 100038
 File Encoding         : 65001

 Date: 26/08/2019 14:56:53
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `age` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

INSERT INTO `test` VALUES (1, '小明', 99);
INSERT INTO `test` VALUES (2, '小明', 99);
INSERT INTO `test` VALUES (3, '小明', 99);
INSERT INTO `test` VALUES (4, '阿红', 18);
INSERT INTO `test` VALUES (5, '阿红', 99);
INSERT INTO `test` VALUES (6, '阿je ', 22);
INSERT INTO `test` VALUES (7, '阿kj ', 22);
INSERT INTO `test` VALUES (8, '阿kj ', 22);
INSERT INTO `test` VALUES (9, '江颜', 22);

-- ----------------------------
-- Table structure for youbang_acount_member
-- ----------------------------
DROP TABLE IF EXISTS `youbang_acount_member`;
CREATE TABLE `youbang_acount_member`  (
  `mid` int(11) NULL DEFAULT NULL,
  `realname` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真名',
  `tel` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `openid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信openid',
  `addTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '建立时间',
  `nickname` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `credit1` tinyint(11) NULL DEFAULT NULL COMMENT '积分',
  `credit2` tinyint(11) NULL DEFAULT NULL COMMENT '余额',
  `face` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `gender` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别 0男1女',
  `levelid` int(11) NULL DEFAULT 0 COMMENT '用户级别 用户等级表里的 id 值',
  `weixin` tinyint(11) NULL DEFAULT NULL COMMENT '微信',
  `status` tinyint(2) NULL DEFAULT NULL COMMENT '状态 0 没有审核 1 已经审核',
  `province` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '	省',
  `city` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '市',
  `area` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区',
  `
corporatename` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司名称',
  `identification` enum('1','2') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标识 1代表个人注册2标识是公司注册',
  `position` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职务',
  `onlien` tinyint(4) NULL DEFAULT NULL COMMENT '1在线0未在线'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for youbang_addonadv
-- ----------------------------
DROP TABLE IF EXISTS `youbang_addonadv`;
CREATE TABLE `youbang_addonadv`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `topid` int(11) NULL DEFAULT 0,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '广告名称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '广告内容（图片链接或文本）',
  `link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '跳转链接',
  `isdel` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是不删除，１已经删除',
  `effectivetime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'vip生效时间',
  `expirationtime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'vip过期时间',
  `advtype` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '广告类型',
  `enable` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否启用 0关闭 1启用',
  `flag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'h' COMMENT '广告位置',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of youbang_addonadv
-- ----------------------------
INSERT INTO `youbang_addonadv` VALUES (1, 0, '轮番广告', '轮播描述详情', '/uploads/banner.png', 'http://www.baidu.com', '0', '2019-05-05 18:07:31', '2019-05-05 18:07:31', '3', '1', 'h');
INSERT INTO `youbang_addonadv` VALUES (2, 1, '轮番广告', '轮播描述详情', '/uploads/banner1.png', 'http://www.baidu.com', '0', '2019-05-05 18:07:31', '2019-05-05 18:07:31', '3', '1', 'h');
INSERT INTO `youbang_addonadv` VALUES (3, 1, '轮番广告', '轮播描述详情', '/uploads/banner2.png', 'http://www.baidu.com', '0', '2019-05-05 18:07:31', '2019-05-05 18:07:31', '3', '1', 'h');
INSERT INTO `youbang_addonadv` VALUES (4, 0, '图片广告', '广告详情', '/uploads/banner2.png', 'http://www.baidu.com', '0', '2019-07-27 10:04:28', '2019-07-27 10:04:28', '2', '1', 'h');
INSERT INTO `youbang_addonadv` VALUES (5, 0, '某某公告', '公告详情', NULL, 'http://www.baidu.com', '0', '2019-07-27 10:06:11', '2019-07-27 10:06:11', '1', '1', 'h');

-- ----------------------------
-- Table structure for youbang_addonarticle
-- ----------------------------
DROP TABLE IF EXISTS `youbang_addonarticle`;
CREATE TABLE `youbang_addonarticle`  (
  `aid` bigint(13) UNSIGNED NOT NULL DEFAULT 0,
  `typeid` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `body` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `redirecturl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `templet` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `userip` char(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`aid`) USING BTREE,
  INDEX `typeid`(`typeid`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of youbang_addonarticle
-- ----------------------------
INSERT INTO `youbang_addonarticle` VALUES (1, 2, '<p>HTML 4.0的新特性之一是使HTML事件触发浏览器中的行为，比方说当用户点击一个HTML元素时启动一段JavaScript。以下就是可被插入HTML标签以定义事件行为的一系列属性。</p><p>假如你希望学习如何使用这些事件进行编程，那么你应该学习我们的JavaScript教程和DHTML教程。</p><h3>窗口事件 (Window Events)</h3><p>仅在body和frameset元素中有效。</p><table width=\"100%\"><tbody><tr><th width=\"25%\">属性</th><th width=\"15%\">值</th><th width=\"60%\">描述</th></tr><tr><td>onload</td><td>脚本</td><td>当文档被载入时执行脚本</td></tr><tr><td>onunload</td><td>脚本</td><td>当文档被卸下时执行脚本</td></tr></tbody></table><h3>表单元素事件 (Form Element Events)</h3><p>仅在表单元素中有效。</p><table width=\"100%\"><tbody><tr><th width=\"25%\">属性</th><th width=\"15%\">值</th><th width=\"60%\">描述</th></tr><tr><td>onchange</td><td>脚本</td><td>当元素改变时执行脚本</td></tr><tr><td>onsubmit</td><td>脚本</td><td>当表单被提交时执行脚本</td></tr><tr><td>onreset</td><td>脚本</td><td>当表单被重置时执行脚本</td></tr><tr><td>onselect</td><td>脚本</td><td>当元素被选取时执行脚本</td></tr><tr><td>onblur</td><td>脚本</td><td>当元素失去焦点时执行脚本</td></tr><tr><td>onfocus</td><td>脚本</td><td>当元素获得焦点时执行脚本</td></tr></tbody></table><h3>键盘事件 (Keyboard Events)</h3><p>在下列元素中无效：base, bdo, br, frame, frameset, head, html, iframe, meta, param, script, style, and title elements.</p><table width=\"100%\"><tbody><tr><th width=\"25%\">属性</th><th width=\"15%\">值</th><th width=\"60%\">描述</th></tr><tr><td>onkeydown</td><td>脚本</td><td>当键盘被按下时执行脚本</td></tr><tr><td>onkeypress</td><td>脚本</td><td>当键盘被按下后又松开时执行脚本</td></tr><tr><td>onkeyup</td><td>脚本</td><td>当键盘被松开时执行脚本</td></tr></tbody></table><h3>鼠标事件 (Keyboard Events)</h3><p>在下列元素中无效：base, bdo, br, frame, frameset, head, html, iframe, meta, param, script, style, title elements.</p><table width=\"100%\"><tbody><tr><th width=\"25%\">属性</th><th width=\"15%\">值</th><th width=\"60%\">描述</th></tr><tr><td>onclick</td><td>脚本</td><td>当鼠标被单击时执行脚本</td></tr><tr><td>ondblclick</td><td>脚本</td><td>当鼠标被双击时执行脚本</td></tr><tr><td>onmousedown</td><td>脚本</td><td>当鼠标按钮被松开时执行脚本</td></tr><tr><td>onmousemove</td><td>脚本</td><td>当鼠标指针移动时执行脚本</td></tr><tr><td>onmouseout</td><td>脚本</td><td>当鼠标指针移出某元素时执行脚本</td></tr><tr><td>onmouseover</td><td>脚本</td><td>当鼠标指针悬停于某元素之上时执行脚本</td></tr><tr><td>onmouseup</td><td>脚本</td><td>当鼠标按钮被松开时执行脚本</td></tr></tbody></table>\r\n            <p align=\"center\"> </p>', '', '', '');
INSERT INTO `youbang_addonarticle` VALUES (2, 2, '　一段时间以来，发现有很多人XHTML都不会用，不光是普通的初学者，有的程序员都不是很清楚该怎么写这个XHTML，我这里呢算是把一些常见的应用问题做一个总结，也算能使得大家能在沟通，合作上能形成默契。<br /><br />　　XHTML里有很多的标签，但是经常用到的也就是那么几个，也只要掌握这几个也就可以了。下面我们一一列举：div,p,span,ul,li,dl,dt,dd,a,img,h,strong,em<br /><br />　　div&nbsp;在我的脑子里我一直把他想作是一个瓶子或是箱子，我的感觉它挺硬的。这个div没有什么特性的意义，可以使用在很多地方，也就是说他可以装不同的东西。他的正确的写法是<div></div>必需要有封口。大家都用来做布局之用，也有用来作为存放文章形成段落，实际上，这个做法并不是很好，因为作为文章的分段自然有一个特定的标签来用。那就是下面要讲的<p></p>标签，不过用DIV来再整体的包住所有的段落。这是非常实用的。<br /><br />　　p&nbsp;这是一个有特定语义的标签，表示段落，是用来区分段落的。在大部分的浏览器中对P基本上都有一个上下的边距。但是没有行首缩进，因为行首缩进只是表示段落的方式但是不是一定或是必需的。所以在用P标签的时候如果需要可以针对P设定一下行首缩进，我是推荐在文章以外的地方不要使用P，因为P是有一定语义的，如果用在别的地方恐不合适。正确的写法是<p></p><br /><br />　　span&nbsp;这也是一个非常常用的标签，这个标签可以说与div很像，没有什么特定的意义，只是他是一个级联元素，不是块级元素。我一直把它看作是一个袋子，他不像箱子那样可以有自己的宽高，他的宽高只能随着内容的多少而定，所以很像是袋子。这个标签与div正好互补。<br /><br />　　ul,li&nbsp;这是一个列表，在列表中，除了UL还OL，不过我觉得OL有点像是鸡肋。因为UL通过CSS定义一样可以有OL的数字排序效果。所以一般我不推荐使用OL，有UL就可以了。UL是块级的，他的子级li也是块级标签。正确的写法是<ul><li>< /li></ul>&nbsp;LI标签是被UL标签包裹的，在UL标签里可以有无数个LI标签，LI标签不能独立使用。并且LI标签一定要封口，这不光是美观问题，对于后期的维护也很有好处。很多程序员都不喜欢把这个LI封口。UL列表的用处主要是列举出一维的，同一类型的数据。具体的比如使用在菜单上，文章中列数的一些条例等等。在列表中有一种特别的形式与UL是不一样的。那就是下面的DL<br /><br />　　dl,dt,dd&nbsp;这是一个很特别的三个标签的组合。这里的DT是指标题，DD是指内容。DL是包课他们的容器。正确的写法是<dl><dt>< /dt><dd></dd></dl>在DL里可以有很多组的DT，DD，当出现很多组的时候尽量是一个DT 配一个DD，如果DD中内容很多，可以在DD里加P标签配合使用。DL列表是一个非常好的列表形式，可以多加利用。<br /><br />　　a&nbsp;这表示链接，是一个特定属性的，也是网页中最为神奇的标签。因为它才让无数的网页都连在了一起。正确的写法是：<a&nbsp;href=\"\"&nbsp;title=\"\"> </a>其中的href是表示目标地址，TITLE是鼠标悬停提示文字，这是可有可无的。但是有必是利大于无。<br /><br />　　img&nbsp; 这是图片标签，也是个特定属性的标签。正常写法是：<img&nbsp;src=\"\"&nbsp;alt=\"\"&nbsp;title=\"\"/>&nbsp;这里的src是目标地址， ALT与TITLE是替换文字，ALT是&nbsp;IE特定的，TITLE是其它浏览器的通用的。不过记得后面的反斜线那是一定要有的。<br /><br />　　H&nbsp; 这是一个系列的标签，从H1到H6，一共六个，有人说太少了，有人说正好用，有人说用不了这么多。反正我是觉得差不多。正确写法是：<h> </h>主要是用来存放标题，也有一些朋友用来作它用拿来作其它用处，个人觉得这个标签还是让他安生一点，就让他做标题的作用。这六个标签之间最好不要出现什么相互包含的事。<br /><br />　　strong&nbsp;这个意思是着重，这是有语义的，作用也很简单。至于样工，是加粗着重，还是用色彩表明着重，那都是自行选择。正确的写法是<strong></strong><br /><br />　　em&nbsp;这个与strong很像，是表示强调。一般浏览器的默认值是斜体。使用方式与strong一样。写法是：<em></em><br /><br />　　这里没有说表单，因为表单基本上没有什么变化，也没什么可特别说的。\r\n            <p align=\"center\"> </p>', '', '', '');
INSERT INTO `youbang_addonarticle` VALUES (3, 2, '<p>你认为已经知道怎么制做表格了吧。当然，你已经了解 table、tr、td和th标签了，甚至还在你的口袋里装入了rowspan和colspan。你确实可以制做一个精美小巧的咖啡色三合板桌子（表格），但难道你不想做一个优雅稳固，上面有玻璃的，足以承受一头大笨象的宴会桌（表格）？</p><p><strong>列反罢工</strong></p><p>表格行简直使表格列看起来很愚蠢。同样的工作，表格由行与行构建，让列感到十分沮丧。</p><p>但是很幸运，colgroup和col标签来拯救热心的列了。</p><p>这两个标签允许你定义表格列和尽你所需地样式化它们，对于你需要把列排成行或不同着色特别有用，如果没有它们，你需要样式化每一个单独的单元格。</p><p>这是一个使用这些标签的例子：</p><p class=\"code\"><table><br /><colgroup> <col /> <col class=\"alternate\" /> <col /> </colgroup><br /><tr><br /><td>This</td><br /><td>That</td><br /><td>The other</td><br /></tr><br /><tr><br /><td>Ladybird</td><br /><td>Locust</td><br /><td>Lunch</td><br /></tr><br /></table> </p><p>alternate类的样式将被应用到第二列，或者说每一行的第二个单元格。</p><p>你当然可以在colgroup或者col上使用span属性，跟rowspan和colspan有相似的用途</p><p>colgroup一起使用可以定义属于列组的行数，比如<colgroup span=\"2\"></colgroup>会组合头两列。当在colgroup使用span时，不应该再使用col标签。</p><p>在col里使用span是更明智的，可以，比如，应用在上述例子像这样：</p><p class=\"code\"><table><br /><colgroup> <col /> <col span=\"2\" class=\"alternate\" /> </colgroup><br />&nbsp;... </p><p>这将把alternate类应用到最后两列。</p><p><strong>注意</strong></p><p>哦，但是可能有一个陷井，不是吗？那就是：你仅能样式化列的是边框、背景、宽度和可见性。</p><p>Internet Explorer在这方面看起来比其他浏览器表现更好因为它装载有漂亮的CSS属性比如 color，但是，正如结果一样，这是因为它疯狂古怪的行为而已。这种奇特的异常可以让Ian Hixie来解释。</p><p><strong>摘要和说明插曲</strong></p><p>一个简要和容易的提高易用性的思考是，总是为表格应用摘要和说明。</p><p>摘要可以在表格起始标签table中用summary属性应用到表格中。这不会显示，但可以辅助非可视化的表格表现。</p><p>caption标签在起始标签table后直接定义说明。它默认直接在表格顶端出现，但可以在CSS属性caption-side中设置top、right、bottom或者left值，尽管IE不会在意。</p><p class=\"code\"><table summary=\"The mating habits of locust, showing how many use protection and how many have a cigarette afterwards\"><br /><caption>Locust mating habits</caption><br />... </p><p><strong>表头、表注和滚动表格的探讨</strong></p><p>thead、tfoot和tbody允许你把表格分为表头、表注和表格主体。对于大表格尤其有用，在打印的时候，表头和表注应该会在每一页都出现。</p><p>这些元素必须按thead-tfoot-tbody的顺序定义，像这样：</p><p class=\"code\"><table><br /><thead><br /><tr><br /><td>Header 1</td><br /><td>Header 2</td><br /><td>Header 3</td><br /></tr><br /></thead><br /><tfoot><br /><tr><br /><td>Footer 1</td><br /><td>Footer 2</td><br /><td>Footer 3</td><br /></tr><br /></tfoot><br /><tbody><br /><tr><br /><td>Cell 1</td><br /><td>Cell 2</td><br /><td>Cell 3</td><br /></tr><br />&nbsp;... <br /></tbody><br /></table> </p><p>你可以让表格主体tbody在基于Gecko的浏览器（Mozilla、Firefox和Netscape 6+等）滚动，通过应用overflow: auto; max-height: [whatever] 的样式。然后你可以看见表头和表注固定，而表的主体右边有滚动条。你应该谨慎使用max-height属性因为IE不认识，比较安全的做法是使用 height属性，IE将为它应用到每一行。</p><p>注意：说回浏览器的差异，目前IE遇到表头和表注时还是没有什么线索，尽管还是当作表格来处理，但打印的时候不会在哦每一页都出现表头和表注，只孤零零地传递滚动的表格。</p><p><strong>注意</strong></p><p>谨慎对待滚动表格。尽管它们提供十分有用的目的，大部分用户不习惯它们并且认为线性数据是唯一的。</p>\r\n            <p align=\"center\"> </p>', '', '', '');
INSERT INTO `youbang_addonarticle` VALUES (4, 2, '<p><strong>结构</strong></p><p>＜html＞<br />＜head＞<br />＜title＞标题＜title＞<br />＜/head＞<br />＜body＞..........文件内容..........<br />＜/body＞<br />＜/html＞<br />1.文件标题<br />＜title＞..........＜/title＞<br />2.文件更新--＜meta＞<br />　【1】10秒后自动更新一次<br />　　＜meta http-equiv=\"refresh\" content=10＞<br />　【2】10秒後自动连结到另一文件<br />　　＜meta http-equiv=\"refresh\" content=\"10；URL=欲连结文件之URL\"＞<br />3.查询用表单--＜isindex><br />　　　若欲设定查询栏位前的提示文字：<br />　　＜isindex prompt=\"提示文字\"＞<br />4.预设的基准路径--＜base><br />&nbsp;&nbsp; ＜base href=\"放置文件的主机之URL\"＞</p><p><strong>版面</strong></p><p>1.标题文字 ＜h#＞..........＜/h#＞ #=1~6；h1为最大字，h6为最小字<br />2.字体变化 ＜font＞..........＜/font＞ <br />【1】字体大小 ＜font size=#＞..........＜/font＞ #=1~7；数字愈大字也愈大 <br />【2】指定字型 ＜font face=\"字型名称\"＞..........＜/font＞ <br />【3】文字颜色 ＜font color=#rrggbb＞..........＜/font＞ rr：表红色（red）色码 gg：表绿色（green）色码 bb：表蓝色（blue）色码<br />3.显示小字体 ＜small＞..........＜/small＞ <br />4.显示大字体 ＜big＞..........＜/big＞<br />5.粗体字 ＜b＞..........＜/b＞<br />6.斜体字 ＜i＞..........＜/i＞ <br />7.打字机字体 ＜tt＞..........＜/tt＞<br />8.底线 ＜u＞..........＜/u＞<br />9.删除线 ＜strike＞..........＜/strike＞<br />10.下标字 ＜sub＞..........＜/sub＞<br />11.上标字 ＜sup>..........＜/sup＞<br />12.文字闪烁效果 ＜blink＞..........＜/blink＞<br />13.换行 ＜br＞<br />14.分段 ＜p＞ <br />15. 文字的对齐方向 ＜p align=\"#\"＞ #号可为 left：表向左对齐（预设值） center：表向中对齐 right：表向右对齐 P.S.＜p align=\"#\"＞之後的文字都会以所设的对齐方式显示， 直到出现另一个＜p align=\"#\"＞改变其对齐方向，或遇到＜hr＞?＜h#＞标签时会自动设回预设的向左对齐。<br />16.分隔线 ＜hr＞ <br />【1】分隔线的粗细 ＜hr size=点数＞ <br />【2】分隔线的宽度 ＜hr size=点数或百分比＞ <br />【3】分隔线对齐方向 ＜hr align=\"#\"＞ #号可为 left：表向左对齐（预设值） center：表向中对齐 right：表向右对齐 <br />【4】分隔线的颜色 ＜hr color=#rrggbb＞ <br />【5】实心分隔线 ＜hr noshade＞<br />17.向中对齐 ＜center＞..........＜/center＞<br />18.依原始样式显示 ＜pre＞..........＜/pre＞<br />19.＜body＞指令的属性 <br />【1】背景颜色 -- bgcolor ＜body bgcolor=#rrggbb＞ <br />【2】背景图案 -- background ＜body background=\"图形文件名\"＞ <br />【3】设定背景图案不会卷动 -- bgproperties ＜body bgproperties=fixed＞ <br />【4】文件内容文字的颜色 -- text ＜body text=#rrggbb＞ <br />【5】超连结文字颜色 -- link ＜body link=#rrggbb＞ <br />【6】正被选取的超连结文字颜色 -- vlink ＜body vlink=#rrggbb＞ <br />【7】已连结过的超连结文字颜色 -- alink ＜body alink=#rrggbb＞<br />20.注解 ＜!--..........--＞21.特殊字元表示法 <br />符 号 　　语 法&nbsp; <br />＜&nbsp; 　　　＆ｌｔ&nbsp; <br />＞&nbsp; 　　　＆ｇｔ&nbsp; <br />& 　　 　＆ａｍｐ&nbsp; <br />\"&nbsp; 　　　＆ｑｕｏｔ&nbsp; <br />空白&nbsp; 　　＆ｎｂｓｐ</p><p><strong>图片</strong></p><p>1.插入图片 ＜img src=\"图形文件名\"＞<br />2.设定图框 -- border ＜img src=\"图形文件名\" border=点数＞<br />3.设定图形大小 -- width?height ＜img src=\"图形文件名\" width=宽度点数 height=高度点数＞<br />4.设定图形上下左右留空 -- vspace?hspace ＜img src=\"图形文件名\" vspace=上下留空点数 hspace=左右留空点数＞<br />5.图形附注 ＜img src=\"图形文件名\" alt=\"说明文字\"＞<br />6.预载图片<br />＜img src=\"高解析度图形文件名\" lowsrc=\"低解析度图形文件名\"＞ P.S.两个图的图形大小最好一致<br />7.影像地图（Image Map） ＜img src=\"图形文件名\" usemap=\"#图的名称\"＞ ＜map name=\"图的名称\"＞<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ＜area shape=形状 coords=区域座标列表 href=\"连结点之URL\"＞<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ＜area shape=形状 coords=区域座标列表 href=\"连结点之URL\"＞<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ＜area shape=形状 coords=区域座标列表 href=\"连结点之URL\"＞<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ＜area shape=形状 coords=区域座标列表 href=\"连结点之URL\"＞&nbsp;&nbsp;&nbsp; ＜/map＞&nbsp;&nbsp;&nbsp; <br />【1】定义形状 -- shape<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; shape=rect：矩形&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; shape=circle：圆形&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; shape=poly：多边形&nbsp;&nbsp;&nbsp; <br />【2】定义区域 -- coords<br />a.矩形：必须使用四个数字，前两个数字为左上角座标，后两个数字为右下角座标<br />例：＜area shape=rect coords=100,50,200,75 href=\"URL\"＞<br />b.圆形：必须使用三个数字，前两个数字为圆心的座标，最后一个数字为半径长度<br />例：＜area shape=circle coords=85,155,30 href=\"URL\"＞<br />c.任意图形（多边形）：将图形之每一转折点座标依序填入<br />例：＜area shape=poly coords=232,70,285,70,300,90,250,90,200,78 href=\"URL\"＞</p><p><strong>表格</strong></p><p>1.定义表格 ＜table＞..........＜/table＞ <br />【1】设定边框的厚度 -- border<br />＜table border=点数＞ <br />【2】设定格线的宽度 -- cellspacing<br />＜table cellspacing=点数＞ <br />【3】设定资料与格线的距离 -- cellpadding<br />＜table cellpadding=点数＞ <br />【4】调整表格宽度 -- width<br />＜table width=点数或百分比＞ <br />【5】调整表格高度 -- height<br />＜table height=点数或百分比＞ <br />【6】设定表格背景色彩 -- bgcolor<br />＜table bgcolor=#rrggbb＞ <br />【7】设定表格边框色彩 -- bordercolor<br />＜table bordercolor=#rrggbb＞<br />2.显示格线 ＜table border＞<br />3.表格标题<br />＜caption＞..........＜/caption＞ <br />表格标题位置 -- align<br />＜caption align=\"#\"＞ #号可为 top：表标题置于表格上方（预设值）<br />bottom：表标题置于表格下方<br />4.定义列 ＜tr＞<br />5.定义栏位 《1》＜td＞：靠左对齐<br />《2》＜th＞：靠中对齐?粗体 <br />【1】水平位置 -- align ＜th align=\"#\"＞<br />#号可为 left：向左对齐<br />center：向中对齐 right：向右对齐<br />【2】垂直位置 -- align ＜th align=\"#\"＞ #号可为<br />top：向上对齐 middle：向中对齐<br />bottom：向下对齐 <br />【3】栏位宽度 -- width<br />＜th width=点数或百分比＞ <br />【4】栏位垂直合并 -- rowspan<br />＜th rowspan=欲合并栏位数＞ <br />【5】栏位横向合并 -- colspan<br />＜th colspan=欲合并栏位数＞</p><p><strong>清单</strong></p><p>一、目录式清单 <br />＜dir＞ ＜li＞项目1 ＜li＞项目2 ＜li＞项目3 ＜/dir＞ P.S.目录式清单每一个项目不能超过20个字元（即10个中文字）<br />二、选项式清单 ＜menu＞ ＜li＞项目1 ＜li＞项目2 ＜li＞项目3 ＜/menu＞<br />三、有序号的清单 ＜ol＞ ＜li＞项目1 ＜li＞项目2 ＜li＞项目3 ＜/ol＞ <br />【1】序号形式 -- type ＜ol type=#＞或＜li type=#＞ #号可为 A：表以大写英文字母A?B?C?D...做为项目编号 a：表以小写英文字母a?b?c?d...做为项目编号 I：表以大写罗马数字做为项目编号 i：表以小写罗马数字做为项目编号 1：表以阿拉伯数字做为项目编号（预设值） <br />【2】起始数字 -- start ＜ol start=欲开始计数的序数＞ <br />【3】指定编号 -- value ＜li value=欲指定的序数＞<br />四、无序号的清单 ＜ul＞ ＜li＞项目1 ＜li＞项目2 ＜li＞项目3 ＜/ul＞ <br />【1】项目符号形式 -- type ＜ul type=#＞或＜li type=#＞ #号可为 disc：实心圆点（预设值） circle：空心圆点 square：实心方块 <br />【2】原始清单 -- plain ＜ul plain＞ <br />【3】清单排列方式 -- warp 《1》清单垂直排列 ＜ul warp = vert＞ 《2》清单水平排列 ＜ul warp = horiz＞<br />五、定义式清单 ＜dl＞ ＜dt＞项目1 ＜dd＞项目1说明 ＜dt＞项目2 ＜dd＞项目2说明 ＜dt＞项目3 ＜dd＞项目3说明 ＜/dl＞ <br />紧密排列 -- compact ＜dl compact＞ P.S.如此可使＜dt＞的内容与＜dd＞的内容在同一行，仅 以数格空白相隔而不换行，但若＜dt＞的文字超过一 定的长度后，compact的作用就消失了！</p><p><strong>表单</strong></p><p>一、基本架构 ＜form action=\"处理资料用的CGI程式之URL\"或\"mailto:电子信箱的URL\" method=\"get或post\"＞ .......... .......... .......... ＜/form＞ <br />二、输入文件型表单 ＜form action=\"URL\" method=\"post\"＞ ＜input＞ ＜input＞ .......... .......... ＜/form＞ <br />【1】栏位类型 -- type ＜input type=#＞ #号可为 text：文字输入 password：密码 checkbox：多选钮 radio：单选钮 submit：接受按钮 reset：重设按钮 image：图形钮 hidden：隐藏栏位 <br />【2】栏位名称 -- name ＜input name=\"资料栏名\"＞ P.S.若type为submit?reset则name不必设定 <br />【3】文件上的预设值 -- value ＜input value=\"预设之字串\"＞ <br />【4】设定栏位的宽度 -- size ＜input size=字元数＞ <br />【5】限制最大输入字串的长度 -- maxlength ＜input maxlength=字元数＞ <br />【6】预设checkbox或radio的初值 -- checked ＜input type=checkbox checked＞ ＜input type=radio checked＞ <br />【7】指定图形的URL -- src ＜input type=image src=\"图档名\"＞ <br />【8】图文对齐 -- align ＜input type=image align=\"#\"＞ #号可为 top：文字对齐图片之顶端 middle：文字对齐图片之中间 buttom：文字对齐图片之底部<br />三、选择式表单 ＜form action=\"URL\" method=\"post\"＞ ＜select＞ ＜option＞ ＜option＞ .......... .......... ＜/select＞ ＜/form＞ <br />A、＜select＞的属性 <br />【1】栏位名称 -- name ＜select name=\"资料栏位名\"＞ <br />【2】设定显示的选项数 -- size ＜select size=个数＞ <br />【3】多重选项 -- multiple ＜select multiple＞ <br />B、＜option＞的属性 <br />【1】定义选项的传回值 -- value ＜option value=\"传回值\"＞ <br />【2】预先选取的选项 -- selected ＜option selected＞<br />四、多列输入文字区表单 ＜form action=\"URL\" method=\"post\"＞ ＜textarea＞ .......... .......... ＜/textarea＞ ＜/form＞ <br />【1】文字区的变数名称 -- name ＜textarea name=变数名称＞ <br />【2】设定文字输入区宽度 -- cols ＜textarea cols=字元数＞ <br />【3】设定文字输入区高度 -- rows ＜textarea rows=列数＞ <br />【4】输入区设定预设字串 ＜textarea＞ 预设文字 ＜/textarea＞ <br />【5】自动换行与否 -- wrap ＜textarea wrap=#＞ #号可为 off：表输入的文字超过栏宽时，不会自动换行（预设值） virtual：表输入的文字在超过栏宽时会自动换行</p><p><strong>链接</strong></p><p>一、连结至其他文件 ＜a href=\"URL\"＞说明文字或图片＜/a＞</p><p>二、连结至文件内之某一处（外部连结） </p><p>《1》起点<br />＜a href=\"档名#名称\"＞..........＜/a＞ <br />《2》终点 ＜a name=\"名称\"＞</p><p>三、frame的超连结 </p><p>【1】开启新的浏览器来显示连结文件 -- _blank ＜a href=\"URL\" target=_blank＞<br />【2】显示连结文件於目前的frame -- _self ＜a href=\"URL\" target=_self＞<br />【3】以上一层的分割视窗显示连结文件 -- _parent ＜a href=\"URL\" target=_parent＞<br />【4】以全视窗显示连结文件 -- _top ＜a href=\"URL\" target=_top＞ <br />【5】以特定视窗显示连结文件 --＜a href=\"URL\" target=\"特定视窗名称\"＞</p><p><strong>FRAME</strong></p><p>一、分割视窗指令 ＜frameset＞..........＜/frameset＞ <br />【1】垂直（上下）分割 -- rows<br />＜frameset rows=#＞ #号可为点数：如欲分割为100,200,300三个视窗，则<br />＜frameset rows=100,200,300＞；亦可以*号代表，如＜frameset rows=*,500,*＞<br />百分比：如＜frameset rows=30%,70%＞，各 项总和最好为100%<br />【2】水平（左右）分割 -- cols ＜frameset cols=点数或百分比＞<br />二?指定视窗内容 -- ＜frame＞<br />＜frameset cols=30%,70%＞&nbsp;&nbsp;&nbsp; ＜frame＞&nbsp;&nbsp;&nbsp; ＜frame＞ ＜/frameset＞<br />【1】指定视窗的文件名称 -- src ＜frame src=HTML档名＞ <br />【2】定义视窗的名称 -- name<br />＜frame name=视窗名称＞ <br />【3】设定文件与上下边框的距离 -- marginheight<br />＜frame marginheight=点数＞ <br />【4】设定文件与左右边框的距离 -- marginwidth<br />＜frame marginwidth=点数＞ <br />【5】设定分割视窗卷轴 -- scrolling<br />＜frame scrolling=#＞ #号可为 yes：固定出现卷轴<br />no：不出现卷轴 auto：自动判断文件大小需不需要卷轴（预设值）<br />【6】锁住分割视窗的大小 -- noresize ＜frame noresize＞</p>\r\n            <p align=\"center\"> </p>', '', '', '');
INSERT INTO `youbang_addonarticle` VALUES (5, 2, '<p>说实话，无论是asp,php还是jsp进行网络编程的时候，都离不开和用户的交互。</p><p>而人机对话的平台，基本上是靠相应的文本、列表框进行输入，然后通过按钮提交送至数据库的。</p><p>所以学习网络编程就一定要了解这些输入平台相关的东西：表单（form）其基本格式如下：</p><p class=\"code\"><form name=\"form1\" action=\"xxx.asp\" method=\"post\"><br /><input type=\"text\" name=\"yourname\"><br /><select name=\"selectwhat\"><br />&nbsp;<option>aaa</option><br />&nbsp;<option>aaa</option><br /></select><br /><textarea name=\"textinit\" rows=5 cols=10></textarea><br /></form></p><p>可以总结出：表单即包括<form>...</form>之内的相关内容。</p><p>其中内部可以分三大类：input，select，textarea</p><p><strong>一，首先看<form>内部参数</strong></p><p>参数name：用来表示该表单的唯一名称，方便一个页面建立多个表单而不混淆，当然更是为了接受页面的确认关系。</p><p>参数action：显而易见，是表示当前的表单中所有内容将送交某个页面去处理。处理包括接受信息，数据库比较，添加，修改等。</p><p>参数method：即表单的提交方法，含两种方法：post和get。post是传输信息内容，get是传输url值，具体用法将会在下一节“内置对象request”中介绍到</p><p><strong>二，再来看Input相关</strong></p><p>Input表示Form表单中的一种输入对象，其又随Type类型的不同而分文本输入框，密码输入框，单选/复选框，提交/重置按钮等，下面一一介绍。</p><p>1，type=text</p><p>输入类型是text，这是我们见的最多也是使用最多的，比如登陆输入用户名，注册输入电话号码，电子邮件，家庭住址等等。当然这也是Input的默认类型。</p><p>参数name：同样是表示的该文本输入框名称。</p><p>参数size：输入框的长度大小。</p><p>参数maxlength：输入框中允许输入字符的最大数。</p><p>参数value：输入框中的默认值</p><p>特殊参数readonly：表示该框中只能显示，不能添加修改。</p><p class=\"code\"><form><br />your name:<br /><input type=\"text\" name=\"yourname\" size=\"30\" maxlength=\"20\" value=\"输入框的长度为30，允许最大字符数为20\"><br><br /><input type=\"text\" name=\"yourname\" size=\"30\" maxlength=\"20\" readonly value=\"你只能读不能修改\"><br /></form></p><p>2，type=password</p><p>不用我说，一看就明白的密码输入框，最大的区别就是当在此输入框输入信息时显示为保密字符。</p><p>参数和“type=text”相类似。</p><p class=\"code\"><form><br />your password:<br /><input type=\"password\" name=\"yourpwd\" size=\"20\" maxlength=\"15\" value=\"123456\">密码长度小于15<br /></form></p><p>3，type=file</p><p>当你在BBS上传图片，在EMAIL中上传附件时一定少不了的东西：）</p><p>提供了一个文件目录输入的平台，参数有name，size。</p><p class=\"code\"><form><br />your file:<br /><input type=\"file\" name=\"yourfile\" size=\"30\"><br /></form></p><p>4，type=hidden</p><p>非常值得注意的一个，通常称为隐藏域：如果一个非常重要的信息需要被提交到下一页，但又不能或者无法明示的时候。</p><p>一句话，你在页面中是看不到hidden在哪里。最有用的是hidden的值。</p><p class=\"code\"><form name=\"form1\"><br />your hidden info here:<br /><input type=\"hidden\" name=\"yourhiddeninfo\" value=\"webjx.com\"><br /></form><br /><script><br />alert(\"隐藏域的值是 \"+document.form1.yourhiddeninfo.value)<br /></script></p><p>5，type=button</p><p>标准的一windows风格的按钮，当然要让按钮跳转到某个页面上还需要加入写JavaScript代码</p><p class=\"code\"><form name=\"form1\"><br />your button:<br /><input type=\"button\" name=\"yourhiddeninfo\" value=\"Go，Go，Go！\" onclick=\"window.open(\'http://www.webjx.com\')\"><br /></form></p><p>6，type=checkbox</p><p>多选框，常见于注册时选择爱好、性格、等信息。参数有name,value及特别参数checked（表示默认选择）</p><p>其实最重要的还是value值，提交到处理页的也就是value。（附：name值可以不一样，但不推荐。）</p><p class=\"code\"><form name=\"form1\"><br />a:<input type=\"checkbox\" name=\"checkit\" value=\"a\" checked><br><br />b:<input type=\"checkbox\" name=\"checkit\" value=\"b\"><br><br />c:<input type=\"checkbox\" name=\"checkit\" value=\"c\"><br><br /></form><br />name值可以不一样，但不推荐<br><br /><form name=\"form1\"><br />a:<input type=\"checkbox\" name=\"checkit1\" value=\"a\" checked><br><br />b:<input type=\"checkbox\" name=\"checkit2\" value=\"b\"><br><br />c:<input type=\"checkbox\" name=\"checkit3\" value=\"c\"><br><br /></form></p><p>7，type=radio</p><p>即单选框，出现在多选一的页面设定中。参数同样有name,value及特别参数checked.</p><p>不同于checkbox的是，name值一定要相同，否则就不能多选一。当然提交到处理页的也还是value值。</p><p class=\"code\"><form name=\"form1\"><br />a:<input type=\"radio\" name=\"checkit\" value=\"a\" checked><br><br />b:<input type=\"radio\" name=\"checkit\" value=\"b\"><br><br />c:<input type=\"radio\" name=\"checkit\" value=\"c\"><br><br /></form><br />下面是name值不同的一个例子，就不能实现多选一的效果了<br><br /><form name=\"form1\"><br />a:<input type=\"radio\" name=\"checkit1\" value=\"a\" checked><br><br />b:<input type=\"radio\" name=\"checkit2\" value=\"b\"><br><br />c:<input type=\"radio\" name=\"checkit3\" value=\"c\"><br><br /></form></p><p>8，type=image</p><p>比较另类的一个，自己看看效果吧，可以作为提交式图片</p><p class=\"code\"><form name=\"form1\" action=\"xxx.asp\"><br />your Imgsubmit:<br /><input type=\"image\" src=\"../blog/images/face4.gif\"><br /></form></p><p>9，type=submit and type=reset</p><p>分别是“提交”和“重置”两按钮</p><p>submit主要功能是将Form中所有内容进行提交action页处理，reset则起个快速清空所有填写内容的功能。</p><p class=\"code\"><form name=\"form1\" action=\"xxx.asp\"><br /><input type=\"text\" name=\"yourname\"><br /><input type=\"submit\" value=\"提交\"><br /><input type=\"reset\" value=\"重置\"><br /></form></p><p>Input的Type总结下来有10个，还是不少的，呵呵</p><p><strong>三，接着再来看Select相关</strong></p><p>Select主要要来做下拉菜单，跳转菜单，（下拉）列表。</p><p>其本身有内嵌代码<option>...</option>，option参数value值为传递被处理的值，option还有参数selected，表示默认被选中的。</p><p>1，下拉菜单</p><p>只是菜单式显示。</p><p class=\"code\"><form name=\"form1\"><br /><select name=\"selectwhat\"><br />&nbsp;<option value=\"a\">aaa</option><br />&nbsp;<option value=\"b\">bbb</option><br />&nbsp;<option value=\"c\" selected>ccc</option><br /></select><br /></form><br /><script><br />alert(\"菜单的默认选取值是 \"+document.form1.selectwhat.value)<br /></script></p><p>2，跳转菜单</p><p>在下拉菜单基础上添加JavaScript成为跳转菜单。</p><p class=\"code\"><select onChange=\"if(this.selectedIndex && this.selectedIndex!=0){window.open(this.value);}this.selectedIndex=0;\"><br /><option selected>网站连接……</option><br /><option value=\"http://www.webjx.com/\">Webjx.Com</option><br /><option value=\"http://www.sina.com.cn/\">Sina.com.cn</option><br /><option value=\"http://www.163.com/\">163.com</option><br /></seclect></p><p>3，下拉列表</p><p>和下拉菜单最大的区别就是select多了一个size值，该值并非长度大小，而是列表的上下高度。</p><p>当然还有更主要的是：菜单只能选一个，而列表可以选多个，该特殊参数为multiple size=1简直就是一个下拉菜单</p><p class=\"code\"><form name=\"form1\"><br /><select name=\"selectwhat\" size=1><br />&nbsp;<option value=\"a\">aaa</option><br />&nbsp;<option value=\"b\">bbb</option><br />&nbsp;<option value=\"c\">ccc</option><br /></select><br /></form><br><br />size>1你会发现了大不同<br /><form name=\"form1\"><br /><select name=\"selectwhat\" size=3><br />&nbsp;<option value=\"a\">aaa</option><br />&nbsp;<option value=\"b\">bbb</option><br />&nbsp;<option value=\"c\">ccc</option><br /></select><br /></form><br><br />加入了multiple发现可以多个选择了，包括Shift进行快速全选及Ctrl进行点选<br /><form name=\"form1\"><br /><select name=\"selectwhat\" size=3 multiple><br />&nbsp;<option value=\"a\">aaa</option><br />&nbsp;<option value=\"b\">bbb</option><br />&nbsp;<option value=\"c\">ccc</option><br /></select><br /></form><br></p><p><strong>四，最后关注的Textarea</strong></p><p>可以将Textarea文本区域理解为扩大化了的文本输入框。</p><p>其参数没有value，默认值设定在<textarea>...</textarea>之间。</p><p>其它参数还有rows,表示文本区域的行数；参数cols，表示文本区域的列数。</p><p>还有参数warp，当warp=off表示该文本区域中的不自动换行，当然不写默认是自动换行的。</p><p class=\"code\"><form name=\"form1\"><br /><textarea name=\"textinit\" rows=\"5\" cols=\"20\" wrap=\"off\">5行20列，不自动换行</textarea><br /></form></p>\r\n            <p align=\"center\"> </p>', '', '', '');
INSERT INTO `youbang_addonarticle` VALUES (6, 2, '　我们经常会在一个技术性网站或BBS见到这三个东东：XHTML DHTML SHTML，它们到底是怎么回事呢？我们看下面的说明与讲解。<p><strong>XHTML：</strong> </p><p>　　HTML是一种基本的WEB网页设计语言，XHTML是一个基于XML的置标语言，看起来与HTML有些相象，只有一些小的但重要的区别，XHTML就是一个扮演着类似HTML的角色的XML，所以，本质上说，XHTML是一个过渡技术，结合了XML（有几分）的强大功能及HTML（大多数）的简单特性。 </p><p>　　2000年底，国际W3C(World Wide Web Consortium)组织公布发行了XHTML 1.0版本。XHTML 1.0是一种在HTML 4.0基础上优化和改进的的新语言，目的是基于XML应用。XHTML是一种增强了的HTML,它的可扩展性和灵活性将适应未来网络应用更多的需求。下面是W3C的HTML工作组主席Steven Pemberton回答的关于XHTML的常见基础问题。 </p><p>　　（1）XHTML解决HTML语言所存在的严重制约其发展的问题。HTML发展到今天存在三个主要缺点：不能适应现在越多的网络设备和应用的需要，比如手机、PDA、信息家电都不能直接显示HTML；由于HTML代码不规范、臃肿，浏览器需要足够智能和庞大才能够正确显示HTML；数据与表现混杂，这样你的页面要改变显示，就必须重新制作HTML。因此HTML需要发展才能解决这个问题，于是W3C又制定了XHTML，XHTML是HTML向XML过度的一个桥梁。 </p><p>　　（2）XML是web发展的趋势，所以人们急切的希望加入XML的潮流中。XHTML是当前替代HTML4标记语言的标准，使用XHTML 1.0，只要你小心遵守一些简单规则，就可以设计出既适合XML系统，又适合当前大部分HTML浏览器的页面。这个意思就是说，你可以立刻设计使用XML，而不需要等到人们都使用支持XML的浏览器。这个指导方针可以使web平滑的过渡到XML。 </p><p>　　（3）使用XHTML的另一个优势是：它非常严密。当前网络上的HTML的糟糕情况让人震惊，早期的浏览器接受私有的HTML标签，所以人们在页面设计完毕后必须使用各种浏览器来检测页面，看是否兼容，往往会有许多莫名其妙的差异，人们不得不修改设计以便适应不同的浏览器。<br />&nbsp;<br />　　（4）XHTML是能与其它基于XML的标记语言、应用程序及协议进行良好的交互工作。<br />&nbsp;<br />　　（5）XHTML是Web标准家族的一部分，能很好在无线设备等其它用户代理上。 </p><p>　　（6）在网站设计方面，XHTML可助你去掉表现层代码的恶习，帮助你养成标记校验来测试页面工作的习惯。 </p><p><strong>DHTML：</strong> </p><p>　　DHTML只是一种制作网页的概念，实际上没有一个组织或机构推出过所谓的DHTML标准或技术规范之类的。DHTML不是一种技术、标准或规范，DHTML只是一种将目前已有的网页技术、语言标准整和运用，制作出能在下载后仍然能实时变换页面元素效果的网页的设计概念。 </p><p>　　DHTML大致包含以下网页技术、标准或规范： </p><p>　　HTML 4.0 　没什么好说的，网页的基础语言标准。 </p><p>　　CSSL 注意！不是CSS，是CSSL，它是Clent-Side Scripting Language的缩写，译作“客户端脚本语言”，主要有JavaScript(JS)，VBScript(VBS)，JScript。Netscape主要支持JS，IE主要支持JS，VBS和JScript。 </p><p>　　DOM Document Object Model的缩写，译作“文档对象模型”，是W3C日前极力推广的web技术标准之一，它将网页中的内容抽象成对象，每个对象拥有各自的属性(Properties)、方法(Method)和事件(Events)，这些都可以通过上面讲到的CSSL来进行控制。IE和NS的对象模型都是以W3C的公布的DOM为基准，加上自己的Extended Object(扩展对象)来生成的。 </p><p>　　CSS 这才是Cascading Style Sheets(层叠样式表单)的缩写，也是本站52CSS.com的主题，它是HTML的辅助设计规范，用来弥补HTML在排版上的所受的限制导致的不足，它是DOM的一部分。理论上说通过CSSL动态地改变CSS属性可以做出任何你想要的页面视觉效果。 </p><p>　　所以，简单地说，要实现DHTML，就是以HTML为基础，运用DOM将页面元素对象化，利用CSSL控制这些对象的CSS属性以达到网页的动态视觉效果。 </p><p><strong>SHTML：</strong> </p><p>　　问起SHTML和HTML的区别,如果用一句话来解释就是：SHTML不是HTML而是一种服务器 API，shtml是服务器动态产成的html。 </p><p>　　虽然两者都是超文本格式,但shtml是一种用于SSI技术的文件。 也就是Server Side Include--SSI 服务器端包含指令。 如果Web Server有SSI功能的话(大多数（尤其是基于Unix平台）的WEB服务器如Netscape Enterprise Server等均支持SSI命令)。 会对shtml文件特殊招待。 先扫一次shtml文件看没有特殊的SSI指令现在。 有就按Web Server设定规则解释SSI指令。 解释完后跟一般html一起掉去客户端。 </p><p>　　SHTML使用SSI(Server Side Include)的html文件扩展名，SSI（Server Side Include)，通常称为\"服务器端嵌入\"或者叫\"服务器端包含\"，是一种类似于ASP的基于服务器的技术。 </p><p>　　SSI工作原理： </p><p>　　将内容发送到浏览器之前，可以使用“服务器端包含 (SSI)”指令将文本、图形或应用程序信息包含到网页中。例如，可以使用 SSI 包含时间/日期戳、版权声明或供客户填写并返回的表单。对于在多个文件中重复出现的文本或图形，使用包含文件是一种简便的方法。将内容存入一个包含文件中即可，而不必将内容输入所有文件。通过一个非常简单的语句即可调用包含文件，此语句指示 Web 服务器将内容插入适当网页。而且，使用包含文件时，对内容的所有更改只需在一个地方就能完成。 </p><p>　　因为包含 SSI 指令的文件要求特殊处理，所以必须为所有 SSI 文件赋予 SSI 文件扩展名。默认扩展名是 .stm、.shtm 和 .shtml</p><p>　　Web 服务器在处理网页的同时处理 SSI 指令。当 Web 服务器遇到 SSI 指令时，直接将包含文件的内容插入 HTML 网页。如果“包含文件”中包含 SSI 指令，则同时插入此文件。除了用于包含文件的基本指令之外，还可以使用 SSI 指令插入文件的相关信息（如文件的大小）或者运行应用程序或 shell 命令。 </p><p>　　网站维护常常碰到的一个问题是，网站的结构已经固定，却为了更新一点内容而不得不重做一大批网页。SSI提供了一种简单、有效的方法来解决这一问题，它将一个网站的基本结构放在几个简单的HTML文件中（模板），以后我们要做的只是将文本传到服务器，让程序按照模板自动生成网页，从而使管理大型网站变得容易。 </p><p>　　所以,利用SHTML格式的页面目的和 ASP 差不多，但是因为是 API 所以运转速度更快，效率更高,比ASP快，比HTML慢，但由于可以使用服务器端包含，因此使页面更新容易（特别是批量更新banner，版权等）,想象一下吧,你有一段 HTML,要在中间穿插一些特殊的服务端脚本,比如插入其他 HTML 段落,你选择 ASP 来完成这个任务,但是如果任务更繁重，需要更多的时间，比如5s，这个时候你不用 ASP 而用 SHTML,或许处理时间就只用4s了. </p>\r\n            <p align=\"center\"> </p>', '', '', '');
INSERT INTO `youbang_addonarticle` VALUES (7, 2, '<strong>前言：</strong> <p>　　现在都讲究标准建站，而标准建站使用的技术主要是XHTML+CSS，而现在我们普遍使用的是HTML代码，那么我该如何转换呢？以及HTML和XHTML有什么不同呢？在这个教程里，你将学到HTML和XHTML之间的不同，以及如何将HTML转换为XHTML。毕竟XHTML是发展的方向，所以我觉得该教程有必要在本站上发布。我感觉要是你想使用标准还是最好先学HTML，因为比较简单，然后再来看该教程。 </p><p>　　<strong>XHTML介绍：</strong> </p><p>　　XHTML是 EXtensible HyperText Markup Language(可扩展超文本标记语言) 的英文缩写，而HTML则是 HyperText Markup Language(超文本标记语言) ，这是名字的不同。其实我们说得标准应该是XML，那为什么要学习XHTML呢？因为现在的HTML代码烦琐，危机四伏，但是XML使用环境还不成熟，所以推出了一个过度的产品就是XHTML，它起着呈上起下的作用。也有人认为XHTML是HTML的一个升级版本，其实也是正确的，我的理解是XHTML把HTML做得更加规范的一个标记语言，使HTML变得功能强大，减少了代码的烦琐尤其是表格。 </p><p>　　XHTML是在2000年1月26日被国际标准组织机构W3C(World Wide web Consortium)定为一个标准的，认为是HTML的一个最新版本，并且将逐渐替换HTML。现在所有的浏览器都支持XHTML，XHTML兼容 HTML 4.0。也有人认为XHTML就是HTML4.01。如果你在学习过程中自己编写了一个符合标准的站，你可以通过W3C的验证，验证通过后你将会得到一个标志，通常是XHTML1.0认证和CSS验证。我也不清楚目前国内有多少个网站同时通过了这两个验证。大家可以去这个站点去验证你的站，如果符合那两个规则则会分别给我们两段代码加到你的网页上向别人展示说明你采用了标准建站啊，牛啊！</p><p>　　为什么我们使用XHTML </p><p>　　XHTML是HTML升级为XML的过度产品，被定为一个标准，XHTML完全兼容HTML4.01，并且具有XML的语法。下面我们来看一个含有错误代码的HTML，如下： </p><p>　　<html> <br />　　<head> <br />　　<title>This is bad HTML</title> <br />　　<body> <br />　　<h1>Bad HTML <br />　　</body> </p><p>　　虽然含有错误代码，但是当我们在浏览器中浏览时还能正常显示。XML是一个标记语言，但是它要求在网页中出现的任何元素都应该被标记出来，XML是用来描述网页中的数据的，而HTML用来显示网页中的元素的。目前我们上网使用的各种浏览器技术，包括手提电脑、手机上网浏览等等，都要求浏览的一些内容都要被正确标记，如果有错误的标记可能会使显示特别混乱、甚至不能正常显示。 </p><p>　　因此联合 HTML 和XML , 还有其他的一些技术，我们得到了一种现在有用的而且在将来也有用的语言 - XHTML。 </p><p>　　当在将来都规范的时候我们就要用的 XHTML 正确格式的标记了,使所有的浏览器都能正确的执行，所以我们现在有必要开始学习XHTML了。 </p><p>　　<strong>XHTML和HTML之间的区别：</strong> </p><p>　　XHTML是一项新技术，在浏览器和一些其他的软件都支持它之前，我们应该有必要熟悉一下这项技术。为了我们更好的学习XHTML之前我们应该熟悉一下HTML4.0，我们可以去下载一个参考手册来熟悉一下。以便于我们学起XHTML来更简单，换句话说我们现在使用HTML编写代码时应该尽力少写错误代码，如：都要使用小写的字符来编写HTML，每个标记之后都要加上标记的结束如：<p>网页教学网欢迎您的光临</p> 结束一定要有，我们要保持这种规则。 </p><p>　　<strong>它们之间最大的区别在于：</strong> </p><p>　　1.XHTML 元素一定要被正确的嵌套使用。 </p><p>　　在HTML里一些元素可以不正确嵌套也能正常显示，如： </p><p>　　<b><i>This text is bold and italic</b></i> </p><p>　　而在XHTML必须要正确嵌套之后才能正常使用，如： </p><p>　　<b><i>This text is bold and italic</i></b> </p><p>　　注意：这个错误通常发生在当嵌套多层之后的标签里面。如： </p><p>　　<ul> <br />　　　<li>Coffee</li> <br />　　　<li>Tea <br />　　　<ul> <br />　　　　<li>Black tea</li> <br />　　　　<li>Green tea</li> <br />　　　</ul> <br />　　　<li>Milk</li> <br />　　</ul> </p><p>　　正确的应该是： </p><p>　　<ul> <br />　　　<li>Coffee</li> <br />　　　<li>Tea <br />　　　<ul> <br />　　　　<li>Black tea</li> <br />　　　　<li>Green tea</li> <br />　　　</ul> <br />　　　</li> <br />　　　<li>Milk</li> <br />　　</ul> </p><p>　　观察上述的两段代码我们可以看到正确的里面我们在 </ul>之后插入 </li> 标签。 </p><p>　\r\n            <p align=\"center\"> </p>', '', '', '');
INSERT INTO `youbang_addonarticle` VALUES (8, 2, '鉴于HTML初级教程的目的只是教授HTML的骨架元素，这个中级教程增加一些骨肉，它们不应该特别的难，但可以进一步增进我们对HTML的理解，使我们能多做一些更有用的事情。<br /><br />HTML只是赋予内容的手段，大部分HTML标签都有其意义（标签p创建段落，h1标签创建标题等等）的，然而span和div标签似乎没有任何内容上的意义，听起来就像一个泡沫做成的锤子一样无用。但实际上，与CSS结合起来后，它们被用得十分广泛。<br /><br />它们被用来组合一大块的HTML代码并赋予一定的信息，大部分用类属性class和标识属性id与元素联系起来，见CSS中级指南的类和id选择符。<br /><br />span和div的不同之处在于span是内联的，用在一小块的内联HTML中，而div（想想division是什么意思）元素是块级的（简单地说，它等同于其前后有断行），用于组合一大块的代码。<br /><br /><div&nbsp;id=\"scissors\"><br /><p>This&nbsp;is&nbsp;<span&nbsp;class=\"paper\">crazy</span></p><br /></div>&nbsp;<br />在实践中，div，特别是span不应该滥用，尽管有其他相左的意见。比如，你要强调单词“crazy”和加粗类“paper”，可能会用这样的代码：<br /><br /><div&nbsp;id=\"scissors\"><br /><p>This&nbsp;is&nbsp;<strong&nbsp;class=\"paper\">crazy</strong></p><br /></div>&nbsp;<br />这是做法比再加一个span比较好。<br /><br />对于类class和标识id没有线索？别担心，在CSS中级指南中会接触到它们。你所需要记住的是，span和div&nbsp;是“无意义”的标签。但有新的说法说他们是有语义的。我们这里不再深入了。\r\n            <p align=\"center\"> </p>', '', '', '');
INSERT INTO `youbang_addonarticle` VALUES (9, 2, '<strong>tabbing浏览<br /><br /></strong>不或不能使用指点设备的用户可以用快捷键tab键来打开连接，并且本身也要有逻辑tab顺序。尽管HTML是线性的，tabindex属性允许你定义它快捷键们的顺序，而且这些逻辑tab应该可以自动落入自己位置。<br /><br /><strong>快捷键</strong><br /><br />快捷键可以通过键盘的特定按键进行更方便的导航（当按住Alt键或者Ctrl键时获得焦点）。对于那些没有指点设备的用户，比起使用tab键操作连接更快捷，更方便。<br /><br />没有必要为每一个连接都设置快捷键，但为主要导航连接都设置是一个不错的主意。<br /><br /><p class=\"code\"><a href=\"somepage.html\" accesskey=\"s\">Some page</a></p> <br /><strong>注意</strong><br /><br /><p class=\"code\">快捷键的麻烦是，用户常常没有办法知道它们在哪里和到底是什么键（除非查看源代码）。虽然JAWS──一个可以大声读出快捷键的屏幕阅读器，但要掘尽其能，你还是得让快捷键更直白。<br />你可以使用像“跳过导航”的连接技术（下详），或者选择一个独立的页面来说明你网站的这些易用性相关功能，包括快捷键。一个越来越流行的办法是在一个与快捷键相一致的字母上加下划线，类似于Windows程序菜单中的方法。</p><br /><strong>连接的标题</strong><br /><br />为连接添加标题属性title是一个好主意，这会给用户所指向连接的予说明，所以能改进导航。<br /><br />假如这个连接是执行Javascript的，这也有利于为没有使用Javascript功能的用户解释什么将会（或不会）发生。<br /><br /><p class=\"code\"><a href=\"#\" onclick=\"opennastypopup()\" onkeypress=\"opennastypopup()\"<br />title=\"Open a nasty Javascript pop-up window\">Monster</a></p><br /><strong>弹出窗口</strong><br /><br />说到Javascript弹出窗口，你要坚持使用的话，或者很多人（你的用户）告诉你要使用，你可以用onkeypress和onclick来使得页面更易用。并且，在功能上定义了返回false的弹出窗口，包含一个带有href属性指向普通页面的连接，对于一个没有使用Javascript功能的用户来说，可以以普通方式载入这个页面。<br /><br />比如：<br /><br /><p class=\"code\"><script type=\"text/javascript\"><br />function opennastypopup()<br />{ <br />window.open(\"monster.html\", \"\", \"toolbar=no,height=100,width=200\"); <br />return false; <br />} <br /></script><br /> ... <br /><a href=\"monster.html\" onclick=\"return opennastypopup()\" onkeypress=\"return opennastypopup()\">Monster</a></p> <br /><strong>相邻的连接</strong><br /><br />相邻的连接应该至少用空格隔开，以便为屏幕阅读器清晰辩明。<br />这也可以用字符来完成，连接之间的（比如竖线 |── 连接 | 连接），或者包围连接的（如中括号 [] ── [连接] [连接]）。把连接放在列表里面也是一个好主意。然后可以用CSS来样式化显示，甚至可以是并行的列表（用 display: in-line）。<br /><br /><strong>跳过导航</strong><br /><br />你应该让使用屏幕阅读器的用户一个跳过导航直接到内容的机会。这是因为，假设你的连接是固定的（应该是），用户不必经受每一页同样的信息，尤其是大量的。你可以设置一个连接，跳过导航直接跳到内容的连接。<br /><br />看起来像是这样的：<br /><br /><p class=\"code\"><p id=\"header\"><br /> <h1>The Heading</h1><br /> <a href=\"#content\" accesskey=\"n\">Skip navigation</a><br /></p><br /><p id=\"navigation\"><br /><!--loads of navigation stuff --><br /></p><br /><p id=\"content\"><br /><!--lovely content --><br /></p></p> <br />显然，你没有必要在可视化浏览器中显示它，所有你可以用CSS开隐藏它。<br /><br />注意<br /><br /><p class=\"code\">这是虽然只是一个CSS的小技巧，但是“跳过导航”的特效药。这涉及到隐藏连接的方法。<br />最常见的办法可能是使用display: none，但有些浏览器看到但不理解这个连接，“跳过导航”的连接必须显示。<br />然而没有必要显示──没有理由显示给醒目的用户。所以坚持使用包含display: none的样式，还不如把元素宽和高设置为零（width: 0; height: 0; overflow: hidden;），这有相同的视觉效果，但可以使屏幕阅读器理解。</p>\r\n            <p align=\"center\"> </p>', '', '', '');
INSERT INTO `youbang_addonarticle` VALUES (10, 2, '<table class=\"t\" cellspacing=\"0\" cellpadding=\"8\" width=\"100%\" border=\"0\"><tbody><tr><td width=\"220\"><table cellspacing=\"0\" cellpadding=\"0\" rules=\"cols\" width=\"200\" border=\"1\"><tbody><tr align=\"center\"><td>第</td><td>一</td><td>行</td></tr><tr align=\"center\"><td>第</td><td>二</td><td>行</td></tr><tr align=\"center\"><td>第</td><td>三</td><td>行</td></tr></tbody></table></td><td width=\"380\">这个表格去掉了单元格之间的纵向分隔线</td></tr><tr><td><br /><table cellspacing=\"0\" cellpadding=\"0\" rules=\"rows\" width=\"200\" border=\"1\"><tbody><tr align=\"center\"><td>第</td><td>第</td><td>第</td></tr><tr align=\"center\"><td>一</td><td>二</td><td>三</td></tr><tr align=\"center\"><td>列</td><td>列</td><td>列</td></tr></tbody></table><br /></td><td>这个表格去掉了单元格之间的横向分隔线</td></tr><tr><td><table cellspacing=\"0\" cellpadding=\"0\" rules=\"none\" width=\"200\" border=\"1\"><tbody><tr align=\"center\"><td>横</td><td>&nbsp;</td><td>线</td></tr><tr align=\"center\"><td>竖</td><td>&nbsp;</td><td>线</td></tr><tr align=\"center\"><td>都</td><td>没</td><td>了</td></tr></tbody></table></td><td>这个表格去掉了单元格之间的纵向分隔线和横向分隔线</td></tr><tr><td colspan=\"2\"><hr color=\"#000000\" size=\"1\" />其实上面的三个表格都有三行三列，隐藏分隔线的诀窍在于rules，察看这三个表格的源代码，我们可以看到<TABLE>标签中都有rules。 它有三个参数(cols,rows,none)，当rules=cols时，表格会隐藏纵向的分隔线，这样我们就只能看到表格的行；当rules=rows时，则 隐藏了横向的分隔线，这样我们只能看到表格的列；而当rules=none时，纵向分隔线和横向分隔线将全部隐藏。</td></tr></tbody></table>\r\n            <p align=\"center\"> </p>', '', '', '');
INSERT INTO `youbang_addonarticle` VALUES (11, 2, '<p>　超级链接<a>标记代表一个链接点，是英文anchor（锚点）的简写。它的作用是把当前位置的文本或图片连接到其他的页面、文本或图像，这已是众所周知了，但关于它的语法结构可能有点鲜为人知，而要用活它则必须了解其语法结构。<a>标记的基本语法结构是： </p><p class=\"code\"><a<br />class=type<br />id＝value<br />href＝reference<br />name＝value<br />rel=same|next|parent|previous<br />rev＝value<br />target＝window<br />style＝value<br />title=title<br />onclick＝function<br />onmouseout＝function<br />onMouseOver=function>连接</a><span class=\"web\"></span></p><p>　　从标记的语法结构可以看出，在设定一个超级链接时有很多参数可供选择，以实现不同的链接效果，这有点出乎意料吧？！<span class=\"web\"></span></p><p>　　其中class和id选项：用于设定链接点所属的类型和分配的ID号，通常不加以设定。最常用的两个参数是href和name。其中href是 hypertext reference的缩略词，用于设定链接地址。链接地址必须为url地址，如果没有给出具体路径，则默认路径和当前页的路径相同。链接到的文件也分为几种情况：如果为HTML文件，则在当前浏览器中直接打开；如果为可执行文件（.exe文件），则直接执行或下载，我们提供下载的文件就是用它的这种特性做的；如果为文本文件如word格式的文件，则在浏览器中打开此文件，并可以进行编辑加工。<span class=\"web\"></span></p><p>　　rel：表示设定链接的关系：rel=same表示待链接的文件与此文件相同，rel=next表示待链接的文件为下一页，rel＝parent表示本文件为待链接文件的父文件，rel=previous则表示待链接的文件为上一页。<span class=\"web\"></span></p><p>　　rev：则用于设定反向链接。</p><p>　　target：是在采用帧窗口的情况下设定链接到哪一个窗口，还有target=\"_bank\"是表示新开一窗口打开网页。<span class=\"web\"></span></p><p>　　title：用于设定链接点被选到时显示的标题。</p><p>　　onclick：对应于一个事件，当链接点被点击后将触发这个事件，执行对应的子程序。</p><p>　　onmouseover：与onclick类似，对应的事件在鼠标移到链接点上时被触发。<span class=\"web\"></span><span class=\"web\"></span></p><p>　　onmouseout：对应的事件在鼠标移出镇接点后被触发。 </p><p>　　举几个例子：</p><p class=\"code\"><a href=\"index.htm\">回到主页</a> <br /><a href=\"sound.wav\">播放语音文件</a><br /><a href=\"javascipt.open()\">执行对应的程序</a><br /><a herf=\"document.doc\">打开对应的文档进行加工</a></p><p>　　应用技巧</p><p>　　1、提供下载文件</p><p>　　有不少网友来信问，提供下载的效果怎么做。实际上仍然是做一个超级链接，不过供下载的文件必须上传到网站上。例：有一个“网页技巧”的文件包供下载，文件名是“homepagejq.zip”且已上传到网站了，则这个链接的代码可以这样写：<a href=\"homepagejq.zip\">点击这里下载“网页技巧”文件包</a>。</p><p>　　2、在新窗口中打开链接的网页</p><p>　　设定“target”的值为“_blank”。例：新开窗口打开网页“aboutme.htm”。产生该效果的代码是：<a href=\"aboutme.htm\" target=\"_blank\">关于我......</a>。</p><p>　　3、鼠标移到链接，显示一行说明文字</p><p>　　设定“title”参数值，即可获得这种效果。例：当鼠标移到“黄山村夫”这个链接上时，显示说明“这是一个介绍技巧的专业网站”。这个链接的代码是这样的：<a href=\"hscf.htm\" title=\"这是一个介绍技巧的专业网站\">黄山村夫</a>。</p><p>　　4、鼠标移到一个链接上弹出一个窗口</p><p>　　这是设定onmouseover参数获得的效果。例：当鼠标移到一个链接上，弹出一个窗口并在窗口中显示“鼠标悬停效果演示！”。这个链接的代码是这样的：<a href=\"其它网页.htm\" onmouseover=\"alert(\'鼠标悬停效果演示！\')\">链接</a>。用类似的方法可以制作当鼠标按下后弹出提出示窗口、当鼠标离开时弹出提示窗口的效果。</p><p>　　5、链接到本页的指定内容</p><p>　　要实现链接到本页的某一部分内容上（也就是“文件内跳转”），必须用参数name指定链接点的名称。选定一块文本，可以用name参数为其命名，以备链接所用。所谓同一个文件内的跳转是指当读者在阅读一个很长的文件的时候，若只对某部分的内容感兴趣，可以采用跳跃式的阅读方式。其基本格式是：</p><p class=\"code\"><a href＝\"＃链接点名称\">第二部分</a>第一部分内容......<br />...........................................<br /><a name＝\"链接点名称\"></a>第二部分实际内容......<br />........................................... </p><p>　　这样当你点击“第二部分”这个超级链接后，就会自动转移到“第二部分实际内容”这个地方来。“name”参数所定义的链接点名称可以随意取，但链接的“href”参数中的链接点名称必须与其一致，不要忘记在前面加上“#”。</p><p>　　6、链接到其它页面的指定内容位置</p><p>　　方法与上例类似，但在“href”参数中的链接点名称前要加上网页的文件名。例：有两个网页page1.htm和page2.htm ，每页均有两部分内容，现要在page1.htm中制作一个超级链接，按下该链接后将转到page2.htm的第二部分内容上。那么我们可以这样做，首先在page2.htm第二部分内容开始的地方写上这样一句代码：<a name=\"链接点名称\"></a>；在page1.htm中写上这样一个链接代码：<a href=\"pagw2.htm#链接点名称\">page2 的第二部分内容</a>。</p><p>　　7、链接到E_mail</p><p>　　点击一个超级链接后，将启动客户机上的电子邮件管理软件给你写信。例这行代码：<a href=\"mailto:web@webjx.com\">请给我写信</a>。一旦你点击了“请给我写信”这个链接，将自动启动电子邮件管理软件（如OE）的写信功能，并已把邮件地址加在了收信人的地址栏里了。</p><p>　　链接不仅可以以文本作载体，也可以以图象作载体，而且可以以图片的某一部分作载体，且都能实现上述这些效果，方法也相同，所不同只是载体，也就是链接的两对方括号中间的那部分，所以不再另举例了。</p>\r\n            <p align=\"center\"> </p>', '', '', '');
INSERT INTO `youbang_addonarticle` VALUES (12, 2, '<p>　活动字幕，也称为滚动看板、滚动字幕。活动字幕的使用使得整个网页更有动感，显得很有生气。现在的网站中也越来越多地使用活动字幕来加强网页的互动性。用Javascript编程可以实现活动字幕效果；用Dreamweaver的图层再用其时间线功能可以做出非常漂亮的滚动看板。而用HTML的<marquee>活动字幕标记所需的代码最少，确实能够以较少的下载时间换来较好的效果。该标记语法格式如下：</p><p><marquee<br />aligh=left|center|right|top|bottom<br />bgcolor=#n<br />direction=left|right|up|down<br />behavior=type<br />height＝n<br />hspace＝n<br />scrollamount=n<br />Scrolldelay=n<br />width=n<br />VSpace=n<br />loop＝n></p><p>　　可以看出由于活动字幕的显示方式多种多样，可选的参数也很多。下面解释一下各参数的含义：<span class=\"web\"></span></p><p>　　align：是设定活动字幕的位置，不过除了居左、居中、居右三种位置外，又增加靠上（align=top）和靠下（align=bottom）两种位置。</p><p>　　Bgcolor：用于设定活动字幕的背景颜色，一般是十六进制数。</p><p>　　Direction：用于设定活动字幕的滚动方向是向左、向右、向上、向下。</p><p>　　Behavior：用于设定滚动的方式，主要由三种方式：behavior=\"scroll\"表示由一端滚动到另一端；behavior=\"slide\":表示由一端快速滑动到另一端，且不再重复； behavior=\"alternate\"表示在两端之间来回滚动。</p><p>　　Height：用于设定滚动字幕的高度。</p><p>　　Width：则设定滚动字幕的宽度。<span class=\"web\"></span></p><p>　　Hspace和vspace：分别用于设定滚动字幕的左右边框和上下边框的宽度。<span class=\"web\"></span></p><p>　　Scrollamount：用于设定活动字幕的滚动距离。</p><p>　　scrolldelay：用于设定滚动两次之间的延迟时间。</p><p>　　Loop：用于设定滚动的次数，当loop=-1表示一直滚动下去，直到页面更新。</p><p>　　<marquee>标记的默认情况是向左滚动无限次，字幕高度是文本高度，滚动范围：水平滚动的宽度是当前位置的宽度；垂直滚动的高度是当前位置的高度。</p><p>　　应用技巧</p><p>　　1、全取默认值，所用代码最少，请看下面的例子</p><p>　　这个滚动字幕全取默认值，源代码：<marquee>这里写字幕内容</marquee>，代码是不是很少？</p><p>　　2、垂直滚动</p><p>　　只要加上diriction=\"up\"就行了，如<marquee direction=\"up\" >这里写字幕内容</marquee>。</p><p>　　3、多行文本的活动字幕</p><p>　　由于<mqrquee>标记只能作用于一段文本，因此多行活动字幕，分行时只能用<br>标记，不能用<p>标记。</p><p>　　示例源代码：</p><p><marquee><br />活动字幕内容第一行<br><br />活动字幕内容第二行<br><br />活动字幕内容第三行<br><br /></marquee><span class=\"web\"></span></p><p>　　4、在字幕内容中加入图象<span class=\"web\"></span></p><p>　　<marquee>虽是一个活动字幕标记，但它允许在其中加入图象。下面是一个加入了图片的代码： <marquee><img src=\"image/a2ball.gif\" width=\"17\" height=\"16\">这是加入图象的活动字幕</marquee></p><p>　　5、在Dreamweaver中使用<marquee>标记</p><p>　　Dreamweaver不能在编辑窗中直接加入marquee标记，但可在源代码检视器中加入<marquee>标记，然后在编辑窗中编辑活动字幕的内容即可。<span class=\"web\"></span></p><p>　　<marquee>标记的参数较多，在应用中要把握一个原则，能用默认值就不要再设置参数值，用什么参数就设置该参数的值，其它参数就不要再设置，以把代码控制在最少的范围内。</p><p>(负责编辑：blank)</p>\r\n            <p align=\"center\"> </p>', '', '', '');
INSERT INTO `youbang_addonarticle` VALUES (13, 2, '<p align=\"left\"><strong>一、为什么要？</strong></p><p align=\"left\">　<span class=\"web\"></span>　近两年来，许多公司开发出了图形化的HTML开发工具，使得网页的制作变得非常简单。如微软公司推出的 Microsoft FrontPage， Adobe公司推出的 Adobe Pagemill， Micromedia公司推出的Dreamweaver等编辑工具，都被称为“所见即所得”的工具。这些图形化的开发工具可以直接处理网页，而不用书写费劲的标记。这使得用户在没有HTML语言基础的情况下，照样可以编写网页。这时，编写HTML文档的任务由开发工具替你完成了。 <span class=\"web\"></span>这是网页图形编辑工具的最大成功之处，但也是它们的最大不足之处。受到图形编辑工具自身的约束，将产生大量的垃圾代码。原因很简单，我举一个简单的例子你就明白了。比如：在网页设计一个表格，若是每个单元格的宽度和高度让它根据其中的内容自动确定，HTML只要你告诉它是表格和单元格的排列顺序（也就是行列数）就行了，但因为图形化开发工具无法得知你的这种特殊要求，所以只能取一般要求，把每个单元格的宽度和高度都定义起来，从而增加了许多代码。所以一个明智的网页编写者应该在掌握图形编辑工具的基础上进一步学会HTML语言，从而知道那些是垃圾代码，这样，我们就可以利用图形化HTML开发工具快速成地做出网页，又会消除无用的代码，从而达到快速制作高质量网页的目的。<span class=\"web\"></span></p><p>　　<strong>二、如何用HTML？</strong></p><p>　　HTML语言，又称超文本标记语言，是英文Hyper Text Markup Language的缩写。HTML语言作为一种标识性的语言，是由一些特定符号和语法组成的，所以理解和掌握都是十分容易的。可以说，HTML语言在所有的计算机编程语言中是最简单易学的。 组成HTML的文档都是ASCIlI档，所以创建HTML文件十分简单，只需一个普通的字符编辑器即可。如 Wndows中的记事本、写字板都可以使用。也可以采用专用的 HTML 编辑工具：如 CoffeeHTML、 Homesite、 HTMLedit Pro等工具，它们的特点是能够自动检查HTML文档中的语法错误并协助改正。由于有了图形化的HTML开发工具，使得我们更加容易，我们可以先用它制作好网页，再在它附带的HTML代码编辑器在删去那些无用的代码，利用它的所见即所得特性，从而使我们很快就能熟炼地掌握HTML。特别是 Micromedia 公司最近发布的Dreamweaver4，可以把源代码编辑器和网页编辑器放在同一个窗口中，真是方便极了。</p><p>　　<strong>三、HTML基本概念</strong></p><p>　　1、标记<span class=\"web\"></span></p><p>　　HTML用于描述功能的符号称为“标记”。如“HTML”、“BODY”、“TABLE”等。标记在使用是必须用方括号“<>”括起来，而且是成对出现，无斜杠的标记表示该标记的作用开始，有斜杠的标记表示该标记的作用结束。如<TABLE>表示一个表格的开始， </TABLE>表标一个表格的结束。在HTML中，标记的大小写作用相同，如<TABLE>和<table>都是表示一个表格的开始。</p><p>　　标记可以包含标记，如：表格中包含表格或其它标记，如下面这样的HTML代码结构是正确的：</p><p class=\"code\"><table width=\"50%\" border=\"10\" cellspacing=\"10\" cellpadding=\"10\"><br /><tr><br /><td><br /><table width=\"100%\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\"><br /><tr><br /><td> </td><br /><td> </td><br /><td> </td><br /></tr><br /></table><br /></td><br /><td><br /><p> </p><br /><p>hjk</p><br /><p> </p><br /></td><br /><td> </td><br /></tr><br /></table></p><p>　　但是标记不能交叉嵌套，如下面这样的代码是错误的： <span class=\"web\"></span></p><p class=\"code\"><div><span>这是不正确的代码</div></span></p><p>　　2、特殊字符</p><p>　　由于方括号和英文双引号被用来提示HTML的标记及参数值，那么在网页中要显示方括号和英文引号只能用其它的符号来代替，下面是常见特殊字符所代表的正常字符：</p><p class=\"code\"><或<对应字符 <<br />>或>对应字符 ><br />\"或\"——对应字符 \"<br />à——对应字符 A </p><p>　　3、语法 <span class=\"web\"></span></p><p>　　一个标记，为了明确它的功能，往往用一些属性参数来描述，对这些属性参数的规定上就是所谓的语法，例如：段落标记<p>，它的语法格式是：</p><p class=\"code\"><p align=left|center|right class=type><span class=\"web\"></span></p><p>　　这就说明<p>标记有两个属性参数，即“align”和“class”，其中“align”用于定义段的位置是靠左、靠右还是居中。默认值是靠左。而“class ”则是定义所属的类型。在实际应用时当然可以没有“align”和“class”参数，按照默认情况显示，这一点非常重要，这是我们判断无用代码的主要标准之一，假如在网页代码中有对默认值进行描述设置的语句代码，显然是无用的代码。另外，在设置标记的属性值时，若是取默认值不影响效果或影响很少，我们就尽量取默认值，这样可以不用设置，从而达到减少代码的目的。</p><p>　　标记参数的具体的值都有要加西文引号，如：要使段落内容居中，正确的写法是这样的： <span class=\"web\"></span></p><p class=\"code\"><p align=\"center\">段落内容居中示例</p> <span class=\"web\"></span> </p><p>　　学好用好HTML语言的关键是灵活应用标记的参数。特别是默认值的应用。</p>\r\n            <p align=\"center\"> </p>', '', '', '');
INSERT INTO `youbang_addonarticle` VALUES (14, 2, '<p>我们制作的每一个HTML网页都应该有文档标题。那么到底如何设置标题呢？这个教程就作为网页初学者的入门吧！</p><p>给你的文档增加一个标题，按照下面改变你的代码：</p><p><!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\"<br />\"\"><br /><html><br /><head><br /><title>我的第一个网页</title><br /></head><br /><body><br />我的第一个网页<br /></body><br /></html></p><p>你可以看到，我们已经增加从<head>标签和<title>标签开始的两个新元素（看看他们是怎么关闭的）。</p><p>头元素（从起始标签<head>到闭合标签</head>之间的内容）出现在主体元素（从起始标签< body>到闭合标签</body>之间的内容）之前，包含将在主体元素信息之前装载的信息。这些信息不会出现在浏览器窗口中。</p><p>随着我们进一步学习，你会看到更多能够插入头元素的其它元素，但最重要的还是标题元素。</p><p>如果你从浏览器查看这个网页（像前面一样已经保存和刷新），你可以看到“这是我的第一个网页”出现在浏览器窗口的标题栏。你键入的位于标题（title）标签的文本已经变成了这个文档的标题，惊奇吧？假设把这个网页增添到你的收藏夹或者书签，你会看到标题也会出现在这里。<br /></p>\r\n            <p align=\"center\"> </p>', '', '', '');
INSERT INTO `youbang_addonarticle` VALUES (15, 2, '<p>在制作网页时，文本内容是必不可少的！那么我们该如何对网页文本进行正确排版呢？</p><p>当段落标签p应该使用在段落的时候还有许多滥用换行标签br的情况，p用于表现段落是公认的。基于同样的逻辑，很多标签应该被用来定义确定的文本元素，比如引用，缩写和计算机代码等。</p><p>应该记住的是，尽管大部分浏览器用不同的方式处理这些标签，最重要的是记住，不是为了让元素看起来像什么，而是它赋予的含义是什么。</p><p>缩写和首字母组合词</p><p>缩写标签abbr和首字母组合词标签acronym分别用于缩写词语和首字母组合而成的缩写词。</p><p>缩写是一个惯用词组的缩短形式。很平常。然而，首字母缩写词则是组成词组的每个单词之首个字母（或者单词的部分）的组合缩写。所以CSS是一个正确的首字母缩写词，但HTML和XHTML却不是（如果Hypertxet markup language是一个首字母缩写词，它应该是HML，同理，XHTML 就是EHML了）。</p><p>为了优化易用性，缩写和首字母缩写词都应该使用标题属性title。<br /><p>This web site is about <abbr title=\"HyperText Markup Language\">HTML</abbr><br />and <acronym title=\"Cascading Style Sheets\">CSS</acronym>.<br /></p> </p><p>注意</p><p>有一些不可思议的理由，Internet Explorer，最常用的浏览器，竟然不支持abbr标签。十分幸运，一个叫Marek Prokop的小伙子为此开发了clever Javascript workaround。<br />有很多关于缩写和首字母缩写词元素的讨论，Lars Holst提供了可能是最具体的深入理解。</p><p>引用</p><p>blockquote，q和cite用在引用上。blockquote是块状的，用于大面积的引用语上，而q则是内联的，用于更小的词组。cite也是内联的，比起q来其本身的语义更可取，很可能在将来取代q。</p><p>又，标题属性title用于表明引用从何而来。</p><p>注意：q一般不改变内附文本的外观──你需要用CSS如果你需要为它指定一个样式。</p><p><p>So I asked Bob about quotations and he said <br /><cite>I know as much about quotations as I do about pigeon fancying</cite><br />. Luckily, I found HTML Dog and it said...<br /></p><br />&nbsp;<blockquote title=\"From HTML Dog, \"><br />&nbsp;<p>blockquote, q and cite are used for quotations. blockquote is block-line and used for large or citations, whereas q is in-line and used for smaller phrases. cite is also in-line and preferable to q for its semantic nature and possible future deprecation of q.</p><br />&nbsp;</blockquote> </p><p>代码</p><p>有少部分的标签，code和var用于计算机程序代码，pre和samp则，在实践中，也主要是用于代码。<br />code用于计算机程序代码。<br />var用于指明代码里的变量。</p><p><code><var>ronankeatingisbland</var> = true;</code> </p><p>samp与代码类似，但被认为是用于程序的代码输出样例。<br />pre是预格式化文本，在HTML标签中不常用，以防止大量空格的产生。它常用于代码块。</p><p><pre> <br /><div id=\"intro\"> <br /><h1>Some heading<br /></h1> <p>Some paragraph paragraph thing thing thingy.<br /></p> </div><br /></pre> </p><p>定义术语</p><p>dfn是定义术语，用于高亮显示一个第一次使用的术语。像abbr和acronym ，标题属性title可以用来描述术语。</p><p><p>Bob\'s <dfn title=\"Dog\">canine</dfn> mother and <dfn title=\"Horse\">equine</dfn><br />&nbsp;father sat him down and carefully explained that he was an <br /><dfn title=\"A mutation that combines two or more sets of chromosomes from different species\">allopolyploid</dfn><br />organism.</p></p><p>地址</p><p>address应该用于地址。</p><p><address> <br />HMTL Dog House<br /> <br />HTML Street<br /> <br />Dogsville<br /> <br />HT16 3ML </address></p><p>晦涩罕见的标签<br />有一些没有什么价值的标签，有很少的机会被使用只是因为十分特定的场合。<br />bdo可以用来反转文本的方向，可以用来显示从右向左读的文本。必需的属性dir的值可以是ltr（左向右）和rtl（右向左）。</p><p><bdo dir=\"rtl\">god lmth</bdo><br />&nbsp;<br />kbd用于表明应由用户键入的文本。</p><p><p>Now type <kbd>woo hoo</kbd></p>&nbsp; </p><p>ins和del分别用于显示编辑插入和删除的文本。它可以有时间属性datetime（用YYYYMMDD的格式）和cite属性（用于说明为什么插入或者删除理由的一个URL）。</p><p>ins元素一般显示下划线，而del元素则一般显示删除线。</p><p><p>This is some <del datetime=\"20030522\">nonsense</del><br /><ins cite=\" informative stuff</ins><br />that I\'ve written.</p></p><p>表现（描述性）元素</p><p>b、 i、tt、sub、sup、big和small都是表现元素，因此，由于它们的精确性，不应该再使用当我们一再强调分离内容和表现。比如b定义粗体元素，没有任何意义──这些标签定义纯粹的可视化特征，应该是CSS的事。尽管他们是合法的标签，还有其他的（比如strong和em，是词组元素）可以实际地添加含义。如果你仅仅需要复制这些标签的样式，不需要任何相关的含义，你可以在span标签上应用CSS。</p>\r\n            <p align=\"center\"> </p>', '', '', '');
INSERT INTO `youbang_addonarticle` VALUES (16, 2, '<p>我们曾经为本节撰写的标题是：“XHTML:简单的规则，容易的方针。”原因之一是，本节讨论的规则和方针是简单和容易的。原因之二是，一本简单和容易的WEB设计图书，就像超级市场的新式的免费商品一样，虽然常见却可以有效地吸引人的眼球，这样的东西可以刺激人的兴趣，并且鼓励人们尝试。</p><p>我确实希望本节的内容可以激发你的兴趣，并鼓励你去尝试。为什么这么说呢？因为一旦你掌握了本章包含的简单容易的理念，你就会重新思考网页运作的方式，并开始改变建造它们的方法。然而我并不希望你只是将代码重新改写一边。我希望你可以实实在在地以另一种方式思考和工作。</p><p>另一方面，重构才是XHTML真正的意义。</p><p>在本章，我们将研究结构化标记的机制和涵义。如果你正在将网站标准融入你的开发项目，你或许会觉得本章的内容有些熟悉。不过即便是这方面的老手，也会从本章发现意外的收获。</p><p>XHTML规则概要<br />将传统的HTML转换为XHTML 1.0是快捷且无痛的，只要你遵守一些简单的规则和容易的方针。不管是否使用过HTML，都不会妨碍你使用XHTML。</p><p>使用恰当的文档类型声明和命名空间。 <br />使用meta元素声明你的内容类型。 <br />使用小写字母书写所有的元素和属性。 <br />为所有的属性值加引号。 <br />为所有的属性分配值。 <br />关闭所有的标签。 <br />使用空格和斜线关闭空标签。 <br />不要在注释中写双下划线。 <br />确保小于号及和号为<和& <br />Unicode和其他字符集<br />XML、XHTML、和HTML 4.0文档的默认字符集是Unicode，一个由Unicode联盟定义的标准。Unicode是一套全面的字符集，它为每个字符提供了一个特定的唯一的数字，不论平台、程序和语言。Unicode也是我们拥有的最接近通用字母表的事物，尽管它并不是一个字母表，而是一套数字映射方案。</p><p>尽管Unicode是web文档默认的字符集，开发人员依然可以自由地选择更适合他们的其他字符集。比方说，美国和西欧的网站常常使用ISO-8859-1 (Latin-1)编码，而中华人民共和国的国家标准是gb2312。</p><p>为表达语义而标记文档，而不是为了样式<br />记住：请最大限度地使用CSS来进行布局。在web标准的世界里，XHTML标记与表现无关，它只与文档结构有关。</p><p>结构良好的文档可以向浏览器传达尽可能多的语义，不论是浏览器位于掌上电脑还是时髦的桌面图形浏览器。结构良好的文档都能向用户传达可视化的语义，即使是在老的浏览器，或是在被用户关闭了CSS的现代浏览器中。</p><p>不是每个站点都能立即抛弃HTML表格布局。CSS的发明者，W3C，直到2002年11月才将官方网站转换为CSS布局。然而，即使是顽固的唯标准主义者也不总是将表现从结构中完全分离处理，至少在XHTML 1中是做不到的。但是现在，我们可以向这个理想迈出重大的一步，通过将表现从结构中分离（或者说将数据从设计中），即使是混合的传统的布局也可从中受益。 </p><p>下面有一些提示，可以帮助你通过更结构化的方式进行思维：</p><p>提纲内的色彩<br />在语法学校，我们中的大部分人都被迫使用标准的提纲格式来写文章。现在，我们成为了设计师，可以多么自由地摆脱提纲的限制，然后大胆地投身于独特的个人表达的自由领域（也许我们的宣传册和商业站点还不是那么独特和个人化）。但是至少我们不会再受到提纲的困扰了。</p><p>实际上，依照HTML，我们应该将内容结构化为有组织的层级。在浏览器不支持CSS的时期，我们无法在交付可供销售的布局的同时做到这一点。但是今天，在将我们的设计不折不扣地实现的同时，我们有能力交付内在结构良好的文档。</p><p>当你将供网络使用的文本进行标记，或者当你将已有的文本文档转换为网页时，请使用传统提纲的这些条目进行思考。</p><p><h1>我的主题</h1><br /><p>介绍性文字</p><br /><h2>补充性的观点</h2><br /><p>相关文字</p></p><p>\r\n            <p align=\"center\"> </p>', '', '', '');
INSERT INTO `youbang_addonarticle` VALUES (17, 2, '<p>FRAME（框架）是Web上经常会看到的页面结构。使用可视Web开发工具（比如Dreamweaver或者Frontpage），虽然可以在 WYSIWYG环境中通过简单的鼠标托拽完成FRAME的构建，但是要实现真正细致甚至强大的功能，仔细理解FRAME的代码结构至关重要！你将发现， FRAME原来是这样的亲切易用。 </p><p>　　<strong>创建基本的FRAMESET</strong> </p><p>　　FRAMESET页面与普遍的Web页面有些不同。虽然仍旧以<HTML>和包含标题的<HEAD>标记以及其他脚本开始，但是其内容仅仅是表示的各个页面的版式设计。因此，不再需要有<BODY>元素，只需要<FRAMESET>标记。 </p><p>　　通过<FRAMESET>标记的<rows>和<cols>属性，浏览器窗口被分割为一个个格子。 <rows>和<cols>的设置值可以是固定的像素值，可以是总空间的百分比值，还可以是用*以及一个数字相乘表示的分割剩余空间的比例值。比如说： </p><p>cols=\"80,20%,*\" 分为3列，宽度分别为80像素，窗口宽度的20％，以及剩余宽度 <br />rows=\"25%,75%\" 分为2列，宽度分别为窗口宽度的25％和75％ <br />rows=\"*,3*\" 与上述第2个表示的一样，分为2列，但表示方法不同：第一列宽度为第二列的1/3 </p><p>　　在<FRAMESET>和</FRAMESET>之间，用多个<FRAME>标记表示每个分割区。col 表示从左到右的列，row表示从上到下的行。每个<FRAME>有一个src属性，给出了这个FRAME的内容。它可以是浏览器能显示的任何一个合法URL，或者是另外一个FRAMESET。为预防递归现象，一个FRAME不能包含它本身所在的FRAMESET页面。要用name属性定义 FRAME的名字，这样就可以在代码或者脚本程序中引用它。 请看一段基本的FRAMESET代码： </p><p class=\"code\"><HTML> <br /><HEAD> <br /><TITLE>Simple FRAMESET</TITLE> <br /></HEAD> <br /><FRAMESET cols=\"40%,60%\" rows=\"2*,*\"> <br /><FRAME name=\"TopLeft\" src=\"red.htm\"> <br /><FRAME name=\"TopRight\" src=\"green.htm\"> <br /><FRAME name=\"BotLeft\" src=\"blue.htm\"> <br /><FRAME name=\"BotRight\" src=\"white.htm\"> <br /></FRAMESET> <br /></HTML> <br /><FRAMESET rows=\"105,*\"> <br /><FRAME name=\"adbanner\" src=\"ad.html\"> <br /><FRAMESET cols=\"40%,60%\"> <br /><FRAME name=\"left\" src=\"red.htm\"> <br /><FRAMESET rows=\"*,*\"> <br /><FRAME name=\"top\" src=\"blue.htm\"> <br /><FRAME name=\"bottom\" src=\"white.htm\"> <br /></FRAMESET> <br /></FRAMESET> <br /></FRAMESET> </p><p>　　<strong>FRAME间的链接</strong> </p><p>　　一个FRAMESET结构的页面，新文档只转载进窗口的一部分中，而其他页面则保持静态不变。当用户点击FRAME中的链接时，新内容就在同一 FRAME内打开。要让新内容在其他FRAME中打开，可以设置<A>标记的target属性值为那个FRAME的name值。 </p><p>　　而且，我们还可以设置打开目标为当前可见的任意一个FRAME，而不局限于本身的FRAMESET。目标可能是一个嵌套的FRAMESET中的 FRAME，也可能是其他窗口中的FRAME。但是如果目标FRAME不存在，就会产生一个带有目标FRAME名字的新窗口。 </p><p>　　下面举个例子说明一下，假设有一个简单含2－FRAME的FRAMESET，文件名叫做home.html，代码如下： </p><p class=\"code\"><HTML> <br /><HEAD><TITLE>FrommCo home page</TITLE></HEAD> <br /><FRAMESET cols=\"115,*\"> <br /><FRAME src=\"menu.htm\"> <br /><FRAME name=\"content\" src=\"main.htm\"> <br /></FRAMESET> <br /></HTML> </p><p>　　文件menu.htm在左边的FRAME中，其中有一系列链接，点击它们后新内容将在右边的叫做content的FRAME中打开。下面是menu.html的代码： </p><p class=\"code\"><HTML><HEAD></HEAD> <br /><BODY><P><BR> <br /><IMG src=\"Images/tmp_logo.gif\" alt=\"FrommCo\"><P> <br /><A href=\"main.htm\" target=\"content\">Main page</A><P> <br /><A href=\"mission.htm\" target=\"content\">Our mission</A><P> <br /><A href=\"staff.htm\" target=\"content\">Our staff</A><P> <br /><A href=\"splash.htm\" target=\"_parent\">FrommCo splash page</A> <br /></BODY></HTML> </p><p>　　请注意最后一个链接中target的定义为_parent，这属于4个特殊的保留值。它们是： </p><p>_parent：在当前FRAMESET位置显示新href。 <br />_top：在当前整个窗口位置显示新href，比如本身FRAMESET位于另一个FRAMESET中。 <br />_self：强制在当前FRAME中显示新href。 <br />_blank：在新窗口中显示href。 </p><p>　　表示客户端图形地图的<AREA>标记同样可以应用target属性，比如： </p><p class=\"code\">　　<AREA shape=circle coords=\"75,75,50\" href=\"main.htm\" target=\"content\" alt=\"Main page\"> </p><p>　　还有一种经常的情况是：Web页面中的大部分或者全部链接都要求在一个特别的FRAME中打开。这时，可以在页面的<HEAD>代码区使用<BASE>标记设置默认的target，然后再分别定义特殊链接的target值。 </p><p>　　<strong>修饰FRAME</strong> </p><p>　　FRAMESET不仅在宽度、高度等方面具有可控制的数值，在美观方面也同样可以精确设置。 </p><p>　　默认情况下，FRAMESET的FRAME间有一个凸起的边沿，表示分割效果。如果不喜欢这个，想营造“无缝连接”的效果，可以在< FRAME>标记中设置FRAMEborder=0来消除它。在3.0及高版本的Navigator和Internet Explorer中，如果在<FRAMESET>标记中设置FRAMEborder=0，那么除了设置为FRAMEborder=1的 FRAME外，所有其他FRAME的边沿都将消失。 </p><p>　　虽然设置了FRAMEborder=0，有些浏览器仍旧会在FRAME间保留一些边沿的颜色痕迹。这时，可以在< FRAMESET>标记中添加FRAMEspacing=0（对Internet Explorer）或者border=0（对Navigator和Opera）实现真正的无缝连接。 </p><p>　　请看下面的代码是如何使用这些属性的： </p><p class=\"code\"><HTML> <br /><HEAD><TITLE>FrommCo home page</TITLE></HEAD> <br /><FRAMESET cols=\"115,*\" FRAMEspacing=0 border=0> <br /><FRAME src=\"menu.htm\" FRAMEborder=0 noresize scrolling=no> <br /><FRAME name=\"content\" src=\"main.htm\" FRAMEborder=0> <br /></FRAMESET> <br /></HTML> </p><p>　　上面的代码中有2个新的属性：noresize表示锁住FRAME而不允许使用鼠标改变大小，scrolling=no表示屏蔽FRAME的滚动条，scrolling=yes表示允许，scrolling=auto表示根据显示内容需要自动显示滚动条。 </p><p>　　<strong>浮动FRAME </strong></p><p>　　浮动FRAME是HTML4.0规范中的一个定义，目前的浏览器都支持它。 </p><p>　　不象FRAMESET表示的分割区样子，一个浮动FRAME作为一个内置对象存在于Web页面上，其样式就象一个页面上的一个图形或者一个 applet。浮动FRAME使用<IFRAME>标记，它具有与<FRAME>相同的大多数属性设置，包括：name、 src、marginwidth、marginheight、FRAMEborder以及scrolling。同时，它还具有与图形或者applet一样的height、width和align属性。 </p><p>　　而且，浮动FRAME遵循与普通FRAME一样的target原则：我们可以通过它的name来指向它。本原则适用于在任一类型FRAME中的浮动FRAME，反之易然。浮动FRAME中的没有traget的链接指向它本身，而_parent链接则指向包含<IFRAME>的文档所在的FRAME或者窗口。比如： </p><p class=\"code\"><IFRAME name=\"floater\" src=\"start.htm\" width=150 height=200 hspace=10 align=left> <br /><IMG src=\"Images/noFRAME.gif\" alt=\"You can\'t see the floating FRAME\" <br />width=150 height=200 hspace=10 align=right> <br /></IFRAME><BR> <br /><A href=\"one.htm\" target=\"floater\">Show one.htm</A><P> <br /><A href=\"two.htm\" target=\"floater\">Show two.htm</A><P> <br /><A href=\"start.htm\" target=\"floater\">Bring back start.htm</A> </p><p>　　注意，对应支持<IFRAME>标记的浏览器，任何位于<IFRAME>和</IFRAME>间的内容都将忽略。反之，其中的内容将显示出来，这可以用作解释当前浏览器不支持<IFRAME>。 </p><p>　　<strong>何时使用FRAME</strong> </p><p>　　我们知道，FRAMESET的基本用途就是分割浏览器窗口，使得窗口的一部分内容改变，而其他部分保持不变。利用这个特性，就可以实现工具栏导航功能，一个FRAME内放置静态菜单页面，用户点击其中的项目后，在另外的FRAME内显示相关的内容。这样就可以从整体上减少文件大小，因为不必在每个内容页面中再包含菜单项目。 </p><p>　　FRAME有2个明显的不足： </p><p>　　FRAME从另外的级别上增加了站点的管理，原因在于超级链接不仅仅要指向适当的页面，而且也会装载到相关的FRAME内。 </p><p>　　另外，大多数浏览器在执行“添加书签”的操作时，只能记录下FRAMESET的初始位置。不管添加书签时是位于多么深的FRAMESET中，当再次选择这个书签时，就会返回到FRAMESET的初始页面。这就加大了访问者浏览指定内容的难度。 </p><p>　　但是，如果好好地组织站点信息，使导航操作只有不深的几层，那么，使用FRAME就能很好地为访问者服务。记住：访问者都希望简洁的导航信息。 </p><p>　　当然，导航并非是使用FRAME的唯一原因，也可以使用FRAME创建交换工具和交换页面。而且，FRAME的多文档框架结构非常适于被JavaScript应用程序所操作。 </p><p>　　<strong>用FRAME设计站点 </strong></p><p>　　最常用的FRAME结构就是“菜单－内容”FRAMESET。一个FRAME内放置导航菜单，另一个FRAME内转载子菜单，每个子菜单的链接就指向本身。唯一的有target的链接都在菜单FRAME内。 请看下面的例程代码： </p><p class=\"code\"><HTML><HEAD> <br /><TITLE>Welcome to my site!</TITLE> <br /></HEAD> <br /><FRAMESET cols=\"150,*\"> <br /><FRAME name=\"menu\" src=\"menu.htm\"> <br /><FRAME name=\"content\" src=\"intro.htm\"> <br /></FRAMESET> <br /><BODY> <br /><!--如果是支持FRAME的浏览器，则不会显示下面的内容；否则，也显示出简单菜单页面--> <br />Welcome to my site.<P> <br /><A href=\"intro.htm\">Introduction</A> <br /><A href=\"products.htm\">Products</A> <br /><A href=\"reviews.htm\">Reviews</A> <br /></BODY></HTML>\r\n            <p align=\"center\"> </p>', '', '', '');
INSERT INTO `youbang_addonarticle` VALUES (18, 2, '近来，随着XHTML（可扩展HTML）标准的出现，<script/>标签也经历了一些改变。该标签不再用language特性，而用type特性声明内嵌代码或要加入的外部文件的mime类型，JavaScript的mime类型是\"text/javascript\"。例如：<p class=\"code\"><html>&nbsp; <br />　<head>&nbsp; <br />　<title>Title of Page</title>&nbsp; <br />　<script type=”text/javascript”>&nbsp; <br />　var i = 0;&nbsp;&nbsp; <br />　</script>&nbsp; <br />　<script type=”text/javascript” src=”../scripts/external.js”></script>&nbsp; <br />　</head>&nbsp; <br />　<body>&nbsp; <br />　<!-- body goes here -->&nbsp; <br />　</body>&nbsp; <br /></html>&nbsp; </p><p>　　即使许多浏览器不完全支持XHTML，但大多数开发者现在都用type特性，而不用language特性，以提供更好的XHTML支持。省略language特性不会带来任何问题，因为如前所述，所有浏览器都默认<script/>的该属性值为JavaScript。</p><p>　　XHTML的第二个改变是使用CDATA段。XML中的CDATA段用于声明不应被解析为标签的文本（XHTML也是如此），这样就可以使用特殊字符，如小于（<）、大于（>）、和号（&）和双引号（\"），而不必使用它们的字符实体。考虑下面的代码：</p><p class=\"code\"><SCRIPT type=”text/javascript”>&nbsp; <br />　function compare(a, b) {&nbsp; <br />　if (a < b) {&nbsp; <br />　alert(“A is less than B”);&nbsp; <br />　} else if (a > b) {&nbsp; <br />　alert(“A is greater than B”);&nbsp; <br />　} else {&nbsp; <br />　alert(“A is equal to B”);&nbsp; <br />　}&nbsp; <br />}&nbsp; <br /></SCRIPT>&nbsp; </p><p>　　这个函数相当简单，它比较数字a和b，然后显示消息说明它们的关系。但是，在XHTML中，这段代码是无效的，因为它使用了三个特殊符号，即小于、大于和双引号。要修正这个问题，必须分别用这三个字符的XML实体<、>和\"替换它们：</p><p class=\"code\"><SCRIPT type=”text/javascript”>&nbsp; <br />function compare(a, b) {&nbsp; <br />if (a < b) {&nbsp; <br />alert(\"A is less than B\");&nbsp; <br />} else if (a > b) {&nbsp; <br />131&nbsp; <br />JavaScript in the Browser&nbsp; <br />alert(\"A is greater than B\");&nbsp; <br />} else {&nbsp; <br />alert(\"A is equal to B\");&nbsp; <br />}&nbsp; <br />}&nbsp; <br /></SCRIPT>&nbsp; </p><p>　　这段代码存在两个问题。首先，开发者不习惯用XML实体编写代码。这使代码很难读懂。其次，在JavaScript中，这种代码实际上将视为有语法错，因为解释程序不知道XML实体的意思。用CDATA段即可以以常规形式（即易读的语法）编写JavaScript代码。正式加入CDATA段的方法如下：</p><p class=\"code\"><SCRIPT type=”text/javascript”><br /><![CDATA[&nbsp; <br />function compare(a, b) {&nbsp; <br />if (a < b) {&nbsp; <br />alert(“A is less than B”);&nbsp; <br />} else if (a > b) {&nbsp; <br />alert(“A is greater than B”);&nbsp; <br />} else {&nbsp; <br />alert(“A is equal to B”);&nbsp; <br />}&nbsp; <br />}&nbsp; <br />]]><br /></SCRIPT></p><p>　　虽然这是正式方式，但还要记住，大多数浏览器都不完全支持XHTML，这就带来主要问题，即这在JavaScript中是个语法错误，因为大多数浏览器还不认识CDATA段。</p><p>　　当前使用的解决方案模仿了“对旧浏览器隐藏”代码的方法。使用单行的JavaScript注释，可在不影响代码语法的情况下嵌入CDATA段：</p><p class=\"code\"><SCRIPT type=”text/javascript”>&nbsp; <br />//<![CDATA[&nbsp; <br />function compare(a, b) {&nbsp; <br />if (a < b) {&nbsp; <br />alert(“A is less than B”);&nbsp; <br />} else if (a > b) {&nbsp; <br />alert(“A is greater than B”);&nbsp; <br />} else {&nbsp; <br />alert(“A is equal to B”);&nbsp; <br />}&nbsp; <br />}&nbsp; <br />//]]>&nbsp; <br /></SCRIPT></p>\r\n            <p align=\"center\"> </p>', '', '', '');
INSERT INTO `youbang_addonarticle` VALUES (19, 2, '<p><strong>HTML标签拥有属性。每个标签的特殊属性均被列于每个标签描述之下。这里列出的属性是通用于每个标签的核心属性和语言属性（有个别例外）：</strong></p><h3>核心属性 (Core Attributes)</h3><p>以下标签不提供下面的属性：base、head、html、meta、param、script、style以及title元素。</p><table><tbody><tr><th class=\"xhtml_sa\">属性</th><th class=\"xhtml_sv\">值</th><th class=\"xhtml_sd\">描述</th></tr><tr><td>class</td><td>class_rule or style_rule</td><td>元素的类(class)</td></tr><tr><td>id</td><td>id_name</td><td>元素的某个特定id。</td></tr><tr><td>style</td><td>样式定义</td><td>内联样式定义。</td></tr><tr><td>title</td><td>提示文本</td><td>显示于提示工具中的文本。</td></tr></tbody></table><h3>语言属性 (Language Attributes)</h3><p>以下标签不提供下面的属性：base、br、frame、frameset、hr、iframe、param以及script元素。</p><table><tbody><tr><th class=\"xhtml_sa\">属性</th><th class=\"xhtml_sv\">值</th><th class=\"xhtml_sd\">描述</th></tr><tr><td>dir</td><td>ltr | rtl</td><td>设置文本的方向。</td></tr><tr><td>lang</td><td>语言代码</td><td>设置语言代码。</td></tr></tbody></table><h3>键盘属性 (Keyboard Attributes)</h3><table><tbody><tr><th class=\"xhtml_sa\">属性</th><th class=\"xhtml_sv\">值</th><th class=\"xhtml_sd\">描述</th></tr><tr><td>accesskey</td><td>字符</td><td>设置访问某元素的键盘快捷键。</td></tr><tr><td>tabindex</td><td>数</td><td>设置某元素的Tab次序。</td></tr></tbody></table>\r\n            <p align=\"center\"> </p>', '', '', '');
INSERT INTO `youbang_addonarticle` VALUES (20, 2, '<p><strong>HTML文档是由HTML元素构成的文本文件。</strong></p><p><strong>HTML元素是通过使用HTML标签进行定义的。</strong></p><dl><dt>HTML标签 </dt><dd><ul><li>HTML标签是用来<em>标记HTML元素</em>的。 </li><li>HTML标签<em>被<和>符号包围</em>。 </li><li>这些包围的符号叫作。 </li><li>HTML标签是<em>成对出现</em>的。例如<b>和</b>。 </li><li>位于<em>起始标签</em>和<em>终止标签</em>之间的文本是元素的内容。 </li><li>HTML标签<em>对大小写不敏感</em>，<b>和<B>的作用的相同的。 </li></ul></dd></dl><h3>HTML元素</h3><p>还记得上一节中的那个例子吗：</p><pre class=\"code\"><html>\r\n<head>\r\n<title>页面的标题</title>\r\n</head>\r\n<body>\r\n<p>这是我的第一个页面。</p>\r\n<code><b>此文本是粗体的。</b></code>\r\n</body>\r\n</html></pre><p>这就是一个HTML元素：</p><pre class=\"code\"><b>此文本是粗体的。</b></pre><p>这个HTML元素由<em>起始标签<b></em>开始。</p><p>这个元素的内容是：“此文本是粗体的。”。</p><p>这个HTML元素由<em>终止标签</b></em>结尾。</p><p><b>标签的作用是定义一个显示为粗体的HTML元素。</p><p>这也是一个HTML文档：</p><pre class=\"code\"><body>\r\n<p>这是我的第一个页面。</p>\r\n<b>此文本是粗体的。</b>\r\n</body></pre><p>这个HTML元素开始于<body>标签，结束于</body>标签。</p><p><body>标签的作用是定义HTML文件中的容纳body的HTML元素。</p><h3>为什么我们要使用小写的标签？</h3><p>我们刚才讲到：HTML标签对大小写是不敏感的：<b>和<B>的作用的相同的。当您在网上冲浪时，您会发现大多数教程在他们的例子中都使用大写的HTML标签。而我们总是使用小写。原因何在呢？</p><p>如果您希望为使用下一代HTML而做好准备，您就应该使用小写标签。万维网协会(W3C)的标准是：建议在HTML 4中使用小写标签，而在XHTML（下一代HTML）中，必须使用小写标签。</p><h3>标签属性</h3><p>标签可以有属性。属性可以为您的页面中的HTML元素提供附加的信息。</p><p>如前所述，<body>标签用来定义页面的body元素。通过添加一个bgcolor属性，您可以告知浏览器将页面的背景颜色显示为红色，就像这样：<body bgcolor=\"red\">。</p><p><table>用来定义一个HTML表格。通过添加一个border属性，您可以告知浏览器显示一个没有边框的表格：<table border=\"0\">。</p><p>属性由属性名和值组成，就像这样：name=\"value\"。</p><p>属性应该被添加到HTML元素的起始标签。</p><h3>单引号还是双引号？</h3><p>属性值应被置于引号之间。通常情况下应该使用双引号，不过使用单引号也没有问题。</p><p>但是在个别的情况下，比如属性值本身就含有双引号，那么您必须使用单引号，例如：</p><p>name=\'John\"ShotGun\"Nelson\'</p>\r\n            <p align=\"center\"> </p>', '', '', '');
INSERT INTO `youbang_addonarticle` VALUES (21, 3, '<p>当然，每个人都可以编写CSS代码，甚至你现在已经让它为你的项目工作了。但是CSS还可以更好吗？开始用这5个Tips改进你的CSS吧！</p>\r\n<h3>1.重置</h3>\r\n<p>首先，很认真的告诉你，<strong>总是要重置某些分类</strong>。无论你是使用 、或者你自己编写的重置代码，只要使用就对了。</p>\r\n<p>它能很简单的移除所有元素的填充（padding）和边距（margin）：</p>\r\n<ol>\r\n    <li>html, body, div, h1, h2, h3, h4, h5, h6, ul, ol, dl, li, dt, dd, p, blockquote,</li>\r\n    <li>pre, form, fieldset, table, th, td { margin: 0; padding: 0; }</li>\r\n</ol>\r\n<p>Eric Meyer Reset和YUI Reset都是非常强大的，但是对于我而言，它们走的太远了。我觉得你最终需要重置一切，然后重新定义所有元素的属性。这就是为什么Eric Meyer推荐更有效的使用（重置样式表），而你不要只是使用他的重置样式表，将它拖放到你的项目中。调整它（的重置样式表），建立属于自己的重置样式 表。</p>\r\n<p>噢，请停止使用：</p>\r\n<p>* { margin: 0; padding: 0; }</p>\r\n<p>花更多的时间去制作它，当你移除了填充（padding）你认为单选按钮会发生什么变化？表单元素有时能够做些时髦的事情，所以最有效的方式就是将他们独立。</p>\r\n<h3>2.排序</h3>\r\n<p><strong>一个小的测试</strong><br />\r\n这个例子就是要让你思考如何更快的<strong>找到右边距属性</strong>？</p>\r\n<p><strong>Example#1</strong></p>\r\n<p><code><br />\r\ndiv#header h1 {<br />\r\nz-index: 101;<br />\r\ncolor: #000;<br />\r\nposition: relative;<br />\r\nline-height: 24px;<br />\r\nmargin-right: 48px;<br />\r\nborder-bottom: 1px solid #dedede;<br />\r\nfont-size: 18px;<br />\r\n}<br />\r\n</code></p>\r\n<p><strong>Example#2</strong></p>\r\n<p><code><br />\r\ndiv#header h1 {<br />\r\nborder-bottom: 1px solid #dedede;<br />\r\ncolor: #000;<br />\r\nfont-size: 18px;<br />\r\nline-height: 24px;<br />\r\nmargin-right: 48px;<br />\r\nposition: relative;<br />\r\nz-index: 101;<br />\r\n}<br />\r\n</code></p>\r\n<p>你不能告诉我Example#2不能更快的找到右边距属性。根据字母排序你的元素属性。一致的创建你的CSS，将帮助你节省花费在寻找一个特殊属性的时间。</p>\r\n<p>我知道一些人用这样的方法去组织代码，其他人又用另一种方法去组织，但是在我的公司，我们协商一致做出决定，所有的代码都将按照字母排序来组织。通过这样组织代码与其他人协同工作一定是有帮助的。当我碰到属性没有按照字母排序的层叠样式表我每一次都会退缩。</p>\r\n<h3>3.组织</h3>\r\n<p>你应该组织你的样式表以致相关的内容靠在一起，更简单的找到想要的。使用更有效的注解。举个例子，这是我如何构造我的层叠样式表：</p>\r\n<p>/*****Reset*****/<br />\r\n移除元素的填充（padding）和边距（margin）。<br />\r\n/*****Basic Elements*****/<br />\r\n定义基本元素的样式: body, h1-h6, ul, ol, a, p, 等.<br />\r\n/*****Generic Classes*****/<br />\r\n定义简单的风格，好像浮动的某一侧, 移除元素的下边距, 等当然，它们大部分都与我们希望的语义不相关,但是它们是高效处理代码所必须的。<br />\r\n/*****Basic Layout*****/<br />\r\n定义基本的模板: header, footer等. 帮助定义网页布局的基本元素<br />\r\n/*****Header*****/<br />\r\n定义所有Hearder元素<br />\r\n/*****Content*****/<br />\r\n定义所有内容框内的元素<br />\r\n/*****Footer*****/<br />\r\n定义所有Footer的元素<br />\r\n/*****Etc*****/<br />\r\n定义其他的选择器。通过注解和归类相似元素的分组，将更快的找到你想要的。</p>\r\n<h3>4.一致性</h3>\r\n<p>无论你决定使用什么方式去编写代码，保持一致。我已经对全部放在1行VS多行的CSS编写编写方式的争论感到乏味和疲倦。这是不需要争辩的。每个人都有自己的观点，所以选择一种你喜欢的工作方式，并在所有的样式表中保持一致。</p>\r\n<p>就我个人而言，我将使用两者结合的方式。如果一个选择器超过了3个属性，我将截断它采用多行的方式编写。</p>\r\n<p><code><br />\r\ndiv#header { float: left; width: 100%; }<br />\r\ndiv#header div.column {<br />\r\nborder-right: 1px solid #ccc;<br />\r\nfloat: rightright;<br />\r\nmargin-right: 50px;<br />\r\npadding: 10px;<br />\r\nwidth: 300px;<br />\r\n}<br />\r\ndiv#header h1 { float: left; position: relative; width: 250px; }<br />\r\n</code></p>\r\n<p>所以找到你喜欢的工作方式然后保持一致。</p>\r\n<h3>5.从正确的地方开始</h3>\r\n<p><strong>在完成标记语言之前不要去尝试靠近你的样式表。</strong></p>\r\n<p>当我准备分割一张网页的时候，创建CSS文件之前，我需要预览并且标记body开标签到body的闭合标签之间的所有文档。我不会增加额外的DIV ,ID,或者类选择器。我将会添加一些一般的DIV，就好像hearder、content、footer.因为我知道这些东西是现实存在的。</p>\r\n<p>通过先标记文档，你将不会碰到本已注定的divities1和classitis2麻烦!/*You only need to add in that stuff once you have begun to write the CSS and realize that you are going to need another hook to accomplish what you are trying to achieve.*/(原文未译）。</p>\r\n<p>利用CSS子选择器指定子元素；不要只是机械的给元素添加类或者ID选择器。记住：<strong>没有一个良好的格式化文档（或者标记结构）CSS是无价值的。</strong></p>\r\n<h3>总结</h3>\r\n<p>这些Tips能够帮助我更好的完成CSS代码的编写。但是这并不意味着这张列表的结束，接下来我将会去带来一些其他的与大家分享。</p>\r\n<strong>你有什么更好的Tips帮助我们完善CSS代码？</strong>\r\n            <p align=\"center\"> </p>', '', '', '');
INSERT INTO `youbang_addonarticle` VALUES (22, 3, '<p>CSS? Isn\'t that a multiplayer game?<br />\r\n第0级：CSS？那不是一个多人射击游戏吗？<br />\r\n有些人因为在找CS:S（Counter Strike: Source）这款游戏的资讯而进到#CSS网站。不必担心这些人，他们不可能制作太多网页，所以对网络也不会造成多大伤害。</p>\r\n<p>Yeah, I use it to remove underlines on links sometimes<br />\r\n第1级：是啊，我偶尔用它来移除连结的底线</p>\r\n<p>和第0级的人不同，这些人学过HTML，也制作过几个简单的网站。他们只有在无法使用HTML制作出某些效果时，才会使用CSS，例如移除连结的底线或者设定行高。这些人的网站通常规模不大也没什么访客，所以他们也不会对网络造成太大伤害。</p>\r\n<p>No, I don\'t like divs; tables are much easier to work with<br />\r\n第2级：不，我不喜欢div元素；表格好用多了</p>\r\n<p>他们听过使用div元素来设计网页这件事，也花了些时间学习CSS。不过他们很快就放弃了，觉得CSS太难而且支持度不佳，还是宁可用表格排版。<br />\r\n注意！他们是危险人物！他们在这个领域已经待了一段时间，许多都是网站部门的主管。和他们接触是很重要的，提倡网络标准的人应该多多开导他们，这对网络的意义非同小可。</p>\r\n<p>Yes I\'ve heard it\'s good, but I can’t use it because of…<br />\r\n第3级：是啊，听说它挺好的，不过我没用它因为……</p>\r\n<p>这些人虽然知道CSS的优点，不过总是基于某些原因而无法使用它，例如他们可能有第2级的上司，或者他们必须考虑到Netscape 4的使用者。<br />\r\n旧 版的浏览器虽然不支持CSS，不过使用者还是可以看见完整的内容。而基于亲和力（accessibility）和易用性（usability）的好 处，CSS可以为网站带来更多访客。把这些优点告诉第3级的开发人员，即使他们不是决策者，或许多少能对第2级的上司发挥点影响力吧。</p>\r\n<p>CSS? Oh! Yes, I use divs for all my layouts<br />\r\n第4级：CSS？喔！没错，我用div元素来排版</p>\r\n<p>在 页面中使用过多的div元素反而是这群人的问题，他们会用#toprightredline或是#r5_c7（表示第5列第7栏）这样的方式设定div元 素的id。即使可以通过XHTML 1.1的验证，这种排版方式却无法发挥CSS的优势。荧幕朗读软体（screen readers，视障者使用的浏览器）很难解译这些网页，旧版浏览器也会有同样的问题，网页的内容无法完整显示。而不良的class与id命名方式，也对 于版面的修改造成极大不便。<br />\r\n虽然第4级的人制作的网站仍然很糟，不过由于他们很容易接受新的观念，因此对网络造成的伤害较小。许多所见即所得（WYSIWYG）的编辑器制作出充满div元素的原始码，可能也是误导这群人的原因。幸好这些编辑器已经逐渐改良了，希望这会有助于第4级的人继续往上提升。</p>\r\n<p>I use CSS for design, it\'s better than tables because of…<br />\r\n第5级：我用CSS来设计，这比表格好多了，因为……</p>\r\n<p>第5级的人知道CSS的优点并乐于使用，虽然有时会遇到些问题，但并不严重。他们也能运用长期的CSS工作经验，与人辩论为什么要将网页的结构与设计分开。我猜这篇文章大部分的读者是这一级的CSS开发人员，我想我自己也是。不过这还不是最好的……</p>\r\n<p>What version of CSS? Yes, I do. Did you read my book about…<br />\r\n第6级：哪个版本的CSS？是的，我知道啊。你有读过我的书关于……</p>\r\n<p>第 6级的人致力于改良CSS，并且写了许多很棒的文章介绍它的新用法。其中有些人将W3C关于CSS的说明文件全部读完了，并且知道哪些功能在哪个版本的浏 览器才有支持。他们是CSS初学者的典范，并且运用他们的影响力使网络更加进步。其中有许多人组成了Web Standards Project，如果你在他们的网站上面发现任何错误，那一定是有理由的，向他们请教之后你必能获得满意的解答。</p>\r\n\r\n            <p align=\"center\"> </p>', '', '', '');
INSERT INTO `youbang_addonarticle` VALUES (23, 3, '<p>　　在进行页面的DIV+CSS排版时，遇到IE6（当然有时Firefox下也会偶遇）浏览器中的图片元素img下出现多余空白的问题绝对是常见的对於 该问题的解决方法也是「见机行事」，根据原因的不同要用不同的解决方法，这里把解决直接把解决image图片布局下边的多余空隙的BUG的常用方法归纳， 供大家参考。<br />\r\n<strong>1、将图片转换为块级对像</strong><br />\r\n即，设置img为：<br />\r\n<code>display:block;</code><br />\r\n在本例中添加一组CSS代码：<br />\r\n<code>#sub img {display:block;}</code><br />\r\n<strong>2、设置图片的垂直对齐方式</strong><br />\r\n即设置图片的vertical-align属性为「top，text-top，bottom，text-bottom」也可以解决。如本例中增加一组CSS代码：<br />\r\n<code>#sub img {vertical-align:top;}</code><br />\r\n<strong>3、设置父对象的文字大小为0px</strong><br />\r\n即，在#sub中添加一行：<br />\r\n<code>font-size:0;</code><br />\r\n可以解决问题。但这也引发了新的问题，在父对像中的文字都无法显示。就算文字部分被子对像括起来，设置子对像文字大小依然可以显示，但在CSS效验的时候会提示文字过小的错误。<br />\r\n<strong>4、改变父对象的属性</strong><br />\r\n如果父对象的宽、高固定，图片大小随父对像而定，那麽可以设置：<br />\r\n<code>overflow:hidden;</code><br />\r\n来解决。如本例中可以向#sub中添加以下代码：<br />\r\n<code>width:88px;height:31px;overflow:hidden;</code><br />\r\n<strong>5、设置图片的浮动属性</strong><br />\r\n即在本例中增加一行CSS代码：<br />\r\n<code>#sub img {float:left;}</code><br />\r\n如果要实现图文混排，这种方法是很好的选择。<br />\r\n<strong>6、取消图片标签和其父对象的最後一个结束标签之间的空格。</strong><br />\r\n这个方法要强调下，在实际开发中该方法可能会出乱子，因为在写代码的时候为了让代码更体现语义和层次清晰，难免要通过IDE提供代码缩进显示，这必然 会让标签和其他标签换行显示，比如说DW的「套用源格式」命令。所以说这个方法可以供我们了解出现BUG的一种情况，具体解决方案的还得各位见招拆招了。</p>\r\n            <p align=\"center\"> </p>', '', '', '');
INSERT INTO `youbang_addonarticle` VALUES (24, 3, '副标题#e#\r\n           <p>&nbsp;</p>\r\n\r\n<p><img height=\"400\" width=\"300\" alt=\"css-导航菜单-教程\" src=\"http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F603910L60-12363.jpg\" title=\"css-导航菜单-教程\" /></p>\r\n<p>在当今标准的Web设计中，CSS是最重要的组成部分。为了让大家更好的理解如何通过CSS来设计，彬Go为大家收集了30个基于CSS的导航菜单 和按钮的CSS设计教程，通过这些教程，您可以在您今后的项目中更方便的直接使用或参考，当然也可以用作平时的实践练习。希望大家能从中学到些什么。</p>\r\n<h3>CSS导航及菜单教程</h3>\r\n<p>01.<br />\r\n<img height=\"164\" width=\"500\" alt=\"CSS-导航-教程\" src=\"http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F603911I5P-2C22.jpg\" /><br />\r\n02.<br />\r\n<img height=\"130\" width=\"500\" alt=\"CSS-导航-实例\" src=\"http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F60391230410-3F40.jpg\" /><br />\r\n03.<br />\r\n<img height=\"150\" width=\"500\" alt=\"CSS-导航\" src=\"http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F603912JE0-4W09.jpg\" /><br />\r\n04.<br />\r\n<img height=\"210\" width=\"500\" alt=\"CSS-导航-源代码\" src=\"http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F6039132K30-52a7.jpg\" /><br />\r\n05.<br />\r\n<img height=\"102\" width=\"500\" alt=\"DIV-CSS-导航\" src=\"http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F603913UO0-62a9.jpg\" /><br />\r\n06.<br />\r\n<img height=\"109\" width=\"500\" alt=\"CSS-导航-教程\" src=\"http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F60391423R0-L356.jpg\" /><br />\r\n07.<br />\r\n<img height=\"137\" width=\"500\" alt=\"CSS-导航-实例\" src=\"http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F603914E350-W2a.jpg\" /><br />\r\n08.<br />\r\n<img height=\"92\" width=\"500\" alt=\"CSS-导航\" src=\"http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F60391514S0-93P4.jpg\" /><br />\r\n09.<br />\r\n<img height=\"127\" width=\"500\" alt=\"CSS-导航-源代码\" src=\"http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F60391563410-1040O.jpg\" /><br />\r\n10.<br />\r\n<img height=\"131\" width=\"500\" alt=\"DIV-CSS-导航\" src=\"http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F60391601240-113Y5.jpg\" /><br />\r\n11.<br />\r\n<img height=\"210\" width=\"500\" alt=\"CSS-导航-教程\" src=\"http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F603916440-12NY.jpg\" /><br />\r\n12.<br />\r\n<img height=\"150\" width=\"500\" alt=\"CSS-导航-实例\" src=\"http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F60391E00P-13B47.jpg\" /><br />\r\n13.<br />\r\n<img height=\"150\" width=\"500\" alt=\"CSS-导航\" src=\"http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F60391K3a0-149357.jpg\" /><br />\r\n14. <br />\r\n<img height=\"191\" width=\"500\" alt=\"CSS-导航-源代码\" src=\"http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F60391PMF-15Z17.jpg\" /><br />\r\n15.<br />\r\n<img height=\"210\" width=\"500\" alt=\"DIV-CSS-导航\" src=\"http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F60391VD20-1E627.jpg\" /></p>\r\n<p>\r\n            <p align=\"center\"> </p>\r\n          \r\n        \r\n        #p#副标题#e#</p>\r\n<h3>CSS按钮教程</h3>\r\n<p>16.<br />\r\n<img height=\"165\" width=\"500\" alt=\"CSS-按钮-源代码\" src=\"http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F60391915130-1ND5.jpg\" /><br />\r\n17.<br />\r\n<img height=\"103\" width=\"500\" alt=\"CSS-按钮\" src=\"http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F60391a4Y0-1Sa3.jpg\" /><br />\r\n18.<br />\r\n<img height=\"164\" width=\"500\" alt=\"CSS-按钮-教程\" src=\"http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F60392016450-194K3.jpg\" /><br />\r\n19.<br />\r\n<img height=\"210\" width=\"500\" alt=\"CSS-按钮-实例\" src=\"http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F603920H920-20I17.jpg\" /><br />\r\n20.<br />\r\n<img height=\"131\" width=\"500\" alt=\"CSS-教程\" src=\"http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F6039213010-21S04.jpg\" /><br />\r\n21.<br />\r\n<img height=\"168\" width=\"500\" alt=\"CSS-按钮-源代码\" src=\"http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F603921L030-22DN.jpg\" /><br />\r\n22.<br />\r\n<img height=\"121\" width=\"500\" alt=\"CSS-按钮\" src=\"http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F60392224a0-23XD.jpg\" /><br />\r\n23.<br />\r\n<img height=\"123\" width=\"500\" alt=\"CSS-按钮-教程\" src=\"http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F603922J340-24DP.jpg\" /><br />\r\n24.<br />\r\n<img height=\"104\" width=\"500\" alt=\"CSS-按钮-实例\" src=\"http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F6039233010-255611.jpg\" /><br />\r\n25.<br />\r\n<img height=\"169\" width=\"500\" alt=\"CSS-教程\" src=\"http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F603923R060-2E521.jpg\" /><br />\r\n26.<br />\r\n<img height=\"159\" width=\"500\" alt=\"CSS-按钮-源代码\" src=\"http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F60392430350-2J516.jpg\" /><br />\r\n<br />\r\n<img height=\"210\" width=\"500\" alt=\"CSS-按钮\" src=\"http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F603924Q40-2Sa8.jpg\" /><br />\r\n28.<br />\r\n<img height=\"140\" width=\"500\" alt=\"CSS-按钮-教程\" src=\"http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F6039252U60-293B6.jpg\" /><br />\r\n29.<br />\r\n<img height=\"150\" width=\"500\" alt=\"CSS-按钮-实例\" src=\"http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F603925O340-30F38.jpg\" /><br />\r\n30.<br />\r\n<img height=\"127\" width=\"500\" alt=\"CSS-教程\" src=\"http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F6039262L40-31W01.jpg\" /></p>\r\n<p>英文原文:<br />\r\n翻译原文:(暴风彬彬)</p>\r\n\r\n            <p align=\"center\"> </p>', '', '', '');
INSERT INTO `youbang_addonarticle` VALUES (25, 3, '副标题#e#\r\n           <p>今天，我们为大家收集精选了<strong>30个使用纯CSS</strong>完成的强大实践的<strong>优秀CSS技术和实例</strong>，您将在这里发现很多与众不同的技术，比如:图片集、阴影效果、可扩展按钮、菜单等…这些实例都是使用纯CSS和HTML实现的。<br />\r\n单击每个实例的标题可以被转向到该技术实例的相关教程或说明页面(英文)，单击每个实例的图片截图可以直接跳转到相应实例的Demo页面。</p>\r\n<h3>1.</h3>\r\n<p>一个纯净的基于CSS的图片集，鼠标悬停缩略图就会显示放大效果。<br />\r\n</p>\r\n<h3>2.</h3>\r\n<p>一款很有创意且复杂的CSS导航方案。<br />\r\n</p>\r\n<h3>3.</h3>\r\n<p>手风琴效果的影集，悬停便可拉伸图片。<br />\r\n</p>\r\n<h3>4.</h3>\r\n<p>题为”“的文章中的一部分展示了如何使用CSS样式让图片变得更有意思。<br />\r\n</p>\r\n<h3>5.</h3>\r\n<p>在A List Apart上的一个关于图片效果Demo的讨论文章““.<br />\r\n</p>\r\n<h3>6.</h3>\r\n<p>悬停标签改变分类，悬停缩略图显示放大图。<br />\r\n</p>\r\n<h3>7.</h3>\r\n<p>使用简单的图片和background-position属性来进行调解。<br />\r\n</p>\r\n<h3>8.</h3>\r\n<p>模仿表格布局，但使用的是列表。图集是流式宽度。<br />\r\n</p>\r\n<h3>9.</h3>\r\n<p>仅使用了很少XHTML的静态页脚。<br />\r\n<img height=\"180\" width=\"450\" alt=\"CSS-实例\" src=\"http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F60392Q4550-321013.gif\" /></p>\r\n<h3>10.</h3>\r\n<p>模仿Windows开始菜单的CSS导航菜单。<br />\r\n</p>\r\n<p>\r\n            <p align=\"center\"> </p>\r\n          \r\n        \r\n        #p#副标题#e#</p>\r\n<h3>11.</h3>\r\n<p>使用div和:hover伪类的手风琴效果，这个效果可以垂直显示也可以水平显示。<br />\r\n</p>\r\n<h3>12.</h3>\r\n<p></p>\r\n<h3>13.</h3>\r\n<p>链接在不使用图片的情况下看起来像个按钮。<br />\r\n</p>\r\n<h3>14.</h3>\r\n<p>表格的标题被固定的优秀长表格。<br />\r\n</p>\r\n<h3>15.</h3>\r\n<p>当你悬停在图片上时，div容器会显示更多文字。<br />\r\n</p>\r\n<h3>16.</h3>\r\n<p>一个使用背景图片且非常漂亮，被语义化标记的表格。<br />\r\n</p>\r\n<h3>17.</h3>\r\n<p>另一种为图片添加圆角的方法。（圆角、边框、阴影）<br />\r\n</p>\r\n<h3>18.</h3>\r\n<p>关于为不同类型的链接添加图标的简单教程。<br />\r\n</p>\r\n<h3>19.</h3>\r\n<p>仅适用了一张图片和很少的几行代码及标记。<br />\r\n</p>\r\n<h3>20.</h3>\r\n<p>使用嵌套列表的树形导航，很适合网站地图页面。<br />\r\n</p>\r\n<p>\r\n            <p align=\"center\"> </p>\r\n          \r\n        #p#副标题#e#</p>\r\n<h3>21.</h3>\r\n<p>不使用JavaScript实现透明度技巧（但是以不符合XHTML验证为代价）<br />\r\n</p>\r\n<h3>22.</h3>\r\n<p>流式跨度和高度的圆角div。<br />\r\n</p>\r\n<h3>23.</h3>\r\n<p>条线图使用列表<li>。<br />\r\n</p>\r\n<h3>24.</h3>\r\n<p>3款柱状图实例:使用div和列表标签的”基本CSS柱状图”、”复杂CSS柱状图”、”垂直CSS柱状图”。<br />\r\n</p>\r\n<h3>25.</h3>\r\n<p>箭头会平滑的跟随鼠标移动，没有使用一丁点JavaScript和gif动画。<br />\r\n</p>\r\n<h3>26.</h3>\r\n<p></p>\r\n<h3>27.</h3>\r\n<p>使用了空白div来让文本能围绕背景图中的图像显示。<br />\r\n</p>\r\n<h3>28.</h3>\r\n<p>这个实例使用透明度设置和简单的图片逐渐在文字上方淡入图片。<br />\r\n</p>\r\n<h3>29.</h3>\r\n<p>一个在IE5(Mac)上也能正常工作的弹出技巧。<br />\r\n</p>\r\n<h3>30.</h3>\r\n<p>使用背景图片遮盖，和一个空的span标签，还有position: absolute声明来实现文本的渐变效果。<br />\r\n</p>\r\n<p>原文:<br />\r\n翻译:</p>\r\n            <p align=\"center\"> </p>', '', '', '');
INSERT INTO `youbang_addonarticle` VALUES (26, 3, '<p>这是一位叫  的希腊 Web 设计师发表在  的一篇文章，讲述了黄金分割率在 CSS 中的应用。黄金分割率是一个应用广泛的数学常数，大约为 1.6180339887。黄金分割率用在 Web 设计中，可以为设计带来更多视觉上的和谐。</p>\r\n<p>在一个简单的两栏式页面布局中，使用两个容器，第一个容器用来显示主要内容，第二个容器显示侧条。比如，页面宽度为 960 px，使用黄金分割率，主内容容器的宽度应该为 960 / 1.62 = 593 px，而侧条的宽度为 960-593=367 px。<br />\r\n<img src=\"http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F603930W50-12401.png\" alt=\"\" /><br />\r\n作者建议，在 Web 排版与布局中可以使用以下基本 CSS 设置</p>\r\n<ul>\r\n    <li>line-height = font-size * 1.62</li>\r\n    <li>paragraph margin = paragraph line-height * 1.62 / 2</li>\r\n    <li>header’s margin-top = headers line-height * 1.62</li>\r\n</ul>\r\n<p>不过对中文而言，至少 font-size 和 line-height 之间使用黄金分割率是不适合的，假如中文字体使用 12px 的话，最佳行高是 22px，如果字体使用 14px 的话，行高应该使用 24px - 译者。<br />\r\n<img src=\"http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F603931B510-23037.png\" alt=\"\" /><br />\r\n另一个例子，在表单中，输入框的宽度应该是标签文字的宽度乘以 1.62。而对于显示在 Web 上矩形来说，它的宽度应该是高度乘以 1.62。</p>\r\n<p>这样一来，Web 设计师同时需要很好的计算能力，至少要在旁边放一台计算器，为了节省时间，作者建议在设计中随时记住一个 62/38 原则，在任何需要分割的地方，都使用 62% 和 38% 作比例。<br />\r\n对于需要分割成三份的场合，可以先按 62%，38%原则分成两份，再将那份大的按 62% 和 38% 的比例分割。</p>\r\n            <p align=\"center\"> </p>', '', '', '');
INSERT INTO `youbang_addonarticle` VALUES (27, 3, '<p>今天我将介绍一下如何使用CSS中的背景图片来设计你的搜索框。之前我使用别的方法来实现我的表单和搜索框，但是这种方法看起来会更容易些，所以我想将它与感兴趣的朋友分享。<br />\r\n</p>\r\n<h3>原始方式</h3>\r\n<p><img src=\"http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F603932K20-31036.gif\" alt=\"\" /><br />\r\n首先来让我们看看我的原始的使用<input type=”image” src=”image_url” />的方法：<br />\r\n<font face=\"NSimsun\"><code><form method=\"get\" id=\"searchform\" action=\"http://www.sohtanaka.com/\"><br />\r\n<fieldset><br />\r\n<input type=\"text\" value=\"\" name=\"s\" id=\"s\" /><br />\r\n<input type=\"image\" src=\"img_url\" id=\"searchsubmit\" value=\"Search\" class=\"btn\" /><br />\r\n</fieldset><br />\r\n</form></code><br />\r\n</font>这看起来挺不错的，但是它有一个不好的地方，这个图片按钮不会和搜索框对其，我必须使用一个负的margin-top属性来修正这个bug。</p>\r\n<h3>改良方法</h3>\r\n<p>在这个改良版的方法中，我决定不再使用 type=”image” ，而是使用<button>标签，然后用CSS添加背景。这允许文本输入框和按钮自动对齐。我同样添加了a <code><font face=\"NSimsun\">:focus伪类</font></code>到最终效果(IE将不会支持这个，所以我添加了一个特殊的样式针对IE来隐藏这个效果)。 下面是这种方法的一些好处:</p>\r\n<ul>\r\n    <li>很自然的对齐</li>\r\n    <li>对按钮和输入框只使用了一张图片</li>\r\n    <li>:focus 伪类支持它的浏览器</li>\r\n    <li>添加hover 效果到按钮</li>\r\n</ul>\r\n<p><img src=\"http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F60393325C0-45L1.gif\" alt=\"\" /><br />\r\n<strong>HTML</strong><br />\r\n<font face=\"NSimsun\"><code><form method=\"get\" id=\"searchform\" action=\"http://www.sohtanaka.com/\"><br />\r\n<fieldset class=\"search\"><br />\r\n<input type=\"text\" class=\"box\" /><br />\r\n<button class=\"btn\" title=\"Submit Search\">Search</button><br />\r\n</fieldset><br />\r\n</form></code><br />\r\n</font><strong>CSS</strong><br />\r\n<font face=\"NSimsun\"><code>fieldset.search {<br />\r\nborder: none;<br />\r\nwidth: 243px;<br />\r\nmargin: 0 auto;<br />\r\nbackground: #222;<br />\r\n}<br />\r\n.search input, .search button {<br />\r\nborder: none;<br />\r\nfloat: left;<br />\r\n}<br />\r\n.search input.box {<br />\r\ncolor: #fff;<br />\r\nfont-size: 1.2em;<br />\r\nwidth: 190px;<br />\r\nheight: 30px;<br />\r\npadding: 8px 5px 0;<br />\r\nbackground: #616161 url(search_bg.gif) no-repeat;<br />\r\nmargin-right: 5px;<br />\r\n}<br />\r\n.search input.box:focus {<br />\r\nbackground: #616161 url(search_bg.gif) no-repeat left -38px;<br />\r\noutline: none;<br />\r\n}<br />\r\n.search button.btn {<br />\r\nwidth: 38px;<br />\r\nheight: 38px;<br />\r\ncursor: pointer;<br />\r\ntext-indent: -9999px;<br />\r\nbackground: #fbc900 url(search_bg.gif) no-repeat top right;<br />\r\n}<br />\r\n.search button.btn:hover {<br />\r\nbackground: #fbc900 url(search_bg.gif) no-repeat bottom right;<br />\r\n}</code><br />\r\n</font><strong>IE特别注释</strong><br />\r\n<font face=\"NSimsun\"><code><!--[if lte IE 7]><br />\r\n<link rel=\"stylesheet\" type=\"text/css\" href=\"ie.css\" /><br />\r\n<![endif]--></code><br />\r\n</font><strong>IE 样式- ie.css</strong><br />\r\n朋友评论说如果输入文字过多IE6和IE7会水平滚动背景图片，所以我的方法是专门为IE使用一个单独的背景图片 ，而且不是让它左对齐，我翻转了它，通过让背景图片右对齐来修正这个。<br />\r\n<code><font face=\"NSimsun\">.search input.box {<br />\r\nbackground: url(search_bg_ie.gif) no-repeat right bottom;<br />\r\n&nbsp; /* 专门为IE的独立背景图片，而且这个图篇必须是右对齐的。***/<br />\r\n}</font></code></p>\r\n<p></p>\r\n            <p align=\"center\"> </p>', '', '', '');
INSERT INTO `youbang_addonarticle` VALUES (28, 3, '<p><img alt=\"\" src=\"http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F60393415040-55N2.png\" /><br />\r\n如果你曾经收藏过许多关于CSS的最佳实践但还没开始利用它们，那么这篇文章将帮助你制作一个很好且很有组织的CSS文件来应用于一些CSS最佳实践。在 这里我将为为我的下一个项目制作一个基本的CSS模板文件。使用标准的重设(Reset)方法，定义一些基本的方便的类，命名一些常见的页面区域等…</p>\r\n<p>在开始之前，创建一个新建文件夹并将它命名为”styles”(您也可以命名自己喜欢的名字)，然后在该文件夹下创建两个文件分别命名为“reset.css” 和 “style.css”。现在你的文件夹结构不出意外的话应该是这样的:</p>\r\n<blockquote>\r\n<p>–root<br />\r\n|<br />\r\nstyles<br />\r\n– reset.css<br />\r\n– style.css<br />\r\n|</p>\r\n</blockquote>\r\n<h3>1-单独使用一个全局CSS重设方法</h3>\r\n<p>我以Eric Meyer的重设为基础。只是去掉了其中的<strong>“ins”, “del”和 “table”</strong>，因为我实在是很少使用它们，因为某些原因又重新定义了<strong>“strong”</strong> 和 <strong>“em”</strong>，我知道您也许会有自己的方式，所以您也可以自由为自己的文件定义。写完CSS重设后，将其存储为”reset.css”。</p>\r\n<blockquote>\r\n<p>html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, font, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td {<br />\r\nmargin: 0;<br />\r\npadding: 0;<br />\r\nborder: 0;<br />\r\noutline: 0;<br />\r\nfont-size: 100%;<br />\r\nvertical-align: baseline;<br />\r\nbackground: transparent;<br />\r\n}<br />\r\nol, ul {<br />\r\nlist-style: none;<br />\r\n}<br />\r\nblockquote, q {<br />\r\nquotes: none;<br />\r\n}<br />\r\nblockquote:before, blockquote:after, q:before, q:after {<br />\r\ncontent: ”;<br />\r\ncontent: none;<br />\r\n}<br />\r\n:focus {<br />\r\noutline: 0;<br />\r\n}<br />\r\ntable {<br />\r\nborder-collapse: collapse;<br />\r\nborder-spacing: 0;<br />\r\n}<br />\r\ncaption, th, td {<br />\r\ntext-align: left;<br />\r\nfont-weight: normal;<br />\r\n}<br />\r\nstrong {<br />\r\nfont-weight: bold;<br />\r\n}<br />\r\nem {<br />\r\nfont-style: italic;<br />\r\n}</p>\r\n</blockquote>\r\n<p>在这个重设文件里我去掉了<strong>“body”</strong>样式，因为通常我们在不同的项目中都会定义不同的”body”样式，所以我们将它放在style.css文件中。</p>\r\n<h3>2-在顶部为样式表添加描述注释</h3>\r\n<p>现在我们打开style.css来开始写一些基本的样式。在创建一个新样式文件(style.css)后，第一件事应该是在文件顶部写一些结构性的 注释，用来描述一些样式的细节，比如版本、作者、作者的详细联系方式等，这将帮助你和其他前端开发人员使用该文件。描述细节应当包括像作者姓名、版本和提 供更多信息的URL地址。我比较喜欢，因为它比较广泛。</p>\r\n<blockquote>\r\n<p>/*<br />\r\n主题名称: 玫瑰主题<br />\r\nURI: the-theme’s-homepage<br />\r\n描述: a-brief-description<br />\r\n作者: 您的姓名<br />\r\n作者 URI: 您的-URI<br />\r\n模板: 在这里可以提示它的父级模板<br />\r\n版本: 版本号<br />\r\n彬Go-集前端开发/网页设计/网站可用性/用户体验于一体的趣味互联网生活<br />\r\n网址:http://blog.bingo929.com/<br />\r\n*/</p>\r\n</blockquote>\r\n<h3>3-定义便于搜索的目录表</h3>\r\n<p>现在，我们来一起定义我们样式的目录表。定义TOC能帮助其他人甚至自己更容易与阅读和理解代码。也许您会觉得这个没什么必要，但请相信我！</p>\r\n<p>首先让我们看看它应当是什么样子的:</p>\r\n<blockquote>\r\n<p>[目录表]<br />\r\n0- Reset<br />\r\n1- Global<br />\r\n2- Links<br />\r\n3- Headings<br />\r\n4- Header<br />\r\n5- Navigation<br />\r\n6- Middle<br />\r\n7- Forms<br />\r\n8- Extras<br />\r\n9- Footer</p>\r\n</blockquote>\r\n<p>正如您看到的，我们将目录表从0到9分成10部分。</p>\r\n<ul>\r\n    <li>TOC非常简单以至于它不会花费您超过1分钟的时间。</li>\r\n    <li>您不用为每个项目定义不同的TOC。</li>\r\n    <li>命名的使用非常普遍，所以可以适合模本的任何部分。</li>\r\n    <li>不使用动态的#ID和.class。</li>\r\n    <li>它并不大所以不会占用很多Kbytes。</li>\r\n    <li>顺序的数字很有用，用途请往下看。</li>\r\n</ul>\r\n<h3>4-使用注释将每个部分隔开并使用一个=标记</h3>\r\n<p>请看一下样式，在0部分我将之前的重设样式表reset.css导入。</p>\r\n<blockquote>\r\n<p>/* =0 Reset<br />\r\n–––––––––––––––––––––––––––––––––––––––––––––––––––*/<br />\r\n@import url(’reset.css’);<br />\r\n/* =1 Global</p>\r\n<p>–––––––––––––––––––––––––––––––––––––––––––––––––––*/<br />\r\n/* =2 Links<br />\r\n–––––––––––––––––––––––––––––––––––––––––––––––––––*/<br />\r\n/* =3 Headings<br />\r\n–––––––––––––––––––––––––––––––––––––––––––––––––––*/<br />\r\n/* =4 Header<br />\r\n–––––––––––––––––––––––––––––––––––––––––––––––––––*/<br />\r\n/* =5 Navigation<br />\r\n–––––––––––––––––––––––––––––––––––––––––––––––––––*/<br />\r\n/* =6 Middle<br />\r\n–––––––––––––––––––––––––––––––––––––––––––––––––––*/<br />\r\n/* =7 Form<br />\r\n–––––––––––––––––––––––––––––––––––––––––––––––––––*/<br />\r\n/* =8 Extra<br />\r\n–––––––––––––––––––––––––––––––––––––––––––––––––––*/<br />\r\n/* =9 Footer<br />\r\n–––––––––––––––––––––––––––––––––––––––––––––––––––*/</p>\r\n</blockquote>\r\n<p>在每个部分的分区注释中使用=标记，可以帮助您和您的团队其他成员快速找到需要的代码。大家都知道，在CSS样式中的声明几乎是不会使用等号的，所 以我们可以使用等号来帮助搜索。比如你想寻找表单的相关样式代码，可以先查看目录表中表单对应的数字，然后搜索”=7″便可以快速跳转到表单的相关代码区 域。</p>\r\n<h3>5-定义最常用的类</h3>\r\n<p>其实有一些类是我们要经常使用的，那我们为什么不一次性把它们都定义好呢？现在正是时候！我添加了一些个人比较喜欢的，当然您也可以按照自己的喜好进行增删改。将它们定义在“=1 Global”下。<br />\r\n我还把body选择器定义在了Global中。<br />\r\n<span><strong>注:一下定义类仅仅是比较简单的一些。</strong></span></p>\r\n<blockquote>\r\n<p>/* =1 Global<br />\r\n–––––––––––––––––––––––––––––––––––––––––––––––––––*/<br />\r\nbody {<br />\r\nline-height: 1;<br />\r\nfont: normal 12px Arial, Helvetica, sans-serif;<br />\r\nvertical-align: top;<br />\r\nbackground: #fff;<br />\r\ncolor: #000;<br />\r\n}<br />\r\n.right {<br />\r\nfloat: right;<br />\r\n}<br />\r\n.left {<br />\r\nfloat: left;<br />\r\n}<br />\r\n.align-left {<br />\r\ntext-align: left;<br />\r\n}<br />\r\n.align-right {<br />\r\ntext-align: right;<br />\r\n}<br />\r\n.align-center {<br />\r\ntext-align:center;<br />\r\n}<br />\r\n.justify {<br />\r\ntext-align:justify;<br />\r\n}<br />\r\n.hide {<br />\r\ndisplay: none;<br />\r\n}<br />\r\n.clear {<br />\r\nclear: both;<br />\r\n}<br />\r\n.bold {<br />\r\nfont-weight:bold;<br />\r\n}<br />\r\n.italic {<br />\r\nfont-style:italic;<br />\r\n}<br />\r\n.underline {<br />\r\nborder-bottom:1px solid;<br />\r\n}<br />\r\n.highlight {<br />\r\nbackground:#ffc;<br />\r\n}<br />\r\nimg.centered {<br />\r\ndisplay: block;<br />\r\nmargin-left: auto;<br />\r\nmargin-right: auto;<br />\r\n}<br />\r\nimg.alignleft {<br />\r\nfloat:left;<br />\r\nmargin:4px 10px 4px 0;<br />\r\n}<br />\r\nimg.alignright {<br />\r\nfloat:right;<br />\r\nmargin:4px 0 4px 10px;<br />\r\n}<br />\r\n.clearfix:after {<br />\r\ncontent: “.”;<br />\r\ndisplay: block;<br />\r\nclear: both;<br />\r\nvisibility: hidden;<br />\r\nline-height: 0;<br />\r\nheight: 0;<br />\r\n}<br />\r\n.clearfix {<br />\r\ndisplay: block;<br />\r\n}<br />\r\nhtml[xmlns] .clearfix {<br />\r\ndisplay: block;<br />\r\n}<br />\r\n* html .clearfix {<br />\r\nheight: 1%;<br />\r\n}</p>\r\n</blockquote>\r\n<h3>6-为链接和标题定义样式</h3>\r\n<p>最后，我们来定义适当的链接和标题的样式，因为他们在任何项目中都是必需的。如果你在制作某个网页，你不可能不是用它们。</p>\r\n<blockquote>\r\n<p>/* =2 Links<br />\r\n––––––––––––––––––––––––––––––––––––––––––––––––––*/<br />\r\na:link, a:visited {<br />\r\ncolor: #333;<br />\r\n}<br />\r\na:hover {<br />\r\ncolor: #111;<br />\r\n}<br />\r\na:active {<br />\r\ncolor: #111;<br />\r\n}<br />\r\n/* =3 Headings<br />\r\n––––––––––––––––––––––––––––––––––––––––––––––––––*/<br />\r\nh1 {<br />\r\nfont: bold 2em “Times New Roman”, Times, serif;<br />\r\n}<br />\r\nh2 {<br />\r\nfont: bold 1.5em “Times New Roman”, Times, serif;<br />\r\n}<br />\r\nh3 {<br />\r\nfont: bold 1.2em Arial, Geneva, Helvetica, sans-serif;<br />\r\n}<br />\r\nh4 {<br />\r\nfont: bold 1em Arial, Geneva, Helvetica, sans-serif;<br />\r\n}<br />\r\nh5 {<br />\r\nfont: bold 0.9em Arial, Geneva, Helvetica, sans-serif;<br />\r\n}</p>\r\n</blockquote>\r\n<h3>style.css模板的最终代码</h3>\r\n<blockquote>\r\n<p>/*<br />\r\n主题名称: 玫瑰主题<br />\r\nURI: the-theme’s-homepage<br />\r\n描述: a-brief-description<br />\r\n作者: 您的姓名<br />\r\n作者 URI: 您的-URI<br />\r\n模板: 在这里可以提示它的父级模板</p>\r\n<p>[目录表]<br />\r\n0- Reset<br />\r\n1- Global<br />\r\n2- Links<br />\r\n3- Headings<br />\r\n4- Header<br />\r\n5- Navigation<br />\r\n6- Middle<br />\r\n7- Forms<br />\r\n8- Extras<br />\r\n9- Footer<br />\r\n*/<br />\r\n/* =0 Reset<br />\r\n–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––*/<br />\r\n@import url(’reset.css’);</p>\r\n<p>/* =1 Global<br />\r\n–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––*/<br />\r\nbody {<br />\r\nline-height: 1;<br />\r\nfont: normal 12px Arial, Helvetica, sans-serif;<br />\r\nvertical-align: top;<br />\r\nbackground: #fff;<br />\r\ncolor: #000;<br />\r\n}<br />\r\n.right {<br />\r\nfloat: right;<br />\r\n}<br />\r\n.left {<br />\r\nfloat: left;<br />\r\n}<br />\r\n.align-left {<br />\r\ntext-align: left;<br />\r\n}<br />\r\n.align-right {<br />\r\ntext-align: right;<br />\r\n}<br />\r\n.align-center {<br />\r\ntext-align:center;<br />\r\n}<br />\r\n.justify {<br />\r\ntext-align:justify;<br />\r\n}<br />\r\n.hide {<br />\r\ndisplay: none;<br />\r\n}<br />\r\n.clear {<br />\r\nclear: both;<br />\r\n}<br />\r\n.bold {<br />\r\nfont-weight:bold;<br />\r\n}<br />\r\n.italic {<br />\r\nfont-style:italic;<br />\r\n}<br />\r\n.underline {<br />\r\nborder-bottom:1px solid;<br />\r\n}<br />\r\n.highlight {<br />\r\nbackground:#ffc;<br />\r\n}<br />\r\nimg.centered {<br />\r\ndisplay: block;<br />\r\nmargin-left: auto;<br />\r\nmargin-right: auto;<br />\r\n}<br />\r\nimg.alignleft {<br />\r\nfloat:left;<br />\r\nmargin:4px 10px 4px 0;<br />\r\n}<br />\r\nimg.alignright {<br />\r\nfloat:right;<br />\r\nmargin:4px 0 4px 10px;<br />\r\n}<br />\r\n.clearfix:after {<br />\r\ncontent: “.”;<br />\r\ndisplay: block;<br />\r\nclear: both;<br />\r\nvisibility: hidden;<br />\r\nline-height: 0;<br />\r\nheight: 0;<br />\r\n}<br />\r\n.clearfix {<br />\r\ndisplay: block;<br />\r\n}<br />\r\nhtml[xmlns] .clearfix {<br />\r\ndisplay: block;<br />\r\n}<br />\r\n* html .clearfix {<br />\r\nheight: 1%;<br />\r\n}<br />\r\n/* =2 Links<br />\r\n–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––*/<br />\r\na:link, a:visited {<br />\r\ncolor: #333;<br />\r\n}<br />\r\na:hover {<br />\r\ncolor: #111;<br />\r\n}<br />\r\na:active {<br />\r\ncolor: #111;<br />\r\n}<br />\r\n/* =3 Headings<br />\r\n–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––*/<br />\r\nh1 {<br />\r\nfont: bold 2em “Times New Roman”, Times, serif;<br />\r\n}<br />\r\nh2 {<br />\r\nfont: bold 1.5em “Times New Roman”, Times, serif;<br />\r\n}<br />\r\nh3 {<br />\r\nfont: bold 1.2em Arial, Geneva, Helvetica, sans-serif;<br />\r\n}<br />\r\nh4 {<br />\r\nfont: bold 1em Arial, Geneva, Helvetica, sans-serif;<br />\r\n}<br />\r\nh5 {<br />\r\nfont: bold 0.9em Arial, Geneva, Helvetica, sans-serif;<br />\r\n}<br />\r\n/* =4 Header<br />\r\n–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––*/<br />\r\n/* =5 Navigation<br />\r\n–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––*/<br />\r\n/* =6 Middle<br />\r\n–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––*/<br />\r\n/* =7 Form<br />\r\n–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––*/<br />\r\n/* =8 Extra<br />\r\n–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––*/<br />\r\n/* =9 Footer<br />\r\n–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––*/</p>\r\n</blockquote>\r\n<h3>总结</h3>\r\n<p>感谢大家阅读本文，CSS最佳实践在某种意义上的确会对我们提供很大的帮助。它可以帮助我们节省更多的工作时间，显著提高工作效率。如果您有任何看法或建议，欢迎。</p>\r\n<h3>下载源文件</h3>\r\n<p></p>\r\n<p>来源: 翻译：</p>\r\n            <p align=\"center\"> </p>', '', '', '');
INSERT INTO `youbang_addonarticle` VALUES (29, 3, '<p><img alt=\"\" src=\"http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F60393525250-A528.png\" /><br />\r\n很多CSS爱好者不喜欢HTML表格，尤其是在制作表单的时候，虽然现在已经是XHTML+CSS的年代，但表单的设计大多还在采用table来布局。那 么，有没有更好的使用纯语义化XHTML+CSS设计表单方法呢？今天让我们一起来尝试这种更符合语义化的方法来代替Table嵌套的表单元素吧！</p>\r\n<p>在这里我要说，并不是要完全摒弃table的使用，它有它的语义化布局作用，尤其是在存储数据的时候。我在大多数情况下会使用纯CSS来设计表单， 但是，我也很喜欢表格，只要我们能在正确的地方使用正确的元素就可以了，不要太过追求所谓的DIV+CSS。直接使用table要比使用CSS来”模拟” (display:table;)表格更方便更快速。下面暴风彬彬将分享一种使用纯CSS代替HTML表格元素设计表单的方法。</p>\r\n<p>您可以下载源代码并使用在自己的网站项目中。<br />\r\n</p>\r\n<h3>第一步:HTML代码</h3>\r\n<p>创建一个新页面index.html，然后拷贝并粘贴以下代码到<body>标签内。</p>\r\n<blockquote>\r\n<p><div id=”stylized” class=”myform”><br />\r\n&nbsp;&nbsp; &nbsp;<form id=”form” name=”form” method=”post” action=”index.html”><br />\r\n&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;<h1>Sign-up form</h1><br />\r\n&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;<p>This is the basic look of my form without table</p><br />\r\n&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;<label>Name<br />\r\n&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<span class=”small”>Add your name</span><br />\r\n&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;</label><br />\r\n&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;<input type=”text” name=”name” id=”name” /><br />\r\n&nbsp;&nbsp; &nbsp; &nbsp; <label>Email<br />\r\n&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<span class=”small”>Add a valid address</span><br />\r\n&nbsp;&nbsp; &nbsp; &nbsp; </label><br />\r\n&nbsp;&nbsp; &nbsp; &nbsp; <input type=”text” name=”email” id=”email” /><br />\r\n&nbsp;&nbsp; &nbsp; &nbsp; <label>Password<br />\r\n&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<span class=”small”>Min. size 6 chars</span><br />\r\n&nbsp;&nbsp; &nbsp; &nbsp; </label><br />\r\n&nbsp;&nbsp; &nbsp; &nbsp; <input type=”text” name=”password” id=”password” /><br />\r\n&nbsp;&nbsp; &nbsp; &nbsp; <button type=”submit”>Sign-up</button><br />\r\n&nbsp;&nbsp; &nbsp; &nbsp; <div class=”spacer”></div><br />\r\n&nbsp;&nbsp; &nbsp;</form><br />\r\n</div></p>\r\n</blockquote>\r\n<p>　　通过上面的代码，你是否能看出它的视觉样式呢？下面是我们的CSS表单结构图示:<br />\r\n<img alt=\"\" src=\"http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F603935N10-H211.png\" /><br />\r\n我为每个input元素使用了<label>标签，并使用<span>标签包含简短的描述。所有的label和input元素都是用了CSS的float属性，值为left。</p>\r\n<h3>第二步:CSS代码</h3>\r\n<p>复制并粘贴以下代码到你页面中的<head>标签中的<style type=”taxt/css”></style>内。(也可以单独存储到CSS文件中)</p>\r\n<blockquote>\r\n<p>body{<br />\r\n&nbsp;&nbsp; &nbsp;font-family:”Lucida Grande”, “Lucida Sans Unicode”, Verdana, Arial, Helvetica, sans-serif;<br />\r\n&nbsp;&nbsp; &nbsp;font-size:12px;<br />\r\n}<br />\r\np, h1, form, button{border:0; margin:0; padding:0;}<br />\r\n.spacer{clear:both; height:1px;}<br />\r\n/* ———– My Form ———– */<br />\r\n.myform{<br />\r\n&nbsp;&nbsp; &nbsp;margin:0 auto;<br />\r\n&nbsp;&nbsp; &nbsp;width:400px;<br />\r\n&nbsp;&nbsp; &nbsp;padding:14px;<br />\r\n}<br />\r\n/* ———– stylized ———– */<br />\r\n#stylized{<br />\r\n&nbsp;&nbsp; &nbsp;border:solid 2px #b7ddf2;<br />\r\n&nbsp;&nbsp; &nbsp;background:#ebf4fb;<br />\r\n}<br />\r\n#stylized h1 {<br />\r\n&nbsp;&nbsp; &nbsp;font-size:14px;<br />\r\n&nbsp;&nbsp; &nbsp;font-weight:bold;<br />\r\n&nbsp;&nbsp; &nbsp;margin-bottom:8px;<br />\r\n}<br />\r\n#stylized p{<br />\r\n&nbsp;&nbsp; &nbsp;font-size:11px;<br />\r\n&nbsp;&nbsp; &nbsp;color:#666666;<br />\r\n&nbsp;&nbsp; &nbsp;margin-bottom:20px;<br />\r\n&nbsp;&nbsp; &nbsp;border-bottom:solid 1px #b7ddf2;<br />\r\n&nbsp;&nbsp; &nbsp;padding-bottom:10px;<br />\r\n}<br />\r\n#stylized label{<br />\r\n&nbsp;&nbsp; &nbsp;display:block;<br />\r\n&nbsp;&nbsp; &nbsp;font-weight:bold;<br />\r\n&nbsp;&nbsp; &nbsp;text-align:right;<br />\r\n&nbsp;&nbsp; &nbsp;width:140px;<br />\r\n&nbsp;&nbsp; &nbsp;float:left;<br />\r\n}<br />\r\n#stylized .small{<br />\r\n&nbsp;&nbsp; &nbsp;color:#666666;<br />\r\n&nbsp;&nbsp; &nbsp;display:block;<br />\r\n&nbsp;&nbsp; &nbsp;font-size:11px;<br />\r\n&nbsp;&nbsp; &nbsp;font-weight:normal;<br />\r\n&nbsp;&nbsp; &nbsp;text-align:right;<br />\r\n&nbsp;&nbsp; &nbsp;width:140px;<br />\r\n}<br />\r\n#stylized input{<br />\r\n&nbsp;&nbsp; &nbsp;float:left;<br />\r\n&nbsp;&nbsp; &nbsp;font-size:12px;<br />\r\n&nbsp;&nbsp; &nbsp;padding:4px 2px;<br />\r\n&nbsp;&nbsp; &nbsp;border:solid 1px #aacfe4;<br />\r\n&nbsp;&nbsp; &nbsp;width:200px;<br />\r\n&nbsp;&nbsp; &nbsp;margin:2px 0 20px 10px;<br />\r\n}<br />\r\n#stylized button{<br />\r\n&nbsp;&nbsp; &nbsp;clear:both;<br />\r\n&nbsp;&nbsp; &nbsp;margin-left:150px;<br />\r\n&nbsp;&nbsp; &nbsp;width:125px;<br />\r\n&nbsp;&nbsp; &nbsp;height:31px;<br />\r\n&nbsp;&nbsp; &nbsp;background:#666666 url(img/button.png) no-repeat;<br />\r\n&nbsp;&nbsp; &nbsp;text-align:center;<br />\r\n&nbsp;&nbsp; &nbsp;line-height:31px;<br />\r\n&nbsp;&nbsp; &nbsp;color:#FFFFFF;<br />\r\n&nbsp;&nbsp; &nbsp;font-size:11px;<br />\r\n&nbsp;&nbsp; &nbsp;font-weight:bold;<br />\r\n}</p>\r\n</blockquote>\r\n<p>以上仅仅是表单布局的一种方式，您也可以按照您的喜好来修改源代码并重新使用它。<br />\r\n如果您对于CSS表单布局有其它不同的或更好的建议的话，欢迎在此留下您宝贵的评论.</p>\r\n<p></p>\r\n<p>原文：<br />\r\n翻译：</p>\r\n            <p align=\"center\"> </p>', '', '', '');
INSERT INTO `youbang_addonarticle` VALUES (30, 3, '副标题#e#\r\n           <p><strong>什么是css框架 </strong><br />\r\n实际上还是让我们从框架说起吧。<br />\r\n框架就是一个你可以用于你的网站项目的基本的概念上的结构体。<br />\r\n<strong>css框架通常只是一些css文件的集合，这些文件包括基本布局、表单样式、网格或简单结构、以及样式重置。比如：</strong></p>\r\n<ul>\r\n    <li>typography.css&nbsp;基本排版规则</li>\r\n    <li>grid.css&nbsp;基于网格的布局</li>\r\n    <li>layout.css&nbsp;通常的布局</li>\r\n    <li>form.css&nbsp;for 表单样式</li>\r\n    <li>general.css&nbsp;更多通用规则</li>\r\n</ul>\r\n<p><strong>下面一起来了解一下各种不同的CSS框架吧:</strong></p>\r\n<h3>1.</h3>\r\n<p><br />\r\n960网格系统是一个通过提供通常使用的尺寸简化网站开发流程的努力的结果，基于960像素的页面宽度。它有两种类型，12和16列，他们可以独立使用或是协同使用。</p>\r\n<h3>2.</h3>\r\n<p><img alt=\"CSS-框架-WYMstyle\" src=\"http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F60393KXP-S429.gif\" /><br />\r\n这个项目的目的是提供一组经过良好测试的模块化的CSS文件，能够用于网站的快速设计。WYMstyle是一组文件，你可以很容易的组合这些文件来快速的创建你的网站的布局。通过提供可靠的、经过良好测试的CSS模块，WYMstyle 力求让每个网站防止枯燥的跨浏览器兼容性测试。</p>\r\n<h3>3.</h3>\r\n<p><img alt=\"CSS-框架-YAML\" src=\"http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F60393NU60-95S2.gif\" /><br />\r\nDirk Jesse的强大的(X)HTML/CSS框架为许多的简单或更复杂的网站项目提供完整的默认模板包。YAML基于网页标准并支持所有现代浏览器。所有的 Internet Explorer的主要渲染漏洞都被解决。YAML 完全支持从5.x到7.0的所有的IE版本。</p>\r\n<h3>4.</h3>\r\n<p><img alt=\"CSS-框架-YUI\" src=\"http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F60393R0C0-10W59.gif\" /><br />\r\n基本的YUI网格CSS提供4种预设的页宽、6种预设模板和再分为2、3、4卷的区块的功能。 这个4KB的文件可提供超过1000中页面布局组合。<br />\r\n有国外作者曾指出YUI Grids CSS中最值得学习的网格布局CSS写法:</p>\r\n<ul>\r\n    <li><strong>负Margin技术</strong></li>\r\n    <li><strong>使用度量单位em</strong></li>\r\n    <li><strong>清除布局的浮动</strong></li>\r\n</ul>\r\n<h3>5.</h3>\r\n<p><img alt=\"CSS-框架-logicss\" src=\"http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F60393V3940-113034.gif\" /><br />\r\nLogic CSS 框架是用来减少开发符合web标准的xHTML布局的时间的一个由CSS文件和PHP程序组成的集合。通常跨浏览器表现行为(不是Meyer的reset 文件或是用“*”)，排版支持文本字体大小调整(使用EMs) 和垂直居中，符合可定义的灵活的布局网格利用。</p>\r\n<h3>6.</h3>\r\n<p><img alt=\"国外-CSS-框架\" src=\"http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F60393YN20-122140.gif\" /><br />\r\nCleverCSS是一个用于css的受Python启发的小型的标记语言，它可用于以整洁的和结构化的方式创建一个样式表。在很多方面它都比CSS2整 洁和强大。与CSS最明显的区别是句法：它基于缩进而且不单调。虽然这显然违反了Python的规则，它依然是组织样式的很好的主意。</p>\r\n<h3>7.</h3>\r\n<p><img alt=\"CSS-框架-elements\" src=\"http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F60393929230-135c3.gif\" /><br />\r\nElements 是一个实用的CSS框架。它是为了帮助设计师更快更高效的来写CSS而建立。Elements 已经超越了仅仅作为一个框架，它有自己的项目工作流。它拥有你完成项目所需的所有东西，这也让你和你的浏览者感到愉悦。阅读&nbsp; 了解更多。</p>\r\n<h3>8.</h3>\r\n<p><img alt=\"CSS-框架-blueprint\" src=\"http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F60393962160-143012.gif\" /><br />\r\nBlueprint&nbsp;是一个&nbsp;<strong>CSS 框架</strong>，它的目的是减少你的css开发时间。它提供一个可靠的css基础去创建你的项目，BP由一个易用的网格、合理的布局和一个打印样式。</p>\r\n<p>\r\n            <p align=\"center\"> </p>\r\n          \r\n        \r\n        #p#副标题#e#</p>\r\n<h3>9.</h3>\r\n<p><img alt=\"CSS-框架-schema\" src=\"http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F6039400RF-1511D.gif\" /><br />\r\n<strong> Schema</strong> 是一个为了提供在重复的设计任务中必须的CSS和HTML标签而设计的表现层的网页框架设计。 与为每一个新的网站项目从零开始创建HTMl/CSS不同，Schema提供必要的基础来开始并立马让你的设计跑起来。</p>\r\n<h3>10.</h3>\r\n<p><img alt=\"CSS-框架-emastic\" src=\"http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F6039403N20-1B255.gif\" /><br />\r\nEmastic&nbsp;是一个CSS框架，它有连续的任务：探索陌生的新世界，寻找新生活和新的网站空间，大胆的去CSS框架尚未到达的领域。它是轻量的、在页面宽度上比较人性化，在网格中使用固定和不固定的列宽。 Elastic 用“em”布局。</p>\r\n<h3>11.</h3>\r\n<p><img alt=\"CSS-框架\" src=\"http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F603940635F-1K2Z.gif\" /><br />\r\n* 只能调用单个样式文件<br />\r\n* 主样式需要取得CSS认证(WCAG 1.0)；<br />\r\n* 跨浏览器兼容性—包括Internet Explorer (IE) 5.x for Mac；<br />\r\n* IE Hacks使用独立文件；<br />\r\n* 快速创建模板；<br />\r\n* 少量注释/实例演示，可以节省时间来理解。</p>\r\n<h3>12.</h3>\r\n<p><img alt=\"CSS-框架-content\" src=\"http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F603940YH0-1U110.gif\" /><br />\r\n下一个逻辑步骤就是将这个扩展为CSS框架，允许使用写好并通过测试的组件来快速开发网站。实际上所需的是搞定一套命名习惯和一个灵活的基本模板…</p>\r\n<h3>13.</h3>\r\n<p><img alt=\"CSS-框架-boilerplate\" src=\"http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F6039412F50-192200.gif\" /></p>\r\n<h3>14.</h3>\r\n<p><img alt=\"CSS-框架-eswat\" src=\"http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F60394164C0-201M8.gif\" /><br />\r\nESWAT正在重新整理。如果你是冲着我的网站框架来的，那么你就可以在这里下载。也许你也想看看我的其他项目gmachina、AppleSeed。</p>\r\n<h3>15.</h3>\r\n<p><img alt=\"CSS-框架-tripoli\" src=\"http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F603941T0-21V27.gif\" /><br />\r\nTripoli是一个用于HTML表现的通用css规范。通过重设和重建浏览器标准，Tripoli 为你的网站项目提供了一个标准的、跨浏览器表现的基础。<br />\r\n彬Go会经常更新前端开发/网页设计等相关技术及教程文章，欢迎来及时浏览本博客的最新教程及资源。<br />\r\n英文原文:<br />\r\n翻译原文:</p>\r\n            <p align=\"center\"> </p>', '', '', '');
INSERT INTO `youbang_addonarticle` VALUES (31, 3, '<p>今天我们将向大家分享一些为你平淡乏味的图片添加更多趣味情调的简单技巧。使用Photoshop为每个图片添加某种样式虽然可行，但会是相当乏味且困难的长久工作。下面要介绍的CSS技巧将帮助你从痛苦中解脱出来！如果你也有自己独到的CSS技巧，希望能一同分享。</p>\r\n<h3>阴影效果</h3>\r\n<p>通过使用带有一些padding之的背景图来添加阴影效果。</p>\r\n<p style=\"border: 1px solid rgb(56, 162, 227); padding: 10px 0pt; display: block; background-color: rgb(180, 227, 255); color: rgb(255, 255, 255); text-align: center;\"></p>\r\n<p><strong>HTML</strong></p>\r\n<blockquote>\r\n<p><img class=”shadow” src=”sample.jpg” alt=”\" /></p>\r\n</blockquote>\r\n<p><strong>CSS</strong></p>\r\n<blockquote>\r\n<p>img.shadow {<br />\r\n&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;background: url(shadow-1000×1000.gif) no-repeat right bottom;<br />\r\n&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;padding: 5px 10px 10px 5px;<br />\r\n}</p>\r\n</blockquote>\r\n<h3>双边框效果</h3>\r\n<p>这应该是目前最常见的技巧，我们通过以下方式创建说边框。</p>\r\n<p style=\"border: 1px solid rgb(56, 162, 227); padding: 10px 0pt; display: block; background-color: rgb(180, 227, 255); color: rgb(255, 255, 255); text-align: center;\"></p>\r\n<p><strong>HTML</strong></p>\r\n<blockquote>\r\n<p><img class=\"double-border\" src=\"sample.jpg\" alt=\"\" /></p>\r\n</blockquote>\r\n<p><strong>CSS</strong></p>\r\n<blockquote>\r\n<p>img.double-border {<br />\r\nborder: 5px solid #ddd;<br />\r\npadding: 5px; /*Inner border size*/<br />\r\nbackground: #fff; /*Inner border color*/<br />\r\n}</p>\r\n</blockquote>\r\n<h3>图片外框效果</h3>\r\n<p>上有最好的讲解，这个效果是基于在上面层叠一个有透明度的图片的技术。至于IE6的PNG透明度问题，可以参考。</p>\r\n<p style=\"border: 1px solid rgb(56, 162, 227); padding: 10px 0pt; display: block; background-color: rgb(180, 227, 255); color: rgb(255, 255, 255); text-align: center;\"></p>\r\n<p><strong>HTML</strong></p>\r\n<blockquote>\r\n<p><div class=\"frame-block\"><br />\r\n<span>&nbsp;</span></p>\r\n<p><img src=\"sample.jpg\" alt=\"\" /><br />\r\n</div></p>\r\n</blockquote>\r\n<p><strong>CSS</strong></p>\r\n<blockquote>\r\n<p>.frame-block {<br />\r\nposition: relative;<br />\r\ndisplay: block;<br />\r\nheight:335px;<br />\r\nwidth: 575px;<br />\r\n}<br />\r\n.frame-block span {<br />\r\nbackground: url(frame.png) no-repeat center top;<br />\r\nheight:335px;<br />\r\nwidth: 575px;<br />\r\ndisplay: block;<br />\r\nposition: absolute;<br />\r\n}</p>\r\n</blockquote>\r\n<h3>水印效果</h3>\r\n<p>你可以通过降低主图片的透明度来让背景图片透过来显示的方法添加水印</p>\r\n<p style=\"border: 1px solid rgb(56, 162, 227); padding: 10px 0pt; display: block; background-color: rgb(180, 227, 255); color: rgb(255, 255, 255); text-align: center;\"></p>\r\n<p><strong>HTML</strong></p>\r\n<blockquote>\r\n<p><div class=\"transp-block\"><br />\r\n<img class=\"transparent\" src=\"sample.jpg\" alt=\"\" /><br />\r\n</div></p>\r\n</blockquote>\r\n<p><strong>CSS</strong></p>\r\n<blockquote>\r\n<p>.transp-block {<br />\r\nbackground: #000 url(watermark.jpg) no-repeat;<br />\r\nwidth: 575px;<br />\r\nheight: 335px;<br />\r\n}<br />\r\nimg.transparent {<br />\r\nfilter:alpha(opacity=75);<br />\r\nopacity:.75;<br />\r\n}</p>\r\n</blockquote>\r\n<h3>为图片添加说明文字</h3>\r\n<p>使用绝对定位和透明度的设置来添加灵活的说明。</p>\r\n<p style=\"border: 1px solid rgb(56, 162, 227); padding: 10px 0pt; display: block; background-color: rgb(180, 227, 255); color: rgb(255, 255, 255); text-align: center;\"></p>\r\n<p><strong>HTML</strong></p>\r\n<blockquote>\r\n<p><div class=\"img-desc\"><br />\r\n<img src=\"sample.jpg\" alt=\"\" /><br />\r\n<cite>Salone del mobile Milano, April 2008 - Peeta</cite><br />\r\n</div></p>\r\n</blockquote>\r\n<p><strong>CSS</strong></p>\r\n<blockquote>\r\n<p>.img-desc {<br />\r\nposition: relative;<br />\r\ndisplay: block;<br />\r\nheight:335px;<br />\r\nwidth: 575px;<br />\r\n}<br />\r\n.img-desc cite {<br />\r\nbackground: #111;<br />\r\nfilter:alpha(opacity=55);<br />\r\nopacity:.55;<br />\r\ncolor: #fff;<br />\r\nposition: absolute;<br />\r\nbottom: 0;<br />\r\nleft: 0;<br />\r\nwidth: 555px;<br />\r\npadding: 10px;<br />\r\nborder-top: 1px solid #999;<br />\r\n}</p>\r\n</blockquote>\r\n<p>原文:<br />\r\n翻译:</p>\r\n\r\n            <p align=\"center\"> </p>', '', '', '');
INSERT INTO `youbang_addonarticle` VALUES (32, 3, '副标题#e#\r\n           <p>CSS的学习过程既可以说简单又可以说是复杂。CSS的语法比较简单，但CSS的应用中有一些概念(一可以说是原理)还是很难掌握的。今天暴风彬彬 向你推荐20个出色的CSS技术类(英语)网站帮你更好的理解和掌握CSS，其中包括各种各样的网站，从博客到清单风格列表甚至网站，它们都侧重于研究同 一个主题，那就是CSS。</p>\r\n<h3>1.&nbsp;</h3>\r\n<p><img height=\"180\" width=\"500\" alt=\"alistapart-css教程\" src=\"http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F60394543310-14b8.png\" title=\"alistapart-css教程\" class=\"alignnone size-medium wp-image-1757\" /><br />\r\nA List Apart，学习网页设计和最佳实践的首选网站。这个网站从1999年就开始发表关于CSS的文章，其中大部分文章都是面向那些更注重符合标准设计的中级到高级设计师。</p>\r\n<h3>2.&nbsp;</h3>\r\n<p><img height=\"180\" width=\"500\" alt=\"csshelppile-CSS技巧-教程\" src=\"http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F603945aK0-22b2.png\" title=\"csshelppile-CSS技巧-教程\" class=\"alignnone size-medium wp-image-1758\" /><br />\r\nCSS Help Pile汇集了大量的CSS资源、技巧和教程。这个网站适合各种水平的设计师学习。网站专门有、和这样的分类。</p>\r\n<h3>3.&nbsp;</h3>\r\n<p><img height=\"180\" width=\"500\" alt=\"\" src=\"http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F60394F11Z-3H54.png\" title=\"css-basics-CSS教程\" class=\"alignnone size-medium wp-image-1759\" /><br />\r\nCSS Basics可以当成一书来看，用了18个章节来传授基本的CSS概念，对初学者相当有帮助。还有就是所有18个章节，提供打印或PDF格式下载。</p>\r\n<h3>4.&nbsp;</h3>\r\n<p><img height=\"180\" width=\"500\" alt=\"CSS教程\" src=\"http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F60394J1110-43G1.jpg\" title=\"CSS教程\" class=\"alignnone size-medium wp-image-1760\" /><br />\r\nHoly CSS Zeldman是关于基于标准的、工具、布局相关链接的收集。</p>\r\n<h3>5.&nbsp;</h3>\r\n<p><img height=\"180\" width=\"500\" alt=\"CSS-布局-教程\" src=\"http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F60394O5540-54293.jpg\" title=\"CSS-布局-教程\" class=\"alignnone size-medium wp-image-1761\" /><br />\r\n这里主要是收集Eric Meyer (著名的开发者)的作品，在css/edge和CSS reference等页面可以找到一些相关的资源。</p>\r\n<h3>6.&nbsp;</h3>\r\n<p><img height=\"180\" width=\"500\" alt=\"CSS-技巧\" src=\"http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F60394T5H0-B551.jpg\" title=\"CSS-技巧\" class=\"alignnone size-medium wp-image-1762\" /><br />\r\n456 Berea Street下有一个CSS分类，里面有超过300篇文章，这些文章有教如果放置图片，有些是说CSS技巧。</p>\r\n<h3>7.&nbsp;</h3>\r\n<p><img height=\"180\" width=\"500\" alt=\"position-is-everything\" src=\"http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F60394Z13Z-M562.jpg\" title=\"position-is-everything\" class=\"alignnone size-medium wp-image-1763\" /><br />\r\n在Position Is Everything，你能学到大量CSS的高级应用技巧，Position Is Everything关注着如何解决各种浏览器兼容问题的Bug，并体重各种解决浏览器Bug的CSS解决方案。在这里，你能学到关于和。</p>\r\n<h3>8.&nbsp;</h3>\r\n<p><img height=\"180\" width=\"500\" alt=\"html-dog-CSS教程\" src=\"http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F603949505F-X111.png\" title=\"html-dog-CSS教程\" class=\"alignnone size-medium wp-image-1764\" /><br />\r\nHTML Dog致力于教授最佳的XHTML与CSS布局，分为初级，中级，高级三个级别。英语不好的朋友可以看中文翻译版的.</p>\r\n<h3>9.&nbsp;</h3>\r\n<p><img height=\"180\" width=\"500\" alt=\"CSS-布局\" src=\"http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F60394b9640-94050.png\" title=\"CSS-布局\" class=\"alignnone size-medium wp-image-1765\" /><br />\r\n如果使用CSS定位是一个棘手的问题，这里有10步，看能不能帮你解决。</p>\r\n<h3>10.&nbsp;</h3>\r\n<p><img height=\"180\" width=\"500\" alt=\"CSS-学习-网站\" src=\"http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F6039503C50-10G91.jpg\" title=\"CSS-学习-网站\" class=\"alignnone size-medium wp-image-1766\" /><br />\r\nAndy Budd有着一系列CSS/web标准的有用链接，以帮助你找到有用的资料。</p>\r\n<p>\r\n            <p align=\"center\"> </p>\r\n          \r\n        \r\n        #p#副标题#e#</p>\r\n<h3>11.</h3>\r\n<p><img height=\"180\" width=\"500\" alt=\"\" src=\"http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F60395104160-11W24.png\" title=\"w3c标准-教程\" class=\"alignnone size-medium wp-image-1767\" /><br />\r\nW3CSchools有一个CSS部分，内容涵盖了初级到高级的CSS主题。</p>\r\n<h3>12.</h3>\r\n<p><img height=\"180\" width=\"500\" alt=\"CSS禅意花园\" src=\"http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F60395140240-125c9.jpg\" title=\"css_zen_garden\" class=\"alignnone size-medium wp-image-1768\" /><br />\r\ncss Zen Garden给我们展示了CSS是怎样工作的，使用相同的HTML文件，设计师提交的外部样式来美化这个文件。用Web Developer Tool就可以检查CSS是如何进行布局工作的。这个网站在7个最好的网上CSS资源里也有介绍</p>\r\n<h3>13.</h3>\r\n<p><img height=\"180\" width=\"500\" alt=\"CSS-实例\" src=\"http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F603951N930-135T4.png\" title=\"CSS-实例\" class=\"alignnone size-medium wp-image-1769\" /><br />\r\nMaxDesign拥有Russ Weakley的一套CSS精彩教程，在Listmatic里，教你使用CSS格式化列表，在Floatutorial里，介绍floating元素的知识。</p>\r\n<h3>14.</h3>\r\n<p><img height=\"180\" width=\"500\" alt=\"CSS-网站推荐\" src=\"http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F60395220J0-14U47.png\" title=\"CSS-网站推荐\" class=\"alignnone size-medium wp-image-1770\" /><br />\r\nCSSEasy.com网站的口号是”学习CSS的时髦方法”，拥有丰富的经验及创意分享，让我们更好地了解CSS。这个网站的迟早也会派上用场。</p>\r\n<h3>15.&nbsp;</h3>\r\n<p><img height=\"180\" width=\"500\" alt=\"CSS-教程\" src=\"http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F603952EB0-154307.png\" title=\"CSS-教程\" class=\"alignnone size-medium wp-image-1771\" /><br />\r\nCSS-Discuss是一个CSS爱好者社区，而 CSS-Discuss Wiki是关于CSS的应用收集。</p>\r\n<h3>16.</h3>\r\n<p><img height=\"180\" width=\"500\" alt=\"网页设计-CSS\" src=\"http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F60395332I0-164B4.png\" title=\"网页设计-CSS\" class=\"alignnone size-medium wp-image-1772\" /><br />\r\nWeb Design from Scratch有一章节是关于CSS的，涵盖了CSS的基本概念。 其中的Introduction to CSS对初学者很有帮助。</p>\r\n<h3>17.</h3>\r\n<p><img height=\"180\" width=\"500\" alt=\"css_技巧\" src=\"http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F60395410150-1J327.jpg\" title=\"css_技巧\" class=\"alignnone size-medium wp-image-1773\" /><br />\r\nCSS-Tricks是一个专注CSS的博客</p>\r\n<h3>18.</h3>\r\n<p><img height=\"180\" width=\"500\" alt=\"css\" src=\"http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F60395460230-1T253.png\" title=\"css\" class=\"alignnone size-medium wp-image-1774\" /><br />\r\nThe CSS tag on Delicious是关于优秀CSS设计的链接收集，亮点就是让我们知道哪些好东西在被人看。</p>\r\n<h3>19.&nbsp;</h3>\r\n<p><img height=\"180\" width=\"500\" alt=\"css-教程\" src=\"http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F60395500T0-1c215.png\" title=\"css-教程\" class=\"alignnone size-medium wp-image-1775\" /><br />\r\nSitePoint有一个CSS部分，专门讨论入门水平的CSS主题</p>\r\n<h3>20.&nbsp;</h3>\r\n<p><img height=\"180\" width=\"500\" alt=\"css_dog\" src=\"http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F6039554520-203041.png\" title=\"css_dog\" class=\"alignnone size-medium wp-image-1776\" /><br />\r\nCSSDog有一部分为初学者与高级开发者设计的，其中的开发经验及参考，个人认为是最有价值的部分。</p>\r\n<p>英文原文：</p>\r\n            <p align=\"center\"> </p>', '', '', '');
INSERT INTO `youbang_addonarticle` VALUES (33, 3, '<p>CSS是众所周知且应用广泛的网站样式语言，在它的版本三(CSS3)计划中，新增了一些能够节省时间的特性。尽管只有当前最新了浏览器版本才能支持这些 效果，但了解它们还是必须且很有趣味性的。暴风彬彬将在这篇文章向大家展示CSS中的5个有趣的新技术:圆角、个别圆角、不透明度、阴影和调整元素大小。</p>\r\n<h3>1：基本标记</h3>\r\n<p><img height=\"387\" width=\"500\" src=\"http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F60395AI60-21A37.png\" alt=\"css3-教程\" title=\"css3-教程\" class=\"alignnone size-full wp-image-2156\" /><br />\r\n在我们开始这个教程之前，先来创建整个教程都要使用的基本标记。<br />\r\n我们的xHTML需要一下div元素:</p>\r\n<ul>\r\n    <li>#round, 使用CSS3代码实现圆角.</li>\r\n    <li>#indie, 应用个别的几个圆角.</li>\r\n    <li>#opacity, 展示新的CSS3实现不透明度的方式.</li>\r\n    <li>#shadow,展示不使用的情况下，使用CSS3来实现阴影效果.</li>\r\n    <li>#resize, 展示如何使用某种CSS来实现重设大小的效果.</li>\r\n</ul>\r\n<p>综上所述，我们的xHTML应该是这样的:</p>\r\n<blockquote>\r\n<p><!DOCTYPE html PUBLIC “-//W3C//DTD XHTML 1.0 Transitional//EN” “http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd”><br />\r\n<html xmlns=”http://www.w3.org/1999/xhtml”><br />\r\n<head><br />\r\n<meta http-equiv=”Content-Type” content=”text/html; charset=utf-8″ /><br />\r\n<title>An Introduction to CSS3; A Nettuts Tutorial</title><br />\r\n<link href=”style.css” rel=”stylesheet” type=”text/css” /><br />\r\n</head><br />\r\n<body><br />\r\n<div id=”wrapper”><br />\r\n<div id=”round”> </div><br />\r\n<div id=”indie”> </div><br />\r\n<div id=”opacity”> </div><br />\r\n<div id=”shadow”> </div><br />\r\n<div id=”resize”><br />\r\n<img src=”image.jpg” alt=”resizable image” width=”200″ height=”200″><br />\r\n</div><br />\r\n</div><br />\r\n</body><br />\r\n</html></p>\r\n</blockquote>\r\n<p>下面来创建基本CSS文件:</p>\r\n<blockquote>\r\n<p>body&nbsp;&nbsp;&nbsp; {<br />\r\nbackground-color: #fff;<br />\r\n}<br />\r\n#wrapper {<br />\r\nwidth: 100%;<br />\r\nheight: 100%;<br />\r\n}<br />\r\ndiv {<br />\r\nwidth: 300px;<br />\r\nheight: 300px;<br />\r\nmargin: 10px;<br />\r\nfloat: left;<br />\r\n}</p>\r\n</blockquote>\r\n<p>正如你上面看到的，我们给每个div元素300px的宽和高，并让它们向左浮动，整个页面的div都留给我们在后面的工作中添加样式。</p>\r\n<h3>2:圆角</h3>\r\n<p><img height=\"249\" width=\"498\" src=\"http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F60395J4210-2225Z.png\" alt=\"css3-特性\" title=\"css3-特性\" class=\"alignnone size-full wp-image-2157\" /><br />\r\n目前而言，创建圆角的方法有很多，但都很麻烦。最常用的方法:首先，你要创建圆角的图片；然后，你要创建很多html元素并使用背景图像的方式显示圆角。具体流程你我都很清楚。</p>\r\n<p>这个问题将在CSS3中很简单的解决掉，那就是叫做“border-radius”的属性。我们先创建一个黑色的div元素并给他设置黑色的边框。边框就是要实现“border-radius”属性效果的前提。<br />\r\n像这样:</p>\r\n<blockquote>\r\n<p>#round {<br />\r\nbackground-color: #000;<br />\r\nborder: 1px solid #000;<br />\r\n}</p>\r\n</blockquote>\r\n<p>现在你已经创建了div元素，它看起来和你预期的样子一样，300px款和高有楞有角且是黑色的。下面我们来添加实现圆角的代码，它是如此的简洁，仅仅需要两行代码。</p>\r\n<blockquote>\r\n<p>#round {<br />\r\nbackground-color: #000;<br />\r\nborder: 1px solid #000;<br />\r\n-moz-border-radius: 10px;<br />\r\n-webkit-border-radius: 10px;<br />\r\n}</p>\r\n</blockquote>\r\n<p>在这里，我们添加了两行类似的代码，-moz-适用于Firefox浏览器，而-webkit-则是用于Safari/Chrome浏览器。<br />\r\n注:目前为止IE浏览器不支持border-radius属性，所以如果想让IE也有圆角效果，那么就要单独添加圆角了。<br />\r\nborder-radius这个属性直译过来是边框半径的意思，就如同一样，它的值越大，圆角也就越大。</p>\r\n<h3>3:个别的圆角</h3>\r\n<p><img height=\"250\" width=\"500\" src=\"http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F60395Ma20-231438.png\" alt=\"css3-技巧\" title=\"css3-技巧\" class=\"alignnone size-full wp-image-2158\" /><br />\r\n如果按照过去的习惯做法，会浪费你很多时间，现在CSS3能快速解决!<br />\r\n我们现在只想让div的右上和右下是圆角，那么仅需稍作修改:</p>\r\n<blockquote>\r\n<p>#indie {<br />\r\nbackground-color: #000;<br />\r\nborder: 1px solid #000;<br />\r\n-moz-border-radius-topright: 10px;<br />\r\n-moz-border-radius-bottomright: 10px;<br />\r\n-webkit-border-top-left-radius: 10px;<br />\r\n-webkit-border-bottom-left-radius: 10px;<br />\r\n}</p>\r\n</blockquote>\r\n<p>试想一下这种做法会用在网页中的什么元素呢？对！就是标签式的导航按钮！</p>\r\n<h3>4:以CSS3的方式修改不透明度</h3>\r\n<p><img height=\"250\" width=\"500\" src=\"http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F60395T4530-24O38.png\" alt=\"css3-教程\" title=\"css3-教程\" class=\"alignnone size-full wp-image-2159\" /><br />\r\n现在你可以按惯例编写几行代码来实现不透明度的效果(hack)。不过CSS3简化了这个流程。<br />\r\n这行代码很好记，仅仅是 “opacity: value;”:</p>\r\n<blockquote>\r\n<p>#opacity {<br />\r\nbackground-color: #000;<br />\r\nopacity: 0.3;<br />\r\n}</p>\r\n</blockquote>\r\n<h3>5:阴影效果</h3>\r\n<p><img height=\"250\" width=\"500\" src=\"http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F60395Y9D0-255107.png\" alt=\"css3-教程\" title=\"css3-教程\" class=\"alignnone size-full wp-image-2160\" /><br />\r\n实现阴影也有很多方法，最常用的就是使用制作成阴影图片，然后应用到背景属性中。但CSS3让你的工作更有效率，不幸的是，目前只有Safari和Chrome支持这个新特性。<br />\r\n仅仅需要一行代码，不过它有4个不同的值:</p>\r\n<blockquote>\r\n<p>-webkit-box-shadow: 3px 5px 10px #ccc;</p>\r\n</blockquote>\r\n<p>下 面我来解释一下这四个值都代表什么，第一个3px是指定阴影与div元素之间的水平(横向)距离，第二个5px指的是阴影与div之间的垂直(纵向)距 离，第三个10px指的是阴影的模糊度(类似于photoshop中的羽化)，值越大越细腻。最后的值不说大家也知道，就是阴影的颜色。<br />\r\n我们最终阴影效果代码；</p>\r\n<blockquote>\r\n<p>#shadow {<br />\r\nbackground-color: #fff;<br />\r\nborder: 1px solid #000;<br />\r\n-webkit-box-shadow: 3px 5px 10px #ccc;<br />\r\n}</p>\r\n</blockquote>\r\n<p>正如你看到的，我们个这个div设置了白色的背景，黑色的边框和亮灰色的阴影。</p>\r\n<h3>6:调整大小</h3>\r\n<p><img height=\"250\" width=\"500\" src=\"http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F6039595410-262108.png\" alt=\"css3-教程\" title=\"css3-教程\" class=\"alignnone size-full wp-image-2161\" /><br />\r\n在最新版本的CSS中，调整元素的尺寸已经成为可能（不过目前仅Safari支持）</p>\r\n<p>使 用这个代码以后，我们的元素的右下角会出现一个小三角以提示用户这个元素是可以调整尺寸的。代码依然很简单，可以说仅需要一行代码，当然你还可以配合使用 一些曾经使用过的属性，比如”max-width”, “max-height”, “min-width”和 “min-height”.</p>\r\n<blockquote>\r\n<p>#resize {<br />\r\nbackground-color: #fff;<br />\r\nborder: 1px solid #000;<br />\r\nresize: both;<br />\r\noverflow: auto;<br />\r\n}</p>\r\n</blockquote>\r\n<p>在这里主要说一下resize和overflow属性，resize:both;的意思就是所有边都可以调整尺寸，它的值还有<strong>horizontal</strong>和<strong>vertical</strong>，顾名思义，就是横向和纵向。而overflow是为了配合resize工作的，在这里使用auto.</p>\r\n<h3>总结</h3>\r\n<p><img height=\"387\" width=\"500\" src=\"http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F60395AI60-21A37.png\" alt=\"css3-教程\" title=\"css3-教程\" class=\"alignnone size-full wp-image-2156\" /><br />\r\n怎 么样，你在这篇文章中有没有什么收获呢？虽然现在仅有很少数的浏览器支持CSS3，但不可否认的是CSS3的确会为我们的工作节省更多的时间。如果你对渐 进增强有所了解和认识的话，我想你会欣然接受CSS3这个强大的新版本的。不要再把你的时间都花在IE6上了，那样你只能会是过时的前端开发工程师。</p>\r\n<p>英文原文:<br />\r\n翻译原文:</p>\r\n            <p align=\"center\"> </p>', '', '', '');
INSERT INTO `youbang_addonarticle` VALUES (34, 4, '<p>关于英文的写作有一本十分著名的书，（风格要素），编写程序也有一本（编程风格要素）。证明了在某种程度上，编写程序其实就是语文写作，清晰的风格对程序的质量有着重要的影响。草率含混的风格会隐蔽程序真性。</p><p>作为JavaScript Guru, 提出了自己对JavaScript风格的创见（，）。</p><p>第一部分主要讨论JavaScript语言本身，包括：</p><ul><li><strong>淘汰过时的构建。</strong> <p>讨论了在HTML页面引入JavaScript的方式。经典的写法是：</p><pre><code><script language=javascript><!--\r\n--></script></code></pre><p><code><font face=\"NSimsun\">language</font></code>并不是W3C所认同的标准，建议使用的是<code><font face=\"NSimsun\">type</font></code>, 但作为<code><font face=\"NSimsun\">type</font></code>值的MIME type并没有标准化（有时是<code><font face=\"NSimsun\">text/javascript</font></code>, 有时是application/ecmascript），但目前所有的浏览器都是使用JavaScript作为默认的脚本语言，因此仅仅些<font face=\"NSimsun\"><code><script>就是安全的。随着NetScape 3的淘汰，</code><code><-- --></code></font>也不是必要的了。</p><p>（注：这个东西Web标准社区也有自己的看法，并认为应该写<code><font face=\"NSimsun\">type=\"text/javascript\"</font></code>，我也赞成。） </p></li><li><strong>在结构中始终使用区块。</strong> <p>莫偷懒，省略区块（即<code><font face=\"NSimsun\">{ }</font></code>）会引发不经意的错误和麻烦。即使只有一句，也老老实实写上：</p><pre><code>if (expression) { ... }</code></pre></li><li><strong>避免在表达式中进行赋值。</strong>虽然可以使代码紧凑，但会让控制流程难于理解。 </li><li><strong>使用对象扩充。</strong>在不需要构造函数的对象中，不如先创建一个空对象，然后扩充它。 </li><li><strong>使用通用库。</strong>注意提高代码的重用。 </li></ul><p>第二部分主要讲的是一些使程序更清晰和简洁的习惯用法：</p><ul><li><strong>使用<code><font face=\"NSimsun\">==</font></code>得当心强类型。</strong><code><font face=\"NSimsun\">1 == true</font></code>是真，但<code><font face=\"NSimsun\">1 === true</font></code>却为假。 </li><li><strong>使用<code><font face=\"NSimsun\">?:</font></code>运算符选择两值之一。</strong>在这种操作中，三元运算符为此而生。 </li><li><strong>永远不要使用隐含的全局变量。</strong>请记得声明变量时加上<code><font face=\"NSimsun\">var</font></code>. </li><li><strong>不要使用<code><font face=\"NSimsun\">?:</font></code>来选择两种行为的其一。</strong>写作<code><font face=\"NSimsun\">p.style.backgroundColor = z ? \'#fff\' : \'#989898\';</font></code>而不是<code><font face=\"NSimsun\">(z == 0) ? p.style.backgroundColor = \'#fff\' : p.style.backgroundColor = \'#989898\';</font></code>。 </li><li><strong>使用<code><font face=\"NSimsun\">||</font></code>来指定一个默认值。</strong>最典型的莫过于处理事件参数了：<code><font face=\"NSimsun\">var e = e || event;</font></code>。 </li><li><strong>全局变量是邪恶的。</strong> </li><li><strong>使用内部函数来避免全局变量。</strong> </li></ul><p>这些风格是Crock在2005年提出的，现在有些已经深入人心（如不要使用全局变量），因而也没有必要多做解释了。如果你有所疑惑，不如详细看看这两篇风格文章，里面有大量的代码来举证这些风格的重要性。</p><p><strong>更新：</strong>也不错。 </p>\r\n            <p align=\"center\"> </p>', '', '', '');
INSERT INTO `youbang_addonarticle` VALUES (35, 4, '<p>软件开发中一个比较棘手的内容是使用时间和日期值；似乎每种语言或者每种平台都有自己的格式。在Web开发过程中，你可以使用服务器端的代码来操控日期，你也可以使用JavaScript的日期（Date）对象来实现同样的目的。在今天的专栏里，我们将仔细看看这个对象。</p><p><strong>使用日期</strong></p><p>在JavaScript里使用时间和日期值非常简单。这要从创建日期对象的一个实例开始：</p>var d = new Date(); <p>这会使用当前的日期和时间在变量d里返回一个日期对象的实例。这个日期对象包括多个用于访问和操控其值的方法和属性。下面的列表列出了用于访问日期值的方法：</p><ul><li><strong>getDate()</strong>：返回月份里的日期。 </li><li><strong>getDay()</strong><strong>：</strong>返回星期几。每周从星期六开始（0－6）。 </li><li><strong>getFullYear()</strong>：返回四位数的年份。 </li><li><strong>getMonth()</strong>：返回月份。 </li><li><strong>getYear()</strong>：返回两位数的年份。 </li><li><strong>getUTCDate()</strong>：根据协调世界时（UTC）返回月份里的日期。 </li><li><strong>getUTCMonth()</strong>：根据协调世界时（0－11）返回月份。 </li><li><strong>getUTCFullYear()</strong>：根据协调世界时返回四位数的年份。 </li></ul><p><strong>注：</strong>维基百科全书（Wikipedia）将协调世界时定义为一种高精度的原子时间标准，它大约相当于世界时（UT）。</p><p>关于JavaScript和日期需要注意的一点是，它使用从1970年1月1日午夜起的毫秒数来保存日期。这叫做历元（epoch），任何在这个日期之前的日期和时间都是不被允许的。</p><p>正如<strong>Listing A</strong>里说明的，使用前面一个列表里的方法是很简单明了的。你需要注意的是日期和星期中的天的值是从零开始的，所以需要向它们添加一个值以显示它们真正的值。你可以很容易就使用一个数组来显示星期几。<strong>列表B</strong>里是JavaScript代码。</p><p>你没有被限制只使用当前的日期。日期对象可以用传递给它的值初始化，就像下面这样：</p><p>var d = new Date(\"date value\");</p><p>利用这种方式，我们可以修改前面的例子来使用特定的日期。<strong>列表C</strong>代表了一种发现给定值的周日期的简单方法。代码会生成下面的结果：</p><p>Today is: Wednesday 4/15/1979<br />UTC is: Wednesday 4/15/1979 </p><p>事实上，创建日期对象实例的方式有四种：</p><p>var d = new Date();<br />var d = new Date(\'July 4, 1976\');<br />var d = new Date(7, 4, 1976);<br />var d = new Date(7, 4, 1976, 12,00,00); </p><p>我们已经讲了前两个（要注意的是可能会用到单引号或者圆括号）。最后两个按照下面的格式使用了单独的整数参数（时间是可选的）：</p><p>var d = new Date(month, day, year, hour, minutes, seconds); </p><p>填充日期对象的另外一种方式是利用setDate方法。它提供了一种重置日期对象的值或者初始化它的方式，但是这要求有一个真正的JavaScript日期对象：</p><p>Var d1 = new Date();<br />var d2 = new Date(\"7/4/1976\");<br />d1.setDate(d2.getDate()); </p><p>填充日期对象的各种属性的固定方法还有很多，但是在讨论它们之前我们先来看看时间吧。</p><p>除了日期组件，日期对象也保存了时间信息。下面的方法能够访问到日期对象的时间信息：</p><ul><li><strong>getHours()</strong>：返回时间的小时部分。 </li><li><strong>getMinutes()</strong>：返回时间的分钟部分。 </li><li><strong>getSeconds()</strong>：返回时间的秒部分。 </li><li><strong>getMilliseconds()</strong>：返回时间的毫秒部分。 </li><li><strong>getTime()</strong>：返回自从1970年1月1日午夜以来的毫秒数。 </li><li><strong>getTimezoneOffset()</strong>：返回本地时间与格里尼治标准时间（GMT）之间的分钟差。 </li><li><strong>getUTCHours()</strong>：根据协调世界时返回时间的小时部分。 </li><li><strong>getUTCMinutes()</strong>：根据协调世界时返回时间的分钟部分。 </li><li><strong>getUTCSeconds()</strong>：根据协调世界时返回时间的秒部分。 </li><li><strong>getUTCMilliseconds()</strong>：根据协调世界时返回时间的毫秒部分。 </li></ul><p>\r\n            <p align=\"center\"> </p>', '', '', '');
INSERT INTO `youbang_addonarticle` VALUES (36, 4, '<p>像JSP、ASP.NET、ColdFusion这样的Web开发平台提供了大量强大服务器端开发选项。但是，它们并没有否定用JavaScript进行客户端的Web开发。</p><p>JavaScript同时提供了逻辑和用户接口功能，减轻了服务器端处理的负载。尽管我们已经使用它有多年了，但是它的开发工具还是有点落后。现在就让我们仔细看看JavaScript的开发和调试选项。</p><p><strong>开发工具</strong></p><p>如果你习惯使用诸如Visual Studio或者NetBeans这样的集成开发环境（IDE），那么你就一定很熟悉各种调试选项，包括代码单步调试、设置断点，以及监视变量等。在监视代码执行或者追踪错误时，这些都是不可或缺的工具。不幸的是，这些工具在JavaScript开发人员中并不是十分普及。</p><p><strong>调试</strong></p><p>应用程序开发中的一个重要步骤是追踪脚本或者代码中的错误。这包括隔离代码段，一行一行地分析它们。在使用JavaScript的时候，你可以使用在开发工具大发展之前用过的方法。</p><p>在这种情况下，最常用的一种JavaScript函数是警报信息框。你可以用它来检查保存在变量／对象里的值，并与循环一起使用来查看对象的内容。</p><p>举个例子，<strong>列表A</strong>里的HTML代码没有按照预期的效果执行：</p><html><head><br /><title>JS Test</title><br /><script language=\"JavaScript\"><br />function validate() {<br />var doc = document.forms[0];<br />var flag = true;<br />if (doc.fullName.value = \'\')<br />flag = false;<br />if (doc.contactNumber.value = \'\')<br />flag = false;<br />if (flag) doc.submit()<br />else alert(\'Enter values before submitting.\');<br />}<br /></script></head><br /><body><br /><form id=\"frmTest\"><br />Name: <input name=\"fullName\" type=\"text\" /><br /><br />Address: <input name=\"contactNumber\" type=\"text\" /><br /><br /><input type=\"button\" value=\"Submit\" onclick=\"validate();\" /><br /></form></body></html> <p>按理说，它会在表单被真的提交之前验证在两个文本字段里输入的值。</p><p>这个表单总是不管输入的值是什么就被提交，所以我们可以使用警报语句在脚本执行期间检查值的内容。<strong>列表B</strong>里的脚本就使用了警报语句来监视变量的值：</p><p><html><head><br /><title>JS Test</title><br /><script language=\"JavaScript\"><br />function validate() {<br />var doc = document.forms[0];<br />var flag = true;<br />alert(\'Script starting, flag = \' + flag);<br />alert(\'Script starting, Full name = \' + doc.fullName.value);<br />alert(\'Script starting, Contact number = \' + doc.contactNumber.value);<br />if (doc.fullName.value = \'\') {<br />alert(\'First check, Full Name is empty.\');<br />flag = false;<br />}<br />if (doc.contactNumber.value = \'\') {<br />alert(\'Second check, Contact Number is empty.\');<br />flag = false;<br />}<br />if (flag) {<br />alert(\'Validation successful, document will be submitted.\');<br />doc.submit()<br />} else {<br />alert(\'Enter values before submitting.\');<br />} }<br /></script></head><br /><body><form id=\"frmTest\"><br />Name: <input name=\"fullName\" type=\"text\" /><br /><br />Address: <input name=\"contactNumber\" type=\"text\" /><br /><br /><input type=\"button\" value=\"Submit\" onclick=\"validate();\" /><br /></form></body></html> </p><p>\r\n            <p align=\"center\"> </p>', '', '', '');
INSERT INTO `youbang_addonarticle` VALUES (37, 4, '　　使用AJAX的十大理由： <br /><br />　　10、XAML,XUL,XForms...等等。 <br /><br />　　9、服务端技术的不确定性。 <br /><br />　　8、Web2.0。 <br /><br />　　7、被软件工业领袖们强势采用。 <br /><br />　　6、和Flex和Flash等技术的很好的集成。 <br /><br />　　5、边际成本低。 <br /><br />　　4、能使常规的Web应用受益。 <br /><br />　　3、跨浏览器和跨平台。 <br /><br />　　2、以可用性和用户体验为王。 <br /><br />　　1、基于公开标准。 <br /><br />　　十大理由第一名：公开标准 <br /><br />　　让我们从第一条开始，AJAX技术是基于被各大浏览器和平台都支持的公开标准的技术。这意味着该技术不怕技术提供商的技术封锁。组成AJAX技术的大多数技术都能放心的使用很多年，而那些不是热点的、最新的和未经考验的技术只能使用一段时间。现在，对于绝大多数的用户和企业来说，浏览器是一个可信任的应用平台，这在五年前就不是个问题了。对于AJAX来说，FIREFOX浏览器的基础Mozilla1.0的发布并且支持XMLHTTPRequest对象是一个转折点。这种允许异步数据交换的技术好多年前就被IE浏览器支持了。这种支持和FIREFOX浏览器的大量被采用真正的使人们理解了跨浏览器的富Internet应用成为了可能。 <br /><br />　　1)JavaScriptorECMAScript(StandardECMA-262)：一个有趣的事情是，Javascript是经过长时间后才成为被人们接受的技术，长时间以来，很多公司采用非Javascript技术的方针，幸运的是，这种状况被迅速的改变。 <br /><br />　　http://www.ecma-international.org/publications/standards/Ecma-262.htm <br /><br />　　2)XML：是一个来自W3C的、被广泛应用的标准。 <br /><br />　　http://www.w3.org/XML/ <br /><br />　　3)HTML：http://www.w3.org/MarkUp/ <br /><br />　　4)CSS：http://www.w3.org/Style/CSS/ <br /><br />　　5)XMLHTTPRequestObject：被InternetExplorer、Mozilla-based、Safari和Opera浏览器支持。 <br /><br />　　十大理由第二名：可用性 <br /><br />　　开发人员和设计人员开始认识到不仅大型的用户体验在市场上是成功的，而且也认识到这样体验是怎么来影响用户的开销的。基于AJAX技术的google地图比传统的选择MapQuest更成功，证明了提供更好的用户体验的产品的成功。AJAX技术是使网络应用有更好的可用性的一个领导性的技术。它允许从服务器端请求少量的信息，而不是整个网页。它增加了页面数据的更新但同时减少了页面的刷新和刷新等待，这些问题从网络已诞生就折磨着Web应用。 <br /><br />　　人们已经知道他们需要一个优秀的用户界面并且有对该界面的投资意愿。前提条件是：用户能够快速的取得信息不管数据是一个内部网的应用还是一个广域网的服务。 <br /><br />　　十大理由第三名：跨浏览器和跨平台的兼容性 <br /><br />　　IE和基于Mozilla的FIREFOX是占据市场分额最大的两个浏览器，并且它们都支持在浏览器上轻松创建基于AJAX的WEB应用。现在开发运行在更为先进的WEB浏览器上的基于AJAX的富WEB应用成为了可能。这是为什么AJAX应用变得如此流行的一个最重要的原因。其实很多开发人员多年前就意识到AJAX技术流行的可能，但一直没有流行是因为浏览器厂商的原因。感谢Mozilla和FIREFOX。 <br /><br />　　十大理由第四名：使常规的WEB应用受益 <br /><br />　　AJAX技术是当今WEB应用的门面——WEB应用获得的利益超过了桌面应用。这些利益包括部署应用的低投入、维护方便、缩短开发时间和不需要安装。这些都是促使商业和用户自从上世纪九十年代以来采用WEB应用的优点。AJAX技术不但能使WEB应用获得益处，而且使最终用户受益。 <br /><br />　　十大理由第五名：促使技能、工具和技术的升级 <br /><br />　　由于AJAX基于这些年一直使用的一些公开标准，很多的开发人员就会有新的技术方面的要求以便能够开发AJAX应用。但这并不意味着开发团队从基于HTML和FORM的应用转移到富AJAX型应用需要很高的学习曲线。同时，这意味着开发WEB应用的开发团体需要加速将他们的用户接口升级到AJAX，但并不需要一个大规模的升级和重写他们的WEB应用。自从上世纪九十年代以来，在开发基于浏览器应用方法花了大量投资的那些系统强烈的希望能在现有的应用的基础上增加用户体验。 <br /><br />　　十大理由第六名：能和Flex和Flash等技术的很好的集成 <br /><br />　　大多数的开发社区都不再支持FlashvsAJAX的火热讨论，这两种技术都在不同的场合拥有各自的优点和缺点，但是它们有大量的机会可以集成到一起工作。很多的开发人员和技术提供商意识到这一点，并且开发出了伟大的产品来集成Flex和AJAX协调使用。我们也热切的期望看到两者能在Macromedia里一起工作。 <br /><br />　　十大理由第七名：采用率 <br /><br />　　AJAX被业内领袖广泛采用证明了市场的欢迎程度和该技术组的正确。每一个该技术的使用者都成为了胜利者：包括google、yahoo、Amazon和微软等等。是google地图吸引了WEB开发人员的目光，当人们开始调查是什么原因使得google有着如此惊人的用户体验的时候，人们揭开了罩在AJAX头上的面纱。 <br /><br />　　当然，仅仅是google使用AJAX是不够使得这项技术跨越从支流到主流的鸿沟的。但是，如果你看一看使用AJAX技术的客户如eBusinessApplications(www.ebusinessapps.com)orTibco(http://www.tibco.com)等的表单时，你就会发现财富500强包括主要的金融机构、政府机构、航空公司和其他主要商业机构采用AJAX，并且在AJAX成为硬通货之前很早就开始使用了。 <br /><br />　　十大理由第八名：WEB2.0 <br /><br />　　喜欢也好，厌恶也罢。WEB2.0运行吸引了开发人员、风险投资商、市场和最终用户等所有的目光。这些明确的促进了AJAX的早期应用。当大肆的宣传过去以后，我们将会看到什么呢?从BackPack到google地图，AJAX界面是WEB2.0应用的主要的组成。大量的宣传有助于加速采用AJAX，而在可用性上的获益会使得该技术被广发应用。WEB2.0的一个主要原则是使用WEB作为一个应用开发的平台，而不仅仅是一个网页。高的可用性和交互能力的用户界面是一切应用平台的主要组成部分。 <br /><br />　　十大理由第九名：AJAX基于服务器技术的不确定性 <br /><br />　　和AJAX技术的浏览器的独立性相同，该技术也兼容所有的标准型的服务器和服务端语言，如PHP,ASP.ASP.Net,Perl,JSP,ColdFusion等等，选择属于你的那种然后开始。这使得AJAX开发独立，因为所有的开发人员都能使用并且一起讨论相同的表现层。 <br /><br />　　十大理由第十名：基于WEB的下一代RIA技术还没有出现 <br /><br />　　今天就使用XUL技术开发应用的人是伟大的，因为现在90%的浏览器还不支持这种技术，对于大多数的实际应用来说，使用这种技术不切合实际。然而，AJAX开发人员应该给出一部分的注意力在这些技术，如XAML和XUL上。毫无疑问，这些技术将使开发富WEB应用变得简单。但是它们可能相互不兼容并且拥有不同的市场需求或动力。 <br /><br />　　在今后一段时间，AJAX技术将极大的提高WEB应用的可用性。AJAX技术并不完美，不是“火箭科学”许多的开发人员和技术公司始终在尝试RIA的其他更好的技术。而实际的问题是AJAX技术现在已经存在并且应用的很好，它跨浏览器、跨平台，而且不管是用户还是开发人员都喜欢它的作用。特征鲜明的AJAX应用如google地图已经成为了本领域的领导者(还有人使用MapQuest吗?)同样的，领先的财富500强使用AJAX技术并且贡献了开发工具给社区了。一般来说，业内在使用AJAX技术上取得了一致并且正在使用它。再强调一次，RIA应用和WEB应用使用了AJAX获得的一个主要的优势不仅仅是开发人员的一个工具，而是一个现象：它改变了我们开发WEB应用的方式。没人能说得清楚在RIA应用方面，哪一种技术会取代它，会在什么时候取代它;但是很多因素都支持AJAX应用应该持续好多年。 <br /><br />　　关于作者 <br /><br />　　AndreCharland从事Internet软件开始超过十年之久，他是eBusinessApplications(www.ebusinessapps.com)公司的主席和创建者之一。他和DaveJohnson在1998年创建了该公司。他主要的经验在可用性、市场、项目管理和基于构件的软件开发。所受教育包括：在Vancouver,BC的SimonFraserUniversity，他在那里读计算机科学和工商管理。他作为开发者、管理者和架构师等不同身份有上百个Internet项目的经验。\r\n            <p align=\"center\"> </p>', '', '', '');
INSERT INTO `youbang_addonarticle` VALUES (38, 4, '<p>　　Ajax 由 HTML、Javascript&#8482; 技术、DHTML 和 DOM 组成，这一杰出的方法可以将笨拙的 Web 界面转化成交互性的 Ajax 应用程序。本系列的作者是一位 Ajax 专家，他演示了这些技术如何协同工作 —— 从总体概述到细节的讨论 —— 使高效的 Web 开发成为现实。他还揭开了 Ajax 核心概念的神秘面纱，包括 XMLHttpRequest 对象。</p><p>　　五年前，如果不知道 XML，您就是一只无人重视的丑小鸭。十八个月前，Ruby 成了关注的中心，不知道 Ruby 的程序员只能坐冷板凳了。今天，如果想跟上最新的技术时尚，那您的目标就是 Ajax。</p><p>　　但是，Ajax 不仅仅 是一种时尚，它是一种构建网站的强大方法，而且不像学习一种全新的语言那样困难。</p><p>　　在详细探讨 Ajax 是什么之前，先让我们花几分钟了解 Ajax 做 什么。目前，编写应用程序时有两种基本的选择：</p><p>　<strong>　桌面应用程序</strong></p><p><strong>　　Web 应用程序</strong></p><p>　　两者是类似的，桌面应用程序通常以 CD 为介质(有时候可从网站下载)并完全安装到您的计算机上。桌面应用程序可能使用互联网下载更新，但运行这些应用程序的代码在桌面计算机上。Web 应用程序运行在某处的 Web 服务器上 —— 毫不奇怪，要通过 Web 浏览器访问这种应用程序。</p><p>　　不过，比这些应用程序的运行代码放在何处更重要的是，应用程序如何运转以及如何与其进行交互。桌面应用程序一般很快(就在您的计算机上运行，不用等待互联网连接)，具有漂亮的用户界面(通常和操作系统有关)和非凡的动态性。可以单击、选择、输入、打开菜单和子菜单、到处巡游，基本上不需要等待。</p><p>　　另一方面，Web 应用程序是最新的潮流，它们提供了在桌面上不能实现的服务(比如 Amazon.com 和 eBay)。但是，伴随着 Web 的强大而出现的是等待，等待服务器响应，等待屏幕刷新，等待请求返回和生成新的页面。</p><p>　　显然这样说过于简略了，但基本的概念就是如此。您可能已经猜到，Ajax 尝试建立桌面应用程序的功能和交互性，与不断更新的 Web 应用程序之间的桥梁。可以使用像桌面应用程序中常见的动态用户界面和漂亮的控件，不过是在 Web 应用程序中。</p><p>　　我们来看看 Ajax 如何将笨拙的 Web 界面转化成能迅速响应的 Ajax 应用程序吧。</p><p>　　<strong>老技术，新技巧</strong></p><p>　　在谈到 Ajax 时，实际上涉及到多种技术，要灵活地运用它必须深入了解这些不同的技术(本系列的头几篇文章将分别讨论这些技术)。好消息是您可能已经非常熟悉其中的大部分技术，更好的是这些技术都很容易学习，并不像完整的编程语言(如 Java 或 Ruby)那样困难。</p><p>　　<strong>Ajax 的定义</strong></p><p><strong>　　Ajax 是 Asynchronous Javascript and XML(以及 DHTML 等)的缩写。这个短语是 Adaptive Path 的 Jesse James Garrett 发明的(请参阅 参考资料)，按照 Jesse 的解释，这不是 个首字母缩写词。</strong></p><p>　　下面是 Ajax 应用程序所用到的基本技术：</p><p>　　<strong>HTML 用于建立 Web 表单并确定应用程序其他部分使用的字段。</strong></p><p><strong>　　Javascript 代码是运行 Ajax 应用程序的核心代码，帮助改进与服务器应用程序的通信。</strong></p><p><strong>　　DHTML 或 Dynamic HTML，用于动态更新表单。我们将使用 div、span 和其他动态 HTML 元素来标记 HTML。</strong></p><p><strong>　　文档对象模型 DOM 用于(通过 Javascript 代码)处理 HTML 结构和(某些情况下)服务器返回的 XML。</strong></p><p>　　我们来进一步分析这些技术的职责。以后的文章中我将深入讨论这些技术，目前只要熟悉这些组件和技术就可以了。对这些代码越熟悉，就越容易从对这些技术的零散了解转变到真正把握这些技术(同时也真正打开了 Web 应用程序开发的大门)。</p><p>\r\n            <p align=\"center\"> </p>', '', '', '');
INSERT INTO `youbang_addonarticle` VALUES (39, 4, '<p>JavaScript包含的Ajax是Web2.0应用的一个重要组成部分。该部分的进化发展使网络变成了超级平台。该转变同时也催生了新品种的病毒和蠕虫，比如Yamanner,Samy 以及Spaceflash等等。Google,Netflix,Yahoo 以及MySpace等门户网站在过去的几个月里都因为新的漏洞而蒙受一定损失。黑客们可以利用这些漏洞进行钓鱼，跨站点脚本(XSS)以及跨站点伪造(XSRF)请求等攻击。 </p><p>Ajax中没有固有的安全漏洞，但是对该技术向量的适配显著地改变了网络应用的开发途径以及方法论。以前，DCOM和CORBA组成核心中间件层的时候，将数据和对象序列化非常困难。Ajax使用简单的GET,POST或者SOAP调用，来转换XML,HTML,JS Array,JSON,JS Objects以及其他定制的对象；全部这些操作都不需要调用中间件层。Ajax的这种综合能力使应用服务器与浏览器之间的数据交换非常流畅。从服务器端传来的信息动态地被注入到当前的DOM相关环境，然后浏览器的DOM状态重置。在讲安全漏洞之前，我们先来看看促成Web2.0漏洞的关键因素。 </p><p>多重分散的终端点以及隐藏调用——Web2.0应用与Web1.0的主要区别就是信息访问机制的区别。比起它的前身Web1.0, Web2.0应用有数个Ajax终点。潜在的Ajax调用分散于整个浏览器页面，并且能够被各个事件分别调用。开发者恨难应付Ajax调用的这种分散性，并且由于这些调用是隐藏的，不那么明显，它还可能导致代码不规范。 </p><p>认证混乱——输入和输出内容认证是应用的重要因素之一。Web2.0应用使用桥，mashups,还有反馈等等。很多情况下，它假定“另一方”（读取服务器端或者客户端代码）已经实现了认证，这种混乱就导致了双方都没有实现适当的认证控制。 </p><p>不受信任的信息来源——Web2.0应用从很多不受信任的来源比如反馈，博客，搜索结果中获得信息。这些内容在提供给终端浏览器之前从来没有被认证，这就有可能引发跨站点攻击。黑客还有可能在浏览器中加载JavaScript，以便迫使浏览器发出跨域的调用并打开安全漏洞。那样的话，这些致命的漏洞就能被病毒和蠕虫利用。 </p><p>数据序列化——浏览器可以调用Ajax来实施数据序列化。它可以获取JS array,Objects,Feeds,XML文件，HTML 块以及JSON。如果这些序列块中的某一个被解析并修改了，黑客们就可以强迫浏览器执行恶意脚本。不受信任信息与数据序列化的结合，对终端用户的安全是致命的。 </p><p>动态脚本构成和执行——Ajax会建立一个后端通道，从服务器获取数据，然后将它传送给DOM。实现这一点的必要条件就是动态地执行JavaScripts，以便随时更新DOM或者浏览器页面缓存的状态。Ajax通过调用定制的功能或者eval()功能。未经认证的内容或者使用不安全的调用，轻则导致会话内容泄露，重则迫使浏览器执行恶意内容等各种后果。 </p><p>Web2.0应用可能因为上面提到的1个或多个失误而变得易受攻击。如果开发者不够审慎，没有花心思在安全管理上的话，那么服务器和浏览器端都会出现安全问题。以下是10个可能的安全漏洞的简要说明。 </p><p><strong>（1）畸形的JS对象序列</strong> </p><p>JavaScript支持面向对象编程(OOP)技术。它有很多不同的内置对象，也允许用户自己创建对象。使用者可以用new object() 或者自己编辑如下代码来创建新的对象。 </p><p /><span class=\"code\"><pre>message = {\r\nfrom : \"john@example.com\",\r\nto : \"jerry@victim.com\",\r\nsubject : \"I am fine\",\r\nbody : \"Long message here\",\r\nshowsubject : function(){document.write(this.subject)}\r\n};</pre></span><p>这是一个简单的消息对象，其中有2个字段需要电子邮件地址。我们可以使用Ajax来将该对象序列化并用JavaScript代码编译。程序员可以将它赋值到变量或者eval()。如果攻击者发送嵌入了脚本的恶意“主题”，那么读者就将成为跨站点脚本攻击的受害者。JS对象既包含数据也包含方法。对JS对象序列的不当使用将产生可以被诡计多端的注入代码利用的安全漏洞。 </p><p><strong>(2)JSON对注入</strong> </p><p>JavaScript对象符号(JSON)是一个简单而有效的少量数据交换格式，它包含对象，数组，Hash表，向量以及列表数据结构。JavaScript, Python, C, C++, C# 和Perl languages都支持JSON。JSON序列在Web2.0应用中是个非常有效的交换机制。开发者频繁使用Ajax和JSON，获取并传送必要的信息给DOM。下面是个简单的带有不同的name值对的JSON对象：“bookmarks”对象。 </p><p /><span class=\"code\"><pre>{\"bookmarks\":[{\"Link\":\"www.example.com\",\"Desc\":\"Interesting link\"}]}</pre></span><p>黑客们可以在Link或者Desc中注入恶意脚本。如果DOM和可执行程序被注入了，XSS目录也会被注入。这是使终端用户感染恶意内容的另一种方法。 </p><p><strong>(3)JS数组中毒</strong> </p><p>JS数组是另一个比较普遍的序列化对象。人们可以很容易地跨平台移植它，并且它在使用不同语言的结构中也很有效。感染一个JS数组可以扰乱整个DOM环境。黑客们可以在浏览器中使用简单的跨站点脚本攻击JS数组。下面是一个JS数组的例子： </p><p /><span class=\"code\"><pre>new Array(“Laptop”, “Thinkpad”, “T60”, “Used”, “900$”, “It \r\nis great and I have used it for 2 years”)</pre></span><p>该数组是从一个拍卖二手笔记本的网站传出来的。如果这个数组对象在服务器端没有被仔细处理，黑客就可以在最后字段中注入脚本。这种注入将危及浏览器安全并被攻击者利用。 </p><p><strong>(4)被修改的XML数据流</strong> </p><p>Ajax调用接受来自多个地址的XML。这些XML块来自运行在SOAP,REST或者XML-RPC的网络服务。这些网络服务是由从第三方的代理桥那里接收过来的。如果这些第三方XML数据流被攻击者修改过，那么攻击者就可能向其中注入恶意内容。 </p><p>浏览器从它自带的XML解析器接收该数据流。该解析器容易受不同的XML炸弹的攻击。人们也可以在该数据流中注入脚本，这样就可以导致跨站点脚本攻击(XSS)。浏览器接收未经认证的XML数据流的话，这就会危及终端客户端的安全。 </p><p><strong>(5)DOM中脚本注入</strong> </p><p>前四个漏洞都是由于序列化问题引起的。一旦浏览器收到序列化的对象数据流，开发者会发出某种调用来访问DOM。这种调用的目的是将新内容“重写”或者“重填”入DOM中，可以调用eval()这个定制功能，也可以使用document.write()。如果这些调用是在不受信任信息流上进行的，浏览器就有可能由于DOM的操作漏洞而受攻击。攻击者可以用很多document.*()调用来向DOM环境中注入XSS。 </p><p>例如，这段JavaScript代码：Document.write(product-review)。 </p><p>在这里，“Product-review”是从第三方blog上获得的变量。如果它含有JavaScript会怎样？答案很明显。这个JavaScript就会被浏览器运行。 </p><p><strong>（6）跨域访问和回调</strong> </p><p>Ajax不能从浏览器跨域访问。所有比较流行的浏览器都有个安全特性，那就是拦截跨域访问。一些网站服务为对象序列提供回调功能。开发者可以使用这个功能来把网站服务整合到浏览器本身。人们可以把该功能名传回，这样浏览器一找到回调对象数据流，它就会被浏览器中早已有的特殊功能名执行。 </p><p>这个回调对使用浏览器内认证的开发者来说是个额外负担。如果输入的对象数据流未经浏览器认证那么终端客户端就会成为跨域攻击的目标。不管是有意还是无意的，跨域服务可以向浏览器中注入恶意内容。该跨域调用在当前DOM环境中运行，于是导致当前对话也易受攻击。在实现应用之前，人们需要仔细检查整个跨域功能。 </p><p><strong>（7）RSS和Atom注入</strong> </p><p>联合的反馈，RSS以及Atom,是最普遍的一种将站点更新信息传到网络上的方法。许多新闻，博客，门户站点等等，都在网络上共享多个反馈。反馈是标准的XML文档，并且可以被任何程序接收。Web2.0应用使用窗口小部件或者浏览器内部元件整合了联合反馈。这些组件调用Ajax来访问反馈。 </p><p>这些反馈可以被终端用户方便地选择。一旦用户选择了它们，这些反馈就会被解析并注入到DOM中。那么如果这个反馈在注入之前没有被适当地认证过，就会出现一些安全问题。人们可以往浏览器中注入恶意链接或者JavaScript代码。注入之后，就大事不妙了，最终结果是XSS和对话被黑客拦截。 </p><p><strong>（8）单击炸弹</strong> </p><p>Web2.0应用可能不会很简单地就被黑客攻下，但他们可以对它进行基于事件的注入。人们可以将带有\"onclick\"字样的恶意链接用JavaScript注入。这样，浏览器就带着个随时等待终端用户右键点击来触发的炸弹。一旦用户点击了链接或按钮，能够启动炸弹的那个事件被启动了，那么攻击就成功了。此类攻击会导致对话被恶意代码拦截。 </p><p>这也是由于人们从那些没有经过正确验证的不受信任源处获得的信息，所导致的安全漏洞。为了利用该安全漏洞，它需要终端客户端触发一个事件。这个事件也许是诸如点击按钮或者链接的这种无害事件，但是点击后就使会用户损失惨重。它可能引起某个恶意事件，将当前对话信息发送给目标，又或者在当前浏览器环境中执行一系列脚本攻击。 </p><p><strong>(9) 基于Flash的跨域访问</strong> </p><p>黑客们可以使用Flash插件的Ajax接口，从而用浏览器中的JavaScritps发出GET和POST请求。这个接口使黑客们能进行跨域调用。为了避免安全问题，该Flash插件实现了根据策略访问其他域的功能。该策略可以通过在域的根部放置crossdomain.xml文件来配置。如果放置的文件配置不当——很普遍的现象——它就可能允许跨域访问。下面是一个配置不当的XML文档： </p><p>现在可以从浏览器自身发出跨域调用了。这个结构还有一些其他安全问题。基于Flash的丰富网络应用(RIA)如果配置错误的话，很容易由于Ajax的跨域访问Bug而被攻击。 </p><p><strong>(10) XSRF</strong> </p><p>跨域伪造请求(XSRF)是个老牌的攻击向量了，它迫使浏览器向不同的域发出HTTP GET或者POST请求；这些请求可以跨域在运行的应用逻辑中启动某种事件。它可能请求修改密码或者电子邮件地址等。浏览器调用它后，它重放cookie并获得身份认证。这就是该请求的关键部分。如果某个应用只根据cookie来判识身份，那么该攻击就会成功。 </p><p>Web2.0中Ajax是就XML-RPC,SOAP或者REST与后端网络服务进行对话的，通过GET和POST可以进行这些调用。换句话说，人们可以对这些网络服务进行跨站点调用，从而危及受害者与网络服务接口的身份信息。XSRF这个攻击向量很有趣，它在这个新界定的端点情况中创造了新的层次。这些终点可能是为Ajax或者网络服务而准备的，但它们也有可能被跨域请求所激活。 </p><p><strong>对安全漏洞的攻击以及相应对策</strong> </p><p>Web2.0应用有多个终端点；每个点都是威胁的侵入点。为了保证安全，我们应当保护好所有这些点。在将第三方信息发送给客户端之前要对其进行彻底处理。 </p><p>为了处理Ajax序列，必须在它们到达DOM之前对输入数据流进行验证。XML解析以及跨域安全问题也需要额外重视，并实施更好的安全管理措施。我们应当遵循那个最简单最笨拙的原则：不让未经认证的跨域信息进入浏览器。有趣的是，到目前为止，安全专家们都不主张使用客户端脚本来进行输入验证，因为这很容易被规避掉。 </p><p>Web2.0促成了很多浏览器安全相关的新的漏洞。利用这些安全漏洞很难但不是不可能。安全问题以及促成因素结合起来将严重影响那些大的网络团体，比如能被攻击者蠕虫和病毒利用的那些组织。最终将导致身份信息的泄漏。 </p><p><strong>结论</strong> </p><p>本文简单地讲了一些可能出现的关于Ajax漏洞。还有很多其他潜在的漏洞，比如利用跨域代理来在浏览器中建立单项通道或者存储变量。 </p><p>Web2.0中很多逻辑都转到了客户端。这会将整个应用暴露给一些严重的威胁。对整合来自多方的、不受信源的数据的迫切要求也将全面增加风险向量：XSS,XSRF,跨域问题以及客户端上的序列，还有不安全的网站服务，服务器端的XML-RPC和REST访问。相反地，Ajax可被用来构造优美的无缝数据整合。但是，任一不安全的调用或者信息流都会使其产事与愿违的效果，从而促成可被利用的安全漏洞。 </p><p>这些新技术向量很有前景，令很多人兴奋不已，但是攻击者，病毒和蠕虫作者对它更感兴趣。为了保障安全，开发者应当在这些细节方面格外小心。 </p><p /><p>============================================= </p><p>原文链接：http://www.net-security.org/article.php?id=956&p=1 </p><p>原文作者：Shreeraj Shah </p><p>原文来源：net square </p>\r\n            <p align=\"center\"> </p>', '', '', '');
INSERT INTO `youbang_addonarticle` VALUES (40, 4, '<p>原文：</p><p>真是五个很quick的小提示：</p><h2>只在<code><font face=\"NSimsun\"><form></font></code>元素上使用<code><font face=\"NSimsun\">submit</font></code>事件</h2><p>如果要在form中绑定事件处理程序时，应该只在<code><font face=\"NSimsun\"><form></font></code>元素上绑定<code><font face=\"NSimsun\">submit</font></code>事件，而不是给提交按钮绑定<code><font face=\"NSimsun\">click</font></code>事件。<br /><strong>March：</strong>这个方式固然很好，但是，公司开发时使用了Web Flow，一个页面就一个大form，而里面可能有若干个提交按钮，所以不得不把部分事件处理程序绑定在了提交按钮的<code><font face=\"NSimsun\">click</font></code>事件上。</p><h2>可点击的都应该是链接</h2><p>不要给除锚元素（<code><font face=\"NSimsun\"><a></font></code>）以外的元素绑定<code><font face=\"NSimsun\">click</font></code>事件。这一点对于键盘用户很重要，因为他们在仅通过键盘获取元素焦点时会遇到困难。<br /><strong>March：</strong>不过个人感觉锚元素还是应该只用作链接，而一些功能性的操作（比如Google Reader的Mark all as new），最好还是用<span>来标注，accessibility的问题可以通过快捷键等方式解决。这样做可以更好的还原HTML元素的语义。</p><h2>简单的for循环优化</h2><p>在你写一个for循环时，有个很简单的技巧能够提高性能。<br /><font face=\"NSimsun\"><code class=\"blockcode\">for ( var i = 0; i < elements.length; ++i )</code><br /></font>使用下面的语句代替上面的：<br /><font face=\"NSimsun\"><code class=\"blockcode\">for ( var i = 0, j = elements.length; i < j; ++i )</code><br /></font>这样可以把元素的个数（<code><font face=\"NSimsun\">elements.length</font></code>的值）储存在一个变量<code><font face=\"NSimsun\">j</font></code>中，这样就不必在每次循环时都计算一遍元素的个数。</p><h2>用匿名函数来作为事件处理程序</h2><p>尤其是对于短小的函数，创建一个匿名函数会比使用一个命名函数的引用更具可读性。<br /><font face=\"NSimsun\"><code class=\"blockcode\">anchor.onclick = function() { map.goToPosition( home ); return false; }</code><br /></font><strong>March：</strong>在较复杂的JavaScript开发时还是使用命名函数效率更高。</p><h2>使用<code><font face=\"NSimsun\">Array.join</font></code>代替字符串连接（concatenating strings）</h2><p>在将很多字符串、变量等连接成一个很长的字符串时，将所有字符串和变量放入一个数组，然后用<code><font face=\"NSimsun\">join</font></code>方法将他们组成一个长字符串，这样无论从代码可读性还是从性能上都更胜于字符串连接。<br /><code class=\"blockcode\"><font face=\"NSimsun\">var text = \'There are\' + elements.length + \'members in the elements array.\';<br />var text = [\'There are\', elements.length, \'members in the elements array.\'].join(\' \');</font></code></p><p><code class=\"blockcode\"><font face=\"新宋体\">来源：</font></code></p>\r\n            <p align=\"center\"> </p>', '', '', '');
INSERT INTO `youbang_addonarticle` VALUES (41, 4, '<p>, 亦称为 Mocha、LiveScript，也叫做JScript ECMAScript，是世界上流行的编程语言之一。事实上世界上差不多每台个人电脑都至少安装了一个JavaScript解释器。JavaScript的流行完全在于它作为WWW的脚本语言的角色。</p><p>不管它有多么流行，极少有人了解JavaScript是一个十分动态的通用面向对象编程语言。这怎能成为一个秘密呢？为什么这个语言如此被误解？</p><h2>关于名字</h2><p>这个<em>Java-</em>前缀暗示了JavaScript和Java的关系，也就是JavaScipt是Java的一个子集也就是不如Java强大。看上去这个名称就故意制造混乱，然后随之而来的是误解。JavaScript并不是解释型的Java语言。Java是解释型的Java，JavaScript是另一种语言。</p><p>JavaScript和Java的语法很相似，就象Java和C的语法相似一样。但它也不是Java的子集就像Java也不是C的子集一样。在应用上，Java要远比原先设想的好得多（Java原称Oak）。</p><p>JavaScript并不是由Sun公司──Java的老家──开发的。JavaScript是由Netscape公司开发。它本来叫做LiveScript，这个名字并不是那样容易混淆。 </p><p>这个<em>-Script</em> 后缀暗示了它不是一个真正的编程语言──脚本语言好象不是真正的编程语言。但其实这是一个专长的问题。相对C而言，JavaScript牺牲性能但带来更强的表达力和动态性。</p><h2>披着C外衣的Lisp</h2><p>JavaScript的C风格的语法，包括大括号和复杂的for 语句，让它看起来好象是一个普通的过程式语言。这是一个误导因为JavaScript和函数式语言如Lisp和Scheme有更多的共同之处。它用数组代替了列表，用对象代替了属性列表。函数是第一型的。而且有闭包。你不需要平衡那些括号就可以用lambda算子。</p><h2>思维定势</h2><p>JavaScript是原被设计在Netscape Navigator 中运行的。它的成功让它成为几乎所有浏览器的标准配置。这导致了思维定势。JavaScript简直就是程序语言中的 （一位曾扮演超人的演员，但后来死于枪杀，被官方认为自杀，细节不详──译注）。其实，JavaScript也适合很多和Web无关的应用程序。</p><h2>不断改变的目标</h2><p>JavaScript的第一个版本功能十分弱。它缺少异常处理、内部函数和继承。而它的现在的形态，它已经是一套完整的面向对象语言。但很多看法都是基于认为它的形式不成熟。</p><p>管理这个语言的ECMA委员正在开发扩展 ，原意是很好，而这样却会加剧这个语言最严重的问题：版本太多了。这也造成了混淆。</p><h2>设计错误</h2><p>没有什么编程语言是完美的，JavaScript也有它的设计上的错误，如的重载同时表示加和带类型转换的串连接，和有错误倾向的 with 语句应该避免使用。保留字策略过于严格。分号的加入是一个很大的错误，正则表达式的记号也是。这些错误会导致编程错误，并把语言的设计作为整个叫做问题。幸运的是，这些问题可以用一个很好</p><p>这个语言的设计从整体上看还是十分健全的。但很令人惊讶的是， ECMAScript委员会好象根本不想修正这些错误。也许他们对重新制作一个更感兴趣。</p><h2>肮脏的实现</h2><p>JavaScript早期实现错误百出。这对该语言带来了很恶劣的影响。更糟糕的是，这些实现还被嵌入的更错误百出的浏览器中。</p><h2>拙劣的书籍</h2><p>几乎所有的书籍都十分恐怖。里面到处是错误、蹩脚的例子还自创一套拙劣的惯例。语言中重要的特性却常常解释不好，或者干脆完全不写。我翻阅了几十本JavaScript的书，我只推荐两本： by David Flanagan and  by Danny Goodman. 都来自于 .</p><h2>不够标准的标准</h2><p>该语言的官方标准规格说明书由ECMA发布。该规格书也是质量奇差。它难以阅读也难以理解。它也对拙劣书籍的问题作出了自己的一份“贡献”，因为作者无法使用这个标准文档来增加他们对语言的认识。ECMA和TC39委员会应该为此感到深深的羞愧。</p><h2>业余爱好者</h2><p>大部分写JavaScript的人都不是程序员。他们缺乏训练写好程序的修养。JavaScript有如此丰富的表达能力，他们可以任意用它来写代码，以任何形式。这给JavaScript带来了一个名声──它是专门为外行设计的，不适合专业的程序员。这显然不是事实。</p><h2>面向对象</h2><p>JavaScript是不是面向对象的？它拥有对象，可以包含数据和处理数据的方法。对象可以包含其它对象。它没有类，但它却有构造器可以做类能做的事，包括扮演类变量和方法的容器的角色。它没有基于类的继承，但它有基于原型的继承。</p><p>两个建立对象系统的方法是通过继承（是一个……）和通过聚合（有一个……）。JavaScript两个都有，但它的动态性质让它可以在聚合上超越。</p><p>一些批评说JavaScript不是真正面向对象的因为它不能提供信息的隐藏。也就是，对象不能有私有变量和私有方法：所有的成员都是公共的。S</p><p>。当然，极少有人认识到，因为JavaScript是世界是最受误解的程序嘛！</p><p>另外还有批评说JavaScript不能提供继承，。</p><p align=\"left\">原文地址： </p><p align=\"left\">翻译：&nbsp;&nbsp;&nbsp; </p>\r\n            <p align=\"center\"> </p>', '', '', '');
INSERT INTO `youbang_addonarticle` VALUES (42, 4, '<p>已经读了《JavaScript DOM 编程艺术》的前几章基础部分，现在凭着记忆，将JavaScript的基础知识总结一下。</p><p><strong>一、声明变量</strong></p><p>JavaScript中，对变量的要求非常宽松，属于弱类型语言。尽管可以不申请变量而直接使用，但是为了程序的可读性和安全性，还是尽量把要使用的变量声明一下。格式如下：</p><p><em>var 变量一,变量二,…,变量N;</em></p><p>也可以直接在申请变量的同时进行赋值：</p><p><em>var 变量 = 变量值;</em></p><p>如果是数组变量，可以这样声明：</p><p><em>var 数组名 = Array(数组元素个数);</em></p><p><strong>二、条件语句</strong></p><p>JavaScript条件语句的格式如下：</p><p><em>if (返回值为布尔型的条件语句) {<br />如果条件成立执行的语句;<br />} else {<br />如果条件不成立执行的语句;<br />}</em></p><p>如果只要执行单个语句，也可以省略成如下形式：</p><p><em>if (条件判断) 条件成立后执行的语句;</em></p><p><strong>三、循环语句</strong></p><p>循环语句有三种，第一种是先判断后执行的while语句：</p><p><em>while (循环条件) {<br />循环的语句;<br />}</em></p><p>第二种，先执行后判断的while语句：</p><p><em>do {<br />循环的语句;<br />} while(循环条件);</em></p><p>第三种，for语句：</p><p><em>for (初始赋值;循环条件;条件变化) {<br />循环的语句;<br />}</em></p><p><strong>四、函数</strong></p><p>JavaScript中的函数用起来也很简单，与C语言和Java中的函数没多大差别。函数的定义：</p><p><em>function 函数名(形式参数一;形式参数二) {<br />函数里的语句;<br />return 函数返回值;<br />}</em></p><p><strong>五、对象</strong></p><p>JavaScript中，对象可以通过属性和方法两种方式访问：</p><p><em>对象.属性<br />对象.方法()</em></p><p>重点：</p><blockquote><p>属性是隶属于某个特定对象的变量；<br />方法是只有某个特定对象才能调用的函数。</p></blockquote><p>可以根据一个对象创建一个新的实例，这个实例可以使用对象所拥有的属性和方法：</p><p><em>var 实例名 = new 对象名;</em></p><p><strong>六、注释</strong></p><p>在程序设计中，注释始终是非常重要的。</p><p>JavaScript中，使用“//注释内容”来做单行注释；使用“/*注释内容*/”来进行多行注释。类似于HTML的那种注释方式，不推荐使用。</p><p>OK，将JavaScript的基本语法就回忆到这儿，关于DOM的知识我下次结合实例再谈。</p><p>来源：</p>\r\n            <p align=\"center\"> </p>', '', '', '');
INSERT INTO `youbang_addonarticle` VALUES (43, 4, '<p>来自, 以下是JavaScript容易犯错的九个陷阱。虽然不是什么很高深的技术问题，但注意一下，会使您的编程轻松些，即所谓make life easier. 笔者对某些陷阱会混杂一些评点。</p><ol><li><h2>最后一个逗号</h2><p>如这段代码，注意最后一个逗号，按语言学角度来说应该是不错的（python的类似数据类型辞典dictionary就允许如此）。IE会报语法错误，但语焉不详，你只能用人眼从几千行代码中扫描。</p><pre><code><script>\r\n  var theObj = {\r\n        city : \"Boston\",\r\n        state : \"MA\",\r\n  }\r\n</script> </code></pre></li><li><h2><span><font face=\"NSimsun\">this</font></span>的引用会改变</h2><p>如这段代码：</p><pre><code><input type=\"button\" value=\"Gotcha!\" id=\"MyButton\" >\r\n<script>\r\nvar MyObject = function () {\r\n    this.alertMessage = \"Javascript rules\";\r\n    this.ClickHandler = function() {\r\n        <strong style=\"COLOR: red\">alert(this.alertMessage );</strong>\r\n  }\r\n}();\r\ndocument.getElementById(”theText”).onclick =  MyObject.ClickHandler\r\n</script></code></pre><p>并不如你所愿，答案并不是”JavaScript rules”。在执行<span><font face=\"NSimsun\">MyObject.ClickHandler</font></span>时，代码中红色这行，<span><font face=\"NSimsun\">this</font></span>的引用实际上指向的是<span><font face=\"NSimsun\">document.getElementById(\"theText\")</font></span>的引用。可以这么解决：</p><pre><code><input type=\"button\" value=\"Gotcha!\" id=\"theText\" >\r\n<script>\r\nvar MyObject = function () {\r\n    <strong style=\"COLOR: red\">var self = this;</strong></span />\r\n    this.alertMessage = “Javascript rules”;\r\n    this.OnClick = function() {\r\n        alert(self.value);\r\n    }\r\n}();\r\ndocument.getElementById(”theText”).onclick =  MyObject.OnClick\r\n</script></code></pre><p>实质上，这就是。如果你看过，你会发现解决方案不止一种。</p></li><li><h2>标识盗贼</h2><p>在JavaScript中不要使用跟HTML的id一样的变量名。如下代码：</p><pre><code><input type=\"button\" id=\"TheButton\">\r\n<script>\r\n    TheButton = get(\"TheButton\");\r\n</script></code></pre><p>IE会报对象未定义的错误。我只能说：IE sucks.</p></li><li><h2>字符串只替换第一个匹配</h2><p>如下代码：</p><pre><code><script>\r\n    var fileName = \"This is a title\".replace(\" \",\"_\");\r\n</script></code></pre><p>而实际上，结果是”<span><font face=\"NSimsun\">This_is a title</font></span>“. 在JavaScript中，<span><font face=\"NSimsun\">String.replace</font></span>的第一个参数应该是正则表达式。所以，正确的做法是这样：</p><pre><code>var fileName = \"This is a title\".replace(/ /g,\"_\");</code></pre></li><li><h2>mouseout意味着mousein</h2><p>事实上，这是由于事件冒泡导致的。IE中有<span><font face=\"NSimsun\">mouseenter</font></span>和<span><font face=\"NSimsun\">mouseleave</font></span>，但不是标准的。作者在此建议大家使用库比如YUI来解决问题。</p></li><li><h2><span><font face=\"NSimsun\">parseInt</font></span>是基于进制体系的</h2><p>这个是常识，可是很多人给忽略了<span><font face=\"NSimsun\">parseInt</font></span>还有第二个参数，用以指明进制。比如，<span><font face=\"NSimsun\">parseInt(\"09\")</font></span>，如果你认为答案是9，那就错了。因为，在此，字符串以0开头，<span><font face=\"NSimsun\">parseInt</font></span>以八进制来处理它，在八进制中，<span><font face=\"NSimsun\">09</font></span>是非法，返回<span><font face=\"NSimsun\">false</font></span>，布尔值<span><font face=\"NSimsun\">false</font></span>转化成数值就是0. 因此，正确的做法是<span><font face=\"NSimsun\">parseInt(\"09\", 10)</font></span>. </p></li><li><h2><span><font face=\"NSimsun\">for...in...</font></span>会遍历所有的东西</h2><p>有一段这样的代码：</p><pre><code>var arr = [5,10,15]\r\nvar total = 1;\r\nfor ( var x in arr) {\r\n    total = total * arr[x];\r\n}</code></pre><p>运行得好好的，不是吗？但是有一天它不干了，给我返回的值变成了<span><font face=\"NSimsun\">NaN</font></span>, 晕。我只不过引入了一个库而已啊。原来是这个库改写了<span><font face=\"NSimsun\">Array</font></span>的<span><font face=\"NSimsun\">prototype</font></span>，这样，我们的<span><font face=\"NSimsun\">arr</font></span>平白无过多出了一个属性（方法），而<span><font face=\"NSimsun\">for...in...</font></span>会把它给遍历出来。所以这样做才是比较安全的：</p><pre><code>for ( var x = 0; x < arr.length; x++) {\r\n    total = total * arr[x];\r\n}</code></pre><p>其实，这也是污染基本类的<span><font face=\"NSimsun\">prototype</font></span>会带来危害的一个例证。</p></li><li><h2>事件处理器的陷阱</h2><p>这其实只会存在使用作为对象属性的事件处理器才会存在的问题。比如<font face=\"NSimsun\"><span>window.onclick = MyOnClickMethod</span><span>这样的代码，这会复写掉之前的</span><span>window.onclick</span></font>事件，还可能导致IE的内容泄露（sucks again）。在IE还没有支持DOM 2的事件注册之前，作者建议使用库来解决问题，比如使用YUI:</p><pre><code>YAHOO.util.Event.addListener(window, \"click\", MyOnClickMethod);</code></pre><p>这应该也属于常识问题，但新手可能容易犯错。</p></li><li><h2>Focus Pocus</h2><p>新建一个<span><font face=\"NSimsun\">input</font></span>文本元素，然后把焦点挪到它上面，按理说，这样的代码应该很自然：</p><pre><code>var newInput = document.createElement(\"input\");\r\ndocument.body.appendChild(newInput);\r\nnewInput.focus();\r\nnewInput.select();</code></pre><p>但是IE会报错（sucks again and again）。理由可能是当你执行<span><font face=\"NSimsun\">fouce()</font></span>的时候，元素尚未可用。因此，我们可以延迟执行：</p><pre><code>var newInput = document.createElement(\"input\");\r\nnewInput.id = \"TheNewInput\";\r\ndocument.body.appendChild(newInput);\r\nsetTimeout(function(){ //这里我使用闭包改写过，若有兴趣可以对比原文\r\n	document.getElementById(\'TheNewInput\').focus();\r\n	document.getElementById(\'TheNewInput\').select();}, 10);</code></pre></li></ol><p>在实践中，JavaScript的陷阱还有很多很多，大多是由于解析器的实现不到位而引起。这些东西一般都不会在教科书中出现，只能靠开发者之间的经验分享。谢天谢地，我们生活在网络时代，很多碰到的问题，一般都可以在Google中找到答案。 </p><p>来源:</p>\r\n            <p align=\"center\"> </p>', '', '', '');
INSERT INTO `youbang_addonarticle` VALUES (44, 4, '&nbsp;&nbsp;&nbsp;&nbsp; <strong>JavaScript技术</strong>可以实现交互式页面，在建立动态页面方面有着其他工具不可比拟的优点。Javascript 在网页<font face=\"Verdana\">设计中,大部分都是用来实现功能,特效的..&nbsp;本文列举了一些中常用的JavaScript技术：<br /><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </font><font face=\"Verdana\"><strong>事件源对象&nbsp;<br /></strong><br /></font><table style=\"BORDER-RIGHT: #cccccc 1px dotted; TABLE-LAYOUT: fixed; BORDER-TOP: #cccccc 1px dotted; BORDER-LEFT: #cccccc 1px dotted; BORDER-BOTTOM: #cccccc 1px dotted\" cellspacing=\"0\" cellpadding=\"6\" width=\"95%\" align=\"center\" border=\"0\"><tbody><tr><td style=\"WORD-WRAP: break-word\" bgcolor=\"#f3f3f3\"><font style=\"FONT-WEIGHT: bold; COLOR: #990000\">以下是引用片段：</font><br />event.srcElement.tagName&nbsp; <br />event.srcElement.type&nbsp;</td></tr></tbody></table><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>捕获释放&nbsp;<br /></strong><br /><table style=\"BORDER-RIGHT: #cccccc 1px dotted; TABLE-LAYOUT: fixed; BORDER-TOP: #cccccc 1px dotted; BORDER-LEFT: #cccccc 1px dotted; BORDER-BOTTOM: #cccccc 1px dotted\" cellspacing=\"0\" cellpadding=\"6\" width=\"95%\" align=\"center\" border=\"0\"><tbody><tr><td style=\"WORD-WRAP: break-word\" bgcolor=\"#f3f3f3\"><font style=\"FONT-WEIGHT: bold; COLOR: #990000\">以下是引用片段：</font><br />event.srcElement.setCapture();&nbsp; <br />event.srcElement.releaseCapture();&nbsp;</td></tr></tbody></table><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong> 事件按键</strong> <br /><br /><table style=\"BORDER-RIGHT: #cccccc 1px dotted; TABLE-LAYOUT: fixed; BORDER-TOP: #cccccc 1px dotted; BORDER-LEFT: #cccccc 1px dotted; BORDER-BOTTOM: #cccccc 1px dotted\" cellspacing=\"0\" cellpadding=\"6\" width=\"95%\" align=\"center\" border=\"0\"><tbody><tr><td style=\"WORD-WRAP: break-word\" bgcolor=\"#f3f3f3\"><font style=\"FONT-WEIGHT: bold; COLOR: #990000\">以下是引用片段：</font><br />event.keyCode&nbsp; <br />event.shiftKey&nbsp; <br />event.altKey&nbsp; <br />event.ctrlKey&nbsp;</td></tr></tbody></table><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>事件返回值</strong> <br /><br /><table style=\"BORDER-RIGHT: #cccccc 1px dotted; TABLE-LAYOUT: fixed; BORDER-TOP: #cccccc 1px dotted; BORDER-LEFT: #cccccc 1px dotted; BORDER-BOTTOM: #cccccc 1px dotted\" cellspacing=\"0\" cellpadding=\"6\" width=\"95%\" align=\"center\" border=\"0\"><tbody><tr><td style=\"WORD-WRAP: break-word\" bgcolor=\"#f3f3f3\"><font style=\"FONT-WEIGHT: bold; COLOR: #990000\">以下是引用片段：</font><br />event.returnValue&nbsp;</td></tr></tbody></table><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>位置</strong> <br /><br /><table style=\"BORDER-RIGHT: #cccccc 1px dotted; TABLE-LAYOUT: fixed; BORDER-TOP: #cccccc 1px dotted; BORDER-LEFT: #cccccc 1px dotted; BORDER-BOTTOM: #cccccc 1px dotted\" cellspacing=\"0\" cellpadding=\"6\" width=\"95%\" align=\"center\" border=\"0\"><tbody><tr><td style=\"WORD-WRAP: break-word\" bgcolor=\"#f3f3f3\"><font style=\"FONT-WEIGHT: bold; COLOR: #990000\">以下是引用片段：</font><br />event.x&nbsp; <br />event.y&nbsp;</td></tr></tbody></table><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>窗体活动元素 <br /></strong><br /><table style=\"BORDER-RIGHT: #cccccc 1px dotted; TABLE-LAYOUT: fixed; BORDER-TOP: #cccccc 1px dotted; BORDER-LEFT: #cccccc 1px dotted; BORDER-BOTTOM: #cccccc 1px dotted\" cellspacing=\"0\" cellpadding=\"6\" width=\"95%\" align=\"center\" border=\"0\"><tbody><tr><td style=\"WORD-WRAP: break-word\" bgcolor=\"#f3f3f3\"><font style=\"FONT-WEIGHT: bold; COLOR: #990000\">以下是引用片段：</font><br />document.activeElement&nbsp;</td></tr></tbody></table><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>绑定事件</strong> <br /><br /><table style=\"BORDER-RIGHT: #cccccc 1px dotted; TABLE-LAYOUT: fixed; BORDER-TOP: #cccccc 1px dotted; BORDER-LEFT: #cccccc 1px dotted; BORDER-BOTTOM: #cccccc 1px dotted\" cellspacing=\"0\" cellpadding=\"6\" width=\"95%\" align=\"center\" border=\"0\"><tbody><tr><td style=\"WORD-WRAP: break-word\" bgcolor=\"#f3f3f3\"><font style=\"FONT-WEIGHT: bold; COLOR: #990000\">以下是引用片段：</font><br />document.captureEvents(Event.KEYDOWN);&nbsp;</td></tr></tbody></table><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>访问窗体元素</strong> <br /><br /><table style=\"BORDER-RIGHT: #cccccc 1px dotted; TABLE-LAYOUT: fixed; BORDER-TOP: #cccccc 1px dotted; BORDER-LEFT: #cccccc 1px dotted; BORDER-BOTTOM: #cccccc 1px dotted\" cellspacing=\"0\" cellpadding=\"6\" width=\"95%\" align=\"center\" border=\"0\"><tbody><tr><td style=\"WORD-WRAP: break-word\" bgcolor=\"#f3f3f3\"><font style=\"FONT-WEIGHT: bold; COLOR: #990000\">以下是引用片段：</font><br />document.all(\"txt\").focus();&nbsp; <br />document.all(\"txt\").select();&nbsp;</td></tr></tbody></table><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>窗体命令</strong> <br /><br /><table style=\"BORDER-RIGHT: #cccccc 1px dotted; TABLE-LAYOUT: fixed; BORDER-TOP: #cccccc 1px dotted; BORDER-LEFT: #cccccc 1px dotted; BORDER-BOTTOM: #cccccc 1px dotted\" cellspacing=\"0\" cellpadding=\"6\" width=\"95%\" align=\"center\" border=\"0\"><tbody><tr><td style=\"WORD-WRAP: break-word\" bgcolor=\"#f3f3f3\"><font style=\"FONT-WEIGHT: bold; COLOR: #990000\">以下是引用片段：</font><br />document.execCommand&nbsp;</td></tr></tbody></table><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 窗体COOKIE <br /><br /><table style=\"BORDER-RIGHT: #cccccc 1px dotted; TABLE-LAYOUT: fixed; BORDER-TOP: #cccccc 1px dotted; BORDER-LEFT: #cccccc 1px dotted; BORDER-BOTTOM: #cccccc 1px dotted\" cellspacing=\"0\" cellpadding=\"6\" width=\"95%\" align=\"center\" border=\"0\"><tbody><tr><td style=\"WORD-WRAP: break-word\" bgcolor=\"#f3f3f3\"><font style=\"FONT-WEIGHT: bold; COLOR: #990000\">以下是引用片段：</font><br />document.cookie&nbsp;</td></tr></tbody></table><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 菜单事件 <br /><br /><table style=\"BORDER-RIGHT: #cccccc 1px dotted; TABLE-LAYOUT: fixed; BORDER-TOP: #cccccc 1px dotted; BORDER-LEFT: #cccccc 1px dotted; BORDER-BOTTOM: #cccccc 1px dotted\" cellspacing=\"0\" cellpadding=\"6\" width=\"95%\" align=\"center\" border=\"0\"><tbody><tr><td style=\"WORD-WRAP: break-word\" bgcolor=\"#f3f3f3\"><font style=\"FONT-WEIGHT: bold; COLOR: #990000\">以下是引用片段：</font><br />document.oncontextmenu&nbsp;</td></tr></tbody></table><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 创建元素 <br /><br /><table style=\"BORDER-RIGHT: #cccccc 1px dotted; TABLE-LAYOUT: fixed; BORDER-TOP: #cccccc 1px dotted; BORDER-LEFT: #cccccc 1px dotted; BORDER-BOTTOM: #cccccc 1px dotted\" cellspacing=\"0\" cellpadding=\"6\" width=\"95%\" align=\"center\" border=\"0\"><tbody><tr><td style=\"WORD-WRAP: break-word\" bgcolor=\"#f3f3f3\"><font style=\"FONT-WEIGHT: bold; COLOR: #990000\">以下是引用片段：</font><br />document.createElement(\"SPAN\");&nbsp;</td></tr></tbody></table><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 根据鼠标获得元素： <br /><br /><table style=\"BORDER-RIGHT: #cccccc 1px dotted; TABLE-LAYOUT: fixed; BORDER-TOP: #cccccc 1px dotted; BORDER-LEFT: #cccccc 1px dotted; BORDER-BOTTOM: #cccccc 1px dotted\" cellspacing=\"0\" cellpadding=\"6\" width=\"95%\" align=\"center\" border=\"0\"><tbody><tr><td style=\"WORD-WRAP: break-word\" bgcolor=\"#f3f3f3\"><font style=\"FONT-WEIGHT: bold; COLOR: #990000\">以下是引用片段：</font><br />document.elementFromPoint(event.x,event.y).tagName==\"TD&nbsp; <br />document.elementFromPoint(event.x,event.y).appendChild(ms)&nbsp;</td></tr></tbody></table><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 窗体&nbsp;<br /><br /><table style=\"BORDER-RIGHT: #cccccc 1px dotted; TABLE-LAYOUT: fixed; BORDER-TOP: #cccccc 1px dotted; BORDER-LEFT: #cccccc 1px dotted; BORDER-BOTTOM: #cccccc 1px dotted\" cellspacing=\"0\" cellpadding=\"6\" width=\"95%\" align=\"center\" border=\"0\"><tbody><tr><td style=\"WORD-WRAP: break-word\" bgcolor=\"#f3f3f3\"><font style=\"FONT-WEIGHT: bold; COLOR: #990000\">以下是引用片段：</font><br />document.images[索引]</td></tr></tbody></table>&nbsp;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 窗体事件绑定 <br /><br /><table style=\"BORDER-RIGHT: #cccccc 1px dotted; TABLE-LAYOUT: fixed; BORDER-TOP: #cccccc 1px dotted; BORDER-LEFT: #cccccc 1px dotted; BORDER-BOTTOM: #cccccc 1px dotted\" cellspacing=\"0\" cellpadding=\"6\" width=\"95%\" align=\"center\" border=\"0\"><tbody><tr><td style=\"WORD-WRAP: break-word\" bgcolor=\"#f3f3f3\"><font style=\"FONT-WEIGHT: bold; COLOR: #990000\">以下是引用片段：</font><br />document.onmousedown=scrollwindow;&nbsp;</td></tr></tbody></table><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 元素 <br /><table style=\"BORDER-RIGHT: #cccccc 1px dotted; TABLE-LAYOUT: fixed; BORDER-TOP: #cccccc 1px dotted; BORDER-LEFT: #cccccc 1px dotted; BORDER-BOTTOM: #cccccc 1px dotted\" cellspacing=\"0\" cellpadding=\"6\" width=\"95%\" align=\"center\" border=\"0\"><tbody><tr><td style=\"WORD-WRAP: break-word\" bgcolor=\"#f3f3f3\"><font style=\"FONT-WEIGHT: bold; COLOR: #990000\">以下是引用片段：</font><br />document.窗体.elements[索引]&nbsp;</td></tr></tbody></table><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 对象绑定事件 <br /><br /><table style=\"BORDER-RIGHT: #cccccc 1px dotted; TABLE-LAYOUT: fixed; BORDER-TOP: #cccccc 1px dotted; BORDER-LEFT: #cccccc 1px dotted; BORDER-BOTTOM: #cccccc 1px dotted\" cellspacing=\"0\" cellpadding=\"6\" width=\"95%\" align=\"center\" border=\"0\"><tbody><tr><td style=\"WORD-WRAP: break-word\" bgcolor=\"#f3f3f3\"><font style=\"FONT-WEIGHT: bold; COLOR: #990000\">以下是引用片段：</font><br />document.all.xxx.detachEvent(\'onclick\',a);&nbsp;</td></tr></tbody></table><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 插件数目 <br /><br /><table style=\"BORDER-RIGHT: #cccccc 1px dotted; TABLE-LAYOUT: fixed; BORDER-TOP: #cccccc 1px dotted; BORDER-LEFT: #cccccc 1px dotted; BORDER-BOTTOM: #cccccc 1px dotted\" cellspacing=\"0\" cellpadding=\"6\" width=\"95%\" align=\"center\" border=\"0\"><tbody><tr><td style=\"WORD-WRAP: break-word\" bgcolor=\"#f3f3f3\"><font style=\"FONT-WEIGHT: bold; COLOR: #990000\">以下是引用片段：</font><br />navigator.plugins&nbsp;</td></tr></tbody></table><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 取变量类型&nbsp;<br /><br /><table style=\"BORDER-RIGHT: #cccccc 1px dotted; TABLE-LAYOUT: fixed; BORDER-TOP: #cccccc 1px dotted; BORDER-LEFT: #cccccc 1px dotted; BORDER-BOTTOM: #cccccc 1px dotted\" cellspacing=\"0\" cellpadding=\"6\" width=\"95%\" align=\"center\" border=\"0\"><tbody><tr><td style=\"WORD-WRAP: break-word\" bgcolor=\"#f3f3f3\"><font style=\"FONT-WEIGHT: bold; COLOR: #990000\">以下是引用片段：</font><br />typeof(js_libpath)&nbsp;==&nbsp;\"undefined\"</td></tr></tbody></table>&nbsp;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 下拉框 <br /><br /><table style=\"BORDER-RIGHT: #cccccc 1px dotted; TABLE-LAYOUT: fixed; BORDER-TOP: #cccccc 1px dotted; BORDER-LEFT: #cccccc 1px dotted; BORDER-BOTTOM: #cccccc 1px dotted\" cellspacing=\"0\" cellpadding=\"6\" width=\"95%\" align=\"center\" border=\"0\"><tbody><tr><td style=\"WORD-WRAP: break-word\" bgcolor=\"#f3f3f3\"><font style=\"FONT-WEIGHT: bold; COLOR: #990000\">以下是引用片段：</font><br />下拉框.options[索引]&nbsp; <br />下拉框.options.length&nbsp;</td></tr></tbody></table><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 查找对象&nbsp;<br /><br /><table style=\"BORDER-RIGHT: #cccccc 1px dotted; TABLE-LAYOUT: fixed; BORDER-TOP: #cccccc 1px dotted; BORDER-LEFT: #cccccc 1px dotted; BORDER-BOTTOM: #cccccc 1px dotted\" cellspacing=\"0\" cellpadding=\"6\" width=\"95%\" align=\"center\" border=\"0\"><tbody><tr><td style=\"WORD-WRAP: break-word\" bgcolor=\"#f3f3f3\"><font style=\"FONT-WEIGHT: bold; COLOR: #990000\">以下是引用片段：</font><br />document.getElementsByName(\"r1\");&nbsp; <br />document.getElementById(id);</td></tr></tbody></table>&nbsp;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 定时&nbsp;<br /><br /><table style=\"BORDER-RIGHT: #cccccc 1px dotted; TABLE-LAYOUT: fixed; BORDER-TOP: #cccccc 1px dotted; BORDER-LEFT: #cccccc 1px dotted; BORDER-BOTTOM: #cccccc 1px dotted\" cellspacing=\"0\" cellpadding=\"6\" width=\"95%\" align=\"center\" border=\"0\"><tbody><tr><td style=\"WORD-WRAP: break-word\" bgcolor=\"#f3f3f3\"><font style=\"FONT-WEIGHT: bold; COLOR: #990000\">以下是引用片段：</font><br />timer=setInterval(\'scrollwindow()\',delay);&nbsp; <br />clearInterval(timer);</td></tr></tbody></table>&nbsp;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;上一网页源 <br /><br /><table style=\"BORDER-RIGHT: #cccccc 1px dotted; TABLE-LAYOUT: fixed; BORDER-TOP: #cccccc 1px dotted; BORDER-LEFT: #cccccc 1px dotted; BORDER-BOTTOM: #cccccc 1px dotted\" cellspacing=\"0\" cellpadding=\"6\" width=\"95%\" align=\"center\" border=\"0\"><tbody><tr><td style=\"WORD-WRAP: break-word\" bgcolor=\"#f3f3f3\"><font style=\"FONT-WEIGHT: bold; COLOR: #990000\">以下是引用片段：</font><br />asp:&nbsp; <br />request.servervariables(\"HTTP_REFERER\")&nbsp; <br />javascript：&nbsp; <br />document.referrer&nbsp;</td></tr></tbody></table><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 释放 <br /><br /><table style=\"BORDER-RIGHT: #cccccc 1px dotted; TABLE-LAYOUT: fixed; BORDER-TOP: #cccccc 1px dotted; BORDER-LEFT: #cccccc 1px dotted; BORDER-BOTTOM: #cccccc 1px dotted\" cellspacing=\"0\" cellpadding=\"6\" width=\"95%\" align=\"center\" border=\"0\"><tbody><tr><td style=\"WORD-WRAP: break-word\" bgcolor=\"#f3f3f3\"><font style=\"FONT-WEIGHT: bold; COLOR: #990000\">以下是引用片段：</font><br />CollectGarbage();&nbsp;</td></tr></tbody></table><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 禁止右键 <br /><br /><table style=\"BORDER-RIGHT: #cccccc 1px dotted; TABLE-LAYOUT: fixed; BORDER-TOP: #cccccc 1px dotted; BORDER-LEFT: #cccccc 1px dotted; BORDER-BOTTOM: #cccccc 1px dotted\" cellspacing=\"0\" cellpadding=\"6\" width=\"95%\" align=\"center\" border=\"0\"><tbody><tr><td style=\"WORD-WRAP: break-word\" bgcolor=\"#f3f3f3\"><font style=\"FONT-WEIGHT: bold; COLOR: #990000\">以下是引用片段：</font><br />document.oncontextmenu&nbsp;=&nbsp;function()&nbsp;{&nbsp;return&nbsp;false;}&nbsp;</td></tr></tbody></table><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 禁止保存 <br /><br /><table style=\"BORDER-RIGHT: #cccccc 1px dotted; TABLE-LAYOUT: fixed; BORDER-TOP: #cccccc 1px dotted; BORDER-LEFT: #cccccc 1px dotted; BORDER-BOTTOM: #cccccc 1px dotted\" cellspacing=\"0\" cellpadding=\"6\" width=\"95%\" align=\"center\" border=\"0\"><tbody><tr><td style=\"WORD-WRAP: break-word\" bgcolor=\"#f3f3f3\"><font style=\"FONT-WEIGHT: bold; COLOR: #990000\">以下是引用片段：</font><br /><noscript><iframe&nbsp;src=\"*.htm\"></iframe></noscript>&nbsp;</td></tr></tbody></table><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 禁止选取<br /><br /><table style=\"BORDER-RIGHT: #cccccc 1px dotted; TABLE-LAYOUT: fixed; BORDER-TOP: #cccccc 1px dotted; BORDER-LEFT: #cccccc 1px dotted; BORDER-BOTTOM: #cccccc 1px dotted\" cellspacing=\"0\" cellpadding=\"6\" width=\"95%\" align=\"center\" border=\"0\"><tbody><tr><td style=\"WORD-WRAP: break-word\" bgcolor=\"#f3f3f3\"><font style=\"FONT-WEIGHT: bold; COLOR: #990000\">以下是引用片段：</font><br /><body&nbsp;oncontextmenu=\"return&nbsp;false\"&nbsp;ondragstart=\"return&nbsp;false\"&nbsp;onselectstart&nbsp;=\"return&nbsp;false\"&nbsp;onselect=\"document.selection.empty()\"&nbsp;oncopy=\"document.selection.empty()\"&nbsp;onbeforecopy=\"return&nbsp;false\"onmouseup=\"document.selection.empty()>&nbsp;</td></tr></tbody></table><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 禁止粘贴 <br /><br /><table style=\"BORDER-RIGHT: #cccccc 1px dotted; TABLE-LAYOUT: fixed; BORDER-TOP: #cccccc 1px dotted; BORDER-LEFT: #cccccc 1px dotted; BORDER-BOTTOM: #cccccc 1px dotted\" cellspacing=\"0\" cellpadding=\"6\" width=\"95%\" align=\"center\" border=\"0\"><tbody><tr><td style=\"WORD-WRAP: break-word\" bgcolor=\"#f3f3f3\"><font style=\"FONT-WEIGHT: bold; COLOR: #990000\">以下是引用片段：</font><br /><input&nbsp;type=text&nbsp;onpaste=\"return&nbsp;false\">&nbsp;</td></tr></tbody></table><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 地址栏图标 <br /><br /><table style=\"BORDER-RIGHT: #cccccc 1px dotted; TABLE-LAYOUT: fixed; BORDER-TOP: #cccccc 1px dotted; BORDER-LEFT: #cccccc 1px dotted; BORDER-BOTTOM: #cccccc 1px dotted\" cellspacing=\"0\" cellpadding=\"6\" width=\"95%\" align=\"center\" border=\"0\"><tbody><tr><td style=\"WORD-WRAP: break-word\" bgcolor=\"#f3f3f3\"><font style=\"FONT-WEIGHT: bold; COLOR: #990000\">以下是引用片段：</font><br /><link&nbsp;rel=\"Shortcut&nbsp;Icon\"&nbsp;href=\"favicon.ico\">&nbsp; <br />favicon.ico&nbsp;名字最好不变16*16的16色,放虚拟目录根目录下&nbsp;</td></tr></tbody></table><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 收藏栏图标 <br /><br /><table style=\"BORDER-RIGHT: #cccccc 1px dotted; TABLE-LAYOUT: fixed; BORDER-TOP: #cccccc 1px dotted; BORDER-LEFT: #cccccc 1px dotted; BORDER-BOTTOM: #cccccc 1px dotted\" cellspacing=\"0\" cellpadding=\"6\" width=\"95%\" align=\"center\" border=\"0\"><tbody><tr><td style=\"WORD-WRAP: break-word\" bgcolor=\"#f3f3f3\"><font style=\"FONT-WEIGHT: bold; COLOR: #990000\">以下是引用片段：</font><br /><link&nbsp;rel=\"Bookmark\"&nbsp;href=\"favicon.ico\">&nbsp;</td></tr></tbody></table><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 查看<br />&nbsp;<br /><table style=\"BORDER-RIGHT: #cccccc 1px dotted; TABLE-LAYOUT: fixed; BORDER-TOP: #cccccc 1px dotted; BORDER-LEFT: #cccccc 1px dotted; BORDER-BOTTOM: #cccccc 1px dotted\" cellspacing=\"0\" cellpadding=\"6\" width=\"95%\" align=\"center\" border=\"0\"><tbody><tr><td style=\"WORD-WRAP: break-word\" bgcolor=\"#f3f3f3\"><font style=\"FONT-WEIGHT: bold; COLOR: #990000\">以下是引用片段：</font><br /><input&nbsp;type=button&nbsp;value=查看网页源代码&nbsp;onclick=\"window.location&nbsp;=&nbsp;\'view-source:\'&nbsp;\'http://www.aaa.com/\'\">&nbsp;</td></tr></tbody></table><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 关闭输入法 <br /><br /><table style=\"BORDER-RIGHT: #cccccc 1px dotted; TABLE-LAYOUT: fixed; BORDER-TOP: #cccccc 1px dotted; BORDER-LEFT: #cccccc 1px dotted; BORDER-BOTTOM: #cccccc 1px dotted\" cellspacing=\"0\" cellpadding=\"6\" width=\"95%\" align=\"center\" border=\"0\"><tbody><tr><td style=\"WORD-WRAP: break-word\" bgcolor=\"#f3f3f3\"><font style=\"FONT-WEIGHT: bold; COLOR: #990000\">以下是引用片段：</font><br /><input&nbsp;style=\"ime-mode:disabled\">&nbsp;</td></tr></tbody></table><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 自动全选 <br /><br /><table style=\"BORDER-RIGHT: #cccccc 1px dotted; TABLE-LAYOUT: fixed; BORDER-TOP: #cccccc 1px dotted; BORDER-LEFT: #cccccc 1px dotted; BORDER-BOTTOM: #cccccc 1px dotted\" cellspacing=\"0\" cellpadding=\"6\" width=\"95%\" align=\"center\" border=\"0\"><tbody><tr><td style=\"WORD-WRAP: break-word\" bgcolor=\"#f3f3f3\"><font style=\"FONT-WEIGHT: bold; COLOR: #990000\">以下是引用片段：</font><br /><input&nbsp;type=text&nbsp;name=text1&nbsp;value=\"123\"&nbsp;onfocus=\"this.select()\">&nbsp;</td></tr></tbody></table>\r\n            <p align=\"center\"> </p>', '', '', '');
INSERT INTO `youbang_addonarticle` VALUES (45, 4, '<p>首先，与其他语言不同，JS的效率很大程度是取决于JS&nbsp;engine的效率。除了引擎实现的优劣外，引擎自己也会为一些特殊的代码模式采取一些优化的策略。例如FF、Opera和Safari的JS引擎，都对字符串的拼接运算（+）做了特别优化。显然，要获得最大效率，就必须要了解引擎的脾气，尽量迎合引擎的口味。所以对于不同的引擎，所作的优化极有可能是背道而驰的。<br /><br />而如果做跨浏览器的web编程，则最大的问题是在于IE6（JScript&nbsp;5.6）！因为在不打hotfix的情况下，JScript引擎的垃圾回收的bug，会导致其在真实应用中的performance跟其他浏览器根本不在一个数量级上。因此在这种场合做优化，实际上就是为JScript做优化！<br /><br />所以第一原则就是只需要为IE6（未打补丁的JScript&nbsp;5.6或更早版本）做优化！<br /><br />如果你的程序已经优化到在IE6下可以接受的性能，那基本上在其他浏览器上性能就完全没有问题。<br /><br />因此，注意我下面讲的许多问题在其他引擎上可能完全不同，例如在循环中进行字符串拼接，通常认为需要用Array.join的方式，但是由于&nbsp;SpiderMonkey等引擎对字符串的“+”运算做了优化，结果使用Array.join的效率反而不如直接用“+”！但是如果考虑IE6，则其他浏览器上的这种效率的差别根本不值一提。<br /><br />JS优化与其他语言的优化也仍然有相同之处。比如说，不要一上来就急吼吼的做优化，那样毫无意义。优化的关键，仍然是要把精力放在最关键的地方，也就是瓶颈上。一般来说，瓶颈总是出现在大规模循环的地方。这倒不是说循环本身有性能问题，而是循环会迅速放大可能存在的性能问题。<br /><br />所以第二原则就是以大规模循环体为最主要优化对象。<br /><br />以下的优化原则，只在大规模循环中才有意义，在循环体之外做此类优化基本上是没有意义的。<br /><br />目前绝大多数JS引擎都是解释执行的，而解释执行的情况下，在所有操作中，函数调用的效率是较低的。此外，过深的prototype继承链或者多级引用也会降低效率。JScript中，10级引用的开销大体是一次空函数调用开销的1/2。这两者的开销都远远大于简单操作（如四则运算）。<br /><br />所以第三原则就是尽量避免过多的引用层级和不必要的多次方法调用。<br /><br />特别要注意的是，有些情况下看似是属性访问，实际上是方法调用。例如所有DOM的属性，实际上都是方法。在遍历一个NodeList的时候，循环条件对于nodes.length的访问，看似属性读取，实际上是等价于函数调用的。而且IE&nbsp;DOM的实现上，childNodes.length每次是要通过内部遍历重新计数的。（My&nbsp;god，但是这是真的！因为我测过，childNodes.length的访问时间与childNodes.length的值成正比！）这非常耗费。所以预先把nodes.length保存到js变量，当然可以提高遍历的性能。<br /><br />同样是函数调用，用户自定义函数的效率又远远低于语言内建函数，因为后者是对引擎本地方法的包装，而引擎通常是c,c++,java写的。进一步，同样的功能，语言内建构造的开销通常又比内建函数调用要效率高，因为前者在JS代码的parse阶段就可以确定和优化。<br /><br />所以第四原则就是尽量使用语言本身的构造和内建函数。<br /><br />这里有一个例子是高性能的String.format方法。String.format&nbsp;传统的实现方式是用String.replace(regex,&nbsp;func)，在pattern包含n个占位符（包括重复的）时，自定义函数func就被调用n次。而这个高性能实现中，每次format调用所作的只是一次Array.join然后一次String.replace(regex,&nbsp;string)的操作，两者都是引擎内建方法，而不会有任何自定义函数调用。两次内建方法调用和n次的自定义方法调用，这就是性能上的差别。<br /><br />同样是内建特性，性能上也还是有差别的。例如在JScript中对于arguments的访问性能就很差，几乎赶上一次函数调用了。因此如果一个可变参数的简单函数成为性能瓶颈的时候，可以将其内部做一些改变，不要访问arguments，而是通过对参数的显式判断来处理。</p><p>\r\n            <p align=\"center\"> </p>', '', '', '');
INSERT INTO `youbang_addonarticle` VALUES (46, 4, '　　Sun为什么会搞出一个JSF，JSF为什么会是现在这个样子，我想原因是这样的: 首先，基于组件的Web开发将来会是一个趋势。自包含的组件便于IDE的处理，可以提高开发效率。 <br /><br />　　就是说JSF优于Struts/WebWork这类MVC框架的优势，在于它可以与IDE结合来自动生成代码。 而传统的纯手工编写的MVC框架，影响了开发效率。 因为Java技术在客户端并没有明显的优势。Applet已经被抛弃掉，Java的强项在服务器端。Sun不可能跑去使用JavaScript，因为在传统开发者眼里，JS只配做一点很琐碎的任务。 <br /><br />　　于是在他们设计的这个架构中，所有的用户事件都放在了服务器端来处理, 这个决策造成了JSF致命的缺点。它把事件处理模型绑死在服务器上，限制了响应性更加灵敏的交互设计。随之而来的网络延迟会毁掉软件的可用性。 这也是Ajax在JSF的架构中无法充分发挥作用的原因。 <br /><br />　　JSF的设计思路有点模仿VB，组件化的开发这个方向是没错的，Ajax开发将来也会走这条路。但是JSF与VB最大的差别是VB的事件模型都是位于本地来处理的。这是一种本质上的差别，所以如果JSF确实想模仿VB，那也是东施效颦。 而且在JSF的设计阶段，同步的请求/响应是主流，他们的思路仍然牢牢束缚在基于页面的开发方式上。根本就没有思考过其他的可能。 <br /><br />　　异步请求/响应是Ajax与传统开发方式最大的差别，异步带来了更好的交互设计。 <br /><br />　　在Ajax in Action第1章中作者举了一个令人信服的例子。Google Maps中当用户滚动地图时，获取新的地图图片，由于是异步请求的，因此不会打断用户的操作流程。 而在传统的地图服务，每次滚动可能都需要刷新页面。 用一下微软的那个地图服务就可以感觉到明显的差距，它甚至根本就不允许用户滚动地图。 <br /><br />　　http://terraserver.microsoft.com/ <br /><br />　　以前我说Google Maps不是Ajax，因为没有使用XMLHttpRequest，这样说看来理解有些狭隘。 Google Maps请求地图的图片，采用的是修改动态创建的img元素的src属性的方式，这样的请求不会打断用户的操作，因此就是异步的。 我们在Ajax in Action中看到作者将Google Maps当作Ajax应用，而在Pragmatic Ajax中作者说Google Maps不是严格意义上的Ajax，两种说法都有道理。 <br /><br />　　JSF其实如果和Applet结合，可能更好些。Applet是多线程的，可以捕获用户的操作事件，采用异步方式发送到服务器。这样就不会打断用户的操作了。 但是这样一来设计的这个架构就复杂了。而且Applet是已经决定抛弃的东西。 JSF和Java Web Start结合也可以，不过JWS设计用来建造一类完全不同的Web应用，即Rich Client，而不是设计用来建造运行于浏览器之内的RIA应用。 所以JSF最多只是一种过渡方案，在Ajax/Flash的竞争下早已风光不在。 <br /><br />　　未来基于浏览器的RIA开发，Ajax、Flash是两种最有前途的技术。 <br /><br />　　按照泽欣的判断可能是三分天下，Ajax、Flash/Flex/Laszlo、还有M$的Atlas。 Atlas是M$开发的类似于Flash的一种技术，目前还只是一个vaporware，没有看到其庐山真面目。 Java Web Start相比之下只能局限于一些内部应用。 <br /><br />　　将来位于客户端的表现层开发可能会完全没有Java的位置，这是Sun不愿意看到的，但是Sun在这场角逐中只不过是一个小角色。\r\n            <p align=\"center\"> </p>', '', '', '');
INSERT INTO `youbang_addonarticle` VALUES (47, 4, '<p>　　AJAX bandwagon是个好去处。它能为您提供更快捷高效，动态更强的应用。但是它也有自己的缺陷。&nbsp; </p><p>　　乍看之下，具备一些常识似乎就能够避免这些缺陷，在某种程度上来看，的确如此。但是从AJAX 应用的DHTML起源来看，AJAX应用中充满了结构性的差异。无论您在应用开发工作中掌握了多少常识，学习前人的教训都是有好处的。我们将这些错误称为我们的“七宗死罪”，但是这些错误并不能代表全部的错误。 </p><p>　　事实上，在您犯下任何一宗死罪之前，您都可能首先犯了一些较为轻微的错误。因此，我们首先从这里着手。以下是每个人都可能会犯的一些错误，这些错误是如此常见，只要用Google搜索一下，就能找到大不部分的错误。 </p><p>　　七宗轻罪 </p><p>　　1.滥用后退键-这是每个人都会犯的错误。后退键在很多种Web应用中已然成为用户的期望。很多AJAX开发新手在开发AJAX应用时，出于多种原因都会使用后退键。首先，JavaScript对于它来说不是最友好的语言；其次，AJAX 设计需要一种全新的思考分析。 </p><p>　　对于AJAX新手来说很难接受“后退”不是最好选择的思路。“后退”是更新页面时，或是在特定情况下进行“撤消”时才需要的功能。在您进行编码时就要认识到，否则您最后可能会重复做功。 </p><p>　　2.忘记告诉用户当前发生的状况-AJAX的工作原理中一部分就是它不使用通常的网页用户界面加载程序。因此，您需要设计一些可视的提示，使用户能够了解正在发生的状况。 </p><p>　　3.忘记链接-这也是标准的AJAX错误：漏做了外部用户能够剪切和粘贴的URL链接。我们都曾经复制过某个ＵＲＬ链接然后将其发送给别人。在我们使用AJAX时，只有采用纯手工输入的方式才能把链接提供给他人。为什么？因为在AJAX应用中，服务器不提供在JavaScript自动生成的这个页面。不要忽视您的用户可能感兴趣的这项在网络应用中最为常见的功能。请花点时间为用户提供URL地址，因为服务器并不提供。 </p><p>　　4.用内容控制替代页面控制-如果您在寻求动态的内容控制，那么AJAX应用对传统的客户端服务器交互方式的突破对您来说可算一份大礼。但是，这样同时也会招来祸端：在重写页面上某精确位置上的内容以调整用户的交互体验时的确能够进行很好的控制，但是这可能将使您的页面不再完整。 </p><p>　　在很多情况下，我们专注于处理页面的某个部分，会忘记服务器不会刷新页面。这样可能导致页面零乱，使用户体验降低：当他们查看页面时看的可能是过时的页面。请关注整个页面；确保任何出现动态内容的页面都得到更新。 </p><p>　　5.累死蜘蛛-AJAX的优势在于无需重装就可以提供给页面的大量文本；AJAX的缺陷也在于那些无需重装就可以提供给页面的大量文本。如果应用被设计为对搜索引擎友好，那么您应该能够想到会出现什么状况。无论页面中出现了什么情况，请务必在最上面植入大量稳定的文本，让蜘蛛们去玩吧。 </p><p>　　6.导致乱码文本-AJAX不能支持多种字符集。这并不是什么涉及生死的局限性，但是如果忘记这点可能会导致真正的问题发生。最基本的字符集是UTF-8。无论JavaScript发送的是什么字符集，请不要忘了正确编码，并根据内容设置服务器端的字符集。　　 </p><p>　　7.没有为使用不支持JavaScript的浏览器的用户提供提示。有些浏览器不支持JavaScript，这些用户一时不能明白出了什么状况。请给他们一些提示。 </p><p>　　以上都是一些很容易发现的错误。真正的问题都是容易被人忽视的。　　 </p><p>　　AJAX七宗死罪 </p><p>　　1.造成内存泄露-任何长期从事开发工作的人都知道什么是循环引用，并了解循环引用给内存管理带来的危害。AJAX 所使用的JavaScript是一种内存管理语言。也就是说JavaScript具有内置的信息包收集功能，因此能够抽取不再有引用路径使用的变量并重新分配这些变量所使用的内存。 </p><p>　　作为基本工作原理来说，这样并无不妥；但是在模型层对象与查看元素之间互相引用时，由于这些循环引用，您就不能依靠这个功能来实现内存使用的最优化。从原则上来说，对象为零，则元素为零。但是如果这是从元素到对象的向后引用，那么信息包搜集器不会动这些对象。 </p><p>　　现在，问题出来了：在文件对象模型中，任何文件树中的DOM节点都可能被树中存在的其他元素引用，而无论其是否被其他对象所引用！因此，任何在信息包收集器中经过标注的被ＤＯＭ节点向后引用的对象在这一方向上都必须为零，否则它的内存就会一直处于已分配状态。 </p><p>　　2.不了解“异步”的含义-异步这个词很容易让不熟悉它的用户感到紧张。但是如果您为这些用户所设计的网页应用属于桌面应用，那么他们肯定不会感到不安。这是一个致关重要的设计点。大部分网页应用功能与桌面副本非常类似。但是在网页应用中，用户期望这种虚幻的特征导致他们截然不同。 </p><p>　　用户在与网页浏览器打交道时会带有非常不同的偏见和期望，而对于桌面应用中他们并没有这样的行为。因此，尽管页面与服务器之间频繁的响应会非常好，非常高效，页面能够同时对自身进行修订，但是这将会使用户头晕眼花。因此，您需要遵守两条守则，要考虑到进入用户视觉范围内的每个变化：如果对于用户来说不是很迫切的更新，那么要使升级更为温和，不会转移；如果更新对于用户与应用的交互非常重要，那么更新要清楚而明显。 </p><p>　　3.使服务器变成瞎子-用户端与服务器交流的减少是一大问题，而以前并非如此。在以前，服务器端的应用了解全部情况并且能够看到全部状况：每个例外，每次重新加载，每个事件多能被看到并记录下来，当然服务器也道到底客户端是什么状况，因为服务器会记录下屏幕上显示的一起。 </p><p>　　在AJAX应用中可不是这样。当有事件发生时，这些事件是与服务器相互独立的，也就是说，当客户端出现问题时，服务器端并不会马上知道。在某个位置发现和记录客户端发生的事件以及例外，使服务器能够追踪需要干涉的问题 </p><p>　　4.用GET偷懒-GET的作用是找回数据；POST的作用是对ＧＥＴ进行设置。不要在不适当的时候使用GET,即使你认为这样做没有危害也不要尝试。GET的动作会改变状态，会改变状态的链接会使用户感到困惑；大部分都认为链接的作用是导航，而不是功能。 </p><p>　　5.数据类型不兼容-JavaScript并非.NET 框架中的一部分。尽管这有点让人伤心，但是它的确为我们展示了一个我们可能会碰到的问题：确认JavaScript能够理解其运行平台上的数据类型，反之，对于.NET或其它也是如此。可能会有多种转换，您需要一一进行。例如，Ajax　.NET Pro 资料库提供能够转换.NET和JavaScript对象符号的转换器。 </p><p>　　6.有些应用不知何时应该关闭-无需刷新页面的内容动态生成如果没有关闭时间将会非常糟糕。How many Web pages hav你见过多少比美国国会议事录还长的网页？如果网页无限延长无疑会是用户的噩梦，只要想想用户会怎么看待永不停止的应用就知道了。让您的网络应用具有动态，但是一定要在可行的限度之内。 </p><p>　　7.JavaScript和DOM相互独立-请记住AJAX是建立在“模型－视觉－控制器”（Model-View-Controller）结构之上，请认真对待这点。JavaScript属于模型层，DOM属于视觉层，而控制器是衔接他们的婚姻顾问。请确保您的网络文件独立于JavaScript之外(这样对于不支持JavaScript的用户比较有用) – 除非内容自身只在用户使用JavaScript才有意义。在这种情况下，用JavaScript来创建内容。 <br /></p>\r\n            <p align=\"center\"> </p>', '', '', '');
INSERT INTO `youbang_addonarticle` VALUES (48, 4, '<p>我总是乐于尝试新工具或利用节省开发时间的资源。由于市面上存在有许多Web开发工具，你可能很难缩小搜索范围。</p><p>是我最近发现的一个新工具。形容jQuery是“一个快捷、简练的JavaScript库，它可以简化HTML文档检查、事件处理、动画执行、并给你的Web页面增加AJAX交互。”</p><p><strong>jQuery</strong><strong>初步</strong></p><p>你可以jQuery的最新版本。它由一个明确定义的脚本文件构成，因此你可以随意研究它的源代码。下载JavaScript文件后，你就可以把它放在Web服务器中准备使用。你可以用HTML SCRIPT元素把jQuery库加载到任何Web页面中。src属性应利用文件在服务器中的真实路径。</p><p><script type=\"text/javascript\"</p><p>src=\"jquery-latest.js\"></script></p><p>下载文件后，以下的一些任务会对你使用jQuery有所帮助。</p><p><strong>编码基础</strong></p><p>以下是使用jQuery编码时用到的一些指针：</p><ul><li>jQuery代码块前为美元符号（$）。 </li><li>美元符号后是一个左圆括号。 </li><li>括号内是你要jQuery查找的内容，如它应使用哪个元素。 </li><li>特定对象事件后为右圆括号。 </li><li>你可以用指定的事件定义所发生的操作。方法/事件后的括号内是一个说明发生事件时会出现什么操作的函数。 </li></ul><p>在举例说明之前，我想介绍jQuery库的一个最有益的基础元素。JQuery利用的一切功能全都位于中，因此在你使用jQuery的特性之前，你必须加载这个文档。你可以用这个文档的ready事件完成上述操作，如下面的jQuery代码段所示：</p><p>$(document).ready(function() {</p><p>// Your code goes here</p><p>});</p><p>上面的简单jQuery代码允许你在文档完成加载后执行代码。列表A是它的一个应用实例，它对页面上的所有标题元素应用一个CSS类。</p><code><pre><html><head><br />\r\n<title>Test</title><br />\r\n<script type=\"text/javascript\" src=\"jquery-latest.js\"></script><br />\r\n<script type=\"text/javascript\"><br />\r\n$(document).ready(function(){<br />\r\n$(\'h1\').addClass(\"testclass\");});<br />\r\n</script><br />\r\n<style type=\"text/css\" media=\"all\"><br />\r\n.testclass { background: yellow; font-size: 20pt; }<br />\r\n</style><br />\r\n</head><br />\r\n<body><br />\r\n<h1>Test</h1><br />\r\n<p>test</p><br />\r\n<h1>Test2</h1><br />\r\n<p>test2</p><br />\r\n</body></html></pre></code><p>这段代码中包含以下元素：</p><ul><li><strong>$(document).ready(function(){</strong>——在页面完全加载后，告诉页面执行（函数主体内）的代码。 </li><li><strong>$(\'h1\').addClass(\"testclass\");});</strong>——定位页面上的所有HTML H1元素。addClass方法将所有的testclass CSS类分配给H1元素。这个类设定一个黄色背景色，因此所有标题都为黄色背景。 </li></ul><p>jQuery文档还简单说明了许多其它事件属性和函数，并介绍它们的用法。列表B中的简单代码实例说明如何给一个超链接点击事件进行编码。选择超链接时，在用户转换到链接目标前显示一个警告窗口。只有在页面内容全部加载以后，这时才再次使用ready函数来定义点击事件。</p><p>\r\n            <p align=\"center\"> </p>', '', '', '');
INSERT INTO `youbang_addonarticle` VALUES (49, 4, '<p>最近，老板在我们公司使用了一种网络内容过滤设备。至今为止，他们对该设备进行了良好的设置。在使用我的办公用计算机浏览网页时，经过该设备进行了网页内容过滤的Web世界就大为不同了。</p><p>Mashups仅是合并的开始，像链接或将其它网站的内容嵌入到你的网站中。这样的事情被人们认为是一种粗鲁的行为，不是一个业务模型。现在，幸亏有了新的WCF设备来代替，我不再需要访问以前日常工作中可能需要浏览的一些技术和业务相关网站。</p><p>问题并不在网站本身，也不在网站上的内容，甚至也不是因为我访问的网站与我的工作没有直接的关系。问题是这些网站常常将YouTube网站的视频信息嵌入到它们的内容中。</p><p>我知道WCF设备确实记录和监控用户访问过的网站，即使这个网站未被列入黑名单。我也知道它会对这些记录输出报告，以发现那些网站比较有价值或者那些网站对工作没有多少帮助。</p><p>这很好，我担心的问题是，如果他们决定对嵌入了YouTube视频信息的网站开启一些警告如“嘿，该用户经常试图访问受限制或标记的内容！”等，那么其它的mashups就会使用困难。</p><p>我不使用Mashup还有另外的原因。我以前已经从两个不同的角度介绍过这个方面的内容。在“”中讨论了为什么我认为mashups是一个不好的想法的原因。在“”一文中，我们为大家介绍了对“便利”数据的误用可能会将安全应用转变成职业杀手的问题。</p><p>在将某些内容放到YouTube、Flikr或其它类似网站上时，大多数开发人员或Web设计人员最不希望的事是他们可能给用户带来麻烦。</p><p>正好相反，他们说“看，很好，我可以将这个有用的视频信息放到YouTube上，它不会堵塞网络带宽，我的网站运行速度很快，YouTube播放器很好用，它能很好的与我的网站结合。”这些都是真话。</p><p>但是另一个事实是，当用户登录你的网站浏览与工作相关的Web页面时，用户所在的公司可能会将此访问记录为访问一个未授权的或不合适的网站，这不是用户所希望的。</p><p>结果，眼光敏锐的用户可能会开始拒绝访问这些与工作相关的站点。当他们对感兴趣的信息来源逐渐减少访问时，那么可以肯定地是他们日常访问也会相应减少。</p><p>我始终认为对来自域外面的内容应该清楚的标记为外部链接，这将十分有用。这样如果用户想在一个新窗口中打开一个网站时，他们可以做出决定能否打开，从而可以保留他们对你的网站兴趣。</p><p>如果网站中存在用户不感兴趣的内容或该内容来自用户不希望访问站点，这将有助于确保他们可以得到一个全面的选项。总之，清晰的标记外部内容（或者通过链接内容或者通过链接图标）对你的网站和用户是一种双赢的方法。</p><p>我的观点是不要对网站内容进行拼接。总的来说，这不是一个很好的策略。设计一个自己的类似系统，或者为了播放来自服务器的内容嵌入一个Flash播放器，或插入一个标准多媒体插件，这都不是很困难。</p><p>如果你的带宽不足以提供这些内容，那么你可能需要考虑实际可以添加多大数据量的视频、音频剪辑或任何其它内容。一旦将你的内容放在其它地方结果将会很糟糕，它可能会被添加了一些广告或其它东西。这将会给用户带来大量麻烦。</p>\r\n            <p align=\"center\"> </p>', '', '', '');
INSERT INTO `youbang_addonarticle` VALUES (50, 4, '<p>Flash动画可以让Web网站看起来很漂亮，但是由于各种原因不是每个人都会在自己的客户端浏览器上安装Flash播放器。如果你或者你的用户不幸安装了64位的Linux发行版，或者你痛恨在自己的Web页面上放动画，那么你就不得不面对没有Flash动画的情况了。</p><p>在本文里，我将告诉你如何用JavaScript实现一个可用性更高的旋转木马（carousel）而弃用Flash。</p><p><strong>JavaScript——两害相交取其轻</strong></p><p>在本文里，我不准备去争论为什么要开发一个旋转木马，而是要接受我们不得不去开发的事实。</p><p>那么问题就来了：为什么要使用JavaSript而不是Flash？</p><ul><li>它要比Flash的实现更加轻巧——通过优化代码，我们只需要几千字节就能够获得一个可以使用的旋转木马，加载图片所需要的时间要比HTML和JavaScript的长。 </li><li>可维护性是另外一个原因。很多开发人员都知道JavaScript在可维护性上要胜Flash一筹。也许你没有（足够的）设计资源来创建一个功能完整的Flash实现，所以如果将它突然留给开发人员，这就意味着JavaScript是一个可行的替代方案。 </li><li>降级。在禁用JavaScript的情况下将有用的内容发送给用户要比在禁用Flash的情况下容易得多。 </li><li>可访问性。用屏幕阅读器浏览旋转木马要比浏览Flash对象更容易。 </li><li>Google。如果你的内容是在页面中的，Google就能够搜索到它；如果它在Flash中，而且页面中没有隐藏旋转木马的话，那么Googlebot就无法找到链接。</li></ul><p><strong>HTML基础</strong></p><p>知道了这些原因，就让我们从将要在本文中用到的四个内容开始创建旋转木马吧。</p><p align=\"left\"><html></p><p align=\"left\"><body></p><p align=\"left\"><div id=\"storyContainer\"></p><p align=\"left\"><div id=\"story1\"></p><p align=\"left\"><a href=\"http://www.builderau.com.au/program/iis/soa/Protect_IIS_log_files_by_moving_them_to_a_secure_location/0,339028427,339271617,00.htm\" class=\"ched\">Secure IIS</a></p><p align=\"left\">Log files are essential to reconstruct events before an IIS Web server failure. Learn how to protect your log files with this tip.</p><p align=\"left\"><span class=\"fstory\"><a href=\"http://www.cnet.com.au/software/security/0,39029558,40058242,00.htm\">Full story</a></span></p><p align=\"left\"></div></p><p align=\"left\"><div id=\"story2\"></p><p align=\"left\"><a href=\"http://www.builderau.com.au/program/html/soa/Microformats_and_Mapping/0,339028420,339271486,00.htm\" class=\"ched\">User Group Mash</a></p><p align=\"left\">Find an Aussie user group near you with our new Google maps interface.</p><p align=\"left\"><span class=\"fstory\"><a href=\"http://www.builderau.com.au/program/html/soa/Microformats_and_Mapping/0,339028420,339271486,00.htm\">Full story</a></span></p><p align=\"left\"></div></p><p align=\"left\"><div id=\"story3\"></p><p align=\"left\"><a href=\"http://www.builderau.com.au/program/dotnet/soa/Quick_Start_guide_to_Microsoft_NET_development/0,339028399,339271495,00.htm\" class=\"ched\">.NET 101</a></p><p align=\"left\">Learn how the .NET Framework works and the tools you\'ll need to get up and running in this quick start guide.</p><p align=\"left\"><span class=\"fstory\"><a href=\"http://www.builderau.com.au/program/dotnet/soa/Quick_Start_guide_to_Microsoft_NET_development/0,339028399,339271495,00.htm\">Full story</a></span></p><p align=\"left\"></div></p><p align=\"left\"><div id=\"story4\" ></p><p align=\"left\"><a href=\"http://www.builderau.com.au/program/css/soa/Understanding_the_CSS_box_model/0,39028392,39269220,00.htm\" class=\"ched\">Understand CSS</a></p><p align=\"left\">Before diving into CSS learn some of the core drivers and concepts.</p><p align=\"left\"><span class=\"fstory\"><a href=\"http://www.builderau.com.au/program/css/soa/Understanding_the_CSS_box_model/0,39028392,39269220,00.htm\">Full story</a></span></p><p align=\"left\"></div></p><p align=\"left\"></div></p><p align=\"left\"></body></p><p align=\"left\"></html></p><p>这个时候蒙娜丽莎对我们还没有用。现在让我们向这些div加入一些样式，让它看起来更像我们所知道的旋转木马：</p><p align=\"left\"><html></p><p align=\"left\"><head></p><p align=\"left\"><style></p><p align=\"left\">.storydiv {</p><p align=\"left\">height:182px;</p><p align=\"left\">width:355px;</p><p align=\"left\">padding-left:175px;</p><p align=\"left\">top:0px;</p><p align=\"left\">left:0px;</p><p align=\"left\">}</p><p align=\"left\">#story1 {</p><p align=\"left\">background:url(http://www.builderau.com.au/i/s/cov/securitychain170110.gif) no-repeat;</p><p align=\"left\">}</p><p align=\"left\">#story2 {</p><p align=\"left\">background:url(http://www.builderau.com.au/i/s/cov/browser170110.jpg) no-repeat;</p><p align=\"left\">}</p><p align=\"left\">#story3 {</p><p align=\"left\">background:url(http://www.builderau.com.au/i/s/cov/dotnet170110.gif) no-repeat;</p><p align=\"left\">}</p><p align=\"left\">#story4 {</p><p align=\"left\">background:url(http://www.builderau.com.au/i/s/cov/tools170110.jpg) no-repeat;</p><p align=\"left\">}</p><p align=\"left\">.storyDesc{</p><p align=\"left\">padding-top: 10px; </p><p align=\"left\">padding-right: 8px;</p><p align=\"left\">display:block;</p><p align=\"left\">}</p><p align=\"left\">.fStory {</p><p align=\"left\">padding-top: 10px;</p><p align=\"left\">display:block;</p><p align=\"left\">font-weight:bold;</p><p align=\"left\">}</p><p align=\"left\"></style></p><p align=\"left\">&nbsp;</p><p align=\"left\"></head></p><p align=\"left\"><body></p><p align=\"left\"><div id=\"storyContainer\"></p><p align=\"left\"><div id=\"story1\" class=\"storydiv\"></p><p align=\"left\"><a href=\"http://www.builderau.com.au/program/iis/soa/Protect_IIS_log_files_by_moving_them_to_a_secure_location/0,339028427,339271617,00.htm\" class=\"ched\">Secure IIS</a></p><p align=\"left\"><span class=\"storydesc\"></p><p align=\"left\">Log files are essential to reconstruct events before an IIS Web server failure. Learn how to protect your log files with this tip.</span></p><p align=\"left\"><span class=\"fstory\"><a href=\"http://www.cnet.com.au/software/security/0,39029558,40058242,00.htm\">Full story</a></span></p><p align=\"left\"></div></p><p align=\"left\"><div id=\"story2\" class=\"storydiv\"></p><p align=\"left\"><a href=\"http://www.builderau.com.au/program/html/soa/Microformats_and_Mapping/0,339028420,339271486,00.htm\" class=\"ched\">User Group Mash</a></p><p align=\"left\"><span class=\"storydesc\"></p><p align=\"left\">Find an Aussie user group near you with our new Google maps interface.</span></p><p align=\"left\"><span class=\"fstory\"><a href=\"http://www.builderau.com.au/program/html/soa/Microformats_and_Mapping/0,339028420,339271486,00.htm\">Full story</a></span></p><p align=\"left\"></div></p><p align=\"left\"><div id=\"story3\" class=\"storydiv\"></p><p align=\"left\"><a href=\"http://www.builderau.com.au/program/dotnet/soa/Quick_Start_guide_to_Microsoft_NET_development/0,339028399,339271495,00.htm\" class=\"ched\">.NET 101</a></p><p align=\"left\"><span class=\"storydesc\"></p><p align=\"left\">Learn how the .NET Framework works and the tools you\'ll need to get up and running in this quick start guide.</span></p><p align=\"left\"><span class=\"fstory\"><a href=\"http://www.builderau.com.au/program/dotnet/soa/Quick_Start_guide_to_Microsoft_NET_development/0,339028399,339271495,00.htm\">Full story</a></span></p><p align=\"left\"></div></p><p align=\"left\"><div id=\"story4\" class=\"storydiv\"></p><p align=\"left\"><a href=\"http://www.builderau.com.au/program/css/soa/Understanding_the_CSS_box_model/0,39028392,39269220,00.htm\" class=\"ched\">Understand CSS</a></p><p align=\"left\"><span class=\"storydesc\"></p><p align=\"left\">Before diving into CSS learn<br/>some of the core drivers and concepts.</span></p><p align=\"left\">&nbsp;</p><p align=\"left\"><span class=\"fstory\"><a href=\"http://www.builderau.com.au/program/css/soa/Understanding_the_CSS_box_model/0,39028392,39269220,00.htm\">Full story</a></span></p><p align=\"left\"></div></p><p align=\"left\">&nbsp;</p><p align=\"left\"></div></p><p align=\"left\"></body></p><p align=\"left\"></html></p><p align=\"left\">\r\n            <p align=\"center\"> </p>', '', '', '');
INSERT INTO `youbang_addonarticle` VALUES (51, 4, '<p>XML是作为一种数据交换工具开发并推出的，但并不是所有开发者都支持这一工具。实际上一些开发者选择开发其它工具。（JavaScript对象符号）就是其中之一。在本文中，我们来详细了解一下JSON的设计与应用。 </p><p><strong>JSON</strong><strong>简介</strong></p><p>JSON是一种用JavaScript对象符号格式化文本的简单方法。与其它更为流行的面向对象设计技术不同的是，人们经常称它为面向数据工具。由于它使用编程结构，因此易于为人与机器进行阅读。</p><p>JSON旨在传送基于文本的数据，所以它不支持任何类型的二进制对象。基本上，它支持两种类型的数据结构：名称/值对集合（如对象）和有序数值列表（如数组）。下面的列表详细说明了JSON支持的数据元素：</p><ul><li><strong>Objects</strong>（对象）：以大括号（ {}）开始并结束的对象。 </li><li><strong>Object members</strong>（对象成员）：由以冒号（：）分隔的字符串和值组成的元素。成员之间用逗号（，）隔开。 </li><li><strong>Arrays</strong>（数组）：数据用大括号定义。也就是说，它们以大括号（{}）开始并结束。数组由值构成，这些值位于大括号之中，不同值之间以逗号隔开。 </li><li><strong>Values</strong>（值）：单独的值可能为字符串、数字、对象、或一个文字值，如真、假和零。字符串值位于双引号中，可能包含Unicode字符和反斜扛或转义字符。字符是一个单独的字符串。 </li></ul><p>简单是JSON的一个主要优势——它比与之对应的XML要简单得多。用一个显示JSON数据语法和格式化的例子就能清楚证明这一点。下面的代码片断使用JSON来建立一个网址数组：</p><p>{</p><p>\"websites\":[</p><p>\"http://www.techrepublic.com/\",</p><p>\"http://www.cnet.com/\",</p><p>http://www.news.com/</p><p>] }</p><p>要用XML方便地定义同样的数据，可能相当困难。</p><p><strong>为何不使用XML</strong><strong>？</strong></p><p>XML是一个优秀的数据工具。它允许你建立标签等符号来描述任何类型任何数量的数据。另外，它还是IT业的知名标准。</p><p>另一方面，对许多任务来说，XML的功能可能过于强大，并会增加许多额外的开销。而且，不管它建立起来多么方便，（人类）却无法阅读这些代码。</p><p>让我们用XML格式化前面的例子：</p><p><?xml version=\"1.0\"?></p><p><websites></p><p><website>http://www.techrepublic.com/</website></p><p><website>http://www.cnet.com/</website></p><p><website>http://www.news.com/</website></p><p></websites></p><p>你可能认为这两个例子之间没有太大的差别。但是，在XML中要传送的字符数量几乎增加了一倍。对一个简单的例子而言，这可能不是一个大问题。但让我们看看下面的一个更加复杂的JSON实例：</p><p>\r\n            <p align=\"center\"> </p>', '', '', '');
INSERT INTO `youbang_addonarticle` VALUES (52, 4, '<p>尽管AJAX是个相对新生的术语，但其背后的技术却并不新颖。随着XMLHttpRequest对象在大多数浏览器中的实现，以及GMail和Google Maps的出现激发了软件开发者重新考虑如何构建网页的灵感。我们从基础开始认识AJAX，一种颠覆性的技术，其改变了Web应用程序的开发和应用方式，使得交互性页面和网站处于目前网络潮流的最前沿。</p><p>当请求被发送到浏览器后，其所具有的改变网页内容的功能已经存在许多年了-使用javascript脚本改变iframe\'s src属性是技术之一。</p><p><strong>XMLHttpRequest对象</strong></p><p>XMLHttpRequest对象使AJAX的出现成为可能，它产生异步请求，并决定如何处理结果。在大多数浏览器中，我们使用如下代码来创建对象：</p><p>var xmlhttp = false;</p><p>try {</p><p>xmlhttp = new XMLHttpRequest();</p><p>} catch (e) {</p><p>alert(\"cannot create object\");</p><p>}</p><p>不幸的是，上文中所提到的“大多数浏览器”并不包括IE,因此对于微软的浏览器，我们需要采用一种特殊的方法创建对象。值得注意的是，根据MSXML解析器的不同版本，需要分别编写两种代码。</p><p>var xmlhttp = false;</p><p>try {</p><p>xmlhttp = new ActiveXObject(\"Msxml2.XMLHTTP\");</p><p>} catch (othermicrosoft) {</p><p>try {</p><p>xmlhttp = new ActiveXObject(\"Microsoft.XMLHTTP\");</p><p>} catch (failed) {</p><p>xmlhttp = false;</p><p>}</p><p>因此，结合上述两个代码片段，我们得到了以下适合所有主流浏览器创建XMLHttpRequest对象的代码：</p><p>var xmlhttp = false;</p><p>try {</p><p>xmlhttp = new XMLHttpRequest();</p><p>} catch (trymicrosoft) {</p><p>try {</p><p>xmlhttp = new ActiveXObject(\"Msxml2.XMLHTTP\");</p><p>} catch (othermicrosoft) {</p><p>try {</p><p>xmlhttp = new ActiveXObject(\"Microsoft.XMLHTTP\");</p><p>} catch (failed) {</p><p>xmlhttp = false;</p><p>}</p><p>}</p><p>}</p><p>\r\n            <p align=\"center\"> </p>', '', '', '');
INSERT INTO `youbang_addonarticle` VALUES (53, 4, '<p>编程错误是生活中的严酷事实，但你不应在追踪这些错误的同时捶胸顿足。更加稳定的语言，如Java和.NET系统语言提供简化问题追踪过程的开发环境。</p><p>JavaScript开发者拥有较少的选项，但提供你所需的一切功能。（Venkman是这个调试器的代号。）</p><p><strong>Venkman JavaScript</strong><strong>调试器</strong></p><p>这个调试器的前身为Netscape的JavaScript调试器，它是Mozilla的一个附加产品。Venkman JavaScript调试器既是一个图形，也是一个控制台调试器。</p><p>下载并安装Venkman JavaScript调试器后，就可以通过“工具|Web开发|JavaScript调试器”菜单启动它。这个附加产品允许你查看和调试位于源文件或网页中的JavaScript。它提供以下特性：</p><ul><li><strong>断点管理</strong>：断点允许你在源代码的特定位置终止代码执行。你可以在这个工具内设置和清除断点，这允许你在调试时轻松控制程序流程。双击断点打开与之对应的文件，断点行也会高亮显示。 </li><li><strong>调用堆栈检查</strong>：通过这个特性可粗略了解脚本运行时调用了哪些内容。双击调用堆栈中的一个项目，打开它包含的文件，突出显示与调用堆栈中项目对应的行。 </li><li><strong>变量/</strong><strong>对象检查</strong>：这个特性允许你在执行脚本时查看变量和对象的值。 </li><li><strong>查看源代码</strong>：调试器界面的脚本视图允许你查看被调试的JavaScript代码。 </li><li><strong>执行JavaScript</strong><strong>代码</strong>：你可以在调试器中输入并运行自己的JavaScript代码。 </li></ul><p>调用堆栈、打开文件和变量/对象视图以树状显示。任何旁边有扭曲图标的项目都包含子对象，可以打开扭曲图标查看这些子对象。工具栏内包含表示基本调试特性的按钮，包括：</p><ul><li><strong>终止</strong>：停止执行当前脚本，只有在脚本运行时有效。 </li><li><strong>继续</strong>：允许你在用断点终止脚本执行后恢复脚本运行。 </li><li><strong>跳过</strong>：允许你跳过一个函数调用。只有在逐行遍历一段代码时它才有用；调用时它允许你跳过一个函数的代码。函数调用继续，你接着运行被调用函数之后的代码。 </li><li><strong>跳进</strong>：一次运行一个语句。遍历一个语句后，你可以在其它调试窗口中看到它的效果。而且，当你调用函数时，它允许你进入这个函数内。 </li><li><strong>跳出</strong>：执行当前函数的剩余部分，执行在调用它的那一行终止。（只有使用Step Into，转入被调用的函数执行时它才有效。） </li><li><strong>剖析</strong>：激活或禁用当前运行脚本的代码剖析。 </li></ul><p><strong>用Venkman JavaScript</strong><strong>调试器调试一个文件</strong></p><p>用Firefox和Venkman JavaScript调试器调试JavaScript代码相当简单。首先，你将要调试的页面加载到Firefox中。之后，通过工具菜单启动调试器，打开调试器后，当前页面即位于文件列表中。</p><p>你可以在文件列表中导航页面，双击打开和查看它包含的文件，其中包括加载到页面中的JavaSrcipt文件。你可以双击JavaSrcipt文件查看它的源代码，并对其使用调试器特性。</p><p>例如，你可以设置断点，返回浏览器窗口并与页面交互，触发JavaSrcipt执行，并在遇到断点时停止执行。这时，你可以通过调试器选项（跳进、跳过等）继续执行代码，同时监控变量和对象。调试器的另一个显著特点是你可以对代码进行剖析，找出低效的代码。</p><p><strong>用Venkman JavaScript</strong><strong>调试器剖析代码</strong></p><p>Venkman JavaScript调试器的剖析特性允许你监控代码执行，追踪存在低效代码的瓶颈。剖析下拉菜单允许你打开收集、清除剖析数据和保存剖析数据。剖析文件可以保存为HTML、XML、文本或逗号分隔的文件。</p><p>下面的代码中包含一部分通过剖析特性收集到的样本数据。它包括源文件名和执行时间窗口、所使用函数的名称（包括源代码行号）、运行时调用函数的总次数、以及执行总时间。</p><p>prototype.js: 750 - 2500 milliseconds</p><p>Function Name: [from] (Lines 489 - 498)</p><p>Total Calls: 2 (max recurse 0)</p><p>Total Time: 2359.38 (min/max/avg 0/2359.38/1179.69)</p><p>Time (ex. calls): 2359.38 (min/max/avg 0/2359.38/1179.69)</p><p>剖析数据允许你查出可能对代码的性能造成负面影响的代码和函数。</p><p><strong>用Venkman JavaScript</strong><strong>调试器追踪问题</strong></p><p>JavaScript开发者需要Mozilla Venkman JavaScript调试器。该插件允许你轻松地遍历代码执行、监控变量和对象、并定位任何可能给性能造成负面影响的代码。</p><p>价格标签是Venkman JavaScript调试器的最佳特性——你可以在各种版本的基于Mozilla的浏览器（如Firefox）中免费使用这一特性。</p><p>作为一名资深开发者，我喜爱这个调试器，因为它显著简化了JavaScript代码调试工作。</p><p><em>Tony Patton</em><em>拥有丰富的Java、VB、Lotus及XML认证方面的知识，是一个专业的应用程序开发人员。</em></p>\r\n            <p align=\"center\"> </p>', '', '', '');
INSERT INTO `youbang_addonarticle` VALUES (54, 5, '<p style=\"TEXT-INDENT: 2em\">，麻烦在更新，特别是大规模更新，工作量非常大。真不知那些创意不断而又勤奋的“站长”，隔三岔五将网站来个“大换血”，是怎么忙过来的。</p><p style=\"TEXT-INDENT: 2em\">告诉你这个秘密吧，他们很多是在“批发”网页，并且你的机器中也有这样的“批发站”呢!这个好东东就是——模板。常见的工具：FrontPage、DreamWeaver中都有这项功能。如用DreamWeaver 3.0 制作网站时，使用模板就能减少大量的重复劳动。</p><p style=\"TEXT-INDENT: 2em\"><strong>一、建立模板</strong></p><p style=\"TEXT-INDENT: 2em\">1、创建模板页面</p><p style=\"TEXT-INDENT: 2em\">最简单的办法是将一个网页另存为模板文件，通过执行命令：File→Save as Template，DreamWeaver会在网站根目录中建立一个模板文件夹——Templates来保存该模板。</p><p style=\"TEXT-INDENT: 2em\">当然，也可以新建一个模板：Window→Templates，会出现的Templates面板，单击右下角的New Template按钮，输入文件名，就建立了一个空模板;再单击Open Template按钮打开该模板，保存后自动存放于网站模板文件夹Templates中。</p><p style=\"TEXT-INDENT: 2em\">新建、打开的模板页面和普通的网页没什么两样，同样可以加入表格、层、图片、动画、脚本，设置页面属性等。</p><p style=\"TEXT-INDENT: 2em\">举例：这里以制作一个模板为例来说明。在该页面中，我们希望左侧的网站标识图和底部的导航图出现在每个页面中。其中标识图由两幅图片叠加而成，导航图上的文字“最近更新”、“在线阅读”、“打包下载”等划分成几个热区分别链接到不同的文件，它们在每个页面中都不变。右上部的主页面区和左下角弹出式选单按钮下面的页面说明则各不相同。为了保持页面整洁，我们用表格来布置这些元素。</p><p style=\"TEXT-INDENT: 2em\">准确地说它只是一个没有可编辑区域的“准模板”，下面再设定可编辑区域。</p><p style=\"TEXT-INDENT: 2em\">2、设定可编辑区域</p><p style=\"TEXT-INDENT: 2em\">设定模板可编辑区域，一般来说有两种方法。</p><p style=\"TEXT-INDENT: 2em\">新建可编辑区域：选择命令：Modify→Template→New Editable Region。在某一空白区域中单击后执行该命令即可将该区域变为可编辑区域。</p><p style=\"TEXT-INDENT: 2em\">标记某一区域为可编辑区域：选择命令：Modify→Template→Mark Selectin as Editable Region。如果某区域已经有一些文字，并且希望在以后新建的超文本文件中部分保留其内容，先选中该区域再执行标记命令即可。</p><p style=\"TEXT-INDENT: 2em\">取消可编辑状态：选择命令：Modify→Template→Unmark Editable Region。执行该命令后会弹出一个对话框，其中有当前已有的可编辑区域列表，选中要取消的区域名称，确认即可。</p><p style=\"TEXT-INDENT: 2em\">举例：在大片空白区中随便单击一下，执行Modify→Template→New Editable Region命令，在弹出对话框中输入名称：Main;选中左下角本页说明下面的文字，执行Modify→Template→Mark Selectin as Editable Region命令，输入名称：exp。可以看到可编辑区显示为浅蓝色，保存即完成模板制作。</p><p style=\"TEXT-INDENT: 2em\"><strong>二、使用模板</strong></p><p style=\"TEXT-INDENT: 2em\">1、根据模板新建页面</p><p style=\"TEXT-INDENT: 2em\">命令：File→New From Template。弹出对话框，从模板列表中选取模板，出现的新页面中除可编辑区外均有淡黄色背景，是不能进行修改的部分。空白的Main编辑区可直接进行插入表格、文字、图片等操作，Exp编辑区保留有原来的文字，修改或重新编辑均可。</p><p style=\"TEXT-INDENT: 2em\">2、对一个已经有内容的页面应用模板</p><p style=\"TEXT-INDENT: 2em\">命令：Modify→Template→Apply Template to Page。选择模板后还会弹出一个对话框，让您选择现有的孤立内容保存到哪个可编辑区域(Choose Editable Region for Orphaned Content)。要是不想保留则可以选择“(none)”。</p><p style=\"TEXT-INDENT: 2em\">举例：我们先新建一个普通页面，输入：“CIW电脑工作室”，执行Modify→Template→Apply Template to Page命令，选择模板test，现有内容保存区域选择Main，确认后可看到页面自动变成了模板页的形式，而“CIW电脑工作室”这一行字就出现在主编辑窗口中。</p><p style=\"TEXT-INDENT: 2em\">3、更新模板以全面更新站点</p><p style=\"TEXT-INDENT: 2em\">基于某一模板建立了一些页面后，对模板进行修改后保存时，就会自动弹出一个对话框，列出所有使用了该模板的页面，询问是否要更新。</p><p style=\"TEXT-INDENT: 2em\">另外一种方法是执行Modify→Template→Update Pages命令。从Update Pages对话框中选择一个站点或站点的某一种模板(同一站点中可以使用多个模板)，单击右侧的Start按钮，软件会自动搜索与模板相关联的网页并进行更新。非常方便!</p><p style=\"TEXT-INDENT: 2em\">举例：Test模板左侧图形中的“读书破万站”图片是用一个图层叠加在另一幅图片之上的，现在不想要它，同时还想将所有页面中的该图片均删除。就可以打开模板test.dwt，删除该图层，保存模板，单击右侧的“Update”按钮即可。</p><p style=\"TEXT-INDENT: 2em\">注意：新建和使用模板前需定义站点。方法是，执行命令：Site→Define Sites;指定站点名称和本地根目录(Local Root)。模板使用的是相对路径，如果没有指定网站在本地的位置，软件就不能准确找到并保存模板文件;并且应用模板新建和更新页面时，页面中的超链接也不能随页面文件保存位置的不同而相应变化。</p>\r\n            <p align=\"center\"> </p>', '', '', '');
INSERT INTO `youbang_addonarticle` VALUES (55, 5, '<p>&nbsp;　　译者序:这个系列原文一共8篇文章，从普及 Web Standards 入手，讲述如何用 Dreamweaver 8 来构建符合标准的 Web ，由于原作者的此篇文章是对《Build Your Own Standards Compliant Website Using Dreamweaver 8 》(这篇文章是收费的)的摘录，所以我对内容进行了适当的删改，顺序与原文是一致的，但篇幅会有调整，特此告知。翻译水平有限，敬请谅解。 </p><p>　　如果您正在读这篇文章，您很可能是已经对 Web 标准有了一定的兴趣，并且对用 DW ( Dreamweaver 的简称)来构建的站点中标准的应用非常好奇。 </p><p>　　或许您已经对 WS (Web Standards的简称)有了一定的了解，但是您并不知道如何用 DW 来编写可兼容的代码。或者您是一个 DW 用户，您很想遵从 WS ，更广泛的使用 CSS ，并且可以制作出更有亲和力的文档。无论您是哪一种类型，这篇文章都会给您想要的答案:告诉您如何用 DW 来搞定 WS。 </p><p>　　Web 标准的定义 </p><p>　　就我们在整篇文章所关心的 WS 来说，让我们首先花一点时间来明确一下我们究竟在谈论些什么: </p><p>　　WS 是一些指导 Web 开发语言的规范，是由 W3C 所制定的。这些规范包含了多种语言，例如，HTML、XHTML 和 CSS 还有一些其他的相关语言，例如 MathML，用来表示数学中的方程，当你有这种特殊的需要的时候，或许会用得上。W3C 也颁布了“Web 内容亲和力指南”(Web Content Accessibility Guidelines —— WCAG)——推广网页的可访问性(通过 WAI ) </p><p>　　提示:直接获取这些规范 </p><p>　　你可以在 W3C 的网站上阅读这些规范，尽管他们有时读起来还是有些困难的: </p><p>　　HTML 4.01 </p><p>　　XHTML 1.0 </p><p>　　CSS 1 </p><p>　　CSS 2.1 </p><p>　　WCAG 1.0 </p><p>　　在本文中，我们将会用到 XHTML1.0、CSS1 和 2.1、WCAG 1.0 等规范和建议，但是你一定很高兴知道我们其实不必过多的阅读 W3C 文档。 </p><p>　　谁需要 WS ? </p><p>　　您可能只有一个含糊的概念:WS 是个好东西，但是许多网站——包括许多知名的站点——并不遵从 WS ，并且他们看起来的确管理得很好。所以，为什么我们要尽力去遵从 WS 呢?这么做会有什么真正的收益吗?谁需要 WS ?谁需要去关注 W3C 的规范与建议? </p><p>　　Web 开发者与设计者 </p><p>　　需要关注 WS 的首类人群就是我们:网站建设的开发者与设计者。花费时间去学习如何用 WS 开发对于我们来说值得吗? </p><p>　　整洁的标记使 BUG 的修复速度加快。 </p><p>　　如果您通过 W3C 校验您的页面，至少您会了解到不规范的标记并不是引起您曾经遇到过的错误的原因。有时，校验一个页面和修复已发现错误的过程，可以清除显示中遇到一些问题，这些问题是由标记(element)没有结束或标签(tag)拼写错误引起的。 </p><p>　　即使校验您的文档并没有修正这些问题，至少你会知道这些问题存在于规范的文档中。既然你已经知道这个问题不是一个错误，那么你可以开始关注其他的问题了，例如在不同的浏览器中 CSS 处理差异问题。 </p><p>　　遵从可访问性的需求很容易 </p><p>　　如果你编写一个规范的 XHTML 标记，那么你就可以保证文档在语义上是无误的，并且您可以把文档中的内容与表现相分离，您将可以把大量的工作放在许多 WCAG1.0 中所列的可访问性的问题上。认识到可访问性并不是仅仅为残疾人设计的这一点也很重要。一个亲和力好的站点是可以被许多不同的设备访问的，例如移动电话和 PDA ，他们是不具备强大的处理能力去对付那些散乱而非标准的标记的。 </p><p>\r\n            <p align=\"center\"> </p>', '', '', '');
INSERT INTO `youbang_addonarticle` VALUES (56, 5, '<table class=\"zhi14\" cellspacing=\"0\" cellpadding=\"0\" width=\"700\" align=\"center\" border=\"0\"><tbody><tr><td><p style=\"TEXT-INDENT: 2em\">随着ADOBE CS3系列产品的亮相，我们最关注的Dreamweaver CS3也获得了最新的消息。</p><p style=\"TEXT-INDENT: 2em\">首先先来看看传统的Dreamweaver彩蛋是否还在。</p><p style=\"TEXT-INDENT: 2em\">第一个Dreamweaver彩蛋就是：</p><p style=\"TEXT-INDENT: 2em\">1，在网页中插入一张图像；</p><p style=\"TEXT-INDENT: 2em\">2，打开属性面板，在图像的缩略图上双击鼠标+Ctrl键</p><p style=\"TEXT-INDENT: 2em\" /><center><img src=\"http://file.chinahtml.com/webdesign/1/2007-05-03/3716ca9a682aea43ee7de48e0f69b466.gif\" border=\"0\" twffan=\"done\" /></center><p /><p style=\"TEXT-INDENT: 2em\">这里看到的头像即为开发Dreamweaver的相关人员。</p><p style=\"TEXT-INDENT: 2em\">第二个Dreamweaver彩蛋就是：</p><p style=\"TEXT-INDENT: 2em\">1，打开属性面板，在颜色文本框中输入文本“”，回车确认</p><p style=\"TEXT-INDENT: 2em\">2，在Dreamweaver窗口的左侧出现绿色小块，可使用鼠标上下移动作为弹球的垫板</p><p style=\"TEXT-INDENT: 2em\">3，而最为弹球的就是Dreamweaver的LOGO（原先都是圆的，Dreamweaver cs3成方的了），该弹球在Dreamweaver的窗口范围内碰壁，回弹至最左侧时需要移动垫板靠上，否则游戏结束。</p><p style=\"TEXT-INDENT: 2em\" /><center><img src=\"http://file.chinahtml.com/webdesign/1/2007-05-03/904a4f6fd9167afcb4c5a6acc60cc402.gif\" border=\"0\" twffan=\"done\" /></center><p /><p style=\"TEXT-INDENT: 2em\">很不错的消遣游戏吧：）做网页累了玩下吧，呵呵。 </p></td></tr></tbody></table>\r\n            <p align=\"center\"> </p>', '', '', '');
INSERT INTO `youbang_addonarticle` VALUES (57, 5, '<p>Dreamweaver升级到8.0.2后，插入Flash时的代码会有所改变，这是Macromedia为解决IE中的Flash会出现控件激活框而作的更新。要为Flash添加透明等参数有两种方法。</p><p>● 用Dreamweaver的属性面板为插入的Flash添加透明属性，此方法简单实用。</p><p>使插入的Flash处于选择状态，点击属性面板中的“参数”，在随即弹出的参数表中添加一行，参数名为“wmode”，值为“transparent”。使用此方法时注意，若页面中有人工输入的Flash ID，此ID将被删除，请在添加完参数后重新输入ID。</p><p align=\"center\"><img alt=\"在Dreamweaver8.0.2中为插入的Flash添加透明或其他参数\" src=\"http://file.chinahtml.com/webdesign/1/2007-05-03/79def86f1d42caf2b7dc667daa8f6cbc.jpg\" border=\"1\" twffan=\"done\" /></p><p>● 在html代码中为插入的Flash添加透明属性。<br />同样是添加值为“transparent”的“wmode”参数。</p><p><!--加载AC_RunActiveContent.js，此为DW自动生成的文件，无需修改，更改文件目录的时候记得修改这里的路径--></p><p class=\"code\"><script src=\"Scripts/AC_RunActiveContent.js\" type=\"text/javascript\"></script></p><p><!--下面这段JS修改的时候要注意，一共要修改四个地方：<br />300 是宽度；<br />200 是高度；<br />images/killIEBorder 是路径和文件名，修改时注意，共有两处，还要特别注意，文件名后面不要加“.swf”，此后缀已经写在AC_RunActiveContent.js中--></p><p class=\"code\"><script type=\"text/javascript\">AC_FL_RunContent( \'codebase\', \'http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0\', \'width\', \'300\', \'height\', \'200\', \'src\', \'images/killIEBorder\', \'quality\', \'high\', \'pluginspage\', \'http://www.macromedia.com/go/getflashplayer\', \'wmode\', \'transparent\', \'movie\', \'images/killIEBorder\' ); //end AC code<br /></script></p><p><!--遇到浏览器禁用javascript时将调用下面这段<noscript></noscript>内的代码，就是Dreamweaver升级到8.0.2之前我们插入flash时的那段代码。<param> 标签针对IE起作用，<embed> 标签针对Firefox和Netscape起作用。--></p><p class=\"code\"><noscript><br /><object classid=\"clsid:D27CDB6E-AE6D-11cf-96B8-444553540000\" codebase=\"http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0\" width=\"300\" height=\"200\"><br /><param name=\"movie\" value=\"images/killIEBorder.swf\"><br /><param name=\"quality\" value=\"high\"><br /><param name=\"wmode\" value=\"transparent\"><br /><embed src=\"images/killIEBorder.swf\" width=\"300\" height=\"200\" quality=\"high\" pluginspage=\"http://www.macromedia.com/go/getflashplayer\" type=\"application/x-shockwave-flash\" wmode=\"transparent\"></embed><br /></object><br /></noscript></p>\r\n            <p align=\"center\"> </p>', '', '', '');
INSERT INTO `youbang_addonarticle` VALUES (58, 5, '　我们在用Drwamweaver书写英文文本时，段落一般不缩进（不支持半角空格）；但我们大多的时候都是用中文书写格式，必须在每段开头空两个汉字的位置。但浏览器对于文本中的空格，不管多少只认一个空格。如何在Drwamweaver中实现文本的段落缩进，也就成了中的一大难题。针对这一问题，本文为大家提供以下几种解决办法。 <br /><strong>一、用自Dreaweave身所带的功能<br /></strong>1、在<font color=\"#000000\">Dreamweaver</font>中执行下面操作4次就可以插入两个汉字大小的空格。 <p align=\"center\"><img alt=\"Dreamweaver8轻松实现文本的段落缩进\" src=\"http://file.chinahtml.com/webdesign/1/2007-04-29/5296d3b500c9b2b20e9cb5c5ed37833f.jpg\" /><span class=\"web\"></span></p><p>2、用同背景色相同颜色的字符来完成插入空格，这种方法操作比较繁琐、不易修改，而且在浏览内容被选取时，隐藏的字符就曝光了。<br /><strong>二、用HTML语言<br /></strong>用HTML语言方实现中文段落缩进。对于不懂HTML的初学者来说就有些困难了。<br />1、预格式(PRE)<br />用预格式编写的源文件，在显示时照源文件中的排版字样显示，空行和空格都能很清楚地区别开来。如源文件为： 　　<br />〈pre〉<br />　　－－预格式显示……<br />　　〈/pre〉<br />网页就会按照你预先设置好的显示方式显示，即在“预格式显示”的前面就会空两个汉字的位置。<br />2、插入特殊的空格字符“ ”<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; “ ”代表非显示空格字符。插入若干个“ ”字符，中间用分号(；)或者空格隔开，也可以实现中文段落缩进。不过在Netscape 3.01中只能写小写字母，而在IE中大小写都可以。（此方法易产生乱码，不建议采用）<br /><strong>三、用输入法的全角<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong>如果你用的是智能ABC的拼音输入的话，那请按SHIFT+空格，这时输入法的属性栏上的半月形就变成了圆形了，然后再敲空格键，空格就出来了。另外智能陈桥五笔的全角方式也可以直接输入空格。这种方法相对比较简单，缺点是英文字符集下，全角空格会变成乱码。<br /><strong>四、另类方法<br /></strong>1、插入点图或图形：<br />点图是指图片中只有一个或几个像素点，用肉眼看不出来。当我们在段落开头插入这样一个点图，并用HSPACE和VSPACE属性来调整点图的左右和上下的空格，以达到段落缩进。<br />2、插入没有边框和内容的表格：<br />这种方式与上述的插入图形方式类似，该表格没有边框和内容而是空表格。用TABLE的WIDTH和HEIGHT属性调整表格大小适合缩进的需要。利用表格来定位一般来说比较可靠，这种方法容易使页面的源文件变大。因此也不见得是格式控制的首选。<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;最后告诉你一个最原始的办法：在一些文字编辑软件中（比如记事本）复制空格，然后在Dreamweaver中进行粘贴。<br /><strong>五、<font color=\"#000000\">CSS</font>方法<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong>把<p>标记加上一些属性就可以实现，<P style=\"TEXT-INDENT: 2em\">就可以了！本站推荐使用此方法，以后网页教学网也要改版符合WEB标准的网站的。介绍了这么多种，用哪种好呢？各位可以按自己的喜好而定。</p>\r\n            <p align=\"center\"> </p>', '', '', '');
INSERT INTO `youbang_addonarticle` VALUES (59, 5, '<p>　　层(Layer)是一种 HTML 页面元素，您可以将它定位在页面上的任意位置。层可以包含文本、图像或其它 HTML 文档。层的出现使网页从二维平面拓展到三维。可以使页面上元素进行重叠和复杂的布局。首先，请看下图：</p><center><img src=\"http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F60433360W0-19232.jpg\" /></center><p>　　我们首先来做一个层</p><p>　　1、 在「窗口」菜单>选“层”，或点「插入」菜单>布局对象>选“层”。</p><p>　　2、 在页面中显示一个层。</p><p>　　3、 通过周围的黑色调整柄拖动控制层的大小</p><p>　　4、 拖动层左上角的选择柄可以移动层的位置。</p><p>　　5、 单击层标记可以选中一个层。</p><p>　　6、 在层中可以插入其他任何元素包括文字链接表格等。</p><p>　　一个页面中可以画出很多的层，这些层都会列在层面板中。层之间也可以相互重叠。层面板可以通过菜单「窗口」菜单>选“层”打开。</p><center><img src=\"http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F60433445X0-2Z61.jpg\" /></center><center>\r\n            <p align=\"center\"> </p>', '', '', '');
INSERT INTO `youbang_addonarticle` VALUES (60, 5, '<p>　　时经常用到1个像素高或宽的细线条来修饰，可以使网页的布局更加清晰，整体更加美观。由于一直习惯使用Dreamweaver编辑网页，所以在阅读《巧妙地在Frontpage中给网页加入一条竖直线》一文后，笔者利用文中的方法二，在Dreamweaver中给网页加入一条竖直线。</p>\r\n<p>　　依葫芦画瓢，按照《巧妙》一文的所述的方法二，笔者在Dreamweaver中插入表格，设置单元格边距和间距均为0，表格的宽度为1个像素，并设置背景色为蓝色。确认设置无误后，按F12预览，可是网页上并没有如愿出现竖直细线条(如图1)。明明进行了正确的设置却不能实现竖直细线条，真是郁闷！</p>\r\n<center><img alt=\"\" src=\"http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F60433540F-32J3.jpg\" /></center>\r\n<p align=\"center\">图1</p>\r\n<p>　　这是什么原因呢？于是笔者打开Dreamweaver的源代码窗口，经过仔细观察，发现设置为1像素宽的单元格中有个“ ”的标记(如图2)，这个标记是HTML中的转义符，在浏览器输出为一个空格。发现这个标记，笔者终于恍然大悟，原来就是这个标记在作祟！于是删除这个标记后，再次打开网页，竖直细线条终于成功的设置了！</p>\r\n<center><img alt=\"\" src=\"http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F604335G340-41247.jpg\" /></center>\r\n<p align=\"center\">图2</p>\r\n<p>　　在Dreamweaver中插入表格都会自动在每个单元格中加上“ ”的标记，正是因为这个标记，使得设置为1像素宽的单元格在浏览器中显示时多了个空格，把单元格撑大。</p>\r\n<p>　　另外，《巧妙》一文的方法一使用＜hr＞语句来插入竖直线，笔者觉得有不妥之处，因为＜hr＞语句插入的竖直线上下都会留有空白，并不能在任何时候都满足自己的需要，所以笔者建议尽量使用插入表格的方法来实现。</p>\r\n<p align=\"center\">&nbsp;</p>', '', '', '127.0.0.1');
INSERT INTO `youbang_addonarticle` VALUES (61, 5, '<p>随着Adobe Dreamweaver CS3的预销&nbsp;我们开始了新一轮的Dreamweavr学习，那么让我们先了解下Dreamweaver CS3都有哪些新功能：</p><h4>适合于 Ajax 的 Spry 框架</h4><p>使用适合于 Ajax 的 Spry 框架, 以可视方式设计、开发和部署动态用户界面。 在减少页面刷新的同时, 增加交互性、速度和可用性。</p><h4>Spry 数据</h4><p>使用 XML 从 RSS 服务或数据库将数据集成到 Web 页中。集成的数据很容易进行排序和过滤。</p><h4>Spry 窗口组件</h4><p>借助来自适合于 Ajax 的 Spry 框架的窗口组件, 轻松地将常见界面组件 (如列表、表格、选项卡、表单验证和可重复区域) 添加到 Web 页中。</p><h4>Spry 效果</h4><p>借助适合于 Ajax 的 Spry 效果, 轻松地向页面元素添加视觉过渡, 以使它们扩大选取、收缩、渐隐、高光等等。</p><h4>Adobe Photoshop 和 Fireworks 集成</h4><p>直接从 Adobe Photoshop CS3 或 Fireworks CS3 复制和粘贴到 Dreamweaver CS3 中以利用来自您的已完成项目中的原型的资源。</p><h4>浏览器兼容性检查</h4><p>借助全新的浏览器兼容性检查, 节省时间并确保跨浏览器和操作系统的更加一致的体验。生成识别各种浏览器中与 CSS 相关的问题的报告, 而不需要启动浏览器。</p><h4>CSS Advisor 网站</h4><p>借助全新的 CSS Advisor 网站 (具有丰富的用户提供的解决方案和见解的一个在线社区), 查找浏览器特定 CSS 问题的快速解决方案。</p><h4>CSS 布局</h4><p>借助全新的 CSS 布局, 将 CSS 轻松合并到您的项目中。在每个模板中都有大量的注释解释布局, 这样初级和中级设计人员可以快速学会。可以为您的项目自定义每个模板。 </p><h4>CSS 管理</h4><p>轻松移动 CSS 代码: 从行中到标题, 从标题到外部表, 从文档到文档, 或在外部表之间。清除较旧页面中的现有 CSS 从未像现在这样容易。</p><h4>Adobe Device Central CS3</h4><p>使用 Adobe Device Central (现在已集成到整个 Adobe Creative Suite&reg; 3 中), 设计、预览和测试移动设备内容。</p>\r\n            <p align=\"center\"> </p>', '', '', '');
INSERT INTO `youbang_addonarticle` VALUES (62, 5, '<p>Dreamweaver升级到8.0.2后，插入Flash时的代码会有所改变，这是Macromedia为解决IE中的Flash会出现控件激活框而作的更新。要为Flash添加透明等参数有两种方法。</p><p>● 用Dreamweaver的属性面板为插入的Flash添加透明属性，此方法简单实用。</p><p>使插入的Flash处于选择状态，点击属性面板中的“参数”，在随即弹出的参数表中添加一行，参数名为“wmode”，值为“transparent”。使用此方法时注意，若页面中有人工输入的Flash ID，此ID将被删除，请在添加完参数后重新输入ID。<br /><br /></p><p align=\"center\"><img onmousewheel=\"function anonymous()\r\n{\r\nreturn bbimg(this)\r\n}\" style=\"CURSOR: hand\" alt=\"按此在新窗口浏览图片\" src=\"http://file.chinahtml.com/webdesign/1/2007-03-26/6e106c6e74644d1f651e3dabf6157986.jpg\" onload=\"function anonymous()\r\n{\r\nresizepic(this)\r\n}\" align=\"absMiddle\" border=\"0\" /></p><p>&nbsp;</p><p>● 在html代码中为插入的Flash添加透明属性。<br />同样是添加值为“transparent”的“wmode”参数。</p><p><!--加载AC_RunActiveContent.js，此为DW自动生成的文件，无需修改，更改文件目录的时候记得修改这里的路径--><br /><script src=\"Scripts/AC_RunActiveContent.js\" type=\"text/javascript\"></script></p><p><!--下面这段JS修改的时候要注意，一共要修改四个地方：<br />300 是宽度；<br />200 是高度；<br />images/killIEBorder 是路径和文件名，修改时注意，共有两处，还要特别注意，文件名后面不要加“.swf”，此后缀已经写在AC_RunActiveContent.js中--><br /><script type=\"text/javascript\">AC_FL_RunContent( \'codebase\', \'http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0\', \'width\', \'300\', \'height\', \'200\', \'src\', \'images/killIEBorder\', \'quality\', \'high\', \'pluginspage\', \'http://www.macromedia.com/go/getflashplayer\', \'wmode\', \'transparent\', \'movie\', \'images/killIEBorder\' ); //end AC code<br /></script></p><p><!--遇到浏览器禁用javascript时将调用下面这段<noscript></noscript>内的代码，就是Dreamweaver升级到8.0.2之前我们插入flash时的那段代码。<param> 标签针对IE起作用，<embed> 标签针对Firefox和Netscape起作用。--><br /><noscript><br /><object classid=\"clsid:D27CDB6E-AE6D-11cf-96B8-444553540000\" codebase=\"\" width=\"300\" height=\"200\"><br /><param name=\"movie\" value=\"images/killIEBorder.swf\"><br /><param name=\"quality\" value=\"high\"><br /><param name=\"wmode\" value=\"transparent\"><br /><embed src=\"images/killIEBorder.swf\" width=\"300\" height=\"200\" quality=\"high\" pluginspage=\"\" type=\"application/x-shockwave-flash\" wmode=\"transparent\"></embed><br /></object><br /></noscript></p><p>参考文章：IE中的Flash出现“单击以激活并使用此控件”的解决方法【原创·源文件】</p>\r\n            <p align=\"center\"> </p>', '', '', '');
INSERT INTO `youbang_addonarticle` VALUES (63, 5, '<p>一般地讲，样式表（style sheet）就是控制网页内容外观的格式化的规则的集合。可以以三种不同的方式在你的页面中使用CSS：</p><p>代码式（Inline）：写入到代码中的一次性的样式。<br />内嵌式（Embedded）：可控制一个页面中所有元素的样式表<br />外联式（External）：可控制许多页面中的元素的样式表<span class=\"web\"></span></p><p>事实上，许多站点都根据需要把这三种方式结合起来使用。</p><p>在使用CSS时一个需要重点考虑的事实是不同的浏览器以及同一浏览器的不同版本以不同的方式来解析CSS。除了网络浏览器的差异之外，你还要意识到还有很多其他的浏览器，比如听力浏览器，基于电视的浏览器以及Palm pilot和TTY（teletypewriter，远程打字机）一类的手持设备。</p><p>最佳习惯是指什么？<span class=\"web\"></span></p><p>大多数技术都有自己约定俗成的标准。CSS也不例外。虽然并非网络上存在的所有CSS都很规范，但按照现有标准来使用CSS却还是不无裨益的。一般来说，开发人员应尽可能将内容与报告分离开来。这样做的好处在于：</p><p>1：增加站点的寿命</p><p>不规范的样式表可能在当时觉得很方便，但新版本的浏览器出来以后，很可能就会出现兼容性问题。到时逐页修改站点就是一项非常费时的工作同时也使使用CSS失去了意义。</p><p>2：让你的站点对所有的用户以及浏览器都适用。</p><p>有些地方的政府已经立法要求网站必须让残障人士也同样可以浏览。为残障认识设计的浏览设备，比如听力浏览器，对CSS规范性要求极其严格。</p><p>3：让站点更新和维护更加轻松。<span class=\"web\"></span></p><p>使用方式得当的话，CSS可让你在一个页面中的调整快速应用到所有页面中去。</p><p>你首先要做的选择是使用哪一种样式表。当涉及到最佳习惯时，对不同样式表的分析如下：<span class=\"web\"></span></p><p>Inline CSS；简单地说，你应该尽量避免使用。除了一些其他的缺点之外，使用Inline CSS意味着你并没有利用到CSS的真正优点，即你并没有将内容与格式分离开。DW使用Inline CSS主要是为了定位页面元素（这些元素在DW的用户界面中称为“层（layer）”），或者为了使用某个DHTML特效，它需要使用Inline 样式的Javascript来改变一个对象的属性。<span class=\"web\"></span></p><p>Embedded CSS：它也不是最理想的，因为它只能对当前页面施加影响。在更新的过程中，如果某一个页面丢失，将会使站点的风格不一致；另外，当用户浏览你的站点时，每一页都要下载一次样式表信息。</p><p>External CSS：这是你的第一选择。External CSS可以让所有连接到它的页面保持一致的外观风格；提纲挈领，更改一次，轻松更新所有相关页面；让你的页面体积更小，浏览速度更快。其他的一些最佳习惯将在下文分析具体的CSS特性时提及。</p><p>在DW中创建CSS样式表</p><p>在DW中创建CSS样式表时（Text 》CSS Style 》New style sheet），在弹出的对话框中，你有两个选择：新样式表文档（New Style Sheet File） 和只用于当前页（This Document Only）。选中“New Style Sheet File ”你就开始了创建External CSS的过程。这个选项要求你在真正的创建过程之前先命名样式表并为它选定一个保存位置；另外一个选项，This Document Only，则会直接把相关代码写入到页面的部分。</p><p>你也可以在“新样式（New style）”对话框中选择一个现存的样式表来编辑或添加新的定义。</p><p>应该连接到External CSS还是导入？</p><p>创建外部样式表以后，你需要把它附加在每个页面上（或是模板）。要这样做，可以在CSS面板上淡季“附加样式表（Attach Style Sheet）”按纽，此时会弹出连接外部样式表 （Link External Style Sheet）对话框，在上面可以浏览到你的目标样式表的名字，找到以后，你可以选择连接（link） 或者导入（import ）此外部样式表。</p><p>连接是最常用的方式，选择“link”即可把样式表连接到页面。它会在你的页面中加入下面的标记：</p><p>所有支持CSS的浏览器都支持连接选项。如果你想一些比较旧的浏览器（比如Netscape 4.x）也能“看到”这个样式表的话，就要采用下面的方法。</p><p>如果你选择“导入”选项，所用的标记为：</p><p>NetSscape4会完全忽略导入的CSS，而按照连接的CSS来解释页面。这样我们就可以放心使用CSS中的新功能，不必担心浏览器的兼容性问题了。</p><p>CSS属性检查器</p><p>在DW的属性检查器中可以轻易切换到CSS模式。缺省情况下，属性检查器会显示原始的HTML模式下字体标签。点击字体下拉菜单旁边的小“A”，你就可以看到目前可用的CSS样式表，而不是字体标签列表。同时，你也可以轻松切回到HTML模式。</p><p>现成的CSS样式表</p><p>DW中一个令人激动的CSS特性就是它包含了已制作好的CSS样式表。CSS的新用户可以先体验一下。选择File > New，在弹出的新文档对话框中选择选中CSS style sheets，在右边的方框中会出现所有可用的CSS列表。为了实践我们所说的最佳习惯，选择一个标记为“Accessible”的。</p><p>将文档保存在站点文件夹内，然后就可以用上述的方法来把CSS附加在你的文档中了。<span class=\"web\"></span></p><p>设计时间样式表（Design Time style sheets）</p><p>DW的这一特性可以让你在设计视图下工作时将样式表应用到页面，让你对站点的外观有一个更直观的认识。设计时间样式表将不会出现在站点内。从我们的最佳习惯的观点来讲，这一特性是非常有用的。如果你使用同时导入和连接两种方式（如上所述），附加设计时间样式表可以让你使用其中的任何一个来开发站点。当你想看在另一个样式表下页面外观如何时，你可以轻松更改为另一个样式表。<span class=\"web\"></span></p><p>对于要将CSS应用于服务器端（比如ASP, PHP, or ColdFusion）或是要在客户端通过Javascript来存取的开发者来说，设计时间样式表同样有用。服务器端样式表也是处理客户端浏览器对CSS支持不好的又一种方式。但在以前版本的DW中，这种方式却不能让你在设计阶段查看CSS的实际效果。设计时间样式表让你实时查看样式表效果，所以你可在DW中以可视界面工作。另外一个好处就是当你上传站点文件时，你不必再检查整个站点寻找冗余的样式表了。</p><p>验证</p><p>无论你是自己创建样式表还是编辑现有的样式表，验证可以确保你不会误用不标准的标签或错误的代码。DW本身不包含CSS验证程序，你可以使用W3C站点提供的验证服务。<span class=\"web\"></span></p><p>在DW内你可以验证HTML 或DHTML标签（ File > Check Page > Validate Markup (for HTML) 或 File > Check Page > Validate as XML for XHTML.）。在开发基于CSS的站点时，DW提供了很多辅助工具。有了MW MX的帮助，再加上对CSS良好的理解，你就可以开发出能经受时间考验的站点了。( 负责编辑：kaso )</p>\r\n            <p align=\"center\"> </p>', '', '', '');
INSERT INTO `youbang_addonarticle` VALUES (64, 5, '<p>　Dreamweaver CS3集成了AJAX框架Spry，使得我最近对Spry感上了兴趣。<br />　<br />　　再次说明下Spry是Adobe公司推出的AJAX框架，所谓AJAX框架，就先谈目前流行的Web2.0. 1，这些Web2.0站点从页面形式上来看，页面与浏览者的交互很时尚、也很人性化。比如注册信息时输入邮箱不规则，页面立即提示……当然这在Web2.0之前已有应用，但是从来没有哪个时候像现在如此推崇此类即时检测等很符合用户体验的技术，这些脱离不了Javascript脚本的编写，其已属于AJAX的定义范畴。<br />　<br />　　2，当然AJAX不仅仅是这些，比如要做个“TabPane 选项卡”很炫酷的页面展示功能，我们手写Javascript脚本就比较的费事，当然还有很多的在Web2.0站点看到的比如“显示和隐藏”、“淡入淡出”等特效，这些都离不开Javascript，而现在我们也称为AJAX技术。<br />　<br />　　3，AJAX最核心的技术就是数据处理的能力，并能进行远程异步处理的能力，主要集中在对XML数据的数据交互上。<br />　<br />　　所有这些，Javascript占最大比重，XHTML、CSS作为表现形式而存在、因XML涉及的XSLT、XPATH等技术融入其中，还有相关的DOM操作，这些所有有需要功能文件的组合体就构成了AJAX框架（如果可以，你也可以自己写一个AJAX框架给大家使用）。<br />　<br />　　Adobe Spry 介绍页有这样一句话：With Spry， you can use HTML code， CSS code， and a minimal amount of JavaScript to incorporate XML data into your HTML documents， create widgets such as accordions and menu bars， and add different kinds of effects to various page elements.使用Spry框架，用HTML、CSS、JavaScript就可以在HTML文章中展现XML数据、建立诸如炫酷菜单的一些界面，还有其他的一些页面特效（大体上分了三类内容，这也是Spry AJAX框架所具备的）。<br />　<br />　　由此，学习Spry就可以从如下三点开始：Working with Spry widgets Working with Spry Effects Working with Spry XML Data Sets今天介绍的表单检测还属其中内容。<br />　<br />　　在页面中插入“Spry”-“Spry validation text field”文本框之后，在选中该表单元素之后除了显示其元素属性以外，在选择该表单元素之上的蓝色文本“Spry TextField”，属性面板中显示了表单验证相关的选项内容。<br />　<br />　　比如下图就是选择“Type”是“Email Address”的邮件输入检测，触发的动作默认是“Submit”，当然自己也可以选择“Blur”或“Change”，对于这些操作，则要求使用者具备简单的Javascript知识。还可以设置默认文本提示，是否必须填写等。</p><p></p><p>&nbsp; 这些操作，对于有Dreamweaver经验的用户来说，曾经是在DW的脚本行为中的操作，不过那些显示的是弹出警告框，而现在是紧随表单元素之后的即时显示的文字信息，相比较一下哪个更让用户觉得亲切呢？——这就是Web2.0在表现形式上质的飞跃。<br /><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 利用Spry框架提供这些操作不仅生成基于标准的XHTML+CSS代码，还能完成完善用户体验的页面功能，这是在Dreamweaver cs3初试Spry的体会。</p>\r\n            <p align=\"center\"> </p>', '', '', '');
INSERT INTO `youbang_addonarticle` VALUES (65, 5, '说到代码，有人会问：不懂代码能不能制作网页？答案是肯定的。有些人不懂代码同样能制作出非常好的网页。<p>　　在Dreamweaver的设计窗口中你每增加或改变一项内容，会自动生成相应代码。那又产生另一个问题：为什么要了解或者熟悉代码呢？可以说熟悉代码将会使你如虎添翼，能使你的网页锦上添花。超文本标识语言（HTML）为满足更多的需要，增加了许多扩展功能。主页制作者经常使用Java Applet（小程序）、内嵌脚本、插件和其它扩展的HTML功能，充分发挥自己的想像力，就能设计出充满魅力的主页来。</p><p>　　而有些效果的制作只能通过编辑代码来完成，或者通过编辑代码相对容易一些。有好多网友在论坛里提问说本站提供的网页特效代码放到自己的网页中不行，或者出现这样那样的问题。所以了解或者熟悉代码是必要的。</p><p>　　<strong>基本格式</strong></p><p>　<font color=\"#ff0000\"><html></font></p><p>　<font color=\"#ff0000\"><head><br /></font>　<font color=\"#ff0000\"><title></font>站长资讯Dreamweaver教程（<font color=\"#0000ff\">这是你的站点标题，也是浏览网页时标题栏将要显示的内容</font>）<font color=\"#ff0000\"></title></font><br />　<font color=\"#ff0000\"></head></font></p><p>　<font color=\"#ff0000\"><body></font><br />　这里是源代码的主体部分！ <br />　<font color=\"#ff0000\"></body></font></p><p>　<font color=\"#ff0000\"></html></font> </p><p>　　HTML语言使用标志对的方法编写文件，既简单又方便，它通常使用<标志名></标志名>来表示标志的开始和结束(例如 <html></html> 标志对)，因此在HTML文档中这样的标志对都必须是成对使用的。</p><p>　　<strong>1.<html></html></strong></p><p>　　<html>标志用于HTML文档的最前边，用来标识HTML文档的开始。而</html>标志恰恰相反，它放在HTML文档的最后边，用来标识HTMLl文档的结束，它们并没有实际意义，只是告诉浏览器，它正在处理HTML文件。两个标志必须一块使用。</p><p>　　<strong>2.<head></head></strong></p><p>　　HTML文件分为首部和主体两个部分。<head>和</head>构成HTML文档的首部，在此标志对之间可以使用　<title></title>、<script></script>等等标志对，这些标志对都是描述HTML文档相关信息的标志对。两个标志必须一块使用。</p><p>　　<strong>3.<title></title></strong></p><p>　　浏览过网页的人可能都会注意到浏览器窗口最上边蓝色部分显示的文本信息，那些信息一般是网页的主题信息，要将您的网页的主题信息显示到浏览器的顶部，也就是标题栏的方法很简单，就是在<title></title>标志对之间加入您要显示的文本即可。</p><p>　　 注意：　<title></title>标志对只能放在<head></head>标志对之间。</p><p>　　<strong>4.<body></body></strong></p><p>　　<body></body>是HTML文档的主体部分，在此标志对之间可包含<p>、</p>、<h1>、</h1>、<br>、<hr>等等众多的标志，它们所定义的文本、图像等将会在浏览器的框内显示出来。两个标志必须一块使用。<body>标志中还可以加一些其它属性，如：<body oncontextmenu=\"return false\" onselectstart=\"return false\"......></p><p>　　<strong>Dreamweaver有三种“文档”视图窗口：</strong></p><p>　　1、“代码”视图窗口。这是编辑代码的窗口。</p><p>　　2、“设计”视图窗口。这是我们进行编辑文字、添加图片等操作常用的的窗口。</p><p>　　3、“拆分”视图窗口。当我们需要上面两个窗口配合进行编辑时选用这个窗口，我们将要进行的添加代码主要在这个窗口进行。</p><p>　　在使用Dreamweaver制作网页的时候大家要多注意查看代码视图！<br />(负责编辑：blank)</p>\r\n            <p align=\"center\"> </p>', '', '', '');
INSERT INTO `youbang_addonarticle` VALUES (66, 5, '<p align=\"left\">层（Layer）是一种 HTML 页面元素，您可以将它定位在页面上的任意位置。层可以包含文本、图像或其它 HTML 文档。层的出现使网页从二维平面拓展到三维。可以使页面上元素进行重叠和复杂的布局。首先，请看下图： </p><p align=\"left\"><img height=\"513\" alt=\"Dreamweaver教程：层及其应用\" src=\"http://file.chinahtml.com/webdesign/1/2007-06-18/f628b35de38ff3f3c7f4d7b68ced5d4c.gif\" width=\"496\" /></p><p align=\"left\">　　我们首先来做一个层</p><p align=\"left\">　　1、&nbsp;在「窗口」菜单＞选“层”<strong>，</strong>或点「插入」菜单＞布局对象<strong>＞</strong>选“层”。</p><p align=\"left\">　　2、&nbsp;在页面中显示一个层。</p><p align=\"left\">　　3、&nbsp;通过周围的黑色调整柄拖动控制层的大小</p><p align=\"left\">　　4、&nbsp;拖动层左上角的选择柄可以移动层的位置。</p><p align=\"left\">　　5、&nbsp;单击层标记可以选中一个层。</p><p align=\"left\">　　6、&nbsp;在层中可以插入其他任何元素包括图片文字链接表格等。</p><p align=\"left\">　　一个页面中可以画出很多的层，这些层都会列在层面板中。层之间也可以相互重叠。层面板可以通过菜单「窗口」菜单＞选“层”打开。</p><p align=\"left\"><img height=\"206\" alt=\"Dreamweaver教程：层及其应用\" src=\"http://file.chinahtml.com/webdesign/1/2007-06-18/ba15dea1f1bcb77db641c07ecaa1912c.gif\" width=\"216\" /></p><p align=\"left\">　　这里我们需要对几个概念进行解释。层有隐藏和显示的属性。这是层的一个重要属性和以后说到的行为相结合就变成了重要的参数。单击层面板列表的左边，可以打开关闭眼睛。眼睛挣开和关闭表示层的显示和隐藏。</p><p align=\"left\">　　层还有一个概念就是层数，层数决定了重叠时哪个层在上面哪个层在下面。　比如层数为２的层在层数为１的层的上面。改变层数就可以改变层的重叠顺序。</p><p align=\"left\">　　层面板上面还有一个参数就是防止层重叠。一旦选中，页面中层就无法重叠了。　</p><p align=\"left\">　　层还有一种父子关系也就是隶属关系。在层面板中是这样表示的。</p><p align=\"left\"><img height=\"206\" alt=\"Dreamweaver教程：层及其应用\" src=\"http://file.chinahtml.com/webdesign/1/2007-06-18/333c43ceb3c9f60af8153e1658cc9a86.gif\" width=\"216\" /></p><p align=\"left\">　　图中Layer2挂在Layer1的下面。Layer1为父层，Layer2为子层。在页面中拖动Layer1，Layer2也跟着动起来。因为他们已经链在一起了，并且Layer2隶属于Layer1。父层移动会影响到子层。移动layer2层，Layer1层不动。也就是子层不会影响到父层。</p><p align=\"left\">　　要建立这样的一种隶属关系方法很简单。在层面板中按Ctrl键将子层拖拽到父层即可。</p><p align=\"left\">　　［层和表格之间转换］<br /><br /></p><p align=\"left\">　　由于层在网页布局上非常方便，所以，一些人可能不喜欢使用表格或“布局”模式来创建自己的页面，而是喜欢通过层来进行设计。Dreamweaver MX 2004可以使用层来创建自己的布局，然后将它们转换为表格。</p><p align=\"left\">　　 在转换为表格之前，请确保层没有重叠。<span>请执行以下操作：</span><span>选择“修改”<strong>＞</strong>“转换”<strong>＞</strong>“层到表格”。</span>即可显示“转换层为表格”对话框。</p><p align=\"left\"><img height=\"233\" src=\"http://file.chinahtml.com/webdesign/1/2007-06-18/fde4d94c24fd0a8c56d045e0d52edc2f.gif\" width=\"378\" /></p><p align=\"left\"><span>选择所需的选项。</span><span>单击“确定”。 </span><p　　若要将表转换为层，请选择“修改”＞“转换”＞“表格到层”。即可显示“转换表格为层。对< />话框。 </p><p align=\"left\" /><p align=\"left\"><img height=\"125\" alt=\"Dreamweaver教程：层及其应用\" src=\"http://file.chinahtml.com/webdesign/1/2007-06-18/3348177e00769d8dff1a1d2bdf34d2bc.gif\" width=\"341\" /></p><p align=\"left\">　　选择所需的选项。单击“确定”。</p><p align=\"left\">　　层及应用我们就简单介绍到这里。</p>\r\n            <p align=\"center\"> </p>', '', '', '');
INSERT INTO `youbang_addonarticle` VALUES (67, 5, '<table class=\"zh114\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\"><tbody><tr><td><span id=\"huazhonghua\"></span></td></tr></tbody></table><script&nbsp;language=\"JavaScript\"><br />document.oncontextmenu=new&nbsp;Function(\"event.returnValue=false;\");<br />document.onselectstart=new&nbsp;Function(\"event.returnValue=false;\");<br /></script><br />&nbsp;<br />很好用!\r\n            <p align=\"center\"> </p>', '', '', '');
INSERT INTO `youbang_addonarticle` VALUES (68, 5, '说明：<span style=\"COLOR: red\">√</span>属性继承　×不继承　<br />　　　[　]为适应元素类型　无[　]标出为所有元素<br /><br /><span style=\"COLOR: red\">字体</span><br /><span style=\"COLOR: red\">√</span><strong>Font-family</strong><br /><span style=\"COLOR: red\">√</span><strong>Font-size</strong> 9 10 12 14 16 18 24 36 xx-small x-small small medium large x-large xx-large smaller larger<br /><span style=\"COLOR: red\">√</span><strong>Color</strong><br /><span style=\"COLOR: red\">√</span><strong>Font-style</strong> normal italic oblique<br /><span style=\"COLOR: red\">√</span><strong>Line-height</strong> nomal<br /><span style=\"COLOR: red\">√</span><strong>Font-weight</strong> normal bold bolder lighter 100 200 300 400 500 600 700 800 900<br /><span style=\"COLOR: red\">√</span><strong>Text-transform</strong> capitalize uppercase lowercase none<br /><span style=\"COLOR: red\">√</span><strong>Font-variant</strong> normal small-caps<br />×<strong>Text-decoration</strong> none underline overline line-through blink<br /><span style=\"COLOR: red\">√</span><strong>Font</strong><br /><br /><span style=\"COLOR: red\">背景</span><br />×<strong>Background-color</strong><br />×<strong>Background</strong><br />×<strong>Background-image</strong><br />×<strong>Background-attachment</strong> fixed scroll<br />×<strong>Background-repeat</strong> no-repeat repeat repeat-x repeat-y<br />×<strong>Background-position</strong><span style=\"COLOR: brown\">[块、替换]</span><br /><br /><span style=\"COLOR: red\">区块</span><br /><span style=\"COLOR: red\">√</span><strong>Word-spacing</strong> normal<span style=\"COLOR: brown\">[块]</span><br /><span style=\"COLOR: red\">√</span><strong>Letter-spacing</strong> normal<br />×<strong>Vertical-align</strong> baseline sub super top text-top middle bottom text-bottom<span style=\"COLOR: brown\">[内]</span><br /><span style=\"COLOR: red\">√</span><strong>Text-align</strong> left right center justify<span style=\"COLOR: brown\">[块]</span><br />×<strong>Text-indent</strong><span style=\"COLOR: brown\">[块]</span><br />×<strong>White-space</strong> normal pre nowrap<span style=\"COLOR: brown\">[块]</span><br />×<strong>Display</strong> inline block list-item run-in compact marker table inline-table table-row-group table-header-ground table-footer-ground table-row table-column-ground table-column table-cell table-caption none<br /><br /><span style=\"COLOR: red\">边框</span><br />×<strong>Border</strong><br />×<strong>Border-top-color</strong><br />×<strong>Border-top-style</strong> none solid dashed dotted double groove ridge inset outset<br />×<strong>Border-top-width</strong> thin medium thick<br />×<strong>Border-top-Right</strong><br />×<strong>Border-top-Bottom</strong><br />×<strong>Border-top-Left</strong><br />×<strong>Border-top</strong><br />×<strong>Border-right</strong><br />×<strong>Border-bottom</strong><br />×<strong>Border-left</strong><br />×<strong>Border-color</strong><br />×<strong>Border-style</strong><br />×<strong>Border-width</strong><br /><br /><span style=\"COLOR: red\">方框</span><br />×<strong>Width</strong> auto px pt in cm mm pc em ex %<span style=\"COLOR: brown\">[块、替]</span><br />×<strong>Height</strong> auto<span style=\"COLOR: brown\">[块、替]</span><br />×<strong>Float</strong> left right none<br />×<strong>Clear</strong> left right both none<br />×<strong>Margin</strong><br />×<strong>Margin-top</strong><br />×<strong>Margin-right</strong><br />×<strong>Margin-bottom</strong><br />×<strong>Margin-left</strong><br />×<strong>Padding</strong><br />×<strong>Padding-top</strong><br />×<strong>Padding-right</strong><br />×<strong>Padding-bottom</strong><br />×<strong>Padding-left</strong><br /><br /><span style=\"COLOR: red\">列表</span><br />×<strong>List-style-type</strong> disc circle square decimal lower-roman upper-roman lower-alpha upper-alpha onne<span style=\"COLOR: brown\">[显示值为list-item的元素]</span><br />×<strong>List-style-Image</strong><span style=\"COLOR: brown\">[显示值为list-item的元素]</span><br />×<strong>List-style-position</strong> inside outside<span style=\"COLOR: brown\">[显示值为list-item的元素]</span><br /><br /><span style=\"COLOR: red\">定位</span><br />×<strong>Position</strong> absolute relative static<br />×<strong>Visiblility</strong> visible hidden inherit<br />×<strong>Height</strong> auto<br />×<strong>Left</strong> auto<br />×<strong>Top</strong> auto<br />×<strong>Right</strong> auto<br />×<strong>Bottom</strong> auto<br />×<strong>z-index</strong> auto<span style=\"COLOR: brown\">[定位元素]</span><br />×<strong>overflow</strong> visible hidden scroll auto<span style=\"COLOR: brown\">[块、替]</span><br />×<strong>clip</strong> auto<br />\r\n            <p align=\"center\"> </p>', '', '', '');
INSERT INTO `youbang_addonarticle` VALUES (69, 5, '<p>　我们为了优化网页、加快网页下载速度，除了对图片进行优化之外，还需对网页其他各个元素进行优化。在网页编织过程中如能充分利用编辑工具，也可以在中达到优化目的。</p><p>　　下面是Dreamweaver中的一些优化技法:</p><p>　　合理调用CSS</p><p>　　进行网页设计时，运用样式表单CSS来对页面元素进行布置，可以大大地减少HTML代码，这点我们已经很清楚。</p><p>　　方法:</p><p>　　(1)是选定对象，从右键菜单中选择定义好的样式加入; (2)是从样式面板中为对象选择样式;</p><p>　　(3)是在标签选择器上的某标签上单击右键选择样式。</p><p>　　这三种方法虽然获得的页面效果一样，但由于第一种方法会在HTML代码中产生一个“span”标签，如果过多地使用必定会使网页源文件大大增肥，影响下载速度。因此调用CSS时，应采用第二、第三种方法。</p><p>　　为服务器减负</p><p>　　在交互网页中，用户常用表单向服务器提交数据，等待服务器的数据处理、返回浏览器……等待的过程是很令人心烦的。为此，我们在进行网页编辑时，也有必要为服务器作个考虑。Dreamweaver中制作网页，能为服务器减负的工作有一项做得较出色，就是对用户所提交的表单的合法性进行验证，只需在浏览器端进行，不必返回到服务器验证，既减轻了服务器的负担，又让浏览者少一份伤心的等待。 </p><p>　　方法:选中表单，打开“行为”面板，点击“+”号选“验证表单”，然后进行设置即可。顺便提醒，这个验证过程实际上是使用JavaScript在浏览器端作验证。在Dreamweaver里进行上述操作时，它会把这段JavaScript代码放在网页头部与之中，这样必定会使页面的完全显示时间变长，因为浏览器要先下载这段代码才下载其他页面元素。因此，最好在Dreamweaver中打开代码编辑器，把这段脚本程序剪贴到源代码的最后边，让其在最后下载。另外，我们在为网页加入JavaScript脚本特效时，你如果不希望页面出现时马上生效，也不妨这样设置。</p><p>　　自我“减肥”</p><p>　　目前网页“减肥茶”很多，我们随处都可找到，而在Dreamweaver中，我们不必四处找“减肥茶”，利用其自身的“减肥”功能足可以使网页“苗条怡人”。</p><p>　　方法:在“命令”菜单下选择“清除多余的HTML”，即可进行设置对网页冗余代码进行清除。</p><p>　　合理应用表格</p><p>　　我们不但要为服务器减负，对使用的浏览器我们更需要减负，也就是要尽可能地缩短浏览器对页面的解析时间，上面提及的JavaScript脚本加入就是一个例子。影响浏览器对页面解析的还有表格，因为浏览器对表格的解析时间与表格的大小、复杂程度成正比，而我们在Dreamweaver中为了版式的安排，都是通过加入大量的表格来进行定位的，有些人甚至在大表格中套入多重的小表格，这实质上也是在加大浏览器的负担，使页面呈现时间大大加长。为此在使用表格时，应尽量将表格打散，并要尽可能地避免表格的层层相套。</p>\r\n            <p align=\"center\"> </p>', '', '', '');
INSERT INTO `youbang_addonarticle` VALUES (70, 5, '<p align=\"left\">　不知各位是否有手写代码的习惯。例如：要在一个单元格插入一段CSS代码，或者一段Javascript代码，怎么做才比较快捷方便呢？　</p><p align=\"left\">　　虽然Dreamweaver已经为我们提供了代码视图，可是必竟还要手工去查找，还要来回地切换。虽然也可以用代码视图与编辑视图并存的方式，但还要占用一半的屏幕空间，使本来便不大的编辑区域更显得拥挤。有没有更好的办法呢？答案是肯定的。</p><p align=\"left\">　　下面我们以Dreamweaver 8为例，假设大家Dreamweaver面板布局都为默认的布局方式。查看一下属性面板的上方是否有一行小标签。（如果您用的不是MX，标签在状态栏中）例如：你新建一个空白的HTML文档，上面的小标签应该为＜body＞。请看下图：</p><p align=\"left\"><img alt=\"如何使用Dreamweaver方便快捷编辑网页标签\" src=\"http://file.chinahtml.com/webdesign/1/2007-05-23/d262de32b1add6bfd62e764de21ea409.jpg\" /></p><p align=\"left\">　　图上画红框的地方，就是我们今天的主角了。我们先看一下“环绕标签”。在页面上随便打入几个字，选中它们，在右键菜单中选择“环绕标签”，在弹出的环绕标签对话框中输入“＜strong＞”（不包括引号），然后回车。之前被选中的文字是不是已经变成粗体了，到源代码看一下，我们所选中的文字是不是已经被＜strong＞标签包围了？大家可以试着再加入其它的一些标签，如：＜a＞，＜p＞。这里也可以直接输入属性。如：＜p style=\"color:#CC0000\"＞。这里仅大概说明一下，如有疑问，请查看Dreamweaver的帮助。</p><p align=\"left\">　　下面说一下标签选择器的应用方法。</p><p align=\"left\">　　我们将光标移动到刚才加粗的文字里，会发现在＜body＞的后面多了个＜strong＞。这就是说光标所在处的这些文字的外面有＜strong＞的标签，在＜strong＞标签外有＜body＞标签。下面大家再添加一个表格，把光标移动到表格内，看看标签的结构。相信对HTML有些基础的朋友都应该很容易理解的。</p><p align=\"left\">　　假设我们现在要插入一个表格，并将这个表格用CSS来将它下移10个象素。先插入一个表格，然后交光标移动到表格内。这时在标签选择器上应该可以看到这样的字样＜body＞＜table＞＜tr＞＜td＞。然后在table标签上点鼠标右键，会看到有四个选项。删除标签、编辑标签、设置类、设置ID。</p><p align=\"left\">　　删除标签：即是将标签删除。（有一些特殊的标签是不能删除的。例如：＜table＞、＜tr＞、＜td＞、＜body＞...) </p><p align=\"left\">　　编辑标签：给标签附加属性、修改属性等。 </p><p align=\"left\">　　设置类：给这个标签附予一个类。（即CSS的类别） </p><p align=\"left\">　　设置ID：给这个标签附予一个ID。（即CSS的ID）</p><p align=\"left\">　　在这里，我们选择编辑标签，然后在后面加上属性style=\"margin-top:10px\"和正常书写源代码的方式是一样的。然后按下回车。就完成了编辑。如果在Dreamweaver里看不到效果，请用浏览器预览。</p><p align=\"left\">　　还有另外一种方法，也许你会喜欢。选择窗口→标签检查器当你选择某一个标签后，这里会显示出当前选择标签的所有属性。也可以很快地在这里进行编辑。在这里输入的属性不用包括引号，编辑后按回车确定。</p><p align=\"left\">　　这里我们只将方法告诉大家，希望大家能够从中受益。</p>\r\n            <p align=\"center\"> </p>', '', '', '');
INSERT INTO `youbang_addonarticle` VALUES (71, 5, '<p style=\"TEXT-INDENT: 2em\">一个好的“偷懒”方法，就好比充满困难的路途中出现一盏明灯，简化了好多繁杂的工作，让你有更多精力做其他事情，做的更顺手。 </p><p style=\"TEXT-INDENT: 2em\">DW作为的辅助工具之一，已经被人们逐渐掌握并灵活使用，它本身集成了好多实用的东西，给我们的工作带来了很多便利，每当有朋友问我“如何开始学做网页，要看什么书，从哪里入手？”我都会推荐他看DW“帮助”中的“Dreamweaver 入门”，这是最实用的，同时也是离你最近的教程（假设你已经打开DW）。 </p><p style=\"TEXT-INDENT: 2em\">其实很简单，在右栏中找到“代码片段”（Shift+F9），空白处右键“新建代码片段”（或先“新建文件夹”） </p><p style=\"TEXT-INDENT: 2em\" /><center><img src=\"http://file.chinahtml.com/webdesign/1/2007-05-22/ba6273e796d2e65eb9ce8db4ff9b475e.jpg\" border=\"0\" /> </center><p /><p style=\"TEXT-INDENT: 2em\">接下来把你常用的代码片段输入进去。 </p><p style=\"TEXT-INDENT: 2em\" /><center><img src=\"http://file.chinahtml.com/webdesign/1/2007-05-22/e8868d3acac55308b25ace0998c780a0.jpg\" border=\"0\" /> </center><p /><p style=\"TEXT-INDENT: 2em\">输入好后确定，有几个生成几个，显示如下图： </p><p style=\"TEXT-INDENT: 2em\" /><center><img src=\"http://file.chinahtml.com/webdesign/1/2007-05-22/c063cb63b44e62e5a7b8376bf1b38835.jpg\" border=\"0\" /> </center><p /><p style=\"TEXT-INDENT: 2em\">以后要做的就是，当你用到这些代码片段的时候，打开“代码片段”，双击你命名的那“片”就好了……这里我只举了一个简单的例子，举一反三就靠你自己了。 </p><p style=\"TEXT-INDENT: 2em\">同样我们也可以利用系统中已经存在的代码片段，比如添加注释。 </p><p style=\"TEXT-INDENT: 2em\" /><center><img src=\"http://file.chinahtml.com/webdesign/1/2007-05-22/3ac978243fde636b2d1b7d2788dcc271.jpg\" border=\"0\" /> </center><p /><p style=\"TEXT-INDENT: 2em\">当然如果你有其他需要那么你就来这里定义你自己的代码片段吧！ </p>\r\n            <p align=\"center\"> </p>', '', '', '');
INSERT INTO `youbang_addonarticle` VALUES (72, 5, '<p>Dreamweaver升级到8.0.2后，插入Flash时的代码会有所改变，这是Macromedia为解决IE中的Flash会出现控件激活框而作的更新。要为Flash添加透明等参数有两种方法。 </p><p>用Dreamweaver的属性面板为插入的Flash添加透明属性，此方法简单实用。 </p><p>使插入的Flash处于选择状态，点击属性面板中的“参数”，在随即弹出的参数表中添加一行，参数名为“wmode”，值为“transparent”。使用此方法时注意，若页面中有人工输入的Flash ID，此ID将被删除，请在添加完参数后重新输入ID。 </p><p><img src=\"http://file.chinahtml.com/webdesign/1/2007-05-18/23495383c29c86eda4abe95a02a7bcc1.jpg\" border=\"0\" />&nbsp;</p><p>在html代码中为插入的Flash添加透明属性。 </p><p>同样是添加值为“transparent”的“wmode”参数。 </p>\r\n            <p align=\"center\"> </p>', '', '', '');
INSERT INTO `youbang_addonarticle` VALUES (92, 2, '<p>说明： ■为已经升级或修正的功能 □表示需多处同时处理的复杂功能或待验证功能</p>\r\n<p>[新增] <br />\r\n■ 1.搜索关键词批量管理功能; <br />\r\n□ 2.会员中心更换全新UI界面,让用户中心更亲切方便; <br />\r\n■ 2.1 会员中心增加好友动态功能; <br />\r\n■ 2.2 添加会员心情功能(用户可以在会员中心设置自己的状态); <br />\r\n■ 2.3 结构调整,确立会员中心『内容中心』,『我的织梦』结构,今后会员中心会在这两点进行深入挖掘; <br />\r\n■ 2.4 重新设计默认头像,织梦版的大眼更Q; <br />\r\n■ 2.5 会员注册进行调整,网站管理员可以启用会员注册步骤; <br />\r\n■3.单个会员发送短消息功能; <br />\r\n■4.新增V56默认模板,并且同期整理规范模板目录让更多技术爱好者能够参与模板制作中来; <br />\r\n■ 4.1 默认模板添加多种颜色切换功能,让页面展示更具有人性化; <br />\r\n■ 4.2 调整各个功能部分的管理目录,对所有素材文件进行整理; <br />\r\n■5.DedeCMS_V56模板标签手册(CHM)版本; <br />\r\n■6.采用全新Unicode编码词典的php分词器; <br />\r\n■7.使用新的验证码类,并且加入验证安全问题设置,系统验证更加方便管理; <br />\r\n■8.系统管理后台界面调整; <br />\r\n■ 8.1.后台增加快捷搜索功能,可以更方便找到某个操作项 <br />\r\n■9.会员留言管理功能,会员可以自行删除留言,管理员可以从后台删除留言; <br />\r\n■10.搜索关键词批量管理功能; <br />\r\n■11.调整系统管理后台,对一些体验进行修改; <br />\r\n■12.增加提升管理员的操作,管理员可在后台提升系统用户为管理员; <br />\r\n□13.创建\"织梦维基\"平台,打造织梦DedeCMS产品知识库,让学习织梦更简单; <br />\r\n■14.增加一些日志文件的过滤; <br />\r\n■15.增加图集幻灯的显示方式,使其更人性化; <br />\r\n□16.arclist标签支持分页,使其内容调用更加方便快捷; <br />\r\n■17.增加会员模型管理功能,使得会员字段更方便修改; <br />\r\n■18.增加初始化数据安装,用户可以在安装的时候选择初始化数据,数据中含有部分功能的操作样例; <br />\r\n■19.文章内容增加权重功能,可以对文章进行顺序调整; <br />\r\n□20.远程站点部署功能,可以将站点内容生成部署到其他(服务器)站点目录; <br />\r\n□21.模块部分功能进行调整,规范程序目录结构,同时需要调整整体模块风格; <br />\r\n□22.增加邮件订阅功能,网站管理员可以制作订阅专题进行邮件批量发送;</p>\r\n<p>[修复] <br />\r\n■1.单表模型内容不同栏目无法移动的bug; <br />\r\n■2.栏目设置中如果外部链接地址为ftp无法正确解析的问题; <br />\r\n■3.修正积分转换过滤的问题; <br />\r\n■4.短消息弹出框出错提示; <br />\r\n■5.修复数据库类的一个小错误; <br />\r\n■6.修复单表模型点击数统计问题; <br />\r\n■7.修复XSS引起站点安全问题的bug; <br />\r\n■8.修复模板引擎一个全局变量自定义函数不显示的错误; <br />\r\n■9.修复时间选择组件无法选择2010后的问题; <br />\r\n■10.tag标签按照出现文档最多排序 <br />\r\n■11.修复后台会员工作统计中没有对单表模型进行统计的错误; <br />\r\n■12.调整页面部分文件目录结构使得程序更完整; <br />\r\n■13.修复checkbox不选,但显示值全选的bug; <br />\r\n&nbsp;</p>', '', '', '127.0.0.1');
INSERT INTO `youbang_addonarticle` VALUES (106, 5, '<p><font size=\"3\">2010年，新一年，新征程……<br />\r\n织梦大家庭招募能够共同创业的新伙伴。<br />\r\n首要特点：织梦需要的是创业伙伴，而非普通员工。织梦是一个大家共同的创业平台！繁华浮躁的时代，我们需要的是『不浮躁』的人。<br />\r\n我们特制作了这份具有织梦特色的招聘模板页面给熟悉DedeCMS的GGJJDDMM，你如果条件符合并有意加入，请立即联系我们：<br />\r\nP.S. 如果目前你还是个新手，但你非常喜爱DedeCMS并且有足够的自信和学习力，我们同样的给予机会让你加入到织梦大家庭一起参与创业！<br />\r\n我们为加入织梦团队的伙伴，提供住宿，让大家在上海吃住无忧。<br />\r\n<br />\r\n&nbsp;---------------------------------------------------- <br />\r\n|&nbsp;&nbsp;&nbsp; E-mail:hr#dedecms.com(#<=>@)&nbsp;&nbsp;&nbsp; | <br />\r\n&nbsp;---------------------------------------------------- <br />\r\n&nbsp; <br />\r\n{dede:招聘启事 标题=\'织梦大家庭新年招募第一波\' 工作地点=\'上海\' 版本=\'1.0.1\' 时间=\'2010+\'} <br />\r\n&nbsp; 声明 织梦人 <br />\r\n&nbsp; { <br />\r\n&nbsp;&nbsp;&nbsp;&nbsp; ￥性别 = \'不限\'; <br />\r\n&nbsp;&nbsp;&nbsp;&nbsp; ￥年龄 = \'不限\'; <br />\r\n&nbsp;&nbsp;&nbsp;&nbsp; ￥性格 = \'开朗\'; <br />\r\n&nbsp;&nbsp;&nbsp;&nbsp; ￥学历 = \'英雄不问出处\';<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp; ￥团队意识 = \'强\'; <br />\r\n&nbsp;&nbsp;&nbsp;&nbsp; ￥学习能力 = \'非常强\'; <br />\r\n&nbsp;&nbsp;&nbsp;&nbsp; ￥人品 = \'好\'; <br />\r\n&nbsp;&nbsp;&nbsp;&nbsp; ￥烟酒 = \'没瘾\';<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp; ￥薪资 = \'人有多大胆,地有多大产\'; <br />\r\n&nbsp; } <br />\r\n&nbsp; <br />\r\n&nbsp; /*****我们需要这样的策划人员*****/ <br />\r\n&nbsp; 文案策划 继承 织梦人 <br />\r\n&nbsp; { <br />\r\n&nbsp;&nbsp;&nbsp; ￥招聘人数 = \'2+\'; <br />\r\n&nbsp;&nbsp;&nbsp; ￥描述 = \' <br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1.基本的要求可以查看\"声明 织梦人{}\",如果您还符合以上的要求则可以继续阅读下面部分的内容; <br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2.有基本的市场营销观念,能够了解用户并且能够主动挖掘用户潜在商业价值; <br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3.有较强的文字组织能力,能够通过文字有条理的表达、沟通； <br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4.对网站建设方面比较了解，能够知道网站建设中一些基本的流程，并且能够准确地形成文档同用户或技术团队沟通； <br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 5.熟悉各种文案编辑工具的使用，例如：Axure、Dreamweaver、Visio等，能够制作线框图，流程图者优先考虑； <br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6.有制定规范的能力，善于发现问题，分析问题，能够解决问题者最佳； <br />\r\n&nbsp;&nbsp;&nbsp; \'; <br />\r\n&nbsp; } <br />\r\n&nbsp; <br />\r\n&nbsp; /*****这样的是织梦喜欢的网站制作人员*****/ <br />\r\n&nbsp; 网站制作 继承 织梦人 <br />\r\n&nbsp; { <br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <人数>3+</人数> <br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <熟悉DedeCMS>是</熟悉DedeCMS> <br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <织梦标签>会</织梦标签> <br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <技术> <br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <XML>必须</xml> <br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <HTML>必须</HTML> <br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <CSS>必须</CSS> <br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <Javascript>必须</Javascript> <br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <JSON>最佳</JSON> <br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <Ajax>最佳</Ajax> <br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </技术> <br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <熟悉软件><Photoshop/><Fireworks/><Dreamweaver/><Illustrator/></熟悉软件> <br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <跨平台浏览器兼容性>有经验</跨平台浏览器兼容性> <br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <Web标准化>有经验</Web标准化> <br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <沟通能力>很好</沟通能力> <br />\r\n&nbsp; } <br />\r\n&nbsp; <br />\r\n&nbsp; /*****我们需要怎样一个程序员*****/ <br />\r\n&nbsp; 程序员 继承 织梦人 <br />\r\n&nbsp; { <br />\r\n&nbsp;&nbsp;&nbsp;&nbsp; ￥人数 = 5+; <br />\r\n&nbsp;&nbsp;&nbsp;&nbsp; ￥编程经验 > 3年; <br />\r\n&nbsp;&nbsp;&nbsp;&nbsp; ￥技术 in (\'PHP\', \'MySQL\', \'Linux\', \'C/C++\', \'其它\'); <br />\r\n&nbsp;&nbsp;&nbsp;&nbsp; ￥优先 = (￥熟悉 == \'DedeCMS\')? \'是\' : \'Out\'; <br />\r\n&nbsp;&nbsp;&nbsp;&nbsp; ￥自主开发产品 = \'可以\'; <br />\r\n&nbsp;&nbsp;&nbsp;&nbsp; ￥程序员->编码() <br />\r\n&nbsp;&nbsp;&nbsp;&nbsp; { <br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ￥代码习惯 = \'良好\'; <br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ￥结构 = \'清晰\'; <br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ￥命名 = \'规范\'; <br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ￥逻辑 = \'强\'; <br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ￥代码冗余率 = \'低\'; <br />\r\n&nbsp;&nbsp;&nbsp;&nbsp; } <br />\r\n&nbsp;&nbsp;&nbsp;&nbsp; ￥程序员->学习() <br />\r\n&nbsp;&nbsp;&nbsp;&nbsp; { <br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ￥同类产品 = \'熟悉\'; <br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ￥UI/UE = \'经常研究\'; <br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ￥用户习惯 = \'了解\'; <br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ￥新技术 = \'非常关注\'; <br />\r\n&nbsp;&nbsp;&nbsp;&nbsp; } <br />\r\n&nbsp;&nbsp;&nbsp;&nbsp; ￥程序员->开发() <br />\r\n&nbsp;&nbsp;&nbsp;&nbsp; { <br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ￥MySQL索引优化 = \'具有\'; <br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ￥查询优化和存储优化 = \'有经验\'; <br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ￥PHP缓存技术 = \'有经验\'; <br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ￥静态化设计 = \'有经验\'; <br />\r\n&nbsp;&nbsp;&nbsp;&nbsp; } <br />\r\n&nbsp; } <br />\r\n&nbsp; <br />\r\n{/dede:招聘启事 CopyRight=\'2007-2010 DesDev INC.\'} </font><br />\r\n&nbsp;</p>', '', '', '127.0.0.1');
INSERT INTO `youbang_addonarticle` VALUES (107, 4, '<p><span class=\"Apple-style-span\" style=\"font-family: Tahoma, Helvetica, Arial, sans-serif; line-height: 25px; color: rgb(42, 42, 42); \"> <p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \">PHP正则表达式主要用于字符串的模式分割、匹配、查找及替换操作。使用正则表达式在某些简单的环境下可能效率不高，因此如何更好的使用PHP正则表达式需要综合考虑。</p> <p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \">我的PHP正则入门，是起源于网上的一篇文章，这篇文章由浅入深的阐述了PHP正则表达式使用的方法，我觉得是一个很好的入门材料，不过学成还是要 靠个人，在使用的过程中，还是会不断地忘记，因此反反复复的阅读了这篇文章有四五遍，对于其中一些比较困难的知识点，甚至要用很久才能消化，但是只要能见 坚持着看完，你会发现自己对于正则的运用能力就会显著提高。</p> <p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \">PHP正则表达式的定义：</p> <p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \">用于描述字符排列和匹配模式的一种语法规则。它主要用于字符串的模式分割、匹配、查找及替换操作。</p> <p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \">PHP中的正则函数：</p> <p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \">PHP中有两套正则函数，两者功能差不多，分别为：</p> <p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \">一套是由PCRE（Perl Compatible Regular Expression）库提供的。使用“preg_”为前缀命名的函数；</p> <p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \">一套由POSIX（Portable Operating System Interface of Unix ）扩展提供的。使用以“ereg_”为前缀命名的函数；（POSIX的正则函数库，自PHP 5.3以后，就不在推荐使用，从PHP6以后，就将被移除）</p> <p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \">由于POSIX正则即将推出历史舞台，并且PCRE和perl的形式差不多，更利于我们在perl和php之间切换，所以这里重点介绍PCRE正则的使用。</p> <p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \">PCRE正则表达式</p> <p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \">PCRE全称为Perl Compatible Regular Expression，意思是Perl兼容正则表达式。</p> <p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \">在PCRE中，通常将模式表达式（即正则表达式）包含在两个反斜线“/”之间，如“/apple/”。</p> <p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \">正则中重要的几个概念有：元字符、转义、模式单元（重复）、反义、引用和断言，这些概念都可以在文章[1]中轻松的理解和掌握。</p> <p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \">常用的元字符(Meta-character)：</p> <p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \">元字符&nbsp;&nbsp;&nbsp;&nbsp; 说明</p> <p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \">\\A&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 匹配字符串串首的原子</p> <p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \">\\Z&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 匹配字符串串尾的原子</p> <p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \">\\b&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 匹配单词的边界&nbsp;&nbsp;&nbsp;&nbsp; /\\bis/&nbsp;&nbsp; 匹配头为is的字符串&nbsp;&nbsp; /is\\b/&nbsp;&nbsp; 匹配尾为is的字符串&nbsp;&nbsp; /\\bis\\b/ 定界</p> <p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \">\\B&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 匹配除单词边界之外的任意字符&nbsp;&nbsp; /\\Bis/&nbsp;&nbsp; 匹配单词“This”中的“is”</p> <p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \">\\d&nbsp;&nbsp;&nbsp;&nbsp; 匹配一个数字；等价于[0-9]</p> <p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \">\\D&nbsp;&nbsp;&nbsp;&nbsp; 匹配除数字以外任何一个字符；等价于[^0-9]</p> <p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \">\\w&nbsp;&nbsp;&nbsp;&nbsp; 匹配一个英文字母、数字或下划线；等价于[0-9a-zA-Z_]</p> <p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \">\\W&nbsp;&nbsp;&nbsp;&nbsp; 匹配除英文字母、数字和下划线以外任何一个字符；等价于[^0-9a-zA-Z_]</p> <p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \">\\s&nbsp;&nbsp;&nbsp;&nbsp; 匹配一个空白字符；等价于[\\f\\t\\v]</p> <p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \">\\S&nbsp;&nbsp;&nbsp;&nbsp; 匹配除空白字符以外任何一个字符；等价于[^\\f\\t\\v]</p> <p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \">\\f&nbsp;&nbsp;&nbsp;&nbsp; 匹配一个换页符等价于 \\x0c 或 \\cL</p> <p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \">匹配一个换行符；等价于 \\x0a 或 \\cJ</p> <p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \">匹配一个回车符等价于\\x0d 或 \\cM</p> <p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \">\\t&nbsp;&nbsp;&nbsp;&nbsp; 匹配一个制表符；等价于 \\x09\\或\\cl</p> <p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \">\\v&nbsp;&nbsp;&nbsp;&nbsp; 匹配一个垂直制表符；等价于\\x0b或\\ck</p> <p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \">\\oNN&nbsp;&nbsp; 匹配一个八进制数字</p> <p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \">\\xNN&nbsp;&nbsp; 匹配一个十六进制数字</p> <p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \">\\cC&nbsp;&nbsp;&nbsp; 匹配一个控制字符</p> <p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \">模式修正符（Pattern Modifiers）：</p> <p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \">模式修正符在忽略大小写、匹配多行中使用特别多，掌握了这一个修正符，往往能解决我们遇到的很多问题。</p> <p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \">i&nbsp;&nbsp;&nbsp;&nbsp; －可同时匹配大小写字母</p> <p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \">M&nbsp;&nbsp;&nbsp;&nbsp; －将字符串视为多行</p> <p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \">S&nbsp;&nbsp;&nbsp;&nbsp; －将字符串视为单行，换行符做普通字符看待，使“.”匹配任何字符</p> <p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \">X&nbsp;&nbsp;&nbsp;&nbsp; －模式中的空白忽略不计&nbsp;&nbsp;</p> <p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \">U&nbsp;&nbsp;&nbsp;&nbsp; －匹配到最近的字符串</p> <p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \">e&nbsp;&nbsp;&nbsp;&nbsp; －将替换的字符串作为表达使用</p> <p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \">格式：/apple/i匹配“apple”或“Apple”等，忽略大小写。&nbsp;&nbsp;&nbsp;&nbsp; /i</p> <p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \">PCRE的模式单元：</p> <p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \">//1 提取第一位的属性</p> <p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \">/^\\d{2} ([\\W])\\d{2}\\\\1\\d{4}$匹配“12-31-2006”、“09/27/1996”、“86 01 4321”等字符串。但上述正则表达式不匹配“12/34-5678”的格式。这是因为模式“[\\W]”的结果“/”已经被存储。下个位置“\\1”引用 时，其匹配模式也是字符“/”。</p> <p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \">当不需要存储匹配结果时使用非存储模式单元“（？：）”</p> <p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \">例如/(?:a|b|c)(D|E|F)\\\\1g/ 将匹配“aEEg”。在一些正则表达式中，使用非存储模式单元是必要的。否则，需要改变其后引用的顺序。上例还可以写成/（a|b|c）(C|E|F)\\2g/。</p> <p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \">PCRE正则表达式函数：</p> <p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \"><font color=\"#ff0000\">以下为引用的内容：</font></p> <div> <ol style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; list-style-type: none; list-style-position: initial; list-style-image: initial; \"> <li class=\"alt\" style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \"><span><span>preg_match()和preg_match_all() &nbsp;</span></span></li> <li style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \"><span>preg_quote() &nbsp;</span></li> <li class=\"alt\" style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \"><span>preg_split() &nbsp;</span></li> <li style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \"><span>preg_grep() &nbsp;</span></li> <li class=\"alt\" style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \"><span>preg_replace()</span></li> </ol> </div> <p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \">函数的具体使用，我们可以通过PHP手册来找到，下面分享一些平时积累的正则表达式：</p> <p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \">匹配action属性</p> <p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \">&nbsp;</p> <table cellspacing=\"0\" cellpadding=\"6\" border=\"0\" align=\"center\" width=\"95%\" style=\"border-collapse: collapse; border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-color: rgb(0, 153, 204); border-right-color: rgb(0, 153, 204); border-bottom-color: rgb(0, 153, 204); border-left-color: rgb(0, 153, 204); table-layout: fixed; \"> <tbody> <tr> <td bgcolor=\"#ddedfb\" style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; word-wrap: break-word; \"> <p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \"><font color=\"#ff0000\">以下为引用的内容：</font></p> <div> <ol style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; list-style-type: none; list-style-position: initial; list-style-image: initial; \"> <li class=\"alt\" style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \"><span><span class=\"vars\"><font color=\"#dd0000\">$str</font></span><span>&nbsp;=&nbsp;</span><span class=\"string\"><font color=\"#0000ff\">\'\'</font></span><span>; &nbsp;</span></span></li> <li style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \"><span>&nbsp;&nbsp;&nbsp;&nbsp;</span><span class=\"vars\"><font color=\"#dd0000\">$match</font></span><span>&nbsp;=&nbsp;</span><span class=\"string\"><font color=\"#0000ff\">\'\'</font></span><span>; &nbsp;</span></li> <li class=\"alt\" style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \"><span>&nbsp;&nbsp;&nbsp;&nbsp;preg_match_all(</span><span class=\"string\"><font color=\"#0000ff\">\'/\\s+action=\\\"(?!http:)(.*?)\\\"\\s/\'</font></span><span>,&nbsp;</span><span class=\"vars\"><font color=\"#dd0000\">$str</font></span><span>,&nbsp;</span><span class=\"vars\"><font color=\"#dd0000\">$match</font></span><span>); &nbsp;</span></li> <li style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \"><span>&nbsp;&nbsp;&nbsp;&nbsp;print_r(</span><span class=\"vars\"><font color=\"#dd0000\">$match</font></span><span>);&nbsp;</span></li> </ol> </div> </td> </tr> </tbody> </table> <p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \">在正则中使用回调函数</p> <p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \">&nbsp;</p> <table cellspacing=\"0\" cellpadding=\"6\" border=\"0\" align=\"center\" width=\"95%\" style=\"border-collapse: collapse; border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-color: rgb(0, 153, 204); border-right-color: rgb(0, 153, 204); border-bottom-color: rgb(0, 153, 204); border-left-color: rgb(0, 153, 204); table-layout: fixed; \"> <tbody> <tr> <td bgcolor=\"#ddedfb\" style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; word-wrap: break-word; \"> <p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \"><font color=\"#ff0000\">以下为引用的内容：</font></p> <ol class=\"dp-c\" style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; list-style-type: none; list-style-position: initial; list-style-image: initial; \"> <li class=\"alt\" style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \"><span><span class=\"comment\"><font color=\"#008200\">/**&nbsp;</font></span>&nbsp;</span></li> <li style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \"><span><span class=\"comment\"><font color=\"#008200\">&nbsp;&nbsp;&nbsp;*&nbsp;replace&nbsp;some&nbsp;string&nbsp;by&nbsp;callback&nbsp;function&nbsp;</font></span>&nbsp;</span></li> <li class=\"alt\" style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \"><span><span class=\"comment\"><font color=\"#008200\">&nbsp;&nbsp;&nbsp;*&nbsp;</font></span>&nbsp;</span></li> <li style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \"><span><span class=\"comment\"><font color=\"#008200\">&nbsp;&nbsp;&nbsp;*/</font></span><span>&nbsp;</span></span></li> <li class=\"alt\" style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \"><span>&nbsp;&nbsp;</span><span class=\"keyword\"><strong><font color=\"#006699\">function</font></strong></span><span>&nbsp;callback_replace()&nbsp;{ &nbsp;</span></li> <li style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span class=\"vars\"><font color=\"#dd0000\">$url</font></span><span>&nbsp;=&nbsp;</span><span class=\"string\"><font color=\"#0000ff\">\'http://esfang.house.sina.com.cn\'</font></span><span>; &nbsp;</span></li> <li class=\"alt\" style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span class=\"vars\"><font color=\"#dd0000\">$str</font></span><span>&nbsp;=&nbsp;</span><span class=\"string\"><font color=\"#0000ff\">\'\'</font></span><span>; &nbsp;</span></li> <li style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span class=\"vars\"><font color=\"#dd0000\">$str</font></span><span>&nbsp;=&nbsp;preg_replace&nbsp;(&nbsp;</span><span class=\"string\"><font color=\"#0000ff\">\'/(?<=\\saction=\\\")(?!http:)(.*?)(?=\\\"\\s)/e\'</font></span><span>,&nbsp;</span><span class=\"string\"><font color=\"#0000ff\">\'search(\\$url,&nbsp;\\\\1)\'</font></span><span>,&nbsp;</span><span class=\"vars\"><font color=\"#dd0000\">$str</font></span><span>&nbsp;); &nbsp;</span></li> <li class=\"alt\" style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</span></li> <li style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span class=\"func\">echo</span><span>&nbsp;</span><span class=\"vars\"><font color=\"#dd0000\">$str</font></span><span>; &nbsp;</span></li> <li class=\"alt\" style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \"><span>&nbsp;&nbsp;} &nbsp;</span></li> <li style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \"><span>&nbsp;&nbsp; &nbsp;</span></li> <li class=\"alt\" style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \"><span>&nbsp;&nbsp;</span><span class=\"keyword\"><strong><font color=\"#006699\">function</font></strong></span><span>&nbsp;search(</span><span class=\"vars\"><font color=\"#dd0000\">$url</font></span><span>,&nbsp;</span><span class=\"vars\"><font color=\"#dd0000\">$match</font></span><span>){ &nbsp;</span></li> <li style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span class=\"keyword\"><strong><font color=\"#006699\">return</font></strong></span><span>&nbsp;</span><span class=\"vars\"><font color=\"#dd0000\">$url</font></span><span>&nbsp;.&nbsp;</span><span class=\"string\"><font color=\"#0000ff\">\'/\'</font></span><span>&nbsp;.&nbsp;</span><span class=\"vars\"><font color=\"#dd0000\">$match</font></span><span>; &nbsp;</span></li> <li class=\"alt\" style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \"><span>&nbsp;&nbsp;}&nbsp;</span></li> </ol> </td> </tr> </tbody> </table> <p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \">带断言的正则匹配</p> <p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \">&nbsp;</p> <table cellspacing=\"0\" cellpadding=\"6\" border=\"0\" align=\"center\" width=\"95%\" style=\"border-collapse: collapse; border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-color: rgb(0, 153, 204); border-right-color: rgb(0, 153, 204); border-bottom-color: rgb(0, 153, 204); border-left-color: rgb(0, 153, 204); table-layout: fixed; \"> <tbody> <tr> <td bgcolor=\"#ddedfb\" style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; word-wrap: break-word; \"> <p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \"><font color=\"#ff0000\">以下为引用的内容：</font></p> <ol class=\"dp-c\" style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; list-style-type: none; list-style-position: initial; list-style-image: initial; \"> <li class=\"alt\" style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \"><span><span class=\"vars\"><font color=\"#dd0000\">$match</font></span><span>&nbsp;=&nbsp;</span><span class=\"string\"><font color=\"#0000ff\">\'\'</font></span><span>; &nbsp;</span></span></li> <li style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \"><span>&nbsp;&nbsp;&nbsp;</span><span class=\"vars\"><font color=\"#dd0000\">$str</font></span><span>&nbsp;=&nbsp;</span><span class=\"string\"><font color=\"#0000ff\">\'xxxxxx.com.cn&nbsp;<strong>bold&nbsp;font</strong>&nbsp; <p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \">paragraph&nbsp;text</p> \'</font></span><span>; &nbsp;</span></li> <li class=\"alt\" style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \"><span>&nbsp;&nbsp;&nbsp;preg_match_all&nbsp;(&nbsp;</span><span class=\"string\"><font color=\"#0000ff\">\'/(?<=<(\\w{1})>).*(?=<\\/\\1>)/\'</font></span><span>,&nbsp;</span><span class=\"vars\"><font color=\"#dd0000\">$str</font></span><span>,&nbsp;</span><span class=\"vars\"><font color=\"#dd0000\">$match</font></span><span>&nbsp;); &nbsp;</span></li> <li style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \"><span>&nbsp;&nbsp;&nbsp;</span><span class=\"func\">echo</span><span>&nbsp;</span><span class=\"string\"><font color=\"#0000ff\">\"匹配没有属性的HTML标签中的内容：\"</font></span><span>; &nbsp;</span></li> <li class=\"alt\" style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \"><span>&nbsp;&nbsp;&nbsp;print_r&nbsp;(&nbsp;</span><span class=\"vars\"><font color=\"#dd0000\">$match</font></span><span>&nbsp;);&nbsp;</span></li> </ol> </td> </tr> </tbody> </table> <p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \">替换HTML源码中的地址</p> <p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \">&nbsp;</p> <table cellspacing=\"0\" cellpadding=\"6\" border=\"0\" align=\"center\" width=\"95%\" style=\"border-collapse: collapse; border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-color: rgb(0, 153, 204); border-right-color: rgb(0, 153, 204); border-bottom-color: rgb(0, 153, 204); border-left-color: rgb(0, 153, 204); table-layout: fixed; \"> <tbody> <tr> <td bgcolor=\"#ddedfb\" style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; word-wrap: break-word; \"> <p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \"><font color=\"#ff0000\">以下为引用的内容：</font></p> <ol style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; list-style-type: none; list-style-position: initial; list-style-image: initial; \"> <li class=\"alt\" style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \"><span><span class=\"vars\"><font color=\"#dd0000\">$form_html</font></span><span>&nbsp;=&nbsp;preg_replace&nbsp;(&nbsp;</span><span class=\"string\"><font color=\"#0000ff\">\'/(?<=\\saction=\\\"|\\ssrc=\\\"|\\shref=\\\")(?!http:|javaｓｃｒｉｐｔ)(.*?)(?=\\\"\\s)/e\'</font></span><span>,&nbsp;</span><span class=\"string\"><font color=\"#0000ff\">\'add_url(\\$url,&nbsp;\\\'\\\\1\\\')\'</font></span><span>,&nbsp;</span><span class=\"vars\"><font color=\"#dd0000\">$form_html</font></span><span>&nbsp;);&nbsp;</span></span></li> </ol> </td> </tr> </tbody> </table> <p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \">最后，正则工具虽然强大，但是从效率和编写时间上来讲，有的时候可能没有explode来的更直接，对于一些紧急或者要求不高的任务，简单、粗暴的方法也许更好。</p> <p style=\"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \">而对于preg和ereg两个系列之间的执行效率，曾看到文章说preg要更快一点，具体由于使用ereg的时候并不多，而且也要推出历史舞台了，再加个个人更偏好于PCRE的方式，所以笔者就不做比较了，熟悉的朋友可以发表下意见，谢谢。</p> </span></p>', '', '', '127.0.0.1');

-- ----------------------------
-- Table structure for youbang_addoncommodities
-- ----------------------------
DROP TABLE IF EXISTS `youbang_addoncommodities`;
CREATE TABLE `youbang_addoncommodities`  (
  `aid` bigint(13) NOT NULL DEFAULT 0,
  `typeid` int(11) NOT NULL DEFAULT 0,
  `componentid` smallint(6) NOT NULL DEFAULT 0,
  `arcrank` smallint(6) NOT NULL DEFAULT 0,
  `mid` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `click` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '访问量',
  `title` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品名称',
  `litpic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '缩略图',
  `mainpic` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主图',
  `body` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '详情',
  `userip` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ' ',
  `senddate` datetime(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `endtime` datetime(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `flag` set('c','h','p','f','s','j','a','b') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `usespec` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否启用商品规格',
  `price` float(10, 2) NULL DEFAULT NULL COMMENT '价格',
  `selled` int(11) NULL DEFAULT NULL COMMENT '销量',
  `area` int(11) NULL DEFAULT NULL COMMENT '商品所在地',
  `cost` int(11) NULL DEFAULT NULL COMMENT '库存',
  PRIMARY KEY (`aid`) USING BTREE,
  INDEX `channel`(`componentid`, `arcrank`, `mid`, `click`, `title`, `litpic`, `senddate`, `flag`, `endtime`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of youbang_addoncommodities
-- ----------------------------
INSERT INTO `youbang_addoncommodities` VALUES (184, 34, 1, 0, 0, 0, ' 霜朋有有 有有', '/img/2019/7/16/2d9068041734765671bd9a0878e6179c.png', '/img/2019/7/17/cbb6927ce331a4d63bc7e394e073a19d.png-/img/2019/7/17/b577c1c11d236df14bf98187be2f1f74.png', 'PHA+5ZWG5ZOB6K+m5oOFPC9wPg==', ' ', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, '0', NULL, NULL, NULL, NULL);
INSERT INTO `youbang_addoncommodities` VALUES (215, 31, 1, 0, 0, 0, ' fg', '/img/2019/7/20/78528902594ec2abdb60e42398630e6c.png', '', '', ' ', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `youbang_addoncommodities` VALUES (217, 31, 1, 0, 0, 0, ' dsfsdf', '/img/2019/7/20/78528902594ec2abdb60e42398630e6c.png', '/img/2019/7/20/c0be71511c0caa44624b523a66f77dbd.png-/img/2019/7/20/ee43fdf496abc0986a079095ff283beb.png-/img/2019/7/20/54bc9d290fe9b75677c2e4f700df9679.png-/img/2019/7/20/f8ac93524c151c2044b91712b0f5b09c.png', 'PHA+ZnNkZnNkZnNkZiBzZGY8L3A+', ' ', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `youbang_addoncommodities` VALUES (216, 31, 1, 0, 0, 0, ' sd', '/img/2019/7/20/78528902594ec2abdb60e42398630e6c.png', '', '', ' ', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `youbang_addoncommodities` VALUES (231, 33, 1, 0, 0, 0, ' 验证码设置梵蒂冈第三方', '', '', '', ' ', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `youbang_addoncommodities` VALUES (1867, 31, 0, 0, 0, 0, ' 商品1名称', '/img/2019/8/13/cb6aae1ed81bb3622ed3ebc5c63b4027.png', '/img/2019/8/13/2006b253839de15eb437aeefc2e5c6c9.png-/img/2019/8/13/1d5ed50631a946dabf24f491466a7b82.png', 'PHVsIGlkPSJwYXJhbWV0ZXItYnJhbmQiIGNsYXNzPSJwLXBhcmFtZXRlci1saXN0IGxpc3QtcGFkZGluZ2xlZnQtMiIgc3R5bGU9Imxpc3Qtc3R5bGUtdHlwZTogbm9uZTsiPjxsaT48cD7lk4HniYzvvJombmJzcDs8YSBocmVmPSJodHRwczovL2xpc3QuamQuY29tL2xpc3QuaHRtbD9jYXQ9NjcwLDY3Nyw2ODAmdGlkPTY4MCZldj1leGJyYW5kXzEyNDQ4NCIgY2xzdGFnPSJzaGFuZ3BpbnxrZXljb3VudHxwcm9kdWN0fHBpbnBhaV8xIiB0YXJnZXQ9Il9ibGFuayIgc3R5bGU9Im1hcmdpbjogMHB4OyBwYWRkaW5nOiAwcHg7IGNvbG9yOiByZ2IoOTQsIDEwNSwgMTczKTsgdGV4dC1kZWNvcmF0aW9uLWxpbmU6IG5vbmU7Ij7np5HotYvvvIhLTEVWVu+8iTwvYT48L3A+PC9saT48bGk+PHA+5ZWG5ZOB5ZCN56ew77ya56eR6LWL77yIS0xFVlbvvIlLRDQ4R1U4ODAtMzJBMTYwVDwvcD48L2xpPjxsaT48cD7llYblk4HnvJblj7fvvJo0MTU3NzQwNjI3OTwvcD48L2xpPjxsaT48cD7llYblk4Hmr5vph43vvJoxMDAuMDBnPC9wPjwvbGk+PGxpPjxwPuWVhuWTgeS6p+WcsO+8mumfqeWbvTwvcD48L2xpPjxsaT48cD7otKflj7fvvJpLRDQ4R1U4ODAtMzJBMTYwVDwvcD48L2xpPjxsaT48cD7popHnjofvvJpERFI0IDM0MDAtMzIwMDwvcD48L2xpPjxsaT48cD7lpJbop4LnibnlvoHvvJrpqaznlLLmnaE8L3A+PC9saT48bGk+PHA+5bmz5Y+w77ya5Y+w5byP5py65YaF5a2YPC9wPjwvbGk+PGxpPjxwPua4uOaIj+aAp+iDve+8muWPkeeDp+e6pzwvcD48L2xpPjxsaT48cD7ljZXlpZflrrnph4/vvJo4R0I8L3A+PC9saT48L3VsPjxwIGNsYXNzPSJtb3JlLXBhciIgc3R5bGU9Im1hcmdpbi10b3A6IC01cHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4IDIwcHggMHB4IDBweDsgdGV4dC1hbGlnbjogcmlnaHQ7Ij48YSBocmVmPSJodHRwczovL2l0ZW0uamQuY29tLzQxNTc3NDA2Mjc5Lmh0bWwjcHJvZHVjdC1kZXRhaWwiIGNsYXNzPSJKLW1vcmUtcGFyYW0iIHN0eWxlPSJtYXJnaW46IDBweDsgcGFkZGluZzogMHB4OyBjb2xvcjogcmdiKDAsIDkwLCAxNjApOyB0ZXh0LWRlY29yYXRpb24tbGluZTogbm9uZTsiPuabtOWkmuWPguaVsDxzcGFuIGNsYXNzPSJ0eHQtYXJyIj4mZ3Q7Jmd0Ozwvc3Bhbj48L2E+PC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyB0ZXh0LWFsaWduOiBjZW50ZXI7Ij48aW1nIGNsYXNzPSIiIHNyYz0iaHR0cHM6Ly9pbWcxMC4zNjBidXlpbWcuY29tL2ltZ3pvbmUvamZzL3QxLzMwNjkzLzUvMTk1NS8xNjU5MzAvNWM2M2UxNDdFODYxMjAyZDgvMThlYmVhYTIzMWVmYTI5OS5qcGciIHN0eWxlPSJtYXJnaW46IDBweDsgcGFkZGluZzogMHB4OyBib3JkZXI6IDBweDsgdmVydGljYWwtYWxpZ246IG1pZGRsZTsgd2lkdGg6IGF1dG87IGhlaWdodDogYXV0bzsgbWF4LXdpZHRoOiAxMDAlOyIvPjxpbWcgY2xhc3M9IiIgc3JjPSJodHRwczovL2ltZzEwLjM2MGJ1eWltZy5jb20vaW1nem9uZS9qZnMvdDEvOTkwNS83LzE0NDQzLzEzNzY3Ni81YzYzZTE0N0U4MzVlMmJmZS9kYzEyMDgyNTllMGU2NTgyLmpwZyIgc3R5bGU9Im1hcmdpbjogMHB4OyBwYWRkaW5nOiAwcHg7IGJvcmRlcjogMHB4OyB2ZXJ0aWNhbC1hbGlnbjogbWlkZGxlOyB3aWR0aDogYXV0bzsgaGVpZ2h0OiBhdXRvOyBtYXgtd2lkdGg6IDEwMCU7Ii8+PGltZyBjbGFzcz0iIiBzcmM9Imh0dHBzOi8vaW1nMTAuMzYwYnV5aW1nLmNvbS9pbWd6b25lL2pmcy90MzAwNDkvNTMvMTU0MTYzNDI0MS8xMDI0MTkvZmFmOWVhNC81Y2UzOTg1Mk4wYWNiMzI4YS5qcGciIHN0eWxlPSJtYXJnaW46IDBweDsgcGFkZGluZzogMHB4OyBib3JkZXI6IDBweDsgdmVydGljYWwtYWxpZ246IG1pZGRsZTsgdGV4dC1hbGlnbjogbGVmdDsgd2lkdGg6IGF1dG87IGhlaWdodDogYXV0bzsgbWF4LXdpZHRoOiAxMDAlOyIvPjxpbWcgY2xhc3M9IiIgc3JjPSJodHRwczovL2ltZzEwLjM2MGJ1eWltZy5jb20vaW1nem9uZS9qZnMvdDEvMjEzODMvMzgvNjgzMS8zMDcxNTYvNWM2M2UxNDhFMzc4NjVhMDIvOTFkYTU3YzVlMjE2NjAwNS5qcGciIHN0eWxlPSJtYXJnaW46IDBweDsgcGFkZGluZzogMHB4OyBib3JkZXI6IDBweDsgdmVydGljYWwtYWxpZ246IG1pZGRsZTsgd2lkdGg6IGF1dG87IGhlaWdodDogYXV0bzsgbWF4LXdpZHRoOiAxMDAlOyIvPjxpbWcgY2xhc3M9IiIgc3JjPSJodHRwczovL2ltZzEwLjM2MGJ1eWltZy5jb20vaW1nem9uZS9qZnMvdDEvMjk3MzgvMTAvNjgyNC8yODIyNjkvNWM2M2UxNDdFN2MxM2FjMDMvM2Y5ODU2YzdkZWI4NTEzZi5qcGciIHN0eWxlPSJtYXJnaW46IDBweDsgcGFkZGluZzogMHB4OyBib3JkZXI6IDBweDsgdmVydGljYWwtYWxpZ246IG1pZGRsZTsgd2lkdGg6IGF1dG87IGhlaWdodDogYXV0bzsgbWF4LXdpZHRoOiAxMDAlOyIvPjxpbWcgY2xhc3M9IiIgc3JjPSJodHRwczovL2ltZzEwLjM2MGJ1eWltZy5jb20vaW1nem9uZS9qZnMvdDEvMTQxODYvMzcvNjcxMy8xNjg1NDgvNWM2M2UxNDhFMjJjZDI2NDYvMDExZTk1YWM2OTJjZmVjZS5qcGciIHN0eWxlPSJtYXJnaW46IDBweDsgcGFkZGluZzogMHB4OyBib3JkZXI6IDBweDsgdmVydGljYWwtYWxpZ246IG1pZGRsZTsgd2lkdGg6IGF1dG87IGhlaWdodDogYXV0bzsgbWF4LXdpZHRoOiAxMDAlOyIvPjxpbWcgY2xhc3M9IiIgc3JjPSJodHRwczovL2ltZzEwLjM2MGJ1eWltZy5jb20vaW1nem9uZS9qZnMvdDEvMTQ2NTUvMTQvNjk0NC8xNzM3OTYvNWM2M2UxNDhFYmExYmM4OGUvNzJiMmM0NzYwYTdkNDIzNi5qcGciIHN0eWxlPSJtYXJnaW46IDBweDsgcGFkZGluZzogMHB4OyBib3JkZXI6IDBweDsgdmVydGljYWwtYWxpZ246IG1pZGRsZTsgd2lkdGg6IGF1dG87IGhlaWdodDogYXV0bzsgbWF4LXdpZHRoOiAxMDAlOyIvPjxpbWcgY2xhc3M9IiIgc3JjPSJodHRwczovL2ltZzEwLjM2MGJ1eWltZy5jb20vaW1nem9uZS9qZnMvdDEvNDMxMjMvNC8zNDAzLzE2NTEwNy81Y2NlN2UxNUVjODg2ZTU2MS84ZWIxMTljNGZkM2ExMjFkLmpwZyIgc3R5bGU9Im1hcmdpbjogMHB4OyBwYWRkaW5nOiAwcHg7IGJvcmRlcjogMHB4OyB2ZXJ0aWNhbC1hbGlnbjogbWlkZGxlOyB0ZXh0LWFsaWduOiBsZWZ0OyB3aWR0aDogYXV0bzsgaGVpZ2h0OiBhdXRvOyBtYXgtd2lkdGg6IDEwMCU7Ii8+PGltZyBjbGFzcz0iIiBzcmM9Imh0dHBzOi8vaW1nMTAuMzYwYnV5aW1nLmNvbS9pbWd6b25lL2pmcy90MS80NzY1OS80MC81OTQvMzMxMDYyLzVjZTM5MmM2RWY5ZjA4OTdlLzNmMjBkMjIwM2ExYmY0ODYuanBnIiBzdHlsZT0ibWFyZ2luOiAwcHg7IHBhZGRpbmc6IDBweDsgYm9yZGVyOiAwcHg7IHZlcnRpY2FsLWFsaWduOiBtaWRkbGU7IHRleHQtYWxpZ246IGxlZnQ7IHdpZHRoOiBhdXRvOyBoZWlnaHQ6IGF1dG87IG1heC13aWR0aDogMTAwJTsiLz48aW1nIGNsYXNzPSIiIHNyYz0iaHR0cHM6Ly9pbWcxMC4zNjBidXlpbWcuY29tL2ltZ3pvbmUvamZzL3QxLzMxMDk5LzI4LzE0OTgxLzUzNjEzNy81Y2MwMGQ0NEUwODM2Y2YwZi85ZTU1ZGZjZTcwNjQ1ZTQwLmpwZyIgc3R5bGU9Im1hcmdpbjogMHB4OyBwYWRkaW5nOiAwcHg7IGJvcmRlcjogMHB4OyB2ZXJ0aWNhbC1hbGlnbjogbWlkZGxlOyB0ZXh0LWFsaWduOiBsZWZ0OyB3aWR0aDogYXV0bzsgaGVpZ2h0OiBhdXRvOyBtYXgtd2lkdGg6IDEwMCU7Ii8+PC9wPjxwPjxici8+PC9wPg==', ' ', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `youbang_addoncommodities` VALUES (1869, 33, 0, 0, 0, 0, ' F E', '', '', '', ' ', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `youbang_addoncommodities` VALUES (1908, 33, 0, 0, 0, 0, '可爱小层', '/img/2019/8/21/a94ce8c109f3334d7b5fb96a1b67a7ef.png', '', 'PGgxIGlkPSJiZF9hcnRpY2xlX3RpdGxlIiBjbGFzcz0iYXJ0aWNsZV9fdGl0bGUiIHN0eWxlPSJ0cmFuc2l0aW9uOiBtYXJnaW4gMC4xcyBsaW5lYXIgMHMsIHBhZGRpbmcgMC4xcyBsaW5lYXIgMHMsIHdpZHRoIDAuMXMgbGluZWFyIDBzLCBoZWlnaHQgMC4xcyBsaW5lYXIgMHM7IG1hcmdpbjogMHB4IDBweCAxMHB4OyBvdmVyZmxvdy13cmFwOiBicmVhay13b3JkOyBjb2xvcjogcmdiKDY0LCA2NCwgNjQpOyBsZXR0ZXItc3BhY2luZzogMXB4OyBmb250LXNpemU6IDIwcHg7IGxpbmUtaGVpZ2h0OiAzMHB4OyBmb250LWZhbWlseTogJnF1b3Q7UGluZ0ZhbmcgU0MmcXVvdDssICZxdW90O0hpcmFnaW5vIFNhbnMgR0ImcXVvdDssICZxdW90O01pY3Jvc29mdCBZYUhlaSZxdW90OywgJnF1b3Q7V2VuUXVhbllpIE1pY3JvIEhlaSZxdW90OywgJnF1b3Q7SGVsdmV0aWNhIE5ldWUmcXVvdDssIEFyaWFsLCBzYW5zLXNlcmlmOyB3aGl0ZS1zcGFjZTogbm9ybWFsOyBiYWNrZ3JvdW5kLWNvbG9yOiByZ2IoMjU1LCAyNTUsIDI1NSk7Ij7lrovmhafkuZTnprvlqZrmnKrliLAy5pyI77yM5Y+I5LiA4oCc56We6K+d56C054Gt4oCd77yM5piO5pif5Lus5rC46L+c5pWZ5LiN5Lya5L2g55yf5q2j55qE54ix5oOFPC9oMT48cCBjbGFzcz0iZmxvYXQtLWxlZnQgYXJ0aWNsZS1pbmZvIGFydGljbGVfX2luZm8iIHN0eWxlPSJ0cmFuc2l0aW9uOiBtYXJnaW4gMC4xcyBsaW5lYXIgMHMsIHBhZGRpbmcgMC4xcyBsaW5lYXIgMHMsIHdpZHRoIDAuMXMgbGluZWFyIDBzLCBoZWlnaHQgMC4xcyBsaW5lYXIgMHM7IG1hcmdpbi10b3A6IDBweDsgbWFyZ2luLWJvdHRvbTogMHB4OyBjb2xvcjogcmdiKDE1MywgMTUzLCAxNTMpOyBmb250LXNpemU6IDE0cHg7IGZsb2F0OiBsZWZ0OyI+PHNwYW4gY2xhc3M9InNvdXJjZSIgc3R5bGU9InRyYW5zaXRpb246IG1hcmdpbiAwLjFzIGxpbmVhciwgcGFkZGluZyAwLjFzIGxpbmVhciwgd2lkdGggMC4xcyBsaW5lYXIsIGhlaWdodCAwLjFzIGxpbmVhcjsgY29sb3I6IHJnYigxMDIsIDEwMiwgMTAyKTsgbWFyZ2luLXJpZ2h0OiA2cHg7IHZlcnRpY2FsLWFsaWduOiAtMnB4OyI+5LiN5LiA5qC355qE6KeS5bqmPC9zcGFuPjx0aW1lIHN0eWxlPSJ0cmFuc2l0aW9uOiBtYXJnaW4gMC4xcyBsaW5lYXIsIHBhZGRpbmcgMC4xcyBsaW5lYXIsIHdpZHRoIDAuMXMgbGluZWFyLCBoZWlnaHQgMC4xcyBsaW5lYXI7IHZlcnRpY2FsLWFsaWduOiAtMnB4OyBjb2xvcjogcmdiKDE2NiwgMTY2LCAxNjYpOyI+5pio5aSpMTI6MDk8L3RpbWU+PC9wPjxwPjxpZnJhbWUgc2Nyb2xsaW5nPSJubyIgbmFtZT0iaWZyMjMzMjQ5MSIgZnJhbWVib3JkZXI9IjAiIGRhdGEtc3JjPSJodHRwOi8vc2hvdy4zLm1lZGlhdi5jb20vcz92ZXI9MS4yLjExJmFtcDtlbmlmcj0xJmFtcDtzaG93aWQ9S3FsQjNSJmFtcDt0eXBlPTEmYW1wO29mPTImYW1wO25ld2Y9MSZhbXA7dWlkPTE1NjYzNDc4NTQzMjkyNTYyNjE0NTgwMjU2Mzc3NTU4JmFtcDtpc2lmcj0wJmFtcDt0aXRsZT0lRTUlQUUlOEIlRTYlODUlQTclRTQlQjklOTQlRTclQTYlQkIlRTUlQTklOUElRTYlOUMlQUElRTUlODglQjAyJUU2JTlDJTg4JUVGJUJDJThDJUU1JThGJTg4JUU0JUI4JTgwJUUyJTgwJTlDJUU3JUE1JTlFJUU4JUFGJTlEJUU3JUEwJUI0JUU3JTgxJUFEJUUyJTgwJTlEJUVGJUJDJThDJUU2JTk4JThFJmFtcDtyZWZ1cmw9JmFtcDtzaXplPTU2NHgxMDgiIGRhdGEtc2Nyb2xsLWludmlldz0ieWVzIiBkYXRhLWludmlld2VkPSJ5ZXMiIHNyYz0iaHR0cDovL3Nob3cuMy5tZWRpYXYuY29tL3M/dmVyPTEuMi4xMSZlbmlmcj0xJnNob3dpZD1LcWxCM1ImdHlwZT0xJm9mPTImbmV3Zj0xJnVpZD0xNTY2MzQ3ODU0MzI5MjU2MjYxNDU4MDI1NjM3NzU1OCZpc2lmcj0wJnRpdGxlPSVFNSVBRSU4QiVFNiU4NSVBNyVFNCVCOSU5NCVFNyVBNiVCQiVFNSVBOSU5QSVFNiU5QyVBQSVFNSU4OCVCMDIlRTYlOUMlODglRUYlQkMlOEMlRTUlOEYlODglRTQlQjglODAlRTIlODAlOUMlRTclQTUlOUUlRTglQUYlOUQlRTclQTAlQjQlRTclODElQUQlRTIlODAlOUQlRUYlQkMlOEMlRTYlOTglOEUmcmVmdXJsPSZzaXplPTU2NHgxMDgiIHN0eWxlPSJ0cmFuc2l0aW9uOiBtYXJnaW4gMC4xcyBsaW5lYXIsIHBhZGRpbmcgMC4xcyBsaW5lYXIsIHdpZHRoIDAuMXMgbGluZWFyLCBoZWlnaHQgMC4xcyBsaW5lYXI7IHdpZHRoOiA1NjRweDsgaGVpZ2h0OiAxMDhweDsiPjwvaWZyYW1lPjwvcD48cCBzdHlsZT0idHJhbnNpdGlvbjogbWFyZ2luIDAuMXMgbGluZWFyIDBzLCBwYWRkaW5nIDAuMXMgbGluZWFyIDBzLCB3aWR0aCAwLjFzIGxpbmVhciAwcywgaGVpZ2h0IDAuMXMgbGluZWFyIDBzOyBtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDE2cHg7Ij7lnKjnianmrLLmqKrmtYHnmoTml7bku6Pph4zvvIznnJ/niLHkuKTkuKrlrZfkvLzkuY7lj5jlvpfotormnaXotorpmr7ku6Xmib7lr7vjgILkuIDluqbmhJ/liqjkuobml6DmlbDnvZHlj4vnmoTmmI7mmJ/niLHmg4XmlYXkuovvvIzmnIDlkI7og73lpJ/lloTnu4jnmoTljbTlj6rmnInlr6Xlr6XmlbDkurrjgILmr5TlpoLor7TpgJrov4fnlLXop4bliafjgIrlpKrpmLPnmoTlkI7oo5TjgIvogIznu5PnvJjnmoTlrovmhafkuZTlrovku7Lln7rlpKvlpofvvIznlJzonJzml7bliLvmmK/miYDmnInkurrnkIbmg7PkuYvkuK3nmoTniLHmg4XmqKHmoLfvvIzkvYbmmK/mnIDnu4jkuZ/msqHog73mkpHov4fkuKTlubTkuYvkuYXjgII8L3A+PHA+PGltZyBkYXRhLXNyYz0iaHR0cDovL3AyLnFoaW1nczQuY29tL3QwMTNlNDkxNDg1MTg4YTNjYjEuanBnIiBjbGFzcz0ibG9hZGVkIiBzcmM9Imh0dHA6Ly9wMi5xaGltZ3M0LmNvbS90MDEzZTQ5MTQ4NTE4OGEzY2IxLmpwZyIgZGF0YS13YXMtcHJvY2Vzc2VkPSJ0cnVlIiBzdHlsZT0idHJhbnNpdGlvbjogbWFyZ2luIDAuMXMgbGluZWFyLCBwYWRkaW5nIDAuMXMgbGluZWFyLCB3aWR0aCAwLjFzIGxpbmVhciwgaGVpZ2h0IDAuMXMgbGluZWFyOyBib3JkZXI6IG5vbmU7IGRpc3BsYXk6IGJsb2NrOyB2ZXJ0aWNhbC1hbGlnbjogbWlkZGxlOyBiYWNrZ3JvdW5kOiBub25lOyB3aWR0aDogNTY0cHg7IG1heC13aWR0aDogMTAwJTsgaGVpZ2h0OiAzMDlweDsgbWFyZ2luLWJvdHRvbTogMTI2cHg7Ii8+PC9wPjxwPjxzcGFuIGNsYXNzPSJtLWdwbHVzMy1hZC1pY29uIiBzdHlsZT0idHJhbnNpdGlvbjogbWFyZ2luIDAuMXMgbGluZWFyIDBzLCBwYWRkaW5nIDAuMXMgbGluZWFyIDBzLCB3aWR0aCAwLjFzIGxpbmVhciAwcywgaGVpZ2h0IDAuMXMgbGluZWFyIDBzOyBwb3NpdGlvbjogYWJzb2x1dGU7IHJpZ2h0OiAwcHg7IGRpc3BsYXk6IGlubGluZS1ibG9jazsgYmFja2dyb3VuZDogdXJsKCZxdW90O2h0dHBzOi8vcDQuc3NsLnFoaW1nczAuY29tL2QvaW5uL2NhZjliNWE4L2ljb24ucG5nJnF1b3Q7KTsgd2lkdGg6IDMwcHg7IGhlaWdodDogMTVweDsgYm90dG9tOiAwcHg7IHotaW5kZXg6IDM7Ij48L3NwYW4+PC9wPjx1bCBjbGFzcz0ibS1ncGx1czMtbm9ybWFsLXdpZGdldC13cmFwcGVyIGxpc3QtcGFkZGluZ2xlZnQtMiIgc3R5bGU9Imxpc3Qtc3R5bGUtdHlwZTogbm9uZTsiPjxsaT48cD48YSBocmVmPSJodHRwOi8vcmVkaXJlY3Quc2ltYmEudGFvYmFvLmNvbS9yZD9jPXVuJnc9dW5pb25zZW0maz03NDE3NWYxM2M3NDE1N2RmJnA9bW1fMjY2MzIzNjBfODg1ODc5N18xMzE4OTYwOTkmYj1xaWhvb197a2V5d29yZGlkfSZmPWh0dHBzOi8vdWxhbmQudGFvYmFvLmNvbS9zZW0vdGJzZWFyY2g/a2V5d29yZD0lRTclOUQlQTElRTglQTIlOEQlRTUlQTUlQjMlRTUlODYlQUMlRTclOEYlOEElRTclOTElOUElRTclQkIlOTIyMDE4JUU2JTk2JUIwJUU2JUFDJUJFJUU1JThBJUEwJUU1JThFJTlBJUU1JThBJUEwJUU5JTk1JUJGJUU2JUFDJUJFJUU4JUJGJTg3JUU4JTg2JTlEJUU2JUI1JUI0JUU4JUEyJThEJUU3JUE3JThCJUU1JTg2JUFDJUU0JUJGJTlEJUU2JTlBJTk2JUU2JUIzJTk1JUU1JTg1JUIwJUU3JUJCJTkyJUU1JUFFJUI2JUU1JUIxJTg1JUU2JTlDJThEJiIgY2xhc3M9Im0tZ3BsdXMzLXBpYyBtLWdwbHVzMy1saW5rIiB0YXJnZXQ9Il9ibGFuayIgc3R5bGU9InRyYW5zaXRpb246IG1hcmdpbiAwLjFzIGxpbmVhciAwcywgcGFkZGluZyAwLjFzIGxpbmVhciAwcywgd2lkdGggMC4xcyBsaW5lYXIgMHMsIGhlaWdodCAwLjFzIGxpbmVhciAwczsgY29sb3I6IHJnYigwLCAwLCAwKTsgdGV4dC1kZWNvcmF0aW9uLWxpbmU6IG5vbmU7IGRpc3BsYXk6IGJsb2NrOyBvdmVyZmxvdzogaGlkZGVuOyBwb3NpdGlvbjogcmVsYXRpdmU7IHdpZHRoOiAxMDVweDsgaGVpZ2h0OiAxMDhweDsgbGVmdDogMHB4OyI+PGltZyBzcmM9Imh0dHBzOi8vcDEuc3NsLnFoaW1nczMuY29tL2RyLzMwMF8zMDBfL3QwMWIzNWEwYmYwMTM1NGVhMmYuanBnIiBhbHQ9IiIgc3R5bGU9InRyYW5zaXRpb246IDAuNXM7IGJvcmRlcjogbm9uZTsgZGlzcGxheTogYmxvY2s7IHZlcnRpY2FsLWFsaWduOiBtaWRkbGU7IGJhY2tncm91bmQ6IG5vbmU7IHdpZHRoOiAxMDVweDsgaGVpZ2h0OiAxMDhweDsgbWF4LXdpZHRoOiAxMDAlOyIvPjwvYT48L3A+PHAgc3R5bGU9InRyYW5zaXRpb246IHRvcCAwLjVzIGVhc2UgMHM7IG1hcmdpbi1ib3R0b206IDE2cHg7IHotaW5kZXg6IDI7IHBvc2l0aW9uOiByZWxhdGl2ZTsgdG9wOiAwcHg7IG1hcmdpbi10b3A6IDBweCAhaW1wb3J0YW50OyI+PGJyLz48L3A+PC9saT48bGk+PHA+PGEgaHJlZj0iaHR0cDovL3JlZGlyZWN0LnNpbWJhLnRhb2Jhby5jb20vcmQ/Yz11biZ3PXVuaW9uc2VtJms9NzQxNzVmMTNjNzQxNTdkZiZwPW1tXzI2NjMyMzYwXzg4NTg3OTdfMTMxODk2MDk5JmI9cWlob29fe2tleXdvcmRpZH0mZj1odHRwczovL3VsYW5kLnRhb2Jhby5jb20vc2VtL3Ric2VhcmNoP2tleXdvcmQ9JUU3JTlDJTlGJUU3JTlBJUFFJUU2JUFGJTlCJUU2JUFGJTlCJUU5JTlFJThCJUU1JUE1JUIzJUU1JUI5JUIzJUU1JUJBJTk1JUU1JThBJUEwJUU3JUJCJTkyJUU2JTlEJUJGJUU5JTlFJThCJUU2JUEzJTg5JUU5JTlFJThCMjAxOCVFNSU4NiVBQyVFNSVBRCVBMyVFNiU5NiVCMCVFNiVBQyVCRSVFOSU5RiVBOSVFNyU4OSU4OCVFNiVCMCVCNCVFOCVCMiU4MiVFNiVBRiU5QiVFNyVCMyVCQiVFNSVCOCVBNiVFNCVCQyU5MSVFOSU5NyVCMiVFOSU5RSU4QiYiIGNsYXNzPSJtLWdwbHVzMy1waWMgbS1ncGx1czMtbGluayIgdGFyZ2V0PSJfYmxhbmsiIHN0eWxlPSJ0cmFuc2l0aW9uOiBtYXJnaW4gMC4xcyBsaW5lYXIgMHMsIHBhZGRpbmcgMC4xcyBsaW5lYXIgMHMsIHdpZHRoIDAuMXMgbGluZWFyIDBzLCBoZWlnaHQgMC4xcyBsaW5lYXIgMHM7IGNvbG9yOiByZ2IoMCwgMCwgMCk7IHRleHQtZGVjb3JhdGlvbi1saW5lOiBub25lOyBkaXNwbGF5OiBibG9jazsgb3ZlcmZsb3c6IGhpZGRlbjsgcG9zaXRpb246IHJlbGF0aXZlOyB3aWR0aDogMTA1cHg7IGhlaWdodDogMTA4cHg7IGxlZnQ6IDBweDsiPjxpbWcgc3JjPSJodHRwczovL3AxLnNzbC5xaGltZ3MzLmNvbS9kci8zMDBfMzAwXy90MDE3MzFkYzg2MTRlYmE3MmNmLmpwZyIgYWx0PSIiIHN0eWxlPSJ0cmFuc2l0aW9uOiAwLjVzOyBib3JkZXI6IG5vbmU7IGRpc3BsYXk6IGJsb2NrOyB2ZXJ0aWNhbC1hbGlnbjogbWlkZGxlOyBiYWNrZ3JvdW5kOiBub25lOyB3aWR0aDogMTA1cHg7IGhlaWdodDogMTA4cHg7IG1heC13aWR0aDogMTAwJTsiLz48L2E+PC9wPjxwIHN0eWxlPSJ0cmFuc2l0aW9uOiB0b3AgMC41cyBlYXNlIDBzOyBtYXJnaW4tYm90dG9tOiAxNnB4OyB6LWluZGV4OiAyOyBwb3NpdGlvbjogcmVsYXRpdmU7IHRvcDogMHB4OyBtYXJnaW4tdG9wOiAwcHggIWltcG9ydGFudDsiPjxici8+PC9wPjwvbGk+PGxpPjxwPjxhIGhyZWY9Imh0dHA6Ly9yZWRpcmVjdC5zaW1iYS50YW9iYW8uY29tL3JkP2M9dW4mdz11bmlvbnNlbSZrPTc0MTc1ZjEzYzc0MTU3ZGYmcD1tbV8yNjYzMjM2MF84ODU4Nzk3XzEzMTg5NjA5OSZiPXFpaG9vX3trZXl3b3JkaWR9JmY9aHR0cHM6Ly91bGFuZC50YW9iYW8uY29tL3NlbS90YnNlYXJjaD9rZXl3b3JkPSVFNyU5OSVCRCVFOCU4OSVCMiVFNyU5QyU5RiVFNyU5QSVBRSVFNSU5QiU5QiVFNSVBRCVBMyVFNSVCOSVCRiVFNSU5QyVCQSVFOCU4OCU5RSVFOSU5RSU4QiVFNiU5OCVBNSVFNyVBNyU4QiVFOCU4OCU5RSVFOCVCOSU4OCVFOSU5RSU4QiVFNSVBNSVCMyVFNiU4OCU5MCVFNCVCQSVCQSVFNyU4RSVCMCVFNCVCQiVBMyVFOCU4OCU5RSVFOSU5RSU4QiVFNSU4MSVBNSVFOCVCQSVBQiVFNiU5MyU4RCVFOSU5RSU4QiVFOCVCNyVCMyVFOCU4OCU5RSVFOSU5RSU4QiVFNSVBNSVCMyYiIGNsYXNzPSJtLWdwbHVzMy1waWMgbS1ncGx1czMtbGluayIgdGFyZ2V0PSJfYmxhbmsiIHN0eWxlPSJ0cmFuc2l0aW9uOiBtYXJnaW4gMC4xcyBsaW5lYXIgMHMsIHBhZGRpbmcgMC4xcyBsaW5lYXIgMHMsIHdpZHRoIDAuMXMgbGluZWFyIDBzLCBoZWlnaHQgMC4xcyBsaW5lYXIgMHM7IGNvbG9yOiByZ2IoMCwgMCwgMCk7IHRleHQtZGVjb3JhdGlvbi1saW5lOiBub25lOyBkaXNwbGF5OiBibG9jazsgb3ZlcmZsb3c6IGhpZGRlbjsgcG9zaXRpb246IHJlbGF0aXZlOyB3aWR0aDogMTA1cHg7IGhlaWdodDogMTA4cHg7IGxlZnQ6IDBweDsiPjxpbWcgc3JjPSJodHRwczovL3AxLnNzbC5xaGltZ3MzLmNvbS9kci8zMDBfMzAwXy90MDFhMGRkMzcwNTcyOWYyYWNlLmpwZyIgYWx0PSIiIHN0eWxlPSJ0cmFuc2l0aW9uOiAwLjVzOyBib3JkZXI6IG5vbmU7IGRpc3BsYXk6IGJsb2NrOyB2ZXJ0aWNhbC1hbGlnbjogbWlkZGxlOyBiYWNrZ3JvdW5kOiBub25lOyB3aWR0aDogMTA1cHg7IGhlaWdodDogMTA4cHg7IG1heC13aWR0aDogMTAwJTsiLz48L2E+PC9wPjxwIHN0eWxlPSJ0cmFuc2l0aW9uOiB0b3AgMC41cyBlYXNlIDBzOyBtYXJnaW4tYm90dG9tOiAxNnB4OyB6LWluZGV4OiAyOyBwb3NpdGlvbjogcmVsYXRpdmU7IHRvcDogMHB4OyBtYXJnaW4tdG9wOiAwcHggIWltcG9ydGFudDsiPjxici8+PC9wPjwvbGk+PGxpPjxwPjxhIGhyZWY9Imh0dHA6Ly9yZWRpcmVjdC5zaW1iYS50YW9iYW8uY29tL3JkP2M9dW4mdz11bmlvbnNlbSZrPTc0MTc1ZjEzYzc0MTU3ZGYmcD1tbV8yNjYzMjM2MF84ODU4Nzk3XzEzMTg5NjA5OSZiPXFpaG9vX3trZXl3b3JkaWR9JmY9aHR0cHM6Ly91bGFuZC50YW9iYW8uY29tL3NlbS90YnNlYXJjaD9rZXl3b3JkPUNPTk5ZJUU1JUJBJUI3JUU1JUIwJUJDMjAxNSVFNyVBNyU4QiVFNSU4NiVBQyVFNiU5NiVCMCVFNiVBQyVCRSVFOCU4OCU5RSVFOCVCOSU4OCVFOCVBMyVBNCVFNSU4MSVBNSVFNyVCRSU4RSVFOCVCQSVBQiVFOCVBMyVBNCVFNyVCQiU4MyVFNSU4QSU5RiVFOCVBMyVBNCVFNSVBNSVCMyVFOCU5MCU5RCVFNSU4RCU5QyVFOCVBMyVBNCVFNiU5MyU4RCVFNiU5QyU4RCVFOCVBMyU4NTgzOTgmIiBjbGFzcz0ibS1ncGx1czMtcGljIG0tZ3BsdXMzLWxpbmsiIHRhcmdldD0iX2JsYW5rIiBzdHlsZT0idHJhbnNpdGlvbjogbWFyZ2luIDAuMXMgbGluZWFyIDBzLCBwYWRkaW5nIDAuMXMgbGluZWFyIDBzLCB3aWR0aCAwLjFzIGxpbmVhciAwcywgaGVpZ2h0IDAuMXMgbGluZWFyIDBzOyBjb2xvcjogcmdiKDAsIDAsIDApOyB0ZXh0LWRlY29yYXRpb24tbGluZTogbm9uZTsgZGlzcGxheTogYmxvY2s7IG92ZXJmbG93OiBoaWRkZW47IHBvc2l0aW9uOiByZWxhdGl2ZTsgd2lkdGg6IDEwNXB4OyBoZWlnaHQ6IDEwOHB4OyBsZWZ0OiAwcHg7Ij48aW1nIHNyYz0iaHR0cHM6Ly9wMS5zc2wucWhpbWdzMy5jb20vZHIvMzAwXzMwMF8vdDAxZDdlNDRjMmMyODY4MzJkZS5qcGciIGFsdD0iIiBzdHlsZT0idHJhbnNpdGlvbjogMC41czsgYm9yZGVyOiBub25lOyBkaXNwbGF5OiBibG9jazsgdmVydGljYWwtYWxpZ246IG1pZGRsZTsgYmFja2dyb3VuZDogbm9uZTsgd2lkdGg6IDEwNXB4OyBoZWlnaHQ6IDEwOHB4OyBtYXgtd2lkdGg6IDEwMCU7Ii8+PC9hPjwvcD48cCBzdHlsZT0idHJhbnNpdGlvbjogdG9wIDAuNXMgZWFzZSAwczsgbWFyZ2luLWJvdHRvbTogMTZweDsgei1pbmRleDogMjsgcG9zaXRpb246IHJlbGF0aXZlOyB0b3A6IDBweDsgbWFyZ2luLXRvcDogMHB4ICFpbXBvcnRhbnQ7Ij48YnIvPjwvcD48L2xpPjxsaT48cD48YSBocmVmPSJodHRwOi8vcmVkaXJlY3Quc2ltYmEudGFvYmFvLmNvbS9yZD9jPXVuJnc9dW5pb25zZW0maz03NDE3NWYxM2M3NDE1N2RmJnA9bW1fMjY2MzIzNjBfODg1ODc5N18xMzE4OTYwOTkmYj1xaWhvb197a2V5d29yZGlkfSZmPWh0dHBzOi8vdWxhbmQudGFvYmFvLmNvbS9zZW0vdGJzZWFyY2g/a2V5d29yZD0yMDE4JUU2JTk2JUIwJUU2JUFDJUJFJUU5JTlGJUE5JUU3JTg5JTg4JUU1JTg2JUFDJUU1JUFEJUEzJUU1JThBJUEwJUU1JThFJTlBJUU3JUJFJUJEJUU3JUJCJTkyJUU2JUEzJTg5JUU2JTlDJThEJUU1JUE1JUIzJUU0JUI4JUFEJUU5JTk1JUJGJUU2JUFDJUJFJUU1JUFFJUJEJUU2JTlEJUJFJUU1JUE0JUE3JUU3JUEwJTgxJUU4JTgzJTk2bW0lRTYlQTMlODklRTglQTIlODQlRTYlQTMlODklRTglQTElQTMlRTUlQTQlOTYlRTUlQTUlOTcmIiBjbGFzcz0ibS1ncGx1czMtcGljIG0tZ3BsdXMzLWxpbmsiIHRhcmdldD0iX2JsYW5rIiBzdHlsZT0idHJhbnNpdGlvbjogbWFyZ2luIDAuMXMgbGluZWFyIDBzLCBwYWRkaW5nIDAuMXMgbGluZWFyIDBzLCB3aWR0aCAwLjFzIGxpbmVhciAwcywgaGVpZ2h0IDAuMXMgbGluZWFyIDBzOyBjb2xvcjogcmdiKDAsIDAsIDApOyB0ZXh0LWRlY29yYXRpb24tbGluZTogbm9uZTsgZGlzcGxheTogYmxvY2s7IG92ZXJmbG93OiBoaWRkZW47IHBvc2l0aW9uOiByZWxhdGl2ZTsgd2lkdGg6IDEwOHB4OyBoZWlnaHQ6IDEwOHB4OyBsZWZ0OiAwcHg7Ij48aW1nIHNyYz0iaHR0cHM6Ly9wMS5zc2wucWhpbWdzMy5jb20vZHIvMzAwXzMwMF8vdDAxNzc0MTZjNmM1YzRjMzA4NC5qcGciIGFsdD0iIiBzdHlsZT0idHJhbnNpdGlvbjogMC41czsgYm9yZGVyOiBub25lOyBkaXNwbGF5OiBibG9jazsgdmVydGljYWwtYWxpZ246IG1pZGRsZTsgYmFja2dyb3VuZDogbm9uZTsgd2lkdGg6IDEwOHB4OyBoZWlnaHQ6IDEwOHB4OyBtYXgtd2lkdGg6IDEwMCU7Ii8+PC9hPjwvcD48cCBzdHlsZT0idHJhbnNpdGlvbjogdG9wIDAuNXMgZWFzZSAwczsgbWFyZ2luLWJvdHRvbTogMTZweDsgei1pbmRleDogMjsgcG9zaXRpb246IHJlbGF0aXZlOyB0b3A6IDBweDsgbWFyZ2luLXRvcDogMHB4ICFpbXBvcnRhbnQ7Ij48YnIvPjwvcD48L2xpPjwvdWw+PHA+PHNwYW4gY2xhc3M9Im0tZ3BsdXMzLWFkLWljb24iIHN0eWxlPSJ0cmFuc2l0aW9uOiBtYXJnaW4gMC4xcyBsaW5lYXIgMHMsIHBhZGRpbmcgMC4xcyBsaW5lYXIgMHMsIHdpZHRoIDAuMXMgbGluZWFyIDBzLCBoZWlnaHQgMC4xcyBsaW5lYXIgMHM7IHBvc2l0aW9uOiBhYnNvbHV0ZTsgcmlnaHQ6IDBweDsgZGlzcGxheTogaW5saW5lLWJsb2NrOyBiYWNrZ3JvdW5kOiB1cmwoJnF1b3Q7aHR0cHM6Ly9wNC5zc2wucWhpbWdzMC5jb20vZC9pbm4vY2FmOWI1YTgvaWNvbi5wbmcmcXVvdDspOyB3aWR0aDogMzBweDsgaGVpZ2h0OiAxNXB4OyBib3R0b206IDBweDsgei1pbmRleDogMzsiPjwvc3Bhbj48L3A+PHAgc3R5bGU9InRyYW5zaXRpb246IG1hcmdpbiAwLjFzIGxpbmVhciAwcywgcGFkZGluZyAwLjFzIGxpbmVhciAwcywgd2lkdGggMC4xcyBsaW5lYXIgMHMsIGhlaWdodCAwLjFzIGxpbmVhciAwczsgbWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAxNnB4OyI+5aaC5LuK5Y+M5a6L56a75ama55qE5paw6Ze76L+Y5pyq6L+H5Y67MuS4quaciO+8jOWPiOacieS4gOS4queIseaDheelnuivneKAnOegtOeBreS6huKAne+8jOi/meWwseaYr+abvue7j+WcqOiKguebruOAiuaWsOWpmuaXpeiusOOAi+S5i+S4reWkp+WPl+asoui/jueahOWFt+aDoOWWhOWuieWusOi0pOWkq+Wmh+OAgjjmnIgxOOaXpe+8jOWPjOaWueiJuuS6uuWQjOWxnueahEhCIEVudOekvuWuo+W4g+S6huS4pOS4quS6uuWGs+Wumuemu+WpmueahOa2iOaBr++8jOWFtuS4reensOaYr+WFt+aDoOWWhOWQkeazlemZouaPkOWHuueahOemu+Wpmuiwg+ino+eUs+ivt+OAgjwvcD48cD48aW1nIGRhdGEtc3JjPSJodHRwOi8vcDIucWhpbWdzNC5jb20vdDAxNzViZWYxYjFjNGU5Y2ZjNC5qcGciIGNsYXNzPSJsb2FkZWQiIHNyYz0iaHR0cDovL3AyLnFoaW1nczQuY29tL3QwMTc1YmVmMWIxYzRlOWNmYzQuanBnIiBkYXRhLXdhcy1wcm9jZXNzZWQ9InRydWUiIHN0eWxlPSJ0cmFuc2l0aW9uOiBtYXJnaW4gMC4xcyBsaW5lYXIsIHBhZGRpbmcgMC4xcyBsaW5lYXIsIHdpZHRoIDAuMXMgbGluZWFyLCBoZWlnaHQgMC4xcyBsaW5lYXI7IGJvcmRlcjogbm9uZTsgZGlzcGxheTogYmxvY2s7IHZlcnRpY2FsLWFsaWduOiBtaWRkbGU7IGJhY2tncm91bmQ6IG5vbmU7IHdpZHRoOiA1NjRweDsgbWF4LXdpZHRoOiAxMDAlOyBoZWlnaHQ6IDIyMnB4OyIvPjwvcD48cD48YnIvPjwvcD4=', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `youbang_addoncommodities` VALUES (1909, 33, 0, 0, 0, 0, '蜀犬吠日发', '/img/2019/8/21/de55afdbb342d0e3e6b34cc5522c054e.png', '', 'PHAgc3R5bGU9Im1hcmdpbi10b3A6IDBweDsgbWFyZ2luLWJvdHRvbTogMHB4OyBwYWRkaW5nOiAwcHggMzhweDsgdGV4dC1zaXplLWFkanVzdDogMTAwJTsgZm9udC1zaXplOiAxNnB4OyBjb2xvcjogcmdiKDc3LCA3OSwgODMpOyBsZXR0ZXItc3BhY2luZzogMXB4OyBsaW5lLWhlaWdodDogMjhweDsiPumDkeengOWmjeiiq+S4reWbvee7j+e6quWFrOWPuOi1t+iviei/nee6pui1lOWBvzIw5Lq/6Z+p5YWD77yM5Lit6Z+p5Lik5Zu95rOV6Zmi5Z2H5Yik5YW26LSl6K+J44CCPC9wPjxwPjxzcGFuIGNsYXNzPSJpY29uIHF1b3RhdGlvbi1sZWZ0IiBzdHlsZT0iYmFja2dyb3VuZC1pbWFnZTogLXdlYmtpdC1pbWFnZS1zZXQodXJsKCZxdW90Oy8vbi5zaW5haW1nLmNuL2ZpbmFuY2UvcGFnZS9lbnQvaW1hZ2VzLzA5MDhfenljX2ljb25zLnBuZyZxdW90OykgMXgsIHVybCgmcXVvdDsvL24uc2luYWltZy5jbi9maW5hbmNlL3BhZ2UvZW50L2ltYWdlcy8wOTA4X3p5Y19pY29uczJ4LnBuZyZxdW90OykgMngpOyBiYWNrZ3JvdW5kLXJlcGVhdDogbm8tcmVwZWF0OyB3aWR0aDogMjhweDsgaGVpZ2h0OiAyNHB4OyBiYWNrZ3JvdW5kLXBvc2l0aW9uOiAtMjY4cHggLTEwMHB4OyBwb3NpdGlvbjogYWJzb2x1dGU7IHRvcDogMHB4OyBsZWZ0OiAwcHg7Ij48L3NwYW4+PC9wPjxwPjxpbWcgYWx0PSLpg5Hnp4Dlpo0iIHNyYz0iaHR0cHM6Ly9uLnNpbmFpbWcuY24vZW50L3RyYW5zZm9ybS81MjAvdzUwMGg4MjAvMjAxOTA4MjEvNTVmMi1pY21wZnhhODgwNzc0Ni5qcGciIHN0eWxlPSJib3JkZXI6IDBweCBub25lOyB2ZXJ0aWNhbC1hbGlnbjogbWlkZGxlOyBkaXNwbGF5OiBibG9jazsgbWFyZ2luOiAwcHggYXV0bzsgbWF4LXdpZHRoOiA2NDBweDsiLz48c3BhbiBjbGFzcz0iaW1nX2Rlc2NyIiBzdHlsZT0ibGluZS1oZWlnaHQ6IDIwcHg7IHBhZGRpbmc6IDZweCAwcHg7IGZvbnQtc2l6ZTogMTZweDsgbWFyZ2luOiA1cHggYXV0bzsgZGlzcGxheTogaW5saW5lLWJsb2NrOyB6b29tOiAxOyB0ZXh0LWFsaWduOiBsZWZ0OyBmb250LXdlaWdodDogYm9sZDsiPumDkeengOWmjTwvc3Bhbj48L3A+PHAgc3R5bGU9Im1hcmdpbi10b3A6IDBweDsgbWFyZ2luLWJvdHRvbTogMzBweDsgcGFkZGluZzogMHB4OyB0ZXh0LXNpemUtYWRqdXN0OiAxMDAlOyI+44CA44CA5paw5rWq5aix5LmQ6K6vIDjmnIgyMeaXpe+8jOacieWqkuS9k+aKpemBk+WOn+WwkeWls+aXtuS7o+aIkOWRmEplc3NpY2HvvIjpg5Hnp4Dlpo08YSB0YXJnZXQ9Il9ibGFuayIgaHJlZj0iaHR0cDovL3dlaWJvLmNvbS8zNTQ3NjQyNDE3P3p3PWVudCIgY2xhc3M9Ind0X2FydGljbGVfbGluayIgc3R5bGU9InRleHQtZGVjb3JhdGlvbi1saW5lOiBub25lOyBvdXRsaW5lOiAwcHg7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogdHJhbnNwYXJlbnQ7IGNvbG9yOiByZ2IoMjUwLCA4MywgMTExKTsiPlvlvq7ljZpdPC9hPu+8ieWboOi/neWPjeWQiOe6puiAjOiiq+S4reWbvee7j+e6quWFrOWPuOe0oui1lDIw5Lq/6Z+p5YWD77yI57qmMTIwMOS4h+S6uuawkeW4ge+8ieOAguWcqOS4reWbveWSjOmfqeWbvei/m+ihjOeahOivieiuvOS4remDkeengOWmjeaOpei/nui0peivie+8jOebruWJjeWlueW3suWQkemfqeWbveWkp+azlemZouaPkOWHuuS6huS4iuivieOAgjwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAzMHB4OyBwYWRkaW5nOiAwcHg7IHRleHQtc2l6ZS1hZGp1c3Q6IDEwMCU7Ij7jgIDjgIDmja7mgonvvIzkuK3lm73otLXlt57mlrDmuYPlhazlj7jkuI7mtbflroHmlrDmuYPlhazlj7gyMDE25bm0MuaciOS4jumDkeengOWmjeeahOe7j+e6quWFrOWPuOmfqeWbvei1hOacrOeuoeeQhuWFrOWPuENvcmlkZWzlqLHkuZDnrb7orqLmvJToibrnu4/nuqrku6PnkIbmnYPovazorqnlkIjlkIzvvIzojrflvpfkuobpg5Hnp4Dlpo3lnKjkuK3lm73lpKfpmYbnmoTni6zlrrbmvJToibrnu4/nuqrku6PnkIbmnYPvvIzlkIjlkIzmnInmlYjmnJ/oh7MyMDE55bm0MuaciDI45pel44CC5L2G5Zyo5LiN5LmF5ZCO77yM6LS15bee5paw5rmD5YWs5Y+45LiO5rW35a6B5paw5rmD5YWs5Y+45Lul6YOR56eA5aaN5LiN5bGl6KGM5ZCI57qm5Li655Sx5ZCR5rOV6Zmi5o+Q5Ye65Luy6KOB55Sz6K+377yM6KaB5rGC6YOR56eA5aaN6YCA6L+Y5bey5pS25Y+W55qE5o6I5p2D6LS577yM5ZKo6K+i6LS55bm25pSv5LuY6L+d57qm6YeR5ZKM5pyq5YiG6YWN5pS25YWl44CCMjAxN+W5tDEx5pyIMjfml6XvvIzljJfkuqzku7Loo4Hlp5TlkZjkvJrlgZrlh7rku7Loo4HliKTlhrPvvIzliKTotLXlt57mlrDmuYPlhazlj7jkuI7mtbflroHmlrDmuYPlhazlj7jog5zor4njgII8L3A+PHAgc3R5bGU9Im1hcmdpbi10b3A6IDBweDsgbWFyZ2luLWJvdHRvbTogMzBweDsgcGFkZGluZzogMHB4OyB0ZXh0LXNpemUtYWRqdXN0OiAxMDAlOyI+44CA44CA5Zyo5Lit5Zu96LSl6K+J5ZCO77yM6YOR56eA5aaN5Lul57q957qm5YWs57qm5Li65L6d5o2u5bCG6K+J6K686L2s56e75Yiw6Z+p5Zu977yM5bm25Li75byg6Ieq5bex5bm26Z2e57uP57qq5Luj55CG5p2D5ZCI5ZCM55qE5b2T5LqL5Lq677yM5LiU5o6I5p2D5ZCI5ZCM5Lit5Lmf5rKh5pyJ5ZCM5oSP5Luy6KOB55qE5p2h5qy+77yM5bqU5Yik5Yaz5YyX5Lqs5Luy6KOB5aeU5ZGY5Lya55qE5Yik5Yaz5rKh5pyJ5rOV5b6L5pWI5Yqb44CC5LiN6L+H6aaW5bCU5Lit5aSu5Zyw5pa55rOV6Zmi5LuK5bm0MuaciDEx5pel5LiA5a6h5Yik5Yaz6YOR56eA5aaN6LSl6K+J77yM6YOR56eA5aaN6ZqP5ZCO5o+Q5Ye655qE5LiK6K+J5Lmf5Zyo5LuK5bm0N+aciDIz5pel6KKr6aaW5bCU6auY562J5rOV6Zmi5LqM5a6h6amz5Zue44CCPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDMwcHg7IHBhZGRpbmc6IDBweDsgdGV4dC1zaXplLWFkanVzdDogMTAwJTsiPuOAgOOAgOagueaNruWMl+S6rOS7suijgeWnlOWRmOS8muWBmuWHuueahOS7suijgeWIpOWGs++8jOmDkeengOWmjemcgOimgeWQkeS4reWbvei0teW3nuaWsOa5g+WFrOWPuOS4jua1t+WugeaWsOa5g+WFrOWPuOi1lOWBv+eahOaAu+mHkeminei2hei/hzIw5Lq/6Z+p5YWD77yM55Sx5LqO6Z+p5Zu95rOV5b6L5bGe5LqO5LiJ57qn5LiJ5a6h5Yi277yM55uu5YmN6YOR56eA5aaN5bey5ZCR6Z+p5Zu95aSn5rOV6Zmi5o+Q5Ye65LqG5pyA5ZCO5LiA5qyh5LiK6K+J44CCPC9wPjxwIGNsYXNzPSJhcnRpY2xlLWVkaXRvciIgc3R5bGU9Im1hcmdpbi10b3A6IDBweDsgbWFyZ2luLWJvdHRvbTogMzBweDsgcGFkZGluZzogMHB4OyB0ZXh0LXNpemUtYWRqdXN0OiAxMDAlOyB0ZXh0LWFsaWduOiByaWdodDsiPijotKPnvJbvvJrlk4jlk4jlpKfnjospPC9wPjxwPjxici8+PC9wPg==', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, '1', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for youbang_addonimages
-- ----------------------------
DROP TABLE IF EXISTS `youbang_addonimages`;
CREATE TABLE `youbang_addonimages`  (
  `aid` bigint(13) UNSIGNED NOT NULL DEFAULT 0,
  `typeid` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `pagestyle` smallint(6) NOT NULL DEFAULT 1,
  `imgurls` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `templet` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `userip` char(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `descriptions` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`aid`) USING BTREE,
  INDEX `imagesMain`(`typeid`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of youbang_addonimages
-- ----------------------------
INSERT INTO `youbang_addonimages` VALUES (88, 6, 2, '[{\"img\":\"http://www.dedecms.com/demoimg/uploads/allimg/100407/1-10040G40556.jpg\",\"text\":\"古镇建筑\",\"redirecturl\":\"http://www.baidu.com\"},{\"img\":\"http://www.dedecms.com/demoimg/uploads/allimg/100407/1-10040G40557.jpg\",\"text\":\"好大的花啊\",\"redirecturl\":\"http://www.baidu.com\"},{\"img\":\"http://www.dedecms.com/demoimg/uploads/allimg/100407/1-10040G40558.jpg\",\"text\":\"丽的风景尽收眼底\",\"redirecturl\":\"http://www.baidu.com\"},{\"img\":\"http://www.dedecms.com/demoimg/uploads/allimg/100407/1-10040G40559.jpg\",\"text\":\"美丽的风景尽收眼底\",\"redirecturl\":\"http://www.baidu.com\"},{\"img\":\"http://www.dedecms.com/demoimg/uploads/allimg/100407/1-10040G40600.jpg\",\"text\":\"美丽的风景尽收眼底\",\"redirecturl\":\"http://www.baidu.com\"}]', '', '127.0.0.1', '传说中的古城');
INSERT INTO `youbang_addonimages` VALUES (89, 6, 2, '[{\"img\":\"http://www.dedecms.com/demoimg/uploads/allimg/100407/1-10040G42130.jpg\",\"text\":\"流连忘返的香樟大道\",\"redirectrul\":\"http://www.baidu.com\"},{\"img\":\"http://www.dedecms.com/demoimg/uploads/allimg/100407/1-10040G42131.jpg\",\"text\":\"流连忘返的香樟大道\",\"redirectrul\":\"http://www.baidu.com\"},{\"img\":\"http://www.dedecms.com/demoimg/uploads/allimg/100407/1-10040G42132.jpg\",\"text\":\"流连忘返的香樟大道\",\"redirectrul\":\"http://www.baidu.com\"},{\"img\":\"http://www.dedecms.com/demoimg/uploads/allimg/100407/1-10040G42133.jpg\",\"text\":\"流连忘返的香樟大道\",\"redirectrul\":\"http://www.baidu.com\"},{\"img\":\"http://www.dedecms.com/demoimg/uploads/allimg/100407/1-10040G42134.jpg\",\"text\":\"流连忘返的香樟大道\",\"redirectrul\":\"http://www.baidu.com\"},{\"img\":\"http://www.dedecms.com/demoimg/uploads/allimg/100407/1-10040G42135.jpg\",\"text\":\"流连忘返的香樟大道\",\"redirectrul\":\"\"}]', '', '127.0.0.1', '流连忘返的香樟大道');
INSERT INTO `youbang_addonimages` VALUES (90, 6, 2, '[{\"img\":\"http://www.dedecms.com/demoimg/uploads/allimg/100407/1-10040G42130.jpg\",\"text\":\"流连忘返的香樟大道\",\"redirectrul\":\"http://www.baidu.com\"},{\"img\":\"http://www.dedecms.com/demoimg/uploads/allimg/100407/1-10040G42131.jpg\",\"text\":\"流连忘返的香樟大道\",\"redirectrul\":\"http://www.baidu.com\"},{\"img\":\"http://www.dedecms.com/demoimg/uploads/allimg/100407/1-10040G42132.jpg\",\"text\":\"流连忘返的香樟大道\",\"redirectrul\":\"http://www.baidu.com\"},{\"img\":\"http://www.dedecms.com/demoimg/uploads/allimg/100407/1-10040G42133.jpg\",\"text\":\"流连忘返的香樟大道\",\"redirectrul\":\"http://www.baidu.com\"},{\"img\":\"http://www.dedecms.com/demoimg/uploads/allimg/100407/1-10040G42134.jpg\",\"text\":\"流连忘返的香樟大道\",\"redirectrul\":\"http://www.baidu.com\"},{\"img\":\"http://www.dedecms.com/demoimg/uploads/allimg/100407/1-10040G42135.jpg\",\"text\":\"流连忘返的香樟大道\",\"redirectrul\":\"http://www.baidu.com\"}]', '', '127.0.0.1', '农家小院丝瓜架下');
INSERT INTO `youbang_addonimages` VALUES (91, 6, 2, '[{\"img\":\"http://www.dedecms.com/demoimg/uploads/allimg/100407/1-10040G44302.jpg\",\"text\":\"DedeCMS产品相关截图\",\"redirectrul\":\"http://www.baidu.com\"},{\"img\":\"http://www.dedecms.com/demoimg/uploads/allimg/100407/1-10040G44303.jpg\",\"text\":\"DedeCMS产品相关截图\",\"redirectrul\":\"http://www.baidu.com\"},{\"img\":\"http://www.dedecms.com/demoimg/uploads/allimg/100407/1-10040G44304.jpg\",\"text\":\"DedeCMS产品相关截图\",\"redirectrul\":\"http://www.baidu.com\"}]', '', '127.0.0.1', 'DedeCMS产品相关截图');
INSERT INTO `youbang_addonimages` VALUES (93, 6, 2, '[{\"img\":\"http://www.dedecms.com/demoimg/uploads/allimg/100407/1-10040G50111.jpg\",\"text\":\"海岛风光\",\"redirectrul\":\"http://www.baidu.com\"},{\"img\":\"http://www.dedecms.com/demoimg/uploads/allimg/100407/1-10040G50112.jpg\",\"text\":\"海岛风光\",\"redirectrul\":\"http://www.baidu.com\"},{\"img\":\"http://www.dedecms.com/demoimg/uploads/allimg/100407/1-10040G50113.jpg\",\"text\":\"海岛风光\",\"redirectrul\":\"http://www.baidu.com\"},{\"img\":\"http://www.dedecms.com/demoimg/uploads/allimg/100407/1-10040G50114.jpg\",\"text\":\"海岛风光\",\"redirectrul\":\"http://www.baidu.com\"},{\"img\":\"http://www.dedecms.com/demoimg/uploads/allimg/100407/1-10040G50115.jpg\",\"text\":\"海岛风光\",\"redirectrul\":\"http://www.baidu.com\"}]', '', '127.0.0.1', '海岛风光');
INSERT INTO `youbang_addonimages` VALUES (94, 6, 2, '[{\"img\":\"http://www.dedecms.com/demoimg/uploads/allimg/100407/1-10040G51624.jpg\",\"text\":\"武夷山的美景真是不错\",\"redirectrul\":\"http://www.baidu.com\"},{\"img\":\"http://www.dedecms.com/demoimg/uploads/allimg/100407/1-10040G51625.jpg\",\"text\":\"武夷山的美景真是不错\",\"redirectrul\":\"http://www.baidu.com\"},{\"img\":\"http://www.dedecms.com/demoimg/uploads/allimg/100407/1-10040G51626.jpg\",\"text\":\"武夷山的美景真是不错\",\"redirectrul\":\"http://www.baidu.com\"},{\"img\":\"http://www.dedecms.com/demoimg/uploads/allimg/100407/1-10040G51627.jpg\",\"text\":\"武夷山的美景真是不错\",\"redirectrul\":\"http://www.baidu.com\"},{\"img\":\"http://www.dedecms.com/demoimg/uploads/allimg/100407/1-10040G51628.jpg\",\"text\":\"武夷山的美景真是不错\",\"redirectrul\":\"http://www.baidu.com\"},{\"img\":\"http://www.dedecms.com/demoimg/uploads/allimg/100407/1-10040G51629.jpg\",\"text\":\"武夷山的美景真是不错\",\"redirectrul\":\"http://www.baidu.com\"}]', '', '127.0.0.1', '武夷山的美景真是不错');
INSERT INTO `youbang_addonimages` VALUES (95, 6, 2, '[{\"img\":\"http://www.dedecms.com/demoimg/uploads/allimg/100407/1-10040G52636.jpg\",\"text\":\"原创风景图片\",\"redirectrul\":\"http://www.baidu.com\"},{\"img\":\"http://www.dedecms.com/demoimg/uploads/allimg/100407/1-10040G52637.jpg\",\"text\":\"原创风景图片\",\"redirectrul\":\"http://www.baidu.com\"},{\"img\":\"http://www.dedecms.com/demoimg/uploads/allimg/100407/1-10040G52638.jpg\",\"text\":\"原创风景图片\",\"redirectrul\":\"http://www.baidu.com\"},{\"img\":\"http://www.dedecms.com/demoimg/uploads/allimg/100407/1-10040G52639.jpg\",\"text\":\"原创风景图片\",\"redirectrul\":\"http://www.baidu.com\"}]', '', '127.0.0.1', '原创风景图片');
INSERT INTO `youbang_addonimages` VALUES (96, 6, 2, '[{\"img\":\"http://www.dedecms.com/demoimg/uploads/allimg/100407/1-10040G53038.jpg\",\"text\":\"花的照片\",\"redirectrul\":\"http://www.baidu.com\"},{\"img\":\"http://www.dedecms.com/demoimg/uploads/allimg/100407/1-10040G53039.jpg\",\"text\":\"花的照片\",\"redirectrul\":\"http://www.baidu.com\"},{\"img\":\"http://www.dedecms.com/demoimg/uploads/allimg/100407/1-10040G53040.jpg\",\"text\":\"花的照片\",\"redirectrul\":\"http://www.baidu.com\"},{\"img\":\"http://www.dedecms.com/demoimg/uploads/allimg/100407/1-10040G53041.jpg\",\"text\":\"花的照片\",\"redirectrul\":\"http://www.baidu.com\"},{\"img\":\"http://www.dedecms.com/demoimg/uploads/allimg/100407/1-10040G53041-50.jpg\",\"text\":\"花的照片\",\"redirectrul\":\"http://www.baidu.com\"}]', '', '127.0.0.1', '我的眼界-一些关于花的照片');

-- ----------------------------
-- Table structure for youbang_addoninfos
-- ----------------------------
DROP TABLE IF EXISTS `youbang_addoninfos`;
CREATE TABLE `youbang_addoninfos`  (
  `aid` bigint(13) NOT NULL DEFAULT 0,
  `typeid` int(11) NOT NULL DEFAULT 0 COMMENT '栏目id',
  `componentid` smallint(6) NOT NULL DEFAULT 0 COMMENT '组件id',
  `arcrank` smallint(6) NOT NULL DEFAULT 0 COMMENT '排序',
  `mid` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '发布人id',
  `click` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '点击量',
  `title` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `litpic` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '缩略图',
  `userip` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ' ' COMMENT '发布ip',
  `senddate` int(11) NOT NULL DEFAULT 0 COMMENT '发布时间',
  `flag` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'c: 推荐  h：首页 z:资讯 r:热点',
  `lastpost` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `scores` mediumint(8) NOT NULL DEFAULT 0,
  `goodpost` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `badpost` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `nativeplace` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `infotype` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `body` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '主休内容',
  `endtime` datetime(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '结束时间',
  `tel` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '邮箱',
  `address` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '地址',
  `linkman` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '联系人',
  `levelid` int(11) NULL DEFAULT 0 COMMENT 'VIP等级',
  PRIMARY KEY (`aid`) USING BTREE,
  INDEX `channel`(`componentid`, `arcrank`, `mid`, `click`, `title`, `litpic`, `senddate`, `flag`, `endtime`) USING BTREE,
  INDEX `typeid`(`typeid`, `nativeplace`, `infotype`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of youbang_addoninfos
-- ----------------------------
INSERT INTO `youbang_addoninfos` VALUES (230, 14, -8, 0, 0, 0, ' 浿试上传多字段图片的信息', '/img/2019/8/1/be1c57289bccc1eea951f1bcfe64df00.png', '0', 0, '', 0, 0, 0, 0, 0, '0', 'PHA+5oiR6K+055SfJm5ic3A75rW/6K+V5LiK5Lyg5aSa5a2X5q615Zu+54mH55qE5L+h5oGvPC9wPg==', '0000-00-00 00:00:00', ' 15985496246', '无可厚非无可厚非顶替', '0', ' ', 0);
INSERT INTO `youbang_addoninfos` VALUES (239, 14, -8, 0, 0, 0, '789789', '', '0', 0, '', 0, 0, 0, 0, 138, '0', '', '0000-00-00 00:00:00', ' ', '', '106', ' ', 0);
INSERT INTO `youbang_addoninfos` VALUES (1858, 1, -8, 0, 1, 0, ' 兴义市市政市政照明工程', '/img/2019/8/12/57e53cfe6354ff1ebb3c4cab67dab395.png', '0', 0, '', 0, 0, 0, 0, 0, '0', 'PGgxIGNsYXNzPSJkZXRhaWx0aXRsZSIgdGl0bGU9IuOAkOeJqei1hOexu+OAkeS4reWbveeUteW7uuays+WNl+W3peeoi+WFrOWPuOWNjua2puayp+W3nui/kOS4nOmhueebrumDqOWNjua2puayp+W3nui/kOS4nOmSouadkOadkOaWmemHh+i0remhueebruaIkOS6pOWFrOekuiIgc3R5bGU9Im1hcmdpbjogMHB4OyBwYWRkaW5nOiAxMHB4IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyBmb250LXNpemU6IDE4cHg7IGZvbnQtd2VpZ2h0OiA0MDA7IGxpbmUtaGVpZ2h0OiAyOHB4OyB0ZXh0LWFsaWduOiBjZW50ZXI7IGJvcmRlci1ib3R0b206IDFweCBkYXNoZWQgcmdiKDIwNCwgMjA0LCAyMDQpOyI+44CQ54mp6LWE57G744CR5Lit5Zu955S15bu65rKz5Y2X5bel56iL5YWs5Y+45Y2O5ram5rKn5bee6L+Q5Lic6aG555uu6YOo5Y2O5ram5rKn5bee6L+Q5Lic6ZKi5p2Q5p2Q5paZ6YeH6LSt6aG555uu5oiQ5Lqk5YWs56S6PC9oMT48cD48YSBjbGFzcz0iYnRuIGJhcjEiIG5hbWU9ImNvbGxlY3Rpb24iIHN0eWxlPSJtYXJnaW46IDBweCAxMHB4OyBwYWRkaW5nOiAwcHggN3B4OyB3aGl0ZS1zcGFjZTogbm93cmFwOyBjdXJzb3I6IHBvaW50ZXI7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsgb3ZlcmZsb3c6IGhpZGRlbjsgdGV4dC1vdmVyZmxvdzogaW5oZXJpdDsgYm9yZGVyOiAxcHggc29saWQgcmdiKDI0MywgMTUyLCAyOSk7IG91dGxpbmU6IG5vbmU7IGZsb2F0OiBub25lOyBsaW5lLWhlaWdodDogMjJweDsgaGVpZ2h0OiAyMnB4OyBiYWNrZ3JvdW5kLWltYWdlOiBub25lOyBiYWNrZ3JvdW5kLXBvc2l0aW9uOiBpbml0aWFsOyBiYWNrZ3JvdW5kLXNpemU6IGluaXRpYWw7IGJhY2tncm91bmQtcmVwZWF0OiBpbml0aWFsOyBiYWNrZ3JvdW5kLWF0dGFjaG1lbnQ6IGluaXRpYWw7IGJhY2tncm91bmQtb3JpZ2luOiBpbml0aWFsOyBiYWNrZ3JvdW5kLWNsaXA6IGluaXRpYWw7IGRpc3BsYXk6IGlubGluZS1ibG9jazsgYm9yZGVyLXJhZGl1czogNnB4OyI+PHN0cm9uZyBzdHlsZT0id2lkdGg6IDE1cHg7IGhlaWdodDogMTZweDsgZmxvYXQ6IGxlZnQ7IGRpc3BsYXk6IGlubGluZS1ibG9jazsgbWFyZ2luOiAzcHggNXB4IDBweCAwcHg7IGJhY2tncm91bmQtaW1hZ2U6IHVybCgmcXVvdDsuLi9pbWFnZXMvZGV0YWlsL2Rvd25sb2FkLmpwZyZxdW90Oyk7IGJhY2tncm91bmQtcG9zaXRpb246IGNlbnRlciBjZW50ZXI7IGJhY2tncm91bmQtc2l6ZTogaW5pdGlhbDsgYmFja2dyb3VuZC1yZXBlYXQ6IG5vLXJlcGVhdDsgYmFja2dyb3VuZC1hdHRhY2htZW50OiBpbml0aWFsOyBiYWNrZ3JvdW5kLW9yaWdpbjogaW5pdGlhbDsgYmFja2dyb3VuZC1jbGlwOiBpbml0aWFsOyI+PC9zdHJvbmc+PHNwYW4gdGl0bGU9IueCueWHu+aUtuiXj+OAkOeJqei1hOexu+OAkeS4reWbveeUteW7uuays+WNl+W3peeoi+WFrOWPuOWNjua2puayp+W3nui/kOS4nOmhueebrumDqOWNjua2puayp+W3nui/kOS4nOmSouadkOadkOaWmemHh+i0remhueebruaIkOS6pOWFrOekuiI+5Yqg5YWl5pS26JePPC9zcGFuPjwvYT4mbmJzcDs8YSBjbGFzcz0iIGJ0biBzaGFyZWJ0biBiZHNfbW9yZSIgZGF0YS1jbWQ9Im1vcmUiIHN0eWxlPSJtYXJnaW46IDBweCAxMHB4OyBwYWRkaW5nOiAwcHggN3B4IDBweCAyMnB4OyB3aGl0ZS1zcGFjZTogbm93cmFwOyBjdXJzb3I6IHBvaW50ZXI7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsgb3ZlcmZsb3c6IGhpZGRlbjsgdGV4dC1vdmVyZmxvdzogaW5oZXJpdDsgYm9yZGVyOiAxcHggc29saWQgcmdiKDI0MywgMTUyLCAyOSk7IG91dGxpbmU6IG5vbmU7IGZsb2F0OiBub25lOyBsaW5lLWhlaWdodDogMjJweDsgaGVpZ2h0OiAyMnB4OyBiYWNrZ3JvdW5kLWltYWdlOiB1cmwoJnF1b3Q7Li4vaW1hZ2VzL2RldGFpbC9zaGFyZS5qcGcmcXVvdDspOyBiYWNrZ3JvdW5kLXBvc2l0aW9uOiA0cHggY2VudGVyOyBiYWNrZ3JvdW5kLXNpemU6IGluaXRpYWw7IGJhY2tncm91bmQtcmVwZWF0OiBuby1yZXBlYXQ7IGJhY2tncm91bmQtYXR0YWNobWVudDogaW5pdGlhbDsgYmFja2dyb3VuZC1vcmlnaW46IGluaXRpYWw7IGJhY2tncm91bmQtY2xpcDogaW5pdGlhbDsgZGlzcGxheTogaW5saW5lLWJsb2NrOyBib3JkZXItcmFkaXVzOiA2cHg7Ij7liIbkuqs8L2E+Jm5ic3A7PGEgY2xhc3M9ImJ0biBwZGYiIHN0eWxlPSJtYXJnaW46IDBweCAxMHB4OyBwYWRkaW5nOiAwcHggN3B4OyB3aGl0ZS1zcGFjZTogbm93cmFwOyBjdXJzb3I6IHBvaW50ZXI7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsgb3ZlcmZsb3c6IGhpZGRlbjsgdGV4dC1vdmVyZmxvdzogaW5oZXJpdDsgYm9yZGVyOiAxcHggc29saWQgcmdiKDI0MywgMTUyLCAyOSk7IG91dGxpbmU6IG5vbmU7IGZsb2F0OiBub25lOyBsaW5lLWhlaWdodDogMjJweDsgaGVpZ2h0OiAyMnB4OyBiYWNrZ3JvdW5kLWltYWdlOiBub25lOyBiYWNrZ3JvdW5kLXBvc2l0aW9uOiBpbml0aWFsOyBiYWNrZ3JvdW5kLXNpemU6IGluaXRpYWw7IGJhY2tncm91bmQtcmVwZWF0OiBpbml0aWFsOyBiYWNrZ3JvdW5kLWF0dGFjaG1lbnQ6IGluaXRpYWw7IGJhY2tncm91bmQtb3JpZ2luOiBpbml0aWFsOyBiYWNrZ3JvdW5kLWNsaXA6IGluaXRpYWw7IGRpc3BsYXk6IGlubGluZS1ibG9jazsgYm9yZGVyLXJhZGl1czogNnB4OyI+PHN0cm9uZyBzdHlsZT0id2lkdGg6IDE1cHg7IGhlaWdodDogMTZweDsgZmxvYXQ6IGxlZnQ7IGRpc3BsYXk6IGlubGluZS1ibG9jazsgbWFyZ2luOiAzcHggNXB4IDBweCAwcHg7IGJhY2tncm91bmQtaW1hZ2U6IHVybCgmcXVvdDsuLi9pbWFnZXMvZGV0YWlsL3BkZi5qcGcmcXVvdDspOyBiYWNrZ3JvdW5kLXBvc2l0aW9uOiBjZW50ZXIgY2VudGVyOyBiYWNrZ3JvdW5kLXNpemU6IGluaXRpYWw7IGJhY2tncm91bmQtcmVwZWF0OiBuby1yZXBlYXQ7IGJhY2tncm91bmQtYXR0YWNobWVudDogaW5pdGlhbDsgYmFja2dyb3VuZC1vcmlnaW46IGluaXRpYWw7IGJhY2tncm91bmQtY2xpcDogaW5pdGlhbDsiPjwvc3Ryb25nPuaWh+aho+WvvOWHujwvYT48L3A+PHRhYmxlIGNsYXNzPSJkZXRhaWxsb2dvdXQiIHN0eWxlPSJib3JkZXItY29sbGFwc2U6IGNvbGxhcHNlOyBib3JkZXItc3BhY2luZzogMHB4OyBtYXJnaW46IDBweDsgcGFkZGluZzogMHB4OyB2ZXJ0aWNhbC1hbGlnbjogbWlkZGxlOyB0YWJsZS1sYXlvdXQ6IGZpeGVkOyB3b3JkLWJyZWFrOiBicmVhay1hbGw7IHdpZHRoOiA4NDdweDsiPjx0Ym9keT48dHIgc3R5bGU9ImJvcmRlci1jb2xsYXBzZTogY29sbGFwc2U7IGJvcmRlci1zcGFjaW5nOiAwcHg7IHZlcnRpY2FsLWFsaWduOiBtaWRkbGU7IGJhY2tncm91bmQ6IHJnYigyNTUsIDI1NSwgMjU1KTsiPjx0ZCBjbGFzcz0idGV4dC1jZW50ZXIiIHN0eWxlPSJtYXJnaW46IDBweDsgcGFkZGluZzogNnB4IDdweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyBib3JkZXItY29sbGFwc2U6IGNvbGxhcHNlOyBib3JkZXItc3BhY2luZzogMHB4OyB2ZXJ0aWNhbC1hbGlnbjogbWlkZGxlOyB0ZXh0LWFsaWduOiBjZW50ZXI7IGJvcmRlcjogMXB4IHNvbGlkIHJnYigyMDQsIDIwNCwgMjA0KTsiPuabtOaWsOaXtumXtDwvdGQ+PHRkIGNsYXNzPSIiIHN0eWxlPSJtYXJnaW46IDBweDsgcGFkZGluZzogNnB4IDdweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyBib3JkZXItY29sbGFwc2U6IGNvbGxhcHNlOyBib3JkZXItc3BhY2luZzogMHB4OyB2ZXJ0aWNhbC1hbGlnbjogbWlkZGxlOyBib3JkZXI6IDFweCBzb2xpZCByZ2IoMjA0LCAyMDQsIDIwNCk7Ij4yMDE5LTA4LTEyPC90ZD48dGQgY2xhc3M9InRleHQtY2VudGVyIiBzdHlsZT0ibWFyZ2luOiAwcHg7IHBhZGRpbmc6IDZweCA3cHg7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsgYm9yZGVyLWNvbGxhcHNlOiBjb2xsYXBzZTsgYm9yZGVyLXNwYWNpbmc6IDBweDsgdmVydGljYWwtYWxpZ246IG1pZGRsZTsgdGV4dC1hbGlnbjogY2VudGVyOyBib3JkZXI6IDFweCBzb2xpZCByZ2IoMjA0LCAyMDQsIDIwNCk7Ij7mi5vmoIfljZXkvY08L3RkPjx0ZCBjbGFzcz0iIiBzdHlsZT0ibWFyZ2luOiAwcHg7IHBhZGRpbmc6IDZweCA3cHg7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsgYm9yZGVyLWNvbGxhcHNlOiBjb2xsYXBzZTsgYm9yZGVyLXNwYWNpbmc6IDBweDsgdmVydGljYWwtYWxpZ246IG1pZGRsZTsgYm9yZGVyOiAxcHggc29saWQgcmdiKDIwNCwgMjA0LCAyMDQpOyI+PGEgaHJlZj0iaHR0cHM6Ly93d3cuYmliZW5ldC5jb20vbG9naW4uanNwIiBjbGFzcz0ibG9naW4gbG9vayIgdGFyZ2V0PSJfYmxhbmsiIHJlbD0ibm9mb2xsb3ciIHN0eWxlPSJ0ZXh0LWRlY29yYXRpb24tbGluZTogbm9uZTsgY29sb3I6IHJnYigyNTUsIDI1NSwgMjU1KTsgbWFyZ2luOiAwcHg7IHBhZGRpbmc6IDBweDsgd2hpdGUtc3BhY2U6IG5vd3JhcDsgY3Vyc29yOiBwb2ludGVyOyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7IG92ZXJmbG93OiBoaWRkZW47IHRleHQtb3ZlcmZsb3c6IGVsbGlwc2lzOyBib3JkZXI6IDJweCBzb2xpZCByZ2IoMjQzLCAxNTIsIDI5KTsgb3V0bGluZTogbm9uZTsgd2lkdGg6IDcwcHg7IGhlaWdodDogMTlweDsgbGluZS1oZWlnaHQ6IDE5cHg7IHRleHQtYWxpZ246IGNlbnRlcjsgZGlzcGxheTogaW5saW5lLWJsb2NrOyBiYWNrZ3JvdW5kOiByZ2IoMjQzLCAxNTIsIDI5KTsgZm9udC13ZWlnaHQ6IGJvbGQ7IHZlcnRpY2FsLWFsaWduOiBtaWRkbGU7Ij7miJHopoHmn6XnnIs8L2E+PC90ZD48L3RyPjx0ciBzdHlsZT0iYm9yZGVyLWNvbGxhcHNlOiBjb2xsYXBzZTsgYm9yZGVyLXNwYWNpbmc6IDBweDsgdmVydGljYWwtYWxpZ246IG1pZGRsZTsiPjx0ZCBjbGFzcz0idGV4dC1jZW50ZXIiIHN0eWxlPSJtYXJnaW46IDBweDsgcGFkZGluZzogNnB4IDdweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyBib3JkZXItY29sbGFwc2U6IGNvbGxhcHNlOyBib3JkZXItc3BhY2luZzogMHB4OyB2ZXJ0aWNhbC1hbGlnbjogbWlkZGxlOyB0ZXh0LWFsaWduOiBjZW50ZXI7IGJvcmRlcjogMXB4IHNvbGlkIHJnYigyMDQsIDIwNCwgMjA0KTsiPuaIquatouaXtumXtDwvdGQ+PHRkIGNsYXNzPSIiIHN0eWxlPSJtYXJnaW46IDBweDsgcGFkZGluZzogNnB4IDdweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyBib3JkZXItY29sbGFwc2U6IGNvbGxhcHNlOyBib3JkZXItc3BhY2luZzogMHB4OyB2ZXJ0aWNhbC1hbGlnbjogbWlkZGxlOyBib3JkZXI6IDFweCBzb2xpZCByZ2IoMjA0LCAyMDQsIDIwNCk7Ij48YSBocmVmPSJodHRwczovL3d3dy5iaWJlbmV0LmNvbS9sb2dpbi5qc3AiIGNsYXNzPSJsb2dpbiBsb29rIiB0YXJnZXQ9Il9ibGFuayIgcmVsPSJub2ZvbGxvdyIgc3R5bGU9InRleHQtZGVjb3JhdGlvbi1saW5lOiBub25lOyBjb2xvcjogcmdiKDI1NSwgMjU1LCAyNTUpOyBtYXJnaW46IDBweDsgcGFkZGluZzogMHB4OyB3aGl0ZS1zcGFjZTogbm93cmFwOyBjdXJzb3I6IHBvaW50ZXI7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsgb3ZlcmZsb3c6IGhpZGRlbjsgdGV4dC1vdmVyZmxvdzogZWxsaXBzaXM7IGJvcmRlcjogMnB4IHNvbGlkIHJnYigyNDMsIDE1MiwgMjkpOyBvdXRsaW5lOiBub25lOyB3aWR0aDogNzBweDsgaGVpZ2h0OiAxOXB4OyBsaW5lLWhlaWdodDogMTlweDsgdGV4dC1hbGlnbjogY2VudGVyOyBkaXNwbGF5OiBpbmxpbmUtYmxvY2s7IGJhY2tncm91bmQ6IHJnYigyNDMsIDE1MiwgMjkpOyBmb250LXdlaWdodDogYm9sZDsgdmVydGljYWwtYWxpZ246IG1pZGRsZTsiPuaIkeimgeafpeecizwvYT48L3RkPjx0ZCBjbGFzcz0idGV4dC1jZW50ZXIiIHN0eWxlPSJtYXJnaW46IDBweDsgcGFkZGluZzogNnB4IDdweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyBib3JkZXItY29sbGFwc2U6IGNvbGxhcHNlOyBib3JkZXItc3BhY2luZzogMHB4OyB2ZXJ0aWNhbC1hbGlnbjogbWlkZGxlOyB0ZXh0LWFsaWduOiBjZW50ZXI7IGJvcmRlcjogMXB4IHNvbGlkIHJnYigyMDQsIDIwNCwgMjA0KTsiPuaLm+agh+e8luWPtzwvdGQ+PHRkIGNsYXNzPSIiIHN0eWxlPSJtYXJnaW46IDBweDsgcGFkZGluZzogNnB4IDdweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyBib3JkZXItY29sbGFwc2U6IGNvbGxhcHNlOyBib3JkZXItc3BhY2luZzogMHB4OyB2ZXJ0aWNhbC1hbGlnbjogbWlkZGxlOyBib3JkZXI6IDFweCBzb2xpZCByZ2IoMjA0LCAyMDQsIDIwNCk7Ij48YSBocmVmPSJodHRwczovL3d3dy5iaWJlbmV0LmNvbS9sb2dpbi5qc3AiIGNsYXNzPSJsb2dpbiBsb29rIiB0YXJnZXQ9Il9ibGFuayIgcmVsPSJub2ZvbGxvdyIgc3R5bGU9InRleHQtZGVjb3JhdGlvbi1saW5lOiBub25lOyBjb2xvcjogcmdiKDI1NSwgMjU1LCAyNTUpOyBtYXJnaW46IDBweDsgcGFkZGluZzogMHB4OyB3aGl0ZS1zcGFjZTogbm93cmFwOyBjdXJzb3I6IHBvaW50ZXI7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsgb3ZlcmZsb3c6IGhpZGRlbjsgdGV4dC1vdmVyZmxvdzogZWxsaXBzaXM7IGJvcmRlcjogMnB4IHNvbGlkIHJnYigyNDMsIDE1MiwgMjkpOyBvdXRsaW5lOiBub25lOyB3aWR0aDogNzBweDsgaGVpZ2h0OiAxOXB4OyBsaW5lLWhlaWdodDogMTlweDsgdGV4dC1hbGlnbjogY2VudGVyOyBkaXNwbGF5OiBpbmxpbmUtYmxvY2s7IGJhY2tncm91bmQ6IHJnYigyNDMsIDE1MiwgMjkpOyBmb250LXdlaWdodDogYm9sZDsgdmVydGljYWwtYWxpZ246IG1pZGRsZTsiPuaIkeimgeafpeecizwvYT48L3RkPjwvdHI+PHRyIHN0eWxlPSJib3JkZXItY29sbGFwc2U6IGNvbGxhcHNlOyBib3JkZXItc3BhY2luZzogMHB4OyB2ZXJ0aWNhbC1hbGlnbjogbWlkZGxlOyBiYWNrZ3JvdW5kOiByZ2IoMjU1LCAyNTUsIDI1NSk7Ij48dGQgY2xhc3M9InRleHQtY2VudGVyIiBzdHlsZT0ibWFyZ2luOiAwcHg7IHBhZGRpbmc6IDZweCA3cHg7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsgYm9yZGVyLWNvbGxhcHNlOiBjb2xsYXBzZTsgYm9yZGVyLXNwYWNpbmc6IDBweDsgdmVydGljYWwtYWxpZ246IG1pZGRsZTsgdGV4dC1hbGlnbjogY2VudGVyOyBib3JkZXI6IDFweCBzb2xpZCByZ2IoMjA0LCAyMDQsIDIwNCk7Ij7pobnnm67lkI3np7A8L3RkPjx0ZCBjbGFzcz0iIiBzdHlsZT0ibWFyZ2luOiAwcHg7IHBhZGRpbmc6IDZweCA3cHg7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsgYm9yZGVyLWNvbGxhcHNlOiBjb2xsYXBzZTsgYm9yZGVyLXNwYWNpbmc6IDBweDsgdmVydGljYWwtYWxpZ246IG1pZGRsZTsgYm9yZGVyOiAxcHggc29saWQgcmdiKDIwNCwgMjA0LCAyMDQpOyI+PGEgaHJlZj0iaHR0cHM6Ly93d3cuYmliZW5ldC5jb20vbG9naW4uanNwIiBjbGFzcz0ibG9naW4gbG9vayIgdGFyZ2V0PSJfYmxhbmsiIHJlbD0ibm9mb2xsb3ciIHN0eWxlPSJ0ZXh0LWRlY29yYXRpb24tbGluZTogbm9uZTsgY29sb3I6IHJnYigyNTUsIDI1NSwgMjU1KTsgbWFyZ2luOiAwcHg7IHBhZGRpbmc6IDBweDsgd2hpdGUtc3BhY2U6IG5vd3JhcDsgY3Vyc29yOiBwb2ludGVyOyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7IG92ZXJmbG93OiBoaWRkZW47IHRleHQtb3ZlcmZsb3c6IGVsbGlwc2lzOyBib3JkZXI6IDJweCBzb2xpZCByZ2IoMjQzLCAxNTIsIDI5KTsgb3V0bGluZTogbm9uZTsgd2lkdGg6IDcwcHg7IGhlaWdodDogMTlweDsgbGluZS1oZWlnaHQ6IDE5cHg7IHRleHQtYWxpZ246IGNlbnRlcjsgZGlzcGxheTogaW5saW5lLWJsb2NrOyBiYWNrZ3JvdW5kOiByZ2IoMjQzLCAxNTIsIDI5KTsgZm9udC13ZWlnaHQ6IGJvbGQ7IHZlcnRpY2FsLWFsaWduOiBtaWRkbGU7Ij7miJHopoHmn6XnnIs8L2E+PC90ZD48dGQgY2xhc3M9InRleHQtY2VudGVyIiBzdHlsZT0ibWFyZ2luOiAwcHg7IHBhZGRpbmc6IDZweCA3cHg7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsgYm9yZGVyLWNvbGxhcHNlOiBjb2xsYXBzZTsgYm9yZGVyLXNwYWNpbmc6IDBweDsgdmVydGljYWwtYWxpZ246IG1pZGRsZTsgdGV4dC1hbGlnbjogY2VudGVyOyBib3JkZXI6IDFweCBzb2xpZCByZ2IoMjA0LCAyMDQsIDIwNCk7Ij7ku6PnkIbmnLrmnoQ8L3RkPjx0ZCBjbGFzcz0iIiBzdHlsZT0ibWFyZ2luOiAwcHg7IHBhZGRpbmc6IDZweCA3cHg7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsgYm9yZGVyLWNvbGxhcHNlOiBjb2xsYXBzZTsgYm9yZGVyLXNwYWNpbmc6IDBweDsgdmVydGljYWwtYWxpZ246IG1pZGRsZTsgYm9yZGVyOiAxcHggc29saWQgcmdiKDIwNCwgMjA0LCAyMDQpOyI+PGEgaHJlZj0iaHR0cHM6Ly93d3cuYmliZW5ldC5jb20vbG9naW4uanNwIiBjbGFzcz0ibG9naW4gbG9vayIgdGFyZ2V0PSJfYmxhbmsiIHJlbD0ibm9mb2xsb3ciIHN0eWxlPSJ0ZXh0LWRlY29yYXRpb24tbGluZTogbm9uZTsgY29sb3I6IHJnYigyNTUsIDI1NSwgMjU1KTsgbWFyZ2luOiAwcHg7IHBhZGRpbmc6IDBweDsgd2hpdGUtc3BhY2U6IG5vd3JhcDsgY3Vyc29yOiBwb2ludGVyOyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7IG92ZXJmbG93OiBoaWRkZW47IHRleHQtb3ZlcmZsb3c6IGVsbGlwc2lzOyBib3JkZXI6IDJweCBzb2xpZCByZ2IoMjQzLCAxNTIsIDI5KTsgb3V0bGluZTogbm9uZTsgd2lkdGg6IDcwcHg7IGhlaWdodDogMTlweDsgbGluZS1oZWlnaHQ6IDE5cHg7IHRleHQtYWxpZ246IGNlbnRlcjsgZGlzcGxheTogaW5saW5lLWJsb2NrOyBiYWNrZ3JvdW5kOiByZ2IoMjQzLCAxNTIsIDI5KTsgZm9udC13ZWlnaHQ6IGJvbGQ7IHZlcnRpY2FsLWFsaWduOiBtaWRkbGU7Ij7miJHopoHmn6XnnIs8L2E+PC90ZD48L3RyPjx0ciBzdHlsZT0iYm9yZGVyLWNvbGxhcHNlOiBjb2xsYXBzZTsgYm9yZGVyLXNwYWNpbmc6IDBweDsgdmVydGljYWwtYWxpZ246IG1pZGRsZTsiPjx0ZCBjbGFzcz0idGV4dC1jZW50ZXIiIHN0eWxlPSJtYXJnaW46IDBweDsgcGFkZGluZzogNnB4IDdweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyBib3JkZXItY29sbGFwc2U6IGNvbGxhcHNlOyBib3JkZXItc3BhY2luZzogMHB4OyB2ZXJ0aWNhbC1hbGlnbjogbWlkZGxlOyB0ZXh0LWFsaWduOiBjZW50ZXI7IGJvcmRlcjogMXB4IHNvbGlkIHJnYigyMDQsIDIwNCwgMjA0KTsiPuWFs+mUruS/oeaBrzwvdGQ+PHRkIGNsYXNzPSIiIHN0eWxlPSJtYXJnaW46IDBweDsgcGFkZGluZzogNnB4IDdweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyBib3JkZXItY29sbGFwc2U6IGNvbGxhcHNlOyBib3JkZXItc3BhY2luZzogMHB4OyB2ZXJ0aWNhbC1hbGlnbjogbWlkZGxlOyBib3JkZXI6IDFweCBzb2xpZCByZ2IoMjA0LCAyMDQsIDIwNCk7Ij48YSBocmVmPSJodHRwczovL3d3dy5iaWJlbmV0LmNvbS9sb2dpbi5qc3AiIGNsYXNzPSJsb2dpbiBsb29rIiB0YXJnZXQ9Il9ibGFuayIgcmVsPSJub2ZvbGxvdyIgc3R5bGU9InRleHQtZGVjb3JhdGlvbi1saW5lOiBub25lOyBjb2xvcjogcmdiKDI1NSwgMjU1LCAyNTUpOyBtYXJnaW46IDBweDsgcGFkZGluZzogMHB4OyB3aGl0ZS1zcGFjZTogbm93cmFwOyBjdXJzb3I6IHBvaW50ZXI7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsgb3ZlcmZsb3c6IGhpZGRlbjsgdGV4dC1vdmVyZmxvdzogZWxsaXBzaXM7IGJvcmRlcjogMnB4IHNvbGlkIHJnYigyNDMsIDE1MiwgMjkpOyBvdXRsaW5lOiBub25lOyB3aWR0aDogNzBweDsgaGVpZ2h0OiAxOXB4OyBsaW5lLWhlaWdodDogMTlweDsgdGV4dC1hbGlnbjogY2VudGVyOyBkaXNwbGF5OiBpbmxpbmUtYmxvY2s7IGJhY2tncm91bmQ6IHJnYigyNDMsIDE1MiwgMjkpOyBmb250LXdlaWdodDogYm9sZDsgdmVydGljYWwtYWxpZ246IG1pZGRsZTsiPuaIkeimgeafpeecizwvYT48L3RkPjx0ZCBjbGFzcz0idGV4dC1jZW50ZXIiIHN0eWxlPSJtYXJnaW46IDBweDsgcGFkZGluZzogNnB4IDdweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyBib3JkZXItY29sbGFwc2U6IGNvbGxhcHNlOyBib3JkZXItc3BhY2luZzogMHB4OyB2ZXJ0aWNhbC1hbGlnbjogbWlkZGxlOyB0ZXh0LWFsaWduOiBjZW50ZXI7IGJvcmRlcjogMXB4IHNvbGlkIHJnYigyMDQsIDIwNCwgMjA0KTsiPuaLm+agh+aWh+S7tjwvdGQ+PHRkIGNsYXNzPSIiIHN0eWxlPSJtYXJnaW46IDBweDsgcGFkZGluZzogNnB4IDdweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyBib3JkZXItY29sbGFwc2U6IGNvbGxhcHNlOyBib3JkZXItc3BhY2luZzogMHB4OyB2ZXJ0aWNhbC1hbGlnbjogbWlkZGxlOyBib3JkZXI6IDFweCBzb2xpZCByZ2IoMjA0LCAyMDQsIDIwNCk7Ij48YSBocmVmPSJodHRwczovL3d3dy5iaWJlbmV0LmNvbS9sb2dpbi5qc3AiIGNsYXNzPSJsb2dpbiBsb29rIiB0YXJnZXQ9Il9ibGFuayIgcmVsPSJub2ZvbGxvdyIgc3R5bGU9InRleHQtZGVjb3JhdGlvbi1saW5lOiBub25lOyBjb2xvcjogcmdiKDI1NSwgMjU1LCAyNTUpOyBtYXJnaW46IDBweDsgcGFkZGluZzogMHB4OyB3aGl0ZS1zcGFjZTogbm93cmFwOyBjdXJzb3I6IHBvaW50ZXI7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsgb3ZlcmZsb3c6IGhpZGRlbjsgdGV4dC1vdmVyZmxvdzogZWxsaXBzaXM7IGJvcmRlcjogMnB4IHNvbGlkIHJnYigyNDMsIDE1MiwgMjkpOyBvdXRsaW5lOiBub25lOyB3aWR0aDogNzBweDsgaGVpZ2h0OiAxOXB4OyBsaW5lLWhlaWdodDogMTlweDsgdGV4dC1hbGlnbjogY2VudGVyOyBkaXNwbGF5OiBpbmxpbmUtYmxvY2s7IGJhY2tncm91bmQ6IHJnYigyNDMsIDE1MiwgMjkpOyBmb250LXdlaWdodDogYm9sZDsgdmVydGljYWwtYWxpZ246IG1pZGRsZTsiPuaIkeimgeafpeecizwvYT48L3RkPjwvdHI+PC90Ym9keT48L3RhYmxlPjxoNSBzdHlsZT0ibWFyZ2luOiAwcHggMHB4IDIwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyBmb250LXNpemU6IDE2cHg7IGZvbnQtd2VpZ2h0OiA0MDA7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij7lhY3otLnms6jlhozkvJrlkZgg5Y2z5Y+v5p+l55yLJm5ic3A7PHNwYW4gc3R5bGU9ImJvcmRlci1ib3R0b206IDNweCBzb2xpZCByZ2IoMjQzLCAxNTIsIDI5KTsiPuWFjei0uTwvc3Bhbj4mbmJzcDvmi5vmoIfkv6Hmga88L2g1PjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7IHdpZHRoOiAyNzVweDsgbGluZS1oZWlnaHQ6IDM2cHg7Ij7mr4/lpKnmm7TmlrAgMTUwMDAg5p2h5oub5qCH5L+h5oGvPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7IHdpZHRoOiAyNzVweDsgbGluZS1oZWlnaHQ6IDM2cHg7Ij7mtrXnm5botoXov4cgMTAwMDAwMCDlrrbmi5vmoIfljZXkvY08L3A+PHA+PGEgaHJlZj0iaHR0cHM6Ly93d3cuYmliZW5ldC5jb20vcHJvdGFsVXNlci90b1JlZ2lzdC5odG0iIGNsYXNzPSJyZWciIHRhcmdldD0iX2JsYW5rIiByZWw9Im5vZm9sbG93IiBzdHlsZT0idGV4dC1kZWNvcmF0aW9uLWxpbmU6IG5vbmU7IGNvbG9yOiByZ2IoMjU1LCAyNTUsIDI1NSk7IG1hcmdpbjogMHB4IDBweCA5cHg7IHBhZGRpbmc6IDBweDsgd2hpdGUtc3BhY2U6IG5vd3JhcDsgY3Vyc29yOiBwb2ludGVyOyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7IG92ZXJmbG93OiBoaWRkZW47IHRleHQtb3ZlcmZsb3c6IGVsbGlwc2lzOyBib3JkZXI6IDJweCBzb2xpZCByZ2IoMjQzLCAxNTIsIDI5KTsgb3V0bGluZTogbm9uZTsgd2lkdGg6IDIyMHB4OyBoZWlnaHQ6IDMwcHg7IGxpbmUtaGVpZ2h0OiAzMHB4OyB0ZXh0LWFsaWduOiBjZW50ZXI7IGRpc3BsYXk6IGlubGluZS1ibG9jazsgYmFja2dyb3VuZDogcmdiKDI0MywgMTUyLCAyOSk7IGZvbnQtd2VpZ2h0OiBib2xkOyI+56uL5Y2z5YWN6LS55rOo5YaMPC9hPjwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyB3aWR0aDogMjI0cHg7IGxpbmUtaGVpZ2h0OiAzNnB4OyI+5pu05aSa5LyY5Yq/5pyN5Yqh77ya6K+35p+l55yL5pyN5Yqh5YiX6KGoPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7IHdpZHRoOiAyMjRweDsgbGluZS1oZWlnaHQ6IDM2cHg7Ij7lhajlm73lhY3otLnmnI3liqHng63nur/vvJo0MDAtMDAwLTAzODg8L3A+PHAgc3R5bGU9Im1hcmdpbi10b3A6IDBweDsgbWFyZ2luLWJvdHRvbTogMHB4OyBwYWRkaW5nOiAwcHg7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsiPuOAkOeJqei1hOexu+OAkeS4reWbveeUteW7uuays+WNl+W3peeoi+WFrOWPuOWNjua2puayp+W3nui/kOS4nOmhueebrumDqOWNjua2puayp+W3nui/kOS4nOmSouadkOadkOaWmemHh+i0remhueebruaIkOS6pOWFrOekujwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyI+5L+h5oGv5LiL6L29PC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij7miqXlkI3lnLDlnYA6PGEgY2xhc3M9InVybDAiIHJlbD0ibm9mb2xsb3ciIHN0eWxlPSJtYXJnaW46IDBweDsgcGFkZGluZzogMHB4OyB3aGl0ZS1zcGFjZTogbm93cmFwOyBjdXJzb3I6IHBvaW50ZXI7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsgb3ZlcmZsb3c6IGhpZGRlbjsgdGV4dC1vdmVyZmxvdzogZWxsaXBzaXM7IGJvcmRlcjogbm9uZTsgb3V0bGluZTogbm9uZTsiPioqKioqKioqKioqKioqKioqKjwvYT48L3A+PGg1IHN0eWxlPSJtYXJnaW46IDIwcHggMHB4IDBweCAyMHB4OyBwYWRkaW5nOiAwcHg7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsgZm9udC1zaXplOiAxNnB4OyI+5oKo55uu5YmN54q25oCB77yaPHNwYW4gc3R5bGU9ImJvcmRlci1ib3R0b206IDNweCBzb2xpZCByZ2IoMjQzLCAxNTIsIDI5KTsiPumdnuazqOWGjOeUqOaItzwvc3Bhbj4mbmJzcDsoKirpg6jliIbkuLrpmpDol4/lhoXlrrnvvIzku4Xlr7nkvJrlkZjlvIDmlL4pPC9oNT48cCBzdHlsZT0ibWFyZ2luLXRvcDogMjBweDsgbWFyZ2luLWJvdHRvbTogMHB4OyBtYXJnaW4tbGVmdDogMjBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7IHdpZHRoOiA4NDhweDsgZGlzcGxheTogaW5saW5lLWJsb2NrOyBsaW5lLWhlaWdodDogNTBweDsiPjxzcGFuIGNsYXNzPSJmbCIgc3R5bGU9ImZsb2F0OiBsZWZ0OyI+5p+l55yL6ZqQ6JeP5YaF5a656K+35YWI55m75b2V5oiW5rOo5YaM5Lya5ZGYPC9zcGFuPjxhIGhyZWY9Imh0dHBzOi8vd3d3LmJpYmVuZXQuY29tL2xvZ2luLmpzcCIgY2xhc3M9ImJ0bl9tYWluIGZsIiByZWw9Im5vZm9sbG93IiBzdHlsZT0idGV4dC1kZWNvcmF0aW9uLWxpbmU6IG5vbmU7IGNvbG9yOiByZ2IoMjU1LCAyNTUsIDI1NSk7IG1hcmdpbjogMHB4IDBweCAwcHggMzZweDsgcGFkZGluZzogMHB4OyB3aGl0ZS1zcGFjZTogbm93cmFwOyBjdXJzb3I6IHBvaW50ZXI7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsgb3ZlcmZsb3c6IGhpZGRlbjsgdGV4dC1vdmVyZmxvdzogZWxsaXBzaXM7IGJvcmRlcjogMnB4IHNvbGlkIHJnYigyNDMsIDE1MiwgMjkpOyBvdXRsaW5lOiBub25lOyBmbG9hdDogbGVmdDsgd2lkdGg6IDExMHB4OyBoZWlnaHQ6IDM0cHg7IGxpbmUtaGVpZ2h0OiAzNHB4OyB0ZXh0LWFsaWduOiBjZW50ZXI7IGRpc3BsYXk6IGJsb2NrOyBiYWNrZ3JvdW5kOiByZ2IoMjQzLCAxNTIsIDI5KTsgZm9udC13ZWlnaHQ6IGJvbGQ7Ij7nmbsmbmJzcDsmbmJzcDvlvZU8L2E+PGEgaHJlZj0iaHR0cHM6Ly93d3cuYmliZW5ldC5jb20vcHJvdGFsVXNlci90b1JlZ2lzdC5odG0iIGNsYXNzPSJidG5fbWFpbiBmbCIgcmVsPSJub2ZvbGxvdyIgc3R5bGU9InRleHQtZGVjb3JhdGlvbi1saW5lOiBub25lOyBjb2xvcjogcmdiKDI1NSwgMjU1LCAyNTUpOyBtYXJnaW46IDBweCAwcHggMHB4IDM2cHg7IHBhZGRpbmc6IDBweDsgd2hpdGUtc3BhY2U6IG5vd3JhcDsgY3Vyc29yOiBwb2ludGVyOyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7IG92ZXJmbG93OiBoaWRkZW47IHRleHQtb3ZlcmZsb3c6IGVsbGlwc2lzOyBib3JkZXI6IDJweCBzb2xpZCByZ2IoMjQzLCAxNTIsIDI5KTsgb3V0bGluZTogbm9uZTsgZmxvYXQ6IGxlZnQ7IHdpZHRoOiAxMTBweDsgaGVpZ2h0OiAzNHB4OyBsaW5lLWhlaWdodDogMzRweDsgdGV4dC1hbGlnbjogY2VudGVyOyBkaXNwbGF5OiBibG9jazsgYmFja2dyb3VuZDogcmdiKDI0MywgMTUyLCAyOSk7IGZvbnQtd2VpZ2h0OiBib2xkOyI+5rOoJm5ic3A7Jm5ic3A75YaMPC9hPjxzcGFuIGNsYXNzPSJmbCIgc3R5bGU9ImZsb2F0OiBsZWZ0OyBtYXJnaW4tbGVmdDogMjBweDsgZm9udC13ZWlnaHQ6IDYwMDsiPuWuouacjeeDree6vzogNDAwLTAwMC0wMzg4PC9zcGFuPjwvcD48cD48aW1nIHNyYz0iaHR0cHM6Ly93d3cuYmliZW5ldC5jb20vc3RhdGljL2ltYWdlcy9hZHZlcnRpc2luZy9jZ19iYW5uZXIucG5nIiBzdHlsZT0idmVydGljYWwtYWxpZ246IHRvcDsgZGlzcGxheTogaW5saW5lLWJsb2NrOyBib3JkZXI6IDBweCBub25lOyBtYXgtd2lkdGg6IDEwMCU7Ii8+PC9wPjxwPjxici8+PC9wPg==', '0000-00-00 00:00:00', ' 13379668183', '1qq.com', '108', ' 1585555555', 0);
INSERT INTO `youbang_addoninfos` VALUES (1859, 1, -8, 0, 1, 0, ' 永和县桑壁镇人民政府署益村委南寨村委村级综合活动场所建设项目谈判公告', '/img/2019/8/13/d100323436304c5e51087726161ef8ce.png', '0', 0, '', 0, 0, 0, 0, 0, '0', 'PGgxIGNsYXNzPSJkZXRhaWx0aXRsZSIgdGl0bGU9IuawuOWSjOWOv+ahkeWjgemVh+S6uuawkeaUv+W6nOe9suebiuadkeWnlOWNl+WvqOadkeWnlOadkee6p+e7vOWQiOa0u+WKqOWcuuaJgOW7uuiuvumhueebruiwiOWIpOWFrOWRiiIgc3R5bGU9Im1hcmdpbjogMHB4OyBwYWRkaW5nOiAxMHB4IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyBmb250LXNpemU6IDE4cHg7IGZvbnQtd2VpZ2h0OiA0MDA7IGZvbnQtZmFtaWx5OiDlvq7ova/pm4Xpu5E7IGNvbG9yOiByZ2IoNTEsIDUxLCA1MSk7IHdoaXRlLXNwYWNlOiBub3JtYWw7IGxpbmUtaGVpZ2h0OiAyOHB4OyB0ZXh0LWFsaWduOiBjZW50ZXI7IGJvcmRlci1ib3R0b206IDFweCBkYXNoZWQgcmdiKDIwNCwgMjA0LCAyMDQpOyI+PGJyLz48L2gxPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij7msLjlkozljr/moZHlo4HplYfkurrmsJHmlL/lupw8c3BhbiBjbGFzcz0iZGl2LXdhcnAiIGlkPSJ3YXJwX2FyZWEiIHN0eWxlPSJwb3NpdGlvbjogcmVsYXRpdmU7IHRleHQtYWxpZ246IGNlbnRlcjsiPjxzcGFuIHN0eWxlPSJjb2xvcjogcmdiKDI0MywgMTUyLCAyOSk7IHRleHQtZGVjb3JhdGlvbi1saW5lOiB1bmRlcmxpbmU7Ij5b6IGU57O75pa55byPXTwvc3Bhbj48L3NwYW4+572y55uK5p2R5aeU5Y2X5a+o5p2R5aeU5p2R57qn57u85ZCI5rS75Yqo5Zy65omA5bu66K6+6aG555uu56ue5LqJ5oCn6LCI5Yik5YWs5ZGKPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij7msLjlkozljr/mlL/lupzph4fotK3kuK3lv4M8c3BhbiBjbGFzcz0iZGl2LXdhcnAiIGlkPSJ3YXJwX2FyZWEiIHN0eWxlPSJwb3NpdGlvbjogcmVsYXRpdmU7IHRleHQtYWxpZ246IGNlbnRlcjsiPjxzcGFuIHN0eWxlPSJjb2xvcjogcmdiKDI0MywgMTUyLCAyOSk7IHRleHQtZGVjb3JhdGlvbi1saW5lOiB1bmRlcmxpbmU7Ij5b6IGU57O75pa55byPXTwvc3Bhbj48L3NwYW4+5Y+X5qGR5aOB6ZWH5Lq65rCR5pS/5bqc5aeU5omY77yM5a+55qGR5aOB6ZWH572y55uK5p2R5aeU5Y2X5a+o5p2R5aeU5p2R57qn57u85ZCI5rS75Yqo5Zy65omA5bu66K6+6aG555uu57uE57uH56ue5LqJ5oCn6LCI5Yik6YeH6LSt77yM5qyi6L+O5YW35pyJ5om/5ouF5pys6aG555uu6IO95Yqb44CB6LWE5L+h6Imv5aW955qE5L6b5bqU5ZWG5Y+C5Yqg6LCI5Yik44CCPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB6aG555uu5ZCN56ewOuawuOWSjOWOv+ahkeWjgemVh+S6uuawkeaUv+W6nDxzcGFuIGNsYXNzPSJkaXYtd2FycCIgaWQ9IndhcnBfYXJlYSIgc3R5bGU9InBvc2l0aW9uOiByZWxhdGl2ZTsgdGV4dC1hbGlnbjogY2VudGVyOyI+PHNwYW4gc3R5bGU9ImNvbG9yOiByZ2IoMjQzLCAxNTIsIDI5KTsgdGV4dC1kZWNvcmF0aW9uLWxpbmU6IHVuZGVybGluZTsiPlvogZTns7vmlrnlvI9dPC9zcGFuPjwvc3Bhbj7nvbLnm4rmnZHlp5TljZflr6jmnZHlp5TmnZHnuqfnu7zlkIjmtLvliqjlnLrmiYDlu7rorr7pobnnm648L3A+PHAgc3R5bGU9Im1hcmdpbi10b3A6IDBweDsgbWFyZ2luLWJvdHRvbTogMHB4OyBwYWRkaW5nOiAwcHg7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsiPirjgIHpobnnm67nvJblj7c65rC45pS/6YeHKCoqKiopKioq5Y+3PC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB5oub5qCH5YaF5a6577ya5pys5qyh6LCI5Yik5YWxKumhue+8jOaKpeS7t+S6uuaJgOaKleWMheWGhemhueebruW/hemhu+WujOWFqOWTjeW6lOeji+WVhuaWh+S7tuaJgOWIl+WGheWuuTwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyI+KuOAgeaLm+agh+aOp+WItuS7t++8mioqKioqKi4qKuWFg+OAgjwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyI+KuOAgeaLm+agh+iMg+WbtO+8muWFt+S9k+aKleagh+aKpeS7t+iMg+WbtOWPiuaJgOW6lOi+vuWIsOeahOWFt+S9k+imgeaxgu+8jOS7peacrOiwiOWIpOaWh+S7tuS4ree9suebiuadkeWnlOWNl+WvqOadkeWnlOadkea0u+WKqOWcuuaJgOW7uuiuvumhueebrueahOWGheWuueS4uuWHhuOAgjwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyI+KuOAgeW7uuiuvuWcsOeCue+8muivpuingeiwiOWIpOaWh+S7tuOAgjwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyI+KuOAgeW3peacnyoq5pel5Y6G5aSp44CCPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB5pys6aG555uu5LiN5o6l5Y+X6IGU5ZCI5L2T5oqV5qCH44CCPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB5oqV5qCH5Lq66LWE5qC86KaB5rGCPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB5YW35pyJ54us56uL5om/5ouF5rCR5LqL6LSj5Lu755qE6IO95YqbPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB5YW35pyJ6Imv5aW955qE5ZWG5Lia5L+h6KqJ5ZKM5YGl5YWo55qE6LSi5Yqh5Lya6K6h5Yi25bqmPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB5YW35pyJ5bGl6KGM5ZCI5ZCM5omA5b+F6ZyA55qE6K6+5aSH5ZKM5LiT5Lia5oqA5pyv6IO95YqbPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB5YW35pyJ5L6d5rOV57y057qz56iO5pS25ZKM56S+5Lya5L+d6Zqc6LWE6YeR55qE6Imv5aW96K6w5b2VPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB5Y+C5Yqg5q2k6aG56YeH6LSt5rS75Yqo5YmNKuW5tOWGhe+8jOWcqOe7j+iQpea0u+WKqOS4reaXoOmHjeWkp+i/neazleiusOW9lTwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyI+KuOAgeWFt+acieaIv+Wxi+W7uuetkeW3peeoi+aWveW3peaAu+aJv+WMhSrnuqflj4rku6XkuIrotYTotKg8L3A+PHAgc3R5bGU9Im1hcmdpbi10b3A6IDBweDsgbWFyZ2luLWJvdHRvbTogMHB4OyBwYWRkaW5nOiAwcHg7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsiPirjgIHmoLnmja7jgIrlhbPkuo7lnKjmlL/lupzph4fotK3mtLvliqjkuK3mn6Xor6Llh6Dkvb/nlKjkv6HnlKjorrDlvZXmnInlhbPpl67popjnmoTpgJrnn6XjgIso6LSi5bqTKCoqKiopKioq5Y+355qE6KeE5a6a77yM5a+55YiX5YWl5aSx5L+h5omn6KGM5Lq644CB6YeN5aSn56iO5pS26L+d5rOV5qGI5Lu25b2T5LqL5Lq65ZCN5Y2V44CB5pS/5bqc6YeH6LSt5Lil6YeN6L+d5rOV5aSx5L+h6KGM5Li66K6w5b2V5ZCN5Y2V55qE5oqV5qCH5Lq677yM5ouS57ud5Y+C5LiO5pys6aG555uu6YeH6LSt5rS75Yqo77yMKOafpeivoua4oOmBk+KAnOS/oeeUqOS4reWbveKAnee9keermSoqKi4qKioqKioqKioqKi4qKiouKiop44CB5Lit5Zu95pS/5bqc6YeH6LSt572RKCoqKi4qKioqLioqKi4qKiko5p+l6K+i5pel5pyf5bqU5Zyo5pys5YWs5ZGK5Y+R5biD5pel5pyf5YaFKTwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyI+KuOAgeazleW+i+OAgeihjOaUv+azleinhOinhOWumueahOWFtuS7luadoeS7tjwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyI+KuOAgeS+m+W6lOWVhuiOt+WPluiwiOWIpOaWh+S7tumhu+aQuuW4pueahOi1hOaWme+8mjwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyI+KuOAgeS8geS4muazleS6uuWnlOaJmOS5puWSjOWPl+aJmOS6uui6q+S7veivgeWOn+S7tijlj5fmiZjkurrpobvmmK/mnKzlhazlj7jlhbfmnInkuK3nuqfogYznp7DnmoTmioDmnK/kurrlkZjmiJbpobnnm67otJ/otKPkuropKuOAgeS8geS4mue7hOe7h+acuuaehOS7o+eggeivgeWJr+acrOWOn+S7tu+8jOS8geS4mueojuWKoeeZu+iusOivgeWOn+S7tu+8jOS8geS4muazleS6uuiQpeS4muaJp+eFp+WJr+acrOWOn+S7tijmiJbogIUq6K+B5ZCIKueahOiQpeS4muaJp+eFp+WOn+S7tikq44CB5LyB5Lia6LWE6LSo6K+B5Lmm5Ymv5pys5Y6f5Lu2KuOAgeS8geS4muW3peeoi+inhOi0ueiuoeWPluagh+WHhuivgeS5puWOn+S7tirjgIHkvIHkuJrlronlhajnlJ/kuqforrjlj6/or4Hljp/ku7Yq44CB5rOV5a6a5Luj6KGo5Lq66Lqr5Lu96K+B5aSN5Y2w5Lu2KuOAgeS8geS4muWfuuacrOi0puaIt+W8gOaIt+iuuOWPr+ivgeWOn+S7tirjgIHmi5/mtL7lvoDmnKzlt6XnqIvnmoTlu7rpgKDluIjpobvmj5DkvpvmiL/lsYvlu7rnrZHkuJPkuJrnmoQq57qn5bu66YCg5biI5rOo5YaM6K+B5Lmm44CB5a6J5YWo55Sf5Lqn6ICD5qC45ZCI5qC86K+B5Lmm5Y+K6Lqr5Lu96K+B5Y6f5Lu2KuOAgeaLn+a0vuW+gOacrOW3peeoi+mhueebruaKgOacr+i0n+i0o+S6uumhu+aPkOS+m+ebuOWFs+S4k+S4mueahOS4ree6p+WPiuS7peS4iuiBjOensOivgeWOn+S7tuOAgjwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyI+5Lul5LiK6LWE5paZ5b+F6aG75o+Q5L6b5Y6f5Lu2KOWOn+S7tumqjOWQjuW9kui/mCnlkozliqDnm5bosIjliKTkurrlhaznq6DnmoTmuIXmmbDlpI3ljbDku7boo4XorqLmiJDlhowo55WZ5a2YKe+8jOS4lOWxnuS6juWQiOazleacieaViOeahO+8jOWmguS4jeiDveaPkOS+m++8jOWwhuS+neaNruOAiuS4reWNjuS6uuawkeWFseWSjOWbveaUv+W6nOmHh+i0reazleOAi+acieWFs+adoeS+i+inhOWumu+8jOacieadg+aLkue7neS+m+W6lOWVhuiOt+WPluiwiOWIpOaWh+S7tuOAgjwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyI+5pys6aG555uu5raJ5Y+K5ZWG5Yqh6YOo5YiG5ZKo6K+i6YeH6LSt5Lit5b+D5raJ5Y+K5oqA5pyv6YOo5YiG5ZKo6K+i6YeH6LSt5Lq644CCPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB6I635Y+W6LCI5Yik5paH5Lu2PC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB6I635Y+W6LCI5Yik5paH5Lu25pe26Ze077yaKioqKuW5tCrmnIgqKuaXpeiHsyoqKirlubQq5pyIKirml6Uo5YyX5Lqs5pe26Ze0Ku+8mioqLSoq77yaKirvvIwqKu+8mioqLSoq77yaKiop5YWs5LyR5pel44CB6IqC5YGH5pel6Zmk5aSW44CCPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB6I635Y+W5Zyw54K577ya5rC45ZKM5Y6/5pS/5bqc6YeH6LSt5Lit5b+DPHNwYW4gY2xhc3M9ImRpdi13YXJwIiBpZD0id2FycF9hcmVhIiBzdHlsZT0icG9zaXRpb246IHJlbGF0aXZlOyB0ZXh0LWFsaWduOiBjZW50ZXI7Ij48c3BhbiBzdHlsZT0iY29sb3I6IHJnYigyNDMsIDE1MiwgMjkpOyB0ZXh0LWRlY29yYXRpb24tbGluZTogdW5kZXJsaW5lOyI+W+iBlOezu+aWueW8j108L3NwYW4+PC9zcGFuPuW6nOilv+ihlyrlj7c8L3A+PHAgc3R5bGU9Im1hcmdpbi10b3A6IDBweDsgbWFyZ2luLWJvdHRvbTogMHB4OyBwYWRkaW5nOiAwcHg7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsiPirjgIHosIjliKTml7bpl7Tlj4rlnLDngrnvvJo8L3A+PHAgc3R5bGU9Im1hcmdpbi10b3A6IDBweDsgbWFyZ2luLWJvdHRvbTogMHB4OyBwYWRkaW5nOiAwcHg7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsiPirjgIHml7bpl7TvvJoqKioq5bm0KuaciCoq5pel5LiK5Y2IKirml7YqKuWIhijljJfkuqzml7bpl7QpPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB5Zyw54K577ya5rC45ZKM5Y6/6YeH6LSt5Lit5b+D5oub5qCH5a6kKOWOv+WuvummhumZouWGheaUv+WKoeS4reW/gyk8L3A+PHAgc3R5bGU9Im1hcmdpbi10b3A6IDBweDsgbWFyZ2luLWJvdHRvbTogMHB4OyBwYWRkaW5nOiAwcHg7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsiPirjgIHogZTns7vmlrnlvI88L3A+PHAgc3R5bGU9Im1hcmdpbi10b3A6IDBweDsgbWFyZ2luLWJvdHRvbTogMHB4OyBwYWRkaW5nOiAwcHg7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsiPumHh+i0reWNleS9je+8muawuOWSjOWOv+ahkeWjgemVh+S6uuawkeaUv+W6nDxzcGFuIGNsYXNzPSJkaXYtd2FycCIgaWQ9IndhcnBfYXJlYSIgc3R5bGU9InBvc2l0aW9uOiByZWxhdGl2ZTsgdGV4dC1hbGlnbjogY2VudGVyOyI+PHNwYW4gc3R5bGU9ImNvbG9yOiByZ2IoMjQzLCAxNTIsIDI5KTsgdGV4dC1kZWNvcmF0aW9uLWxpbmU6IHVuZGVybGluZTsiPlvogZTns7vmlrnlvI9dPC9zcGFuPjwvc3Bhbj48L3A+PHAgc3R5bGU9Im1hcmdpbi10b3A6IDBweDsgbWFyZ2luLWJvdHRvbTogMHB4OyBwYWRkaW5nOiAwcHg7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsiPuiBlOezu+S6uu+8muadjuWFiOeUnzwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyI+6IGU57O755S16K+d77yaKioqKioqKioqKio8L3A+PHAgc3R5bGU9Im1hcmdpbi10b3A6IDBweDsgbWFyZ2luLWJvdHRvbTogMHB4OyBwYWRkaW5nOiAwcHg7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsiPumbhumHh+acuuaehO+8muawuOWSjOWOv+aUv+W6nOmHh+i0reS4reW/gzxzcGFuIGNsYXNzPSJkaXYtd2FycCIgaWQ9IndhcnBfYXJlYSIgc3R5bGU9InBvc2l0aW9uOiByZWxhdGl2ZTsgdGV4dC1hbGlnbjogY2VudGVyOyI+PHNwYW4gc3R5bGU9ImNvbG9yOiByZ2IoMjQzLCAxNTIsIDI5KTsgdGV4dC1kZWNvcmF0aW9uLWxpbmU6IHVuZGVybGluZTsiPlvogZTns7vmlrnlvI9dPC9zcGFuPjwvc3Bhbj48L3A+PHAgc3R5bGU9Im1hcmdpbi10b3A6IDBweDsgbWFyZ2luLWJvdHRvbTogMHB4OyBwYWRkaW5nOiAwcHg7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsiPuiBlOezu+S6uu+8muS7u+Wls+WjqzwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyI+6IGU57O755S16K+d77yaKioqKi0qKioqKioqPC9wPjxwPjxici8+PC9wPg==', '0000-00-00 00:00:00', '18188888888', '888888.com', '109', ' 1585555555', 0);
INSERT INTO `youbang_addoninfos` VALUES (1860, 1, -8, 0, 1, 0, ' 永和县桑壁镇人民政府署益村委南寨村委村级综合活动场所建设项目谈判公告', '/img/2019/8/13/d100323436304c5e51087726161ef8ce.png', '0', 0, '', 0, 0, 0, 0, 0, '0', 'PGgxIGNsYXNzPSJkZXRhaWx0aXRsZSIgdGl0bGU9IuawuOWSjOWOv+ahkeWjgemVh+S6uuawkeaUv+W6nOe9suebiuadkeWnlOWNl+WvqOadkeWnlOadkee6p+e7vOWQiOa0u+WKqOWcuuaJgOW7uuiuvumhueebruiwiOWIpOWFrOWRiiIgc3R5bGU9Im1hcmdpbjogMHB4OyBwYWRkaW5nOiAxMHB4IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyBmb250LXNpemU6IDE4cHg7IGZvbnQtd2VpZ2h0OiA0MDA7IGZvbnQtZmFtaWx5OiDlvq7ova/pm4Xpu5E7IGNvbG9yOiByZ2IoNTEsIDUxLCA1MSk7IHdoaXRlLXNwYWNlOiBub3JtYWw7IGxpbmUtaGVpZ2h0OiAyOHB4OyB0ZXh0LWFsaWduOiBjZW50ZXI7IGJvcmRlci1ib3R0b206IDFweCBkYXNoZWQgcmdiKDIwNCwgMjA0LCAyMDQpOyI+PGJyLz48L2gxPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij7msLjlkozljr/moZHlo4HplYfkurrmsJHmlL/lupw8c3BhbiBjbGFzcz0iZGl2LXdhcnAiIGlkPSJ3YXJwX2FyZWEiIHN0eWxlPSJwb3NpdGlvbjogcmVsYXRpdmU7IHRleHQtYWxpZ246IGNlbnRlcjsiPjxzcGFuIHN0eWxlPSJjb2xvcjogcmdiKDI0MywgMTUyLCAyOSk7IHRleHQtZGVjb3JhdGlvbi1saW5lOiB1bmRlcmxpbmU7Ij5b6IGU57O75pa55byPXTwvc3Bhbj48L3NwYW4+572y55uK5p2R5aeU5Y2X5a+o5p2R5aeU5p2R57qn57u85ZCI5rS75Yqo5Zy65omA5bu66K6+6aG555uu56ue5LqJ5oCn6LCI5Yik5YWs5ZGKPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij7msLjlkozljr/mlL/lupzph4fotK3kuK3lv4M8c3BhbiBjbGFzcz0iZGl2LXdhcnAiIGlkPSJ3YXJwX2FyZWEiIHN0eWxlPSJwb3NpdGlvbjogcmVsYXRpdmU7IHRleHQtYWxpZ246IGNlbnRlcjsiPjxzcGFuIHN0eWxlPSJjb2xvcjogcmdiKDI0MywgMTUyLCAyOSk7IHRleHQtZGVjb3JhdGlvbi1saW5lOiB1bmRlcmxpbmU7Ij5b6IGU57O75pa55byPXTwvc3Bhbj48L3NwYW4+5Y+X5qGR5aOB6ZWH5Lq65rCR5pS/5bqc5aeU5omY77yM5a+55qGR5aOB6ZWH572y55uK5p2R5aeU5Y2X5a+o5p2R5aeU5p2R57qn57u85ZCI5rS75Yqo5Zy65omA5bu66K6+6aG555uu57uE57uH56ue5LqJ5oCn6LCI5Yik6YeH6LSt77yM5qyi6L+O5YW35pyJ5om/5ouF5pys6aG555uu6IO95Yqb44CB6LWE5L+h6Imv5aW955qE5L6b5bqU5ZWG5Y+C5Yqg6LCI5Yik44CCPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB6aG555uu5ZCN56ewOuawuOWSjOWOv+ahkeWjgemVh+S6uuawkeaUv+W6nDxzcGFuIGNsYXNzPSJkaXYtd2FycCIgaWQ9IndhcnBfYXJlYSIgc3R5bGU9InBvc2l0aW9uOiByZWxhdGl2ZTsgdGV4dC1hbGlnbjogY2VudGVyOyI+PHNwYW4gc3R5bGU9ImNvbG9yOiByZ2IoMjQzLCAxNTIsIDI5KTsgdGV4dC1kZWNvcmF0aW9uLWxpbmU6IHVuZGVybGluZTsiPlvogZTns7vmlrnlvI9dPC9zcGFuPjwvc3Bhbj7nvbLnm4rmnZHlp5TljZflr6jmnZHlp5TmnZHnuqfnu7zlkIjmtLvliqjlnLrmiYDlu7rorr7pobnnm648L3A+PHAgc3R5bGU9Im1hcmdpbi10b3A6IDBweDsgbWFyZ2luLWJvdHRvbTogMHB4OyBwYWRkaW5nOiAwcHg7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsiPirjgIHpobnnm67nvJblj7c65rC45pS/6YeHKCoqKiopKioq5Y+3PC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB5oub5qCH5YaF5a6577ya5pys5qyh6LCI5Yik5YWxKumhue+8jOaKpeS7t+S6uuaJgOaKleWMheWGhemhueebruW/hemhu+WujOWFqOWTjeW6lOeji+WVhuaWh+S7tuaJgOWIl+WGheWuuTwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyI+KuOAgeaLm+agh+aOp+WItuS7t++8mioqKioqKi4qKuWFg+OAgjwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyI+KuOAgeaLm+agh+iMg+WbtO+8muWFt+S9k+aKleagh+aKpeS7t+iMg+WbtOWPiuaJgOW6lOi+vuWIsOeahOWFt+S9k+imgeaxgu+8jOS7peacrOiwiOWIpOaWh+S7tuS4ree9suebiuadkeWnlOWNl+WvqOadkeWnlOadkea0u+WKqOWcuuaJgOW7uuiuvumhueebrueahOWGheWuueS4uuWHhuOAgjwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyI+KuOAgeW7uuiuvuWcsOeCue+8muivpuingeiwiOWIpOaWh+S7tuOAgjwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyI+KuOAgeW3peacnyoq5pel5Y6G5aSp44CCPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB5pys6aG555uu5LiN5o6l5Y+X6IGU5ZCI5L2T5oqV5qCH44CCPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB5oqV5qCH5Lq66LWE5qC86KaB5rGCPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB5YW35pyJ54us56uL5om/5ouF5rCR5LqL6LSj5Lu755qE6IO95YqbPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB5YW35pyJ6Imv5aW955qE5ZWG5Lia5L+h6KqJ5ZKM5YGl5YWo55qE6LSi5Yqh5Lya6K6h5Yi25bqmPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB5YW35pyJ5bGl6KGM5ZCI5ZCM5omA5b+F6ZyA55qE6K6+5aSH5ZKM5LiT5Lia5oqA5pyv6IO95YqbPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB5YW35pyJ5L6d5rOV57y057qz56iO5pS25ZKM56S+5Lya5L+d6Zqc6LWE6YeR55qE6Imv5aW96K6w5b2VPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB5Y+C5Yqg5q2k6aG56YeH6LSt5rS75Yqo5YmNKuW5tOWGhe+8jOWcqOe7j+iQpea0u+WKqOS4reaXoOmHjeWkp+i/neazleiusOW9lTwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyI+KuOAgeWFt+acieaIv+Wxi+W7uuetkeW3peeoi+aWveW3peaAu+aJv+WMhSrnuqflj4rku6XkuIrotYTotKg8L3A+PHAgc3R5bGU9Im1hcmdpbi10b3A6IDBweDsgbWFyZ2luLWJvdHRvbTogMHB4OyBwYWRkaW5nOiAwcHg7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsiPirjgIHmoLnmja7jgIrlhbPkuo7lnKjmlL/lupzph4fotK3mtLvliqjkuK3mn6Xor6Llh6Dkvb/nlKjkv6HnlKjorrDlvZXmnInlhbPpl67popjnmoTpgJrnn6XjgIso6LSi5bqTKCoqKiopKioq5Y+355qE6KeE5a6a77yM5a+55YiX5YWl5aSx5L+h5omn6KGM5Lq644CB6YeN5aSn56iO5pS26L+d5rOV5qGI5Lu25b2T5LqL5Lq65ZCN5Y2V44CB5pS/5bqc6YeH6LSt5Lil6YeN6L+d5rOV5aSx5L+h6KGM5Li66K6w5b2V5ZCN5Y2V55qE5oqV5qCH5Lq677yM5ouS57ud5Y+C5LiO5pys6aG555uu6YeH6LSt5rS75Yqo77yMKOafpeivoua4oOmBk+KAnOS/oeeUqOS4reWbveKAnee9keermSoqKi4qKioqKioqKioqKi4qKiouKiop44CB5Lit5Zu95pS/5bqc6YeH6LSt572RKCoqKi4qKioqLioqKi4qKiko5p+l6K+i5pel5pyf5bqU5Zyo5pys5YWs5ZGK5Y+R5biD5pel5pyf5YaFKTwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyI+KuOAgeazleW+i+OAgeihjOaUv+azleinhOinhOWumueahOWFtuS7luadoeS7tjwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyI+KuOAgeS+m+W6lOWVhuiOt+WPluiwiOWIpOaWh+S7tumhu+aQuuW4pueahOi1hOaWme+8mjwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyI+KuOAgeS8geS4muazleS6uuWnlOaJmOS5puWSjOWPl+aJmOS6uui6q+S7veivgeWOn+S7tijlj5fmiZjkurrpobvmmK/mnKzlhazlj7jlhbfmnInkuK3nuqfogYznp7DnmoTmioDmnK/kurrlkZjmiJbpobnnm67otJ/otKPkuropKuOAgeS8geS4mue7hOe7h+acuuaehOS7o+eggeivgeWJr+acrOWOn+S7tu+8jOS8geS4mueojuWKoeeZu+iusOivgeWOn+S7tu+8jOS8geS4muazleS6uuiQpeS4muaJp+eFp+WJr+acrOWOn+S7tijmiJbogIUq6K+B5ZCIKueahOiQpeS4muaJp+eFp+WOn+S7tikq44CB5LyB5Lia6LWE6LSo6K+B5Lmm5Ymv5pys5Y6f5Lu2KuOAgeS8geS4muW3peeoi+inhOi0ueiuoeWPluagh+WHhuivgeS5puWOn+S7tirjgIHkvIHkuJrlronlhajnlJ/kuqforrjlj6/or4Hljp/ku7Yq44CB5rOV5a6a5Luj6KGo5Lq66Lqr5Lu96K+B5aSN5Y2w5Lu2KuOAgeS8geS4muWfuuacrOi0puaIt+W8gOaIt+iuuOWPr+ivgeWOn+S7tirjgIHmi5/mtL7lvoDmnKzlt6XnqIvnmoTlu7rpgKDluIjpobvmj5DkvpvmiL/lsYvlu7rnrZHkuJPkuJrnmoQq57qn5bu66YCg5biI5rOo5YaM6K+B5Lmm44CB5a6J5YWo55Sf5Lqn6ICD5qC45ZCI5qC86K+B5Lmm5Y+K6Lqr5Lu96K+B5Y6f5Lu2KuOAgeaLn+a0vuW+gOacrOW3peeoi+mhueebruaKgOacr+i0n+i0o+S6uumhu+aPkOS+m+ebuOWFs+S4k+S4mueahOS4ree6p+WPiuS7peS4iuiBjOensOivgeWOn+S7tuOAgjwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyI+5Lul5LiK6LWE5paZ5b+F6aG75o+Q5L6b5Y6f5Lu2KOWOn+S7tumqjOWQjuW9kui/mCnlkozliqDnm5bosIjliKTkurrlhaznq6DnmoTmuIXmmbDlpI3ljbDku7boo4XorqLmiJDlhowo55WZ5a2YKe+8jOS4lOWxnuS6juWQiOazleacieaViOeahO+8jOWmguS4jeiDveaPkOS+m++8jOWwhuS+neaNruOAiuS4reWNjuS6uuawkeWFseWSjOWbveaUv+W6nOmHh+i0reazleOAi+acieWFs+adoeS+i+inhOWumu+8jOacieadg+aLkue7neS+m+W6lOWVhuiOt+WPluiwiOWIpOaWh+S7tuOAgjwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyI+5pys6aG555uu5raJ5Y+K5ZWG5Yqh6YOo5YiG5ZKo6K+i6YeH6LSt5Lit5b+D5raJ5Y+K5oqA5pyv6YOo5YiG5ZKo6K+i6YeH6LSt5Lq644CCPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB6I635Y+W6LCI5Yik5paH5Lu2PC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB6I635Y+W6LCI5Yik5paH5Lu25pe26Ze077yaKioqKuW5tCrmnIgqKuaXpeiHsyoqKirlubQq5pyIKirml6Uo5YyX5Lqs5pe26Ze0Ku+8mioqLSoq77yaKirvvIwqKu+8mioqLSoq77yaKiop5YWs5LyR5pel44CB6IqC5YGH5pel6Zmk5aSW44CCPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB6I635Y+W5Zyw54K577ya5rC45ZKM5Y6/5pS/5bqc6YeH6LSt5Lit5b+DPHNwYW4gY2xhc3M9ImRpdi13YXJwIiBpZD0id2FycF9hcmVhIiBzdHlsZT0icG9zaXRpb246IHJlbGF0aXZlOyB0ZXh0LWFsaWduOiBjZW50ZXI7Ij48c3BhbiBzdHlsZT0iY29sb3I6IHJnYigyNDMsIDE1MiwgMjkpOyB0ZXh0LWRlY29yYXRpb24tbGluZTogdW5kZXJsaW5lOyI+W+iBlOezu+aWueW8j108L3NwYW4+PC9zcGFuPuW6nOilv+ihlyrlj7c8L3A+PHAgc3R5bGU9Im1hcmdpbi10b3A6IDBweDsgbWFyZ2luLWJvdHRvbTogMHB4OyBwYWRkaW5nOiAwcHg7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsiPirjgIHosIjliKTml7bpl7Tlj4rlnLDngrnvvJo8L3A+PHAgc3R5bGU9Im1hcmdpbi10b3A6IDBweDsgbWFyZ2luLWJvdHRvbTogMHB4OyBwYWRkaW5nOiAwcHg7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsiPirjgIHml7bpl7TvvJoqKioq5bm0KuaciCoq5pel5LiK5Y2IKirml7YqKuWIhijljJfkuqzml7bpl7QpPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB5Zyw54K577ya5rC45ZKM5Y6/6YeH6LSt5Lit5b+D5oub5qCH5a6kKOWOv+WuvummhumZouWGheaUv+WKoeS4reW/gyk8L3A+PHAgc3R5bGU9Im1hcmdpbi10b3A6IDBweDsgbWFyZ2luLWJvdHRvbTogMHB4OyBwYWRkaW5nOiAwcHg7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsiPirjgIHogZTns7vmlrnlvI88L3A+PHAgc3R5bGU9Im1hcmdpbi10b3A6IDBweDsgbWFyZ2luLWJvdHRvbTogMHB4OyBwYWRkaW5nOiAwcHg7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsiPumHh+i0reWNleS9je+8muawuOWSjOWOv+ahkeWjgemVh+S6uuawkeaUv+W6nDxzcGFuIGNsYXNzPSJkaXYtd2FycCIgaWQ9IndhcnBfYXJlYSIgc3R5bGU9InBvc2l0aW9uOiByZWxhdGl2ZTsgdGV4dC1hbGlnbjogY2VudGVyOyI+PHNwYW4gc3R5bGU9ImNvbG9yOiByZ2IoMjQzLCAxNTIsIDI5KTsgdGV4dC1kZWNvcmF0aW9uLWxpbmU6IHVuZGVybGluZTsiPlvogZTns7vmlrnlvI9dPC9zcGFuPjwvc3Bhbj48L3A+PHAgc3R5bGU9Im1hcmdpbi10b3A6IDBweDsgbWFyZ2luLWJvdHRvbTogMHB4OyBwYWRkaW5nOiAwcHg7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsiPuiBlOezu+S6uu+8muadjuWFiOeUnzwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyI+6IGU57O755S16K+d77yaKioqKioqKioqKio8L3A+PHAgc3R5bGU9Im1hcmdpbi10b3A6IDBweDsgbWFyZ2luLWJvdHRvbTogMHB4OyBwYWRkaW5nOiAwcHg7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsiPumbhumHh+acuuaehO+8muawuOWSjOWOv+aUv+W6nOmHh+i0reS4reW/gzxzcGFuIGNsYXNzPSJkaXYtd2FycCIgaWQ9IndhcnBfYXJlYSIgc3R5bGU9InBvc2l0aW9uOiByZWxhdGl2ZTsgdGV4dC1hbGlnbjogY2VudGVyOyI+PHNwYW4gc3R5bGU9ImNvbG9yOiByZ2IoMjQzLCAxNTIsIDI5KTsgdGV4dC1kZWNvcmF0aW9uLWxpbmU6IHVuZGVybGluZTsiPlvogZTns7vmlrnlvI9dPC9zcGFuPjwvc3Bhbj48L3A+PHAgc3R5bGU9Im1hcmdpbi10b3A6IDBweDsgbWFyZ2luLWJvdHRvbTogMHB4OyBwYWRkaW5nOiAwcHg7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsiPuiBlOezu+S6uu+8muS7u+Wls+WjqzwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyI+6IGU57O755S16K+d77yaKioqKi0qKioqKioqPC9wPjxwPjxici8+PC9wPg==', '0000-00-00 00:00:00', '18188888888', '888888.com', '109', ' 1585555555', 0);
INSERT INTO `youbang_addoninfos` VALUES (1861, 1, -8, 0, 1, 0, ' 永和县桑壁镇人民政府署益村委南寨村委村级综合活动场所建设项目谈判公告', '/img/2019/8/13/d100323436304c5e51087726161ef8ce.png', '0', 0, '', 0, 0, 0, 0, 0, '0', 'PGgxIGNsYXNzPSJkZXRhaWx0aXRsZSIgdGl0bGU9IuawuOWSjOWOv+ahkeWjgemVh+S6uuawkeaUv+W6nOe9suebiuadkeWnlOWNl+WvqOadkeWnlOadkee6p+e7vOWQiOa0u+WKqOWcuuaJgOW7uuiuvumhueebruiwiOWIpOWFrOWRiiIgc3R5bGU9Im1hcmdpbjogMHB4OyBwYWRkaW5nOiAxMHB4IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyBmb250LXNpemU6IDE4cHg7IGZvbnQtd2VpZ2h0OiA0MDA7IGZvbnQtZmFtaWx5OiDlvq7ova/pm4Xpu5E7IGNvbG9yOiByZ2IoNTEsIDUxLCA1MSk7IHdoaXRlLXNwYWNlOiBub3JtYWw7IGxpbmUtaGVpZ2h0OiAyOHB4OyB0ZXh0LWFsaWduOiBjZW50ZXI7IGJvcmRlci1ib3R0b206IDFweCBkYXNoZWQgcmdiKDIwNCwgMjA0LCAyMDQpOyI+PGJyLz48L2gxPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij7msLjlkozljr/moZHlo4HplYfkurrmsJHmlL/lupw8c3BhbiBjbGFzcz0iZGl2LXdhcnAiIGlkPSJ3YXJwX2FyZWEiIHN0eWxlPSJwb3NpdGlvbjogcmVsYXRpdmU7IHRleHQtYWxpZ246IGNlbnRlcjsiPjxzcGFuIHN0eWxlPSJjb2xvcjogcmdiKDI0MywgMTUyLCAyOSk7IHRleHQtZGVjb3JhdGlvbi1saW5lOiB1bmRlcmxpbmU7Ij5b6IGU57O75pa55byPXTwvc3Bhbj48L3NwYW4+572y55uK5p2R5aeU5Y2X5a+o5p2R5aeU5p2R57qn57u85ZCI5rS75Yqo5Zy65omA5bu66K6+6aG555uu56ue5LqJ5oCn6LCI5Yik5YWs5ZGKPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij7msLjlkozljr/mlL/lupzph4fotK3kuK3lv4M8c3BhbiBjbGFzcz0iZGl2LXdhcnAiIGlkPSJ3YXJwX2FyZWEiIHN0eWxlPSJwb3NpdGlvbjogcmVsYXRpdmU7IHRleHQtYWxpZ246IGNlbnRlcjsiPjxzcGFuIHN0eWxlPSJjb2xvcjogcmdiKDI0MywgMTUyLCAyOSk7IHRleHQtZGVjb3JhdGlvbi1saW5lOiB1bmRlcmxpbmU7Ij5b6IGU57O75pa55byPXTwvc3Bhbj48L3NwYW4+5Y+X5qGR5aOB6ZWH5Lq65rCR5pS/5bqc5aeU5omY77yM5a+55qGR5aOB6ZWH572y55uK5p2R5aeU5Y2X5a+o5p2R5aeU5p2R57qn57u85ZCI5rS75Yqo5Zy65omA5bu66K6+6aG555uu57uE57uH56ue5LqJ5oCn6LCI5Yik6YeH6LSt77yM5qyi6L+O5YW35pyJ5om/5ouF5pys6aG555uu6IO95Yqb44CB6LWE5L+h6Imv5aW955qE5L6b5bqU5ZWG5Y+C5Yqg6LCI5Yik44CCPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB6aG555uu5ZCN56ewOuawuOWSjOWOv+ahkeWjgemVh+S6uuawkeaUv+W6nDxzcGFuIGNsYXNzPSJkaXYtd2FycCIgaWQ9IndhcnBfYXJlYSIgc3R5bGU9InBvc2l0aW9uOiByZWxhdGl2ZTsgdGV4dC1hbGlnbjogY2VudGVyOyI+PHNwYW4gc3R5bGU9ImNvbG9yOiByZ2IoMjQzLCAxNTIsIDI5KTsgdGV4dC1kZWNvcmF0aW9uLWxpbmU6IHVuZGVybGluZTsiPlvogZTns7vmlrnlvI9dPC9zcGFuPjwvc3Bhbj7nvbLnm4rmnZHlp5TljZflr6jmnZHlp5TmnZHnuqfnu7zlkIjmtLvliqjlnLrmiYDlu7rorr7pobnnm648L3A+PHAgc3R5bGU9Im1hcmdpbi10b3A6IDBweDsgbWFyZ2luLWJvdHRvbTogMHB4OyBwYWRkaW5nOiAwcHg7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsiPirjgIHpobnnm67nvJblj7c65rC45pS/6YeHKCoqKiopKioq5Y+3PC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB5oub5qCH5YaF5a6577ya5pys5qyh6LCI5Yik5YWxKumhue+8jOaKpeS7t+S6uuaJgOaKleWMheWGhemhueebruW/hemhu+WujOWFqOWTjeW6lOeji+WVhuaWh+S7tuaJgOWIl+WGheWuuTwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyI+KuOAgeaLm+agh+aOp+WItuS7t++8mioqKioqKi4qKuWFg+OAgjwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyI+KuOAgeaLm+agh+iMg+WbtO+8muWFt+S9k+aKleagh+aKpeS7t+iMg+WbtOWPiuaJgOW6lOi+vuWIsOeahOWFt+S9k+imgeaxgu+8jOS7peacrOiwiOWIpOaWh+S7tuS4ree9suebiuadkeWnlOWNl+WvqOadkeWnlOadkea0u+WKqOWcuuaJgOW7uuiuvumhueebrueahOWGheWuueS4uuWHhuOAgjwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyI+KuOAgeW7uuiuvuWcsOeCue+8muivpuingeiwiOWIpOaWh+S7tuOAgjwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyI+KuOAgeW3peacnyoq5pel5Y6G5aSp44CCPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB5pys6aG555uu5LiN5o6l5Y+X6IGU5ZCI5L2T5oqV5qCH44CCPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB5oqV5qCH5Lq66LWE5qC86KaB5rGCPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB5YW35pyJ54us56uL5om/5ouF5rCR5LqL6LSj5Lu755qE6IO95YqbPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB5YW35pyJ6Imv5aW955qE5ZWG5Lia5L+h6KqJ5ZKM5YGl5YWo55qE6LSi5Yqh5Lya6K6h5Yi25bqmPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB5YW35pyJ5bGl6KGM5ZCI5ZCM5omA5b+F6ZyA55qE6K6+5aSH5ZKM5LiT5Lia5oqA5pyv6IO95YqbPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB5YW35pyJ5L6d5rOV57y057qz56iO5pS25ZKM56S+5Lya5L+d6Zqc6LWE6YeR55qE6Imv5aW96K6w5b2VPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB5Y+C5Yqg5q2k6aG56YeH6LSt5rS75Yqo5YmNKuW5tOWGhe+8jOWcqOe7j+iQpea0u+WKqOS4reaXoOmHjeWkp+i/neazleiusOW9lTwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyI+KuOAgeWFt+acieaIv+Wxi+W7uuetkeW3peeoi+aWveW3peaAu+aJv+WMhSrnuqflj4rku6XkuIrotYTotKg8L3A+PHAgc3R5bGU9Im1hcmdpbi10b3A6IDBweDsgbWFyZ2luLWJvdHRvbTogMHB4OyBwYWRkaW5nOiAwcHg7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsiPirjgIHmoLnmja7jgIrlhbPkuo7lnKjmlL/lupzph4fotK3mtLvliqjkuK3mn6Xor6Llh6Dkvb/nlKjkv6HnlKjorrDlvZXmnInlhbPpl67popjnmoTpgJrnn6XjgIso6LSi5bqTKCoqKiopKioq5Y+355qE6KeE5a6a77yM5a+55YiX5YWl5aSx5L+h5omn6KGM5Lq644CB6YeN5aSn56iO5pS26L+d5rOV5qGI5Lu25b2T5LqL5Lq65ZCN5Y2V44CB5pS/5bqc6YeH6LSt5Lil6YeN6L+d5rOV5aSx5L+h6KGM5Li66K6w5b2V5ZCN5Y2V55qE5oqV5qCH5Lq677yM5ouS57ud5Y+C5LiO5pys6aG555uu6YeH6LSt5rS75Yqo77yMKOafpeivoua4oOmBk+KAnOS/oeeUqOS4reWbveKAnee9keermSoqKi4qKioqKioqKioqKi4qKiouKiop44CB5Lit5Zu95pS/5bqc6YeH6LSt572RKCoqKi4qKioqLioqKi4qKiko5p+l6K+i5pel5pyf5bqU5Zyo5pys5YWs5ZGK5Y+R5biD5pel5pyf5YaFKTwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyI+KuOAgeazleW+i+OAgeihjOaUv+azleinhOinhOWumueahOWFtuS7luadoeS7tjwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyI+KuOAgeS+m+W6lOWVhuiOt+WPluiwiOWIpOaWh+S7tumhu+aQuuW4pueahOi1hOaWme+8mjwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyI+KuOAgeS8geS4muazleS6uuWnlOaJmOS5puWSjOWPl+aJmOS6uui6q+S7veivgeWOn+S7tijlj5fmiZjkurrpobvmmK/mnKzlhazlj7jlhbfmnInkuK3nuqfogYznp7DnmoTmioDmnK/kurrlkZjmiJbpobnnm67otJ/otKPkuropKuOAgeS8geS4mue7hOe7h+acuuaehOS7o+eggeivgeWJr+acrOWOn+S7tu+8jOS8geS4mueojuWKoeeZu+iusOivgeWOn+S7tu+8jOS8geS4muazleS6uuiQpeS4muaJp+eFp+WJr+acrOWOn+S7tijmiJbogIUq6K+B5ZCIKueahOiQpeS4muaJp+eFp+WOn+S7tikq44CB5LyB5Lia6LWE6LSo6K+B5Lmm5Ymv5pys5Y6f5Lu2KuOAgeS8geS4muW3peeoi+inhOi0ueiuoeWPluagh+WHhuivgeS5puWOn+S7tirjgIHkvIHkuJrlronlhajnlJ/kuqforrjlj6/or4Hljp/ku7Yq44CB5rOV5a6a5Luj6KGo5Lq66Lqr5Lu96K+B5aSN5Y2w5Lu2KuOAgeS8geS4muWfuuacrOi0puaIt+W8gOaIt+iuuOWPr+ivgeWOn+S7tirjgIHmi5/mtL7lvoDmnKzlt6XnqIvnmoTlu7rpgKDluIjpobvmj5DkvpvmiL/lsYvlu7rnrZHkuJPkuJrnmoQq57qn5bu66YCg5biI5rOo5YaM6K+B5Lmm44CB5a6J5YWo55Sf5Lqn6ICD5qC45ZCI5qC86K+B5Lmm5Y+K6Lqr5Lu96K+B5Y6f5Lu2KuOAgeaLn+a0vuW+gOacrOW3peeoi+mhueebruaKgOacr+i0n+i0o+S6uumhu+aPkOS+m+ebuOWFs+S4k+S4mueahOS4ree6p+WPiuS7peS4iuiBjOensOivgeWOn+S7tuOAgjwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyI+5Lul5LiK6LWE5paZ5b+F6aG75o+Q5L6b5Y6f5Lu2KOWOn+S7tumqjOWQjuW9kui/mCnlkozliqDnm5bosIjliKTkurrlhaznq6DnmoTmuIXmmbDlpI3ljbDku7boo4XorqLmiJDlhowo55WZ5a2YKe+8jOS4lOWxnuS6juWQiOazleacieaViOeahO+8jOWmguS4jeiDveaPkOS+m++8jOWwhuS+neaNruOAiuS4reWNjuS6uuawkeWFseWSjOWbveaUv+W6nOmHh+i0reazleOAi+acieWFs+adoeS+i+inhOWumu+8jOacieadg+aLkue7neS+m+W6lOWVhuiOt+WPluiwiOWIpOaWh+S7tuOAgjwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyI+5pys6aG555uu5raJ5Y+K5ZWG5Yqh6YOo5YiG5ZKo6K+i6YeH6LSt5Lit5b+D5raJ5Y+K5oqA5pyv6YOo5YiG5ZKo6K+i6YeH6LSt5Lq644CCPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB6I635Y+W6LCI5Yik5paH5Lu2PC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB6I635Y+W6LCI5Yik5paH5Lu25pe26Ze077yaKioqKuW5tCrmnIgqKuaXpeiHsyoqKirlubQq5pyIKirml6Uo5YyX5Lqs5pe26Ze0Ku+8mioqLSoq77yaKirvvIwqKu+8mioqLSoq77yaKiop5YWs5LyR5pel44CB6IqC5YGH5pel6Zmk5aSW44CCPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB6I635Y+W5Zyw54K577ya5rC45ZKM5Y6/5pS/5bqc6YeH6LSt5Lit5b+DPHNwYW4gY2xhc3M9ImRpdi13YXJwIiBpZD0id2FycF9hcmVhIiBzdHlsZT0icG9zaXRpb246IHJlbGF0aXZlOyB0ZXh0LWFsaWduOiBjZW50ZXI7Ij48c3BhbiBzdHlsZT0iY29sb3I6IHJnYigyNDMsIDE1MiwgMjkpOyB0ZXh0LWRlY29yYXRpb24tbGluZTogdW5kZXJsaW5lOyI+W+iBlOezu+aWueW8j108L3NwYW4+PC9zcGFuPuW6nOilv+ihlyrlj7c8L3A+PHAgc3R5bGU9Im1hcmdpbi10b3A6IDBweDsgbWFyZ2luLWJvdHRvbTogMHB4OyBwYWRkaW5nOiAwcHg7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsiPirjgIHosIjliKTml7bpl7Tlj4rlnLDngrnvvJo8L3A+PHAgc3R5bGU9Im1hcmdpbi10b3A6IDBweDsgbWFyZ2luLWJvdHRvbTogMHB4OyBwYWRkaW5nOiAwcHg7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsiPirjgIHml7bpl7TvvJoqKioq5bm0KuaciCoq5pel5LiK5Y2IKirml7YqKuWIhijljJfkuqzml7bpl7QpPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB5Zyw54K577ya5rC45ZKM5Y6/6YeH6LSt5Lit5b+D5oub5qCH5a6kKOWOv+WuvummhumZouWGheaUv+WKoeS4reW/gyk8L3A+PHAgc3R5bGU9Im1hcmdpbi10b3A6IDBweDsgbWFyZ2luLWJvdHRvbTogMHB4OyBwYWRkaW5nOiAwcHg7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsiPirjgIHogZTns7vmlrnlvI88L3A+PHAgc3R5bGU9Im1hcmdpbi10b3A6IDBweDsgbWFyZ2luLWJvdHRvbTogMHB4OyBwYWRkaW5nOiAwcHg7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsiPumHh+i0reWNleS9je+8muawuOWSjOWOv+ahkeWjgemVh+S6uuawkeaUv+W6nDxzcGFuIGNsYXNzPSJkaXYtd2FycCIgaWQ9IndhcnBfYXJlYSIgc3R5bGU9InBvc2l0aW9uOiByZWxhdGl2ZTsgdGV4dC1hbGlnbjogY2VudGVyOyI+PHNwYW4gc3R5bGU9ImNvbG9yOiByZ2IoMjQzLCAxNTIsIDI5KTsgdGV4dC1kZWNvcmF0aW9uLWxpbmU6IHVuZGVybGluZTsiPlvogZTns7vmlrnlvI9dPC9zcGFuPjwvc3Bhbj48L3A+PHAgc3R5bGU9Im1hcmdpbi10b3A6IDBweDsgbWFyZ2luLWJvdHRvbTogMHB4OyBwYWRkaW5nOiAwcHg7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsiPuiBlOezu+S6uu+8muadjuWFiOeUnzwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyI+6IGU57O755S16K+d77yaKioqKioqKioqKio8L3A+PHAgc3R5bGU9Im1hcmdpbi10b3A6IDBweDsgbWFyZ2luLWJvdHRvbTogMHB4OyBwYWRkaW5nOiAwcHg7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsiPumbhumHh+acuuaehO+8muawuOWSjOWOv+aUv+W6nOmHh+i0reS4reW/gzxzcGFuIGNsYXNzPSJkaXYtd2FycCIgaWQ9IndhcnBfYXJlYSIgc3R5bGU9InBvc2l0aW9uOiByZWxhdGl2ZTsgdGV4dC1hbGlnbjogY2VudGVyOyI+PHNwYW4gc3R5bGU9ImNvbG9yOiByZ2IoMjQzLCAxNTIsIDI5KTsgdGV4dC1kZWNvcmF0aW9uLWxpbmU6IHVuZGVybGluZTsiPlvogZTns7vmlrnlvI9dPC9zcGFuPjwvc3Bhbj48L3A+PHAgc3R5bGU9Im1hcmdpbi10b3A6IDBweDsgbWFyZ2luLWJvdHRvbTogMHB4OyBwYWRkaW5nOiAwcHg7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsiPuiBlOezu+S6uu+8muS7u+Wls+WjqzwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyI+6IGU57O755S16K+d77yaKioqKi0qKioqKioqPC9wPjxwPjxici8+PC9wPg==', '0000-00-00 00:00:00', '18188888888', '888888.com', '109', ' 1585555555', 0);
INSERT INTO `youbang_addoninfos` VALUES (1862, 1, -8, 0, 1, 0, ' 永和县桑壁镇人民政府署益村委南寨村委村级综合活动场所建设项目谈判公告', '/img/2019/8/13/d100323436304c5e51087726161ef8ce.png', '0', 0, '', 0, 0, 0, 0, 0, '0', 'PGgxIGNsYXNzPSJkZXRhaWx0aXRsZSIgdGl0bGU9IuawuOWSjOWOv+ahkeWjgemVh+S6uuawkeaUv+W6nOe9suebiuadkeWnlOWNl+WvqOadkeWnlOadkee6p+e7vOWQiOa0u+WKqOWcuuaJgOW7uuiuvumhueebruiwiOWIpOWFrOWRiiIgc3R5bGU9Im1hcmdpbjogMHB4OyBwYWRkaW5nOiAxMHB4IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyBmb250LXNpemU6IDE4cHg7IGZvbnQtd2VpZ2h0OiA0MDA7IGZvbnQtZmFtaWx5OiDlvq7ova/pm4Xpu5E7IGNvbG9yOiByZ2IoNTEsIDUxLCA1MSk7IHdoaXRlLXNwYWNlOiBub3JtYWw7IGxpbmUtaGVpZ2h0OiAyOHB4OyB0ZXh0LWFsaWduOiBjZW50ZXI7IGJvcmRlci1ib3R0b206IDFweCBkYXNoZWQgcmdiKDIwNCwgMjA0LCAyMDQpOyI+PGJyLz48L2gxPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij7msLjlkozljr/moZHlo4HplYfkurrmsJHmlL/lupw8c3BhbiBjbGFzcz0iZGl2LXdhcnAiIGlkPSJ3YXJwX2FyZWEiIHN0eWxlPSJwb3NpdGlvbjogcmVsYXRpdmU7IHRleHQtYWxpZ246IGNlbnRlcjsiPjxzcGFuIHN0eWxlPSJjb2xvcjogcmdiKDI0MywgMTUyLCAyOSk7IHRleHQtZGVjb3JhdGlvbi1saW5lOiB1bmRlcmxpbmU7Ij5b6IGU57O75pa55byPXTwvc3Bhbj48L3NwYW4+572y55uK5p2R5aeU5Y2X5a+o5p2R5aeU5p2R57qn57u85ZCI5rS75Yqo5Zy65omA5bu66K6+6aG555uu56ue5LqJ5oCn6LCI5Yik5YWs5ZGKPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij7msLjlkozljr/mlL/lupzph4fotK3kuK3lv4M8c3BhbiBjbGFzcz0iZGl2LXdhcnAiIGlkPSJ3YXJwX2FyZWEiIHN0eWxlPSJwb3NpdGlvbjogcmVsYXRpdmU7IHRleHQtYWxpZ246IGNlbnRlcjsiPjxzcGFuIHN0eWxlPSJjb2xvcjogcmdiKDI0MywgMTUyLCAyOSk7IHRleHQtZGVjb3JhdGlvbi1saW5lOiB1bmRlcmxpbmU7Ij5b6IGU57O75pa55byPXTwvc3Bhbj48L3NwYW4+5Y+X5qGR5aOB6ZWH5Lq65rCR5pS/5bqc5aeU5omY77yM5a+55qGR5aOB6ZWH572y55uK5p2R5aeU5Y2X5a+o5p2R5aeU5p2R57qn57u85ZCI5rS75Yqo5Zy65omA5bu66K6+6aG555uu57uE57uH56ue5LqJ5oCn6LCI5Yik6YeH6LSt77yM5qyi6L+O5YW35pyJ5om/5ouF5pys6aG555uu6IO95Yqb44CB6LWE5L+h6Imv5aW955qE5L6b5bqU5ZWG5Y+C5Yqg6LCI5Yik44CCPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB6aG555uu5ZCN56ewOuawuOWSjOWOv+ahkeWjgemVh+S6uuawkeaUv+W6nDxzcGFuIGNsYXNzPSJkaXYtd2FycCIgaWQ9IndhcnBfYXJlYSIgc3R5bGU9InBvc2l0aW9uOiByZWxhdGl2ZTsgdGV4dC1hbGlnbjogY2VudGVyOyI+PHNwYW4gc3R5bGU9ImNvbG9yOiByZ2IoMjQzLCAxNTIsIDI5KTsgdGV4dC1kZWNvcmF0aW9uLWxpbmU6IHVuZGVybGluZTsiPlvogZTns7vmlrnlvI9dPC9zcGFuPjwvc3Bhbj7nvbLnm4rmnZHlp5TljZflr6jmnZHlp5TmnZHnuqfnu7zlkIjmtLvliqjlnLrmiYDlu7rorr7pobnnm648L3A+PHAgc3R5bGU9Im1hcmdpbi10b3A6IDBweDsgbWFyZ2luLWJvdHRvbTogMHB4OyBwYWRkaW5nOiAwcHg7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsiPirjgIHpobnnm67nvJblj7c65rC45pS/6YeHKCoqKiopKioq5Y+3PC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB5oub5qCH5YaF5a6577ya5pys5qyh6LCI5Yik5YWxKumhue+8jOaKpeS7t+S6uuaJgOaKleWMheWGhemhueebruW/hemhu+WujOWFqOWTjeW6lOeji+WVhuaWh+S7tuaJgOWIl+WGheWuuTwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyI+KuOAgeaLm+agh+aOp+WItuS7t++8mioqKioqKi4qKuWFg+OAgjwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyI+KuOAgeaLm+agh+iMg+WbtO+8muWFt+S9k+aKleagh+aKpeS7t+iMg+WbtOWPiuaJgOW6lOi+vuWIsOeahOWFt+S9k+imgeaxgu+8jOS7peacrOiwiOWIpOaWh+S7tuS4ree9suebiuadkeWnlOWNl+WvqOadkeWnlOadkea0u+WKqOWcuuaJgOW7uuiuvumhueebrueahOWGheWuueS4uuWHhuOAgjwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyI+KuOAgeW7uuiuvuWcsOeCue+8muivpuingeiwiOWIpOaWh+S7tuOAgjwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyI+KuOAgeW3peacnyoq5pel5Y6G5aSp44CCPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB5pys6aG555uu5LiN5o6l5Y+X6IGU5ZCI5L2T5oqV5qCH44CCPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB5oqV5qCH5Lq66LWE5qC86KaB5rGCPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB5YW35pyJ54us56uL5om/5ouF5rCR5LqL6LSj5Lu755qE6IO95YqbPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB5YW35pyJ6Imv5aW955qE5ZWG5Lia5L+h6KqJ5ZKM5YGl5YWo55qE6LSi5Yqh5Lya6K6h5Yi25bqmPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB5YW35pyJ5bGl6KGM5ZCI5ZCM5omA5b+F6ZyA55qE6K6+5aSH5ZKM5LiT5Lia5oqA5pyv6IO95YqbPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB5YW35pyJ5L6d5rOV57y057qz56iO5pS25ZKM56S+5Lya5L+d6Zqc6LWE6YeR55qE6Imv5aW96K6w5b2VPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB5Y+C5Yqg5q2k6aG56YeH6LSt5rS75Yqo5YmNKuW5tOWGhe+8jOWcqOe7j+iQpea0u+WKqOS4reaXoOmHjeWkp+i/neazleiusOW9lTwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyI+KuOAgeWFt+acieaIv+Wxi+W7uuetkeW3peeoi+aWveW3peaAu+aJv+WMhSrnuqflj4rku6XkuIrotYTotKg8L3A+PHAgc3R5bGU9Im1hcmdpbi10b3A6IDBweDsgbWFyZ2luLWJvdHRvbTogMHB4OyBwYWRkaW5nOiAwcHg7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsiPirjgIHmoLnmja7jgIrlhbPkuo7lnKjmlL/lupzph4fotK3mtLvliqjkuK3mn6Xor6Llh6Dkvb/nlKjkv6HnlKjorrDlvZXmnInlhbPpl67popjnmoTpgJrnn6XjgIso6LSi5bqTKCoqKiopKioq5Y+355qE6KeE5a6a77yM5a+55YiX5YWl5aSx5L+h5omn6KGM5Lq644CB6YeN5aSn56iO5pS26L+d5rOV5qGI5Lu25b2T5LqL5Lq65ZCN5Y2V44CB5pS/5bqc6YeH6LSt5Lil6YeN6L+d5rOV5aSx5L+h6KGM5Li66K6w5b2V5ZCN5Y2V55qE5oqV5qCH5Lq677yM5ouS57ud5Y+C5LiO5pys6aG555uu6YeH6LSt5rS75Yqo77yMKOafpeivoua4oOmBk+KAnOS/oeeUqOS4reWbveKAnee9keermSoqKi4qKioqKioqKioqKi4qKiouKiop44CB5Lit5Zu95pS/5bqc6YeH6LSt572RKCoqKi4qKioqLioqKi4qKiko5p+l6K+i5pel5pyf5bqU5Zyo5pys5YWs5ZGK5Y+R5biD5pel5pyf5YaFKTwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyI+KuOAgeazleW+i+OAgeihjOaUv+azleinhOinhOWumueahOWFtuS7luadoeS7tjwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyI+KuOAgeS+m+W6lOWVhuiOt+WPluiwiOWIpOaWh+S7tumhu+aQuuW4pueahOi1hOaWme+8mjwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyI+KuOAgeS8geS4muazleS6uuWnlOaJmOS5puWSjOWPl+aJmOS6uui6q+S7veivgeWOn+S7tijlj5fmiZjkurrpobvmmK/mnKzlhazlj7jlhbfmnInkuK3nuqfogYznp7DnmoTmioDmnK/kurrlkZjmiJbpobnnm67otJ/otKPkuropKuOAgeS8geS4mue7hOe7h+acuuaehOS7o+eggeivgeWJr+acrOWOn+S7tu+8jOS8geS4mueojuWKoeeZu+iusOivgeWOn+S7tu+8jOS8geS4muazleS6uuiQpeS4muaJp+eFp+WJr+acrOWOn+S7tijmiJbogIUq6K+B5ZCIKueahOiQpeS4muaJp+eFp+WOn+S7tikq44CB5LyB5Lia6LWE6LSo6K+B5Lmm5Ymv5pys5Y6f5Lu2KuOAgeS8geS4muW3peeoi+inhOi0ueiuoeWPluagh+WHhuivgeS5puWOn+S7tirjgIHkvIHkuJrlronlhajnlJ/kuqforrjlj6/or4Hljp/ku7Yq44CB5rOV5a6a5Luj6KGo5Lq66Lqr5Lu96K+B5aSN5Y2w5Lu2KuOAgeS8geS4muWfuuacrOi0puaIt+W8gOaIt+iuuOWPr+ivgeWOn+S7tirjgIHmi5/mtL7lvoDmnKzlt6XnqIvnmoTlu7rpgKDluIjpobvmj5DkvpvmiL/lsYvlu7rnrZHkuJPkuJrnmoQq57qn5bu66YCg5biI5rOo5YaM6K+B5Lmm44CB5a6J5YWo55Sf5Lqn6ICD5qC45ZCI5qC86K+B5Lmm5Y+K6Lqr5Lu96K+B5Y6f5Lu2KuOAgeaLn+a0vuW+gOacrOW3peeoi+mhueebruaKgOacr+i0n+i0o+S6uumhu+aPkOS+m+ebuOWFs+S4k+S4mueahOS4ree6p+WPiuS7peS4iuiBjOensOivgeWOn+S7tuOAgjwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyI+5Lul5LiK6LWE5paZ5b+F6aG75o+Q5L6b5Y6f5Lu2KOWOn+S7tumqjOWQjuW9kui/mCnlkozliqDnm5bosIjliKTkurrlhaznq6DnmoTmuIXmmbDlpI3ljbDku7boo4XorqLmiJDlhowo55WZ5a2YKe+8jOS4lOWxnuS6juWQiOazleacieaViOeahO+8jOWmguS4jeiDveaPkOS+m++8jOWwhuS+neaNruOAiuS4reWNjuS6uuawkeWFseWSjOWbveaUv+W6nOmHh+i0reazleOAi+acieWFs+adoeS+i+inhOWumu+8jOacieadg+aLkue7neS+m+W6lOWVhuiOt+WPluiwiOWIpOaWh+S7tuOAgjwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyI+5pys6aG555uu5raJ5Y+K5ZWG5Yqh6YOo5YiG5ZKo6K+i6YeH6LSt5Lit5b+D5raJ5Y+K5oqA5pyv6YOo5YiG5ZKo6K+i6YeH6LSt5Lq644CCPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB6I635Y+W6LCI5Yik5paH5Lu2PC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB6I635Y+W6LCI5Yik5paH5Lu25pe26Ze077yaKioqKuW5tCrmnIgqKuaXpeiHsyoqKirlubQq5pyIKirml6Uo5YyX5Lqs5pe26Ze0Ku+8mioqLSoq77yaKirvvIwqKu+8mioqLSoq77yaKiop5YWs5LyR5pel44CB6IqC5YGH5pel6Zmk5aSW44CCPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB6I635Y+W5Zyw54K577ya5rC45ZKM5Y6/5pS/5bqc6YeH6LSt5Lit5b+DPHNwYW4gY2xhc3M9ImRpdi13YXJwIiBpZD0id2FycF9hcmVhIiBzdHlsZT0icG9zaXRpb246IHJlbGF0aXZlOyB0ZXh0LWFsaWduOiBjZW50ZXI7Ij48c3BhbiBzdHlsZT0iY29sb3I6IHJnYigyNDMsIDE1MiwgMjkpOyB0ZXh0LWRlY29yYXRpb24tbGluZTogdW5kZXJsaW5lOyI+W+iBlOezu+aWueW8j108L3NwYW4+PC9zcGFuPuW6nOilv+ihlyrlj7c8L3A+PHAgc3R5bGU9Im1hcmdpbi10b3A6IDBweDsgbWFyZ2luLWJvdHRvbTogMHB4OyBwYWRkaW5nOiAwcHg7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsiPirjgIHosIjliKTml7bpl7Tlj4rlnLDngrnvvJo8L3A+PHAgc3R5bGU9Im1hcmdpbi10b3A6IDBweDsgbWFyZ2luLWJvdHRvbTogMHB4OyBwYWRkaW5nOiAwcHg7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsiPirjgIHml7bpl7TvvJoqKioq5bm0KuaciCoq5pel5LiK5Y2IKirml7YqKuWIhijljJfkuqzml7bpl7QpPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB5Zyw54K577ya5rC45ZKM5Y6/6YeH6LSt5Lit5b+D5oub5qCH5a6kKOWOv+WuvummhumZouWGheaUv+WKoeS4reW/gyk8L3A+PHAgc3R5bGU9Im1hcmdpbi10b3A6IDBweDsgbWFyZ2luLWJvdHRvbTogMHB4OyBwYWRkaW5nOiAwcHg7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsiPirjgIHogZTns7vmlrnlvI88L3A+PHAgc3R5bGU9Im1hcmdpbi10b3A6IDBweDsgbWFyZ2luLWJvdHRvbTogMHB4OyBwYWRkaW5nOiAwcHg7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsiPumHh+i0reWNleS9je+8muawuOWSjOWOv+ahkeWjgemVh+S6uuawkeaUv+W6nDxzcGFuIGNsYXNzPSJkaXYtd2FycCIgaWQ9IndhcnBfYXJlYSIgc3R5bGU9InBvc2l0aW9uOiByZWxhdGl2ZTsgdGV4dC1hbGlnbjogY2VudGVyOyI+PHNwYW4gc3R5bGU9ImNvbG9yOiByZ2IoMjQzLCAxNTIsIDI5KTsgdGV4dC1kZWNvcmF0aW9uLWxpbmU6IHVuZGVybGluZTsiPlvogZTns7vmlrnlvI9dPC9zcGFuPjwvc3Bhbj48L3A+PHAgc3R5bGU9Im1hcmdpbi10b3A6IDBweDsgbWFyZ2luLWJvdHRvbTogMHB4OyBwYWRkaW5nOiAwcHg7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsiPuiBlOezu+S6uu+8muadjuWFiOeUnzwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyI+6IGU57O755S16K+d77yaKioqKioqKioqKio8L3A+PHAgc3R5bGU9Im1hcmdpbi10b3A6IDBweDsgbWFyZ2luLWJvdHRvbTogMHB4OyBwYWRkaW5nOiAwcHg7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsiPumbhumHh+acuuaehO+8muawuOWSjOWOv+aUv+W6nOmHh+i0reS4reW/gzxzcGFuIGNsYXNzPSJkaXYtd2FycCIgaWQ9IndhcnBfYXJlYSIgc3R5bGU9InBvc2l0aW9uOiByZWxhdGl2ZTsgdGV4dC1hbGlnbjogY2VudGVyOyI+PHNwYW4gc3R5bGU9ImNvbG9yOiByZ2IoMjQzLCAxNTIsIDI5KTsgdGV4dC1kZWNvcmF0aW9uLWxpbmU6IHVuZGVybGluZTsiPlvogZTns7vmlrnlvI9dPC9zcGFuPjwvc3Bhbj48L3A+PHAgc3R5bGU9Im1hcmdpbi10b3A6IDBweDsgbWFyZ2luLWJvdHRvbTogMHB4OyBwYWRkaW5nOiAwcHg7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsiPuiBlOezu+S6uu+8muS7u+Wls+WjqzwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyI+6IGU57O755S16K+d77yaKioqKi0qKioqKioqPC9wPjxwPjxici8+PC9wPg==', '0000-00-00 00:00:00', '18188888888', '888888.com', '109', ' 1585555555', 0);
INSERT INTO `youbang_addoninfos` VALUES (1863, 1, -8, 0, 1, 0, ' 永和县桑壁镇人民政府署益村委南寨村委村级综合活动场所建设项目谈判公告', '/img/2019/8/13/d100323436304c5e51087726161ef8ce.png', '0', 0, '', 0, 0, 0, 0, 0, '0', 'PGgxIGNsYXNzPSJkZXRhaWx0aXRsZSIgdGl0bGU9IuawuOWSjOWOv+ahkeWjgemVh+S6uuawkeaUv+W6nOe9suebiuadkeWnlOWNl+WvqOadkeWnlOadkee6p+e7vOWQiOa0u+WKqOWcuuaJgOW7uuiuvumhueebruiwiOWIpOWFrOWRiiIgc3R5bGU9Im1hcmdpbjogMHB4OyBwYWRkaW5nOiAxMHB4IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyBmb250LXNpemU6IDE4cHg7IGZvbnQtd2VpZ2h0OiA0MDA7IGZvbnQtZmFtaWx5OiDlvq7ova/pm4Xpu5E7IGNvbG9yOiByZ2IoNTEsIDUxLCA1MSk7IHdoaXRlLXNwYWNlOiBub3JtYWw7IGxpbmUtaGVpZ2h0OiAyOHB4OyB0ZXh0LWFsaWduOiBjZW50ZXI7IGJvcmRlci1ib3R0b206IDFweCBkYXNoZWQgcmdiKDIwNCwgMjA0LCAyMDQpOyI+PGJyLz48L2gxPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij7msLjlkozljr/moZHlo4HplYfkurrmsJHmlL/lupw8c3BhbiBjbGFzcz0iZGl2LXdhcnAiIGlkPSJ3YXJwX2FyZWEiIHN0eWxlPSJwb3NpdGlvbjogcmVsYXRpdmU7IHRleHQtYWxpZ246IGNlbnRlcjsiPjxzcGFuIHN0eWxlPSJjb2xvcjogcmdiKDI0MywgMTUyLCAyOSk7IHRleHQtZGVjb3JhdGlvbi1saW5lOiB1bmRlcmxpbmU7Ij5b6IGU57O75pa55byPXTwvc3Bhbj48L3NwYW4+572y55uK5p2R5aeU5Y2X5a+o5p2R5aeU5p2R57qn57u85ZCI5rS75Yqo5Zy65omA5bu66K6+6aG555uu56ue5LqJ5oCn6LCI5Yik5YWs5ZGKPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij7msLjlkozljr/mlL/lupzph4fotK3kuK3lv4M8c3BhbiBjbGFzcz0iZGl2LXdhcnAiIGlkPSJ3YXJwX2FyZWEiIHN0eWxlPSJwb3NpdGlvbjogcmVsYXRpdmU7IHRleHQtYWxpZ246IGNlbnRlcjsiPjxzcGFuIHN0eWxlPSJjb2xvcjogcmdiKDI0MywgMTUyLCAyOSk7IHRleHQtZGVjb3JhdGlvbi1saW5lOiB1bmRlcmxpbmU7Ij5b6IGU57O75pa55byPXTwvc3Bhbj48L3NwYW4+5Y+X5qGR5aOB6ZWH5Lq65rCR5pS/5bqc5aeU5omY77yM5a+55qGR5aOB6ZWH572y55uK5p2R5aeU5Y2X5a+o5p2R5aeU5p2R57qn57u85ZCI5rS75Yqo5Zy65omA5bu66K6+6aG555uu57uE57uH56ue5LqJ5oCn6LCI5Yik6YeH6LSt77yM5qyi6L+O5YW35pyJ5om/5ouF5pys6aG555uu6IO95Yqb44CB6LWE5L+h6Imv5aW955qE5L6b5bqU5ZWG5Y+C5Yqg6LCI5Yik44CCPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB6aG555uu5ZCN56ewOuawuOWSjOWOv+ahkeWjgemVh+S6uuawkeaUv+W6nDxzcGFuIGNsYXNzPSJkaXYtd2FycCIgaWQ9IndhcnBfYXJlYSIgc3R5bGU9InBvc2l0aW9uOiByZWxhdGl2ZTsgdGV4dC1hbGlnbjogY2VudGVyOyI+PHNwYW4gc3R5bGU9ImNvbG9yOiByZ2IoMjQzLCAxNTIsIDI5KTsgdGV4dC1kZWNvcmF0aW9uLWxpbmU6IHVuZGVybGluZTsiPlvogZTns7vmlrnlvI9dPC9zcGFuPjwvc3Bhbj7nvbLnm4rmnZHlp5TljZflr6jmnZHlp5TmnZHnuqfnu7zlkIjmtLvliqjlnLrmiYDlu7rorr7pobnnm648L3A+PHAgc3R5bGU9Im1hcmdpbi10b3A6IDBweDsgbWFyZ2luLWJvdHRvbTogMHB4OyBwYWRkaW5nOiAwcHg7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsiPirjgIHpobnnm67nvJblj7c65rC45pS/6YeHKCoqKiopKioq5Y+3PC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB5oub5qCH5YaF5a6577ya5pys5qyh6LCI5Yik5YWxKumhue+8jOaKpeS7t+S6uuaJgOaKleWMheWGhemhueebruW/hemhu+WujOWFqOWTjeW6lOeji+WVhuaWh+S7tuaJgOWIl+WGheWuuTwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyI+KuOAgeaLm+agh+aOp+WItuS7t++8mioqKioqKi4qKuWFg+OAgjwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyI+KuOAgeaLm+agh+iMg+WbtO+8muWFt+S9k+aKleagh+aKpeS7t+iMg+WbtOWPiuaJgOW6lOi+vuWIsOeahOWFt+S9k+imgeaxgu+8jOS7peacrOiwiOWIpOaWh+S7tuS4ree9suebiuadkeWnlOWNl+WvqOadkeWnlOadkea0u+WKqOWcuuaJgOW7uuiuvumhueebrueahOWGheWuueS4uuWHhuOAgjwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyI+KuOAgeW7uuiuvuWcsOeCue+8muivpuingeiwiOWIpOaWh+S7tuOAgjwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyI+KuOAgeW3peacnyoq5pel5Y6G5aSp44CCPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB5pys6aG555uu5LiN5o6l5Y+X6IGU5ZCI5L2T5oqV5qCH44CCPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB5oqV5qCH5Lq66LWE5qC86KaB5rGCPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB5YW35pyJ54us56uL5om/5ouF5rCR5LqL6LSj5Lu755qE6IO95YqbPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB5YW35pyJ6Imv5aW955qE5ZWG5Lia5L+h6KqJ5ZKM5YGl5YWo55qE6LSi5Yqh5Lya6K6h5Yi25bqmPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB5YW35pyJ5bGl6KGM5ZCI5ZCM5omA5b+F6ZyA55qE6K6+5aSH5ZKM5LiT5Lia5oqA5pyv6IO95YqbPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB5YW35pyJ5L6d5rOV57y057qz56iO5pS25ZKM56S+5Lya5L+d6Zqc6LWE6YeR55qE6Imv5aW96K6w5b2VPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB5Y+C5Yqg5q2k6aG56YeH6LSt5rS75Yqo5YmNKuW5tOWGhe+8jOWcqOe7j+iQpea0u+WKqOS4reaXoOmHjeWkp+i/neazleiusOW9lTwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyI+KuOAgeWFt+acieaIv+Wxi+W7uuetkeW3peeoi+aWveW3peaAu+aJv+WMhSrnuqflj4rku6XkuIrotYTotKg8L3A+PHAgc3R5bGU9Im1hcmdpbi10b3A6IDBweDsgbWFyZ2luLWJvdHRvbTogMHB4OyBwYWRkaW5nOiAwcHg7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsiPirjgIHmoLnmja7jgIrlhbPkuo7lnKjmlL/lupzph4fotK3mtLvliqjkuK3mn6Xor6Llh6Dkvb/nlKjkv6HnlKjorrDlvZXmnInlhbPpl67popjnmoTpgJrnn6XjgIso6LSi5bqTKCoqKiopKioq5Y+355qE6KeE5a6a77yM5a+55YiX5YWl5aSx5L+h5omn6KGM5Lq644CB6YeN5aSn56iO5pS26L+d5rOV5qGI5Lu25b2T5LqL5Lq65ZCN5Y2V44CB5pS/5bqc6YeH6LSt5Lil6YeN6L+d5rOV5aSx5L+h6KGM5Li66K6w5b2V5ZCN5Y2V55qE5oqV5qCH5Lq677yM5ouS57ud5Y+C5LiO5pys6aG555uu6YeH6LSt5rS75Yqo77yMKOafpeivoua4oOmBk+KAnOS/oeeUqOS4reWbveKAnee9keermSoqKi4qKioqKioqKioqKi4qKiouKiop44CB5Lit5Zu95pS/5bqc6YeH6LSt572RKCoqKi4qKioqLioqKi4qKiko5p+l6K+i5pel5pyf5bqU5Zyo5pys5YWs5ZGK5Y+R5biD5pel5pyf5YaFKTwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyI+KuOAgeazleW+i+OAgeihjOaUv+azleinhOinhOWumueahOWFtuS7luadoeS7tjwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyI+KuOAgeS+m+W6lOWVhuiOt+WPluiwiOWIpOaWh+S7tumhu+aQuuW4pueahOi1hOaWme+8mjwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyI+KuOAgeS8geS4muazleS6uuWnlOaJmOS5puWSjOWPl+aJmOS6uui6q+S7veivgeWOn+S7tijlj5fmiZjkurrpobvmmK/mnKzlhazlj7jlhbfmnInkuK3nuqfogYznp7DnmoTmioDmnK/kurrlkZjmiJbpobnnm67otJ/otKPkuropKuOAgeS8geS4mue7hOe7h+acuuaehOS7o+eggeivgeWJr+acrOWOn+S7tu+8jOS8geS4mueojuWKoeeZu+iusOivgeWOn+S7tu+8jOS8geS4muazleS6uuiQpeS4muaJp+eFp+WJr+acrOWOn+S7tijmiJbogIUq6K+B5ZCIKueahOiQpeS4muaJp+eFp+WOn+S7tikq44CB5LyB5Lia6LWE6LSo6K+B5Lmm5Ymv5pys5Y6f5Lu2KuOAgeS8geS4muW3peeoi+inhOi0ueiuoeWPluagh+WHhuivgeS5puWOn+S7tirjgIHkvIHkuJrlronlhajnlJ/kuqforrjlj6/or4Hljp/ku7Yq44CB5rOV5a6a5Luj6KGo5Lq66Lqr5Lu96K+B5aSN5Y2w5Lu2KuOAgeS8geS4muWfuuacrOi0puaIt+W8gOaIt+iuuOWPr+ivgeWOn+S7tirjgIHmi5/mtL7lvoDmnKzlt6XnqIvnmoTlu7rpgKDluIjpobvmj5DkvpvmiL/lsYvlu7rnrZHkuJPkuJrnmoQq57qn5bu66YCg5biI5rOo5YaM6K+B5Lmm44CB5a6J5YWo55Sf5Lqn6ICD5qC45ZCI5qC86K+B5Lmm5Y+K6Lqr5Lu96K+B5Y6f5Lu2KuOAgeaLn+a0vuW+gOacrOW3peeoi+mhueebruaKgOacr+i0n+i0o+S6uumhu+aPkOS+m+ebuOWFs+S4k+S4mueahOS4ree6p+WPiuS7peS4iuiBjOensOivgeWOn+S7tuOAgjwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyI+5Lul5LiK6LWE5paZ5b+F6aG75o+Q5L6b5Y6f5Lu2KOWOn+S7tumqjOWQjuW9kui/mCnlkozliqDnm5bosIjliKTkurrlhaznq6DnmoTmuIXmmbDlpI3ljbDku7boo4XorqLmiJDlhowo55WZ5a2YKe+8jOS4lOWxnuS6juWQiOazleacieaViOeahO+8jOWmguS4jeiDveaPkOS+m++8jOWwhuS+neaNruOAiuS4reWNjuS6uuawkeWFseWSjOWbveaUv+W6nOmHh+i0reazleOAi+acieWFs+adoeS+i+inhOWumu+8jOacieadg+aLkue7neS+m+W6lOWVhuiOt+WPluiwiOWIpOaWh+S7tuOAgjwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyI+5pys6aG555uu5raJ5Y+K5ZWG5Yqh6YOo5YiG5ZKo6K+i6YeH6LSt5Lit5b+D5raJ5Y+K5oqA5pyv6YOo5YiG5ZKo6K+i6YeH6LSt5Lq644CCPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB6I635Y+W6LCI5Yik5paH5Lu2PC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB6I635Y+W6LCI5Yik5paH5Lu25pe26Ze077yaKioqKuW5tCrmnIgqKuaXpeiHsyoqKirlubQq5pyIKirml6Uo5YyX5Lqs5pe26Ze0Ku+8mioqLSoq77yaKirvvIwqKu+8mioqLSoq77yaKiop5YWs5LyR5pel44CB6IqC5YGH5pel6Zmk5aSW44CCPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB6I635Y+W5Zyw54K577ya5rC45ZKM5Y6/5pS/5bqc6YeH6LSt5Lit5b+DPHNwYW4gY2xhc3M9ImRpdi13YXJwIiBpZD0id2FycF9hcmVhIiBzdHlsZT0icG9zaXRpb246IHJlbGF0aXZlOyB0ZXh0LWFsaWduOiBjZW50ZXI7Ij48c3BhbiBzdHlsZT0iY29sb3I6IHJnYigyNDMsIDE1MiwgMjkpOyB0ZXh0LWRlY29yYXRpb24tbGluZTogdW5kZXJsaW5lOyI+W+iBlOezu+aWueW8j108L3NwYW4+PC9zcGFuPuW6nOilv+ihlyrlj7c8L3A+PHAgc3R5bGU9Im1hcmdpbi10b3A6IDBweDsgbWFyZ2luLWJvdHRvbTogMHB4OyBwYWRkaW5nOiAwcHg7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsiPirjgIHosIjliKTml7bpl7Tlj4rlnLDngrnvvJo8L3A+PHAgc3R5bGU9Im1hcmdpbi10b3A6IDBweDsgbWFyZ2luLWJvdHRvbTogMHB4OyBwYWRkaW5nOiAwcHg7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsiPirjgIHml7bpl7TvvJoqKioq5bm0KuaciCoq5pel5LiK5Y2IKirml7YqKuWIhijljJfkuqzml7bpl7QpPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB5Zyw54K577ya5rC45ZKM5Y6/6YeH6LSt5Lit5b+D5oub5qCH5a6kKOWOv+WuvummhumZouWGheaUv+WKoeS4reW/gyk8L3A+PHAgc3R5bGU9Im1hcmdpbi10b3A6IDBweDsgbWFyZ2luLWJvdHRvbTogMHB4OyBwYWRkaW5nOiAwcHg7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsiPirjgIHogZTns7vmlrnlvI88L3A+PHAgc3R5bGU9Im1hcmdpbi10b3A6IDBweDsgbWFyZ2luLWJvdHRvbTogMHB4OyBwYWRkaW5nOiAwcHg7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsiPumHh+i0reWNleS9je+8muawuOWSjOWOv+ahkeWjgemVh+S6uuawkeaUv+W6nDxzcGFuIGNsYXNzPSJkaXYtd2FycCIgaWQ9IndhcnBfYXJlYSIgc3R5bGU9InBvc2l0aW9uOiByZWxhdGl2ZTsgdGV4dC1hbGlnbjogY2VudGVyOyI+PHNwYW4gc3R5bGU9ImNvbG9yOiByZ2IoMjQzLCAxNTIsIDI5KTsgdGV4dC1kZWNvcmF0aW9uLWxpbmU6IHVuZGVybGluZTsiPlvogZTns7vmlrnlvI9dPC9zcGFuPjwvc3Bhbj48L3A+PHAgc3R5bGU9Im1hcmdpbi10b3A6IDBweDsgbWFyZ2luLWJvdHRvbTogMHB4OyBwYWRkaW5nOiAwcHg7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsiPuiBlOezu+S6uu+8muadjuWFiOeUnzwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyI+6IGU57O755S16K+d77yaKioqKioqKioqKio8L3A+PHAgc3R5bGU9Im1hcmdpbi10b3A6IDBweDsgbWFyZ2luLWJvdHRvbTogMHB4OyBwYWRkaW5nOiAwcHg7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsiPumbhumHh+acuuaehO+8muawuOWSjOWOv+aUv+W6nOmHh+i0reS4reW/gzxzcGFuIGNsYXNzPSJkaXYtd2FycCIgaWQ9IndhcnBfYXJlYSIgc3R5bGU9InBvc2l0aW9uOiByZWxhdGl2ZTsgdGV4dC1hbGlnbjogY2VudGVyOyI+PHNwYW4gc3R5bGU9ImNvbG9yOiByZ2IoMjQzLCAxNTIsIDI5KTsgdGV4dC1kZWNvcmF0aW9uLWxpbmU6IHVuZGVybGluZTsiPlvogZTns7vmlrnlvI9dPC9zcGFuPjwvc3Bhbj48L3A+PHAgc3R5bGU9Im1hcmdpbi10b3A6IDBweDsgbWFyZ2luLWJvdHRvbTogMHB4OyBwYWRkaW5nOiAwcHg7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsiPuiBlOezu+S6uu+8muS7u+Wls+WjqzwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyI+6IGU57O755S16K+d77yaKioqKi0qKioqKioqPC9wPjxwPjxici8+PC9wPg==', '0000-00-00 00:00:00', '18188888888', '888888.com', '109', ' 1585555555', 0);
INSERT INTO `youbang_addoninfos` VALUES (1864, 39, -8, 0, 1, 0, '0806测试委托招标公告', '/img/2019/8/13/dd9e74b09ab19b327abe087dd9019663.png', '0', 0, '', 0, 0, 0, 0, 0, '0', 'PHAgc3R5bGU9Im1hcmdpbi10b3A6IDBweDsgbWFyZ2luLWJvdHRvbTogMHB4OyBwYWRkaW5nOiAwcHg7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsgZm9udC1mYW1pbHk6IOW+rui9r+mbhem7kTsgY29sb3I6IHJnYig1MSwgNTEsIDUxKTsgd2hpdGUtc3BhY2U6IG5vcm1hbDsgZm9udC1zaXplOiAxNHB4OyI+6ZW/5a2Q5Y6/5p2R6YGT6KW/5aCh5aS06Iez5bqe5bqE5YWs6Lev5pS56YCg5bel56iL5pa95bel55uR55CG5oub5qCH5Y+Y5pu05YWs5ZGKPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7IGZvbnQtZmFtaWx5OiDlvq7ova/pm4Xpu5E7IGNvbG9yOiByZ2IoNTEsIDUxLCA1MSk7IHdoaXRlLXNwYWNlOiBub3JtYWw7IGZvbnQtc2l6ZTogMTRweDsiPu+8iOaLm+agh+e8luWPt++8mioqKi0qKioqKioqKioqKu+8iTwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyBmb250LWZhbWlseTog5b6u6L2v6ZuF6buROyBjb2xvcjogcmdiKDUxLCA1MSwgNTEpOyB3aGl0ZS1zcGFjZTogbm9ybWFsOyBmb250LXNpemU6IDE0cHg7Ij48YnIvPjwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyBmb250LWZhbWlseTog5b6u6L2v6ZuF6buROyBjb2xvcjogcmdiKDUxLCA1MSwgNTEpOyB3aGl0ZS1zcGFjZTogbm9ybWFsOyBmb250LXNpemU6IDE0cHg7Ij4q44CB5YaF5a6577yaPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7IGZvbnQtZmFtaWx5OiDlvq7ova/pm4Xpu5E7IGNvbG9yOiByZ2IoNTEsIDUxLCA1MSk7IHdoaXRlLXNwYWNlOiBub3JtYWw7IGZvbnQtc2l6ZTogMTRweDsiPuaIkeWNleS9jeS6jioqKirlubQqKuaciCoq5pel5Zyo5bGx6KW/55yB5oub5qCH5oqV5qCH5YWs5YWx5pyN5Yqh5bmz5Y+w5Y+R5biD5LqG6ZW/5a2Q5Y6/5p2R6YGT6KW/5aCh5aS06Iez5bqe5bqE5YWs6Lev5pS56YCg5bel56iL5pa95bel55uR55CG5oub5qCH5YWs5ZGK77yM546w5bCG5Y6f5YWs5ZGK6YOo5YiG5YaF5a656L+b6KGM5Y+Y5pu077yaPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7IGZvbnQtZmFtaWx5OiDlvq7ova/pm4Xpu5E7IGNvbG9yOiByZ2IoNTEsIDUxLCA1MSk7IHdoaXRlLXNwYWNlOiBub3JtYWw7IGZvbnQtc2l6ZTogMTRweDsiPumcgOWPmOabtOeahOWGheWuueS4uu+8mjwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyBmb250LWZhbWlseTog5b6u6L2v6ZuF6buROyBjb2xvcjogcmdiKDUxLCA1MSwgNTEpOyB3aGl0ZS1zcGFjZTogbm9ybWFsOyBmb250LXNpemU6IDE0cHg7Ij4q44CB5oub5qCH5paH5Lu255qE6I635Y+WPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7IGZvbnQtZmFtaWx5OiDlvq7ova/pm4Xpu5E7IGNvbG9yOiByZ2IoNTEsIDUxLCA1MSk7IHdoaXRlLXNwYWNlOiBub3JtYWw7IGZvbnQtc2l6ZTogMTRweDsiPuiOt+WPluaXtumXtO+8mioqKiotKiotKiogKio6Kiog6IezICoqKiotKiotKiogKio6Kio8L3A+PHAgc3R5bGU9Im1hcmdpbi10b3A6IDBweDsgbWFyZ2luLWJvdHRvbTogMHB4OyBwYWRkaW5nOiAwcHg7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsgZm9udC1mYW1pbHk6IOW+rui9r+mbhem7kTsgY29sb3I6IHJnYig1MSwgNTEsIDUxKTsgd2hpdGUtc3BhY2U6IG5vcm1hbDsgZm9udC1zaXplOiAxNHB4OyI+546w5Y+Y5pu05Li677yaPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7IGZvbnQtZmFtaWx5OiDlvq7ova/pm4Xpu5E7IGNvbG9yOiByZ2IoNTEsIDUxLCA1MSk7IHdoaXRlLXNwYWNlOiBub3JtYWw7IGZvbnQtc2l6ZTogMTRweDsiPirjgIHmi5vmoIfmlofku7bnmoTojrflj5Y8L3A+PHAgc3R5bGU9Im1hcmdpbi10b3A6IDBweDsgbWFyZ2luLWJvdHRvbTogMHB4OyBwYWRkaW5nOiAwcHg7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsgZm9udC1mYW1pbHk6IOW+rui9r+mbhem7kTsgY29sb3I6IHJnYig1MSwgNTEsIDUxKTsgd2hpdGUtc3BhY2U6IG5vcm1hbDsgZm9udC1zaXplOiAxNHB4OyI+6I635Y+W5pe26Ze077yaKioqKi0qKi0qKiAqKjoqKiDoh7MgKioqKi0qKi0qKiAqKjoqKjwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyBmb250LWZhbWlseTog5b6u6L2v6ZuF6buROyBjb2xvcjogcmdiKDUxLCA1MSwgNTEpOyB3aGl0ZS1zcGFjZTogbm9ybWFsOyBmb250LXNpemU6IDE0cHg7Ij48YnIvPjwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyBmb250LWZhbWlseTog5b6u6L2v6ZuF6buROyBjb2xvcjogcmdiKDUxLCA1MSwgNTEpOyB3aGl0ZS1zcGFjZTogbm9ybWFsOyBmb250LXNpemU6IDE0cHg7Ij48YnIvPjwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyBmb250LWZhbWlseTog5b6u6L2v6ZuF6buROyBjb2xvcjogcmdiKDUxLCA1MSwgNTEpOyB3aGl0ZS1zcGFjZTogbm9ybWFsOyBmb250LXNpemU6IDE0cHg7Ij4q44CB55uR552j6YOo6ZeoPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7IGZvbnQtZmFtaWx5OiDlvq7ova/pm4Xpu5E7IGNvbG9yOiByZ2IoNTEsIDUxLCA1MSk7IHdoaXRlLXNwYWNlOiBub3JtYWw7IGZvbnQtc2l6ZTogMTRweDsiPuacrOaLm+agh+mhueebrueahOebkeedo+mDqOmXqOS4uiDplb/lrZDljr/lj5HlsZXlkozmlLnpnanlsYAg44CCPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7IGZvbnQtZmFtaWx5OiDlvq7ova/pm4Xpu5E7IGNvbG9yOiByZ2IoNTEsIDUxLCA1MSk7IHdoaXRlLXNwYWNlOiBub3JtYWw7IGZvbnQtc2l6ZTogMTRweDsiPirjgIHogZTns7vmlrnlvI88L3A+PHAgc3R5bGU9Im1hcmdpbi10b3A6IDBweDsgbWFyZ2luLWJvdHRvbTogMHB4OyBwYWRkaW5nOiAwcHg7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsgZm9udC1mYW1pbHk6IOW+rui9r+mbhem7kTsgY29sb3I6IHJnYig1MSwgNTEsIDUxKTsgd2hpdGUtc3BhY2U6IG5vcm1hbDsgZm9udC1zaXplOiAxNHB4OyI+5oub5qCH5Lq677ya6ZW/5a2Q5Y6/5Lqk6YCa6L+Q6L6T5bGAPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7IGZvbnQtZmFtaWx5OiDlvq7ova/pm4Xpu5E7IGNvbG9yOiByZ2IoNTEsIDUxLCA1MSk7IHdoaXRlLXNwYWNlOiBub3JtYWw7IGZvbnQtc2l6ZTogMTRweDsiPuWcsOWdgO+8mumVv+WtkOWOvzwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyBmb250LWZhbWlseTog5b6u6L2v6ZuF6buROyBjb2xvcjogcmdiKDUxLCA1MSwgNTEpOyB3aGl0ZS1zcGFjZTogbm9ybWFsOyBmb250LXNpemU6IDE0cHg7Ij48YnIvPjwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyBmb250LWZhbWlseTog5b6u6L2v6ZuF6buROyBjb2xvcjogcmdiKDUxLCA1MSwgNTEpOyB3aGl0ZS1zcGFjZTogbm9ybWFsOyBmb250LXNpemU6IDE0cHg7Ij7ogZTns7vkurrvvJrlkozlvaw8L3A+PHAgc3R5bGU9Im1hcmdpbi10b3A6IDBweDsgbWFyZ2luLWJvdHRvbTogMHB4OyBwYWRkaW5nOiAwcHg7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsgZm9udC1mYW1pbHk6IOW+rui9r+mbhem7kTsgY29sb3I6IHJnYig1MSwgNTEsIDUxKTsgd2hpdGUtc3BhY2U6IG5vcm1hbDsgZm9udC1zaXplOiAxNHB4OyI+55S16K+d77yaKioqKioqKioqKio8L3A+PHAgc3R5bGU9Im1hcmdpbi10b3A6IDBweDsgbWFyZ2luLWJvdHRvbTogMHB4OyBwYWRkaW5nOiAwcHg7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsgZm9udC1mYW1pbHk6IOW+rui9r+mbhem7kTsgY29sb3I6IHJnYig1MSwgNTEsIDUxKTsgd2hpdGUtc3BhY2U6IG5vcm1hbDsgZm9udC1zaXplOiAxNHB4OyI+55S15a2Q6YKu5Lu277yaLzwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyBmb250LWZhbWlseTog5b6u6L2v6ZuF6buROyBjb2xvcjogcmdiKDUxLCA1MSwgNTEpOyB3aGl0ZS1zcGFjZTogbm9ybWFsOyBmb250LXNpemU6IDE0cHg7Ij48YnIvPjwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyBmb250LWZhbWlseTog5b6u6L2v6ZuF6buROyBjb2xvcjogcmdiKDUxLCA1MSwgNTEpOyB3aGl0ZS1zcGFjZTogbm9ybWFsOyBmb250LXNpemU6IDE0cHg7Ij7mi5vmoIfku6PnkIbmnLrmnoTvvJrplb/msrvluILlhYPlu7rlt6XnqIvmi5vmoIfku6PnkIbmnInpmZDlhazlj7g8L3A+PHAgc3R5bGU9Im1hcmdpbi10b3A6IDBweDsgbWFyZ2luLWJvdHRvbTogMHB4OyBwYWRkaW5nOiAwcHg7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsgZm9udC1mYW1pbHk6IOW+rui9r+mbhem7kTsgY29sb3I6IHJnYig1MSwgNTEsIDUxKTsgd2hpdGUtc3BhY2U6IG5vcm1hbDsgZm9udC1zaXplOiAxNHB4OyI+5Zyw5Z2A77ya6ZW/5rK75biCPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7IGZvbnQtZmFtaWx5OiDlvq7ova/pm4Xpu5E7IGNvbG9yOiByZ2IoNTEsIDUxLCA1MSk7IHdoaXRlLXNwYWNlOiBub3JtYWw7IGZvbnQtc2l6ZTogMTRweDsiPjxici8+PC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7IGZvbnQtZmFtaWx5OiDlvq7ova/pm4Xpu5E7IGNvbG9yOiByZ2IoNTEsIDUxLCA1MSk7IHdoaXRlLXNwYWNlOiBub3JtYWw7IGZvbnQtc2l6ZTogMTRweDsiPuiBlOezu+S6uu+8mumZiOa0gTwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyBmb250LWZhbWlseTog5b6u6L2v6ZuF6buROyBjb2xvcjogcmdiKDUxLCA1MSwgNTEpOyB3aGl0ZS1zcGFjZTogbm9ybWFsOyBmb250LXNpemU6IDE0cHg7Ij7nlLXor53vvJogKioqKioqKioqKio8L3A+PHAgc3R5bGU9Im1hcmdpbi10b3A6IDBweDsgbWFyZ2luLWJvdHRvbTogMHB4OyBwYWRkaW5nOiAwcHg7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsgZm9udC1mYW1pbHk6IOW+rui9r+mbhem7kTsgY29sb3I6IHJnYig1MSwgNTEsIDUxKTsgd2hpdGUtc3BhY2U6IG5vcm1hbDsgZm9udC1zaXplOiAxNHB4OyI+55S15a2Q6YKu5Lu277yaICoqKioqKioqKioqQCoqKi4qKio8L3A+PHAgc3R5bGU9Im1hcmdpbi10b3A6IDBweDsgbWFyZ2luLWJvdHRvbTogMHB4OyBwYWRkaW5nOiAwcHg7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsgZm9udC1mYW1pbHk6IOW+rui9r+mbhem7kTsgY29sb3I6IHJnYig1MSwgNTEsIDUxKTsgd2hpdGUtc3BhY2U6IG5vcm1hbDsgZm9udC1zaXplOiAxNHB4OyI+5oub5qCH5Lq65oiW5YW25oub5qCH5Luj55CG5py65p6E5Li76KaB6LSf6LSj5Lq677yI6aG555uu6LSf6LSj5Lq677yJ77yaIO+8iOeblueroO+8iTwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyBmb250LWZhbWlseTog5b6u6L2v6ZuF6buROyBjb2xvcjogcmdiKDUxLCA1MSwgNTEpOyB3aGl0ZS1zcGFjZTogbm9ybWFsOyBmb250LXNpemU6IDE0cHg7Ij48YnIvPjwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyBmb250LWZhbWlseTog5b6u6L2v6ZuF6buROyBjb2xvcjogcmdiKDUxLCA1MSwgNTEpOyB3aGl0ZS1zcGFjZTogbm9ybWFsOyBmb250LXNpemU6IDE0cHg7Ij7mi5vmoIfkurrmiJblhbbmi5vmoIfku6PnkIbmnLrmnoTvvJrvvIjnm5bnq6DvvIk8L3A+PHA+PGJyLz48L3A+', '0000-00-00 00:00:00', '18888888888', '2222qq.com', '108', '1585555555', 0);
INSERT INTO `youbang_addoninfos` VALUES (1865, 1, -8, 0, 1, 0, ' 永和县桑壁镇人民政府署益村委南寨村委村级综合活动场所建设项目谈判公告', '/img/2019/8/13/d100323436304c5e51087726161ef8ce.png', '0', 0, '', 0, 0, 0, 0, 0, '0', 'PGgxIGNsYXNzPSJkZXRhaWx0aXRsZSIgdGl0bGU9IuawuOWSjOWOv+ahkeWjgemVh+S6uuawkeaUv+W6nOe9suebiuadkeWnlOWNl+WvqOadkeWnlOadkee6p+e7vOWQiOa0u+WKqOWcuuaJgOW7uuiuvumhueebruiwiOWIpOWFrOWRiiIgc3R5bGU9Im1hcmdpbjogMHB4OyBwYWRkaW5nOiAxMHB4IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyBmb250LXNpemU6IDE4cHg7IGZvbnQtd2VpZ2h0OiA0MDA7IGZvbnQtZmFtaWx5OiDlvq7ova/pm4Xpu5E7IGNvbG9yOiByZ2IoNTEsIDUxLCA1MSk7IHdoaXRlLXNwYWNlOiBub3JtYWw7IGxpbmUtaGVpZ2h0OiAyOHB4OyB0ZXh0LWFsaWduOiBjZW50ZXI7IGJvcmRlci1ib3R0b206IDFweCBkYXNoZWQgcmdiKDIwNCwgMjA0LCAyMDQpOyI+PGJyLz48L2gxPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij7msLjlkozljr/moZHlo4HplYfkurrmsJHmlL/lupw8c3BhbiBjbGFzcz0iZGl2LXdhcnAiIGlkPSJ3YXJwX2FyZWEiIHN0eWxlPSJwb3NpdGlvbjogcmVsYXRpdmU7IHRleHQtYWxpZ246IGNlbnRlcjsiPjxzcGFuIHN0eWxlPSJjb2xvcjogcmdiKDI0MywgMTUyLCAyOSk7IHRleHQtZGVjb3JhdGlvbi1saW5lOiB1bmRlcmxpbmU7Ij5b6IGU57O75pa55byPXTwvc3Bhbj48L3NwYW4+572y55uK5p2R5aeU5Y2X5a+o5p2R5aeU5p2R57qn57u85ZCI5rS75Yqo5Zy65omA5bu66K6+6aG555uu56ue5LqJ5oCn6LCI5Yik5YWs5ZGKPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij7msLjlkozljr/mlL/lupzph4fotK3kuK3lv4M8c3BhbiBjbGFzcz0iZGl2LXdhcnAiIGlkPSJ3YXJwX2FyZWEiIHN0eWxlPSJwb3NpdGlvbjogcmVsYXRpdmU7IHRleHQtYWxpZ246IGNlbnRlcjsiPjxzcGFuIHN0eWxlPSJjb2xvcjogcmdiKDI0MywgMTUyLCAyOSk7IHRleHQtZGVjb3JhdGlvbi1saW5lOiB1bmRlcmxpbmU7Ij5b6IGU57O75pa55byPXTwvc3Bhbj48L3NwYW4+5Y+X5qGR5aOB6ZWH5Lq65rCR5pS/5bqc5aeU5omY77yM5a+55qGR5aOB6ZWH572y55uK5p2R5aeU5Y2X5a+o5p2R5aeU5p2R57qn57u85ZCI5rS75Yqo5Zy65omA5bu66K6+6aG555uu57uE57uH56ue5LqJ5oCn6LCI5Yik6YeH6LSt77yM5qyi6L+O5YW35pyJ5om/5ouF5pys6aG555uu6IO95Yqb44CB6LWE5L+h6Imv5aW955qE5L6b5bqU5ZWG5Y+C5Yqg6LCI5Yik44CCPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB6aG555uu5ZCN56ewOuawuOWSjOWOv+ahkeWjgemVh+S6uuawkeaUv+W6nDxzcGFuIGNsYXNzPSJkaXYtd2FycCIgaWQ9IndhcnBfYXJlYSIgc3R5bGU9InBvc2l0aW9uOiByZWxhdGl2ZTsgdGV4dC1hbGlnbjogY2VudGVyOyI+PHNwYW4gc3R5bGU9ImNvbG9yOiByZ2IoMjQzLCAxNTIsIDI5KTsgdGV4dC1kZWNvcmF0aW9uLWxpbmU6IHVuZGVybGluZTsiPlvogZTns7vmlrnlvI9dPC9zcGFuPjwvc3Bhbj7nvbLnm4rmnZHlp5TljZflr6jmnZHlp5TmnZHnuqfnu7zlkIjmtLvliqjlnLrmiYDlu7rorr7pobnnm648L3A+PHAgc3R5bGU9Im1hcmdpbi10b3A6IDBweDsgbWFyZ2luLWJvdHRvbTogMHB4OyBwYWRkaW5nOiAwcHg7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsiPirjgIHpobnnm67nvJblj7c65rC45pS/6YeHKCoqKiopKioq5Y+3PC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB5oub5qCH5YaF5a6577ya5pys5qyh6LCI5Yik5YWxKumhue+8jOaKpeS7t+S6uuaJgOaKleWMheWGhemhueebruW/hemhu+WujOWFqOWTjeW6lOeji+WVhuaWh+S7tuaJgOWIl+WGheWuuTwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyI+KuOAgeaLm+agh+aOp+WItuS7t++8mioqKioqKi4qKuWFg+OAgjwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyI+KuOAgeaLm+agh+iMg+WbtO+8muWFt+S9k+aKleagh+aKpeS7t+iMg+WbtOWPiuaJgOW6lOi+vuWIsOeahOWFt+S9k+imgeaxgu+8jOS7peacrOiwiOWIpOaWh+S7tuS4ree9suebiuadkeWnlOWNl+WvqOadkeWnlOadkea0u+WKqOWcuuaJgOW7uuiuvumhueebrueahOWGheWuueS4uuWHhuOAgjwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyI+KuOAgeW7uuiuvuWcsOeCue+8muivpuingeiwiOWIpOaWh+S7tuOAgjwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyI+KuOAgeW3peacnyoq5pel5Y6G5aSp44CCPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB5pys6aG555uu5LiN5o6l5Y+X6IGU5ZCI5L2T5oqV5qCH44CCPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB5oqV5qCH5Lq66LWE5qC86KaB5rGCPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB5YW35pyJ54us56uL5om/5ouF5rCR5LqL6LSj5Lu755qE6IO95YqbPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB5YW35pyJ6Imv5aW955qE5ZWG5Lia5L+h6KqJ5ZKM5YGl5YWo55qE6LSi5Yqh5Lya6K6h5Yi25bqmPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB5YW35pyJ5bGl6KGM5ZCI5ZCM5omA5b+F6ZyA55qE6K6+5aSH5ZKM5LiT5Lia5oqA5pyv6IO95YqbPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB5YW35pyJ5L6d5rOV57y057qz56iO5pS25ZKM56S+5Lya5L+d6Zqc6LWE6YeR55qE6Imv5aW96K6w5b2VPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB5Y+C5Yqg5q2k6aG56YeH6LSt5rS75Yqo5YmNKuW5tOWGhe+8jOWcqOe7j+iQpea0u+WKqOS4reaXoOmHjeWkp+i/neazleiusOW9lTwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyI+KuOAgeWFt+acieaIv+Wxi+W7uuetkeW3peeoi+aWveW3peaAu+aJv+WMhSrnuqflj4rku6XkuIrotYTotKg8L3A+PHAgc3R5bGU9Im1hcmdpbi10b3A6IDBweDsgbWFyZ2luLWJvdHRvbTogMHB4OyBwYWRkaW5nOiAwcHg7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsiPirjgIHmoLnmja7jgIrlhbPkuo7lnKjmlL/lupzph4fotK3mtLvliqjkuK3mn6Xor6Llh6Dkvb/nlKjkv6HnlKjorrDlvZXmnInlhbPpl67popjnmoTpgJrnn6XjgIso6LSi5bqTKCoqKiopKioq5Y+355qE6KeE5a6a77yM5a+55YiX5YWl5aSx5L+h5omn6KGM5Lq644CB6YeN5aSn56iO5pS26L+d5rOV5qGI5Lu25b2T5LqL5Lq65ZCN5Y2V44CB5pS/5bqc6YeH6LSt5Lil6YeN6L+d5rOV5aSx5L+h6KGM5Li66K6w5b2V5ZCN5Y2V55qE5oqV5qCH5Lq677yM5ouS57ud5Y+C5LiO5pys6aG555uu6YeH6LSt5rS75Yqo77yMKOafpeivoua4oOmBk+KAnOS/oeeUqOS4reWbveKAnee9keermSoqKi4qKioqKioqKioqKi4qKiouKiop44CB5Lit5Zu95pS/5bqc6YeH6LSt572RKCoqKi4qKioqLioqKi4qKiko5p+l6K+i5pel5pyf5bqU5Zyo5pys5YWs5ZGK5Y+R5biD5pel5pyf5YaFKTwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyI+KuOAgeazleW+i+OAgeihjOaUv+azleinhOinhOWumueahOWFtuS7luadoeS7tjwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyI+KuOAgeS+m+W6lOWVhuiOt+WPluiwiOWIpOaWh+S7tumhu+aQuuW4pueahOi1hOaWme+8mjwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyI+KuOAgeS8geS4muazleS6uuWnlOaJmOS5puWSjOWPl+aJmOS6uui6q+S7veivgeWOn+S7tijlj5fmiZjkurrpobvmmK/mnKzlhazlj7jlhbfmnInkuK3nuqfogYznp7DnmoTmioDmnK/kurrlkZjmiJbpobnnm67otJ/otKPkuropKuOAgeS8geS4mue7hOe7h+acuuaehOS7o+eggeivgeWJr+acrOWOn+S7tu+8jOS8geS4mueojuWKoeeZu+iusOivgeWOn+S7tu+8jOS8geS4muazleS6uuiQpeS4muaJp+eFp+WJr+acrOWOn+S7tijmiJbogIUq6K+B5ZCIKueahOiQpeS4muaJp+eFp+WOn+S7tikq44CB5LyB5Lia6LWE6LSo6K+B5Lmm5Ymv5pys5Y6f5Lu2KuOAgeS8geS4muW3peeoi+inhOi0ueiuoeWPluagh+WHhuivgeS5puWOn+S7tirjgIHkvIHkuJrlronlhajnlJ/kuqforrjlj6/or4Hljp/ku7Yq44CB5rOV5a6a5Luj6KGo5Lq66Lqr5Lu96K+B5aSN5Y2w5Lu2KuOAgeS8geS4muWfuuacrOi0puaIt+W8gOaIt+iuuOWPr+ivgeWOn+S7tirjgIHmi5/mtL7lvoDmnKzlt6XnqIvnmoTlu7rpgKDluIjpobvmj5DkvpvmiL/lsYvlu7rnrZHkuJPkuJrnmoQq57qn5bu66YCg5biI5rOo5YaM6K+B5Lmm44CB5a6J5YWo55Sf5Lqn6ICD5qC45ZCI5qC86K+B5Lmm5Y+K6Lqr5Lu96K+B5Y6f5Lu2KuOAgeaLn+a0vuW+gOacrOW3peeoi+mhueebruaKgOacr+i0n+i0o+S6uumhu+aPkOS+m+ebuOWFs+S4k+S4mueahOS4ree6p+WPiuS7peS4iuiBjOensOivgeWOn+S7tuOAgjwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyI+5Lul5LiK6LWE5paZ5b+F6aG75o+Q5L6b5Y6f5Lu2KOWOn+S7tumqjOWQjuW9kui/mCnlkozliqDnm5bosIjliKTkurrlhaznq6DnmoTmuIXmmbDlpI3ljbDku7boo4XorqLmiJDlhowo55WZ5a2YKe+8jOS4lOWxnuS6juWQiOazleacieaViOeahO+8jOWmguS4jeiDveaPkOS+m++8jOWwhuS+neaNruOAiuS4reWNjuS6uuawkeWFseWSjOWbveaUv+W6nOmHh+i0reazleOAi+acieWFs+adoeS+i+inhOWumu+8jOacieadg+aLkue7neS+m+W6lOWVhuiOt+WPluiwiOWIpOaWh+S7tuOAgjwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyI+5pys6aG555uu5raJ5Y+K5ZWG5Yqh6YOo5YiG5ZKo6K+i6YeH6LSt5Lit5b+D5raJ5Y+K5oqA5pyv6YOo5YiG5ZKo6K+i6YeH6LSt5Lq644CCPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB6I635Y+W6LCI5Yik5paH5Lu2PC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB6I635Y+W6LCI5Yik5paH5Lu25pe26Ze077yaKioqKuW5tCrmnIgqKuaXpeiHsyoqKirlubQq5pyIKirml6Uo5YyX5Lqs5pe26Ze0Ku+8mioqLSoq77yaKirvvIwqKu+8mioqLSoq77yaKiop5YWs5LyR5pel44CB6IqC5YGH5pel6Zmk5aSW44CCPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB6I635Y+W5Zyw54K577ya5rC45ZKM5Y6/5pS/5bqc6YeH6LSt5Lit5b+DPHNwYW4gY2xhc3M9ImRpdi13YXJwIiBpZD0id2FycF9hcmVhIiBzdHlsZT0icG9zaXRpb246IHJlbGF0aXZlOyB0ZXh0LWFsaWduOiBjZW50ZXI7Ij48c3BhbiBzdHlsZT0iY29sb3I6IHJnYigyNDMsIDE1MiwgMjkpOyB0ZXh0LWRlY29yYXRpb24tbGluZTogdW5kZXJsaW5lOyI+W+iBlOezu+aWueW8j108L3NwYW4+PC9zcGFuPuW6nOilv+ihlyrlj7c8L3A+PHAgc3R5bGU9Im1hcmdpbi10b3A6IDBweDsgbWFyZ2luLWJvdHRvbTogMHB4OyBwYWRkaW5nOiAwcHg7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsiPirjgIHosIjliKTml7bpl7Tlj4rlnLDngrnvvJo8L3A+PHAgc3R5bGU9Im1hcmdpbi10b3A6IDBweDsgbWFyZ2luLWJvdHRvbTogMHB4OyBwYWRkaW5nOiAwcHg7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsiPirjgIHml7bpl7TvvJoqKioq5bm0KuaciCoq5pel5LiK5Y2IKirml7YqKuWIhijljJfkuqzml7bpl7QpPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB5Zyw54K577ya5rC45ZKM5Y6/6YeH6LSt5Lit5b+D5oub5qCH5a6kKOWOv+WuvummhumZouWGheaUv+WKoeS4reW/gyk8L3A+PHAgc3R5bGU9Im1hcmdpbi10b3A6IDBweDsgbWFyZ2luLWJvdHRvbTogMHB4OyBwYWRkaW5nOiAwcHg7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsiPirjgIHogZTns7vmlrnlvI88L3A+PHAgc3R5bGU9Im1hcmdpbi10b3A6IDBweDsgbWFyZ2luLWJvdHRvbTogMHB4OyBwYWRkaW5nOiAwcHg7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsiPumHh+i0reWNleS9je+8muawuOWSjOWOv+ahkeWjgemVh+S6uuawkeaUv+W6nDxzcGFuIGNsYXNzPSJkaXYtd2FycCIgaWQ9IndhcnBfYXJlYSIgc3R5bGU9InBvc2l0aW9uOiByZWxhdGl2ZTsgdGV4dC1hbGlnbjogY2VudGVyOyI+PHNwYW4gc3R5bGU9ImNvbG9yOiByZ2IoMjQzLCAxNTIsIDI5KTsgdGV4dC1kZWNvcmF0aW9uLWxpbmU6IHVuZGVybGluZTsiPlvogZTns7vmlrnlvI9dPC9zcGFuPjwvc3Bhbj48L3A+PHAgc3R5bGU9Im1hcmdpbi10b3A6IDBweDsgbWFyZ2luLWJvdHRvbTogMHB4OyBwYWRkaW5nOiAwcHg7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsiPuiBlOezu+S6uu+8muadjuWFiOeUnzwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyI+6IGU57O755S16K+d77yaKioqKioqKioqKio8L3A+PHAgc3R5bGU9Im1hcmdpbi10b3A6IDBweDsgbWFyZ2luLWJvdHRvbTogMHB4OyBwYWRkaW5nOiAwcHg7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsiPumbhumHh+acuuaehO+8muawuOWSjOWOv+aUv+W6nOmHh+i0reS4reW/gzxzcGFuIGNsYXNzPSJkaXYtd2FycCIgaWQ9IndhcnBfYXJlYSIgc3R5bGU9InBvc2l0aW9uOiByZWxhdGl2ZTsgdGV4dC1hbGlnbjogY2VudGVyOyI+PHNwYW4gc3R5bGU9ImNvbG9yOiByZ2IoMjQzLCAxNTIsIDI5KTsgdGV4dC1kZWNvcmF0aW9uLWxpbmU6IHVuZGVybGluZTsiPlvogZTns7vmlrnlvI9dPC9zcGFuPjwvc3Bhbj48L3A+PHAgc3R5bGU9Im1hcmdpbi10b3A6IDBweDsgbWFyZ2luLWJvdHRvbTogMHB4OyBwYWRkaW5nOiAwcHg7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsiPuiBlOezu+S6uu+8muS7u+Wls+WjqzwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyI+6IGU57O755S16K+d77yaKioqKi0qKioqKioqPC9wPjxwPjxici8+PC9wPg==', '0000-00-00 00:00:00', '18188888888', '888888.com', '109', ' 1585555555', 0);
INSERT INTO `youbang_addoninfos` VALUES (1866, 1, -8, 0, 1, 0, '永和县桑壁镇人民政府署益村委南寨村委村级综合活动场所建设项目谈判公告', '/img/2019/8/14/fcef959cf046a2be98cfd131652cdd20.png', '0', 0, '', 0, 0, 0, 0, 145, '0', 'PGgxIGNsYXNzPSJkZXRhaWx0aXRsZSIgdGl0bGU9IuawuOWSjOWOv+ahkeWjgemVh+S6uuawkeaUv+W6nOe9suebiuadkeWnlOWNl+WvqOadkeWnlOadkee6p+e7vOWQiOa0u+WKqOWcuuaJgOW7uuiuvumhueebruiwiOWIpOWFrOWRiiIgc3R5bGU9Im1hcmdpbjogMHB4OyBwYWRkaW5nOiAxMHB4IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyBmb250LXNpemU6IDE4cHg7IGZvbnQtd2VpZ2h0OiA0MDA7IGZvbnQtZmFtaWx5OiDlvq7ova/pm4Xpu5E7IGNvbG9yOiByZ2IoNTEsIDUxLCA1MSk7IHdoaXRlLXNwYWNlOiBub3JtYWw7IGxpbmUtaGVpZ2h0OiAyOHB4OyB0ZXh0LWFsaWduOiBjZW50ZXI7IGJvcmRlci1ib3R0b206IDFweCBkYXNoZWQgcmdiKDIwNCwgMjA0LCAyMDQpOyI+PGJyLz48L2gxPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij7msLjlkozljr/moZHlo4HplYfkurrmsJHmlL/lupw8c3BhbiBjbGFzcz0iZGl2LXdhcnAiIGlkPSJ3YXJwX2FyZWEiIHN0eWxlPSJwb3NpdGlvbjogcmVsYXRpdmU7IHRleHQtYWxpZ246IGNlbnRlcjsiPjxzcGFuIHN0eWxlPSJjb2xvcjogcmdiKDI0MywgMTUyLCAyOSk7IHRleHQtZGVjb3JhdGlvbi1saW5lOiB1bmRlcmxpbmU7Ij5b6IGU57O75pa55byPXTwvc3Bhbj48L3NwYW4+572y55uK5p2R5aeU5Y2X5a+o5p2R5aeU5p2R57qn57u85ZCI5rS75Yqo5Zy65omA5bu66K6+6aG555uu56ue5LqJ5oCn6LCI5Yik5YWs5ZGKPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij7msLjlkozljr/mlL/lupzph4fotK3kuK3lv4M8c3BhbiBjbGFzcz0iZGl2LXdhcnAiIGlkPSJ3YXJwX2FyZWEiIHN0eWxlPSJwb3NpdGlvbjogcmVsYXRpdmU7IHRleHQtYWxpZ246IGNlbnRlcjsiPjxzcGFuIHN0eWxlPSJjb2xvcjogcmdiKDI0MywgMTUyLCAyOSk7IHRleHQtZGVjb3JhdGlvbi1saW5lOiB1bmRlcmxpbmU7Ij5b6IGU57O75pa55byPXTwvc3Bhbj48L3NwYW4+5Y+X5qGR5aOB6ZWH5Lq65rCR5pS/5bqc5aeU5omY77yM5a+55qGR5aOB6ZWH572y55uK5p2R5aeU5Y2X5a+o5p2R5aeU5p2R57qn57u85ZCI5rS75Yqo5Zy65omA5bu66K6+6aG555uu57uE57uH56ue5LqJ5oCn6LCI5Yik6YeH6LSt77yM5qyi6L+O5YW35pyJ5om/5ouF5pys6aG555uu6IO95Yqb44CB6LWE5L+h6Imv5aW955qE5L6b5bqU5ZWG5Y+C5Yqg6LCI5Yik44CCPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB6aG555uu5ZCN56ewOuawuOWSjOWOv+ahkeWjgemVh+S6uuawkeaUv+W6nDxzcGFuIGNsYXNzPSJkaXYtd2FycCIgaWQ9IndhcnBfYXJlYSIgc3R5bGU9InBvc2l0aW9uOiByZWxhdGl2ZTsgdGV4dC1hbGlnbjogY2VudGVyOyI+PHNwYW4gc3R5bGU9ImNvbG9yOiByZ2IoMjQzLCAxNTIsIDI5KTsgdGV4dC1kZWNvcmF0aW9uLWxpbmU6IHVuZGVybGluZTsiPlvogZTns7vmlrnlvI9dPC9zcGFuPjwvc3Bhbj7nvbLnm4rmnZHlp5TljZflr6jmnZHlp5TmnZHnuqfnu7zlkIjmtLvliqjlnLrmiYDlu7rorr7pobnnm648L3A+PHAgc3R5bGU9Im1hcmdpbi10b3A6IDBweDsgbWFyZ2luLWJvdHRvbTogMHB4OyBwYWRkaW5nOiAwcHg7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsiPirjgIHpobnnm67nvJblj7c65rC45pS/6YeHKCoqKiopKioq5Y+3PC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB5oub5qCH5YaF5a6577ya5pys5qyh6LCI5Yik5YWxKumhue+8jOaKpeS7t+S6uuaJgOaKleWMheWGhemhueebruW/hemhu+WujOWFqOWTjeW6lOeji+WVhuaWh+S7tuaJgOWIl+WGheWuuTwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyI+KuOAgeaLm+agh+aOp+WItuS7t++8mioqKioqKi4qKuWFg+OAgjwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyI+KuOAgeaLm+agh+iMg+WbtO+8muWFt+S9k+aKleagh+aKpeS7t+iMg+WbtOWPiuaJgOW6lOi+vuWIsOeahOWFt+S9k+imgeaxgu+8jOS7peacrOiwiOWIpOaWh+S7tuS4ree9suebiuadkeWnlOWNl+WvqOadkeWnlOadkea0u+WKqOWcuuaJgOW7uuiuvumhueebrueahOWGheWuueS4uuWHhuOAgjwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyI+KuOAgeW7uuiuvuWcsOeCue+8muivpuingeiwiOWIpOaWh+S7tuOAgjwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyI+KuOAgeW3peacnyoq5pel5Y6G5aSp44CCPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB5pys6aG555uu5LiN5o6l5Y+X6IGU5ZCI5L2T5oqV5qCH44CCPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB5oqV5qCH5Lq66LWE5qC86KaB5rGCPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB5YW35pyJ54us56uL5om/5ouF5rCR5LqL6LSj5Lu755qE6IO95YqbPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB5YW35pyJ6Imv5aW955qE5ZWG5Lia5L+h6KqJ5ZKM5YGl5YWo55qE6LSi5Yqh5Lya6K6h5Yi25bqmPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB5YW35pyJ5bGl6KGM5ZCI5ZCM5omA5b+F6ZyA55qE6K6+5aSH5ZKM5LiT5Lia5oqA5pyv6IO95YqbPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB5YW35pyJ5L6d5rOV57y057qz56iO5pS25ZKM56S+5Lya5L+d6Zqc6LWE6YeR55qE6Imv5aW96K6w5b2VPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB5Y+C5Yqg5q2k6aG56YeH6LSt5rS75Yqo5YmNKuW5tOWGhe+8jOWcqOe7j+iQpea0u+WKqOS4reaXoOmHjeWkp+i/neazleiusOW9lTwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyI+KuOAgeWFt+acieaIv+Wxi+W7uuetkeW3peeoi+aWveW3peaAu+aJv+WMhSrnuqflj4rku6XkuIrotYTotKg8L3A+PHAgc3R5bGU9Im1hcmdpbi10b3A6IDBweDsgbWFyZ2luLWJvdHRvbTogMHB4OyBwYWRkaW5nOiAwcHg7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsiPirjgIHmoLnmja7jgIrlhbPkuo7lnKjmlL/lupzph4fotK3mtLvliqjkuK3mn6Xor6Llh6Dkvb/nlKjkv6HnlKjorrDlvZXmnInlhbPpl67popjnmoTpgJrnn6XjgIso6LSi5bqTKCoqKiopKioq5Y+355qE6KeE5a6a77yM5a+55YiX5YWl5aSx5L+h5omn6KGM5Lq644CB6YeN5aSn56iO5pS26L+d5rOV5qGI5Lu25b2T5LqL5Lq65ZCN5Y2V44CB5pS/5bqc6YeH6LSt5Lil6YeN6L+d5rOV5aSx5L+h6KGM5Li66K6w5b2V5ZCN5Y2V55qE5oqV5qCH5Lq677yM5ouS57ud5Y+C5LiO5pys6aG555uu6YeH6LSt5rS75Yqo77yMKOafpeivoua4oOmBk+KAnOS/oeeUqOS4reWbveKAnee9keermSoqKi4qKioqKioqKioqKi4qKiouKiop44CB5Lit5Zu95pS/5bqc6YeH6LSt572RKCoqKi4qKioqLioqKi4qKiko5p+l6K+i5pel5pyf5bqU5Zyo5pys5YWs5ZGK5Y+R5biD5pel5pyf5YaFKTwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyI+KuOAgeazleW+i+OAgeihjOaUv+azleinhOinhOWumueahOWFtuS7luadoeS7tjwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyI+KuOAgeS+m+W6lOWVhuiOt+WPluiwiOWIpOaWh+S7tumhu+aQuuW4pueahOi1hOaWme+8mjwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyI+KuOAgeS8geS4muazleS6uuWnlOaJmOS5puWSjOWPl+aJmOS6uui6q+S7veivgeWOn+S7tijlj5fmiZjkurrpobvmmK/mnKzlhazlj7jlhbfmnInkuK3nuqfogYznp7DnmoTmioDmnK/kurrlkZjmiJbpobnnm67otJ/otKPkuropKuOAgeS8geS4mue7hOe7h+acuuaehOS7o+eggeivgeWJr+acrOWOn+S7tu+8jOS8geS4mueojuWKoeeZu+iusOivgeWOn+S7tu+8jOS8geS4muazleS6uuiQpeS4muaJp+eFp+WJr+acrOWOn+S7tijmiJbogIUq6K+B5ZCIKueahOiQpeS4muaJp+eFp+WOn+S7tikq44CB5LyB5Lia6LWE6LSo6K+B5Lmm5Ymv5pys5Y6f5Lu2KuOAgeS8geS4muW3peeoi+inhOi0ueiuoeWPluagh+WHhuivgeS5puWOn+S7tirjgIHkvIHkuJrlronlhajnlJ/kuqforrjlj6/or4Hljp/ku7Yq44CB5rOV5a6a5Luj6KGo5Lq66Lqr5Lu96K+B5aSN5Y2w5Lu2KuOAgeS8geS4muWfuuacrOi0puaIt+W8gOaIt+iuuOWPr+ivgeWOn+S7tirjgIHmi5/mtL7lvoDmnKzlt6XnqIvnmoTlu7rpgKDluIjpobvmj5DkvpvmiL/lsYvlu7rnrZHkuJPkuJrnmoQq57qn5bu66YCg5biI5rOo5YaM6K+B5Lmm44CB5a6J5YWo55Sf5Lqn6ICD5qC45ZCI5qC86K+B5Lmm5Y+K6Lqr5Lu96K+B5Y6f5Lu2KuOAgeaLn+a0vuW+gOacrOW3peeoi+mhueebruaKgOacr+i0n+i0o+S6uumhu+aPkOS+m+ebuOWFs+S4k+S4mueahOS4ree6p+WPiuS7peS4iuiBjOensOivgeWOn+S7tuOAgjwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyI+5Lul5LiK6LWE5paZ5b+F6aG75o+Q5L6b5Y6f5Lu2KOWOn+S7tumqjOWQjuW9kui/mCnlkozliqDnm5bosIjliKTkurrlhaznq6DnmoTmuIXmmbDlpI3ljbDku7boo4XorqLmiJDlhowo55WZ5a2YKe+8jOS4lOWxnuS6juWQiOazleacieaViOeahO+8jOWmguS4jeiDveaPkOS+m++8jOWwhuS+neaNruOAiuS4reWNjuS6uuawkeWFseWSjOWbveaUv+W6nOmHh+i0reazleOAi+acieWFs+adoeS+i+inhOWumu+8jOacieadg+aLkue7neS+m+W6lOWVhuiOt+WPluiwiOWIpOaWh+S7tuOAgjwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyI+5pys6aG555uu5raJ5Y+K5ZWG5Yqh6YOo5YiG5ZKo6K+i6YeH6LSt5Lit5b+D5raJ5Y+K5oqA5pyv6YOo5YiG5ZKo6K+i6YeH6LSt5Lq644CCPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB6I635Y+W6LCI5Yik5paH5Lu2PC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB6I635Y+W6LCI5Yik5paH5Lu25pe26Ze077yaKioqKuW5tCrmnIgqKuaXpeiHsyoqKirlubQq5pyIKirml6Uo5YyX5Lqs5pe26Ze0Ku+8mioqLSoq77yaKirvvIwqKu+8mioqLSoq77yaKiop5YWs5LyR5pel44CB6IqC5YGH5pel6Zmk5aSW44CCPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB6I635Y+W5Zyw54K577ya5rC45ZKM5Y6/5pS/5bqc6YeH6LSt5Lit5b+DPHNwYW4gY2xhc3M9ImRpdi13YXJwIiBpZD0id2FycF9hcmVhIiBzdHlsZT0icG9zaXRpb246IHJlbGF0aXZlOyB0ZXh0LWFsaWduOiBjZW50ZXI7Ij48c3BhbiBzdHlsZT0iY29sb3I6IHJnYigyNDMsIDE1MiwgMjkpOyB0ZXh0LWRlY29yYXRpb24tbGluZTogdW5kZXJsaW5lOyI+W+iBlOezu+aWueW8j108L3NwYW4+PC9zcGFuPuW6nOilv+ihlyrlj7c8L3A+PHAgc3R5bGU9Im1hcmdpbi10b3A6IDBweDsgbWFyZ2luLWJvdHRvbTogMHB4OyBwYWRkaW5nOiAwcHg7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsiPirjgIHosIjliKTml7bpl7Tlj4rlnLDngrnvvJo8L3A+PHAgc3R5bGU9Im1hcmdpbi10b3A6IDBweDsgbWFyZ2luLWJvdHRvbTogMHB4OyBwYWRkaW5nOiAwcHg7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsiPirjgIHml7bpl7TvvJoqKioq5bm0KuaciCoq5pel5LiK5Y2IKirml7YqKuWIhijljJfkuqzml7bpl7QpPC9wPjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAwcHg7IG1hcmdpbi1ib3R0b206IDBweDsgcGFkZGluZzogMHB4OyAtd2Via2l0LXRhcC1oaWdobGlnaHQtY29sb3I6IHJnYmEoMCwgMCwgMCwgMCk7Ij4q44CB5Zyw54K577ya5rC45ZKM5Y6/6YeH6LSt5Lit5b+D5oub5qCH5a6kKOWOv+WuvummhumZouWGheaUv+WKoeS4reW/gyk8L3A+PHAgc3R5bGU9Im1hcmdpbi10b3A6IDBweDsgbWFyZ2luLWJvdHRvbTogMHB4OyBwYWRkaW5nOiAwcHg7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsiPirjgIHogZTns7vmlrnlvI88L3A+PHAgc3R5bGU9Im1hcmdpbi10b3A6IDBweDsgbWFyZ2luLWJvdHRvbTogMHB4OyBwYWRkaW5nOiAwcHg7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsiPumHh+i0reWNleS9je+8muawuOWSjOWOv+ahkeWjgemVh+S6uuawkeaUv+W6nDxzcGFuIGNsYXNzPSJkaXYtd2FycCIgaWQ9IndhcnBfYXJlYSIgc3R5bGU9InBvc2l0aW9uOiByZWxhdGl2ZTsgdGV4dC1hbGlnbjogY2VudGVyOyI+PHNwYW4gc3R5bGU9ImNvbG9yOiByZ2IoMjQzLCAxNTIsIDI5KTsgdGV4dC1kZWNvcmF0aW9uLWxpbmU6IHVuZGVybGluZTsiPlvogZTns7vmlrnlvI9dPC9zcGFuPjwvc3Bhbj48L3A+PHAgc3R5bGU9Im1hcmdpbi10b3A6IDBweDsgbWFyZ2luLWJvdHRvbTogMHB4OyBwYWRkaW5nOiAwcHg7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsiPuiBlOezu+S6uu+8muadjuWFiOeUnzwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyI+6IGU57O755S16K+d77yaKioqKioqKioqKio8L3A+PHAgc3R5bGU9Im1hcmdpbi10b3A6IDBweDsgbWFyZ2luLWJvdHRvbTogMHB4OyBwYWRkaW5nOiAwcHg7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsiPumbhumHh+acuuaehO+8muawuOWSjOWOv+aUv+W6nOmHh+i0reS4reW/gzxzcGFuIGNsYXNzPSJkaXYtd2FycCIgaWQ9IndhcnBfYXJlYSIgc3R5bGU9InBvc2l0aW9uOiByZWxhdGl2ZTsgdGV4dC1hbGlnbjogY2VudGVyOyI+PHNwYW4gc3R5bGU9ImNvbG9yOiByZ2IoMjQzLCAxNTIsIDI5KTsgdGV4dC1kZWNvcmF0aW9uLWxpbmU6IHVuZGVybGluZTsiPlvogZTns7vmlrnlvI9dPC9zcGFuPjwvc3Bhbj48L3A+PHAgc3R5bGU9Im1hcmdpbi10b3A6IDBweDsgbWFyZ2luLWJvdHRvbTogMHB4OyBwYWRkaW5nOiAwcHg7IC13ZWJraXQtdGFwLWhpZ2hsaWdodC1jb2xvcjogcmdiYSgwLCAwLCAwLCAwKTsiPuiBlOezu+S6uu+8muS7u+Wls+WjqzwvcD48cCBzdHlsZT0ibWFyZ2luLXRvcDogMHB4OyBtYXJnaW4tYm90dG9tOiAwcHg7IHBhZGRpbmc6IDBweDsgLXdlYmtpdC10YXAtaGlnaGxpZ2h0LWNvbG9yOiByZ2JhKDAsIDAsIDAsIDApOyI+6IGU57O755S16K+d77yaKioqKi0qKioqKioqPC9wPjxwPjxici8+PC9wPg==', '0000-00-00 00:00:00', '18188888888', '888888.com', '109', '1585555555', 0);
INSERT INTO `youbang_addoninfos` VALUES (1870, 38, -8, 0, 1, 0, '15985499999', '/img/2019/8/14/3dd254cd118371209ed8fec5c2f41b0a.png', '0', 0, 'z-r', 0, 0, 0, 0, 143, '0', '', '0000-00-00 00:00:00', '15985496246', '1598549999', '144', '顶替苛', 0);
INSERT INTO `youbang_addoninfos` VALUES (1871, 39, -8, 0, 1, 0, '验证码设置梵蒂冈第三方', '', '0', 0, 'z', 0, 0, 0, 0, 150, '0', '', '0000-00-00 00:00:00', '15985496246', '', '', '', 0);
INSERT INTO `youbang_addoninfos` VALUES (1899, 12, -8, 0, 1, 0, '验证码设置梵蒂冈第三方', '', '0', 0, '0', 0, 0, 0, 0, 0, '0', '', '0000-00-00 00:00:00', '', '', '', '', 0);
INSERT INTO `youbang_addoninfos` VALUES (1900, 12, -8, 0, 1, 0, '验证码设置梵蒂冈第三方', '', '0', 0, '0', 0, 0, 0, 0, 0, '0', '', '0000-00-00 00:00:00', '', '', '', '', 0);
INSERT INTO `youbang_addoninfos` VALUES (1901, 32, -8, 0, 1, 0, '789879', '', '0', 0, 'h-z', 0, 0, 0, 0, 0, '0', '', '0000-00-00 00:00:00', '', '', '', '', 0);
INSERT INTO `youbang_addoninfos` VALUES (1913, 56, -8, 0, 1, 0, 'er梵蒂冈第三方', '', '0', 0, 'h-z', 0, 0, 0, 0, 160, '0', '', '0000-00-00 00:00:00', '', '', '', '', 0);

-- ----------------------------
-- Table structure for youbang_addonjobwanted
-- ----------------------------
DROP TABLE IF EXISTS `youbang_addonjobwanted`;
CREATE TABLE `youbang_addonjobwanted`  (
  `aid` bigint(13) NOT NULL DEFAULT 0 COMMENT '关联主表和工作经验表',
  `componentid` int(11) NULL DEFAULT NULL COMMENT '组件id',
  `title` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `uname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '求职姓名',
  `litpic` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '求职着头像',
  `gender` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '0是女，1是男',
  `job_education` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '4' COMMENT '求职者学历 与youabng_enum表中enumtag对应用',
  `job_experience` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '求职的经验 与youabng_enum表中enumtag对应用',
  `age` int(11) NULL DEFAULT NULL COMMENT '求职者年龄',
  `updatetiem` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `delivery` tinyint(11) NULL DEFAULT NULL COMMENT '投递职位次数',
  `browse` tinyint(11) NULL DEFAULT NULL COMMENT '浏览次数',
  `job_salary` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '求职者要求薪资 与youabng_enum表中enumtag对应用',
  `provinceid` int(11) NULL DEFAULT NULL COMMENT '求职者要求省id',
  `address` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '求职者要求城市',
  `phone` int(11) NULL DEFAULT NULL COMMENT '求职者联系电话',
  `level` tinyint(4) NULL DEFAULT 0 COMMENT '会员等级',
  `job_industry` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job_Nature` float NULL DEFAULT NULL,
  `typeid` float NULL DEFAULT NULL,
  `company` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`aid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of youbang_addonjobwanted
-- ----------------------------
INSERT INTO `youbang_addonjobwanted` VALUES (300, NULL, NULL, '高兴', '/img/2019/8/1/be1c57289bccc1eea951f1bcfe64df00.png', '1', '4', '1', 30, '2019-08-28 15:56:23', 2, 3, '1', 24, 127, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for youbang_addonperrecruit
-- ----------------------------
DROP TABLE IF EXISTS `youbang_addonperrecruit`;
CREATE TABLE `youbang_addonperrecruit`  (
  `aid` bigint(13) NOT NULL COMMENT '关联主表',
  `typeid` int(11) NULL DEFAULT NULL,
  `componentid` smallint(6) NULL DEFAULT NULL COMMENT '组件id',
  `mid` int(11) NULL DEFAULT NULL COMMENT '关联公司id',
  `classify` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '招聘类型',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '招聘标题',
  `classsalary` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '薪资分类',
  `classlabel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签分类',
  `number` tinyint(4) NULL DEFAULT NULL COMMENT '招聘人数',
  `classexperience` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '经验分类',
  `classeducation` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学历分类',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职位描述',
  `level` tinyint(4) NULL DEFAULT NULL COMMENT '会员等级',
  PRIMARY KEY (`aid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of youbang_addonperrecruit
-- ----------------------------
INSERT INTO `youbang_addonperrecruit` VALUES (1897, 40, NULL, 1, NULL, '验证码设置梵蒂冈第三方', '0', '0', NULL, NULL, '0', '-', 0);
INSERT INTO `youbang_addonperrecruit` VALUES (1903, 41, NULL, 1, NULL, '验证码设8496', '0', '0', NULL, NULL, '0', '-', 0);

-- ----------------------------
-- Table structure for youbang_addonspec
-- ----------------------------
DROP TABLE IF EXISTS `youbang_addonspec`;
CREATE TABLE `youbang_addonspec`  (
  `aid` bigint(13) UNSIGNED NOT NULL DEFAULT 0,
  `typeid` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `note` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `templet` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `userip` char(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `redirecturl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`aid`) USING BTREE,
  INDEX `typeid`(`typeid`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for youbang_addresslist
-- ----------------------------
DROP TABLE IF EXISTS `youbang_addresslist`;
CREATE TABLE `youbang_addresslist`  (
  `id` bigint(13) NOT NULL AUTO_INCREMENT,
  `type` enum('member','orders','infos') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'member' COMMENT '地址类刑\r\nmember: 用户地址\r\norder: 订单地址\r\ninfos: 信息主体地址 ',
  `mainid` int(11) NULL DEFAULT NULL COMMENT '地址所属主体的id',
  `provinceid` int(255) NULL DEFAULT NULL COMMENT '省id',
  `cityid` int(255) NULL DEFAULT NULL COMMENT '市id',
  `countyid` int(255) NULL DEFAULT NULL COMMENT '县id',
  `detail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `addtime` datetime(0) NULL DEFAULT NULL COMMENT '加入注时间',
  `enable` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否可用（1）',
  `default` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否默认地址，当前适用于收货地址',
  `realname` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `tel` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 161 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of youbang_addresslist
-- ----------------------------
INSERT INTO `youbang_addresslist` VALUES (7, 'member', 1, 26, 2607, 260709, '兴义市', '2019-08-03 11:06:14', '1', '0', 'zhangjie', '13888888888');
INSERT INTO `youbang_addresslist` VALUES (8, 'infos', 1, 26, 2607, 260701, '桔山镇12', '2019-08-02 17:09:32', '1', '0', 'zhangjie', '13888888888');
INSERT INTO `youbang_addresslist` VALUES (9, 'infos', 1, 26, 2607, 260701, '桔山镇', '2019-08-02 17:09:47', '1', '1', 'zhangjie', '13888888888');
INSERT INTO `youbang_addresslist` VALUES (10, 'member', 1, 26, 2607, 260701, '桔山镇', '2019-08-02 17:37:55', '1', '0', 'zhangjie', '13888888888');
INSERT INTO `youbang_addresslist` VALUES (106, 'infos', 1, 7, 154, 891, '3454夺要4563456345', '2019-08-02 17:39:53', '1', '0', 'zhangjie', '13888888888');
INSERT INTO `youbang_addresslist` VALUES (107, 'infos', NULL, 24, 402, 2680, '顶替枯无可厚非 ', '2019-08-08 16:25:14', '1', NULL, NULL, NULL);
INSERT INTO `youbang_addresslist` VALUES (108, 'infos', NULL, 14, 241, 1571, 'saerfeaser', '2019-08-13 09:31:21', '1', NULL, NULL, NULL);
INSERT INTO `youbang_addresslist` VALUES (109, 'infos', NULL, 13, 230, 1487, '脾 遥舶从人2人人', '2019-08-13 09:47:35', '1', NULL, NULL, NULL);
INSERT INTO `youbang_addresslist` VALUES (110, 'infos', NULL, 16, 268, 1806, '3454夺要', '2019-08-13 09:47:51', '1', NULL, NULL, NULL);
INSERT INTO `youbang_addresslist` VALUES (111, 'infos', NULL, 1, 36, 0, 'undefined', '2019-08-13 10:12:21', '1', NULL, NULL, NULL);
INSERT INTO `youbang_addresslist` VALUES (112, 'infos', NULL, 5, 125, 0, 'undefined', '2019-08-13 10:13:45', '1', NULL, NULL, NULL);
INSERT INTO `youbang_addresslist` VALUES (113, 'infos', NULL, 18, 296, 2048, 'undefined', '2019-08-13 10:17:02', '1', NULL, NULL, NULL);
INSERT INTO `youbang_addresslist` VALUES (114, 'infos', NULL, 1, 36, 0, 'undefined', '2019-08-13 10:21:57', '1', NULL, NULL, NULL);
INSERT INTO `youbang_addresslist` VALUES (115, 'infos', NULL, 4, 101, 0, 'undefined', '2019-08-13 10:26:01', '1', NULL, NULL, NULL);
INSERT INTO `youbang_addresslist` VALUES (116, 'infos', NULL, 15, 249, 0, 'undefined', '2019-08-13 10:26:13', '1', NULL, NULL, NULL);
INSERT INTO `youbang_addresslist` VALUES (117, 'infos', NULL, 5, 132, 0, 'undefined', '2019-08-13 10:28:11', '1', NULL, NULL, NULL);
INSERT INTO `youbang_addresslist` VALUES (118, 'infos', NULL, 7, 152, 0, 'undefined', '2019-08-13 10:28:43', '1', NULL, NULL, NULL);
INSERT INTO `youbang_addresslist` VALUES (119, 'infos', NULL, 7, 152, 865, 'undefined', '2019-08-13 10:30:04', '1', NULL, NULL, NULL);
INSERT INTO `youbang_addresslist` VALUES (120, 'infos', NULL, 20, 339, 2322, '3454夺要', '2019-08-13 10:30:08', '1', NULL, NULL, NULL);
INSERT INTO `youbang_addresslist` VALUES (121, 'infos', NULL, 1, 36, 0, 'undefined', '2019-08-13 10:34:32', '1', NULL, NULL, NULL);
INSERT INTO `youbang_addresslist` VALUES (122, 'infos', NULL, 1, 36, 0, 'undefined', '2019-08-13 10:35:47', '1', NULL, NULL, NULL);
INSERT INTO `youbang_addresslist` VALUES (123, 'infos', NULL, 1, 36, 0, 'undefined', '2019-08-13 10:36:29', '1', NULL, NULL, NULL);
INSERT INTO `youbang_addresslist` VALUES (124, 'infos', NULL, 1, 36, 0, 'undefined', '2019-08-13 10:36:36', '1', NULL, NULL, NULL);
INSERT INTO `youbang_addresslist` VALUES (125, 'infos', NULL, 5, 129, 0, 'undefined', '2019-08-13 10:39:05', '1', NULL, NULL, NULL);
INSERT INTO `youbang_addresslist` VALUES (126, 'infos', NULL, 1, 36, 0, 'undefined', '2019-08-13 10:40:00', '1', NULL, NULL, NULL);
INSERT INTO `youbang_addresslist` VALUES (127, 'infos', NULL, 13, 219, 0, 'undefined', '2019-08-13 10:46:26', '1', NULL, NULL, NULL);
INSERT INTO `youbang_addresslist` VALUES (128, 'infos', NULL, 19, 307, 0, 'undefined', '2019-08-13 10:46:28', '1', NULL, NULL, NULL);
INSERT INTO `youbang_addresslist` VALUES (129, 'infos', NULL, 4, 87, 0, 'undefined', '2019-08-13 10:47:40', '1', NULL, NULL, NULL);
INSERT INTO `youbang_addresslist` VALUES (130, 'infos', NULL, 1, 36, 0, 'undefined', '2019-08-13 10:49:01', '1', NULL, NULL, NULL);
INSERT INTO `youbang_addresslist` VALUES (131, 'infos', NULL, 1, 45, 0, 'undefined', '2019-08-13 10:49:38', '1', NULL, NULL, NULL);
INSERT INTO `youbang_addresslist` VALUES (132, 'infos', NULL, 7, 154, 0, 'undefined', '2019-08-13 10:50:55', '1', NULL, NULL, NULL);
INSERT INTO `youbang_addresslist` VALUES (133, 'infos', NULL, 17, 287, 1977, '顶替枯无可厚非 ', '2019-08-13 10:51:01', '1', NULL, NULL, NULL);
INSERT INTO `youbang_addresslist` VALUES (134, 'infos', NULL, 14, 240, 1569, '3454夺要', '2019-08-13 11:02:03', '1', NULL, NULL, NULL);
INSERT INTO `youbang_addresslist` VALUES (135, 'infos', NULL, 3, 70, 0, 'undefined', '2019-08-13 11:02:26', '1', NULL, NULL, NULL);
INSERT INTO `youbang_addresslist` VALUES (136, 'infos', NULL, 17, 285, 0, 'undefined', '2019-08-13 11:36:00', '1', NULL, NULL, NULL);
INSERT INTO `youbang_addresslist` VALUES (137, 'infos', NULL, 15, 253, 1681, '345dfgsd sd', '2019-08-13 11:37:27', '1', NULL, NULL, NULL);
INSERT INTO `youbang_addresslist` VALUES (138, 'infos', NULL, 21, 346, 0, 'undefined', '2019-08-13 13:05:59', '1', NULL, NULL, NULL);
INSERT INTO `youbang_addresslist` VALUES (139, 'infos', NULL, 18, 300, 2076, NULL, '2019-08-13 15:25:10', '1', NULL, NULL, NULL);
INSERT INTO `youbang_addresslist` VALUES (140, 'infos', NULL, 16, 260, 1736, NULL, '2019-08-13 15:26:10', '1', NULL, NULL, NULL);
INSERT INTO `youbang_addresslist` VALUES (141, 'infos', NULL, 15, 249, 1632, NULL, '2019-08-13 15:29:42', '1', NULL, NULL, NULL);
INSERT INTO `youbang_addresslist` VALUES (142, 'infos', NULL, 6, 140, NULL, NULL, '2019-08-13 17:15:33', '1', NULL, NULL, NULL);
INSERT INTO `youbang_addresslist` VALUES (143, 'infos', NULL, 16, 261, NULL, NULL, '2019-08-14 12:47:22', '1', NULL, NULL, NULL);
INSERT INTO `youbang_addresslist` VALUES (144, 'infos', NULL, 14, 242, 1585, '体育会月饼黄牛用仍', '2019-08-14 12:47:53', '1', NULL, NULL, NULL);
INSERT INTO `youbang_addresslist` VALUES (145, 'infos', NULL, 5, 219, 1485, NULL, '2019-08-14 14:11:57', '1', NULL, NULL, NULL);
INSERT INTO `youbang_addresslist` VALUES (146, '', NULL, 13, 229, 1477, NULL, '2019-08-14 15:44:31', '1', NULL, NULL, NULL);
INSERT INTO `youbang_addresslist` VALUES (147, '', NULL, 14, 240, 1565, NULL, '2019-08-14 15:46:15', '1', NULL, NULL, NULL);
INSERT INTO `youbang_addresslist` VALUES (148, 'infos', NULL, 17, 287, NULL, NULL, '2019-08-15 17:49:34', '1', NULL, NULL, NULL);
INSERT INTO `youbang_addresslist` VALUES (149, 'infos', NULL, 17, 287, 1979, '脾 遥舶从人2人人', '2019-08-15 17:50:28', '1', NULL, NULL, NULL);
INSERT INTO `youbang_addresslist` VALUES (150, 'infos', NULL, 3, 70, NULL, NULL, '2019-08-16 09:04:36', '1', NULL, NULL, NULL);
INSERT INTO `youbang_addresslist` VALUES (151, 'infos', NULL, 14, 240, NULL, NULL, '2019-08-16 10:32:51', '1', NULL, NULL, NULL);
INSERT INTO `youbang_addresslist` VALUES (152, 'infos', NULL, 5, 125, NULL, NULL, '2019-08-16 15:42:20', '1', NULL, NULL, NULL);
INSERT INTO `youbang_addresslist` VALUES (153, 'infos', NULL, 16, 264, NULL, NULL, '2019-08-16 15:46:02', '1', NULL, NULL, NULL);
INSERT INTO `youbang_addresslist` VALUES (154, '', NULL, 16, 269, 1817, NULL, '2019-08-16 15:50:51', '1', NULL, NULL, NULL);
INSERT INTO `youbang_addresslist` VALUES (155, '', NULL, 11, 202, 1281, '345圧4夺要', '2019-08-16 16:22:51', '1', NULL, NULL, NULL);
INSERT INTO `youbang_addresslist` VALUES (156, 'infos', NULL, 18, 290, NULL, NULL, '2019-08-19 09:19:33', '1', NULL, NULL, NULL);
INSERT INTO `youbang_addresslist` VALUES (157, 'infos', NULL, 15, 253, 1683, '基材顶替顶替', '2019-08-19 09:20:26', '1', NULL, NULL, NULL);
INSERT INTO `youbang_addresslist` VALUES (158, 'infos', NULL, 3, 70, NULL, NULL, '2019-08-19 10:38:00', '1', NULL, NULL, NULL);
INSERT INTO `youbang_addresslist` VALUES (159, '', NULL, 14, 243, 1593, NULL, '2019-08-19 14:21:45', '1', NULL, NULL, NULL);
INSERT INTO `youbang_addresslist` VALUES (160, 'infos', NULL, 5, 130, NULL, NULL, '2019-08-22 13:01:02', '1', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for youbang_arcatt
-- ----------------------------
DROP TABLE IF EXISTS `youbang_arcatt`;
CREATE TABLE `youbang_arcatt`  (
  `sortid` smallint(6) NOT NULL DEFAULT 0,
  `att` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `attname` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`att`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of youbang_arcatt
-- ----------------------------
INSERT INTO `youbang_arcatt` VALUES (5, 's', '滚动');
INSERT INTO `youbang_arcatt` VALUES (1, 'h', '头条');
INSERT INTO `youbang_arcatt` VALUES (3, 'f', '幻灯');
INSERT INTO `youbang_arcatt` VALUES (2, 'c', '推荐');
INSERT INTO `youbang_arcatt` VALUES (7, 'p', '图片');
INSERT INTO `youbang_arcatt` VALUES (8, 'j', '跳转');
INSERT INTO `youbang_arcatt` VALUES (4, 'a', '特荐');
INSERT INTO `youbang_arcatt` VALUES (6, 'b', '加粗');

-- ----------------------------
-- Table structure for youbang_arcclass
-- ----------------------------
DROP TABLE IF EXISTS `youbang_arcclass`;
CREATE TABLE `youbang_arcclass`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `comtag` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '组件id',
  `macid` int(11) NULL DEFAULT NULL COMMENT '商家id，适用于商城',
  `enable` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '0停用1启用',
  `isdel` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '0没有删除1已经删除',
  `classify` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 67 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of youbang_arcclass
-- ----------------------------
INSERT INTO `youbang_arcclass` VALUES (65, 'jobwanted', 1, '1', '0', 'JTVCJTdCJTIydmFsJTIyOiUyMmNsYXNzaWZ5XzE1NjQ5OTc4NDg4NzAwJTIyLCUyMm5hbWUlMjI6JTIyJUU2JUIxJTgyJUU4JTgxJThDJUU4JTgwJTg1JUU1JUFEJUE2JUU1JThFJTg2JTIyLCUyMmNoaWxkcmVuJTIyOiU1QiU3QiUyMnZhbCUyMjolMjJjbGFzc2lmeV8xNTY0OTk4MzEwNTg3JTIyLCUyMm5hbWUlMjI6JTIyJUU1JTg4JTlEJUU0JUI4JUFEJTIyJTdELCU3QiUyMnZhbCUyMjolMjJjbGFzc2lmeV8xNTY0OTk4MzIwMjI3JTIyLCUyMm5hbWUlMjI6JTIyJUU5JUFCJTk4JUU0JUI4JUFEJTIyJTdELCU3QiUyMnZhbCUyMjolMjJjbGFzc2lmeV8xNTY0OTk4MzI4NjQwJTIyLCUyMm5hbWUlMjI6JTIyJUU0JUI4JUFEJUU0JUI4JTkzJTIyJTdELCU3QiUyMnZhbCUyMjolMjJjbGFzc2lmeV8xNTY0OTk4MzM2NzU5JTIyLCUyMm5hbWUlMjI6JTIyJUU1JUE0JUE3JUU0JUI4JTkzJTIyJTdELCU3QiUyMnZhbCUyMjolMjJjbGFzc2lmeV8xNTY0OTk4MzQ2MzE0JTIyLCUyMm5hbWUlMjI6JTIyJUU2JTlDJUFDJUU3JUE3JTkxJTIyJTdELCU3QiUyMnZhbCUyMjolMjJjbGFzc2lmeV8xNTY0OTk4MzU2MTcwJTIyLCUyMm5hbWUlMjI6JTIyJUU3JUExJTk1JUU1JUEzJUFCJTIyJTdELCU3QiUyMnZhbCUyMjolMjJjbGFzc2lmeV8xNTY0OTk4MzY1NjE0JTIyLCUyMm5hbWUlMjI6JTIyJUU1JThEJTlBJUU1JUEzJUFCJTIyJTdEJTVEJTdELCU3QiUyMnZhbCUyMjolMjJjbGFzc2lmeV8xNTY1MTU5NjA5MDExMSUyMiwlMjJuYW1lJTIyOiUyMiVFNiVCMSU4MiVFOCU4MSU4QyVFOCU4MCU4NSVFNyVCQiU4RiVFOSVBQSU4QyUyMiwlMjJjaGlsZHJlbiUyMjolNUIlN0IlMjJ2YWwlMjI6JTIyY2xhc3NpZnlfMTU2NTE1OTYyMzk4MyUyMiwlMjJuYW1lJTIyOiUyMjElRTUlQjklQjQlRTQlQkIlQTUlRTQlQjglOEIlMjIlN0QsJTdCJTIydmFsJTIyOiUyMmNsYXNzaWZ5XzE1NjUxNTk2MzU4MDQlMjIsJTIybmFtZSUyMjolMjIxLTMlRTUlQjklQjQlMjIlN0QsJTdCJTIydmFsJTIyOiUyMmNsYXNzaWZ5XzE1NjUxNTk2NDc4NjMlMjIsJTIybmFtZSUyMjolMjIzLTUlRTUlQjklQjQlMjIlN0QsJTdCJTIydmFsJTIyOiUyMmNsYXNzaWZ5XzE1NjUxNTk2NTU0ODMlMjIsJTIybmFtZSUyMjolMjI1LTglRTUlQjklQjQlMjIlN0QsJTdCJTIydmFsJTIyOiUyMmNsYXNzaWZ5XzE1NjUxNTk2NjQxMTMlMjIsJTIybmFtZSUyMjolMjIxMCVFNSVCOSVCNCVFNCVCQiVBNSVFNCVCOCU4QSUyMiU3RCU1RCU3RCwlN0IlMjJ2YWwlMjI6JTIyY2xhc3NpZnlfMTU2NDk5Nzg0ODg3MDIlMjIsJTIybmFtZSUyMjolMjIlRTglODElOEMlRTQlQkQlOEQlRTUlODglODYlRTclQjElQkIlMjIsJTIyY2hpbGRyZW4lMjI6JTVCJTdCJTIydmFsJTIyOiUyMmNsYXNzaWZ5XzE1NjUxNDc3MzY4MjklMjIsJTIybmFtZSUyMjolMjIlRTYlOEElODAlRTYlOUMlQUYlRTUlOTElOTglMjIlN0QsJTdCJTIydmFsJTIyOiUyMmNsYXNzaWZ5XzE1NjUxNDc3NTU5MTAlMjIsJTIybmFtZSUyMjolMjIlRTUlOEElQTklRTclOTAlODYlRTUlQjclQTUlRTclQTglOEIlRTUlQjglODglMjIlN0QsJTdCJTIydmFsJTIyOiUyMmNsYXNzaWZ5XzE1NjUxNDc3NzI3NzklMjIsJTIybmFtZSUyMjolMjIlRTUlQjclQTUlRTclQTglOEIlRTUlQjglODglMjIlN0QsJTdCJTIydmFsJTIyOiUyMmNsYXNzaWZ5XzE1NjUxNDc3Nzg4NTElMjIsJTIybmFtZSUyMjolMjIlRTQlQjglOTMlRTUlQUUlQjYlMjIlN0QsJTdCJTIydmFsJTIyOiUyMmNsYXNzaWZ5XzE1NjUxNDc3OTY0MTklMjIsJTIybmFtZSUyMjolMjIlRTklQUIlOTglRTUlQjclQTUlMjIlN0QlNUQlN0QsJTdCJTIydmFsJTIyOiUyMmNsYXNzaWZ5XzE1NjQ5OTc4NDg4NzAzJTIyLCUyMm5hbWUlMjI6JTIyJUU2JTlDJTlGJUU2JTlDJTlCJUU4JTk2JUFBJUU4JUI1JTg0JTIyLCUyMmNoaWxkcmVuJTIyOiU1QiU3QiUyMnZhbCUyMjolMjJjbGFzc2lmeV8xNTY1MDU1MDU2MjEwJTIyLCUyMm5hbWUlMjI6JTIyJUU5JTlEJUEyJUU4JUFFJUFFJTIyJTdELCU3QiUyMnZhbCUyMjolMjJjbGFzc2lmeV8xNTY1MDU1MDkxNjEzJTIyLCUyMm5hbWUlMjI6JTIyMTAwMC0zMDAwLyVFNiU5QyU4OCUyMiU3RCwlN0IlMjJ2YWwlMjI6JTIyY2xhc3NpZnlfMTU2NTA1NTE0NTczNCUyMiwlMjJuYW1lJTIyOiUyMjMwMDAtNTAwMC8lRTYlOUMlODglMjIlN0QsJTdCJTIydmFsJTIyOiUyMmNsYXNzaWZ5XzE1NjUwNTUxNTk5MCUyMiwlMjJuYW1lJTIyOiUyMjUwMDAtODAwMC8lRTYlOUMlODglMjIlN0QsJTdCJTIydmFsJTIyOiUyMmNsYXNzaWZ5XzE1NjUwNTUyMDc2MjQlMjIsJTIybmFtZSUyMjolMjI4MDAwLTEwMDAwLyVFNiU5QyU4OCUyMiU3RCU1RCU3RCwlN0IlMjJ2YWwlMjI6JTIyY2xhc3NpZnlfMTU2NTA3MjAyNDAxMTQlMjIsJTIybmFtZSUyMjolMjIlRTQlQkIlOEUlRTQlQkElOEIlRTglQTElOEMlRTQlQjglOUElMjIsJTIyY2hpbGRyZW4lMjI6JTVCJTdCJTIydmFsJTIyOiUyMmNsYXNzaWZ5XzE1NjUwNzIwMzE3NDclMjIsJTIybmFtZSUyMjolMjIlRTYlODglQkYlRTUlQkIlQkElMjIlN0QsJTdCJTIydmFsJTIyOiUyMmNsYXNzaWZ5XzE1NjUwNzIwNDI2MDIlMjIsJTIybmFtZSUyMjolMjIlRTUlQjglODIlRTYlOTQlQkYlMjIlN0QsJTdCJTIydmFsJTIyOiUyMmNsYXNzaWZ5XzE1NjUwNzIwNTA0NjglMjIsJTIybmFtZSUyMjolMjIlRTYlQjAlQjQlRTUlODglQTklMjIlN0QsJTdCJTIydmFsJTIyOiUyMmNsYXNzaWZ5XzE1NjUwNzIwNjczNTclMjIsJTIybmFtZSUyMjolMjIlRTUlODUlQUMlRTglQjclQUYlMjIlN0QsJTdCJTIydmFsJTIyOiUyMmNsYXNzaWZ5XzE1NjUwNzIwNzg1MzMlMjIsJTIybmFtZSUyMjolMjIlRTclOTQlQjUlRTUlOEElOUIlMjIlN0QsJTdCJTIydmFsJTIyOiUyMmNsYXNzaWZ5XzE1NjUwNzIwODg0NjElMjIsJTIybmFtZSUyMjolMjIlRTYlQTElQTUlRTYlQTIlODElMjIlN0QsJTdCJTIydmFsJTIyOiUyMmNsYXNzaWZ5XzE1NjUwNzIwOTUxODklMjIsJTIybmFtZSUyMjolMjIlRTklOUElQTclRTklODElOTMlMjIlN0QsJTdCJTIydmFsJTIyOiUyMmNsYXNzaWZ5XzE1NjUwNzIxMDgxNDQlMjIsJTIybmFtZSUyMjolMjIlRTYlQjYlODglRTklOTglQjIlMjIlN0QsJTdCJTIydmFsJTIyOiUyMmNsYXNzaWZ5XzE1NjUwNzIxMTQyNjQlMjIsJTIybmFtZSUyMjolMjIlRTclOTQlQjUlRTUlQUQlOTAlRTclQTclOTElRTYlOEElODAlMjIlN0QlNUQlN0QsJTdCJTIydmFsJTIyOiUyMmNsYXNzaWZ5XzE1NjUwNzIwMjQwMTE1JTIyLCUyMm5hbWUlMjI6JTIyJUU1JUI3JUE1JUU0JUJEJTlDJUU2JTgwJUE3JUU4JUI0JUE4JTIyJTdEJTVE');
INSERT INTO `youbang_arcclass` VALUES (34, 'infos', 1, '1', '0', 'JTVCJTdCJTIydmFsJTIyOiUyMmNsYXNzaWZ5XzE1NjIzMTAwNjUwODYlMjIsJTIybmFtZSUyMjolMjIlRTUlQjclQTUlRTclQTglOEIlRTQlQkYlQTElRTYlODElQUYlRTUlODglODYlRTclQjElQkIlMjIsJTIyY2hpbGRyZW4lMjI6JTVCJTdCJTIydmFsJTIyOiUyMmNsYXNzaWZ5XzE1NjIzMTAwOTExMTAlMjIsJTIybmFtZSUyMjolMjIlRTQlQjglQUQlRTYlQTAlODclMjIlN0QsJTdCJTIydmFsJTIyOiUyMmNsYXNzaWZ5XzE1NjIzMTAwOTkzOTElMjIsJTIybmFtZSUyMjolMjIlRTYlOEIlOUIlRTYlQTAlODclMjIlN0QsJTdCJTIydmFsJTIyOiUyMmNsYXNzaWZ5XzE1NjQzNjYwNzEzMTMlMjIsJTIybmFtZSUyMjolMjIlRTUlOUMlQTglRTclOTAlODYlMjIlN0QlNUQlN0QlNUQ=');
INSERT INTO `youbang_arcclass` VALUES (35, 'commodities', 1, '1', '0', 'JTVCJTdCJTIydmFsJTIyOiUyMmNsYXNzaWZ5XzE1NjIzMTAwNjUwODYlMjIsJTIybmFtZSUyMjolMjIlRTUlOTUlODYlRTUlOTMlODElRTUlODglODYlRTclQjElQkIlMjIsJTIyY2hpbGRyZW4lMjI6JTVCJTdCJTIydmFsJTIyOiUyMmNsYXNzaWZ5XzE1NjIzMTAwOTExMTAlMjIsJTIybmFtZSUyMjolMjIlRTYlQjQlODElRTUlODUlQjclMjIlN0QsJTdCJTIydmFsJTIyOiUyMmNsYXNzaWZ5XzE1NjIzMTAwOTkzOTElMjIsJTIybmFtZSUyMjolMjIlRTklOTklQjYlRTclOTMlQjclMjIlN0QsJTdCJTIydmFsJTIyOiUyMmNsYXNzaWZ5XzE1NjQzNjYwNzEzMTMlMjIsJTIybmFtZSUyMjolMjIlRTclQkIlOTMlRTYlOUUlODQlRTYlOUQlOTAlRTYlOTYlOTklMjIsJTIyY2hpbGRyZW4lMjI6JTVCJTdCJTIydmFsJTIyOiUyMmNsYXNzaWZ5XzE1NjQ2NDIxNTA0NjklMjIsJTIybmFtZSUyMjolMjIlRTclQTAlODIlRTclOUYlQjMlMjIsJTIyY2hpbGRyZW4lMjI6JTVCJTdCJTIydmFsJTIyOiUyMmNsYXNzaWZ5XzE1NjQ2NDIxNjAyMDUlMjIsJTIybmFtZSUyMjolMjIlRTclQkIlODYlRTclQTAlODIlMjIlN0QsJTdCJTIydmFsJTIyOiUyMmNsYXNzaWZ5XzE1NjQ2NDIxNzMwNjklMjIsJTIybmFtZSUyMjolMjIlRTclQTIlOEUlRTclOUYlQjMlMjIlN0QlNUQlN0QlNUQlN0QsJTdCJTIydmFsJTIyOiUyMmNsYXNzaWZ5XzE1NjQ2NDAxMzI0OTElMjIsJTIybmFtZSUyMjolMjIlRTYlQjYlODIlRTglODMlQjYlMjIlN0QsJTdCJTIydmFsJTIyOiUyMmNsYXNzaWZ5XzE1NjQ2NDAxNDA2NTklMjIsJTIybmFtZSUyMjolMjIlRTUlOEUlQTglRTUlODUlQjclMjIlN0QsJTdCJTIydmFsJTIyOiUyMmNsYXNzaWZ5XzE1NjQ2NDAxNDgyODMlMjIsJTIybmFtZSUyMjolMjIlRTklOTclQTglRTclQUElOTclMjIlN0QsJTdCJTIydmFsJTIyOiUyMmNsYXNzaWZ5XzE1NjQ2NDAxNTU4NzUlMjIsJTIybmFtZSUyMjolMjIlRTclOTMlQjclRTclQTAlOTYlMjIlN0QsJTdCJTIydmFsJTIyOiUyMmNsYXNzaWZ5XzE1NjQ2NDAxNzA4OTAlMjIsJTIybmFtZSUyMjolMjIlRTklOTIlQTIlRTYlOUQlOTAlMjIlN0QsJTdCJTIydmFsJTIyOiUyMmNsYXNzaWZ5XzE1NjQ2NDAxOTI4MDQlMjIsJTIybmFtZSUyMjolMjIlRTUlQkIlQkElRTYlOUQlOTAlMjIsJTIyY2hpbGRyZW4lMjI6JTVCJTdCJTIydmFsJTIyOiUyMmNsYXNzaWZ5XzE1NjQ2NDAxOTg5MzIlMjIsJTIybmFtZSUyMjolMjIlRTQlQkElOTQlRTklODclOTElRTklODUlOEQlRTQlQkIlQjYlMjIsJTIyY2hpbGRyZW4lMjI6JTVCJTdCJTIydmFsJTIyOiUyMmNsYXNzaWZ5XzE1NjQ2NDA0MTY5MDElMjIsJTIybmFtZSUyMjolMjIlRTUlODUlQjYlRTQlQkIlOTYlRTQlQkElOTQlRTklODclOTElMjIlN0QsJTdCJTIydmFsJTIyOiUyMmNsYXNzaWZ5XzE1NjQ2NDA0MzAwMzYlMjIsJTIybmFtZSUyMjolMjIlRTUlQUUlQjYlRTUlODUlQjclRTQlQkElOTQlRTklODclOTElMjIlN0QsJTdCJTIydmFsJTIyOiUyMmNsYXNzaWZ5XzE1NjQ2NDA0NDE5MzIlMjIsJTIybmFtZSUyMjolMjIlRTclQUElOTclRTUlQjglOTglRTklODUlOEQlRTQlQkIlQjYlMjIlN0QlNUQlN0QsJTdCJTIydmFsJTIyOiUyMmNsYXNzaWZ5XzE1NjQ2NDAzMDU3NDglMjIsJTIybmFtZSUyMjolMjIlRTUlQUUlQjYlRTglQTMlODUlRTQlQjglQkIlRTYlOUQlOTAlMjIsJTIyY2hpbGRyZW4lMjI6JTVCJTdCJTIydmFsJTIyOiUyMmNsYXNzaWZ5XzE1NjQ2NDAyMTkyOTklMjIsJTIybmFtZSUyMjolMjIlRTklOUIlODYlRTYlODglOTAlRTUlOTAlOEElRTklQTElQjYlMjIlN0QsJTdCJTIydmFsJTIyOiUyMmNsYXNzaWZ5XzE1NjQ2NDAyMzAxMDclMjIsJTIybmFtZSUyMjolMjIlRTclOEUlQkIlRTclOTIlODMlRTglODMlQjYlMjIlN0QsJTdCJTIydmFsJTIyOiUyMmNsYXNzaWZ5XzE1NjQ2NDAyODIwNTklMjIsJTIybmFtZSUyMjolMjJwdmMlRTUlQTIlOTklRTclQkElQjglMjIlN0QsJTdCJTIydmFsJTIyOiUyMmNsYXNzaWZ5XzE1NjQ2NDAyNjY1OTYlMjIsJTIybmFtZSUyMjolMjIlRTglQTMlODUlRTklQTUlQjAlRTclQkElQkYlRTYlOUQlQkYlMjIlN0QsJTdCJTIydmFsJTIyOiUyMmNsYXNzaWZ5XzE1NjQ2NDAxOTg5MzIlMjIsJTIybmFtZSUyMjolMjIlRTQlQkElOTQlRTklODclOTElRTklODUlOEQlRTQlQkIlQjYlMjIlN0QlNUQlN0QlNUQlN0QlNUQlN0QlNUQ=');
INSERT INTO `youbang_arcclass` VALUES (66, 'perrecruit', 1, '1', '0', 'JTVCJTdCJTIydmFsJTIyOiUyMmNsYXNzaWZ5XzE1NjYxODExNDM3MzIwJTIyLCUyMm5hbWUlMjI6JTIyJUU2JThCJTlCJUU4JTgxJTk4JUU3JUIxJUJCJUU1JTlFJThCJTIyLCUyMmNoaWxkcmVuJTIyOiU1QiU3QiUyMnZhbCUyMjolMjJjbGFzc2lmeV8xNTY2MTgxMTQ2NjIyJTIyLCUyMm5hbWUlMjI6JTIyJUU2JThCJTlCJUU4JTgxJTk4JUU3JUIxJUJCJUU1JTlFJThCMSUyMiU3RCwlN0IlMjJ2YWwlMjI6JTIyY2xhc3NpZnlfMTU2NjE4MTE1NTU2NCUyMiwlMjJuYW1lJTIyOiUyMiVFNiU4QiU5QiVFOCU4MSU5OCVFNyVCMSVCQiVFNSU5RSU4QjIlMjIlN0QlNUQlN0QsJTdCJTIydmFsJTIyOiUyMmNsYXNzaWZ5XzE1NjYxODExNDM3MzIxJTIyLCUyMm5hbWUlMjI6JTIyJUU4JTk2JUFBJUU4JUI1JTg0JUU1JTg4JTg2JUU3JUIxJUJCJTIyLCUyMmNoaWxkcmVuJTIyOiU1QiU3QiUyMnZhbCUyMjolMjJjbGFzc2lmeV8xNTY2MTgxMTYxMjQ5JTIyLCUyMm5hbWUlMjI6JTIyJUU4JTk2JUFBJUU4JUI1JTg0JUU1JTg4JTg2JUU3JUIxJUJCMSUyMiU3RCwlN0IlMjJ2YWwlMjI6JTIyY2xhc3NpZnlfMTU2NjE4MTE2NjI1JTIyLCUyMm5hbWUlMjI6JTIyJUU4JUE3JTg0JUU2JUEwJUJDJUU1JTkwJThEJUU3JUE3JUIwMiUyMiU3RCU1RCU3RCwlN0IlMjJ2YWwlMjI6JTIyY2xhc3NpZnlfMTU2NjE4MTE0MzczMjIlMjIsJTIybmFtZSUyMjolMjIlRTUlQUQlQTYlRTUlOEUlODYlRTUlODglODYlRTclQjElQkIlMjIsJTIyY2hpbGRyZW4lMjI6JTVCJTdCJTIydmFsJTIyOiUyMmNsYXNzaWZ5XzE1NjYxODExNzI2ODMlMjIsJTIybmFtZSUyMjolMjIlRTUlQUQlQTYlRTUlOEUlODYlRTUlODglODYlRTclQjElQkIxJTIyJTdELCU3QiUyMnZhbCUyMjolMjJjbGFzc2lmeV8xNTY2MTgxMTc2ODklMjIsJTIybmFtZSUyMjolMjIlRTglQTclODQlRTYlQTAlQkMlRTUlOTAlOEQlRTclQTclQjAyJTIyJTdEJTVEJTdEJTVE');

-- ----------------------------
-- Table structure for youbang_archives
-- ----------------------------
DROP TABLE IF EXISTS `youbang_archives`;
CREATE TABLE `youbang_archives`  (
  `id` bigint(13) UNSIGNED NOT NULL AUTO_INCREMENT,
  `typeid` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '栏目id',
  `parenttypeid2` varchar(90) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '上级栏目id',
  `sortrank` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `flag` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '展示位置标识',
  `ismake` smallint(6) NOT NULL DEFAULT 0,
  `component` smallint(6) NOT NULL DEFAULT 1 COMMENT '组件id（应用id）',
  `arcrank` smallint(6) NOT NULL DEFAULT 0 COMMENT '排序',
  `click` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '浏览量',
  `money` smallint(6) NOT NULL DEFAULT 0,
  `title` char(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `shorttitle` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '短标题',
  `color` char(7) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `writer` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '拥有者',
  `source` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `litpic` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '缩略图',
  `pubdate` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `senddate` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '发布时间',
  `mid` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '会员id',
  `keywords` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `lastpost` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `scores` mediumint(8) NOT NULL DEFAULT 0,
  `goodpost` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `badpost` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `voteid` mediumint(8) NOT NULL,
  `notpost` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '简介（概述）',
  `filename` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `dutyadmin` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `tackid` int(10) NOT NULL DEFAULT 0,
  `mtype` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `weight` int(10) NOT NULL DEFAULT 0,
  `classify` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类标识',
  `addtime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `state` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核状态',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sortrank`(`sortrank`) USING BTREE,
  INDEX `mainindex`(`arcrank`, `typeid`, `component`, `flag`, `mid`) USING BTREE,
  INDEX `lastpost`(`lastpost`, `scores`, `goodpost`, `badpost`, `notpost`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1914 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of youbang_archives
-- ----------------------------
INSERT INTO `youbang_archives` VALUES (202, 31, '0', 0, 'h,c', 0, -8, 0, 0, 0, ' 霜朋有有 有有', ' 压标', '', '', '', 'http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F603932K20-31036_lit.gif', 0, 0, 0, ' 上传图片测试', 0, 0, 0, 0, 0, 0, ' 上传图片测试', '', 0, 0, 0, 0, 'classify_1563245228709', '2019-07-23 10:22:12', NULL);
INSERT INTO `youbang_archives` VALUES (210, 31, '0', 0, 'h,c', 0, -8, 0, 0, 0, ' f', ' d', '', '', '', 'http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F603932K20-31036_lit.gif', 0, 0, 0, ' 3', 0, 0, 0, 0, 0, 0, ' 4', '', 0, 0, 0, 0, 'classify_1563245228709', '2019-07-27 10:22:01', NULL);
INSERT INTO `youbang_archives` VALUES (201, 31, '0', 0, 'h,c', 0, -8, 0, 0, 0, ' 霜朋有有 有有', ' 压标', '', '', '', 'http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F603932K20-31036_lit.gif', 0, 0, 0, ' 上传图片测试', 0, 0, 0, 0, 0, 0, ' 上传图片测试', '', 0, 0, 0, 0, 'classify_1563245228708', '2019-07-30 10:22:17', NULL);
INSERT INTO `youbang_archives` VALUES (200, 31, '0', 0, 'h,c', 0, -8, 0, 0, 0, ' 霜朋有有 有有', ' 压标', '', '', '', 'http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F603932K20-31036_lit.gif', 0, 0, 0, ' 上传图片测试', 0, 0, 0, 0, 0, 0, ' 上传图片测试', '', 0, 0, 0, 0, 'classify_1563245228709', '2019-07-30 10:22:17', NULL);
INSERT INTO `youbang_archives` VALUES (190, 31, '0', 0, 'h,c', 0, -8, 0, 0, 0, ' adsf', ' dfs', '', '', '', 'http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F603932K20-31036_lit.gif', 0, 0, 0, ' dsf', 0, 0, 0, 0, 0, 0, ' df', '', 0, 0, 0, 0, 'classify_1563245228709', '2019-07-27 10:22:01', NULL);
INSERT INTO `youbang_archives` VALUES (187, 33, '0', 0, 'h,c', 0, -8, 0, 0, 0, ' fgdfg', ' fdgd', '', '', '', 'http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F603932K20-31036_lit.gif', 0, 0, 0, ' dfgdf', 0, 0, 0, 0, 0, 0, ' fdgd f', '', 0, 0, 0, 0, 'classify_1563245228709', '2019-07-23 10:22:12', NULL);
INSERT INTO `youbang_archives` VALUES (238, 14, '0', 0, 'hot-home-recomend', 0, 1, 0, 0, 0, ' 验证码设置梵蒂冈第三方', '', '', '', '', '', 0, 0, 1, '', 0, 0, 0, 0, 0, 0, ' 在夺棋 枯', '', 0, 0, 0, 0, 'classify_1562310099391', '2019-08-08 15:28:47', '0');
INSERT INTO `youbang_archives` VALUES (239, 14, '0', 0, 'hot-home-recomend', 0, 1, 0, 0, 0, '789789', ' 地枯', '', '', '', '', 0, 0, 1, ' 时代复分枯枯', 0, 0, 0, 0, 0, 0, ' 上传图片测试', '', 0, 0, 0, 0, 'classify_1564366071313', '2019-08-08 16:08:33', '0');
INSERT INTO `youbang_archives` VALUES (1858, 1, '0', 0, 'h,c', 0, 1, 0, 0, 0, ' 兴义市市政市政照明工程', ' 市政照明工程', '', '', '', '/img/2019/8/12/57e53cfe6354ff1ebb3c4cab67dab395.png', 0, 0, 1, ' 工程信息发布关键词', 0, 0, 0, 0, 0, 0, ' 中国电建河南工程公司华润沧州运东项目部华润沧州运东钢材材料采购项目成交公示', '', 0, 0, 0, 1, 'classify_1562310099391', '2019-08-12 17:06:40', '0');
INSERT INTO `youbang_archives` VALUES (231, 33, '0', 0, '', 0, 1, 0, 0, 0, ' 验证码设置梵蒂冈第三方', ' sdfsdf', '', '', '', '', 0, 0, 1, ' 上传图片测试', 0, 0, 0, 0, 0, 0, ' ', '', 0, 0, 0, 0, 'classify_1564640132491', '2019-08-02 14:55:17', '0');
INSERT INTO `youbang_archives` VALUES (235, 15, '0', 0, 'hot-home-recomend', 0, 1, 0, 0, 0, ' 验证码设置', ' 发布的内容写标题，长度限制15字', '', '', '', '/img/2019/8/6/16840d34bf7d0c2ef280a411d729f463.png', 0, 0, 1, ' 上传图片测试', 0, 0, 0, 0, 0, 0, ' 上传图片测试', '', 0, 0, 0, 0, 'classify_1562310099391', '2019-08-06 16:43:44', '0');
INSERT INTO `youbang_archives` VALUES (211, 31, '0', 0, 'h,c', 0, -8, 0, 0, 0, ' f', ' d', '', '', '', 'http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F603932K20-31036_lit.gif', 0, 0, 0, ' 3', 0, 0, 0, 0, 0, 0, ' 4', '', 0, 0, 0, 0, 'classify_1563245228707', '2019-07-24 10:22:08', NULL);
INSERT INTO `youbang_archives` VALUES (1859, 1, '0', 0, 'h,c', 0, 1, 0, 0, 0, ' 永和县桑壁镇人民政府署益村委南寨村委村级综合活动场所建设项目谈判公告', ' 永和县桑壁镇人民政府署益村委南寨村委村级综合活动场所建设项目谈判公告', '', '', '', '/img/2019/8/13/d100323436304c5e51087726161ef8ce.png', 0, 0, 1, ' 综合活动场所建设项目竞争性谈判公告', 0, 0, 0, 0, 0, 0, ' 永和县桑壁镇人民政府联系方式署益村委南寨村委村级综合活动场所建设项目竞争性谈判公告  永和县政府采购中心联系方式受桑壁镇人民政府委托，对桑壁镇署益村委南寨村委村级综合活动场所建设项目组织竞争性谈判采购，欢迎具有承担本项目能力、资信良好的供应商参加谈判。', '', 0, 0, 0, 2, 'classify_1562310091110', '2019-08-13 09:24:37', '0');
INSERT INTO `youbang_archives` VALUES (1, 2, '0', 1270603757, 'c,h', 1, -8, 0, 0, 0, '学习HTML 4.0事件属性', '', '', 'admin', '', 'http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F603932K20-31036_lit.gif', 1270603757, 1270603757, 1, '学习HTML,4.0事件属性', 0, 0, 0, 0, 0, 0, 'HTML 4.0的新特性之一是使HTML事件触发浏览器中的行为，比方说当用户点击一个HTML元素时启动一段JavaScript。以下就是可被插入HTML标签以定义事件行为的一系列属性。假如你希望学习如何使用这些事件进行编程，那么你应该学习我们的JavaScript教程和DHTML教程', '', 0, 0, 0, 0, NULL, '2019-07-27 10:22:01', NULL);
INSERT INTO `youbang_archives` VALUES (215, 31, '0', 0, 'h,c', 0, 1, 0, 0, 0, ' fg', ' df', '', '', '', 'http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F603932K20-31036_lit.gif', 0, 0, 0, ' 上传图片测试', 0, 0, 0, 0, 0, 0, ' 上传图片测试', '', 0, 0, 0, 0, 'classify_1564642160205', '2019-07-27 10:22:01', NULL);
INSERT INTO `youbang_archives` VALUES (216, 31, '0', 0, 'h,c', 0, 1, 0, 0, 0, ' sd', ' dsf', '', '', '', 'http://www.dedecms.com/demoimg/uploads/allimg/c100407/12F603932K20-31036_lit.gif', 0, 0, 0, ' 1', 0, 0, 0, 0, 0, 0, ' 234', '', 0, 0, 0, 2314, 'classify_1563245228709', '2019-07-24 10:22:08', NULL);
INSERT INTO `youbang_archives` VALUES (217, 31, '0', 0, '', 0, 1, 0, 0, 0, ' dsfsdf', ' sdfsdf', '', '', '', '/img/2019/7/20/78528902594ec2abdb60e42398630e6c.png', 0, 0, 0, ' sadfdsf', 0, 0, 0, 0, 0, 0, ' sdfsdf', '', 0, 0, 0, 0, 'classify_1563245228709', '2019-07-24 10:22:08', NULL);
INSERT INTO `youbang_archives` VALUES (236, 0, '0', 0, 'home-recomend', 0, 1, 0, 0, 0, '触发器测试', ' 发布的内容写标题，长度限制15字', '', '', '', '', 0, 0, 1, ' 脂肪酸', 0, 0, 0, 0, 0, 0, ' ', '', 0, 0, 0, 0, 'classify_1564366071313', '2019-08-08 15:16:07', '0');
INSERT INTO `youbang_archives` VALUES (237, 12, '0', 0, 'home', 0, 1, 0, 0, 0, ' 验证码设置', ' 发布的内容写标题，长度限制15字', '', '', '', '', 0, 0, 1, '', 0, 0, 0, 0, 0, 0, ' 在夺棋 枯', '', 0, 0, 0, 0, 'classify_1564366071313', '2019-08-08 15:24:30', '0');
INSERT INTO `youbang_archives` VALUES (1860, 1, '0', 0, 'h,c', 0, 1, 0, 0, 0, ' 永和县桑壁镇人民政府署益村委南寨村委村级综合活动场所建设项目谈判公告', ' 永和县桑壁镇人民政府署益村委南寨村委村级综合活动场所建设项目谈判公告', '', '', '', '/img/2019/8/13/d100323436304c5e51087726161ef8ce.png', 0, 0, 1, ' 综合活动场所建设项目竞争性谈判公告', 0, 0, 0, 0, 0, 0, ' 永和县桑壁镇人民政府联系方式署益村委南寨村委村级综合活动场所建设项目竞争性谈判公告  永和县政府采购中心联系方式受桑壁镇人民政府委托，对桑壁镇署益村委南寨村委村级综合活动场所建设项目组织竞争性谈判采购，欢迎具有承担本项目能力、资信良好的供应商参加谈判。', '', 0, 0, 0, 2, 'classify_1562310091110', '2019-08-13 09:24:50', '0');
INSERT INTO `youbang_archives` VALUES (1861, 1, '0', 0, 'h,c', 0, 1, 0, 0, 0, ' 永和县桑壁镇人民政府署益村委南寨村委村级综合活动场所建设项目谈判公告', ' 永和县桑壁镇人民政府署益村委南寨村委村级综合活动场所建设项目谈判公告', '', '', '', '/img/2019/8/13/d100323436304c5e51087726161ef8ce.png', 0, 0, 1, ' 综合活动场所建设项目竞争性谈判公告', 0, 0, 0, 0, 0, 0, ' 永和县桑壁镇人民政府联系方式署益村委南寨村委村级综合活动场所建设项目竞争性谈判公告  永和县政府采购中心联系方式受桑壁镇人民政府委托，对桑壁镇署益村委南寨村委村级综合活动场所建设项目组织竞争性谈判采购，欢迎具有承担本项目能力、资信良好的供应商参加谈判。', '', 0, 0, 0, 2, 'classify_1562310091110', '2019-08-13 09:25:15', '0');
INSERT INTO `youbang_archives` VALUES (1862, 1, '0', 0, 'h,c', 0, 1, 0, 0, 0, ' 永和县桑壁镇人民政府署益村委南寨村委村级综合活动场所建设项目谈判公告', ' 永和县桑壁镇人民政府署益村委南寨村委村级综合活动场所建设项目谈判公告', '', '', '', '/img/2019/8/13/d100323436304c5e51087726161ef8ce.png', 0, 0, 1, ' 综合活动场所建设项目竞争性谈判公告', 0, 0, 0, 0, 0, 0, ' 永和县桑壁镇人民政府联系方式署益村委南寨村委村级综合活动场所建设项目竞争性谈判公告  永和县政府采购中心联系方式受桑壁镇人民政府委托，对桑壁镇署益村委南寨村委村级综合活动场所建设项目组织竞争性谈判采购，欢迎具有承担本项目能力、资信良好的供应商参加谈判。', '', 0, 0, 0, 2, 'classify_1562310091110', '2019-08-13 09:25:34', '0');
INSERT INTO `youbang_archives` VALUES (1863, 1, '0', 0, 'h-c', 0, 1, 0, 0, 0, ' 永和县桑壁镇人民政府署益村委南寨村委村级综合活动场所建设项目谈判公告', ' 永和县桑壁镇人民政府署益村委南寨村委村级综合活动场所建设项目谈判公告', '', '', '', '/img/2019/8/13/d100323436304c5e51087726161ef8ce.png', 0, 0, 1, ' 综合活动场所建设项目竞争性谈判公告', 0, 0, 0, 0, 0, 0, ' 永和县桑壁镇人民政府联系方式署益村委南寨村委村级综合活动场所建设项目竞争性谈判公告  永和县政府采购中心联系方式受桑壁镇人民政府委托，对桑壁镇署益村委南寨村委村级综合活动场所建设项目组织竞争性谈判采购，欢迎具有承担本项目能力、资信良好的供应商参加谈判。', '', 0, 0, 0, 2, 'classify_1562310091110', '2019-08-13 09:25:52', '0');
INSERT INTO `youbang_archives` VALUES (1864, 39, '0', 0, 'c-h-z-r', 0, 1, 0, 0, 0, '0806测试委托招标公告', '0806测试委托招标公告', '', '', '', '/img/2019/8/13/dd9e74b09ab19b327abe087dd9019663.png', 0, 0, 1, '0806测试委托招标公告', 0, 0, 0, 0, 0, 0, '业主委托比比招标采购网为该项目征集供应商。针对符合要求的供应商，我们会将其资料提交给业主方供选择。您可拨打免费客服热线咨询报名事宜400-000-0388', '', 0, 0, 0, 1, 'classify_1564366071313', '2019-08-13 09:30:40', '0');
INSERT INTO `youbang_archives` VALUES (1865, 39, '0', 0, 'h,z', 0, 1, 0, 0, 0, ' 0806测试委托招标公告', ' 0806测试委托招标公告', '', '', '', '/img/2019/8/13/dd9e74b09ab19b327abe087dd9019663.png', 0, 0, 1, ' 0806测试委托招标公告', 0, 0, 0, 0, 0, 0, ' 业主委托比比招标采购网为该项目征集供应商。针对符合要求的供应商，我们会将其资料提交给业主方供选择。您可拨打免费客服热线咨询报名事宜400-000-0388', '', 0, 0, 0, 1, 'classify_1564366071313', '2019-08-13 09:30:40', '0');
INSERT INTO `youbang_archives` VALUES (1866, 1, '0', 0, 'c-h-z-r', 0, 1, 0, 0, 0, '永和县桑壁镇人民政府署益村委南寨村委村级综合活动场所建设项目谈判公告', '0806测试委托招标公告', '', '', '', '/img/2019/8/14/fcef959cf046a2be98cfd131652cdd20.png', 0, 0, 1, '0806测试委托招标公告', 0, 0, 0, 0, 0, 0, '业主委托比比招标采购网为该项目征集供应商。针对符合要求的供应商，我们会将其资料提交给业主方供选择。您可拨打免费客服热线咨询报名事宜400-000-0388', '', 0, 0, 0, 1, 'classify_1564366071313', '2019-08-13 09:30:40', '0');
INSERT INTO `youbang_archives` VALUES (1867, 31, '0', 0, '', 0, 1, 0, 0, 0, ' 商品1名称', '商品1短标题', '', '', '', '/img/2019/8/13/cb6aae1ed81bb3622ed3ebc5c63b4027.png', 0, 0, 1, ' 碎石关键词', 0, 0, 0, 0, 0, 0, ' 碎石描述', '', 0, 0, 0, 100, 'classify_1564642173069', '2019-08-13 17:21:38', '0');
INSERT INTO `youbang_archives` VALUES (1868, 36, '0', 0, '', 0, 1, 0, 0, 0, '求职者1', '求职者1短标题', '', '', '', '', 0, 0, 1, ' 求职者1关键词', 0, 0, 0, 0, 0, 0, ' 求职者1描述', '', 0, 0, 0, 100, 'NaN-0NaN-0NaN NaN:NaN:NaN', '2019-08-13 17:45:48', '0');
INSERT INTO `youbang_archives` VALUES (1869, 33, '0', 0, '', 0, 1, 0, 0, 0, ' F E', ' DF S', '', '', '', '', 0, 0, 1, '', 0, 0, 0, 0, 0, 0, ' ', '', 0, 0, 0, 0, 'classify_1564640155875', '2019-08-14 09:26:30', '0');
INSERT INTO `youbang_archives` VALUES (1873, 36, '0', 0, '', 0, 1, 0, 0, 0, '验证码设置梵蒂冈第三方', '发布的内容写标题，长度限制15字', '', '', '', '', 0, 0, 1, '时代复分枯枯', 0, 0, 0, 0, 0, 0, '上传图片测试', '', 0, 0, 0, 0, 'classify_1565147772779', '2019-08-17 09:59:10', '0');
INSERT INTO `youbang_archives` VALUES (1870, 38, '0', 0, 'z-r', 0, 1, 0, 0, 0, '15985499999', '发布的内容写标题，长度限制15字', '', '', '', '/img/2019/8/14/3dd254cd118371209ed8fec5c2f41b0a.png', 0, 0, 1, '时代复分枯枯', 0, 0, 0, 0, 0, 0, '蜕入入教条 视如粪土', '', 0, 0, 0, 0, 'classify_1562310099391', '2019-08-14 12:47:53', '2');
INSERT INTO `youbang_archives` VALUES (1871, 39, '0', 0, 'z', 0, 1, 0, 0, 0, '验证码设置梵蒂冈第三方', 'sdfsdf', '', '', '', '', 0, 0, 1, '上传图片测试', 0, 0, 0, 0, 0, 0, '上传图片测试', '', 0, 0, 0, 0, 'classify_1562310099391', '2019-08-16 09:04:44', '1');
INSERT INTO `youbang_archives` VALUES (1879, 36, '0', 0, '', 0, 1, 0, 0, 0, '验证码设置梵蒂冈第三方', 'sdfsdf', '', '', '', '', 0, 0, 1, '上传图片测试', 0, 0, 0, 0, 0, 0, '上传图片测试', '', 0, 0, 0, 0, 'classify_1565147772779', '2019-08-17 11:20:23', '0');
INSERT INTO `youbang_archives` VALUES (1880, 36, '0', 0, '', 0, 1, 0, 0, 0, '验证码设置梵蒂冈第三方', 'sdfsdf', '', '', '', '', 0, 0, 1, '上传图片测试', 0, 0, 0, 0, 0, 0, '上传图片测试', '', 0, 0, 0, 0, 'classify_1565147772779', '2019-08-17 11:21:44', '0');
INSERT INTO `youbang_archives` VALUES (1881, 36, '0', 0, '', 0, 1, 0, 0, 0, '验证码设置梵蒂冈第三方', 'sdfsdf', '', '', '', '', 0, 0, 1, '', 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 'classify_1565147772779', '2019-08-17 11:23:50', '0');
INSERT INTO `youbang_archives` VALUES (1886, 36, '0', 0, '', 0, 1, 0, 0, 0, '验证码设置梵蒂冈第三方', 'sdfsdf', '', '', '', '', 0, 0, 1, '上传图片测试', 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 'classify_1565147772779', '2019-08-17 11:36:02', '0');
INSERT INTO `youbang_archives` VALUES (1889, 36, '0', 0, '', 0, 1, 0, 0, 0, '验证码设置', 'sdfsdf', '', '', '', '', 0, 0, 1, '上传图片测试', 0, 0, 0, 0, 0, 0, '上传图片测试', '', 0, 0, 0, 0, 'classify_1565147778851', '2019-08-17 14:00:28', '0');
INSERT INTO `youbang_archives` VALUES (1890, 36, '0', 0, '', 0, 1, 0, 0, 0, '验证码设置', 'sdfsdf', '', '', '', '', 0, 0, 1, '上传图片测试', 0, 0, 0, 0, 0, 0, '上传图片测试', '', 0, 0, 0, 0, 'classify_1565147778851', '2019-08-17 14:02:04', '0');
INSERT INTO `youbang_archives` VALUES (1913, 56, '0', 0, 'h-z', 0, 1, 0, 0, 0, 'er梵蒂冈第三方', 'ew bw', '', '', '', '', 0, 0, 1, '时代复分枯枯', 0, 0, 0, 0, 0, 0, '上传图片测试', '', 0, 0, 0, 0, 'classify_1562310099391', '2019-08-22 13:01:10', '1');
INSERT INTO `youbang_archives` VALUES (1908, 33, '0', 0, '', 0, 1, 0, 0, 0, '可爱小层', '小毕业那天在缀', '', '', '', '/img/2019/8/21/a94ce8c109f3334d7b5fb96a1b67a7ef.png', 0, 0, 1, '正是', 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 'classify_1564640198932', '2019-08-21 08:38:29', '0');
INSERT INTO `youbang_archives` VALUES (1897, 40, '0', 0, '', 0, 1, 0, 0, 0, '验证码设置梵蒂冈第三方', '顶戴', '', '', '', '', 0, 0, 1, '上传图片测试', 0, 0, 0, 0, 0, 0, 'NaN-0NaN-0NaN NaN:NaN:NaN', '', 0, 0, 0, 0, 'classify_1566181155564', '2019-08-19 10:24:39', '0');
INSERT INTO `youbang_archives` VALUES (1899, 12, '0', 0, '', 0, 1, 0, 0, 0, '验证码设置梵蒂冈第三方', 'sdfsdf', '', '', '', '', 0, 0, 1, '上传图片测试', 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 'classify_1562310099391', '2019-08-19 10:35:53', '0');
INSERT INTO `youbang_archives` VALUES (1900, 12, '0', 0, '', 0, 1, 0, 0, 0, '验证码设置梵蒂冈第三方', 'sdfsdf', '', '', '', '', 0, 0, 1, '上传图片测试', 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 'classify_1564366071313', '2019-08-19 10:35:55', '0');
INSERT INTO `youbang_archives` VALUES (1901, 32, '0', 0, 'h-z', 0, 1, 0, 0, 0, '789879', 'sdfsdf', '', '', '', '', 0, 0, 1, '上传图片测试', 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, '4', '2019-08-19 10:36:24', '0');
INSERT INTO `youbang_archives` VALUES (1903, 41, '0', 0, '', 0, 1, 0, 0, 0, '验证码设8496', 'sdfsdf', '', '', '', '', 0, 0, 1, '', 0, 0, 0, 0, 0, 0, 'NaN-0NaN-0NaN NaN:NaN:NaN', '', 0, 0, 0, 0, 'classify_1566181155564', '2019-08-19 10:43:49', '0');
INSERT INTO `youbang_archives` VALUES (1909, 33, '0', 0, '', 0, 1, 0, 0, 0, '蜀犬吠日发', '桂林夺', '', '', '', '/img/2019/8/21/de55afdbb342d0e3e6b34cc5522c054e.png', 0, 0, 1, '上传图片测试', 0, 0, 0, 0, 0, 0, '上传图片测试', '', 0, 0, 0, 0, 'classify_1564642160205', '2019-08-21 10:03:22', '0');

-- ----------------------------
-- Table structure for youbang_arctype
-- ----------------------------
DROP TABLE IF EXISTS `youbang_arctype`;
CREATE TABLE `youbang_arctype`  (
  `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `componentid` smallint(5) NOT NULL DEFAULT 0,
  `topid` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `sortrank` smallint(5) UNSIGNED NOT NULL DEFAULT 50,
  `typename` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `isdefault` smallint(6) NOT NULL DEFAULT 0,
  `issend` smallint(6) NOT NULL DEFAULT 0,
  `comtype` smallint(6) NULL DEFAULT 1,
  `maxpage` smallint(6) NOT NULL DEFAULT -1,
  `ispart` smallint(6) NOT NULL DEFAULT 0,
  `corank` smallint(6) NOT NULL DEFAULT 0,
  `modname` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `description` char(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `keywords` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `seotitle` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `moresite` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `sitepath` char(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `siteurl` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `ishidden` smallint(6) NOT NULL DEFAULT 0 COMMENT '隐藏栏目0表示隐藏，1表示显示',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sortrank`(`sortrank`) USING BTREE,
  INDEX `reid`(`componentid`, `isdefault`, `comtype`, `ispart`, `corank`, `topid`, `ishidden`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 58 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of youbang_arctype
-- ----------------------------
INSERT INTO `youbang_arctype` VALUES (36, 11, 0, 50, '找工作', 0, 0, 1, 2, 0, 0, '', '找工作', '找工作', '找工作', 0, '', '', 0);
INSERT INTO `youbang_arctype` VALUES (34, 1, 31, 50, '顶替顶替还挺热ty6间', 0, 0, 1, 1, 0, 0, '', '', ' ', ' 震天', 0, '', '', 0);
INSERT INTO `youbang_arctype` VALUES (33, 1, 31, 50, '快乐童年', 0, 0, 1, 1, 0, 0, '', '', ' ', ' ', 0, '', '', 0);
INSERT INTO `youbang_arctype` VALUES (31, 1, 1, 50, '我的店铺', 0, 0, 1, 1, 0, 1, '', '夺sa', '', '21 顶替', 0, '枯厅地', '', 0);
INSERT INTO `youbang_arctype` VALUES (30, 0, 0, 50, ' 颠倒梦魂 仍', 0, 0, 1, 1, 0, 0, '', '', '  顶替大哥大', ' 桂林fsdf', 0, '', '', 0);
INSERT INTO `youbang_arctype` VALUES (29, 0, 0, 50, ' 我的店铺', 0, 0, 1, 1, 0, 0, '', '', ' ', ' 我的店铺', 0, '', '', 0);
INSERT INTO `youbang_arctype` VALUES (54, 11, 36, 50, '45sdf6gs5df', 0, 0, 1, 1, 0, 0, '', '', '', '', 0, '', '', 0);
INSERT INTO `youbang_arctype` VALUES (56, -8, 1, 50, '夺压下压下', 0, 0, 1, 1, 0, 0, '', '在夺棋 枯', '', '', 0, '', '', 0);
INSERT INTO `youbang_arctype` VALUES (57, -8, 52, 50, 'adsfs  顶替棋', 0, 0, 1, 1, 0, 0, '', '', '坧压下夺冰灯fxki75t6456', '', 0, '压下杜威 dsf', '', 0);
INSERT INTO `youbang_arctype` VALUES (52, -8, 1, 50, '中标公告', 0, 0, 1, 1, 0, 0, '', '', '3管【城基材非机动车一要夺', '', 0, '', '', 1);
INSERT INTO `youbang_arctype` VALUES (40, 12, 0, 50, '常规招聘', 0, 0, 1, 100, 0, 0, '', '', '', '21 顶替', 0, '', '', 0);
INSERT INTO `youbang_arctype` VALUES (41, 12, 0, 50, '特招', 0, 0, 1, 234, 0, 0, '', '', '', '21 顶替', 0, '', '', 0);

-- ----------------------------
-- Table structure for youbang_commidity_spec
-- ----------------------------
DROP TABLE IF EXISTS `youbang_commidity_spec`;
CREATE TABLE `youbang_commidity_spec`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commodityid` int(11) NULL DEFAULT 0 COMMENT '商品ID',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '标题',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_goodsid`(`commodityid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2024 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of youbang_commidity_spec
-- ----------------------------
INSERT INTO `youbang_commidity_spec` VALUES (1942, 204, '规格名称');
INSERT INTO `youbang_commidity_spec` VALUES (1943, 204, '规格名称');
INSERT INTO `youbang_commidity_spec` VALUES (1944, 205, '规格名称1');
INSERT INTO `youbang_commidity_spec` VALUES (1945, 205, '规格名称2');
INSERT INTO `youbang_commidity_spec` VALUES (1946, 206, '规格名称');
INSERT INTO `youbang_commidity_spec` VALUES (1947, 207, '规格名称');
INSERT INTO `youbang_commidity_spec` VALUES (1948, 208, '规格名称');
INSERT INTO `youbang_commidity_spec` VALUES (1949, 209, '规格名称1');
INSERT INTO `youbang_commidity_spec` VALUES (1950, 209, '规格名称2');
INSERT INTO `youbang_commidity_spec` VALUES (1951, 212, '规格名称');
INSERT INTO `youbang_commidity_spec` VALUES (1952, 213, '规格名称1');
INSERT INTO `youbang_commidity_spec` VALUES (1953, 213, '规格名称2');
INSERT INTO `youbang_commidity_spec` VALUES (1954, 214, '规格名称1');
INSERT INTO `youbang_commidity_spec` VALUES (1955, 214, '规格名称2');
INSERT INTO `youbang_commidity_spec` VALUES (2023, 1909, 'SIZE');
INSERT INTO `youbang_commidity_spec` VALUES (2019, 1908, 'ADDRESS');
INSERT INTO `youbang_commidity_spec` VALUES (1958, 216, 'color');
INSERT INTO `youbang_commidity_spec` VALUES (2018, 1908, 'SIZE');
INSERT INTO `youbang_commidity_spec` VALUES (2017, 1908, 'COLOR');
INSERT INTO `youbang_commidity_spec` VALUES (1971, 1869, '尺码');
INSERT INTO `youbang_commidity_spec` VALUES (1970, 1867, '尺寸');
INSERT INTO `youbang_commidity_spec` VALUES (1969, 217, '规格名称1');
INSERT INTO `youbang_commidity_spec` VALUES (1968, 215, '规格名称1');
INSERT INTO `youbang_commidity_spec` VALUES (2022, 1909, 'COLOR');

-- ----------------------------
-- Table structure for youbang_commidity_specitem
-- ----------------------------
DROP TABLE IF EXISTS `youbang_commidity_specitem`;
CREATE TABLE `youbang_commidity_specitem`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `specid` int(11) NULL DEFAULT 0 COMMENT '规格ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '标题',
  `show` int(11) NULL DEFAULT 0 COMMENT '显示',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_specid`(`specid`) USING BTREE,
  INDEX `idx_show`(`show`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 653 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of youbang_commidity_specitem
-- ----------------------------
INSERT INTO `youbang_commidity_specitem` VALUES (478, 1944, '规格名称11', 1);
INSERT INTO `youbang_commidity_specitem` VALUES (479, 1944, '规格名称12', 1);
INSERT INTO `youbang_commidity_specitem` VALUES (480, 1945, '规格名称21', 1);
INSERT INTO `youbang_commidity_specitem` VALUES (481, 1945, '规格名称22', 1);
INSERT INTO `youbang_commidity_specitem` VALUES (482, 1946, '规格名称', 1);
INSERT INTO `youbang_commidity_specitem` VALUES (483, 1946, '规格名称', 1);
INSERT INTO `youbang_commidity_specitem` VALUES (484, 1947, '规格名称', 1);
INSERT INTO `youbang_commidity_specitem` VALUES (485, 1947, '规格名称', 1);
INSERT INTO `youbang_commidity_specitem` VALUES (486, 1948, '规格名称', 1);
INSERT INTO `youbang_commidity_specitem` VALUES (487, 1948, '规格名称', 1);
INSERT INTO `youbang_commidity_specitem` VALUES (488, 1949, '规格名称11', 1);
INSERT INTO `youbang_commidity_specitem` VALUES (489, 1949, '规格名称12', 1);
INSERT INTO `youbang_commidity_specitem` VALUES (490, 1950, '规格名称21', 1);
INSERT INTO `youbang_commidity_specitem` VALUES (491, 1950, '规格名称22', 1);
INSERT INTO `youbang_commidity_specitem` VALUES (492, 1951, '规格名称1', 1);
INSERT INTO `youbang_commidity_specitem` VALUES (493, 1951, '规格名称2', 1);
INSERT INTO `youbang_commidity_specitem` VALUES (494, 1954, '规格名称11', 1);
INSERT INTO `youbang_commidity_specitem` VALUES (495, 1954, '规格名称12', 1);
INSERT INTO `youbang_commidity_specitem` VALUES (496, 1955, '规格名称21', 1);
INSERT INTO `youbang_commidity_specitem` VALUES (497, 1955, '规格名称22', 1);
INSERT INTO `youbang_commidity_specitem` VALUES (652, 2023, 'L', 1);
INSERT INTO `youbang_commidity_specitem` VALUES (651, 2023, 'M', 1);
INSERT INTO `youbang_commidity_specitem` VALUES (640, 2019, 'AMRC', 1);
INSERT INTO `youbang_commidity_specitem` VALUES (639, 2019, 'MLXY', 1);
INSERT INTO `youbang_commidity_specitem` VALUES (502, 1958, 'color1', 1);
INSERT INTO `youbang_commidity_specitem` VALUES (503, 1958, 'color2', 1);
INSERT INTO `youbang_commidity_specitem` VALUES (638, 2018, 'L', 1);
INSERT INTO `youbang_commidity_specitem` VALUES (637, 2018, 'M', 1);
INSERT INTO `youbang_commidity_specitem` VALUES (636, 2017, 'B', 1);
INSERT INTO `youbang_commidity_specitem` VALUES (635, 2017, 'G', 1);
INSERT INTO `youbang_commidity_specitem` VALUES (634, 2017, 'R', 1);
INSERT INTO `youbang_commidity_specitem` VALUES (528, 1971, 'M', 1);
INSERT INTO `youbang_commidity_specitem` VALUES (527, 1971, 'S', 1);
INSERT INTO `youbang_commidity_specitem` VALUES (526, 1970, 'M', 1);
INSERT INTO `youbang_commidity_specitem` VALUES (525, 1969, '规格名称3', 1);
INSERT INTO `youbang_commidity_specitem` VALUES (524, 1969, '规格名称2', 1);
INSERT INTO `youbang_commidity_specitem` VALUES (523, 1968, '规格名称12', 1);
INSERT INTO `youbang_commidity_specitem` VALUES (522, 1968, '规格名称11', 1);
INSERT INTO `youbang_commidity_specitem` VALUES (650, 2023, 'S', 1);
INSERT INTO `youbang_commidity_specitem` VALUES (649, 2022, 'R', 1);
INSERT INTO `youbang_commidity_specitem` VALUES (648, 2022, 'B', 1);
INSERT INTO `youbang_commidity_specitem` VALUES (647, 2022, 'G', 1);

-- ----------------------------
-- Table structure for youbang_commidity_specoption
-- ----------------------------
DROP TABLE IF EXISTS `youbang_commidity_specoption`;
CREATE TABLE `youbang_commidity_specoption`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commodityid` int(10) NULL DEFAULT 0 COMMENT '商品ID',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '名称',
  `marketprice` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '市场价',
  `presellprice` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '促销价',
  `stock` int(11) NULL DEFAULT 0 COMMENT '商品库存 -1 永久可卖',
  `weight` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '商品重量',
  `specs` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规格设置item ID组合，下划线分隔，升序',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_goodsid`(`commodityid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 632 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of youbang_commidity_specoption
-- ----------------------------
INSERT INTO `youbang_commidity_specoption` VALUES (371, 208, '规格名称', 11.00, 0.00, 11, 11.00, NULL, NULL);
INSERT INTO `youbang_commidity_specoption` VALUES (372, 208, '规格名称', 11.00, 0.00, 11, 11.00, NULL, NULL);
INSERT INTO `youbang_commidity_specoption` VALUES (373, 209, '规格名称11_规格名称21', 1.00, 0.00, 1, 1.00, NULL, NULL);
INSERT INTO `youbang_commidity_specoption` VALUES (374, 209, '规格名称11_规格名称22', 1.00, 0.00, 1, 1.00, NULL, NULL);
INSERT INTO `youbang_commidity_specoption` VALUES (375, 209, '规格名称12_规格名称21', 1.00, 0.00, 1, 1.00, NULL, NULL);
INSERT INTO `youbang_commidity_specoption` VALUES (376, 209, '规格名称12_规格名称22', 1.00, 0.00, 1, 1.00, NULL, NULL);
INSERT INTO `youbang_commidity_specoption` VALUES (377, 212, '规格名称1', 1.00, 0.00, 1, 1.00, NULL, NULL);
INSERT INTO `youbang_commidity_specoption` VALUES (378, 212, '规格名称2', 1.00, 0.00, 1, 1.00, NULL, NULL);
INSERT INTO `youbang_commidity_specoption` VALUES (379, 214, '规格名称11_规格名称21', 1.00, 0.00, 1, 1.00, '494_496', NULL);
INSERT INTO `youbang_commidity_specoption` VALUES (380, 214, '规格名称11_规格名称22', 1.00, 0.00, 11, 11.00, '494_497', NULL);
INSERT INTO `youbang_commidity_specoption` VALUES (381, 214, '规格名称12_规格名称21', 1.00, 0.00, 11, 11.00, '495_496', NULL);
INSERT INTO `youbang_commidity_specoption` VALUES (382, 214, '规格名称12_规格名称22', 111.00, 0.00, 11, 1.00, '495_497', NULL);
INSERT INTO `youbang_commidity_specoption` VALUES (387, 216, 'color1', 1.00, 0.00, 1, 1.00, '502', NULL);
INSERT INTO `youbang_commidity_specoption` VALUES (388, 216, 'color2', 2.00, 0.00, 2, 2.00, '503', NULL);
INSERT INTO `youbang_commidity_specoption` VALUES (416, 215, '规格名称12', 4.00, 0.00, 52, 0.00, '523', '超星供货');
INSERT INTO `youbang_commidity_specoption` VALUES (415, 215, '规格名称11', 1.00, 0.00, 2, 0.00, '522', 'vip供货');
INSERT INTO `youbang_commidity_specoption` VALUES (417, 217, '规格名称2', 123.00, 0.00, 324, 432.00, '524', NULL);
INSERT INTO `youbang_commidity_specoption` VALUES (418, 217, '规格名称3', 234.00, 0.00, 32, 324.00, '525', NULL);
INSERT INTO `youbang_commidity_specoption` VALUES (419, 1867, 'M', 200.00, 0.00, 200, 0.00, '526', '小号');
INSERT INTO `youbang_commidity_specoption` VALUES (420, 1869, 'S', 58.00, 0.00, 4, 0.00, '527', '');
INSERT INTO `youbang_commidity_specoption` VALUES (421, 1869, 'M', 45.00, 0.00, 45, 0.00, '528', '');
INSERT INTO `youbang_commidity_specoption` VALUES (631, 1909, 'R_L', 12.00, 0.00, 888, 0.00, '649_652', '09DXSFGA');
INSERT INTO `youbang_commidity_specoption` VALUES (613, 1908, 'B_L_AMRC', 1.00, 0.00, 2, 0.00, '636_638_640', '3');
INSERT INTO `youbang_commidity_specoption` VALUES (612, 1908, 'B_L_MLXY', 1.00, 0.00, 2, 0.00, '636_638_639', '3');
INSERT INTO `youbang_commidity_specoption` VALUES (611, 1908, 'B_M_AMRC', 1.00, 0.00, 2, 0.00, '636_637_640', '3');
INSERT INTO `youbang_commidity_specoption` VALUES (610, 1908, 'B_M_MLXY', 1.00, 0.00, 2, 0.00, '636_637_639', '3');
INSERT INTO `youbang_commidity_specoption` VALUES (609, 1908, 'G_L_AMRC', 1.00, 0.00, 2, 0.00, '635_638_640', '3');
INSERT INTO `youbang_commidity_specoption` VALUES (608, 1908, 'G_L_MLXY', 1.00, 0.00, 2, 0.00, '635_638_639', '3');
INSERT INTO `youbang_commidity_specoption` VALUES (607, 1908, 'G_M_AMRC', 1.00, 0.00, 2, 0.00, '635_637_640', '3');
INSERT INTO `youbang_commidity_specoption` VALUES (606, 1908, 'G_M_MLXY', 1.00, 0.00, 2, 0.00, '635_637_639', '3');
INSERT INTO `youbang_commidity_specoption` VALUES (605, 1908, 'R_L_AMRC', 1.00, 0.00, 2, 0.00, '634_638_640', '3');
INSERT INTO `youbang_commidity_specoption` VALUES (604, 1908, 'R_L_MLXY', 1.00, 0.00, 2, 0.00, '634_638_639', '3');
INSERT INTO `youbang_commidity_specoption` VALUES (603, 1908, 'R_M_AMRC', 1.00, 0.00, 2, 0.00, '634_637_640', '3');
INSERT INTO `youbang_commidity_specoption` VALUES (602, 1908, 'R_M_MLXY', 1.00, 0.00, 2, 0.00, '634_637_639', '3');
INSERT INTO `youbang_commidity_specoption` VALUES (630, 1909, 'R_M', 12.00, 0.00, 888, 0.00, '649_651', '09DXSFGA');
INSERT INTO `youbang_commidity_specoption` VALUES (629, 1909, 'R_S', 12.00, 0.00, 888, 0.00, '649_650', '09DXSFGA');
INSERT INTO `youbang_commidity_specoption` VALUES (628, 1909, 'B_L', 12.00, 0.00, 888, 0.00, '648_652', '09DXSFGA');
INSERT INTO `youbang_commidity_specoption` VALUES (627, 1909, 'B_M', 12.00, 0.00, 888, 0.00, '648_651', '09DXSFGA');
INSERT INTO `youbang_commidity_specoption` VALUES (626, 1909, 'B_S', 12.00, 0.00, 888, 0.00, '648_650', '09DXSFGA');
INSERT INTO `youbang_commidity_specoption` VALUES (625, 1909, 'G_L', 12.00, 0.00, 888, 0.00, '647_652', '09DXSFGA');
INSERT INTO `youbang_commidity_specoption` VALUES (624, 1909, 'G_M', 12.00, 0.00, 888, 0.00, '647_651', '09DXSFGA');
INSERT INTO `youbang_commidity_specoption` VALUES (623, 1909, 'G_S', 12.00, 0.00, 888, 0.00, '647_650', '09DXSFGA');

-- ----------------------------
-- Table structure for youbang_commodities_orders
-- ----------------------------
DROP TABLE IF EXISTS `youbang_commodities_orders`;
CREATE TABLE `youbang_commodities_orders`  (
  `id` bigint(13) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '表序号',
  `merchantid` int(11) NOT NULL COMMENT '商户id',
  `merchan` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商户名称',
  `sn` varchar(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '订单流水号',
  `commodityid` bigint(13) NOT NULL DEFAULT 0 COMMENT '商品id',
  `title` char(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品名称',
  `spectitle` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '规格名称',
  `state` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '订单状态',
  `addtime` datetime(0) NULL DEFAULT NULL COMMENT '下单时间',
  `extime` datetime(0) NULL DEFAULT NULL COMMENT '订单过期时间',
  `price` float(10, 2) NULL DEFAULT NULL COMMENT '单件成交价格',
  `trancefree` float(10, 2) NULL DEFAULT 0.00 COMMENT '运费（以sn下商家为单位）',
  `totalprice` float(10, 2) NULL DEFAULT NULL COMMENT '订单成交总金额（以sn下商家为单位）',
  `number` int(11) NULL DEFAULT NULL COMMENT '单个型号商品成交数量',
  `coupon` float(10, 0) NULL DEFAULT NULL COMMENT '订单优惠券金额（以sn下商家为单位）',
  `litpic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品缩略图',
  `buyerid` int(11) NULL DEFAULT NULL COMMENT '买家id',
  `buyer` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '买家名称',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单地址',
  `buytel` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '买家联系电话',
  `mtel` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商户联系电话',
  `maddress` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商户地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of youbang_commodities_orders
-- ----------------------------
INSERT INTO `youbang_commodities_orders` VALUES (1, 1, '贵州金苹果布艺有限公司', '5259687893654', 181, ' 验证码设置梵蒂冈第三方', '1', '4', '2019-07-24 09:59:04', '2019-07-26 09:59:08', 88.00, 5.00, 232.00, 533, 0, NULL, 1, '弘德誉曦', '贵州兴义', '15985499999', '08593428999', '贵州省兴义市天堂有路39号');
INSERT INTO `youbang_commodities_orders` VALUES (2, 1, '兴计小农家食品有限公司', '52596878936858', 181, '坧地五 中地', '规格名称11_规格名称22', '1', '2019-07-27 09:59:04', '2019-07-26 09:59:08', 88.00, 5.00, 93.00, 1, 0, NULL, 1, '弘德誉曦', '贵州兴义', '15985499998', '08593428996', '贵州省兴义市天堂有路72号');
INSERT INTO `youbang_commodities_orders` VALUES (3, 1, '贵州尖椒顺厅公司', '5259687893654', 181, ' 验证码设置梵蒂冈第三方', '规格名称11_规格名称22', '1', '2019-07-25 09:59:04', '2019-07-26 09:59:08', 88.00, 5.00, 232.00, 78, 0, NULL, 1, '弘德誉曦', '贵州兴义', '15985499977', '08593428998', '贵州省兴义市天堂有路999号');
INSERT INTO `youbang_commodities_orders` VALUES (4, 1, '冰球上于二有限公司', '52596878936858', 181, ' 械大哥大棋械', '规格名称11_规格名称22', '1', '2019-07-26 09:59:04', '2019-07-26 09:59:08', 88.00, 5.00, 93.00, 1, 0, NULL, 1, '弘德誉曦', '贵州兴义', '15985499966', '08593428997', '贵州省兴义市天堂有路1208号');

-- ----------------------------
-- Table structure for youbang_components
-- ----------------------------
DROP TABLE IF EXISTS `youbang_components`;
CREATE TABLE `youbang_components`  (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `nid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `comname` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `maintable` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'dedeCMS_archives',
  `addtable` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `addoninfos` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '附加表所有自动填充字段json文本',
  `issystem` smallint(6) NOT NULL DEFAULT 0,
  `isshow` smallint(6) NOT NULL DEFAULT 1,
  `issend` smallint(6) NOT NULL DEFAULT 0,
  `arcsta` smallint(6) NOT NULL DEFAULT -1,
  `usertype` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `sendrank` smallint(6) NOT NULL DEFAULT 10,
  `isdefault` smallint(6) NOT NULL DEFAULT 0,
  `needdes` tinyint(1) NOT NULL DEFAULT 1,
  `needpic` tinyint(1) NOT NULL DEFAULT 1,
  `titlename` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '标题',
  `onlyone` smallint(6) NOT NULL DEFAULT 0,
  `dfcid` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `icon` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `nid`(`nid`, `isshow`, `arcsta`, `sendrank`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of youbang_components
-- ----------------------------
INSERT INTO `youbang_components` VALUES (-8, 'infos', '分类信息', 'youbang_archives', 'youbang_addoninfos', '[{\"field\":\"classify\",\"itemname\":\"所属分类\",\"type\":\"text\",\"effect\":\"main\",\"maxlength\":\"1024\",\"isnull\":true,\"islist\":\"工程信息分类\",\"default\":0,\"fieldget\":0,\"fieldset\":1,\"inputtype\":\"nesmodal\",\"attr\":\" data-def=4 data-comment=如：这是注释\"},{\"field\":\"componentid\",\"itemname\":\"组件id\",\"type\":\"int\",\"maxlength\":\"10\",\"isnull\":true,\"islist\":\"\",\"default\":0,\"fieldget\":0,\"fieldset\":1,\"inputtype\":\"input\",\"attr\":\" disabled data-def=4 data-comment=如：这是注释\"},{\"field\":\"title\",\"itemname\":\"标题\",\"type\":\"varchar\",\"maxlength\":\"72\",\"isnull\":false,\"islist\":\"\",\"default\":\"\",\"fieldget\":0,\"fieldset\":1,\"inputtype\":\"input\",\"attr\":\" disabled data-def=4 data-comment=标题长度最多15个字符\"},{\"field\":\"litpic\",\"itemname\":\"缩略图\",\"type\":\"varchar\",\"maxlength\":\"255\",\"isnull\":true,\"islist\":\"\",\"default\":\"\",\"fieldget\":0,\"fieldset\":1,\"inputtype\":\"input\",\"attr\":\" disabled data-def=4 data-comment=标题长度最多15个字符\"},{\"field\":\"arcrank\",\"itemname\":\"受权浏览\",\"type\":\"int\",\"maxlength\":\"5\",\"isnull\":\"true\",\"islist\":\"\",\"default\":\"0\",\"fieldget\":0,\"fieldset\":1,\"inputtype\":\"radio\",\"attr\":\"type=number checked disabled\"},{\"field\":\"mid\",\"itemname\":\"会员id\",\"type\":\"int\",\"maxlength\":\"8\",\"isnull\":\"true\",\"islist\":\"\",\"default\":\"0\",\"fieldget\":0,\"fieldset\":1,\"inputtype\":\"input\",\"attr\":\"type=number disabled \"},{\"field\":\"click\",\"itemname\":\"点击\",\"type\":\"int\",\"maxlength\":\"10\",\"isnull\":\"true\",\"islist\":\"\",\"default\":\"0\",\"fieldget\":0,\"fieldset\":1,\"inputtype\":\"input\",\"attr\":\"type=number disabled \"},{\"field\":\"userip\",\"itemname\":\"会员IP\",\"type\":\"text\",\"maxlength\":\"15\",\"isnull\":\"true\",\"islist\":\"\",\"default\":\"0\",\"fieldget\":0,\"fieldset\":1,\"inputtype\":\"input\",\"attr\":\"type=text disabled\"},{\"field\":\"senddate\",\"itemname\":\"发布时间\",\"type\":\"int\",\"maxlength\":\"10\",\"isnull\":\"true\",\"islist\":\"\",\"default\":\"0\",\"fieldget\":0,\"fieldset\":1,\"inputtype\":\"input\",\"attr\":\"type=date\"},{\"field\":\"flag\",\"itemname\":\"推荐属性\",\"type\":\"checkbox\",\"maxlength\":\"10\",\"isnull\":\"true\",\"islist\":\"\",\"default\":\"0\",\"fieldget\":1,\"fieldset\":1,\"inputtype\":\"checkbox\",\"attr\":\"type=checkbox data-key=c-h-z-r data-val=推荐-首页-资讯-热点\"},{\"field\":\"lastpost\",\"itemname\":\"最后评论时间\",\"type\":\"int\",\"maxlength\":\"10\",\"isnull\":\"true\",\"islist\":\"\",\"default\":\"0\",\"fieldget\":0,\"fieldset\":1,\"inputtype\":\"input\",\"attr\":\"type=text disabled\"},{\"field\":\"scores\",\"itemname\":\"评论积分\",\"type\":\"int\",\"maxlength\":\"8\",\"isnull\":\"true\",\"islist\":\"\",\"default\":\"0\",\"fieldget\":1,\"fieldset\":1,\"inputtype\":\"input\",\"attr\":\"type=number disabled\"},{\"field\":\"goodpost\",\"itemname\":\"好评数\",\"type\":\"int\",\"maxlength\":\"8\",\"isnull\":\"true\",\"islist\":\"\",\"default\":\"0\",\"fieldget\":1,\"fieldset\":1,\"inputtype\":\"input\",\"attr\":\"type=number disabled\"},{\"field\":\"badpost\",\"itemname\":\"差评数\",\"type\":\"int\",\"maxlength\":\"8\",\"isnull\":\"true\",\"islist\":\"\",\"default\":\"0\",\"fieldget\":1,\"fieldset\":1,\"inputtype\":\"input\",\"attr\":\"type=number disabled\"},{\"field\":\"nativeplace\",\"itemname\":\"地区\",\"type\":\"stepselect\",\"maxlength\":\"250\",\"isnull\":\"true\",\"islist\":\"\",\"default\":\"0\",\"fieldget\":1,\"fieldset\":1,\"limit\":2,\"inputtype\":\"address\",\"attr\":\"\"},{\"field\":\"infotype\",\"itemname\":\"信息类型\",\"type\":\"stepselect\",\"maxlength\":\"250\",\"isnull\":\"true\",\"islist\":\"信息类型\",\"default\":\"0\",\"fieldget\":1,\"fieldset\":1,\"inputtype\":\"nesmodal\",\"attr\":\"\"},{\"field\":\"body\",\"itemname\":\"信息内容\",\"type\":\"htmltext\",\"maxlength\":\"250\",\"isnull\":\"true\",\"islist\":\"\",\"default\":\"\",\"fieldget\":1,\"fieldset\":1,\"novaild\":1,\"inputtype\":\"uediter\",\"attr\":\"type=text\"},{\"field\":\"endtime\",\"itemname\":\"截止日期\",\"type\":\"datetime\",\"maxlength\":\"250\",\"isnull\":\"true\",\"islist\":\"\",\"default\":\"\",\"fieldget\":1,\"fieldset\":1,\"inputtype\":\"input\",\"attr\":\"type=date\"},{\"field\":\"tel\",\"itemname\":\"联系电话\",\"type\":\"text\",\"maxlength\":\"50\",\"isnull\":\"true\",\"islist\":\"\",\"default\":\"\",\"fieldget\":1,\"fieldset\":1,\"inputtype\":\"input\",\"attr\":\"type=tel\"},{\"field\":\"email\",\"itemname\":\"电子邮箱\",\"type\":\"text\",\"maxlength\":\"50\",\"isnull\":\"true\",\"islist\":\"\",\"default\":\"\",\"fieldget\":1,\"fieldset\":1,\"inputtype\":\"input\",\"attr\":\"type=email\"},{\"field\":\"linkman\",\"itemname\":\"联系人\",\"type\":\"text\",\"maxlength\":\"50\",\"isnull\":\"true\",\"islist\":\"\",\"default\":\"\",\"fieldget\":1,\"fieldset\":1,\"inputtype\":\"input\",\"attr\":\"type=text\"},{\"field\":\"address\",\"itemname\":\"地址\",\"type\":\"text\",\" maxlength\":\"100\",\"isnull\":\"true\",\"islist\":\"\",\"default\":\"\",\"fieldget\":1,\"fieldset\":1,\"limit\":4,\"inputtype\":\"address\",\"attr\":\"\"}]', -1, 1, 1, -1, '', 0, 0, 0, 1, '分类分信息', 0, 0, '/img/sys/admin/6.png');
INSERT INTO `youbang_components` VALUES (1, 'commodities', '商品信息', 'youbang_archives', 'youbang_addoncommodities', '[{\"field\":\"componentid\",\"itemname\":\"组件id\",\"type\":\"int\",\"maxlength\":\"10\",\"isnull\":true,\"islist\":\"\",\"default\":0,\"fieldget\":1,\"fieldset\":1,\"novaild\":1,\"inputtype\":\"input\",\"attr\":\" disabled data-def=4 data-comment=如：这是注释\"},{\"field\":\"title\",\"itemname\":\"标题\",\"type\":\"text\",\"maxlength\":\"25\",\"isnull\":false,\"islist\":\"\",\"default\":0,\"fieldget\":0,\"fieldset\":1,\"novaild\":0,\"inputtype\":\"input\",\"attr\":\"data-comment=标题长度最多15个字符\"},{\"field\":\"classify\",\"itemname\":\"商品分类\",\"type\":\"text\",\"effect\":\"main\",\"maxlength\":\"1024\",\"isnull\":false,\"islist\":\"商品分类\",\"default\":0,\"fieldget\":0,\"fieldset\":0,\"novaild\":0,\"inputtype\":\"nesmodal\"},{\"field\":\"litpic\",\"itemname\":\"缩略图\",\"type\":\"text\",\"maxlength\":0,\"isnull\":true,\"islist\":\"\",\"default\":\"\",\"fieldget\":0,\"fieldset\":1,\"novaild\":0,\"inputtype\":\"input\",\"attr\":\"data-comment=缩略图，限1张\"},{\"field\":\"mainpic\",\"itemname\":\"商品主图\",\"type\":\"text\",\"maxlength\":0,\"isnull\":true,\"islist\":\"\",\"default\":\"\",\"fieldget\":1,\"fieldset\":1,\"novaild\":0,\"inputtype\":\"uploader\",\"limit\":5,\"attr\":\"data-comment=端口主图，最多5张\"},{\"field\":\"usespec\",\"itemname\":\"是否启用规格\",\"maxlength\":0,\"fieldget\":0,\"fieldset\":1,\"novaild\":0,\"inputtype\":\"spec\",\"attr\":\"data-comment=是否使用自定义商品规格\"},{\"field\":\"spec\",\"itemname\":\"商品规格\",\"maxlength\":0,\"fieldget\":1,\"fieldset\":0,\"novaild\":0,\"inputtype\":\"spec\",\"attr\":\"data-comment=填写商品分类\"},{\"field\":\"body\",\"itemname\":\"详情内容\",\"type\":\"text\",\"maxlength\":0,\"isnull\":true,\"islist\":\"\",\"default\":\"\",\"fieldget\":1,\"fieldset\":1,\"novaild\":1,\"inputtype\":\"uediter\",\"attr\":\"data-comment=端口详情内容\"}]', -1, 1, 1, -1, '', 0, 0, 0, 1, '商城系统', 0, 1, '/img/sys/admin/5.png');
INSERT INTO `youbang_components` VALUES (11, 'jobwanted', '人才信息管理', 'youbang_archives', 'youbang_addonjobwanted', '[{\"field\":\"componentid\",\"itemname\":\"组件id\",\"type\":\"int\",\"maxlength\":\"10\",\"isnull\":true,\"islist\":\"\",\"default\":0,\"fieldget\":0,\"fieldset\":1,\"novaild\":1,\"inputtype\":\"input\",\"attr\":\" disabled data-def=4 data-comment=如：这是注释\"},{\"field\":\"title\",\"itemname\":\"标题\",\"type\":\"text\",\"maxlength\":\"25\",\"isnull\":false,\"islist\":0,\"default\":0,\"fieldget\":0,\"fieldset\":1,\"novaild\":0,\"inputtype\":\"input\",\"attr\":\"data-comment=标题长度最多15个字符\"},{\"field\":\"uname\",\"itemname\":\"姓名\",\"type\":\"text\",\"maxlength\":\"20\",\"isnull\":false,\"islist\":\"\",\"default\":0,\"fieldget\":1,\"fieldset\":1,\"limit\":4,\"novaild\":0,\"inputtype\":\"input\",\"attr\":\" data-comment=如：这是注释\"},{\"field\":\"litpic\",\"itemname\":\"头像\",\"type\":\"text\",\"maxlength\":\"255\",\"isnull\":false,\"islist\":\"\",\"default\":0,\"fieldget\":0,\"fieldset\":1,\"limit\":1,\"novaild\":0,\"inputtype\":\"uploader\",\"attr\":\" data-def=1 data-comment=如：这是注释\"},{\"field\":\"gender\",\"itemname\":\"性别\",\"type\":\"varchar\",\"maxlength\":\"2\",\"isnull\":false,\"islist\":\"\",\"default\":0,\"fieldget\":1,\"fieldset\":1,\"novaild\":0,\"inputtype\":\"radio\",\"attr\":\" data-val=\'男-女\' data-key=\'0-1\' data-def=0 data-comment=如：这是注释\"},{\"field\":\"job_experience\",\"itemname\":\"求职者经验\",\"type\":\"varchar\",\"maxlength\":\"11\",\"isnull\":false,\"islist\":\"求职者经验\",\"default\":0,\"fieldget\":1,\"fieldset\":1,\"novaild\":0,\"inputtype\":\"nesmodal\",\"attr\":\" data-comment=如：这是注释\"},{\"field\":\"age\",\"itemname\":\"年龄\",\"type\":\"int\",\"maxlength\":\"2\",\"isnull\":false,\"islist\":\"\",\"default\":0,\"fieldget\":1,\"fieldset\":1,\"novaild\":0,\"inputtype\":\"input\",\"attr\":\" type=number data-comment=如：这是注释\"},{\"field\":\"classify\",\"itemname\":\"职位\",\"type\":\"int\",\"effect\":\"main\",\"maxlength\":\"7\",\"isnull\":false,\"islist\":\"职位分类\",\"default\":0,\"fieldget\":0,\"fieldset\":0,\"novaild\":0,\"inputtype\":\"nesmodal\",\"attr\":\" type=text data-comment=如：这是注释\"},{\"field\":\"job_salary\",\"itemname\":\"期望薪资\",\"type\":\"int\",\"maxlength\":\"7\",\"isnull\":false,\"islist\":\"期望薪资\",\"default\":0,\"fieldget\":1,\"fieldset\":1,\"novaild\":0,\"inputtype\":\"nesmodal\",\"attr\":\" type=number data-comment=如：这是注释\"},{\"field\":\"job_industry\",\"itemname\":\"从事行业\",\"type\":\"varchar\",\"maxlength\":\"128\",\"isnull\":false,\"islist\":\"从事行业\",\"default\":0,\"fieldget\":1,\"fieldset\":1,\"novaild\":0,\"inputtype\":\"nesmodal\",\"attr\":\" type=text data-comment=如：这是注释\"},{\"field\":\"job_Nature\",\"itemname\":\"工作性质\",\"type\":\"varchar\",\"maxlength\":\"128\",\"isnull\":false,\"islist\":\"工作性质\",\"default\":0,\"fieldget\":1,\"fieldset\":1,\"novaild\":0,\"inputtype\":\"nesmodal\",\"attr\":\" type=text data-comment=如：这是注释\"},{\"field\":\"phone\",\"itemname\":\"联系电话\",\"type\":\"int\",\"maxlength\":\"7\",\"isnull\":false,\"islist\":\"\",\"default\":0,\"fieldget\":1,\"fieldset\":1,\"novaild\":0,\"inputtype\":\"input\",\"attr\":\" type=tell data-comment=如：这是注释\"},{\"field\":\"address\",\"itemname\":\"期望工作城市\",\"type\":\"int\",\"maxlength\":\"11\",\"isnull\":false,\"islist\":\"\",\"default\":0,\"fieldget\":1,\"fieldset\":1,\"novaild\":0,\"limit\":3,\"inputtype\":\"address\",\"attr\":\" data-comment=如：这是注释\"},{\"field\":\"company\",\"itemname\":\"公司名称\",\"type\":\"varchar\",\"effect\":\"tab_youbang_jobexperience\",\"maxlength\":\"32\",\"isnull\":false,\"islist\":\"\",\"default\":\"\",\"fieldget\":1,\"fieldset\":1,\"novaild\":0,\"inputtype\":\"input\",\"attr\":\" data-comment=填写曾经工作过的公司名称\"},{\"field\":\"position\",\"itemname\":\"职位\",\"type\":\"varchar\",\"effect\":\"tab_youbang_jobexperience\",\"maxlength\":\"32\",\"isnull\":false,\"islist\":\"\",\"default\":\"\",\"fieldget\":1,\"fieldset\":1,\"novaild\":0,\"inputtype\":\"input\",\"attr\":\" data-comment=填写曾经工作中的职位\"},{\"field\":\"salary\",\"itemname\":\"薪资\",\"type\":\"float\",\"effect\":\"tab_youbang_jobexperience\",\"maxlength\":\"11\",\"isnull\":false,\"islist\":\"\",\"default\":\"\",\"fieldget\":1,\"novaild\":0,\"inputtype\":\"input\",\"attr\":\" type=number data-comment=填写曾经工作时的薪资\"},{\"field\":\"jobtime\",\"itemname\":\"在职时间\",\"type\":\"varchar\",\"effect\":\"tab_youbang_jobexperience\",\"maxlength\":\"36\",\"isnull\":false,\"islist\":\"\",\"default\":\"\",\"fieldget\":1,\"novaild\":0,\"inputtype\":\"input\",\"attr\":\" type=text data-comment=填写格式如:2018年1月1-2019年12年31日\"},{\"field\":\"duty\",\"itemname\":\"工作职责\",\"type\":\"varchar\",\"effect\":\"tab_youbang_jobexperience\",\"maxlength\":\"11\",\"isnull\":false,\"islist\":\"\",\"default\":\"\",\"fieldget\":1,\"novaild\":0,\"inputtype\":\"input\",\"attr\":\" type=text data-comment=填写曾经工作中的职责\"},{\"field\":\"city\",\"itemname\":\"工作地点\",\"type\":\"varchar\",\"effect\":\"tab_youbang_jobexperience\",\"maxlength\":\"11\",\"isnull\":false,\"islist\":\"\",\"default\":\"\",\"fieldget\":1,\"novaild\":0,\"limit\":4,\"inputtype\":\"input\",\"attr\":\" data-comment=填写曾经工作的地点\"},{\"field\":\"brightspot\",\"itemname\":\"我的亮点\",\"type\":\"varchar\",\"effect\":\"tab_youbang_jobexperience\",\"maxlength\":\"255\",\"isnull\":false,\"islist\":\"\",\"default\":\"\",\"fieldget\":1,\"novaild\":0,\"inputtype\":\"textarea\",\"attr\":\" data-comment=填写曾经工作中的亮点\"}]', 0, 1, 0, -1, '', 10, 0, 1, 1, '劳务人才', 0, 0, '/img/sys/admin/4.png');
INSERT INTO `youbang_components` VALUES (12, 'perrecruit', '劳务信息管理', 'youbang_archives', 'youbang_addonperrecruit', '[{\"field\":\"classify\",\"itemname\":\"招聘类型\",\"type\":\"varchar\",\"maxlength\":\"64\",\"effect\":\"main\",\"isnull\":true,\"islist\":\"招聘类型\",\"default\":0,\"fieldget\":0,\"fieldset\":1,\"novaild\":0,\"inputtype\":\"nesmodal\",\"attr\":\" data-comment=请选择招聘类型\"},{\"field\":\"title\",\"itemname\":\"招聘标题\",\"type\":\"varchar\",\"maxlength\":\"64\",\"isnull\":false,\"islist\":\"\",\"default\":0,\"fieldget\":0,\"fieldset\":1,\"novaild\":0,\"inputtype\":\"input\",\"attr\":\" data-comment=请填写招聘信息\"},{\"field\":\"classsalary\",\"itemname\":\"薪资等级\",\"type\":\"varchar\",\"maxlength\":\"64\",\"isnull\":false,\"islist\":\"薪资分类\",\"default\":0,\"fieldget\":1,\"fieldset\":1,\"novaild\":0,\"inputtype\":\"nesmodal\",\"attr\":\" data-comment=选择薪资所等级\"},{\"field\":\"classlabel\",\"itemname\":\"标签分类\",\"type\":\"varchar\",\"maxlength\":\"64\",\"isnull\":false,\"islist\":\"\",\"default\":0,\"fieldget\":1,\"fieldset\":1,\"novaild\":0,\"inputtype\":\"checkbox\",\"attr\":\" data-val=五险一金-包住-包餐 data-key=xj-bz-bc data-comment=选择俱有的特点\"},{\"field\":\"classlabel\",\"itemname\":\"招聘人数\",\"type\":\"varchar\",\"maxlength\":\"64\",\"isnull\":false,\"islist\":\"\",\"default\":0,\"fieldget\":1,\"fieldset\":1,\"novaild\":0,\"inputtype\":\"input\",\"attr\":\" type=number data-comment=填写最多招聘多少人\"},{\"field\":\"classeducation\",\"itemname\":\"最学历要求\",\"type\":\"varchar\",\"maxlength\":\"64\",\"isnull\":false,\"islist\":\"学历分类\",\"default\":0,\"fieldget\":1,\"fieldset\":1,\"novaild\":0,\"inputtype\":\"nesmodal\",\"attr\":\" data-comment=选择最低学历要求\"},{\"field\":\"description\",\"itemname\":\"职位描述\",\"type\":\"varchar\",\"maxlength\":\"255\",\"isnull\":false,\"islist\":\"\",\"default\":0,\"fieldget\":1,\"fieldset\":1,\"novaild\":0,\"inputtype\":\"uediter\",\"attr\":\" data-comment=填写职位要求\"},{\"field\":\"level\",\"itemname\":\"阅读要求\",\"type\":\"varchar\",\"maxlength\":\"255\",\"isnull\":false,\"islist\":\"\",\"default\":0,\"fieldget\":1,\"fieldset\":1,\"novaild\":0,\"inputtype\":\"input\",\"attr\":\" type=number data-comment=要求不低于等级的用户可以查看信息\"},{\"field\":\"mid\",\"itemname\":\"发布者id\",\"type\":\"int\",\"maxlength\":\"11\",\"isnull\":false,\"islist\":\"\",\"default\":0,\"fieldget\":0,\"fieldset\":1,\"novaild\":0,\"inputtype\":\"input\",\"attr\":\" type=number data-comment=要求不低于等级的用户可以查看信息\"}]', 0, 1, 0, -1, '', 10, 0, 1, 1, '劳务信息', 0, 0, '/img/sys/admin/3.png');

-- ----------------------------
-- Table structure for youbang_enum
-- ----------------------------
DROP TABLE IF EXISTS `youbang_enum`;
CREATE TABLE `youbang_enum`  (
  `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT,
  `enumtag` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '列表类型',
  `name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '列表项名称',
  `value` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '列表项值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 303 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of youbang_enum
-- ----------------------------
INSERT INTO `youbang_enum` VALUES (300, 'perrecruit_state', '删除', '3');
INSERT INTO `youbang_enum` VALUES (253, 'jobwanted_state', '删除', '3');
INSERT INTO `youbang_enum` VALUES (252, 'jobwanted_state', '异常', '2');
INSERT INTO `youbang_enum` VALUES (251, 'jobwanted_state', '正常', '1');
INSERT INTO `youbang_enum` VALUES (203, 'infos_state', '删除', '2');
INSERT INTO `youbang_enum` VALUES (202, 'infos_state', '异常', '1');
INSERT INTO `youbang_enum` VALUES (201, 'infos_state', '正常', '0');
INSERT INTO `youbang_enum` VALUES (301, 'perrecruit_state', '异常', '2');
INSERT INTO `youbang_enum` VALUES (103, 'advtype', '轮播图', '3');
INSERT INTO `youbang_enum` VALUES (302, 'perrecruit_state', '正常', '1');
INSERT INTO `youbang_enum` VALUES (102, 'advtype', '文字公告', '2');
INSERT INTO `youbang_enum` VALUES (101, 'advtype', '图片广告', '1');
INSERT INTO `youbang_enum` VALUES (54, 'commodities_state', '停售', '3');
INSERT INTO `youbang_enum` VALUES (53, 'commodities_state', '售馨', '2');
INSERT INTO `youbang_enum` VALUES (52, 'commodities_state', '售中', '1');
INSERT INTO `youbang_enum` VALUES (51, 'commodities_state', '商品状态', '0');
INSERT INTO `youbang_enum` VALUES (9, 'order_state', ' 交易完成', '8');
INSERT INTO `youbang_enum` VALUES (8, 'order_state', ' 退款成功', '7');
INSERT INTO `youbang_enum` VALUES (7, 'order_state', ' 已签收', '6');
INSERT INTO `youbang_enum` VALUES (6, 'order_state', ' 申请退款', '5');
INSERT INTO `youbang_enum` VALUES (5, 'order_state', ' 派送中', '4');
INSERT INTO `youbang_enum` VALUES (4, 'order_state', ' 已发货', '3');
INSERT INTO `youbang_enum` VALUES (3, 'order_state', ' 待发货', '2');
INSERT INTO `youbang_enum` VALUES (2, 'order_state', ' 待付款', '1');
INSERT INTO `youbang_enum` VALUES (1, 'order_state', '', '0');

-- ----------------------------
-- Table structure for youbang_flink
-- ----------------------------
DROP TABLE IF EXISTS `youbang_flink`;
CREATE TABLE `youbang_flink`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `litpic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `linkurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `addtime` datetime(0) NULL DEFAULT NULL,
  `enable` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of youbang_flink
-- ----------------------------
INSERT INTO `youbang_flink` VALUES (1, '/files/2019/7/5/58d84a9b38d0925ede1eb9bcd84235ee.jpe', '百度', 'http://www.baidu.com', '2019-07-04 11:52:52', '1');
INSERT INTO `youbang_flink` VALUES (2, '/files/2019/7/5/dfb1f4dbeaae8f317713369594870095.jpe', '新浪', 'https//www.sina.com.cn/', '2019-07-05 11:28:07', '1');
INSERT INTO `youbang_flink` VALUES (3, '/files/2019/7/5/58d84a9b38d0925ede1eb9bcd84235ee.jpe', '新浪', 'https://www.sina.com.cn/', '2019-07-05 11:55:27', '1');
INSERT INTO `youbang_flink` VALUES (4, '/files/2019/7/5/58d84a9b38d0925ede1eb9bcd84235ee.jpe', '新浪', 'https://www.sina.com.cn/', '2019-07-05 11:55:27', '1');

-- ----------------------------
-- Table structure for youbang_jobexperience
-- ----------------------------
DROP TABLE IF EXISTS `youbang_jobexperience`;
CREATE TABLE `youbang_jobexperience`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aid` int(11) NOT NULL COMMENT '关联求职者表',
  `company` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司名称',
  `position` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '在职职位',
  `salary` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '薪资水平',
  `jobtime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '在职时间',
  `duty` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工作职责',
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '现居城市',
  `brightspot` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '我的亮点',
  `classexperience` float NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of youbang_jobexperience
-- ----------------------------
INSERT INTO `youbang_jobexperience` VALUES (18, 1907, '模压股份有限公司24铃声 公司', '唪顶替实得分和3人w', '30555', '2012年3月-2018年13月', '使用权rw', '仍rWQ TJTY 6', '爱你的人微任务倗白脸32 32 23他', NULL);

-- ----------------------------
-- Table structure for youbang_member_favorite
-- ----------------------------
DROP TABLE IF EXISTS `youbang_member_favorite`;
CREATE TABLE `youbang_member_favorite`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `favoriteid` int(11) NULL DEFAULT NULL COMMENT '收藏id',
  `createtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '收藏时间',
  `deleted` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '删除 0删除1删除',
  `componentsid` int(11) NULL DEFAULT NULL COMMENT '收藏类型id',
  `openid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信openid',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of youbang_member_favorite
-- ----------------------------
INSERT INTO `youbang_member_favorite` VALUES (1, 1, 180, '2019-07-31 16:51:46', '1', -8, NULL);
INSERT INTO `youbang_member_favorite` VALUES (2, 1, 184, '2019-07-15 15:58:28', '1', -8, NULL);
INSERT INTO `youbang_member_favorite` VALUES (3, 1, 180, '2019-08-01 08:34:42', '1', -9, NULL);
INSERT INTO `youbang_member_favorite` VALUES (4, 1, 180, '2019-08-01 08:34:45', '1', 9, NULL);

-- ----------------------------
-- Table structure for youbang_member_level
-- ----------------------------
DROP TABLE IF EXISTS `youbang_member_level`;
CREATE TABLE `youbang_member_level`  (
  `id` int(11) NOT NULL,
  `level` tinyint(11) NULL DEFAULT NULL COMMENT '级别',
  `levelname` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '	级别名字',
  `ordermoney` float(255, 0) NULL DEFAULT NULL COMMENT '订单总额',
  `ordercount` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单次数',
  `enabled` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT ' 启用 0关闭1启用',
  `createtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `createuserid` int(255) NULL DEFAULT NULL COMMENT '创建的用户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for youbang_route
-- ----------------------------
DROP TABLE IF EXISTS `youbang_route`;
CREATE TABLE `youbang_route`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '真实url',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of youbang_route
-- ----------------------------
INSERT INTO `youbang_route` VALUES (1, '/pc/cms/home?tpn=1&sid=2');
INSERT INTO `youbang_route` VALUES (2, '/pc/cms/home?tpn=1&sid=2');

-- ----------------------------
-- Table structure for youbang_sys_acount
-- ----------------------------
DROP TABLE IF EXISTS `youbang_sys_acount`;
CREATE TABLE `youbang_sys_acount`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` mediumint(8) UNSIGNED NULL DEFAULT NULL COMMENT '创建人id',
  `acount` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录帐号，使用email',
  `face` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userName` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `acountType` enum('','agent','manager') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账户类别(后台管理员或代理商)',
  `groupId` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '角色id',
  `loginTime` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `loginIp` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后登录ip',
  `enable` enum('0','1','2') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '0停用1启用２禁用(表示删除状态)',
  `addTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `tel` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册时绑定手机号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  UNIQUE INDEX `acount`(`acount`) USING BTREE,
  INDEX `enable`(`enable`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 197 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of youbang_sys_acount
-- ----------------------------
INSERT INTO `youbang_sys_acount` VALUES (1, 0, '1@qq.com', '/snowSys/images/avatars/user.jpg', '总管理员', 'e2b5036c89d7ba03c0ce8e2093c7af2b', 'manager', 1, NULL, NULL, '1', '2019-06-24 17:47:00', '13339690812');
INSERT INTO `youbang_sys_acount` VALUES (185, 2000, '2@qq.com', NULL, '小郑', '2f15a866c441882fe31be926f0279180', 'agent', 2, NULL, NULL, '1', '2019-06-24 17:47:00', '13339690812');
INSERT INTO `youbang_sys_acount` VALUES (186, 2000, '3@qq.com', NULL, '省代理商', '1c95702fd611444a9290d2411ca64022', 'agent', 2016, NULL, NULL, '1', '2019-06-24 17:47:01', '13339690812');
INSERT INTO `youbang_sys_acount` VALUES (189, 2000, '100@qq.com', NULL, '测试代理商', '083a71490a2429aa4835bccac99257f2', 'agent', 2016, NULL, NULL, '1', '2019-06-24 17:47:01', '13339690812');
INSERT INTO `youbang_sys_acount` VALUES (190, 2000, '101@qq.com', NULL, '测试代理商2', '62e1b5422008c2704e8f7f0e6d4d2a3e', 'agent', 2016, NULL, NULL, '1', '2019-06-24 17:47:01', '13339690812');
INSERT INTO `youbang_sys_acount` VALUES (191, 1, '102@qq.com', NULL, '账户1下代理商', '4d1a04e2d2e52d115f948c29223d8472', 'agent', 2016, NULL, NULL, '2', '2019-06-24 17:47:01', '13339690812');
INSERT INTO `youbang_sys_acount` VALUES (192, 1, '4@qq.com', NULL, '张三', '25e2ce67543fff07ac94e591f9152d85', 'manager', 2000, NULL, NULL, '1', '2019-06-24 17:47:01', '13339690812');
INSERT INTO `youbang_sys_acount` VALUES (193, 192, '5@qq.com', NULL, '张三', 'd2e957a2ebfdf133bbc2b6e11a5333ad', 'manager', 2000, NULL, NULL, '1', '2019-06-24 17:47:01', '13339690812');
INSERT INTO `youbang_sys_acount` VALUES (194, 192, '6@qq.com', NULL, '附三', '422adaaa1574eff0bda51d68a3693d14', 'manager', 2000, NULL, NULL, '1', '2019-06-24 17:47:01', '13339690812');
INSERT INTO `youbang_sys_acount` VALUES (195, 194, '123@qq.com', NULL, 'qwe', '283bb52a0fdc0d28264bf0bb396c954b', 'manager', 2000, NULL, NULL, '1', '2019-06-24 17:47:01', '13339690812');
INSERT INTO `youbang_sys_acount` VALUES (196, 195, '1234@qq.com', NULL, '1234', 'f177cbb9ea8185eee6ff24078d7bf17a', 'manager', 2000, NULL, NULL, '1', '2019-06-24 17:47:01', '13339690812');

-- ----------------------------
-- Table structure for youbang_sys_acount_agent
-- ----------------------------
DROP TABLE IF EXISTS `youbang_sys_acount_agent`;
CREATE TABLE `youbang_sys_acount_agent`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `acountid` int(11) NOT NULL DEFAULT 0 COMMENT '代理商注册ID',
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '微信openid',
  `merchNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '代理商编号',
  `merchName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '代理商名',
  `agentCate` int(11) NULL DEFAULT NULL COMMENT '代理商类别',
  `desc` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '介绍',
  `realName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '实名',
  `sex` enum('0','1','2') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '0未指定1女2男',
  `IDNumber` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `birthday` datetime(0) NULL DEFAULT NULL COMMENT '生日（xxxx年xx月xx日）',
  `mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号',
  `status` enum('1','2','3','4') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '状态 1 待审核 2 入驻中 3 暂停 4 即将到期',
  `accountTime` int(11) NULL DEFAULT 1 COMMENT '代理时长（默认1年）',
  `effectiveTime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '生效时间',
  `expirationTime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  `applyTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '审核时间',
  `accountTotal` int(11) NULL DEFAULT 0 COMMENT '可以开多少子帐号,默认0表示不可以招下级代理，-1不限制个数',
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `joinTime` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '加入时间',
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '标志',
  `payopenid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '收款人openid',
  `payrate` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '抽成利率',
  `isrecommand` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '是否推荐，0否，1是',
  `cateid` int(11) NULL DEFAULT 0 COMMENT '代理商分类ID',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '地址',
  `tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '电话',
  `lat` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '经度',
  `lng` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '纬度',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE,
  INDEX `idx_acountid`(`acountid`) USING BTREE,
  INDEX `idx_cateid`(`cateid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 153 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of youbang_sys_acount_agent
-- ----------------------------
INSERT INTO `youbang_sys_acount_agent` VALUES (147, 0, 186, '', '', '1qq.com', NULL, '', '省代理商', '1', '569865489652315486', '2019-02-14 00:00:00', '12536858969', '1', 1, '2019-02-12 22:25:44', '2019-02-12 22:25:44', '2019-03-24 21:56:52', 0, '中华人民共和国', '2019-02-12 22:25:44', '', '', 0.00, '0', 0, '', '', '', '');
INSERT INTO `youbang_sys_acount_agent` VALUES (148, 0, 185, '', '', '', NULL, '', '', '0', NULL, NULL, '', '1', 1, '2019-02-12 22:26:56', '2019-02-12 22:26:56', '2019-03-24 21:56:52', 0, NULL, '2019-02-12 22:26:56', '', '', 0.00, '0', 0, '', '', '', '');
INSERT INTO `youbang_sys_acount_agent` VALUES (149, 0, 189, '', '', '1qq.com', NULL, '', '', '0', NULL, NULL, '', '1', 1, '2019-02-12 22:37:06', '2019-02-12 22:37:06', '2019-03-24 21:56:52', 0, '中华人民共和国', '2019-02-12 22:37:06', '', '', 0.00, '0', 0, '', '', '', '');
INSERT INTO `youbang_sys_acount_agent` VALUES (151, 0, 190, '', '', '1qq.com', NULL, '', '', '0', NULL, NULL, '', '1', 1, '2019-02-12 22:51:29', '2019-02-12 22:51:29', '2019-03-24 21:56:52', 0, '中华人民共和国', '2019-02-12 22:51:29', '', '', 0.00, '0', 0, '', '', '', '');
INSERT INTO `youbang_sys_acount_agent` VALUES (152, 0, 191, '', '', '1qq.com', NULL, '', '账户1下代理商', '1', '569865489652315486', '2019-02-14 00:00:00', '12459687596', '1', 1, '2019-02-12 23:07:29', '2019-02-12 23:07:29', '2019-03-24 21:56:52', 0, '中华人民共和国', '2019-02-12 23:07:29', '', '', 0.00, '0', 0, '', '', '', '');

-- ----------------------------
-- Table structure for youbang_sys_acount_group
-- ----------------------------
DROP TABLE IF EXISTS `youbang_sys_acount_group`;
CREATE TABLE `youbang_sys_acount_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NULL DEFAULT NULL,
  `groupName` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '组名',
  `type` varchar(72) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户类别',
  `status` tinyint(3) NULL DEFAULT 0 COMMENT '当前组是否启用',
  `deleted` tinyint(3) NULL DEFAULT 0 COMMENT '是否可用(用户是否被删除)',
  `addTime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE,
  INDEX `idx_deleted`(`deleted`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2017 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of youbang_sys_acount_group
-- ----------------------------
INSERT INTO `youbang_sys_acount_group` VALUES (1, 0, '超级管理员', 'manager', 1, 0, '2019-06-12 11:21:18');
INSERT INTO `youbang_sys_acount_group` VALUES (2, 1, '代理商管理员', 'manager', 1, 0, '2019-06-19 11:21:21');
INSERT INTO `youbang_sys_acount_group` VALUES (2016, 1, '省代理', 'agent', 1, 0, '2019-06-04 11:21:25');
INSERT INTO `youbang_sys_acount_group` VALUES (2000, 1, '普通管理员', 'manager', 1, 0, '2019-07-02 17:36:26');

-- ----------------------------
-- Table structure for youbang_sys_acount_manager
-- ----------------------------
DROP TABLE IF EXISTS `youbang_sys_acount_manager`;
CREATE TABLE `youbang_sys_acount_manager`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nick` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `acountid` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账户',
  `mobile` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `effectiveTime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'vip生效时间',
  `expirationTime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'vip过期时间',
  `openid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信openid',
  `sex` enum('0','1','2') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '0未指定1女2男',
  `realName` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `IDNumber` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `birthday` datetime(0) NULL DEFAULT NULL COMMENT '生日（xxxx年xx月xx日）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `acountid`(`acountid`) USING BTREE,
  INDEX `mobile`(`mobile`) USING BTREE,
  INDEX `realName`(`realName`) USING BTREE,
  INDEX `IDNumber`(`IDNumber`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4408 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of youbang_sys_acount_manager
-- ----------------------------
INSERT INTO `youbang_sys_acount_manager` VALUES (1, '小郑', '1', NULL, '2019-02-12 18:05:30', '2029-01-30 21:05:30', NULL, '1', '小郑', NULL, NULL);
INSERT INTO `youbang_sys_acount_manager` VALUES (4396, '小郑', '185', NULL, '2019-02-12 18:05:30', '2019-02-12 18:05:30', NULL, '1', '小郑', '522321498540102513', '2019-02-17 00:00:00');
INSERT INTO `youbang_sys_acount_manager` VALUES (4397, NULL, '186', NULL, '2019-02-12 18:16:26', '2019-02-12 18:16:26', NULL, '0', NULL, NULL, NULL);
INSERT INTO `youbang_sys_acount_manager` VALUES (4400, NULL, '189', NULL, '2019-02-12 22:35:38', '2019-02-12 22:35:38', NULL, '0', NULL, NULL, NULL);
INSERT INTO `youbang_sys_acount_manager` VALUES (4401, NULL, '190', NULL, '2019-02-12 22:50:38', '2019-02-12 22:50:38', NULL, '0', NULL, NULL, NULL);
INSERT INTO `youbang_sys_acount_manager` VALUES (4402, NULL, '191', NULL, '2019-02-12 23:07:29', '2019-02-12 23:07:29', NULL, '0', NULL, NULL, NULL);
INSERT INTO `youbang_sys_acount_manager` VALUES (4403, NULL, '192', NULL, '2019-04-17 22:20:00', '2019-04-17 22:20:00', NULL, '0', NULL, NULL, NULL);
INSERT INTO `youbang_sys_acount_manager` VALUES (4404, NULL, '193', NULL, '2019-04-17 22:21:00', '2019-04-17 22:21:00', NULL, '0', NULL, NULL, NULL);
INSERT INTO `youbang_sys_acount_manager` VALUES (4405, NULL, '194', NULL, '2019-04-17 22:24:34', '2019-04-17 22:24:34', NULL, '0', NULL, NULL, NULL);
INSERT INTO `youbang_sys_acount_manager` VALUES (4406, NULL, '195', NULL, '2019-04-22 07:09:25', '2019-04-22 07:09:25', NULL, '0', NULL, NULL, NULL);
INSERT INTO `youbang_sys_acount_manager` VALUES (4407, NULL, '196', NULL, '2019-04-25 22:54:31', '2019-04-25 22:54:31', NULL, '0', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for youbang_sys_acount_merchant
-- ----------------------------
DROP TABLE IF EXISTS `youbang_sys_acount_merchant`;
CREATE TABLE `youbang_sys_acount_merchant`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `acountid` int(11) NOT NULL DEFAULT 0 COMMENT '代理商注册ID',
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '微信openid',
  `merchNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '商户编号',
  `merchName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '商户名称',
  `merchCate` int(11) NULL DEFAULT NULL COMMENT '商户类别',
  `desc` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '介绍',
  `realName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '实名',
  `sex` enum('0','1','2') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '0未指定1女2男',
  `IDNumber` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `birthday` datetime(0) NULL DEFAULT NULL COMMENT '生日（xxxx年xx月xx日）',
  `mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号',
  `status` enum('1','2','3','4') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '状态 1 待审核 2 入驻中 3 暂停 4 即将到期',
  `accountTime` int(11) NULL DEFAULT 1 COMMENT '时长（默认1年）',
  `effectiveTime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '生效时间',
  `expirationTime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  `applyTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '审核时间',
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `joinTime` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '加入时间',
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '标志',
  `payopenid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '收款人openid',
  `payrate` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '抽成利率',
  `isrecommand` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '是否推荐，0否，1是',
  `cateid` int(11) NULL DEFAULT 0 COMMENT '商户分类ID',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '地址',
  `tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '电话',
  `lat` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '经度',
  `lng` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '纬度',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE,
  INDEX `idx_acountid`(`acountid`) USING BTREE,
  INDEX `idx_cateid`(`cateid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 153 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for youbang_sys_acount_type
-- ----------------------------
DROP TABLE IF EXISTS `youbang_sys_acount_type`;
CREATE TABLE `youbang_sys_acount_type`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `typeName` varchar(72) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账户类别(后台管理员或代理商)',
  `alias` varchar(72) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '别名',
  `enable` enum('0','1','2') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '0停用1启用２禁用(表示删除状态)',
  `addTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  UNIQUE INDEX `acount`(`typeName`) USING BTREE,
  INDEX `enable`(`enable`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 251 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of youbang_sys_acount_type
-- ----------------------------
INSERT INTO `youbang_sys_acount_type` VALUES (1, 'manager', '管理员组', '1', '2019-04-19 23:19:26');
INSERT INTO `youbang_sys_acount_type` VALUES (100, 'agent', '代理商组', '1', '2019-04-19 23:21:22');
INSERT INTO `youbang_sys_acount_type` VALUES (150, 'users', '客户端注册后拥有系统功能模块管理权限的用户组', '1', '2019-04-19 23:26:09');
INSERT INTO `youbang_sys_acount_type` VALUES (200, 'member', '访客组（会员组）', '1', '2019-04-19 23:28:50');
INSERT INTO `youbang_sys_acount_type` VALUES (250, 'merchant', '商户组', '1', '2019-07-06 10:03:45');

-- ----------------------------
-- Table structure for youbang_sys_area
-- ----------------------------
DROP TABLE IF EXISTS `youbang_sys_area`;
CREATE TABLE `youbang_sys_area`  (
  `id` smallint(5) NULL DEFAULT NULL,
  `name` varchar(270) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `reid` smallint(5) NULL DEFAULT NULL,
  `initial` char(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `initials` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pinyin` varchar(600) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `extra` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `suffix` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `code` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `area_code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `order` tinyint(2) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of youbang_sys_area
-- ----------------------------
INSERT INTO `youbang_sys_area` VALUES (1, '北京', 0, 'b', 'bj', 'beijing', '', '市', '110000', '010', 1);
INSERT INTO `youbang_sys_area` VALUES (2, '天津', 0, 't', 'tj', 'tianjin', '', '市', '120000', '022', 2);
INSERT INTO `youbang_sys_area` VALUES (3, '上海', 0, 's', 'sh', 'shanghai', '', '市', '310000', '021', 3);
INSERT INTO `youbang_sys_area` VALUES (4, '重庆', 0, 'c', 'cq', 'chongqing', '', '市', '500000', '023', 4);
INSERT INTO `youbang_sys_area` VALUES (5, '河北', 0, 'h', 'hb', 'hebei', '', '省', '130000', '', 5);
INSERT INTO `youbang_sys_area` VALUES (6, '山西', 0, 's', 'sx', 'shanxi', '', '省', '140000', '', 6);
INSERT INTO `youbang_sys_area` VALUES (7, '内蒙古', 0, 'n', 'nmg', 'neimenggu', '', '自治区', '150000', '', 7);
INSERT INTO `youbang_sys_area` VALUES (8, '辽宁', 0, 'l', 'ln', 'liaoning', '', '省', '210000', '', 8);
INSERT INTO `youbang_sys_area` VALUES (9, '吉林', 0, 'j', 'jl', 'jilin', '', '省', '220000', '', 9);
INSERT INTO `youbang_sys_area` VALUES (10, '黑龙江', 0, 'h', 'hlj', 'heilongjiang', '', '省', '230000', '', 10);
INSERT INTO `youbang_sys_area` VALUES (11, '江苏', 0, 'j', 'js', 'jiangsu', '', '省', '320000', '', 11);
INSERT INTO `youbang_sys_area` VALUES (12, '浙江', 0, 'z', 'zj', 'zhejiang', '', '省', '330000', '', 12);
INSERT INTO `youbang_sys_area` VALUES (13, '安徽', 0, 'a', 'ah', 'anhui', '', '省', '340000', '', 13);
INSERT INTO `youbang_sys_area` VALUES (14, '福建', 0, 'f', 'fj', 'fujian', '', '省', '350000', '', 14);
INSERT INTO `youbang_sys_area` VALUES (15, '江西', 0, 'j', 'jx', 'jiangxi', '', '省', '360000', '', 15);
INSERT INTO `youbang_sys_area` VALUES (16, '山东', 0, 's', 'sd', 'shandong', '', '省', '370000', '', 16);
INSERT INTO `youbang_sys_area` VALUES (17, '河南', 0, 'h', 'hn', 'henan', '', '省', '410000', '', 17);
INSERT INTO `youbang_sys_area` VALUES (18, '湖北', 0, 'h', 'hb', 'hubei', '', '省', '420000', '', 18);
INSERT INTO `youbang_sys_area` VALUES (19, '湖南', 0, 'h', 'hn', 'hunan', '', '省', '430000', '', 19);
INSERT INTO `youbang_sys_area` VALUES (20, '广东', 0, 'g', 'gd', 'guangdong', '', '省', '440000', '', 20);
INSERT INTO `youbang_sys_area` VALUES (21, '广西', 0, 'g', 'gx', 'guangxi', '壮族', '自治区', '450000', '', 21);
INSERT INTO `youbang_sys_area` VALUES (22, '海南', 0, 'h', 'hn', 'hainan', '', '省', '460000', '', 22);
INSERT INTO `youbang_sys_area` VALUES (23, '四川', 0, 's', 'sc', 'sichuan', '', '省', '510000', '', 23);
INSERT INTO `youbang_sys_area` VALUES (24, '贵州', 0, 'g', 'gz', 'guizhou', '', '省', '520000', '', 24);
INSERT INTO `youbang_sys_area` VALUES (25, '云南', 0, 'y', 'yn', 'yunnan', '', '省', '530000', '', 25);
INSERT INTO `youbang_sys_area` VALUES (26, '西藏', 0, 'x', 'xz', 'xizang', '', '自治区', '540000', '', 26);
INSERT INTO `youbang_sys_area` VALUES (27, '陕西', 0, 's', 'sx', 'shanxi', '', '省', '610000', '', 27);
INSERT INTO `youbang_sys_area` VALUES (28, '甘肃', 0, 'g', 'gs', 'gansu', '', '省', '620000', '', 28);
INSERT INTO `youbang_sys_area` VALUES (29, '青海', 0, 'q', 'qh', 'qinghai', '', '省', '630000', '', 29);
INSERT INTO `youbang_sys_area` VALUES (30, '宁夏', 0, 'n', 'nx', 'ningxia', '回族', '自治区', '640000', '', 30);
INSERT INTO `youbang_sys_area` VALUES (31, '新疆', 0, 'x', 'xj', 'xinjiang', '维吾尔', '自治区', '650000', '', 31);
INSERT INTO `youbang_sys_area` VALUES (32, '台湾', 0, 't', 'tw', 'taiwan', '', '省', '710000', '', 32);
INSERT INTO `youbang_sys_area` VALUES (33, '香港', 0, 'x', 'xg', 'xianggang', '', '特别行政区', '810000', '852', 33);
INSERT INTO `youbang_sys_area` VALUES (34, '澳门', 0, 'a', 'am', 'aomen', '', '特别行政区', '820000', '853', 34);
INSERT INTO `youbang_sys_area` VALUES (35, '海外', 0, 'h', 'hw', 'haiwai', '', '', '', '', 35);
INSERT INTO `youbang_sys_area` VALUES (36, '东城', 1, 'd', 'dc', 'dongcheng', '', '区', '110101', '010', 1);
INSERT INTO `youbang_sys_area` VALUES (37, '西城', 1, 'x', 'xc', 'xicheng', '', '区', '110102', '010', 2);
INSERT INTO `youbang_sys_area` VALUES (40, '朝阳', 1, 'c', 'cy', 'chaoyang', '', '区', '110105', '010', 5);
INSERT INTO `youbang_sys_area` VALUES (41, '丰台', 1, 'f', 'ft', 'fengtai', '', '区', '110106', '010', 6);
INSERT INTO `youbang_sys_area` VALUES (42, '石景山', 1, 's', 'sjs', 'shijingshan', '', '区', '110107', '010', 7);
INSERT INTO `youbang_sys_area` VALUES (43, '海淀', 1, 'h', 'hd', 'haidian', '', '区', '110108', '010', 8);
INSERT INTO `youbang_sys_area` VALUES (44, '门头沟', 1, 'm', 'mtg', 'mentougou', '', '区', '110109', '010', 9);
INSERT INTO `youbang_sys_area` VALUES (45, '房山', 1, 'f', 'fs', 'fangshan', '', '区', '110111', '010', 10);
INSERT INTO `youbang_sys_area` VALUES (46, '通州', 1, 't', 'tz', 'tongzhou', '', '区', '110112', '010', 11);
INSERT INTO `youbang_sys_area` VALUES (47, '顺义', 1, 's', 'sy', 'shunyi', '', '区', '110113', '010', 12);
INSERT INTO `youbang_sys_area` VALUES (48, '昌平', 1, 'c', 'cp', 'changping', '', '区', '110114', '010', 13);
INSERT INTO `youbang_sys_area` VALUES (49, '大兴', 1, 'd', 'dx', 'daxing', '', '区', '110115', '010', 14);
INSERT INTO `youbang_sys_area` VALUES (50, '怀柔', 1, 'h', 'hr', 'huairou', '', '区', '110116', '010', 15);
INSERT INTO `youbang_sys_area` VALUES (51, '平谷', 1, 'p', 'pg', 'pinggu', '', '区', '110117', '010', 16);
INSERT INTO `youbang_sys_area` VALUES (52, '密云', 1, 'm', 'my', 'miyun', '', '区', '110228', '010', 17);
INSERT INTO `youbang_sys_area` VALUES (53, '延庆', 1, 'y', 'yq', 'yanqing', '', '区', '110229', '010', 18);
INSERT INTO `youbang_sys_area` VALUES (54, '和平', 2, 'h', 'hp', 'heping', '', '区', '120101', '022', 1);
INSERT INTO `youbang_sys_area` VALUES (55, '河东', 2, 'h', 'hd', 'hedong', '', '区', '120102', '022', 2);
INSERT INTO `youbang_sys_area` VALUES (56, '河西', 2, 'h', 'hx', 'hexi', '', '区', '120103', '022', 3);
INSERT INTO `youbang_sys_area` VALUES (57, '南开', 2, 'n', 'nk', 'nankai', '', '区', '120104', '022', 4);
INSERT INTO `youbang_sys_area` VALUES (58, '河北', 2, 'h', 'hb', 'hebei', '', '区', '120105', '022', 5);
INSERT INTO `youbang_sys_area` VALUES (59, '红桥', 2, 'h', 'hq', 'hongqiao', '', '区', '120106', '022', 6);
INSERT INTO `youbang_sys_area` VALUES (60, '东丽', 2, 'd', 'dl', 'dongli', '', '区', '120110', '022', 7);
INSERT INTO `youbang_sys_area` VALUES (61, '西青', 2, 'x', 'xq', 'xiqing', '', '区', '120111', '022', 8);
INSERT INTO `youbang_sys_area` VALUES (62, '津南', 2, 'j', 'jn', 'jinnan', '', '区', '120112', '022', 9);
INSERT INTO `youbang_sys_area` VALUES (63, '北辰', 2, 'b', 'bc', 'beichen', '', '区', '120113', '022', 10);
INSERT INTO `youbang_sys_area` VALUES (64, '武清', 2, 'w', 'wq', 'wuqing', '', '区', '120114', '022', 11);
INSERT INTO `youbang_sys_area` VALUES (65, '宝坻', 2, 'b', 'bc', 'baochi', '', '区', '120115', '022', 12);
INSERT INTO `youbang_sys_area` VALUES (66, '滨海新区', 2, 'b', 'bhxq', 'binhaixinqu', '', '', '120116', '022', 13);
INSERT INTO `youbang_sys_area` VALUES (67, '宁河', 2, 'n', 'nh', 'ninghe', '', '区', '120221', '022', 14);
INSERT INTO `youbang_sys_area` VALUES (68, '蓟州', 2, 'j', 'jz', 'jizhou', '', '区', '120223', '022', 15);
INSERT INTO `youbang_sys_area` VALUES (69, '静海', 2, 'j', 'jh', 'jinghai', '', '区', '120225', '022', 16);
INSERT INTO `youbang_sys_area` VALUES (70, '黄浦', 3, 'h', 'hp', 'huangpu', '', '区', '310101', '021', 1);
INSERT INTO `youbang_sys_area` VALUES (71, '徐汇', 3, 'x', 'xh', 'xuhui', '', '区', '310104', '021', 2);
INSERT INTO `youbang_sys_area` VALUES (72, '长宁', 3, 'c', 'cn', 'changning', '', '区', '310105', '021', 3);
INSERT INTO `youbang_sys_area` VALUES (73, '静安', 3, 'j', 'ja', 'jingan', '', '区', '310106', '021', 4);
INSERT INTO `youbang_sys_area` VALUES (74, '普陀', 3, 'p', 'pt', 'putuo', '', '区', '310107', '021', 5);
INSERT INTO `youbang_sys_area` VALUES (76, '虹口', 3, 'h', 'hk', 'hongkou', '', '区', '310109', '021', 7);
INSERT INTO `youbang_sys_area` VALUES (77, '杨浦', 3, 'y', 'yp', 'yangpu', '', '区', '310110', '021', 8);
INSERT INTO `youbang_sys_area` VALUES (78, '闵行', 3, 'm', 'mx', 'minxing', '', '区', '310112', '021', 9);
INSERT INTO `youbang_sys_area` VALUES (79, '宝山', 3, 'b', 'bs', 'baoshan', '', '区', '310113', '021', 10);
INSERT INTO `youbang_sys_area` VALUES (80, '嘉定', 3, 'j', 'jd', 'jiading', '', '区', '310114', '021', 11);
INSERT INTO `youbang_sys_area` VALUES (81, '浦东新区', 3, 'p', 'pdxq', 'pudongxinqu', '', '', '310115', '021', 12);
INSERT INTO `youbang_sys_area` VALUES (82, '金山', 3, 'j', 'js', 'jinshan', '', '区', '310116', '021', 13);
INSERT INTO `youbang_sys_area` VALUES (83, '松江', 3, 's', 'sj', 'songjiang', '', '区', '310117', '021', 14);
INSERT INTO `youbang_sys_area` VALUES (84, '青浦', 3, 'q', 'qp', 'qingpu', '', '区', '310118', '021', 15);
INSERT INTO `youbang_sys_area` VALUES (85, '奉贤', 3, 'f', 'fx', 'fengxian', '', '区', '310120', '021', 16);
INSERT INTO `youbang_sys_area` VALUES (86, '崇明', 3, 'c', 'cm', 'chongming', '', '区', '310230', '021', 17);
INSERT INTO `youbang_sys_area` VALUES (87, '万州', 4, 'w', 'wz', 'wanzhou', '', '区', '500101', '023', 1);
INSERT INTO `youbang_sys_area` VALUES (88, '涪陵', 4, 'f', 'fl', 'fuling', '', '区', '500102', '023', 2);
INSERT INTO `youbang_sys_area` VALUES (89, '渝中', 4, 'y', 'yz', 'yuzhong', '', '区', '500103', '023', 3);
INSERT INTO `youbang_sys_area` VALUES (90, '大渡口', 4, 'd', 'ddk', 'dadukou', '', '区', '500104', '023', 4);
INSERT INTO `youbang_sys_area` VALUES (91, '江北', 4, 'j', 'jb', 'jiangbei', '', '区', '500105', '023', 5);
INSERT INTO `youbang_sys_area` VALUES (92, '沙坪坝', 4, 's', 'spb', 'shapingba', '', '区', '500106', '023', 6);
INSERT INTO `youbang_sys_area` VALUES (93, '九龙坡', 4, 'j', 'jlp', 'jiulongpo', '', '区', '500107', '023', 7);
INSERT INTO `youbang_sys_area` VALUES (94, '南岸', 4, 'n', 'na', 'nanan', '', '区', '500108', '023', 8);
INSERT INTO `youbang_sys_area` VALUES (95, '北碚', 4, 'b', 'bb', 'beibei', '', '区', '500109', '023', 9);
INSERT INTO `youbang_sys_area` VALUES (96, '綦江', 4, 'q', 'qj', 'qijiang', '', '区', '500110', '023', 10);
INSERT INTO `youbang_sys_area` VALUES (97, '大足', 4, 'd', 'dz', 'dazu', '', '区', '500111', '023', 11);
INSERT INTO `youbang_sys_area` VALUES (98, '渝北', 4, 'y', 'yb', 'yubei', '', '区', '500112', '023', 12);
INSERT INTO `youbang_sys_area` VALUES (99, '巴南', 4, 'b', 'bn', 'banan', '', '区', '500113', '023', 13);
INSERT INTO `youbang_sys_area` VALUES (100, '黔江', 4, 'q', 'qj', 'qianjiang', '', '区', '500114', '023', 14);
INSERT INTO `youbang_sys_area` VALUES (101, '长寿', 4, 'c', 'cs', 'changshou', '', '区', '500115', '023', 15);
INSERT INTO `youbang_sys_area` VALUES (102, '江津', 4, 'j', 'jj', 'jiangjin', '', '区', '500116', '023', 16);
INSERT INTO `youbang_sys_area` VALUES (103, '合川', 4, 'h', 'hc', 'hechuan', '', '区', '500117', '023', 17);
INSERT INTO `youbang_sys_area` VALUES (104, '永川', 4, 'y', 'yc', 'yongchuan', '', '区', '500118', '023', 18);
INSERT INTO `youbang_sys_area` VALUES (105, '南川', 4, 'n', 'nc', 'nanchuan', '', '区', '500119', '023', 19);
INSERT INTO `youbang_sys_area` VALUES (106, '潼南', 4, 't', 'tn', 'tongnan', '', '区', '500223', '023', 22);
INSERT INTO `youbang_sys_area` VALUES (107, '铜梁', 4, 't', 'tl', 'tongliang', '', '区', '500151', '023', 21);
INSERT INTO `youbang_sys_area` VALUES (108, '荣昌', 4, 'r', 'rc', 'rongchang', '', '区', '500226', '023', 23);
INSERT INTO `youbang_sys_area` VALUES (109, '璧山', 4, 'b', 'bs', 'bishan', '', '区', '500120', '023', 20);
INSERT INTO `youbang_sys_area` VALUES (110, '梁平', 4, 'l', 'lp', 'liangping', '', '区', '500228', '023', 24);
INSERT INTO `youbang_sys_area` VALUES (111, '城口', 4, 'c', 'ck', 'chengkou', '', '县', '500229', '023', 25);
INSERT INTO `youbang_sys_area` VALUES (112, '丰都', 4, 'f', 'fd', 'fengdu', '', '县', '500230', '023', 26);
INSERT INTO `youbang_sys_area` VALUES (113, '垫江', 4, 'd', 'dj', 'dianjiang', '', '县', '500231', '023', 27);
INSERT INTO `youbang_sys_area` VALUES (114, '武隆', 4, 'w', 'wl', 'wulong', '', '区', '500232', '023', 28);
INSERT INTO `youbang_sys_area` VALUES (115, '忠县', 4, 'z', 'zx', 'zhongxian', '', '', '500233', '023', 29);
INSERT INTO `youbang_sys_area` VALUES (116, '开州', 4, 'k', 'kz', 'kaizhou', '', '区', '500234', '023', 30);
INSERT INTO `youbang_sys_area` VALUES (117, '云阳', 4, 'y', 'yy', 'yunyang', '', '县', '500235', '023', 31);
INSERT INTO `youbang_sys_area` VALUES (118, '奉节', 4, 'f', 'fj', 'fengjie', '', '县', '500236', '023', 32);
INSERT INTO `youbang_sys_area` VALUES (119, '巫山', 4, 'w', 'ws', 'wushan', '', '县', '500237', '023', 33);
INSERT INTO `youbang_sys_area` VALUES (120, '巫溪', 4, 'w', 'wx', 'wuxi', '', '县', '500238', '023', 34);
INSERT INTO `youbang_sys_area` VALUES (121, '石柱', 4, 's', 'sz', 'shizhu', '土家族', '自治县', '500240', '023', 35);
INSERT INTO `youbang_sys_area` VALUES (122, '秀山', 4, 'x', 'xs', 'xiushan', '土家族苗族', '自治县', '500241', '023', 36);
INSERT INTO `youbang_sys_area` VALUES (123, '酉阳', 4, 'y', 'yy', 'youyang', '土家族苗族', '自治县', '500242', '023', 37);
INSERT INTO `youbang_sys_area` VALUES (124, '彭水', 4, 'p', 'ps', 'pengshui', '苗族土家族', '自治县', '500243', '023', 38);
INSERT INTO `youbang_sys_area` VALUES (125, '石家庄', 5, 's', 'sjz', 'shijiazhuang', '', '市', '130100', '0311', 1);
INSERT INTO `youbang_sys_area` VALUES (126, '唐山', 5, 't', 'ts', 'tangshan', '', '市', '130200', '0315', 2);
INSERT INTO `youbang_sys_area` VALUES (127, '秦皇岛', 5, 'q', 'qhd', 'qinhuangdao', '', '市', '130300', '0335', 3);
INSERT INTO `youbang_sys_area` VALUES (128, '邯郸', 5, 'h', 'hd', 'handan', '', '市', '130400', '0310', 4);
INSERT INTO `youbang_sys_area` VALUES (129, '邢台', 5, 'x', 'xt', 'xingtai', '', '市', '130500', '0319', 5);
INSERT INTO `youbang_sys_area` VALUES (130, '保定', 5, 'b', 'bd', 'baoding', '', '市', '130600', '0312', 6);
INSERT INTO `youbang_sys_area` VALUES (131, '张家口', 5, 'z', 'zjk', 'zhangjiakou', '', '市', '130700', '0313', 7);
INSERT INTO `youbang_sys_area` VALUES (132, '承德', 5, 'c', 'cd', 'chengde', '', '市', '130800', '0314', 8);
INSERT INTO `youbang_sys_area` VALUES (133, '沧州', 5, 'c', 'cz', 'cangzhou', '', '市', '130900', '0317', 9);
INSERT INTO `youbang_sys_area` VALUES (134, '廊坊', 5, 'l', 'lf', 'langfang', '', '市', '131000', '0316', 10);
INSERT INTO `youbang_sys_area` VALUES (135, '衡水', 5, 'h', 'hs', 'hengshui', '', '市', '131100', '0318', 11);
INSERT INTO `youbang_sys_area` VALUES (136, '太原', 6, 't', 'ty', 'taiyuan', '', '市', '140100', '0351', 1);
INSERT INTO `youbang_sys_area` VALUES (137, '大同', 6, 'd', 'dt', 'datong', '', '市', '140200', '0352', 2);
INSERT INTO `youbang_sys_area` VALUES (138, '阳泉', 6, 'y', 'yq', 'yangquan', '', '市', '140300', '0353', 3);
INSERT INTO `youbang_sys_area` VALUES (139, '长治', 6, 'c', 'cz', 'changzhi', '', '市', '140400', '0355', 4);
INSERT INTO `youbang_sys_area` VALUES (140, '晋城', 6, 'j', 'jc', 'jincheng', '', '市', '140500', '0356', 5);
INSERT INTO `youbang_sys_area` VALUES (141, '朔州', 6, 's', 'sz', 'shuozhou', '', '市', '140600', '0349', 6);
INSERT INTO `youbang_sys_area` VALUES (142, '晋中', 6, 'j', 'jz', 'jinzhong', '', '市', '140700', '0354', 7);
INSERT INTO `youbang_sys_area` VALUES (143, '运城', 6, 'y', 'yc', 'yuncheng', '', '市', '140800', '0359', 8);
INSERT INTO `youbang_sys_area` VALUES (144, '忻州', 6, 'x', 'xz', 'xinzhou', '', '市', '140900', '0350', 9);
INSERT INTO `youbang_sys_area` VALUES (145, '临汾', 6, 'l', 'lf', 'linfen', '', '市', '141000', '0357', 10);
INSERT INTO `youbang_sys_area` VALUES (146, '吕梁', 6, 'l', 'll', 'lvliang', '', '市', '141100', '0358', 11);
INSERT INTO `youbang_sys_area` VALUES (147, '呼和浩特', 7, 'h', 'hhht', 'huhehaote', '', '市', '150100', '0471', 1);
INSERT INTO `youbang_sys_area` VALUES (148, '包头', 7, 'b', 'bt', 'baotou', '', '市', '150200', '0472', 2);
INSERT INTO `youbang_sys_area` VALUES (149, '乌海', 7, 'w', 'wh', 'wuhai', '', '市', '150300', '0473', 3);
INSERT INTO `youbang_sys_area` VALUES (150, '赤峰', 7, 'c', 'cf', 'chifeng', '', '市', '150400', '0476', 4);
INSERT INTO `youbang_sys_area` VALUES (151, '通辽', 7, 't', 'tl', 'tongliao', '', '市', '150500', '0475', 5);
INSERT INTO `youbang_sys_area` VALUES (152, '鄂尔多斯', 7, 'e', 'eeds', 'eerduosi', '', '市', '150600', '0477', 6);
INSERT INTO `youbang_sys_area` VALUES (153, '呼伦贝尔', 7, 'h', 'hlbe', 'hulunbeier', '', '市', '150700', '0470', 7);
INSERT INTO `youbang_sys_area` VALUES (154, '巴彦淖尔', 7, 'b', 'byne', 'bayannaoer', '', '市', '150800', '0478', 8);
INSERT INTO `youbang_sys_area` VALUES (155, '乌兰察布', 7, 'w', 'wlcb', 'wulanchabu', '', '市', '150900', '0474', 9);
INSERT INTO `youbang_sys_area` VALUES (156, '兴安', 7, 'x', 'xa', 'xingan', '', '盟', '152200', '0482', 10);
INSERT INTO `youbang_sys_area` VALUES (157, '锡林郭勒', 7, 'x', 'xlgl', 'xilinguole', '', '盟', '152500', '0479', 11);
INSERT INTO `youbang_sys_area` VALUES (158, '阿拉善', 7, 'a', 'als', 'alashan', '', '盟', '152900', '0483', 12);
INSERT INTO `youbang_sys_area` VALUES (159, '沈阳', 8, 's', 'sy', 'shenyang', '', '市', '210100', '024', 1);
INSERT INTO `youbang_sys_area` VALUES (160, '大连', 8, 'd', 'dl', 'dalian', '', '市', '210200', '0411', 2);
INSERT INTO `youbang_sys_area` VALUES (161, '鞍山', 8, 'a', 'as', 'anshan', '', '市', '210300', '0412', 3);
INSERT INTO `youbang_sys_area` VALUES (162, '抚顺', 8, 'f', 'fs', 'fushun', '', '市', '210400', '0413', 4);
INSERT INTO `youbang_sys_area` VALUES (163, '本溪', 8, 'b', 'bx', 'benxi', '', '市', '210500', '0414', 5);
INSERT INTO `youbang_sys_area` VALUES (164, '丹东', 8, 'd', 'dd', 'dandong', '', '市', '210600', '0415', 6);
INSERT INTO `youbang_sys_area` VALUES (165, '锦州', 8, 'j', 'jz', 'jinzhou', '', '市', '210700', '0416', 7);
INSERT INTO `youbang_sys_area` VALUES (166, '营口', 8, 'y', 'yk', 'yingkou', '', '市', '210800', '0417', 8);
INSERT INTO `youbang_sys_area` VALUES (167, '阜新', 8, 'f', 'fx', 'fuxin', '', '市', '210900', '0418', 9);
INSERT INTO `youbang_sys_area` VALUES (168, '辽阳', 8, 'l', 'ly', 'liaoyang', '', '市', '211000', '0419', 10);
INSERT INTO `youbang_sys_area` VALUES (169, '盘锦', 8, 'p', 'pj', 'panjin', '', '市', '211100', '0427', 11);
INSERT INTO `youbang_sys_area` VALUES (170, '铁岭', 8, 't', 'tl', 'tieling', '', '市', '211200', '0410', 12);
INSERT INTO `youbang_sys_area` VALUES (171, '朝阳', 8, 'c', 'cy', 'chaoyang', '', '市', '211300', '0421', 13);
INSERT INTO `youbang_sys_area` VALUES (172, '葫芦岛', 8, 'h', 'hld', 'huludao', '', '市', '211400', '0429', 14);
INSERT INTO `youbang_sys_area` VALUES (173, '长春', 9, 'c', 'cc', 'changchun', '', '市', '220100', '0431', 1);
INSERT INTO `youbang_sys_area` VALUES (174, '吉林', 9, 'j', 'jl', 'jilin', '', '市', '220200', '0432', 2);
INSERT INTO `youbang_sys_area` VALUES (175, '四平', 9, 's', 'sp', 'siping', '', '市', '220300', '0434', 3);
INSERT INTO `youbang_sys_area` VALUES (176, '辽源', 9, 'l', 'ly', 'liaoyuan', '', '市', '220400', '0437', 4);
INSERT INTO `youbang_sys_area` VALUES (177, '通化', 9, 't', 'th', 'tonghua', '', '市', '220500', '0435', 5);
INSERT INTO `youbang_sys_area` VALUES (178, '白山', 9, 'b', 'bs', 'baishan', '', '市', '220600', '0439', 6);
INSERT INTO `youbang_sys_area` VALUES (179, '松原', 9, 's', 'sy', 'songyuan', '', '市', '220700', '0438', 7);
INSERT INTO `youbang_sys_area` VALUES (180, '白城', 9, 'b', 'bc', 'baicheng', '', '市', '220800', '0436', 8);
INSERT INTO `youbang_sys_area` VALUES (181, '延边', 9, 'y', 'yb', 'yanbian', '朝鲜族', '自治州', '222400', '0433', 9);
INSERT INTO `youbang_sys_area` VALUES (182, '哈尔滨', 10, 'h', 'heb', 'haerbin', '', '市', '230100', '0451', 1);
INSERT INTO `youbang_sys_area` VALUES (183, '齐齐哈尔', 10, 'q', 'qqhe', 'qiqihaer', '', '市', '230200', '0452', 2);
INSERT INTO `youbang_sys_area` VALUES (184, '鸡西', 10, 'j', 'jx', 'jixi', '', '市', '230300', '0467', 3);
INSERT INTO `youbang_sys_area` VALUES (185, '鹤岗', 10, 'h', 'hg', 'hegang', '', '市', '230400', '0468', 4);
INSERT INTO `youbang_sys_area` VALUES (186, '双鸭山', 10, 's', 'sys', 'shuangyashan', '', '市', '230500', '0469', 5);
INSERT INTO `youbang_sys_area` VALUES (187, '大庆', 10, 'd', 'dq', 'daqing', '', '市', '230600', '0459', 6);
INSERT INTO `youbang_sys_area` VALUES (188, '伊春', 10, 'y', 'yc', 'yichun', '', '市', '230700', '0458', 7);
INSERT INTO `youbang_sys_area` VALUES (189, '佳木斯', 10, 'j', 'jms', 'jiamusi', '', '市', '230800', '0454', 8);
INSERT INTO `youbang_sys_area` VALUES (190, '七台河', 10, 'q', 'qth', 'qitaihe', '', '市', '230900', '0464', 9);
INSERT INTO `youbang_sys_area` VALUES (191, '牡丹江', 10, 'm', 'mdj', 'mudanjiang', '', '市', '231000', '0453', 10);
INSERT INTO `youbang_sys_area` VALUES (192, '黑河', 10, 'h', 'hh', 'heihe', '', '市', '231100', '0456', 11);
INSERT INTO `youbang_sys_area` VALUES (193, '绥化', 10, 's', 'sh', 'suihua', '', '市', '231200', '0455', 12);
INSERT INTO `youbang_sys_area` VALUES (194, '大兴安岭', 10, 'd', 'dxal', 'daxinganling', '', '地区', '232700', '0457', 13);
INSERT INTO `youbang_sys_area` VALUES (195, '南京', 11, 'n', 'nj', 'nanjing', '', '市', '320100', '', 1);
INSERT INTO `youbang_sys_area` VALUES (196, '无锡', 11, 'w', 'wx', 'wuxi', '', '市', '320200', '0510', 2);
INSERT INTO `youbang_sys_area` VALUES (197, '徐州', 11, 'x', 'xz', 'xuzhou', '', '市', '320300', '0516', 3);
INSERT INTO `youbang_sys_area` VALUES (198, '常州', 11, 'c', 'cz', 'changzhou', '', '市', '320400', '0519', 4);
INSERT INTO `youbang_sys_area` VALUES (199, '苏州', 11, 's', 'sz', 'suzhou', '', '市', '320500', '0512', 5);
INSERT INTO `youbang_sys_area` VALUES (200, '南通', 11, 'n', 'nt', 'nantong', '', '市', '320600', '0513', 6);
INSERT INTO `youbang_sys_area` VALUES (201, '连云港', 11, 'l', 'lyg', 'lianyungang', '', '市', '320700', '0518', 7);
INSERT INTO `youbang_sys_area` VALUES (202, '淮安', 11, 'h', 'ha', 'huaian', '', '市', '320800', '0517', 8);
INSERT INTO `youbang_sys_area` VALUES (203, '盐城', 11, 'y', 'yc', 'yancheng', '', '市', '320900', '0515', 9);
INSERT INTO `youbang_sys_area` VALUES (204, '扬州', 11, 'y', 'yz', 'yangzhou', '', '市', '321000', '0514', 10);
INSERT INTO `youbang_sys_area` VALUES (205, '镇江', 11, 'z', 'zj', 'zhenjiang', '', '市', '321100', '0511', 11);
INSERT INTO `youbang_sys_area` VALUES (206, '泰州', 11, 't', 'tz', 'taizhou', '', '市', '321200', '0523', 12);
INSERT INTO `youbang_sys_area` VALUES (207, '宿迁', 11, 's', 'sq', 'suqian', '', '市', '321300', '0527', 13);
INSERT INTO `youbang_sys_area` VALUES (208, '杭州', 12, 'h', 'hz', 'hangzhou', '', '市', '330100', '0571', 1);
INSERT INTO `youbang_sys_area` VALUES (209, '宁波', 12, 'n', 'nb', 'ningbo', '', '市', '330200', '0574', 2);
INSERT INTO `youbang_sys_area` VALUES (210, '温州', 12, 'w', 'wz', 'wenzhou', '', '市', '330300', '0577', 3);
INSERT INTO `youbang_sys_area` VALUES (211, '嘉兴', 12, 'j', 'jx', 'jiaxing', '', '市', '330400', '0573', 4);
INSERT INTO `youbang_sys_area` VALUES (212, '湖州', 12, 'h', 'hz', 'huzhou', '', '市', '330500', '0572', 5);
INSERT INTO `youbang_sys_area` VALUES (213, '绍兴', 12, 's', 'sx', 'shaoxing', '', '市', '330600', '0575', 6);
INSERT INTO `youbang_sys_area` VALUES (214, '金华', 12, 'j', 'jh', 'jinhua', '', '市', '330700', '0579', 7);
INSERT INTO `youbang_sys_area` VALUES (215, '衢州', 12, 'q', 'qz', 'quzhou', '', '市', '330800', '0570', 8);
INSERT INTO `youbang_sys_area` VALUES (216, '舟山', 12, 'z', 'zs', 'zhoushan', '', '市', '330900', '0580', 9);
INSERT INTO `youbang_sys_area` VALUES (217, '台州', 12, 't', 'tz', 'taizhou', '', '市', '331000', '0576', 10);
INSERT INTO `youbang_sys_area` VALUES (218, '丽水', 12, 'l', 'ls', 'lishui', '', '市', '331100', '0578', 11);
INSERT INTO `youbang_sys_area` VALUES (219, '合肥', 13, 'h', 'hf', 'hefei', '', '市', '340100', '0551', 1);
INSERT INTO `youbang_sys_area` VALUES (220, '芜湖', 13, 'w', 'wh', 'wuhu', '', '市', '340200', '0553', 2);
INSERT INTO `youbang_sys_area` VALUES (221, '蚌埠', 13, 'b', 'bb', 'bengbu', '', '市', '340300', '0552', 3);
INSERT INTO `youbang_sys_area` VALUES (222, '淮南', 13, 'h', 'hn', 'huainan', '', '市', '340400', '0554', 4);
INSERT INTO `youbang_sys_area` VALUES (223, '马鞍山', 13, 'm', 'mas', 'maanshan', '', '市', '340500', '0555', 5);
INSERT INTO `youbang_sys_area` VALUES (224, '淮北', 13, 'h', 'hb', 'huaibei', '', '市', '340600', '0561', 6);
INSERT INTO `youbang_sys_area` VALUES (225, '铜陵', 13, 't', 'tl', 'tongling', '', '市', '340700', '0562', 7);
INSERT INTO `youbang_sys_area` VALUES (226, '安庆', 13, 'a', 'aq', 'anqing', '', '市', '340800', '0556', 8);
INSERT INTO `youbang_sys_area` VALUES (227, '黄山', 13, 'h', 'hs', 'huangshan', '', '市', '341000', '0559', 9);
INSERT INTO `youbang_sys_area` VALUES (228, '滁州', 13, 'c', 'cz', 'chuzhou', '', '市', '341100', '0550', 10);
INSERT INTO `youbang_sys_area` VALUES (229, '阜阳', 13, 'f', 'fy', 'fuyang', '', '市', '341200', '0558', 11);
INSERT INTO `youbang_sys_area` VALUES (230, '宿州', 13, 's', 'sz', 'suzhou', '', '市', '341300', '0557', 12);
INSERT INTO `youbang_sys_area` VALUES (231, '六安', 13, 'l', 'la', 'liuan', '', '市', '341500', '0564', 13);
INSERT INTO `youbang_sys_area` VALUES (232, '亳州', 13, 'b', 'bz', 'bozhou', '', '市', '341600', '0558', 14);
INSERT INTO `youbang_sys_area` VALUES (233, '池州', 13, 'c', 'cz', 'chizhou', '', '市', '341700', '0566', 15);
INSERT INTO `youbang_sys_area` VALUES (234, '宣城', 13, 'x', 'xc', 'xuancheng', '', '市', '341800', '0563', 16);
INSERT INTO `youbang_sys_area` VALUES (235, '福州', 14, 'f', 'fz', 'fuzhou', '', '市', '350100', '0591', 1);
INSERT INTO `youbang_sys_area` VALUES (236, '厦门', 14, 'x', 'xm', 'xiamen', '', '市', '350200', '0592', 2);
INSERT INTO `youbang_sys_area` VALUES (237, '莆田', 14, 'p', 'pt', 'putian', '', '市', '350300', '0594', 3);
INSERT INTO `youbang_sys_area` VALUES (238, '三明', 14, 's', 'sm', 'sanming', '', '市', '350400', '0598', 4);
INSERT INTO `youbang_sys_area` VALUES (239, '泉州', 14, 'q', 'qz', 'quanzhou', '', '市', '350500', '0595', 5);
INSERT INTO `youbang_sys_area` VALUES (240, '漳州', 14, 'z', 'zz', 'zhangzhou', '', '市', '350600', '0596', 6);
INSERT INTO `youbang_sys_area` VALUES (241, '南平', 14, 'n', 'np', 'nanping', '', '市', '350700', '0599', 7);
INSERT INTO `youbang_sys_area` VALUES (242, '龙岩', 14, 'l', 'ly', 'longyan', '', '市', '350800', '0597', 8);
INSERT INTO `youbang_sys_area` VALUES (243, '宁德', 14, 'n', 'nd', 'ningde', '', '市', '350900', '0593', 9);
INSERT INTO `youbang_sys_area` VALUES (244, '南昌', 15, 'n', 'nc', 'nanchang', '', '市', '360100', '0791', 1);
INSERT INTO `youbang_sys_area` VALUES (245, '景德镇', 15, 'j', 'jdz', 'jingdezhen', '', '市', '360200', '0798', 2);
INSERT INTO `youbang_sys_area` VALUES (246, '萍乡', 15, 'p', 'px', 'pingxiang', '', '市', '360300', '0799', 3);
INSERT INTO `youbang_sys_area` VALUES (247, '九江', 15, 'j', 'jj', 'jiujiang', '', '市', '360400', '0792', 4);
INSERT INTO `youbang_sys_area` VALUES (248, '新余', 15, 'x', 'xy', 'xinyu', '', '市', '360500', '0790', 5);
INSERT INTO `youbang_sys_area` VALUES (249, '鹰潭', 15, 'y', 'yt', 'yingtan', '', '市', '360600', '0701', 6);
INSERT INTO `youbang_sys_area` VALUES (250, '赣州', 15, 'g', 'gz', 'ganzhou', '', '市', '360700', '0797', 7);
INSERT INTO `youbang_sys_area` VALUES (251, '吉安', 15, 'j', 'ja', 'jian', '', '市', '360800', '0796', 8);
INSERT INTO `youbang_sys_area` VALUES (252, '宜春', 15, 'y', 'yc', 'yichun', '', '市', '360900', '0795', 9);
INSERT INTO `youbang_sys_area` VALUES (253, '抚州', 15, 'f', 'fz', 'fuzhou', '', '市', '361000', '0794', 10);
INSERT INTO `youbang_sys_area` VALUES (254, '上饶', 15, 's', 'sr', 'shangrao', '', '市', '361100', '0793', 11);
INSERT INTO `youbang_sys_area` VALUES (255, '济南', 16, 'j', 'jn', 'jinan', '', '市', '370100', '0531', 1);
INSERT INTO `youbang_sys_area` VALUES (256, '青岛', 16, 'q', 'qd', 'qingdao', '', '市', '370200', '0532', 2);
INSERT INTO `youbang_sys_area` VALUES (257, '淄博', 16, 'z', 'zb', 'zibo', '', '市', '370300', '0533', 3);
INSERT INTO `youbang_sys_area` VALUES (258, '枣庄', 16, 'z', 'zz', 'zaozhuang', '', '市', '370400', '0632', 4);
INSERT INTO `youbang_sys_area` VALUES (259, '东营', 16, 'd', 'dy', 'dongying', '', '市', '370500', '0546', 5);
INSERT INTO `youbang_sys_area` VALUES (260, '烟台', 16, 'y', 'yt', 'yantai', '', '市', '370600', '0535', 6);
INSERT INTO `youbang_sys_area` VALUES (261, '潍坊', 16, 'w', 'wf', 'weifang', '', '市', '370700', '0536', 7);
INSERT INTO `youbang_sys_area` VALUES (262, '济宁', 16, 'j', 'jn', 'jining', '', '市', '370800', '0537', 8);
INSERT INTO `youbang_sys_area` VALUES (263, '泰安', 16, 't', 'ta', 'taian', '', '市', '370900', '0538', 9);
INSERT INTO `youbang_sys_area` VALUES (264, '威海', 16, 'w', 'wh', 'weihai', '', '市', '371000', '0631', 10);
INSERT INTO `youbang_sys_area` VALUES (265, '日照', 16, 'r', 'rz', 'rizhao', '', '市', '371100', '0633', 11);
INSERT INTO `youbang_sys_area` VALUES (267, '临沂', 16, 'l', 'ly', 'linyi', '', '市', '371300', '0539', 13);
INSERT INTO `youbang_sys_area` VALUES (268, '德州', 16, 'd', 'dz', 'dezhou', '', '市', '371400', '0534', 14);
INSERT INTO `youbang_sys_area` VALUES (269, '聊城', 16, 'l', 'lc', 'liaocheng', '', '市', '371500', '0635', 15);
INSERT INTO `youbang_sys_area` VALUES (270, '滨州', 16, 'b', 'bz', 'binzhou', '', '市', '371600', '0543', 16);
INSERT INTO `youbang_sys_area` VALUES (271, '菏泽', 16, 'h', 'hz', 'heze', '', '市', '371700', '0530', 17);
INSERT INTO `youbang_sys_area` VALUES (272, '郑州', 17, 'z', 'zz', 'zhengzhou', '', '市', '410100', '0371', 1);
INSERT INTO `youbang_sys_area` VALUES (273, '开封', 17, 'k', 'kf', 'kaifeng', '', '市', '410200', '0378', 2);
INSERT INTO `youbang_sys_area` VALUES (274, '洛阳', 17, 'l', 'ly', 'luoyang', '', '市', '410300', '0376', 3);
INSERT INTO `youbang_sys_area` VALUES (275, '平顶山', 17, 'p', 'pds', 'pingdingshan', '', '市', '410400', '0375', 4);
INSERT INTO `youbang_sys_area` VALUES (276, '安阳', 17, 'a', 'ay', 'anyang', '', '市', '410500', '0372', 5);
INSERT INTO `youbang_sys_area` VALUES (277, '鹤壁', 17, 'h', 'hb', 'hebi', '', '市', '410600', '0392', 6);
INSERT INTO `youbang_sys_area` VALUES (278, '新乡', 17, 'x', 'xx', 'xinxiang', '', '市', '410700', '0373', 7);
INSERT INTO `youbang_sys_area` VALUES (279, '焦作', 17, 'j', 'jz', 'jiaozuo', '', '市', '410800', '0391', 8);
INSERT INTO `youbang_sys_area` VALUES (280, '濮阳', 17, 'p', 'py', 'puyang', '', '市', '410900', '', 9);
INSERT INTO `youbang_sys_area` VALUES (281, '许昌', 17, 'x', 'xc', 'xuchang', '', '市', '411000', '0374', 10);
INSERT INTO `youbang_sys_area` VALUES (282, '漯河', 17, 'l', 'lh', 'luohe', '', '市', '411100', '0395', 11);
INSERT INTO `youbang_sys_area` VALUES (283, '三门峡', 17, 's', 'smx', 'sanmenxia', '', '市', '411200', '0398', 12);
INSERT INTO `youbang_sys_area` VALUES (284, '南阳', 17, 'n', 'ny', 'nanyang', '', '市', '411300', '0377', 13);
INSERT INTO `youbang_sys_area` VALUES (285, '商丘', 17, 's', 'sq', 'shangqiu', '', '市', '411400', '0370', 14);
INSERT INTO `youbang_sys_area` VALUES (286, '信阳', 17, 'x', 'xy', 'xinyang', '', '市', '411500', '0376', 15);
INSERT INTO `youbang_sys_area` VALUES (287, '周口', 17, 'z', 'zk', 'zhoukou', '', '市', '411600', '0394', 16);
INSERT INTO `youbang_sys_area` VALUES (288, '驻马店', 17, 'z', 'zmd', 'zhumadian', '', '市', '411700', '0396', 17);
INSERT INTO `youbang_sys_area` VALUES (289, '济源', 17, 'j', 'jy', 'jiyuan', '', '市', '419001', '0391', 18);
INSERT INTO `youbang_sys_area` VALUES (290, '武汉', 18, 'w', 'wh', 'wuhan', '', '市', '420100', '027', 1);
INSERT INTO `youbang_sys_area` VALUES (291, '黄石', 18, 'h', 'hs', 'huangshi', '', '市', '420200', '0714', 2);
INSERT INTO `youbang_sys_area` VALUES (292, '十堰', 18, 's', 'sy', 'shiyan', '', '市', '420300', '0719', 3);
INSERT INTO `youbang_sys_area` VALUES (293, '宜昌', 18, 'y', 'yc', 'yichang', '', '市', '420500', '0717', 4);
INSERT INTO `youbang_sys_area` VALUES (294, '襄阳', 18, 'x', 'xy', 'xiangyang', '', '市', '420600', '0710', 5);
INSERT INTO `youbang_sys_area` VALUES (295, '鄂州', 18, 'e', 'ez', 'ezhou', '', '市', '420700', '', 6);
INSERT INTO `youbang_sys_area` VALUES (296, '荆门', 18, 'j', 'jm', 'jingmen', '', '市', '420800', '0724', 7);
INSERT INTO `youbang_sys_area` VALUES (297, '孝感', 18, 'x', 'xg', 'xiaogan', '', '市', '420900', '0712', 8);
INSERT INTO `youbang_sys_area` VALUES (298, '荆州', 18, 'j', 'jz', 'jingzhou', '', '市', '421000', '0716', 9);
INSERT INTO `youbang_sys_area` VALUES (299, '黄冈', 18, 'h', 'hg', 'huanggang', '', '市', '421100', '0713', 10);
INSERT INTO `youbang_sys_area` VALUES (300, '咸宁', 18, 'x', 'xn', 'xianning', '', '市', '421200', '0715', 11);
INSERT INTO `youbang_sys_area` VALUES (301, '随州', 18, 's', 'sz', 'suizhou', '', '市', '421300', '0722', 12);
INSERT INTO `youbang_sys_area` VALUES (302, '恩施', 18, 'e', 'es', 'enshi', '土家族苗族', '自治州', '422800', '0718', 13);
INSERT INTO `youbang_sys_area` VALUES (303, '仙桃', 18, 'x', 'xt', 'xiantao', '', '市', '429004', '0728', 14);
INSERT INTO `youbang_sys_area` VALUES (304, '潜江', 18, 'q', 'qj', 'qianjiang', '', '市', '429005', '0728', 15);
INSERT INTO `youbang_sys_area` VALUES (305, '天门', 18, 't', 'tm', 'tianmen', '', '市', '429006', '0728', 16);
INSERT INTO `youbang_sys_area` VALUES (306, '神农架林区', 18, 's', 'snjlq', 'shennongjialinqu', '', '', '429021', '0719', 17);
INSERT INTO `youbang_sys_area` VALUES (307, '长沙', 19, 'c', 'cs', 'changsha', '', '市', '430100', '0731', 1);
INSERT INTO `youbang_sys_area` VALUES (308, '株洲', 19, 'z', 'zz', 'zhuzhou', '', '市', '430200', '0731', 2);
INSERT INTO `youbang_sys_area` VALUES (309, '湘潭', 19, 'x', 'xt', 'xiangtan', '', '市', '430300', '0731', 3);
INSERT INTO `youbang_sys_area` VALUES (310, '衡阳', 19, 'h', 'hy', 'hengyang', '', '市', '430400', '0734', 4);
INSERT INTO `youbang_sys_area` VALUES (311, '邵阳', 19, 's', 'sy', 'shaoyang', '', '市', '430500', '0739', 5);
INSERT INTO `youbang_sys_area` VALUES (312, '岳阳', 19, 'y', 'yy', 'yueyang', '', '市', '430600', '0730', 6);
INSERT INTO `youbang_sys_area` VALUES (313, '常德', 19, 'c', 'cd', 'changde', '', '市', '430700', '0736', 7);
INSERT INTO `youbang_sys_area` VALUES (314, '张家界', 19, 'z', 'zjj', 'zhangjiajie', '', '市', '430800', '0744', 8);
INSERT INTO `youbang_sys_area` VALUES (315, '益阳', 19, 'y', 'yy', 'yiyang', '', '市', '430900', '0737', 9);
INSERT INTO `youbang_sys_area` VALUES (316, '郴州', 19, 'c', 'cz', 'chenzhou', '', '市', '431000', '0735', 10);
INSERT INTO `youbang_sys_area` VALUES (317, '永州', 19, 'y', 'yz', 'yongzhou', '', '市', '431100', '0746', 11);
INSERT INTO `youbang_sys_area` VALUES (318, '怀化', 19, 'h', 'hh', 'huaihua', '', '市', '431200', '0745', 12);
INSERT INTO `youbang_sys_area` VALUES (319, '娄底', 19, 'l', 'ld', 'loudi', '', '市', '431300', '0738', 13);
INSERT INTO `youbang_sys_area` VALUES (320, '湘西', 19, 'x', 'xx', 'xiangxi', '土家族苗族', '自治州', '433100', '0743', 14);
INSERT INTO `youbang_sys_area` VALUES (321, '广州', 20, 'g', 'gz', 'guangzhou', '', '市', '440100', '020', 1);
INSERT INTO `youbang_sys_area` VALUES (322, '韶关', 20, 's', 'sg', 'shaoguan', '', '市', '440200', '0751', 2);
INSERT INTO `youbang_sys_area` VALUES (323, '深圳', 20, 's', 'sz', 'shenzhen', '', '市', '440300', '0755', 3);
INSERT INTO `youbang_sys_area` VALUES (324, '珠海', 20, 'z', 'zh', 'zhuhai', '', '市', '440400', '0756', 4);
INSERT INTO `youbang_sys_area` VALUES (325, '汕头', 20, 's', 'st', 'shantou', '', '市', '440500', '0754', 5);
INSERT INTO `youbang_sys_area` VALUES (326, '佛山', 20, 'f', 'fs', 'foshan', '', '市', '440600', '0757', 6);
INSERT INTO `youbang_sys_area` VALUES (327, '江门', 20, 'j', 'jm', 'jiangmen', '', '市', '440700', '0750', 7);
INSERT INTO `youbang_sys_area` VALUES (328, '湛江', 20, 'z', 'zj', 'zhanjiang', '', '市', '440800', '0759', 8);
INSERT INTO `youbang_sys_area` VALUES (329, '茂名', 20, 'm', 'mm', 'maoming', '', '市', '440900', '0668', 9);
INSERT INTO `youbang_sys_area` VALUES (330, '肇庆', 20, 'z', 'zq', 'zhaoqing', '', '市', '441200', '0758', 10);
INSERT INTO `youbang_sys_area` VALUES (331, '惠州', 20, 'h', 'hz', 'huizhou', '', '市', '441300', '0752', 11);
INSERT INTO `youbang_sys_area` VALUES (332, '梅州', 20, 'm', 'mz', 'meizhou', '', '市', '441400', '0753', 12);
INSERT INTO `youbang_sys_area` VALUES (333, '汕尾', 20, 's', 'sw', 'shanwei', '', '市', '441500', '0660', 13);
INSERT INTO `youbang_sys_area` VALUES (334, '河源', 20, 'h', 'hy', 'heyuan', '', '市', '441600', '0762', 14);
INSERT INTO `youbang_sys_area` VALUES (335, '阳江', 20, 'y', 'yj', 'yangjiang', '', '市', '441700', '0662', 15);
INSERT INTO `youbang_sys_area` VALUES (336, '清远', 20, 'q', 'qy', 'qingyuan', '', '市', '441800', '0763', 16);
INSERT INTO `youbang_sys_area` VALUES (337, '东莞', 20, 'd', 'dg', 'dongguan', '', '市', '441900', '0769', 17);
INSERT INTO `youbang_sys_area` VALUES (338, '中山', 20, 'z', 'zs', 'zhongshan', '', '市', '442000', '0760', 18);
INSERT INTO `youbang_sys_area` VALUES (339, '潮州', 20, 'c', 'cz', 'chaozhou', '', '市', '445100', '0768', 19);
INSERT INTO `youbang_sys_area` VALUES (340, '揭阳', 20, 'j', 'jy', 'jieyang', '', '市', '445200', '0663', 20);
INSERT INTO `youbang_sys_area` VALUES (341, '云浮', 20, 'y', 'yf', 'yunfu', '', '市', '445300', '0766', 21);
INSERT INTO `youbang_sys_area` VALUES (342, '南宁', 21, 'n', 'nn', 'nanning', '', '市', '450100', '0771', 1);
INSERT INTO `youbang_sys_area` VALUES (343, '柳州', 21, 'l', 'lz', 'liuzhou', '', '市', '450200', '0772', 2);
INSERT INTO `youbang_sys_area` VALUES (344, '桂林', 21, 'g', 'gl', 'guilin', '', '市', '450300', '0773', 3);
INSERT INTO `youbang_sys_area` VALUES (345, '梧州', 21, 'w', 'wz', 'wuzhou', '', '市', '450400', '0774', 4);
INSERT INTO `youbang_sys_area` VALUES (346, '北海', 21, 'b', 'bh', 'beihai', '', '市', '450500', '0779', 5);
INSERT INTO `youbang_sys_area` VALUES (347, '防城港', 21, 'f', 'fcg', 'fangchenggang', '', '市', '450600', '0770', 6);
INSERT INTO `youbang_sys_area` VALUES (348, '钦州', 21, 'q', 'qz', 'qinzhou', '', '市', '450700', '0777', 7);
INSERT INTO `youbang_sys_area` VALUES (349, '贵港', 21, 'g', 'gg', 'guigang', '', '市', '450800', '0775', 8);
INSERT INTO `youbang_sys_area` VALUES (350, '玉林', 21, 'y', 'yl', 'yulin', '', '市', '450900', '0775', 9);
INSERT INTO `youbang_sys_area` VALUES (351, '百色', 21, 'b', 'bs', 'baise', '', '市', '451000', '0776', 10);
INSERT INTO `youbang_sys_area` VALUES (352, '贺州', 21, 'h', 'hz', 'hezhou', '', '市', '451100', '0774', 11);
INSERT INTO `youbang_sys_area` VALUES (353, '河池', 21, 'h', 'hc', 'hechi', '', '市', '451200', '0778', 12);
INSERT INTO `youbang_sys_area` VALUES (354, '来宾', 21, 'l', 'lb', 'laibin', '', '市', '451300', '0772', 13);
INSERT INTO `youbang_sys_area` VALUES (355, '崇左', 21, 'c', 'cz', 'chongzuo', '', '市', '451400', '0771', 14);
INSERT INTO `youbang_sys_area` VALUES (356, '海口', 22, 'h', 'hk', 'haikou', '', '市', '460100', '0898', 1);
INSERT INTO `youbang_sys_area` VALUES (357, '三亚', 22, 's', 'sy', 'sanya', '', '市', '460200', '0898', 2);
INSERT INTO `youbang_sys_area` VALUES (358, '三沙', 22, 's', 'ss', 'sansha', '', '市', '460300', '0898', 3);
INSERT INTO `youbang_sys_area` VALUES (359, '五指山', 22, 'w', 'wzs', 'wuzhishan', '', '市', '469001', '0898', 4);
INSERT INTO `youbang_sys_area` VALUES (360, '琼海', 22, 'q', 'qh', 'qionghai', '', '市', '469002', '0898', 5);
INSERT INTO `youbang_sys_area` VALUES (361, '儋州', 22, 'd', 'dz', 'danzhou', '', '市', '460400', '0898', 6);
INSERT INTO `youbang_sys_area` VALUES (362, '文昌', 22, 'w', 'wc', 'wenchang', '', '市', '469005', '0898', 7);
INSERT INTO `youbang_sys_area` VALUES (363, '万宁', 22, 'w', 'wn', 'wanning', '', '市', '469006', '0898', 8);
INSERT INTO `youbang_sys_area` VALUES (364, '东方', 22, 'd', 'df', 'dongfang', '', '市', '469007', '0898', 9);
INSERT INTO `youbang_sys_area` VALUES (365, '定安', 22, 'd', 'da', 'dingan', '', '县', '469025', '0898', 10);
INSERT INTO `youbang_sys_area` VALUES (366, '屯昌', 22, 't', 'tc', 'tunchang', '', '县', '469026', '0898', 11);
INSERT INTO `youbang_sys_area` VALUES (367, '澄迈', 22, 'c', 'cm', 'chengmai', '', '县', '469027', '0898', 12);
INSERT INTO `youbang_sys_area` VALUES (368, '临高', 22, 'l', 'lg', 'lingao', '', '县', '469028', '0898', 13);
INSERT INTO `youbang_sys_area` VALUES (369, '白沙', 22, 'b', 'bs', 'baisha', '黎族', '自治县', '469030', '0898', 14);
INSERT INTO `youbang_sys_area` VALUES (370, '昌江', 22, 'c', 'cj', 'changjiang', '黎族', '自治县', '469031', '0898', 15);
INSERT INTO `youbang_sys_area` VALUES (371, '乐东', 22, 'l', 'ld', 'ledong', '黎族', '自治县', '469033', '0898', 16);
INSERT INTO `youbang_sys_area` VALUES (372, '陵水', 22, 'l', 'ls', 'lingshui', '黎族', '自治县', '469034', '0898', 17);
INSERT INTO `youbang_sys_area` VALUES (373, '保亭', 22, 'b', 'bt', 'baoting', '黎族苗族', '自治县', '469035', '0898', 18);
INSERT INTO `youbang_sys_area` VALUES (374, '琼中', 22, 'q', 'qz', 'qiongzhong', '黎族苗族', '自治县', '469036', '0898', 19);
INSERT INTO `youbang_sys_area` VALUES (375, '成都', 23, 'c', 'cd', 'chengdu', '', '市', '510100', '028', 1);
INSERT INTO `youbang_sys_area` VALUES (376, '自贡', 23, 'z', 'zg', 'zigong', '', '市', '510300', '0813', 2);
INSERT INTO `youbang_sys_area` VALUES (377, '攀枝花', 23, 'p', 'pzh', 'panzhihua', '', '市', '510400', '0812', 3);
INSERT INTO `youbang_sys_area` VALUES (378, '泸州', 23, 'l', 'lz', 'luzhou', '', '市', '510500', '0830', 4);
INSERT INTO `youbang_sys_area` VALUES (379, '德阳', 23, 'd', 'dy', 'deyang', '', '市', '510600', '0838', 5);
INSERT INTO `youbang_sys_area` VALUES (380, '绵阳', 23, 'm', 'my', 'mianyang', '', '市', '510700', '0816', 6);
INSERT INTO `youbang_sys_area` VALUES (381, '广元', 23, 'g', 'gy', 'guangyuan', '', '市', '510800', '0839', 7);
INSERT INTO `youbang_sys_area` VALUES (382, '遂宁', 23, 's', 'sn', 'suining', '', '市', '510900', '0825', 8);
INSERT INTO `youbang_sys_area` VALUES (383, '内江', 23, 'n', 'nj', 'neijiang', '', '市', '511000', '', 9);
INSERT INTO `youbang_sys_area` VALUES (384, '乐山', 23, 'l', 'ls', 'leshan', '', '市', '511100', '0833', 10);
INSERT INTO `youbang_sys_area` VALUES (385, '南充', 23, 'n', 'nc', 'nanchong', '', '市', '511300', '0817', 11);
INSERT INTO `youbang_sys_area` VALUES (386, '眉山', 23, 'm', 'ms', 'meishan', '', '市', '511400', '028', 12);
INSERT INTO `youbang_sys_area` VALUES (387, '宜宾', 23, 'y', 'yb', 'yibin', '', '市', '511500', '0831', 13);
INSERT INTO `youbang_sys_area` VALUES (388, '广安', 23, 'g', 'ga', 'guangan', '', '市', '511600', '0826', 14);
INSERT INTO `youbang_sys_area` VALUES (389, '达州', 23, 'd', 'dz', 'dazhou', '', '市', '511700', '0818', 15);
INSERT INTO `youbang_sys_area` VALUES (390, '雅安', 23, 'y', 'ya', 'yaan', '', '市', '511800', '0835', 16);
INSERT INTO `youbang_sys_area` VALUES (391, '巴中', 23, 'b', 'bz', 'bazhong', '', '市', '511900', '0827', 17);
INSERT INTO `youbang_sys_area` VALUES (392, '资阳', 23, 'z', 'zy', 'ziyang', '', '市', '512000', '028', 18);
INSERT INTO `youbang_sys_area` VALUES (393, '阿坝', 23, 'a', 'ab', 'aba', '藏族羌族', '自治州', '513200', '0837', 19);
INSERT INTO `youbang_sys_area` VALUES (394, '甘孜', 23, 'g', 'gz', 'ganzi', '藏族', '自治州', '513300', '0836', 20);
INSERT INTO `youbang_sys_area` VALUES (395, '凉山', 23, 'l', 'ls', 'liangshan', '彝族', '自治州', '615000', '0834', 21);
INSERT INTO `youbang_sys_area` VALUES (396, '贵阳', 24, 'g', 'gy', 'guiyang', '', '市', '520100', '0851', 1);
INSERT INTO `youbang_sys_area` VALUES (397, '六盘水', 24, 'l', 'lps', 'liupanshui', '', '市', '520200', '0858', 2);
INSERT INTO `youbang_sys_area` VALUES (398, '遵义', 24, 'z', 'zy', 'zunyi', '', '市', '520300', '0852', 3);
INSERT INTO `youbang_sys_area` VALUES (399, '安顺', 24, 'a', 'as', 'anshun', '', '市', '520400', '0853', 4);
INSERT INTO `youbang_sys_area` VALUES (400, '毕节', 24, 'b', 'bj', 'bijie', '', '市', '520500', '0857', 5);
INSERT INTO `youbang_sys_area` VALUES (401, '铜仁', 24, 't', 'tr', 'tongren', '', '市', '520600', '0856', 6);
INSERT INTO `youbang_sys_area` VALUES (402, '黔西南', 24, 'q', 'qxn', 'qianxinan', '布依族苗族', '自治州', '522300', '0859', 7);
INSERT INTO `youbang_sys_area` VALUES (403, '黔东南', 24, 'q', 'qdn', 'qiandongnan', '苗族侗族', '自治州', '522600', '0855', 8);
INSERT INTO `youbang_sys_area` VALUES (404, '黔南', 24, 'q', 'qn', 'qiannan', '布依族苗族', '自治州', '522700', '0854', 9);
INSERT INTO `youbang_sys_area` VALUES (405, '昆明', 25, 'k', 'km', 'kunming', '', '市', '530100', '0871', 1);
INSERT INTO `youbang_sys_area` VALUES (406, '曲靖', 25, 'q', 'qj', 'qujing', '', '市', '530300', '0874', 2);
INSERT INTO `youbang_sys_area` VALUES (407, '玉溪', 25, 'y', 'yx', 'yuxi', '', '市', '530400', '0877', 3);
INSERT INTO `youbang_sys_area` VALUES (408, '昭通', 25, 'z', 'zt', 'zhaotong', '', '市', '530600', '0870', 4);
INSERT INTO `youbang_sys_area` VALUES (409, '丽江', 25, 'l', 'lj', 'lijiang', '', '市', '530700', '0888', 5);
INSERT INTO `youbang_sys_area` VALUES (410, '普洱', 25, 'p', 'pe', 'puer', '', '市', '530800', '0879', 6);
INSERT INTO `youbang_sys_area` VALUES (411, '临沧', 25, 'l', 'lc', 'lincang', '', '市', '530900', '0883', 7);
INSERT INTO `youbang_sys_area` VALUES (412, '楚雄', 25, 'c', 'cx', 'chuxiong', '彝族', '自治州', '532300', '0878', 8);
INSERT INTO `youbang_sys_area` VALUES (413, '红河', 25, 'h', 'hh', 'honghe', '哈尼族彝族', '自治州', '532500', '0873', 9);
INSERT INTO `youbang_sys_area` VALUES (414, '文山', 25, 'w', 'ws', 'wenshan', '壮族苗族', '自治州', '532600', '0876', 10);
INSERT INTO `youbang_sys_area` VALUES (415, '西双版纳', 25, 'x', 'xsbn', 'xishuangbanna', '傣族', '自治州', '532800', '0691', 11);
INSERT INTO `youbang_sys_area` VALUES (416, '大理', 25, 'd', 'dl', 'dali', '白族', '自治州', '532900', '0872', 12);
INSERT INTO `youbang_sys_area` VALUES (417, '德宏', 25, 'd', 'dh', 'dehong', '傣族景颇族', '自治州', '533100', '0692', 13);
INSERT INTO `youbang_sys_area` VALUES (418, '怒江', 25, 'n', 'nj', 'nujiang', '傈僳族', '自治州', '533300', '0886', 14);
INSERT INTO `youbang_sys_area` VALUES (419, '迪庆', 25, 'd', 'dq', 'diqing', '藏族', '自治州', '533400', '0887', 15);
INSERT INTO `youbang_sys_area` VALUES (420, '保山', 25, 'b', 'bs', 'baoshan', '', '市', '678000', '0875', 16);
INSERT INTO `youbang_sys_area` VALUES (421, '拉萨', 26, 'l', 'ls', 'lasa', '', '市', '540100', '0891', 1);
INSERT INTO `youbang_sys_area` VALUES (422, '昌都', 26, 'c', 'cd', 'changdu', '', '市', '542100', '0895', 2);
INSERT INTO `youbang_sys_area` VALUES (423, '山南', 26, 's', 'sn', 'shannan', '', '市', '542200', '0893', 3);
INSERT INTO `youbang_sys_area` VALUES (424, '日喀则', 26, 'r', 'rkz', 'rikaze', '', '市', '542300', '0892', 4);
INSERT INTO `youbang_sys_area` VALUES (425, '那曲', 26, 'n', 'nq', 'neiqu', '', '市', '540600', '0896', 5);
INSERT INTO `youbang_sys_area` VALUES (426, '阿里', 26, 'a', 'al', 'ali', '', '地区', '542500', '0897', 6);
INSERT INTO `youbang_sys_area` VALUES (427, '林芝', 26, 'l', 'lz', 'linzhi', '', '市', '540400', '0894', 7);
INSERT INTO `youbang_sys_area` VALUES (428, '西安', 27, 'x', 'xa', 'xian', '', '市', '610100', '029', 1);
INSERT INTO `youbang_sys_area` VALUES (429, '铜川', 27, 't', 'tc', 'tongchuan', '', '市', '610200', '0919', 2);
INSERT INTO `youbang_sys_area` VALUES (430, '宝鸡', 27, 'b', 'bj', 'baoji', '', '市', '610300', '0917', 3);
INSERT INTO `youbang_sys_area` VALUES (431, '咸阳', 27, 'x', 'xy', 'xianyang', '', '市', '610400', '029', 4);
INSERT INTO `youbang_sys_area` VALUES (432, '渭南', 27, 'w', 'wn', 'weinan', '', '市', '610500', '0913', 5);
INSERT INTO `youbang_sys_area` VALUES (433, '延安', 27, 'y', 'ya', 'yanan', '', '市', '610600', '0911', 6);
INSERT INTO `youbang_sys_area` VALUES (434, '汉中', 27, 'h', 'hz', 'hanzhong', '', '市', '610700', '0916', 7);
INSERT INTO `youbang_sys_area` VALUES (435, '榆林', 27, 'y', 'yl', 'yulin', '', '市', '610800', '0912', 8);
INSERT INTO `youbang_sys_area` VALUES (436, '安康', 27, 'a', 'ak', 'ankang', '', '市', '610900', '0915', 9);
INSERT INTO `youbang_sys_area` VALUES (437, '商洛', 27, 's', 'sl', 'shangluo', '', '市', '611000', '0914', 10);
INSERT INTO `youbang_sys_area` VALUES (438, '兰州', 28, 'l', 'lz', 'lanzhou', '', '市', '620100', '0931', 1);
INSERT INTO `youbang_sys_area` VALUES (439, '嘉峪关', 28, 'j', 'jyg', 'jiayuguan', '', '市', '620200', '0937', 2);
INSERT INTO `youbang_sys_area` VALUES (440, '金昌', 28, 'j', 'jc', 'jinchang', '', '市', '620300', '0935', 3);
INSERT INTO `youbang_sys_area` VALUES (441, '白银', 28, 'b', 'by', 'baiyin', '', '市', '620400', '0943', 4);
INSERT INTO `youbang_sys_area` VALUES (442, '天水', 28, 't', 'ts', 'tianshui', '', '市', '620500', '0938', 5);
INSERT INTO `youbang_sys_area` VALUES (443, '武威', 28, 'w', 'ww', 'wuwei', '', '市', '620600', '0935', 6);
INSERT INTO `youbang_sys_area` VALUES (444, '张掖', 28, 'z', 'zy', 'zhangye', '', '市', '620700', '0936', 7);
INSERT INTO `youbang_sys_area` VALUES (445, '平凉', 28, 'p', 'pl', 'pingliang', '', '市', '620800', '0933', 8);
INSERT INTO `youbang_sys_area` VALUES (446, '酒泉', 28, 'j', 'jq', 'jiuquan', '', '市', '620900', '0937', 9);
INSERT INTO `youbang_sys_area` VALUES (447, '庆阳', 28, 'q', 'qy', 'qingyang', '', '市', '621000', '0934', 10);
INSERT INTO `youbang_sys_area` VALUES (448, '定西', 28, 'd', 'dx', 'dingxi', '', '市', '621100', '0932', 11);
INSERT INTO `youbang_sys_area` VALUES (449, '陇南', 28, 'l', 'ln', 'longnan', '', '市', '621200', '0939', 12);
INSERT INTO `youbang_sys_area` VALUES (450, '临夏', 28, 'l', 'lx', 'linxia', '回族', '自治州', '622900', '0930', 13);
INSERT INTO `youbang_sys_area` VALUES (451, '甘南', 28, 'g', 'gn', 'gannan', '藏族', '自治州', '623000', '0941', 14);
INSERT INTO `youbang_sys_area` VALUES (452, '西宁', 29, 'x', 'xn', 'xining', '', '市', '630100', '0971', 1);
INSERT INTO `youbang_sys_area` VALUES (453, '海东', 29, 'h', 'hd', 'haidong', '', '市', '632100', '0972', 2);
INSERT INTO `youbang_sys_area` VALUES (454, '海北', 29, 'h', 'hb', 'haibei', '藏族', '自治州', '632200', '0970', 3);
INSERT INTO `youbang_sys_area` VALUES (455, '黄南', 29, 'h', 'hn', 'huangnan', '藏族', '自治州', '632300', '0973', 4);
INSERT INTO `youbang_sys_area` VALUES (456, '海南', 29, 'h', 'hn', 'hainan', '藏族', '自治州', '632500', '0974', 5);
INSERT INTO `youbang_sys_area` VALUES (457, '果洛', 29, 'g', 'gl', 'guoluo', '藏族', '自治州', '632600', '0975', 6);
INSERT INTO `youbang_sys_area` VALUES (458, '玉树', 29, 'y', 'ys', 'yushu', '藏族', '自治州', '632700', '0976', 7);
INSERT INTO `youbang_sys_area` VALUES (459, '海西', 29, 'h', 'hx', 'haixi', '蒙古族藏族', '自治州', '632800', '0977', 8);
INSERT INTO `youbang_sys_area` VALUES (460, '银川', 30, 'y', 'yc', 'yinchuan', '', '市', '640100', '0951', 1);
INSERT INTO `youbang_sys_area` VALUES (461, '石嘴山', 30, 's', 'szs', 'shizuishan', '', '市', '640200', '0952', 2);
INSERT INTO `youbang_sys_area` VALUES (462, '吴忠', 30, 'w', 'wz', 'wuzhong', '', '市', '640300', '0953', 3);
INSERT INTO `youbang_sys_area` VALUES (463, '固原', 30, 'g', 'gy', 'guyuan', '', '市', '640400', '0954', 4);
INSERT INTO `youbang_sys_area` VALUES (464, '中卫', 30, 'z', 'zw', 'zhongwei', '', '市', '640500', '', 5);
INSERT INTO `youbang_sys_area` VALUES (465, '乌鲁木齐', 31, 'w', 'wlmq', 'wulumuqi', '', '市', '650100', '0991', 1);
INSERT INTO `youbang_sys_area` VALUES (466, '克拉玛依', 31, 'k', 'klmy', 'kelamayi', '', '市', '650200', '0990', 2);
INSERT INTO `youbang_sys_area` VALUES (467, '吐鲁番', 31, 't', 'tlf', 'tulufan', '', '市', '652100', '0995', 3);
INSERT INTO `youbang_sys_area` VALUES (468, '哈密', 31, 'h', 'hm', 'hami', '', '市', '652200', '0902', 4);
INSERT INTO `youbang_sys_area` VALUES (469, '昌吉', 31, 'c', 'cj', 'changji', '', '自治州', '652300', '0994', 5);
INSERT INTO `youbang_sys_area` VALUES (470, '博尔塔拉', 31, 'b', 'betl', 'boertala', '蒙古', '自治州', '652700', '0909', 6);
INSERT INTO `youbang_sys_area` VALUES (471, '巴音郭楞', 31, 'b', 'bygl', 'bayinguoleng', '蒙古', '自治州', '652800', '0996', 7);
INSERT INTO `youbang_sys_area` VALUES (472, '阿克苏', 31, 'a', 'aks', 'akesu', '柯尔克孜', '地区', '652900', '0997', 8);
INSERT INTO `youbang_sys_area` VALUES (473, '克孜勒苏', 31, 'k', 'kzls', 'kezilesu', '', '自治州', '653000', '0908', 9);
INSERT INTO `youbang_sys_area` VALUES (474, '喀什', 31, 'k', 'ks', 'kashi', '', '地区', '653100', '0998', 10);
INSERT INTO `youbang_sys_area` VALUES (475, '和田', 31, 'h', 'ht', 'hetian', '哈萨克', '地区', '653200', '0903', 11);
INSERT INTO `youbang_sys_area` VALUES (476, '伊犁', 31, 'y', 'yl', 'yili', '', '自治州', '654000', '0999', 12);
INSERT INTO `youbang_sys_area` VALUES (477, '塔城', 31, 't', 'tc', 'tacheng', '', '地区', '654200', '0901', 13);
INSERT INTO `youbang_sys_area` VALUES (478, '阿勒泰', 31, 'a', 'alt', 'aletai', '', '地区', '654300', '0906', 14);
INSERT INTO `youbang_sys_area` VALUES (479, '石河子', 31, 's', 'shz', 'shihezi', '', '市', '659001', '0993', 15);
INSERT INTO `youbang_sys_area` VALUES (480, '阿拉尔', 31, 'a', 'ale', 'alaer', '', '市', '659002', '0997', 16);
INSERT INTO `youbang_sys_area` VALUES (481, '图木舒克', 31, 't', 'tmsk', 'tumushuke', '', '市', '659003', '0998', 17);
INSERT INTO `youbang_sys_area` VALUES (482, '五家渠', 31, 'w', 'wjq', 'wujiaqu', '', '市', '659004', '0994', 18);
INSERT INTO `youbang_sys_area` VALUES (483, '北屯', 31, 'b', 'bt', 'beitun', '', '市', '659005', '0906', 19);
INSERT INTO `youbang_sys_area` VALUES (484, '铁门关', 31, 't', 'tmg', 'tiemenguan', '', '市', '659006', '0996', 20);
INSERT INTO `youbang_sys_area` VALUES (485, '台北', 32, 't', 'tb', 'taibei', '', '市', '63', '02', 1);
INSERT INTO `youbang_sys_area` VALUES (486, '高雄', 32, 'g', 'gx', 'gaoxiong', '', '市', '64', '07', 2);
INSERT INTO `youbang_sys_area` VALUES (487, '基隆', 32, 'j', 'jl', 'jilong', '', '市', '10017', '02', 3);
INSERT INTO `youbang_sys_area` VALUES (488, '台中', 32, 't', 'tz', 'taizhong', '', '市', '10019', '04', 4);
INSERT INTO `youbang_sys_area` VALUES (489, '台南', 32, 't', 'tn', 'tainan', '', '市', '10021', '06', 5);
INSERT INTO `youbang_sys_area` VALUES (490, '新竹', 32, 'x', 'xz', 'xinzhu', '', '市', '10018', '', 6);
INSERT INTO `youbang_sys_area` VALUES (491, '嘉义', 32, 'j', 'jy', 'jiayi', '', '市', '10020', '05', 7);
INSERT INTO `youbang_sys_area` VALUES (492, '新北', 32, 'x', 'xb', 'xinbei', '', '市', '', '', 8);
INSERT INTO `youbang_sys_area` VALUES (493, '宜兰', 32, 'y', 'yl', 'yilan', '', '县', '10002', '', 9);
INSERT INTO `youbang_sys_area` VALUES (494, '桃园', 32, 't', 'ty', 'taoyuan', '', '县', '10003', '', 10);
INSERT INTO `youbang_sys_area` VALUES (495, '新竹', 32, 'x', 'xz', 'xinzhu', '', '县', '10004', '', 11);
INSERT INTO `youbang_sys_area` VALUES (496, '苗栗', 32, 'm', 'ml', 'miaoli', '', '县', '10005', '', 12);
INSERT INTO `youbang_sys_area` VALUES (497, '彰化', 32, 'z', 'zh', 'zhanghua', '', '县', '10007', '', 13);
INSERT INTO `youbang_sys_area` VALUES (498, '南投', 32, 'n', 'nt', 'nantou', '', '县', '10008', '', 14);
INSERT INTO `youbang_sys_area` VALUES (499, '云林', 32, 'y', 'yl', 'yunlin', '', '县', '10009', '', 15);
INSERT INTO `youbang_sys_area` VALUES (500, '嘉义', 32, 'j', 'jy', 'jiayi', '', '县', '10020', '', 16);
INSERT INTO `youbang_sys_area` VALUES (501, '屏东', 32, 'p', 'pd', 'pingdong', '', '县', '10013', '', 17);
INSERT INTO `youbang_sys_area` VALUES (502, '台东', 32, 't', 'td', 'taidong', '', '县', '10014', '', 18);
INSERT INTO `youbang_sys_area` VALUES (503, '花莲', 32, 'h', 'hl', 'hualian', '', '县', '10015', '', 19);
INSERT INTO `youbang_sys_area` VALUES (504, '澎湖', 32, 'p', 'ph', 'penghu', '', '县', '10016', '07', 20);
INSERT INTO `youbang_sys_area` VALUES (505, '连江', 32, 'l', 'lj', 'lianjiang', '', '县', '', '', 21);
INSERT INTO `youbang_sys_area` VALUES (506, '金门', 32, 'j', 'jm', 'jinmen', '', '县', '', '', 22);
INSERT INTO `youbang_sys_area` VALUES (507, '中西', 33, 'z', 'zx', 'zhongxi', '', '区', '', '852', 1);
INSERT INTO `youbang_sys_area` VALUES (508, '葵青', 33, 'k', 'kq', 'kuiqing', '', '区', '', '852', 2);
INSERT INTO `youbang_sys_area` VALUES (509, '元朗', 33, 'y', 'yl', 'yuanlang', '', '区', '', '852', 3);
INSERT INTO `youbang_sys_area` VALUES (510, '屯门', 33, 't', 'tm', 'tunmen', '', '区', '', '852', 4);
INSERT INTO `youbang_sys_area` VALUES (511, '荃湾', 33, 'q', 'qw', 'quanwan', '', '区', '', '852', 5);
INSERT INTO `youbang_sys_area` VALUES (512, '西贡', 33, 'x', 'xg', 'xigong', '', '区', '', '852', 6);
INSERT INTO `youbang_sys_area` VALUES (513, '沙田', 33, 's', 'st', 'shatian', '', '区', '', '852', 7);
INSERT INTO `youbang_sys_area` VALUES (514, '大埔', 33, 'd', 'dp', 'dapu', '', '区', '', '852', 8);
INSERT INTO `youbang_sys_area` VALUES (515, '北区', 33, 'b', 'bq', 'beiqu', '', '', '', '852', 9);
INSERT INTO `youbang_sys_area` VALUES (516, '观塘', 33, 'g', 'gt', 'guantang', '', '区', '', '852', 10);
INSERT INTO `youbang_sys_area` VALUES (517, '黄大仙', 33, 'h', 'hdx', 'huangdaxian', '', '区', '', '852', 11);
INSERT INTO `youbang_sys_area` VALUES (518, '深水埗', 33, 's', 'ssb', 'shenshuibu', '', '区', '', '852', 12);
INSERT INTO `youbang_sys_area` VALUES (519, '油尖旺', 33, 'y', 'yjw', 'youjianwang', '', '区', '', '852', 13);
INSERT INTO `youbang_sys_area` VALUES (520, '九龙城', 33, 'j', 'jlc', 'jiulongcheng', '', '区', '', '852', 14);
INSERT INTO `youbang_sys_area` VALUES (521, '南区', 33, 'n', 'nq', 'nanqu', '', '', '', '852', 15);
INSERT INTO `youbang_sys_area` VALUES (522, '东区', 33, 'd', 'dq', 'dongqu', '', '', '', '852', 16);
INSERT INTO `youbang_sys_area` VALUES (523, '湾仔', 33, 'w', 'wz', 'wanzi', '', '区', '', '852', 17);
INSERT INTO `youbang_sys_area` VALUES (524, '离岛', 33, 'l', 'ld', 'lidao', '', '区', '', '852', 18);
INSERT INTO `youbang_sys_area` VALUES (525, '花地玛', 34, 'h', 'hdm', 'huadima', '', '堂区', '', '853', 1);
INSERT INTO `youbang_sys_area` VALUES (526, '圣安多', 34, 's', 'sad', 'shenganduo', '', '堂区', '', '853', 2);
INSERT INTO `youbang_sys_area` VALUES (527, '大堂区', 34, 'd', 'dtq', 'datangqu', '', '堂区', '', '853', 3);
INSERT INTO `youbang_sys_area` VALUES (528, '望德', 34, 'w', 'wd', 'wangde', '', '堂区', '', '853', 4);
INSERT INTO `youbang_sys_area` VALUES (529, '风顺', 34, 'f', 'fs', 'fengshun', '', '堂区', '', '853', 5);
INSERT INTO `youbang_sys_area` VALUES (530, '嘉模', 34, 'j', 'jm', 'jiamo', '', '堂区', '', '853', 6);
INSERT INTO `youbang_sys_area` VALUES (531, '圣方济各', 34, 's', 'sfjg', 'shengfangjige', '', '堂区', '', '853', 7);
INSERT INTO `youbang_sys_area` VALUES (532, '路氹城', 34, 'l', 'ldc', 'ludangcheng', '', '', '', '853', 8);
INSERT INTO `youbang_sys_area` VALUES (533, '长安', 125, 'c', 'ca', 'changan', '', '区', '130102', '0311', 1);
INSERT INTO `youbang_sys_area` VALUES (535, '桥西', 125, 'q', 'qx', 'qiaoxi', '', '区', '130104', '0311', 2);
INSERT INTO `youbang_sys_area` VALUES (536, '新华', 125, 'x', 'xh', 'xinhua', '', '区', '130105', '0311', 3);
INSERT INTO `youbang_sys_area` VALUES (537, '井陉矿', 125, 'j', 'jxk', 'jingxingkuang', '', '区', '130107', '0311', 4);
INSERT INTO `youbang_sys_area` VALUES (538, '裕华', 125, 'y', 'yh', 'yuhua', '', '区', '130108', '0311', 5);
INSERT INTO `youbang_sys_area` VALUES (539, '井陉', 125, 'j', 'jx', 'jingxing', '', '县', '130121', '0311', 9);
INSERT INTO `youbang_sys_area` VALUES (540, '正定', 125, 'z', 'zd', 'zhengding', '', '县', '130123', '0311', 10);
INSERT INTO `youbang_sys_area` VALUES (541, '栾城', 125, 'l', 'lc', 'luancheng', '', '区', '130111', '0311', 8);
INSERT INTO `youbang_sys_area` VALUES (542, '行唐', 125, 'x', 'xt', 'xingtang', '', '县', '130125', '0311', 11);
INSERT INTO `youbang_sys_area` VALUES (543, '灵寿', 125, 'l', 'ls', 'lingshou', '', '县', '130126', '0311', 12);
INSERT INTO `youbang_sys_area` VALUES (544, '高邑', 125, 'g', 'gy', 'gaoyi', '', '县', '130127', '0311', 13);
INSERT INTO `youbang_sys_area` VALUES (545, '深泽', 125, 's', 'sz', 'shenze', '', '县', '130128', '0311', 14);
INSERT INTO `youbang_sys_area` VALUES (546, '赞皇', 125, 'z', 'zh', 'zanhuang', '', '县', '130129', '0311', 15);
INSERT INTO `youbang_sys_area` VALUES (547, '无极', 125, 'w', 'wj', 'wuji', '', '县', '130130', '0311', 16);
INSERT INTO `youbang_sys_area` VALUES (548, '平山', 125, 'p', 'ps', 'pingshan', '', '县', '130131', '0311', 17);
INSERT INTO `youbang_sys_area` VALUES (549, '元氏', 125, 'y', 'ys', 'yuanshi', '', '县', '130132', '0311', 18);
INSERT INTO `youbang_sys_area` VALUES (550, '赵县', 125, 'z', 'zx', 'zhaoxian', '', '', '130133', '0311', 19);
INSERT INTO `youbang_sys_area` VALUES (551, '辛集', 125, 'x', 'xj', 'xinji', '', '市', '130181', '0311', 20);
INSERT INTO `youbang_sys_area` VALUES (552, '藁城', 125, 'g', 'gc', 'gaocheng', '', '区', '130109', '0311', 6);
INSERT INTO `youbang_sys_area` VALUES (553, '晋州', 125, 'j', 'jz', 'jinzhou', '', '市', '130183', '0311', 21);
INSERT INTO `youbang_sys_area` VALUES (554, '新乐', 125, 'x', 'xl', 'xinle', '', '市', '130184', '0311', 22);
INSERT INTO `youbang_sys_area` VALUES (555, '鹿泉', 125, 'l', 'lq', 'luquan', '', '区', '130110', '0311', 7);
INSERT INTO `youbang_sys_area` VALUES (556, '路南', 126, 'l', 'ln', 'lunan', '', '区', '130202', '0315', 1);
INSERT INTO `youbang_sys_area` VALUES (557, '路北', 126, 'l', 'lb', 'lubei', '', '区', '130203', '0315', 2);
INSERT INTO `youbang_sys_area` VALUES (558, '古冶', 126, 'g', 'gy', 'guye', '', '区', '130204', '0315', 3);
INSERT INTO `youbang_sys_area` VALUES (559, '开平', 126, 'k', 'kp', 'kaiping', '', '区', '130205', '0315', 4);
INSERT INTO `youbang_sys_area` VALUES (560, '丰南', 126, 'f', 'fn', 'fengnan', '', '区', '130207', '0315', 5);
INSERT INTO `youbang_sys_area` VALUES (561, '丰润', 126, 'f', 'fr', 'fengrun', '', '区', '130208', '0315', 6);
INSERT INTO `youbang_sys_area` VALUES (562, '滦县', 126, 'l', 'lx', 'luanxian', '', '', '130223', '0315', 7);
INSERT INTO `youbang_sys_area` VALUES (563, '滦南', 126, 'l', 'ln', 'luannan', '', '县', '130224', '0315', 8);
INSERT INTO `youbang_sys_area` VALUES (564, '乐亭', 126, 'l', 'lt', 'leting', '', '县', '130225', '0315', 9);
INSERT INTO `youbang_sys_area` VALUES (565, '迁西', 126, 'q', 'qx', 'qianxi', '', '县', '130227', '0315', 10);
INSERT INTO `youbang_sys_area` VALUES (566, '玉田', 126, 'y', 'yt', 'yutian', '', '县', '130229', '0315', 11);
INSERT INTO `youbang_sys_area` VALUES (567, '唐海', 126, 't', 'th', 'tanghai', '', '县', '130230', '0315', 12);
INSERT INTO `youbang_sys_area` VALUES (568, '遵化', 126, 'z', 'zh', 'zunhua', '', '市', '130281', '0315', 13);
INSERT INTO `youbang_sys_area` VALUES (569, '迁安', 126, 'q', 'qa', 'qianan', '', '市', '130283', '0315', 14);
INSERT INTO `youbang_sys_area` VALUES (570, '海港', 127, 'h', 'hg', 'haigang', '', '区', '130302', '0335', 1);
INSERT INTO `youbang_sys_area` VALUES (571, '山海关', 127, 's', 'shg', 'shanhaiguan', '', '区', '130303', '0335', 2);
INSERT INTO `youbang_sys_area` VALUES (572, '北戴河', 127, 'b', 'bdh', 'beidaihe', '', '区', '130304', '0335', 3);
INSERT INTO `youbang_sys_area` VALUES (573, '青龙', 127, 'q', 'ql', 'qinglong', '满族', '自治县', '130321', '0335', 4);
INSERT INTO `youbang_sys_area` VALUES (574, '昌黎', 127, 'c', 'cl', 'changli', '', '县', '130322', '0335', 5);
INSERT INTO `youbang_sys_area` VALUES (575, '抚宁', 127, 'f', 'fn', 'funing', '', '区', '130323', '0335', 6);
INSERT INTO `youbang_sys_area` VALUES (576, '卢龙', 127, 'l', 'll', 'lulong', '', '县', '130324', '0335', 7);
INSERT INTO `youbang_sys_area` VALUES (577, '邯山', 128, 'h', 'hs', 'hanshan', '', '区', '130402', '0310', 1);
INSERT INTO `youbang_sys_area` VALUES (578, '丛台', 128, 'c', 'ct', 'congtai', '', '区', '130403', '0310', 2);
INSERT INTO `youbang_sys_area` VALUES (579, '复兴', 128, 'f', 'fx', 'fuxing', '', '区', '130404', '0310', 3);
INSERT INTO `youbang_sys_area` VALUES (580, '峰峰矿', 128, 'f', 'ffk', 'fengfengkuang', '', '区', '130406', '0310', 4);
INSERT INTO `youbang_sys_area` VALUES (582, '临漳', 128, 'l', 'lz', 'linzhang', '', '县', '130423', '0310', 6);
INSERT INTO `youbang_sys_area` VALUES (583, '成安', 128, 'c', 'ca', 'chengan', '', '县', '130424', '0310', 7);
INSERT INTO `youbang_sys_area` VALUES (584, '大名', 128, 'd', 'dm', 'daming', '', '县', '130425', '0310', 8);
INSERT INTO `youbang_sys_area` VALUES (585, '涉县', 128, 's', 'sx', 'shexian', '', '', '130426', '0310', 9);
INSERT INTO `youbang_sys_area` VALUES (586, '磁县', 128, 'c', 'cx', 'cixian', '', '', '130427', '0310', 10);
INSERT INTO `youbang_sys_area` VALUES (587, '肥乡', 128, 'f', 'fx', 'feixiang', '', '区', '130428', '0310', 11);
INSERT INTO `youbang_sys_area` VALUES (588, '永年', 128, 'y', 'yn', 'yongnian', '', '区', '130429', '0310', 12);
INSERT INTO `youbang_sys_area` VALUES (589, '邱县', 128, 'q', 'qx', 'qiuxian', '', '', '130430', '0310', 13);
INSERT INTO `youbang_sys_area` VALUES (590, '鸡泽', 128, 'j', 'jz', 'jize', '', '县', '130431', '0310', 14);
INSERT INTO `youbang_sys_area` VALUES (591, '广平', 128, 'g', 'gp', 'guangping', '', '县', '130432', '0310', 15);
INSERT INTO `youbang_sys_area` VALUES (592, '馆陶', 128, 'g', 'gt', 'guantao', '', '县', '130433', '0310', 16);
INSERT INTO `youbang_sys_area` VALUES (593, '魏县', 128, 'w', 'wx', 'weixian', '', '', '130434', '0310', 17);
INSERT INTO `youbang_sys_area` VALUES (594, '曲周', 128, 'q', 'qz', 'quzhou', '', '县', '130435', '0310', 18);
INSERT INTO `youbang_sys_area` VALUES (595, '武安', 128, 'w', 'wa', 'wuan', '', '市', '130481', '0310', 19);
INSERT INTO `youbang_sys_area` VALUES (596, '桥东', 129, 'q', 'qd', 'qiaodong', '', '区', '130502', '0319', 1);
INSERT INTO `youbang_sys_area` VALUES (597, '桥西', 129, 'q', 'qx', 'qiaoxi', '', '区', '130503', '0319', 2);
INSERT INTO `youbang_sys_area` VALUES (598, '邢台', 129, 'x', 'xt', 'xingtai', '', '县', '130521', '0319', 3);
INSERT INTO `youbang_sys_area` VALUES (599, '临城', 129, 'l', 'lc', 'lincheng', '', '县', '130522', '0319', 4);
INSERT INTO `youbang_sys_area` VALUES (600, '内丘', 129, 'n', 'nq', 'neiqiu', '', '县', '130523', '0319', 5);
INSERT INTO `youbang_sys_area` VALUES (601, '柏乡', 129, 'b', 'bx', 'boxiang', '', '县', '130524', '0319', 6);
INSERT INTO `youbang_sys_area` VALUES (602, '隆尧', 129, 'l', 'ly', 'longyao', '', '县', '130525', '0319', 7);
INSERT INTO `youbang_sys_area` VALUES (603, '任县', 129, 'r', 'rx', 'renxian', '', '', '130526', '0319', 8);
INSERT INTO `youbang_sys_area` VALUES (604, '南和', 129, 'n', 'nh', 'nanhe', '', '县', '130527', '0319', 9);
INSERT INTO `youbang_sys_area` VALUES (605, '宁晋', 129, 'n', 'nj', 'ningjin', '', '县', '130528', '0319', 10);
INSERT INTO `youbang_sys_area` VALUES (606, '巨鹿', 129, 'j', 'jl', 'julu', '', '县', '130529', '0319', 11);
INSERT INTO `youbang_sys_area` VALUES (607, '新河', 129, 'x', 'xh', 'xinhe', '', '县', '130530', '0319', 12);
INSERT INTO `youbang_sys_area` VALUES (608, '广宗', 129, 'g', 'gz', 'guangzong', '', '县', '130531', '0319', 13);
INSERT INTO `youbang_sys_area` VALUES (609, '平乡', 129, 'p', 'px', 'pingxiang', '', '县', '130532', '0319', 14);
INSERT INTO `youbang_sys_area` VALUES (610, '威县', 129, 'w', 'wx', 'weixian', '', '', '130533', '0319', 15);
INSERT INTO `youbang_sys_area` VALUES (611, '清河', 129, 'q', 'qh', 'qinghe', '', '县', '130534', '0319', 16);
INSERT INTO `youbang_sys_area` VALUES (612, '临西', 129, 'l', 'lx', 'linxi', '', '县', '130535', '0319', 17);
INSERT INTO `youbang_sys_area` VALUES (613, '南宫', 129, 'n', 'ng', 'nangong', '', '市', '130581', '0319', 18);
INSERT INTO `youbang_sys_area` VALUES (614, '沙河', 129, 's', 'sh', 'shahe', '', '市', '130582', '0319', 19);
INSERT INTO `youbang_sys_area` VALUES (615, '竞秀', 130, 'j', 'jx', 'jingxiu', '', '区', '130602', '0312', 1);
INSERT INTO `youbang_sys_area` VALUES (616, '莲池', 130, 'l', 'lc', 'lianchi', '', '区', '130603', '0312', 2);
INSERT INTO `youbang_sys_area` VALUES (618, '满城', 130, 'm', 'mc', 'mancheng', '', '区', '130621', '0312', 4);
INSERT INTO `youbang_sys_area` VALUES (619, '清苑', 130, 'q', 'qy', 'qingyuan', '', '区', '130622', '0312', 5);
INSERT INTO `youbang_sys_area` VALUES (620, '涞水', 130, 'l', 'ls', 'laishui', '', '县', '130623', '0312', 6);
INSERT INTO `youbang_sys_area` VALUES (621, '阜平', 130, 'f', 'fp', 'fuping', '', '县', '130624', '0312', 7);
INSERT INTO `youbang_sys_area` VALUES (622, '徐水', 130, 'x', 'xs', 'xushui', '', '区', '130625', '0312', 8);
INSERT INTO `youbang_sys_area` VALUES (623, '定兴', 130, 'd', 'dx', 'dingxing', '', '县', '130626', '0312', 9);
INSERT INTO `youbang_sys_area` VALUES (624, '唐县', 130, 't', 'tx', 'tangxian', '', '', '130627', '0312', 10);
INSERT INTO `youbang_sys_area` VALUES (625, '高阳', 130, 'g', 'gy', 'gaoyang', '', '县', '130628', '0312', 11);
INSERT INTO `youbang_sys_area` VALUES (626, '容城', 130, 'r', 'rc', 'rongcheng', '', '县', '130629', '0312', 12);
INSERT INTO `youbang_sys_area` VALUES (627, '涞源', 130, 'l', 'ly', 'laiyuan', '', '县', '130630', '0312', 13);
INSERT INTO `youbang_sys_area` VALUES (628, '望都', 130, 'w', 'wd', 'wangdu', '', '县', '130631', '0312', 14);
INSERT INTO `youbang_sys_area` VALUES (629, '安新', 130, 'a', 'ax', 'anxin', '', '县', '130632', '0312', 15);
INSERT INTO `youbang_sys_area` VALUES (630, '易县', 130, 'y', 'yx', 'yixian', '', '', '130633', '0312', 16);
INSERT INTO `youbang_sys_area` VALUES (631, '曲阳', 130, 'q', 'qy', 'quyang', '', '县', '130634', '0312', 17);
INSERT INTO `youbang_sys_area` VALUES (632, '蠡县', 130, 'l', 'lx', 'lixian', '', '', '130635', '0312', 18);
INSERT INTO `youbang_sys_area` VALUES (633, '顺平', 130, 's', 'sp', 'shunping', '', '县', '130636', '0312', 19);
INSERT INTO `youbang_sys_area` VALUES (634, '博野', 130, 'b', 'by', 'boye', '', '县', '130637', '0312', 20);
INSERT INTO `youbang_sys_area` VALUES (635, '雄县', 130, 'x', 'xx', 'xiongxian', '', '', '130638', '0312', 21);
INSERT INTO `youbang_sys_area` VALUES (636, '涿州', 130, 'z', 'zz', 'zhuozhou', '', '市', '130681', '0312', 22);
INSERT INTO `youbang_sys_area` VALUES (637, '定州', 130, 'd', 'dz', 'dingzhou', '', '市', '130682', '0312', 23);
INSERT INTO `youbang_sys_area` VALUES (638, '安国', 130, 'a', 'ag', 'anguo', '', '市', '130683', '0312', 24);
INSERT INTO `youbang_sys_area` VALUES (639, '高碑店', 130, 'g', 'gbd', 'gaobeidian', '', '市', '130684', '0312', 25);
INSERT INTO `youbang_sys_area` VALUES (640, '桥东', 131, 'q', 'qd', 'qiaodong', '', '区', '130702', '0313', 1);
INSERT INTO `youbang_sys_area` VALUES (641, '桥西', 131, 'q', 'qx', 'qiaoxi', '', '区', '130703', '0313', 2);
INSERT INTO `youbang_sys_area` VALUES (642, '宣化', 131, 'x', 'xh', 'xuanhua', '', '区', '130705', '0313', 3);
INSERT INTO `youbang_sys_area` VALUES (643, '下花园', 131, 'x', 'xhy', 'xiahuayuan', '', '区', '130706', '0313', 4);
INSERT INTO `youbang_sys_area` VALUES (645, '张北', 131, 'z', 'zb', 'zhangbei', '', '县', '130722', '0313', 6);
INSERT INTO `youbang_sys_area` VALUES (646, '康保', 131, 'k', 'kb', 'kangbao', '', '县', '130723', '0313', 7);
INSERT INTO `youbang_sys_area` VALUES (647, '沽源', 131, 'g', 'gy', 'guyuan', '', '县', '130724', '0313', 8);
INSERT INTO `youbang_sys_area` VALUES (648, '尚义', 131, 's', 'sy', 'shangyi', '', '县', '130725', '0313', 9);
INSERT INTO `youbang_sys_area` VALUES (649, '蔚县', 131, 'y', 'yx', 'yuxian', '', '', '130726', '0313', 10);
INSERT INTO `youbang_sys_area` VALUES (650, '阳原', 131, 'y', 'yy', 'yangyuan', '', '县', '130727', '0313', 11);
INSERT INTO `youbang_sys_area` VALUES (651, '怀安', 131, 'h', 'ha', 'huaian', '', '县', '130728', '0313', 12);
INSERT INTO `youbang_sys_area` VALUES (652, '万全', 131, 'w', 'wq', 'wanquan', '', '县', '130729', '0313', 13);
INSERT INTO `youbang_sys_area` VALUES (653, '怀来', 131, 'h', 'hl', 'huailai', '', '县', '130730', '0313', 14);
INSERT INTO `youbang_sys_area` VALUES (654, '涿鹿', 131, 'z', 'zl', 'zhuolu', '', '县', '130731', '0313', 15);
INSERT INTO `youbang_sys_area` VALUES (655, '赤城', 131, 'c', 'cc', 'chicheng', '', '县', '130732', '0313', 16);
INSERT INTO `youbang_sys_area` VALUES (656, '崇礼', 131, 'c', 'cl', 'chongli', '', '县', '130733', '0313', 17);
INSERT INTO `youbang_sys_area` VALUES (657, '双桥', 132, 's', 'sq', 'shuangqiao', '', '区', '130802', '0314', 1);
INSERT INTO `youbang_sys_area` VALUES (658, '双滦', 132, 's', 'sl', 'shuangluan', '', '区', '130803', '0314', 2);
INSERT INTO `youbang_sys_area` VALUES (659, '鹰手营子', 132, 'y', 'ysyz', 'yingshouyingzi', '矿', '区', '130804', '0314', 3);
INSERT INTO `youbang_sys_area` VALUES (660, '承德', 132, 'c', 'cd', 'chengde', '', '县', '130821', '0314', 4);
INSERT INTO `youbang_sys_area` VALUES (661, '兴隆', 132, 'x', 'xl', 'xinglong', '', '县', '130822', '0314', 5);
INSERT INTO `youbang_sys_area` VALUES (662, '平泉', 132, 'p', 'pq', 'pingquan', '', '县', '130823', '0314', 6);
INSERT INTO `youbang_sys_area` VALUES (663, '滦平', 132, 'l', 'lp', 'luanping', '', '县', '130824', '0314', 7);
INSERT INTO `youbang_sys_area` VALUES (664, '隆化', 132, 'l', 'lh', 'longhua', '', '县', '130825', '0314', 8);
INSERT INTO `youbang_sys_area` VALUES (665, '丰宁', 132, 'f', 'fn', 'fengning', '满族', '自治县', '130826', '0314', 9);
INSERT INTO `youbang_sys_area` VALUES (666, '宽城', 132, 'k', 'kc', 'kuancheng', '满族', '自治县', '130827', '0314', 10);
INSERT INTO `youbang_sys_area` VALUES (667, '围场', 132, 'w', 'wc', 'weichang', '满族蒙古族', '自治县', '130828', '0314', 11);
INSERT INTO `youbang_sys_area` VALUES (668, '新华', 133, 'x', 'xh', 'xinhua', '', '区', '130902', '0317', 1);
INSERT INTO `youbang_sys_area` VALUES (669, '运河', 133, 'y', 'yh', 'yunhe', '', '区', '130903', '0317', 2);
INSERT INTO `youbang_sys_area` VALUES (670, '沧县', 133, 'c', 'cx', 'cangxian', '', '', '130921', '0317', 3);
INSERT INTO `youbang_sys_area` VALUES (671, '青县', 133, 'q', 'qx', 'qingxian', '', '', '130922', '0317', 4);
INSERT INTO `youbang_sys_area` VALUES (672, '东光', 133, 'd', 'dg', 'dongguang', '', '县', '130923', '0317', 5);
INSERT INTO `youbang_sys_area` VALUES (673, '海兴', 133, 'h', 'hx', 'haixing', '', '县', '130924', '0317', 6);
INSERT INTO `youbang_sys_area` VALUES (674, '盐山', 133, 'y', 'ys', 'yanshan', '', '县', '130925', '0317', 7);
INSERT INTO `youbang_sys_area` VALUES (675, '肃宁', 133, 's', 'sn', 'suning', '', '县', '130926', '0317', 8);
INSERT INTO `youbang_sys_area` VALUES (676, '南皮', 133, 'n', 'np', 'nanpi', '', '县', '130927', '0317', 9);
INSERT INTO `youbang_sys_area` VALUES (677, '吴桥', 133, 'w', 'wq', 'wuqiao', '', '县', '130928', '0317', 10);
INSERT INTO `youbang_sys_area` VALUES (678, '献县', 133, 'x', 'xx', 'xianxian', '', '', '130929', '0317', 11);
INSERT INTO `youbang_sys_area` VALUES (679, '孟村', 133, 'm', 'mc', 'mengcun', '回族', '自治县', '130930', '0317', 12);
INSERT INTO `youbang_sys_area` VALUES (680, '泊头', 133, 'b', 'bt', 'botou', '', '市', '130981', '0317', 13);
INSERT INTO `youbang_sys_area` VALUES (681, '任丘', 133, 'r', 'rq', 'renqiu', '', '市', '130982', '0317', 14);
INSERT INTO `youbang_sys_area` VALUES (682, '黄骅', 133, 'h', 'hh', 'huanghua', '', '市', '130983', '0317', 15);
INSERT INTO `youbang_sys_area` VALUES (683, '河间', 133, 'h', 'hj', 'hejian', '', '市', '130984', '0317', 16);
INSERT INTO `youbang_sys_area` VALUES (684, '安次', 134, 'a', 'ac', 'anci', '', '区', '131002', '0316', 1);
INSERT INTO `youbang_sys_area` VALUES (685, '广阳', 134, 'g', 'gy', 'guangyang', '', '区', '131003', '0316', 2);
INSERT INTO `youbang_sys_area` VALUES (686, '固安', 134, 'g', 'ga', 'guan', '', '县', '131022', '0316', 3);
INSERT INTO `youbang_sys_area` VALUES (687, '永清', 134, 'y', 'yq', 'yongqing', '', '县', '131023', '0316', 4);
INSERT INTO `youbang_sys_area` VALUES (688, '香河', 134, 'x', 'xh', 'xianghe', '', '县', '131024', '0316', 5);
INSERT INTO `youbang_sys_area` VALUES (689, '大城', 134, 'd', 'dc', 'dacheng', '', '县', '131025', '0316', 6);
INSERT INTO `youbang_sys_area` VALUES (690, '文安', 134, 'w', 'wa', 'wenan', '', '县', '131026', '0316', 7);
INSERT INTO `youbang_sys_area` VALUES (691, '大厂', 134, 'd', 'dc', 'dachang', '回族', '自治县', '131028', '0316', 8);
INSERT INTO `youbang_sys_area` VALUES (692, '霸州', 134, 'b', 'bz', 'bazhou', '', '市', '131081', '0316', 9);
INSERT INTO `youbang_sys_area` VALUES (693, '三河', 134, 's', 'sh', 'sanhe', '', '市', '131082', '0316', 10);
INSERT INTO `youbang_sys_area` VALUES (694, '桃城', 135, 't', 'tc', 'taocheng', '', '区', '131102', '0318', 1);
INSERT INTO `youbang_sys_area` VALUES (695, '枣强', 135, 'z', 'zq', 'zaoqiang', '', '县', '131121', '0318', 2);
INSERT INTO `youbang_sys_area` VALUES (696, '武邑', 135, 'w', 'wy', 'wuyi', '', '县', '131122', '0318', 3);
INSERT INTO `youbang_sys_area` VALUES (697, '武强', 135, 'w', 'wq', 'wuqiang', '', '县', '131123', '0318', 4);
INSERT INTO `youbang_sys_area` VALUES (698, '饶阳', 135, 'r', 'ry', 'raoyang', '', '县', '131124', '0318', 5);
INSERT INTO `youbang_sys_area` VALUES (699, '安平', 135, 'a', 'ap', 'anping', '', '县', '131125', '0318', 6);
INSERT INTO `youbang_sys_area` VALUES (700, '故城', 135, 'g', 'gc', 'gucheng', '', '县', '131126', '0318', 7);
INSERT INTO `youbang_sys_area` VALUES (701, '景县', 135, 'j', 'jx', 'jingxian', '', '', '131127', '0318', 8);
INSERT INTO `youbang_sys_area` VALUES (702, '阜城', 135, 'f', 'fc', 'fucheng', '', '县', '131128', '0318', 9);
INSERT INTO `youbang_sys_area` VALUES (703, '冀州', 135, 'j', 'jz', 'jizhou', '', '区', '131181', '0318', 10);
INSERT INTO `youbang_sys_area` VALUES (704, '深州', 135, 's', 'sz', 'shenzhou', '', '市', '131182', '0318', 11);
INSERT INTO `youbang_sys_area` VALUES (705, '小店', 136, 'x', 'xd', 'xiaodian', '', '区', '140105', '0351', 1);
INSERT INTO `youbang_sys_area` VALUES (706, '迎泽', 136, 'y', 'yz', 'yingze', '', '区', '140106', '0351', 2);
INSERT INTO `youbang_sys_area` VALUES (707, '杏花岭', 136, 'x', 'xhl', 'xinghualing', '', '区', '140107', '0351', 3);
INSERT INTO `youbang_sys_area` VALUES (708, '尖草坪', 136, 'j', 'jcp', 'jiancaoping', '', '区', '140108', '0351', 4);
INSERT INTO `youbang_sys_area` VALUES (709, '万柏林', 136, 'w', 'wbl', 'wanbolin', '', '区', '140109', '0351', 5);
INSERT INTO `youbang_sys_area` VALUES (710, '晋源', 136, 'j', 'jy', 'jinyuan', '', '区', '140110', '0351', 6);
INSERT INTO `youbang_sys_area` VALUES (711, '清徐', 136, 'q', 'qx', 'qingxu', '', '县', '140121', '0351', 7);
INSERT INTO `youbang_sys_area` VALUES (712, '阳曲', 136, 'y', 'yq', 'yangqu', '', '县', '140122', '0351', 8);
INSERT INTO `youbang_sys_area` VALUES (713, '娄烦', 136, 'l', 'lf', 'loufan', '', '县', '140123', '0351', 9);
INSERT INTO `youbang_sys_area` VALUES (714, '古交', 136, 'g', 'gj', 'gujiao', '', '市', '140181', '0351', 10);
INSERT INTO `youbang_sys_area` VALUES (715, '城区', 137, 'c', 'cq', 'chengqu', '', '', '140202', '0352', 1);
INSERT INTO `youbang_sys_area` VALUES (716, '矿区', 137, 'k', 'kq', 'kuangqu', '', '', '140203', '0352', 2);
INSERT INTO `youbang_sys_area` VALUES (717, '南郊', 137, 'n', 'nj', 'nanjiao', '', '区', '140211', '0352', 3);
INSERT INTO `youbang_sys_area` VALUES (718, '新荣', 137, 'x', 'xr', 'xinrong', '', '区', '140212', '0352', 4);
INSERT INTO `youbang_sys_area` VALUES (719, '阳高', 137, 'y', 'yg', 'yanggao', '', '县', '140221', '0352', 5);
INSERT INTO `youbang_sys_area` VALUES (720, '天镇', 137, 't', 'tz', 'tianzhen', '', '县', '140222', '0352', 6);
INSERT INTO `youbang_sys_area` VALUES (721, '广灵', 137, 'g', 'gl', 'guangling', '', '县', '140223', '0352', 7);
INSERT INTO `youbang_sys_area` VALUES (722, '灵丘', 137, 'l', 'lq', 'lingqiu', '', '县', '140224', '0352', 8);
INSERT INTO `youbang_sys_area` VALUES (723, '浑源', 137, 'h', 'hy', 'hunyuan', '', '县', '140225', '0352', 9);
INSERT INTO `youbang_sys_area` VALUES (724, '左云', 137, 'z', 'zy', 'zuoyun', '', '县', '140226', '0352', 10);
INSERT INTO `youbang_sys_area` VALUES (725, '大同', 137, 'd', 'dt', 'datong', '', '县', '140227', '0352', 11);
INSERT INTO `youbang_sys_area` VALUES (726, '城区', 138, 'c', 'cq', 'chengqu', '', '', '140302', '0353', 1);
INSERT INTO `youbang_sys_area` VALUES (727, '矿区', 138, 'k', 'kq', 'kuangqu', '', '', '140303', '0353', 2);
INSERT INTO `youbang_sys_area` VALUES (728, '郊区', 138, 'j', 'jq', 'jiaoqu', '', '', '140311', '0353', 3);
INSERT INTO `youbang_sys_area` VALUES (729, '平定', 138, 'p', 'pd', 'pingding', '', '县', '140321', '0353', 4);
INSERT INTO `youbang_sys_area` VALUES (730, '盂县', 138, 'y', 'yx', 'yuxian', '', '', '140322', '0353', 5);
INSERT INTO `youbang_sys_area` VALUES (731, '城区', 139, 'c', 'cq', 'chengqu', '', '', '140402', '0355', 1);
INSERT INTO `youbang_sys_area` VALUES (732, '郊区', 139, 'j', 'jq', 'jiaoqu', '', '', '140411', '0355', 2);
INSERT INTO `youbang_sys_area` VALUES (733, '长治', 139, 'c', 'cz', 'changzhi', '', '县', '140421', '0355', 3);
INSERT INTO `youbang_sys_area` VALUES (734, '襄垣', 139, 'x', 'xy', 'xiangyuan', '', '县', '140423', '0355', 4);
INSERT INTO `youbang_sys_area` VALUES (735, '屯留', 139, 't', 'tl', 'tunliu', '', '县', '140424', '0355', 5);
INSERT INTO `youbang_sys_area` VALUES (736, '平顺', 139, 'p', 'ps', 'pingshun', '', '县', '140425', '0355', 6);
INSERT INTO `youbang_sys_area` VALUES (737, '黎城', 139, 'l', 'lc', 'licheng', '', '县', '140426', '0355', 7);
INSERT INTO `youbang_sys_area` VALUES (738, '壶关', 139, 'h', 'hg', 'huguan', '', '县', '140427', '0355', 8);
INSERT INTO `youbang_sys_area` VALUES (739, '长子', 139, 'z', 'zz', 'zhangzi', '', '县', '140428', '0355', 9);
INSERT INTO `youbang_sys_area` VALUES (740, '武乡', 139, 'w', 'wx', 'wuxiang', '', '县', '140429', '0355', 10);
INSERT INTO `youbang_sys_area` VALUES (741, '沁县', 139, 'q', 'qx', 'qinxian', '', '', '140430', '0355', 11);
INSERT INTO `youbang_sys_area` VALUES (742, '沁源', 139, 'q', 'qy', 'qinyuan', '', '县', '140431', '0355', 12);
INSERT INTO `youbang_sys_area` VALUES (743, '潞城', 139, 'l', 'lc', 'lucheng', '', '县', '140481', '0355', 13);
INSERT INTO `youbang_sys_area` VALUES (744, '城区', 140, 'c', 'cq', 'chengqu', '', '', '140502', '0356', 1);
INSERT INTO `youbang_sys_area` VALUES (745, '沁水', 140, 'q', 'qs', 'qinshui', '', '县', '140521', '0356', 2);
INSERT INTO `youbang_sys_area` VALUES (746, '阳城', 140, 'y', 'yc', 'yangcheng', '', '县', '140522', '0356', 3);
INSERT INTO `youbang_sys_area` VALUES (747, '陵川', 140, 'l', 'lc', 'lingchuan', '', '县', '140524', '0356', 4);
INSERT INTO `youbang_sys_area` VALUES (748, '泽州', 140, 'z', 'zz', 'zezhou', '', '县', '140525', '0356', 5);
INSERT INTO `youbang_sys_area` VALUES (749, '高平', 140, 'g', 'gp', 'gaoping', '', '市', '140581', '0356', 6);
INSERT INTO `youbang_sys_area` VALUES (750, '朔城', 141, 's', 'sc', 'shuocheng', '', '区', '140602', '0349', 1);
INSERT INTO `youbang_sys_area` VALUES (751, '平鲁', 141, 'p', 'pl', 'pinglu', '', '区', '140603', '0349', 2);
INSERT INTO `youbang_sys_area` VALUES (752, '山阴', 141, 's', 'sy', 'shanyin', '', '县', '140621', '0349', 3);
INSERT INTO `youbang_sys_area` VALUES (753, '应县', 141, 'y', 'yx', 'yingxian', '', '', '140622', '0349', 4);
INSERT INTO `youbang_sys_area` VALUES (754, '右玉', 141, 'y', 'yy', 'youyu', '', '县', '140623', '0349', 5);
INSERT INTO `youbang_sys_area` VALUES (755, '怀仁', 141, 'h', 'hr', 'huairen', '', '县', '140624', '0349', 6);
INSERT INTO `youbang_sys_area` VALUES (756, '榆次', 142, 'y', 'yc', 'yuci', '', '区', '030600', '0354', 1);
INSERT INTO `youbang_sys_area` VALUES (757, '榆社', 142, 'y', 'ys', 'yushe', '', '县', '140721', '0354', 2);
INSERT INTO `youbang_sys_area` VALUES (758, '左权', 142, 'z', 'zq', 'zuoquan', '', '县', '140722', '0354', 3);
INSERT INTO `youbang_sys_area` VALUES (759, '和顺', 142, 'h', 'hs', 'heshun', '', '县', '140723', '0354', 4);
INSERT INTO `youbang_sys_area` VALUES (760, '昔阳', 142, 'x', 'xy', 'xiyang', '', '县', '140724', '0354', 5);
INSERT INTO `youbang_sys_area` VALUES (761, '寿阳', 142, 's', 'sy', 'shouyang', '', '县', '140725', '0354', 6);
INSERT INTO `youbang_sys_area` VALUES (762, '太谷', 142, 't', 'tg', 'taigu', '', '县', '140726', '0354', 7);
INSERT INTO `youbang_sys_area` VALUES (763, '祁县', 142, 'q', 'qx', 'qixian', '', '', '140727', '0354', 8);
INSERT INTO `youbang_sys_area` VALUES (764, '平遥', 142, 'p', 'py', 'pingyao', '', '县', '140728', '0354', 9);
INSERT INTO `youbang_sys_area` VALUES (765, '灵石', 142, 'l', 'ls', 'lingshi', '', '县', '140729', '0354', 10);
INSERT INTO `youbang_sys_area` VALUES (766, '介休', 142, 'j', 'jx', 'jiexiu', '', '市', '140781', '0354', 11);
INSERT INTO `youbang_sys_area` VALUES (767, '盐湖', 143, 'y', 'yh', 'yanhu', '', '区', '140802', '0359', 1);
INSERT INTO `youbang_sys_area` VALUES (768, '临猗', 143, 'l', 'ly', 'linyi', '', '县', '140821', '0359', 2);
INSERT INTO `youbang_sys_area` VALUES (769, '万荣', 143, 'w', 'wr', 'wanrong', '', '县', '140822', '0359', 3);
INSERT INTO `youbang_sys_area` VALUES (770, '闻喜', 143, 'w', 'wx', 'wenxi', '', '县', '140823', '0359', 4);
INSERT INTO `youbang_sys_area` VALUES (771, '稷山', 143, 'j', 'js', 'jishan', '', '县', '140824', '0359', 5);
INSERT INTO `youbang_sys_area` VALUES (772, '新绛', 143, 'x', 'xj', 'xinjiang', '', '县', '140825', '0359', 6);
INSERT INTO `youbang_sys_area` VALUES (773, '绛县', 143, 'j', 'jx', 'jiangxian', '', '', '140826', '0359', 7);
INSERT INTO `youbang_sys_area` VALUES (774, '垣曲', 143, 'y', 'yq', 'yuanqu', '', '县', '140827', '0359', 8);
INSERT INTO `youbang_sys_area` VALUES (775, '夏县', 143, 'x', 'xx', 'xiaxian', '', '', '140828', '0359', 9);
INSERT INTO `youbang_sys_area` VALUES (776, '平陆', 143, 'p', 'pl', 'pinglu', '', '县', '140829', '0359', 10);
INSERT INTO `youbang_sys_area` VALUES (777, '芮城', 143, 'r', 'rc', 'ruicheng', '', '县', '140830', '0359', 11);
INSERT INTO `youbang_sys_area` VALUES (778, '永济', 143, 'y', 'yj', 'yongji', '', '市', '140881', '0359', 12);
INSERT INTO `youbang_sys_area` VALUES (779, '河津', 143, 'h', 'hj', 'hejin', '', '市', '140882', '0359', 13);
INSERT INTO `youbang_sys_area` VALUES (780, '忻府', 144, 'x', 'xf', 'xinfu', '', '区', '140902', '0350', 1);
INSERT INTO `youbang_sys_area` VALUES (781, '定襄', 144, 'd', 'dx', 'dingxiang', '', '县', '140921', '0350', 2);
INSERT INTO `youbang_sys_area` VALUES (782, '五台', 144, 'w', 'wt', 'wutai', '', '县', '140922', '0350', 3);
INSERT INTO `youbang_sys_area` VALUES (783, '代县', 144, 'd', 'dx', 'daixian', '', '', '140923', '0350', 4);
INSERT INTO `youbang_sys_area` VALUES (784, '繁峙', 144, 'f', 'fz', 'fanzhi', '', '县', '140924', '0350', 5);
INSERT INTO `youbang_sys_area` VALUES (785, '宁武', 144, 'n', 'nw', 'ningwu', '', '县', '140925', '0350', 6);
INSERT INTO `youbang_sys_area` VALUES (786, '静乐', 144, 'j', 'jl', 'jingle', '', '县', '140926', '0350', 7);
INSERT INTO `youbang_sys_area` VALUES (787, '神池', 144, 's', 'sc', 'shenchi', '', '县', '140927', '0350', 8);
INSERT INTO `youbang_sys_area` VALUES (788, '五寨', 144, 'w', 'wz', 'wuzhai', '', '县', '140928', '0350', 9);
INSERT INTO `youbang_sys_area` VALUES (789, '岢岚', 144, 'k', 'kl', 'kelan', '', '县', '140929', '0350', 10);
INSERT INTO `youbang_sys_area` VALUES (790, '河曲', 144, 'h', 'hq', 'hequ', '', '县', '140930', '0350', 11);
INSERT INTO `youbang_sys_area` VALUES (791, '保德', 144, 'b', 'bd', 'baode', '', '县', '140931', '0350', 12);
INSERT INTO `youbang_sys_area` VALUES (792, '偏关', 144, 'p', 'pg', 'pianguan', '', '县', '140932', '0350', 13);
INSERT INTO `youbang_sys_area` VALUES (793, '原平', 144, 'y', 'yp', 'yuanping', '', '市', '140981', '0350', 14);
INSERT INTO `youbang_sys_area` VALUES (794, '尧都', 145, 'y', 'yd', 'yaodu', '', '区', '141002', '0357', 1);
INSERT INTO `youbang_sys_area` VALUES (795, '曲沃', 145, 'q', 'qw', 'quwo', '', '县', '141021', '0357', 2);
INSERT INTO `youbang_sys_area` VALUES (796, '翼城', 145, 'y', 'yc', 'yicheng', '', '县', '141022', '0357', 3);
INSERT INTO `youbang_sys_area` VALUES (797, '襄汾', 145, 'x', 'xf', 'xiangfen', '', '县', '141023', '0357', 4);
INSERT INTO `youbang_sys_area` VALUES (798, '洪洞', 145, 'h', 'hd', 'hongdong', '', '县', '141024', '0357', 5);
INSERT INTO `youbang_sys_area` VALUES (799, '古县', 145, 'g', 'gx', 'guxian', '', '', '141025', '0357', 6);
INSERT INTO `youbang_sys_area` VALUES (800, '安泽', 145, 'a', 'az', 'anze', '', '县', '141026', '0357', 7);
INSERT INTO `youbang_sys_area` VALUES (801, '浮山', 145, 'f', 'fs', 'fushan', '', '县', '141027', '0357', 8);
INSERT INTO `youbang_sys_area` VALUES (802, '吉县', 145, 'j', 'jx', 'jixian', '', '', '141028', '0357', 9);
INSERT INTO `youbang_sys_area` VALUES (803, '乡宁', 145, 'x', 'xn', 'xiangning', '', '县', '141029', '0357', 10);
INSERT INTO `youbang_sys_area` VALUES (804, '大宁', 145, 'd', 'dn', 'daning', '', '县', '141030', '0357', 11);
INSERT INTO `youbang_sys_area` VALUES (805, '隰县', 145, 'x', 'xx', 'xixian', '', '', '141031', '0357', 12);
INSERT INTO `youbang_sys_area` VALUES (806, '永和', 145, 'y', 'yh', 'yonghe', '', '县', '141032', '0357', 13);
INSERT INTO `youbang_sys_area` VALUES (807, '蒲县', 145, 'p', 'px', 'puxian', '', '', '141033', '0357', 14);
INSERT INTO `youbang_sys_area` VALUES (808, '汾西', 145, 'f', 'fx', 'fenxi', '', '县', '141034', '0357', 15);
INSERT INTO `youbang_sys_area` VALUES (809, '侯马', 145, 'h', 'hm', 'houma', '', '市', '141081', '0357', 16);
INSERT INTO `youbang_sys_area` VALUES (810, '霍州', 145, 'h', 'hz', 'huozhou', '', '市', '141082', '0357', 17);
INSERT INTO `youbang_sys_area` VALUES (811, '离石', 146, 'l', 'ls', 'lishi', '', '区', '141102', '0358', 1);
INSERT INTO `youbang_sys_area` VALUES (812, '文水', 146, 'w', 'ws', 'wenshui', '', '县', '141121', '0358', 2);
INSERT INTO `youbang_sys_area` VALUES (813, '交城', 146, 'j', 'jc', 'jiaocheng', '', '县', '141122', '0358', 3);
INSERT INTO `youbang_sys_area` VALUES (814, '兴县', 146, 'x', 'xx', 'xingxian', '', '', '141123', '0358', 4);
INSERT INTO `youbang_sys_area` VALUES (815, '临县', 146, 'l', 'lx', 'linxian', '', '', '141124', '0358', 5);
INSERT INTO `youbang_sys_area` VALUES (816, '柳林', 146, 'l', 'll', 'liulin', '', '县', '141125', '0358', 6);
INSERT INTO `youbang_sys_area` VALUES (817, '石楼', 146, 's', 'sl', 'shilou', '', '县', '141126', '0358', 7);
INSERT INTO `youbang_sys_area` VALUES (818, '岚县', 146, 'l', 'lx', 'lanxian', '', '', '141127', '0358', 8);
INSERT INTO `youbang_sys_area` VALUES (819, '方山', 146, 'f', 'fs', 'fangshan', '', '县', '141128', '0358', 9);
INSERT INTO `youbang_sys_area` VALUES (820, '中阳', 146, 'z', 'zy', 'zhongyang', '', '县', '141129', '0358', 10);
INSERT INTO `youbang_sys_area` VALUES (821, '交口', 146, 'j', 'jk', 'jiaokou', '', '县', '141130', '0358', 11);
INSERT INTO `youbang_sys_area` VALUES (822, '孝义', 146, 'x', 'xy', 'xiaoyi', '', '市', '141181', '0358', 12);
INSERT INTO `youbang_sys_area` VALUES (823, '汾阳', 146, 'f', 'fy', 'fenyang', '', '市', '141182', '0358', 13);
INSERT INTO `youbang_sys_area` VALUES (824, '新城', 147, 'x', 'xc', 'xincheng', '', '区', '150102', '0471', 1);
INSERT INTO `youbang_sys_area` VALUES (825, '回民', 147, 'h', 'hm', 'huimin', '', '区', '150103', '0471', 2);
INSERT INTO `youbang_sys_area` VALUES (826, '玉泉', 147, 'y', 'yq', 'yuquan', '', '区', '150104', '0471', 3);
INSERT INTO `youbang_sys_area` VALUES (827, '赛罕', 147, 's', 'sh', 'saihan', '', '区', '150105', '0471', 4);
INSERT INTO `youbang_sys_area` VALUES (828, '土默特左', 147, 't', 'tmtz', 'tumotezuo', '', '旗', '150121', '0471', 5);
INSERT INTO `youbang_sys_area` VALUES (829, '托克托', 147, 't', 'tkt', 'tuoketuo', '', '县', '150122', '0471', 6);
INSERT INTO `youbang_sys_area` VALUES (830, '和林格尔', 147, 'h', 'hlge', 'helingeer', '', '县', '150123', '0471', 7);
INSERT INTO `youbang_sys_area` VALUES (831, '清水河', 147, 'q', 'qsh', 'qingshuihe', '', '县', '150124', '0471', 8);
INSERT INTO `youbang_sys_area` VALUES (832, '武川', 147, 'w', 'wc', 'wuchuan', '', '县', '150125', '0471', 9);
INSERT INTO `youbang_sys_area` VALUES (833, '东河', 148, 'd', 'dh', 'donghe', '', '区', '150202', '0472', 1);
INSERT INTO `youbang_sys_area` VALUES (834, '昆都仑', 148, 'k', 'kdl', 'kundulun', '', '区', '150203', '0472', 2);
INSERT INTO `youbang_sys_area` VALUES (835, '青山', 148, 'q', 'qs', 'qingshan', '', '区', '150204', '0472', 3);
INSERT INTO `youbang_sys_area` VALUES (836, '石拐', 148, 's', 'sg', 'shiguai', '', '区', '150205', '0472', 4);
INSERT INTO `youbang_sys_area` VALUES (837, '白云', 148, 'b', 'by', 'baiyun', '矿', '区', '150206', '0472', 5);
INSERT INTO `youbang_sys_area` VALUES (838, '九原', 148, 'j', 'jy', 'jiuyuan', '', '区', '150207', '0472', 6);
INSERT INTO `youbang_sys_area` VALUES (839, '土默特右', 148, 't', 'tmty', 'tumoteyou', '', '旗', '150221', '0472', 7);
INSERT INTO `youbang_sys_area` VALUES (840, '固阳', 148, 'g', 'gy', 'guyang', '', '县', '150222', '0472', 8);
INSERT INTO `youbang_sys_area` VALUES (841, '达尔罕茂明安', 148, 'd', 'dehmma', 'daerhanmaomingan', '联合', '旗', '150223', '0472', 9);
INSERT INTO `youbang_sys_area` VALUES (842, '海勃湾', 149, 'h', 'hbw', 'haibowan', '', '区', '150302', '0473', 1);
INSERT INTO `youbang_sys_area` VALUES (843, '海南', 149, 'h', 'hn', 'hainan', '', '区', '150303', '0473', 2);
INSERT INTO `youbang_sys_area` VALUES (844, '乌达', 149, 'w', 'wd', 'wuda', '', '区', '150304', '0473', 3);
INSERT INTO `youbang_sys_area` VALUES (845, '红山', 150, 'h', 'hs', 'hongshan', '', '区', '150402', '0476', 1);
INSERT INTO `youbang_sys_area` VALUES (846, '元宝山', 150, 'y', 'ybs', 'yuanbaoshan', '', '区', '150403', '0476', 2);
INSERT INTO `youbang_sys_area` VALUES (847, '松山', 150, 's', 'ss', 'songshan', '', '区', '150404', '0476', 3);
INSERT INTO `youbang_sys_area` VALUES (848, '阿鲁科尔沁', 150, 'a', 'alkeq', 'alukeerqin', '', '旗', '150421', '0476', 4);
INSERT INTO `youbang_sys_area` VALUES (849, '巴林左', 150, 'b', 'blz', 'balinzuo', '', '旗', '150422', '0476', 5);
INSERT INTO `youbang_sys_area` VALUES (850, '巴林右', 150, 'b', 'bly', 'balinyou', '', '旗', '150423', '0476', 6);
INSERT INTO `youbang_sys_area` VALUES (851, '林西', 150, 'l', 'lx', 'linxi', '', '县', '150424', '0476', 7);
INSERT INTO `youbang_sys_area` VALUES (852, '克什克腾', 150, 'k', 'kskt', 'keshenketeng', '', '旗', '150425', '0476', 8);
INSERT INTO `youbang_sys_area` VALUES (853, '翁牛特', 150, 'w', 'wnt', 'wengniute', '', '旗', '150426', '0476', 9);
INSERT INTO `youbang_sys_area` VALUES (854, '喀喇沁', 150, 'k', 'klq', 'kalaqin', '', '旗', '150428', '0476', 10);
INSERT INTO `youbang_sys_area` VALUES (855, '宁城', 150, 'n', 'nc', 'ningcheng', '', '县', '150429', '0476', 11);
INSERT INTO `youbang_sys_area` VALUES (856, '敖汉', 150, 'a', 'ah', 'aohan', '', '旗', '150430', '0476', 12);
INSERT INTO `youbang_sys_area` VALUES (857, '科尔沁', 151, 'k', 'keq', 'keerqin', '', '区', '150502', '0475', 1);
INSERT INTO `youbang_sys_area` VALUES (858, '科尔沁左翼中', 151, 'k', 'keqzyz', 'keerqinzuoyizhong', '', '旗', '150521', '0475', 2);
INSERT INTO `youbang_sys_area` VALUES (859, '科尔沁左翼后', 151, 'k', 'keqzyh', 'keerqinzuoyihou', '', '旗', '150522', '0475', 3);
INSERT INTO `youbang_sys_area` VALUES (860, '开鲁', 151, 'k', 'kl', 'kailu', '', '县', '150523', '0475', 4);
INSERT INTO `youbang_sys_area` VALUES (861, '库伦', 151, 'k', 'kl', 'kulun', '', '旗', '150524', '0475', 5);
INSERT INTO `youbang_sys_area` VALUES (862, '奈曼', 151, 'n', 'nm', 'naiman', '', '旗', '150525', '0475', 6);
INSERT INTO `youbang_sys_area` VALUES (863, '扎鲁特', 151, 'z', 'zlt', 'zhalute', '', '旗', '150526', '0475', 7);
INSERT INTO `youbang_sys_area` VALUES (864, '霍林郭勒', 151, 'h', 'hlgl', 'huolinguole', '', '市', '150581', '0475', 8);
INSERT INTO `youbang_sys_area` VALUES (865, '东胜', 152, 'd', 'ds', 'dongsheng', '', '区', '150602', '0477', 1);
INSERT INTO `youbang_sys_area` VALUES (866, '达拉特', 152, 'd', 'dlt', 'dalate', '', '旗', '150621', '0477', 2);
INSERT INTO `youbang_sys_area` VALUES (867, '准格尔', 152, 'z', 'zge', 'zhungeer', '', '旗', '150622', '0477', 3);
INSERT INTO `youbang_sys_area` VALUES (868, '鄂托克前', 152, 'e', 'etkq', 'etuokeqian', '', '旗', '150623', '0477', 4);
INSERT INTO `youbang_sys_area` VALUES (869, '鄂托克', 152, 'e', 'etk', 'etuoke', '', '旗', '150624', '0477', 5);
INSERT INTO `youbang_sys_area` VALUES (870, '杭锦', 152, 'h', 'hj', 'hangjin', '', '旗', '150625', '0477', 6);
INSERT INTO `youbang_sys_area` VALUES (871, '乌审', 152, 'w', 'ws', 'wushen', '', '旗', '150626', '0477', 7);
INSERT INTO `youbang_sys_area` VALUES (872, '伊金霍洛', 152, 'y', 'yjhl', 'yijinhuoluo', '', '旗', '150627', '0477', 8);
INSERT INTO `youbang_sys_area` VALUES (873, '海拉尔', 153, 'h', 'hle', 'hailaer', '', '区', '150702', '0470', 1);
INSERT INTO `youbang_sys_area` VALUES (874, '阿荣', 153, 'a', 'ar', 'arong', '', '旗', '150721', '0470', 2);
INSERT INTO `youbang_sys_area` VALUES (875, '莫力达瓦', 153, 'm', 'mldw', 'molidawa', '达斡尔族', '自治旗', '150722', '0470', 3);
INSERT INTO `youbang_sys_area` VALUES (876, '鄂伦春', 153, 'e', 'elc', 'elunchun', '', '自治旗', '150723', '0470', 4);
INSERT INTO `youbang_sys_area` VALUES (877, '鄂温克族', 153, 'e', 'ewkz', 'ewenkezu', '', '自治旗', '150724', '0470', 5);
INSERT INTO `youbang_sys_area` VALUES (878, '陈巴尔虎', 153, 'c', 'cbeh', 'chenbaerhu', '', '旗', '150725', '0470', 6);
INSERT INTO `youbang_sys_area` VALUES (879, '新巴尔虎左', 153, 'x', 'xbehz', 'xinbaerhuzuo', '', '旗', '150726', '0470', 7);
INSERT INTO `youbang_sys_area` VALUES (880, '新巴尔虎右', 153, 'x', 'xbehy', 'xinbaerhuyou', '', '旗', '150727', '0470', 8);
INSERT INTO `youbang_sys_area` VALUES (881, '满洲里', 153, 'm', 'mzl', 'manzhouli', '', '市', '150781', '0470', 9);
INSERT INTO `youbang_sys_area` VALUES (882, '牙克石', 153, 'y', 'yks', 'yakeshi', '', '市', '150782', '0470', 10);
INSERT INTO `youbang_sys_area` VALUES (883, '扎兰屯', 153, 'z', 'zlt', 'zhalantun', '', '市', '150783', '0470', 11);
INSERT INTO `youbang_sys_area` VALUES (884, '额尔古纳', 153, 'e', 'eegn', 'eerguna', '', '市', '150784', '0470', 12);
INSERT INTO `youbang_sys_area` VALUES (885, '根河', 153, 'g', 'gh', 'genhe', '', '市', '150785', '0470', 13);
INSERT INTO `youbang_sys_area` VALUES (886, '临河', 154, 'l', 'lh', 'linhe', '', '区', '150802', '0478', 1);
INSERT INTO `youbang_sys_area` VALUES (887, '五原', 154, 'w', 'wy', 'wuyuan', '', '县', '150821', '0478', 2);
INSERT INTO `youbang_sys_area` VALUES (888, '磴口', 154, 'd', 'dk', 'dengkou', '', '县', '150822', '0478', 3);
INSERT INTO `youbang_sys_area` VALUES (889, '乌拉特前', 154, 'w', 'wltq', 'wulateqian', '', '旗', '150823', '0478', 4);
INSERT INTO `youbang_sys_area` VALUES (890, '乌拉特中', 154, 'w', 'wltz', 'wulatezhong', '', '旗', '150824', '0478', 5);
INSERT INTO `youbang_sys_area` VALUES (891, '乌拉特后', 154, 'w', 'wlth', 'wulatehou', '', '旗', '150825', '0478', 6);
INSERT INTO `youbang_sys_area` VALUES (892, '杭锦后', 154, 'h', 'hjh', 'hangjinhou', '', '旗', '150826', '0478', 7);
INSERT INTO `youbang_sys_area` VALUES (893, '集宁', 155, 'j', 'jn', 'jining', '', '区', '150902', '0474', 1);
INSERT INTO `youbang_sys_area` VALUES (894, '卓资', 155, 'z', 'zz', 'zhuozi', '', '县', '150921', '0474', 2);
INSERT INTO `youbang_sys_area` VALUES (895, '化德', 155, 'h', 'hd', 'huade', '', '县', '150922', '0474', 3);
INSERT INTO `youbang_sys_area` VALUES (896, '商都', 155, 's', 'sd', 'shangdu', '', '县', '150923', '0474', 4);
INSERT INTO `youbang_sys_area` VALUES (897, '兴和', 155, 'x', 'xh', 'xinghe', '', '县', '150924', '0474', 5);
INSERT INTO `youbang_sys_area` VALUES (898, '凉城', 155, 'l', 'lc', 'liangcheng', '', '县', '150925', '0474', 6);
INSERT INTO `youbang_sys_area` VALUES (899, '察哈尔右翼前', 155, 'c', 'cheyyq', 'chahaeryouyiqian', '', '旗', '150926', '0474', 7);
INSERT INTO `youbang_sys_area` VALUES (900, '察哈尔右翼中', 155, 'c', 'cheyyz', 'chahaeryouyizhong', '', '旗', '150927', '0474', 8);
INSERT INTO `youbang_sys_area` VALUES (901, '察哈尔右翼后', 155, 'c', 'cheyyh', 'chahaeryouyihou', '', '旗', '150928', '0474', 9);
INSERT INTO `youbang_sys_area` VALUES (902, '四子王', 155, 's', 'szw', 'siziwang', '', '旗', '150929', '0474', 10);
INSERT INTO `youbang_sys_area` VALUES (903, '丰镇', 155, 'f', 'fz', 'fengzhen', '', '市', '150981', '0474', 11);
INSERT INTO `youbang_sys_area` VALUES (904, '乌兰浩特', 156, 'w', 'wlht', 'wulanhaote', '', '市', '152201', '0482', 1);
INSERT INTO `youbang_sys_area` VALUES (905, '阿尔山', 156, 'a', 'aes', 'aershan', '', '市', '152202', '0482', 2);
INSERT INTO `youbang_sys_area` VALUES (906, '科尔沁右翼前', 156, 'k', 'keqyyq', 'keerqinyouyiqian', '', '旗', '152221', '0482', 3);
INSERT INTO `youbang_sys_area` VALUES (907, '科尔沁右翼中', 156, 'k', 'keqyyz', 'keerqinyouyizhong', '', '旗', '152222', '0482', 4);
INSERT INTO `youbang_sys_area` VALUES (908, '扎赉特', 156, 'z', 'zlt', 'zhalaite', '', '旗', '152223', '0482', 5);
INSERT INTO `youbang_sys_area` VALUES (909, '突泉', 156, 't', 'tq', 'tuquan', '', '县', '152224', '0482', 6);
INSERT INTO `youbang_sys_area` VALUES (910, '二连浩特', 157, 'e', 'elht', 'erlianhaote', '', '市', '152501', '0479', 1);
INSERT INTO `youbang_sys_area` VALUES (911, '锡林浩特', 157, 'x', 'xlht', 'xilinhaote', '', '市', '152502', '0479', 2);
INSERT INTO `youbang_sys_area` VALUES (912, '阿巴嘎', 157, 'a', 'abg', 'abaga', '', '旗', '152522', '0479', 3);
INSERT INTO `youbang_sys_area` VALUES (913, '苏尼特左', 157, 's', 'sntz', 'sunitezuo', '', '旗', '152523', '0479', 4);
INSERT INTO `youbang_sys_area` VALUES (914, '苏尼特右', 157, 's', 'snty', 'suniteyou', '', '旗', '152524', '0479', 5);
INSERT INTO `youbang_sys_area` VALUES (915, '东乌珠穆沁', 157, 'd', 'dwzmq', 'dongwuzhumuqin', '', '旗', '152525', '0479', 6);
INSERT INTO `youbang_sys_area` VALUES (916, '西乌珠穆沁', 157, 'x', 'xwzmq', 'xiwuzhumuqin', '', '旗', '152526', '0479', 7);
INSERT INTO `youbang_sys_area` VALUES (917, '太仆寺', 157, 't', 'tps', 'taipusi', '', '旗', '152527', '0479', 8);
INSERT INTO `youbang_sys_area` VALUES (918, '镶黄', 157, 'x', 'xh', 'xianghuang', '', '旗', '152528', '0479', 9);
INSERT INTO `youbang_sys_area` VALUES (919, '正镶白', 157, 'z', 'zxb', 'zhengxiangbai', '', '旗', '152529', '0479', 10);
INSERT INTO `youbang_sys_area` VALUES (920, '正蓝', 157, 'z', 'zl', 'zhenglan', '', '旗', '152530', '0479', 11);
INSERT INTO `youbang_sys_area` VALUES (921, '多伦', 157, 'd', 'dl', 'duolun', '', '县', '152531', '0479', 12);
INSERT INTO `youbang_sys_area` VALUES (922, '阿拉善左', 158, 'a', 'alsz', 'alashanzuo', '', '旗', '152921', '0483', 1);
INSERT INTO `youbang_sys_area` VALUES (923, '阿拉善右', 158, 'a', 'alsy', 'alashanyou', '', '旗', '152922', '0483', 2);
INSERT INTO `youbang_sys_area` VALUES (924, '额济纳', 158, 'e', 'ejn', 'ejina', '', '旗', '152923', '0483', 3);
INSERT INTO `youbang_sys_area` VALUES (925, '和平', 159, 'h', 'hp', 'heping', '', '区', '210102', '024', 1);
INSERT INTO `youbang_sys_area` VALUES (926, '沈河', 159, 's', 'sh', 'shenhe', '', '区', '210103', '024', 2);
INSERT INTO `youbang_sys_area` VALUES (927, '大东', 159, 'd', 'dd', 'dadong', '', '区', '210104', '024', 3);
INSERT INTO `youbang_sys_area` VALUES (928, '皇姑', 159, 'h', 'hg', 'huanggu', '', '区', '210105', '024', 4);
INSERT INTO `youbang_sys_area` VALUES (929, '铁西', 159, 't', 'tx', 'tiexi', '', '区', '210106', '024', 5);
INSERT INTO `youbang_sys_area` VALUES (930, '苏家屯', 159, 's', 'sjt', 'sujiatun', '', '区', '210111', '024', 6);
INSERT INTO `youbang_sys_area` VALUES (931, '浑南', 159, 'h', 'hn', 'hunnan', '', '区', '210112', '024', 7);
INSERT INTO `youbang_sys_area` VALUES (932, '沈北新区', 159, 's', 'sbxq', 'shenbeixinqu', '', '', '210113', '024', 8);
INSERT INTO `youbang_sys_area` VALUES (933, '于洪', 159, 'y', 'yh', 'yuhong', '', '区', '210114', '024', 9);
INSERT INTO `youbang_sys_area` VALUES (934, '辽中', 159, 'l', 'lz', 'liaozhong', '', '区', '210122', '024', 10);
INSERT INTO `youbang_sys_area` VALUES (935, '康平', 159, 'k', 'kp', 'kangping', '', '县', '210123', '024', 11);
INSERT INTO `youbang_sys_area` VALUES (936, '法库', 159, 'f', 'fk', 'faku', '', '县', '210124', '024', 12);
INSERT INTO `youbang_sys_area` VALUES (937, '新民', 159, 'x', 'xm', 'xinmin', '', '市', '210181', '024', 13);
INSERT INTO `youbang_sys_area` VALUES (938, '中山', 160, 'z', 'zs', 'zhongshan', '', '区', '210202', '0411', 1);
INSERT INTO `youbang_sys_area` VALUES (939, '西岗', 160, 'x', 'xg', 'xigang', '', '区', '210203', '0411', 2);
INSERT INTO `youbang_sys_area` VALUES (940, '沙河口', 160, 's', 'shk', 'shahekou', '', '区', '210204', '0411', 3);
INSERT INTO `youbang_sys_area` VALUES (941, '甘井子', 160, 'g', 'gjz', 'ganjingzi', '', '区', '210211', '0411', 4);
INSERT INTO `youbang_sys_area` VALUES (942, '旅顺口', 160, 'l', 'lsk', 'lu:shunkou', '', '区', '210212', '0411', 5);
INSERT INTO `youbang_sys_area` VALUES (943, '金州', 160, 'j', 'jz', 'jinzhou', '', '区', '210213', '0411', 6);
INSERT INTO `youbang_sys_area` VALUES (944, '长海', 160, 'c', 'ch', 'changhai', '', '县', '210224', '0411', 7);
INSERT INTO `youbang_sys_area` VALUES (945, '瓦房店', 160, 'w', 'wfd', 'wafangdian', '', '市', '210281', '0411', 8);
INSERT INTO `youbang_sys_area` VALUES (946, '普兰店', 160, 'p', 'pld', 'pulandian', '', '区', '210282', '0411', 9);
INSERT INTO `youbang_sys_area` VALUES (947, '庄河', 160, 'z', 'zh', 'zhuanghe', '', '市', '210283', '0411', 10);
INSERT INTO `youbang_sys_area` VALUES (948, '铁东', 161, 't', 'td', 'tiedong', '', '区', '210302', '0412', 1);
INSERT INTO `youbang_sys_area` VALUES (949, '铁西', 161, 't', 'tx', 'tiexi', '', '区', '210303', '0412', 2);
INSERT INTO `youbang_sys_area` VALUES (950, '立山', 161, 'l', 'ls', 'lishan', '', '区', '210304', '0412', 3);
INSERT INTO `youbang_sys_area` VALUES (951, '千山', 161, 'q', 'qs', 'qianshan', '', '区', '210311', '0412', 4);
INSERT INTO `youbang_sys_area` VALUES (952, '台安', 161, 't', 'ta', 'taian', '', '县', '210321', '0412', 5);
INSERT INTO `youbang_sys_area` VALUES (953, '岫岩', 161, 'x', 'xy', 'xiuyan', '满族', '自治县', '210323', '0412', 6);
INSERT INTO `youbang_sys_area` VALUES (954, '海城', 161, 'h', 'hc', 'haicheng', '', '市', '210381', '0412', 7);
INSERT INTO `youbang_sys_area` VALUES (955, '新抚', 162, 'x', 'xf', 'xinfu', '', '区', '210402', '0413', 1);
INSERT INTO `youbang_sys_area` VALUES (956, '东洲', 162, 'd', 'dz', 'dongzhou', '', '区', '210403', '0413', 2);
INSERT INTO `youbang_sys_area` VALUES (957, '望花', 162, 'w', 'wh', 'wanghua', '', '区', '210404', '0413', 3);
INSERT INTO `youbang_sys_area` VALUES (958, '顺城', 162, 's', 'sc', 'shuncheng', '', '区', '210411', '0413', 4);
INSERT INTO `youbang_sys_area` VALUES (959, '抚顺', 162, 'f', 'fs', 'fushun', '', '县', '210421', '0413', 5);
INSERT INTO `youbang_sys_area` VALUES (960, '新宾', 162, 'x', 'xb', 'xinbin', '满族', '自治县', '210422', '0413', 6);
INSERT INTO `youbang_sys_area` VALUES (961, '清原', 162, 'q', 'qy', 'qingyuan', '满族', '自治县', '210423', '0413', 7);
INSERT INTO `youbang_sys_area` VALUES (962, '平山', 163, 'p', 'ps', 'pingshan', '', '区', '210502', '0414', 1);
INSERT INTO `youbang_sys_area` VALUES (963, '溪湖', 163, 'x', 'xh', 'xihu', '', '区', '210503', '0414', 2);
INSERT INTO `youbang_sys_area` VALUES (964, '明山', 163, 'm', 'ms', 'mingshan', '', '区', '210504', '0414', 3);
INSERT INTO `youbang_sys_area` VALUES (965, '南芬', 163, 'n', 'nf', 'nanfen', '', '区', '210505', '0414', 4);
INSERT INTO `youbang_sys_area` VALUES (966, '本溪', 163, 'b', 'bx', 'benxi', '满族', '自治县', '210521', '0414', 5);
INSERT INTO `youbang_sys_area` VALUES (967, '桓仁', 163, 'h', 'hr', 'huanren', '满族', '自治县', '210522', '0414', 6);
INSERT INTO `youbang_sys_area` VALUES (968, '元宝', 164, 'y', 'yb', 'yuanbao', '', '区', '210602', '0415', 1);
INSERT INTO `youbang_sys_area` VALUES (969, '振兴', 164, 'z', 'zx', 'zhenxing', '', '区', '210603', '0415', 2);
INSERT INTO `youbang_sys_area` VALUES (970, '振安', 164, 'z', 'za', 'zhenan', '', '区', '210604', '0415', 3);
INSERT INTO `youbang_sys_area` VALUES (971, '宽甸', 164, 'k', 'kd', 'kuandian', '满族', '自治县', '210624', '0415', 4);
INSERT INTO `youbang_sys_area` VALUES (972, '东港', 164, 'd', 'dg', 'donggang', '', '市', '210681', '0415', 5);
INSERT INTO `youbang_sys_area` VALUES (973, '凤城', 164, 'f', 'fc', 'fengcheng', '', '市', '210682', '0415', 6);
INSERT INTO `youbang_sys_area` VALUES (974, '古塔', 165, 'g', 'gt', 'guta', '', '区', '210702', '0416', 1);
INSERT INTO `youbang_sys_area` VALUES (975, '凌河', 165, 'l', 'lh', 'linghe', '', '区', '210703', '0416', 2);
INSERT INTO `youbang_sys_area` VALUES (976, '太和', 165, 't', 'th', 'taihe', '', '区', '210711', '0416', 3);
INSERT INTO `youbang_sys_area` VALUES (977, '黑山', 165, 'h', 'hs', 'heishan', '', '县', '210726', '0416', 4);
INSERT INTO `youbang_sys_area` VALUES (978, '义县', 165, 'y', 'yx', 'yixian', '', '', '210727', '0416', 5);
INSERT INTO `youbang_sys_area` VALUES (979, '凌海', 165, 'l', 'lh', 'linghai', '', '市', '210781', '0416', 6);
INSERT INTO `youbang_sys_area` VALUES (980, '北镇', 165, 'b', 'bz', 'beizhen', '', '市', '210782', '0416', 7);
INSERT INTO `youbang_sys_area` VALUES (981, '站前', 166, 'z', 'zq', 'zhanqian', '', '区', '210802', '0417', 1);
INSERT INTO `youbang_sys_area` VALUES (982, '西市', 166, 'x', 'xs', 'xishi', '', '区', '210803', '0417', 2);
INSERT INTO `youbang_sys_area` VALUES (983, '鲅鱼圈', 166, 'b', 'byq', 'bayuquan', '', '区', '210804', '0417', 3);
INSERT INTO `youbang_sys_area` VALUES (984, '老边', 166, 'l', 'lb', 'laobian', '', '区', '210811', '0417', 4);
INSERT INTO `youbang_sys_area` VALUES (985, '盖州', 166, 'g', 'gz', 'gaizhou', '', '市', '210881', '0417', 5);
INSERT INTO `youbang_sys_area` VALUES (986, '大石桥', 166, 'd', 'dsq', 'dashiqiao', '', '市', '210882', '0417', 6);
INSERT INTO `youbang_sys_area` VALUES (987, '海州', 167, 'h', 'hz', 'haizhou', '', '区', '210902', '0418', 1);
INSERT INTO `youbang_sys_area` VALUES (988, '新邱', 167, 'x', 'xq', 'xinqiu', '', '区', '210903', '0418', 2);
INSERT INTO `youbang_sys_area` VALUES (989, '太平', 167, 't', 'tp', 'taiping', '', '区', '210904', '0418', 3);
INSERT INTO `youbang_sys_area` VALUES (990, '清河门', 167, 'q', 'qhm', 'qinghemen', '', '区', '210905', '0418', 4);
INSERT INTO `youbang_sys_area` VALUES (991, '细河', 167, 'x', 'xh', 'xihe', '', '区', '210911', '0418', 5);
INSERT INTO `youbang_sys_area` VALUES (992, '阜新', 167, 'f', 'fx', 'fuxin', '蒙古族', '自治县', '210921', '0418', 6);
INSERT INTO `youbang_sys_area` VALUES (993, '彰武', 167, 'z', 'zw', 'zhangwu', '', '县', '210922', '0418', 7);
INSERT INTO `youbang_sys_area` VALUES (994, '白塔', 168, 'b', 'bt', 'baita', '', '区', '211002', '0419', 1);
INSERT INTO `youbang_sys_area` VALUES (995, '文圣', 168, 'w', 'ws', 'wensheng', '', '区', '211003', '0419', 2);
INSERT INTO `youbang_sys_area` VALUES (996, '宏伟', 168, 'h', 'hw', 'hongwei', '', '区', '211004', '0419', 3);
INSERT INTO `youbang_sys_area` VALUES (997, '弓长岭', 168, 'g', 'gcl', 'gongchangling', '', '区', '211005', '0419', 4);
INSERT INTO `youbang_sys_area` VALUES (998, '辽阳', 168, 'l', 'ly', 'liaoyang', '', '县', '211021', '0419', 5);
INSERT INTO `youbang_sys_area` VALUES (999, '灯塔', 168, 'd', 'dt', 'dengta', '', '市', '211081', '0419', 6);
INSERT INTO `youbang_sys_area` VALUES (1000, '太子河', 168, 't', 'tzh', 'taizihe', '', '区', '211110', '0419', 7);
INSERT INTO `youbang_sys_area` VALUES (1001, '双台子', 169, 's', 'stz', 'shuangtaizi', '', '区', '211103', '0427', 1);
INSERT INTO `youbang_sys_area` VALUES (1002, '兴隆台', 169, 'x', 'xlt', 'xinglongtai', '', '区', '211103', '0427', 2);
INSERT INTO `youbang_sys_area` VALUES (1003, '大洼', 169, 'd', 'dw', 'dawa', '', '区', '211121', '0427', 3);
INSERT INTO `youbang_sys_area` VALUES (1004, '盘山', 169, 'p', 'ps', 'panshan', '', '县', '211122', '0427', 4);
INSERT INTO `youbang_sys_area` VALUES (1005, '银州', 170, 'y', 'yz', 'yinzhou', '', '区', '211202', '0410', 1);
INSERT INTO `youbang_sys_area` VALUES (1006, '清河', 170, 'q', 'qh', 'qinghe', '', '区', '211204', '0410', 2);
INSERT INTO `youbang_sys_area` VALUES (1007, '铁岭', 170, 't', 'tl', 'tieling', '', '县', '211221', '0410', 3);
INSERT INTO `youbang_sys_area` VALUES (1008, '西丰', 170, 'x', 'xf', 'xifeng', '', '县', '211223', '0410', 4);
INSERT INTO `youbang_sys_area` VALUES (1009, '昌图', 170, 'c', 'ct', 'changtu', '', '县', '211224', '0410', 5);
INSERT INTO `youbang_sys_area` VALUES (1010, '调兵山', 170, 'd', 'dbs', 'diaobingshan', '', '市', '211281', '0410', 6);
INSERT INTO `youbang_sys_area` VALUES (1011, '开原', 170, 'k', 'ky', 'kaiyuan', '', '市', '211282', '0410', 7);
INSERT INTO `youbang_sys_area` VALUES (1012, '双塔', 171, 's', 'st', 'shuangta', '', '区', '211302', '0421', 1);
INSERT INTO `youbang_sys_area` VALUES (1013, '龙城', 171, 'l', 'lc', 'longcheng', '', '区', '211303', '0421', 2);
INSERT INTO `youbang_sys_area` VALUES (1014, '朝阳', 171, 'c', 'cy', 'chaoyang', '', '县', '211321', '0421', 3);
INSERT INTO `youbang_sys_area` VALUES (1015, '建平', 171, 'j', 'jp', 'jianping', '', '县', '211322', '0421', 4);
INSERT INTO `youbang_sys_area` VALUES (1016, '喀喇沁左翼', 171, 'k', 'klqzy', 'kalaqinzuoyi', '蒙古族', '自治县', '211324', '0421', 5);
INSERT INTO `youbang_sys_area` VALUES (1017, '北票', 171, 'b', 'bp', 'beipiao', '', '市', '211381', '0421', 6);
INSERT INTO `youbang_sys_area` VALUES (1018, '凌源', 171, 'l', 'ly', 'lingyuan', '', '市', '211382', '0421', 7);
INSERT INTO `youbang_sys_area` VALUES (1019, '连山', 172, 'l', 'ls', 'lianshan', '', '区', '211402', '0429', 1);
INSERT INTO `youbang_sys_area` VALUES (1020, '龙港', 172, 'l', 'lg', 'longgang', '', '区', '211403', '0429', 2);
INSERT INTO `youbang_sys_area` VALUES (1021, '南票', 172, 'n', 'np', 'nanpiao', '', '区', '211404', '0429', 3);
INSERT INTO `youbang_sys_area` VALUES (1022, '绥中', 172, 's', 'sz', 'suizhong', '', '县', '211421', '0429', 4);
INSERT INTO `youbang_sys_area` VALUES (1023, '建昌', 172, 'j', 'jc', 'jianchang', '', '县', '211422', '0429', 5);
INSERT INTO `youbang_sys_area` VALUES (1024, '兴城', 172, 'x', 'xc', 'xingcheng', '', '市', '211481', '0429', 6);
INSERT INTO `youbang_sys_area` VALUES (1025, '南关', 173, 'n', 'ng', 'nanguan', '', '区', '220102', '0431', 1);
INSERT INTO `youbang_sys_area` VALUES (1026, '宽城', 173, 'k', 'kc', 'kuancheng', '', '区', '220103', '0431', 2);
INSERT INTO `youbang_sys_area` VALUES (1027, '朝阳', 173, 'c', 'cy', 'chaoyang', '', '区', '220104', '0431', 3);
INSERT INTO `youbang_sys_area` VALUES (1028, '二道', 173, 'e', 'ed', 'erdao', '', '区', '220105', '0431', 4);
INSERT INTO `youbang_sys_area` VALUES (1029, '绿园', 173, 'l', 'ly', 'lu:yuan', '', '区', '220106', '0431', 5);
INSERT INTO `youbang_sys_area` VALUES (1030, '双阳', 173, 's', 'sy', 'shuangyang', '', '区', '220112', '0431', 6);
INSERT INTO `youbang_sys_area` VALUES (1031, '农安', 173, 'n', 'na', 'nongan', '', '县', '220122', '0431', 8);
INSERT INTO `youbang_sys_area` VALUES (1032, '九台', 173, 'j', 'jt', 'jiutai', '', '区', '220113', '0431', 7);
INSERT INTO `youbang_sys_area` VALUES (1033, '榆树', 173, 'y', 'ys', 'yushu', '', '市', '220182', '0431', 9);
INSERT INTO `youbang_sys_area` VALUES (1034, '德惠', 173, 'd', 'dh', 'dehui', '', '市', '220183', '0431', 10);
INSERT INTO `youbang_sys_area` VALUES (1035, '昌邑', 174, 'c', 'cy', 'changyi', '', '区', '220202', '0432', 1);
INSERT INTO `youbang_sys_area` VALUES (1036, '龙潭', 174, 'l', 'lt', 'longtan', '', '区', '220203', '0432', 2);
INSERT INTO `youbang_sys_area` VALUES (1037, '船营', 174, 'c', 'cy', 'chuanying', '', '区', '220204', '0432', 3);
INSERT INTO `youbang_sys_area` VALUES (1038, '丰满', 174, 'f', 'fm', 'fengman', '', '区', '220211', '0432', 4);
INSERT INTO `youbang_sys_area` VALUES (1039, '永吉', 174, 'y', 'yj', 'yongji', '', '县', '220221', '0432', 5);
INSERT INTO `youbang_sys_area` VALUES (1040, '桦甸', 174, 'h', 'hd', 'huadian', '', '市', '220281', '0432', 6);
INSERT INTO `youbang_sys_area` VALUES (1041, '蛟河', 174, 'j', 'jh', 'jiaohe', '', '市', '220282', '0432', 7);
INSERT INTO `youbang_sys_area` VALUES (1042, '舒兰', 174, 's', 'sl', 'shulan', '', '市', '220283', '0432', 8);
INSERT INTO `youbang_sys_area` VALUES (1043, '磐石', 174, 'p', 'ps', 'panshi', '', '市', '220284', '0432', 9);
INSERT INTO `youbang_sys_area` VALUES (1044, '铁西', 175, 't', 'tx', 'tiexi', '', '区', '220302', '0434', 1);
INSERT INTO `youbang_sys_area` VALUES (1045, '铁东', 175, 't', 'td', 'tiedong', '', '区', '220303', '0434', 2);
INSERT INTO `youbang_sys_area` VALUES (1046, '梨树', 175, 'l', 'ls', 'lishu', '', '县', '220322', '0434', 3);
INSERT INTO `youbang_sys_area` VALUES (1047, '伊通', 175, 'y', 'yt', 'yitong', '满族', '自治县', '220323', '0434', 4);
INSERT INTO `youbang_sys_area` VALUES (1048, '公主岭', 175, 'g', 'gzl', 'gongzhuling', '', '市', '220381', '0434', 5);
INSERT INTO `youbang_sys_area` VALUES (1049, '双辽', 175, 's', 'sl', 'shuangliao', '', '市', '220382', '0434', 6);
INSERT INTO `youbang_sys_area` VALUES (1050, '龙山', 176, 'l', 'ls', 'longshan', '', '区', '220402', '0437', 1);
INSERT INTO `youbang_sys_area` VALUES (1051, '西安', 176, 'x', 'xa', 'xian', '', '区', '220403', '0437', 2);
INSERT INTO `youbang_sys_area` VALUES (1052, '东丰', 176, 'd', 'df', 'dongfeng', '', '县', '220421', '0437', 3);
INSERT INTO `youbang_sys_area` VALUES (1053, '东辽', 176, 'd', 'dl', 'dongliao', '', '县', '220422', '0437', 4);
INSERT INTO `youbang_sys_area` VALUES (1054, '东昌', 177, 'd', 'dc', 'dongchang', '', '区', '220502', '0435', 1);
INSERT INTO `youbang_sys_area` VALUES (1055, '二道江', 177, 'e', 'edj', 'erdaojiang', '', '区', '220503', '0435', 2);
INSERT INTO `youbang_sys_area` VALUES (1056, '通化', 177, 't', 'th', 'tonghua', '', '县', '220521', '0435', 3);
INSERT INTO `youbang_sys_area` VALUES (1057, '辉南', 177, 'h', 'hn', 'huinan', '', '县', '220523', '0435', 4);
INSERT INTO `youbang_sys_area` VALUES (1058, '柳河', 177, 'l', 'lh', 'liuhe', '', '县', '220524', '0435', 5);
INSERT INTO `youbang_sys_area` VALUES (1059, '梅河口', 177, 'm', 'mhk', 'meihekou', '', '市', '220581', '0435', 6);
INSERT INTO `youbang_sys_area` VALUES (1060, '集安', 177, 'j', 'ja', 'jian', '', '市', '220582', '0435', 7);
INSERT INTO `youbang_sys_area` VALUES (1061, '浑江', 178, 'h', 'hj', 'hunjiang', '', '区', '220602', '0439', 1);
INSERT INTO `youbang_sys_area` VALUES (1062, '江源', 178, 'j', 'jy', 'jiangyuan', '', '区', '220604', '0439', 2);
INSERT INTO `youbang_sys_area` VALUES (1063, '抚松', 178, 'f', 'fs', 'fusong', '', '县', '220621', '0439', 3);
INSERT INTO `youbang_sys_area` VALUES (1064, '靖宇', 178, 'j', 'jy', 'jingyu', '', '县', '220622', '0439', 4);
INSERT INTO `youbang_sys_area` VALUES (1065, '长白', 178, 'c', 'cb', 'changbai', '朝鲜族', '自治县', '220623', '0439', 5);
INSERT INTO `youbang_sys_area` VALUES (1066, '临江', 178, 'l', 'lj', 'linjiang', '', '市', '220681', '0439', 6);
INSERT INTO `youbang_sys_area` VALUES (1067, '宁江', 179, 'n', 'nj', 'ningjiang', '', '区', '220702', '0438', 1);
INSERT INTO `youbang_sys_area` VALUES (1068, '前郭尔罗斯', 179, 'q', 'qgels', 'qianguoerluosi', '蒙古族', '自治县', '220721', '0438', 2);
INSERT INTO `youbang_sys_area` VALUES (1069, '长岭', 179, 'c', 'cl', 'changling', '', '县', '220722', '0438', 3);
INSERT INTO `youbang_sys_area` VALUES (1070, '乾安', 179, 'q', 'qa', 'qianan', '', '县', '220723', '0438', 4);
INSERT INTO `youbang_sys_area` VALUES (1071, '扶余', 179, 'f', 'fy', 'fuyu', '', '市', '220724', '0438', 5);
INSERT INTO `youbang_sys_area` VALUES (1072, '洮北', 180, 't', 'tb', 'taobei', '', '区', '220802', '0436', 1);
INSERT INTO `youbang_sys_area` VALUES (1073, '镇赉', 180, 'z', 'zl', 'zhenlai', '', '县', '220821', '0436', 2);
INSERT INTO `youbang_sys_area` VALUES (1074, '洮南', 180, 't', 'tn', 'taonan', '', '市', '220881', '0436', 4);
INSERT INTO `youbang_sys_area` VALUES (1075, '大安', 180, 'd', 'da', 'daan', '', '市', '220882', '0436', 5);
INSERT INTO `youbang_sys_area` VALUES (1076, '通榆', 180, 't', 'ty', 'tongyu', '', '县', '220822', '0436', 3);
INSERT INTO `youbang_sys_area` VALUES (1077, '延吉', 181, 'y', 'yj', 'yanji', '', '市', '222401', '0433', 1);
INSERT INTO `youbang_sys_area` VALUES (1078, '图们', 181, 't', 'tm', 'tumen', '', '市', '222402', '0433', 2);
INSERT INTO `youbang_sys_area` VALUES (1079, '敦化', 181, 'd', 'dh', 'dunhua', '', '市', '222403', '0433', 3);
INSERT INTO `youbang_sys_area` VALUES (1080, '珲春', 181, 'h', 'hc', 'hunchun', '', '市', '222404', '0433', 4);
INSERT INTO `youbang_sys_area` VALUES (1081, '龙井', 181, 'l', 'lj', 'longjing', '', '市', '222405', '0433', 5);
INSERT INTO `youbang_sys_area` VALUES (1082, '和龙', 181, 'h', 'hl', 'helong', '', '市', '222406', '0433', 6);
INSERT INTO `youbang_sys_area` VALUES (1083, '汪清', 181, 'w', 'wq', 'wangqing', '', '县', '222424', '0433', 7);
INSERT INTO `youbang_sys_area` VALUES (1084, '安图', 181, 'a', 'at', 'antu', '', '县', '222426', '0433', 8);
INSERT INTO `youbang_sys_area` VALUES (1085, '道里', 182, 'd', 'dl', 'daoli', '', '区', '230102', '0451', 1);
INSERT INTO `youbang_sys_area` VALUES (1086, '南岗', 182, 'n', 'ng', 'nangang', '', '区', '230103', '0451', 2);
INSERT INTO `youbang_sys_area` VALUES (1087, '道外', 182, 'd', 'dw', 'daowai', '', '区', '230104', '0451', 3);
INSERT INTO `youbang_sys_area` VALUES (1088, '平房', 182, 'p', 'pf', 'pingfang', '', '区', '230108', '0451', 4);
INSERT INTO `youbang_sys_area` VALUES (1089, '松北', 182, 's', 'sb', 'songbei', '', '区', '230109', '0451', 5);
INSERT INTO `youbang_sys_area` VALUES (1090, '香坊', 182, 'x', 'xf', 'xiangfang', '', '区', '230110', '0451', 6);
INSERT INTO `youbang_sys_area` VALUES (1091, '呼兰', 182, 'h', 'hl', 'hulan', '', '区', '230111', '0451', 7);
INSERT INTO `youbang_sys_area` VALUES (1092, '阿城', 182, 'a', 'ac', 'acheng', '', '区', '230112', '0451', 8);
INSERT INTO `youbang_sys_area` VALUES (1093, '依兰', 182, 'y', 'yl', 'yilan', '', '县', '230123', '0451', 9);
INSERT INTO `youbang_sys_area` VALUES (1094, '方正', 182, 'f', 'fz', 'fangzheng', '', '县', '230124', '0451', 10);
INSERT INTO `youbang_sys_area` VALUES (1095, '宾县', 182, 'b', 'bx', 'binxian', '', '', '230125', '0451', 11);
INSERT INTO `youbang_sys_area` VALUES (1096, '巴彦', 182, 'b', 'by', 'bayan', '', '县', '230126', '0451', 12);
INSERT INTO `youbang_sys_area` VALUES (1097, '木兰', 182, 'm', 'ml', 'mulan', '', '县', '230127', '0451', 13);
INSERT INTO `youbang_sys_area` VALUES (1098, '通河', 182, 't', 'th', 'tonghe', '', '县', '230128', '0451', 14);
INSERT INTO `youbang_sys_area` VALUES (1099, '延寿', 182, 'y', 'ys', 'yanshou', '', '县', '230129', '0451', 15);
INSERT INTO `youbang_sys_area` VALUES (1100, '双城', 182, 's', 'sc', 'shuangcheng', '', '区', '230182', '0451', 16);
INSERT INTO `youbang_sys_area` VALUES (1101, '尚志', 182, 's', 'sz', 'shangzhi', '', '市', '230183', '0451', 17);
INSERT INTO `youbang_sys_area` VALUES (1102, '五常', 182, 'w', 'wc', 'wuchang', '', '市', '230184', '0451', 18);
INSERT INTO `youbang_sys_area` VALUES (1103, '龙沙', 183, 'l', 'ls', 'longsha', '', '区', '230202', '0452', 1);
INSERT INTO `youbang_sys_area` VALUES (1104, '建华', 183, 'j', 'jh', 'jianhua', '', '区', '230203', '0452', 2);
INSERT INTO `youbang_sys_area` VALUES (1105, '铁锋', 183, 't', 'tf', 'tiefeng', '', '区', '230204', '0452', 3);
INSERT INTO `youbang_sys_area` VALUES (1106, '昂昂溪', 183, 'a', 'aax', 'angangxi', '', '区', '230205', '0452', 4);
INSERT INTO `youbang_sys_area` VALUES (1107, '富拉尔基', 183, 'f', 'flej', 'fulaerji', '', '区', '230206', '0452', 5);
INSERT INTO `youbang_sys_area` VALUES (1108, '碾子山', 183, 'n', 'nzs', 'nianzishan', '', '区', '230207', '0452', 6);
INSERT INTO `youbang_sys_area` VALUES (1109, '梅里斯', 183, 'm', 'mls', 'meilisi', '达斡尔族', '区', '230208', '0452', 7);
INSERT INTO `youbang_sys_area` VALUES (1110, '龙江', 183, 'l', 'lj', 'longjiang', '', '县', '230221', '0452', 8);
INSERT INTO `youbang_sys_area` VALUES (1111, '依安', 183, 'y', 'ya', 'yian', '', '县', '230223', '0452', 9);
INSERT INTO `youbang_sys_area` VALUES (1112, '泰来', 183, 't', 'tl', 'tailai', '', '县', '230224', '0452', 10);
INSERT INTO `youbang_sys_area` VALUES (1113, '甘南', 183, 'g', 'gn', 'gannan', '', '县', '230225', '0452', 11);
INSERT INTO `youbang_sys_area` VALUES (1114, '富裕', 183, 'f', 'fy', 'fuyu', '', '县', '230227', '0452', 12);
INSERT INTO `youbang_sys_area` VALUES (1115, '克山', 183, 'k', 'ks', 'keshan', '', '县', '230229', '0452', 13);
INSERT INTO `youbang_sys_area` VALUES (1116, '克东', 183, 'k', 'kd', 'kedong', '', '县', '230230', '0452', 14);
INSERT INTO `youbang_sys_area` VALUES (1117, '拜泉', 183, 'b', 'bq', 'baiquan', '', '县', '230231', '0452', 15);
INSERT INTO `youbang_sys_area` VALUES (1118, '讷河', 183, 'n', 'nh', 'nehe', '', '市', '230281', '0452', 16);
INSERT INTO `youbang_sys_area` VALUES (1119, '鸡冠', 184, 'j', 'jg', 'jiguan', '', '区', '230302', '0467', 1);
INSERT INTO `youbang_sys_area` VALUES (1120, '恒山', 184, 'h', 'hs', 'hengshan', '', '区', '230303', '0467', 2);
INSERT INTO `youbang_sys_area` VALUES (1121, '滴道', 184, 'd', 'dd', 'didao', '', '区', '230304', '0467', 3);
INSERT INTO `youbang_sys_area` VALUES (1122, '梨树', 184, 'l', 'ls', 'lishu', '', '区', '230305', '0467', 4);
INSERT INTO `youbang_sys_area` VALUES (1123, '城子河', 184, 'c', 'czh', 'chengzihe', '', '区', '230306', '0467', 5);
INSERT INTO `youbang_sys_area` VALUES (1124, '麻山', 184, 'm', 'ms', 'mashan', '', '区', '230307', '0467', 6);
INSERT INTO `youbang_sys_area` VALUES (1125, '鸡东', 184, 'j', 'jd', 'jidong', '', '县', '230321', '0467', 7);
INSERT INTO `youbang_sys_area` VALUES (1126, '虎林', 184, 'h', 'hl', 'hulin', '', '市', '230381', '0467', 8);
INSERT INTO `youbang_sys_area` VALUES (1127, '密山', 184, 'm', 'ms', 'mishan', '', '市', '230382', '0467', 9);
INSERT INTO `youbang_sys_area` VALUES (1128, '向阳', 185, 'x', 'xy', 'xiangyang', '', '区', '230402', '0468', 1);
INSERT INTO `youbang_sys_area` VALUES (1129, '工农', 185, 'g', 'gn', 'gongnong', '', '区', '230403', '0468', 2);
INSERT INTO `youbang_sys_area` VALUES (1130, '南山', 185, 'n', 'ns', 'nanshan', '', '区', '230404', '0468', 3);
INSERT INTO `youbang_sys_area` VALUES (1131, '兴安', 185, 'x', 'xa', 'xingan', '', '区', '230405', '0468', 4);
INSERT INTO `youbang_sys_area` VALUES (1132, '东山', 185, 'd', 'ds', 'dongshan', '', '区', '230406', '0468', 5);
INSERT INTO `youbang_sys_area` VALUES (1133, '兴山', 185, 'x', 'xs', 'xingshan', '', '区', '230407', '0468', 6);
INSERT INTO `youbang_sys_area` VALUES (1134, '萝北', 185, 'l', 'lb', 'luobei', '', '县', '230421', '0468', 7);
INSERT INTO `youbang_sys_area` VALUES (1135, '绥滨', 185, 's', 'sb', 'suibin', '', '县', '230422', '0468', 8);
INSERT INTO `youbang_sys_area` VALUES (1136, '尖山', 186, 'j', 'js', 'jianshan', '', '区', '230502', '0469', 1);
INSERT INTO `youbang_sys_area` VALUES (1137, '岭东', 186, 'l', 'ld', 'lingdong', '', '区', '230503', '0469', 2);
INSERT INTO `youbang_sys_area` VALUES (1138, '四方台', 186, 's', 'sft', 'sifangtai', '', '区', '230505', '0469', 3);
INSERT INTO `youbang_sys_area` VALUES (1139, '宝山', 186, 'b', 'bs', 'baoshan', '', '区', '230506', '0469', 4);
INSERT INTO `youbang_sys_area` VALUES (1140, '集贤', 186, 'j', 'jx', 'jixian', '', '县', '230521', '0469', 5);
INSERT INTO `youbang_sys_area` VALUES (1141, '友谊', 186, 'y', 'yy', 'youyi', '', '县', '230522', '0469', 6);
INSERT INTO `youbang_sys_area` VALUES (1142, '宝清', 186, 'b', 'bq', 'baoqing', '', '县', '230523', '0469', 7);
INSERT INTO `youbang_sys_area` VALUES (1143, '饶河', 186, 'r', 'rh', 'raohe', '', '县', '230524', '0469', 8);
INSERT INTO `youbang_sys_area` VALUES (1144, '萨尔图', 187, 's', 'set', 'saertu', '', '区', '230602', '0459', 1);
INSERT INTO `youbang_sys_area` VALUES (1145, '龙凤', 187, 'l', 'lf', 'longfeng', '', '区', '230603', '0459', 2);
INSERT INTO `youbang_sys_area` VALUES (1146, '让胡路', 187, 'r', 'rhl', 'ranghulu', '', '区', '230604', '0459', 3);
INSERT INTO `youbang_sys_area` VALUES (1147, '红岗', 187, 'h', 'hg', 'honggang', '', '区', '230605', '0459', 4);
INSERT INTO `youbang_sys_area` VALUES (1148, '大同', 187, 'd', 'dt', 'datong', '', '区', '230606', '0459', 5);
INSERT INTO `youbang_sys_area` VALUES (1149, '肇州', 187, 'z', 'zz', 'zhaozhou', '', '县', '230621', '0459', 6);
INSERT INTO `youbang_sys_area` VALUES (1150, '肇源', 187, 'z', 'zy', 'zhaoyuan', '', '县', '230622', '0459', 7);
INSERT INTO `youbang_sys_area` VALUES (1151, '林甸', 187, 'l', 'ld', 'lindian', '', '县', '230623', '0459', 8);
INSERT INTO `youbang_sys_area` VALUES (1152, '杜尔伯特', 187, 'd', 'debt', 'duerbote', '蒙古族', '自治县', '230624', '0459', 9);
INSERT INTO `youbang_sys_area` VALUES (1153, '伊春', 188, 'y', 'yc', 'yichun', '', '区', '230702', '0458', 1);
INSERT INTO `youbang_sys_area` VALUES (1154, '南岔', 188, 'n', 'nc', 'nancha', '', '区', '230703', '0458', 2);
INSERT INTO `youbang_sys_area` VALUES (1155, '友好', 188, 'y', 'yh', 'youhao', '', '区', '230704', '0458', 3);
INSERT INTO `youbang_sys_area` VALUES (1156, '西林', 188, 'x', 'xl', 'xilin', '', '区', '230705', '0458', 4);
INSERT INTO `youbang_sys_area` VALUES (1157, '翠峦', 188, 'c', 'cl', 'cuiluan', '', '区', '230706', '0458', 5);
INSERT INTO `youbang_sys_area` VALUES (1158, '新青', 188, 'x', 'xq', 'xinqing', '', '区', '230707', '0458', 6);
INSERT INTO `youbang_sys_area` VALUES (1159, '美溪', 188, 'm', 'mx', 'meixi', '', '区', '230708', '0458', 7);
INSERT INTO `youbang_sys_area` VALUES (1160, '金山屯', 188, 'j', 'jst', 'jinshantun', '', '区', '230709', '0458', 8);
INSERT INTO `youbang_sys_area` VALUES (1161, '五营', 188, 'w', 'wy', 'wuying', '', '区', '230710', '0458', 9);
INSERT INTO `youbang_sys_area` VALUES (1162, '乌马河', 188, 'w', 'wmh', 'wumahe', '', '区', '230711', '0458', 10);
INSERT INTO `youbang_sys_area` VALUES (1163, '汤旺河', 188, 't', 'twh', 'tangwanghe', '', '区', '230712', '0458', 11);
INSERT INTO `youbang_sys_area` VALUES (1164, '带岭', 188, 'd', 'dl', 'dailing', '', '区', '230713', '0458', 12);
INSERT INTO `youbang_sys_area` VALUES (1165, '乌伊岭', 188, 'w', 'wyl', 'wuyiling', '', '区', '230714', '0458', 13);
INSERT INTO `youbang_sys_area` VALUES (1166, '红星', 188, 'h', 'hx', 'hongxing', '', '区', '230715', '0458', 14);
INSERT INTO `youbang_sys_area` VALUES (1167, '上甘岭', 188, 's', 'sgl', 'shangganling', '', '区', '230716', '0458', 15);
INSERT INTO `youbang_sys_area` VALUES (1168, '嘉荫', 188, 'j', 'jy', 'jiayin', '', '县', '230722', '0458', 16);
INSERT INTO `youbang_sys_area` VALUES (1169, '铁力', 188, 't', 'tl', 'tieli', '', '市', '230781', '0458', 17);
INSERT INTO `youbang_sys_area` VALUES (1170, '向阳', 189, 'x', 'xy', 'xiangyang', '', '区', '230803', '0454', 1);
INSERT INTO `youbang_sys_area` VALUES (1171, '前进', 189, 'q', 'qj', 'qianjin', '', '区', '230804', '0454', 2);
INSERT INTO `youbang_sys_area` VALUES (1172, '东风', 189, 'd', 'df', 'dongfeng', '', '区', '230805', '0454', 3);
INSERT INTO `youbang_sys_area` VALUES (1173, '郊区', 189, 'j', 'jq', 'jiaoqu', '', '', '230811', '0454', 4);
INSERT INTO `youbang_sys_area` VALUES (1174, '桦南', 189, 'h', 'hn', 'huanan', '', '县', '230822', '0454', 5);
INSERT INTO `youbang_sys_area` VALUES (1175, '桦川', 189, 'h', 'hc', 'huachuan', '', '县', '230826', '0454', 6);
INSERT INTO `youbang_sys_area` VALUES (1176, '汤原', 189, 't', 'ty', 'tangyuan', '', '县', '230828', '0454', 7);
INSERT INTO `youbang_sys_area` VALUES (1177, '抚远', 189, 'f', 'fy', 'fuyuan', '', '市', '230833', '0454', 8);
INSERT INTO `youbang_sys_area` VALUES (1178, '同江', 189, 't', 'tj', 'tongjiang', '', '市', '230881', '0454', 9);
INSERT INTO `youbang_sys_area` VALUES (1179, '富锦', 189, 'f', 'fj', 'fujin', '', '市', '230882', '0454', 10);
INSERT INTO `youbang_sys_area` VALUES (1180, '新兴', 190, 'x', 'xx', 'xinxing', '', '区', '230902', '0464', 1);
INSERT INTO `youbang_sys_area` VALUES (1181, '桃山', 190, 't', 'ts', 'taoshan', '', '区', '230903', '0464', 2);
INSERT INTO `youbang_sys_area` VALUES (1182, '茄子河', 190, 'q', 'qzh', 'qiezihe', '', '区', '230904', '0464', 3);
INSERT INTO `youbang_sys_area` VALUES (1183, '勃利', 190, 'b', 'bl', 'boli', '', '县', '230921', '0464', 4);
INSERT INTO `youbang_sys_area` VALUES (1184, '东安', 191, 'd', 'da', 'dongan', '', '区', '231002', '0453', 1);
INSERT INTO `youbang_sys_area` VALUES (1185, '阳明', 191, 'y', 'ym', 'yangming', '', '区', '231003', '0453', 2);
INSERT INTO `youbang_sys_area` VALUES (1186, '爱民', 191, 'a', 'am', 'aimin', '', '区', '231004', '0453', 3);
INSERT INTO `youbang_sys_area` VALUES (1187, '西安', 191, 'x', 'xa', 'xian', '', '区', '231005', '0453', 4);
INSERT INTO `youbang_sys_area` VALUES (1188, '东宁', 191, 'd', 'dn', 'dongning', '', '市', '231024', '0453', 5);
INSERT INTO `youbang_sys_area` VALUES (1189, '林口', 191, 'l', 'lk', 'linkou', '', '县', '231025', '0453', 6);
INSERT INTO `youbang_sys_area` VALUES (1190, '绥芬河', 191, 's', 'sfh', 'suifenhe', '', '市', '231081', '0453', 7);
INSERT INTO `youbang_sys_area` VALUES (1191, '海林', 191, 'h', 'hl', 'hailin', '', '市', '231083', '0453', 8);
INSERT INTO `youbang_sys_area` VALUES (1192, '宁安', 191, 'n', 'na', 'ningan', '', '市', '231084', '0453', 9);
INSERT INTO `youbang_sys_area` VALUES (1193, '穆棱', 191, 'm', 'ml', 'muleng', '', '市', '231085', '0453', 10);
INSERT INTO `youbang_sys_area` VALUES (1194, '爱辉', 192, 'a', 'ah', 'aihui', '', '区', '231102', '0456', 1);
INSERT INTO `youbang_sys_area` VALUES (1195, '嫩江', 192, 'n', 'nj', 'nenjiang', '', '县', '231121', '0456', 2);
INSERT INTO `youbang_sys_area` VALUES (1196, '逊克', 192, 'x', 'xk', 'xunke', '', '县', '231123', '0456', 3);
INSERT INTO `youbang_sys_area` VALUES (1197, '孙吴', 192, 's', 'sw', 'sunwu', '', '县', '231124', '0456', 4);
INSERT INTO `youbang_sys_area` VALUES (1198, '北安', 192, 'b', 'ba', 'beian', '', '市', '231181', '0456', 5);
INSERT INTO `youbang_sys_area` VALUES (1199, '五大连池', 192, 'w', 'wdlc', 'wudalianchi', '', '市', '231182', '0456', 6);
INSERT INTO `youbang_sys_area` VALUES (1200, '北林', 193, 'b', 'bl', 'beilin', '', '区', '231202', '0455', 1);
INSERT INTO `youbang_sys_area` VALUES (1201, '望奎', 193, 'w', 'wk', 'wangkui', '', '县', '231221', '0455', 2);
INSERT INTO `youbang_sys_area` VALUES (1202, '兰西', 193, 'l', 'lx', 'lanxi', '', '县', '231222', '0455', 3);
INSERT INTO `youbang_sys_area` VALUES (1203, '青冈', 193, 'q', 'qg', 'qinggang', '', '县', '231223', '0455', 4);
INSERT INTO `youbang_sys_area` VALUES (1204, '庆安', 193, 'q', 'qa', 'qingan', '', '县', '231224', '0455', 5);
INSERT INTO `youbang_sys_area` VALUES (1205, '明水', 193, 'm', 'ms', 'mingshui', '', '县', '231225', '0455', 6);
INSERT INTO `youbang_sys_area` VALUES (1206, '绥棱', 193, 's', 'sl', 'suileng', '', '县', '231226', '0455', 7);
INSERT INTO `youbang_sys_area` VALUES (1207, '安达', 193, 'a', 'ad', 'anda', '', '市', '231281', '0455', 8);
INSERT INTO `youbang_sys_area` VALUES (1208, '肇东', 193, 'z', 'zd', 'zhaodong', '', '市', '231282', '0455', 9);
INSERT INTO `youbang_sys_area` VALUES (1209, '海伦', 193, 'h', 'hl', 'hailun', '', '市', '231283', '0455', 10);
INSERT INTO `youbang_sys_area` VALUES (1210, '加格达奇', 194, 'j', 'jgdq', 'jiagedaqi', '', '区', '232701', '0457', 1);
INSERT INTO `youbang_sys_area` VALUES (1211, '松岭', 194, 's', 'sl', 'songling', '', '区', '232702', '0457', 2);
INSERT INTO `youbang_sys_area` VALUES (1212, '新林', 194, 'x', 'xl', 'xinlin', '', '区', '232703', '0457', 3);
INSERT INTO `youbang_sys_area` VALUES (1213, '呼中', 194, 'h', 'hz', 'huzhong', '', '区', '232704', '0457', 4);
INSERT INTO `youbang_sys_area` VALUES (1214, '呼玛', 194, 'h', 'hm', 'huma', '', '县', '232721', '0457', 5);
INSERT INTO `youbang_sys_area` VALUES (1215, '塔河', 194, 't', 'th', 'tahe', '', '县', '232722', '0457', 6);
INSERT INTO `youbang_sys_area` VALUES (1216, '漠河', 194, 'm', 'mh', 'mohe', '', '市', '232701', '0457', 7);
INSERT INTO `youbang_sys_area` VALUES (1217, '玄武', 195, 'x', 'xw', 'xuanwu', '', '区', '320102', '', 1);
INSERT INTO `youbang_sys_area` VALUES (1218, '秦淮', 195, 'q', 'qh', 'qinhuai', '', '区', '320104', '', 2);
INSERT INTO `youbang_sys_area` VALUES (1219, '建邺', 195, 'j', 'jy', 'jianye', '', '区', '320105', '', 3);
INSERT INTO `youbang_sys_area` VALUES (1220, '鼓楼', 195, 'g', 'gl', 'gulou', '', '区', '320106', '', 4);
INSERT INTO `youbang_sys_area` VALUES (1221, '浦口', 195, 'p', 'pk', 'pukou', '', '区', '320111', '', 5);
INSERT INTO `youbang_sys_area` VALUES (1222, '栖霞', 195, 'q', 'qx', 'qixia', '', '区', '320113', '', 6);
INSERT INTO `youbang_sys_area` VALUES (1223, '雨花台', 195, 'y', 'yht', 'yuhuatai', '', '区', '320114', '', 7);
INSERT INTO `youbang_sys_area` VALUES (1224, '江宁', 195, 'j', 'jn', 'jiangning', '', '区', '320115', '', 8);
INSERT INTO `youbang_sys_area` VALUES (1225, '六合', 195, 'l', 'lh', 'liuhe', '', '区', '320116', '', 9);
INSERT INTO `youbang_sys_area` VALUES (1226, '溧水', 195, 'l', 'ls', 'lishui', '', '区', '320124', '', 10);
INSERT INTO `youbang_sys_area` VALUES (1227, '高淳', 195, 'g', 'gc', 'gaochun', '', '区', '320125', '', 11);
INSERT INTO `youbang_sys_area` VALUES (1228, '梁溪', 196, 'l', 'lx', 'liangxi', '', '区', '320202', '0510', 1);
INSERT INTO `youbang_sys_area` VALUES (1229, '新吴', 196, 'x', 'xw', 'xinwu', '', '区', '', '0510', 2);
INSERT INTO `youbang_sys_area` VALUES (1231, '锡山', 196, 'x', 'xs', 'xishan', '', '区', '320205', '0510', 4);
INSERT INTO `youbang_sys_area` VALUES (1232, '惠山', 196, 'h', 'hs', 'huishan', '', '区', '320206', '0510', 5);
INSERT INTO `youbang_sys_area` VALUES (1233, '滨湖', 196, 'b', 'bh', 'binhu', '', '区', '320211', '0510', 6);
INSERT INTO `youbang_sys_area` VALUES (1234, '江阴', 196, 'j', 'jy', 'jiangyin', '', '市', '320281', '0510', 7);
INSERT INTO `youbang_sys_area` VALUES (1235, '宜兴', 196, 'y', 'yx', 'yixing', '', '市', '320282', '0510', 8);
INSERT INTO `youbang_sys_area` VALUES (1236, '鼓楼', 197, 'g', 'gl', 'gulou', '', '区', '320302', '0516', 1);
INSERT INTO `youbang_sys_area` VALUES (1237, '云龙', 197, 'y', 'yl', 'yunlong', '', '区', '320303', '0516', 2);
INSERT INTO `youbang_sys_area` VALUES (1238, '贾汪', 197, 'j', 'jw', 'jiawang', '', '区', '320305', '0516', 3);
INSERT INTO `youbang_sys_area` VALUES (1239, '泉山', 197, 'q', 'qs', 'quanshan', '', '区', '320311', '0516', 4);
INSERT INTO `youbang_sys_area` VALUES (1240, '铜山', 197, 't', 'ts', 'tongshan', '', '区', '320312', '0516', 5);
INSERT INTO `youbang_sys_area` VALUES (1241, '丰县', 197, 'f', 'fx', 'fengxian', '', '', '320321', '0516', 6);
INSERT INTO `youbang_sys_area` VALUES (1242, '沛县', 197, 'p', 'px', 'peixian', '', '', '320322', '0516', 7);
INSERT INTO `youbang_sys_area` VALUES (1243, '睢宁', 197, 's', 'sn', 'suining', '', '县', '320324', '0516', 8);
INSERT INTO `youbang_sys_area` VALUES (1244, '新沂', 197, 'x', 'xy', 'xinyi', '', '市', '320381', '0516', 9);
INSERT INTO `youbang_sys_area` VALUES (1245, '邳州', 197, 'p', 'pz', 'pizhou', '', '市', '320382', '0516', 10);
INSERT INTO `youbang_sys_area` VALUES (1246, '天宁', 198, 't', 'tn', 'tianning', '', '区', '320402', '0519', 1);
INSERT INTO `youbang_sys_area` VALUES (1247, '钟楼', 198, 'z', 'zl', 'zhonglou', '', '区', '320404', '0519', 2);
INSERT INTO `youbang_sys_area` VALUES (1249, '新北', 198, 'x', 'xb', 'xinbei', '', '区', '320411', '0519', 4);
INSERT INTO `youbang_sys_area` VALUES (1250, '武进', 198, 'w', 'wj', 'wujin', '', '区', '320412', '0519', 5);
INSERT INTO `youbang_sys_area` VALUES (1251, '溧阳', 198, 'l', 'ly', 'liyang', '', '市', '320481', '0519', 6);
INSERT INTO `youbang_sys_area` VALUES (1252, '金坛', 198, 'j', 'jt', 'jintan', '', '区', '320482', '0519', 7);
INSERT INTO `youbang_sys_area` VALUES (1253, '虎丘', 199, 'h', 'hq', 'huqiu', '', '区', '320505', '0512', 1);
INSERT INTO `youbang_sys_area` VALUES (1254, '吴中', 199, 'w', 'wz', 'wuzhong', '', '区', '320506', '0512', 2);
INSERT INTO `youbang_sys_area` VALUES (1255, '相城', 199, 'x', 'xc', 'xiangcheng', '', '区', '320507', '0512', 3);
INSERT INTO `youbang_sys_area` VALUES (1256, '姑苏', 199, 'g', 'gs', 'gusu', '', '区', '320508', '0512', 4);
INSERT INTO `youbang_sys_area` VALUES (1257, '吴江', 199, 'w', 'wj', 'wujiang', '', '市', '320509', '0512', 5);
INSERT INTO `youbang_sys_area` VALUES (1258, '常熟', 199, 'c', 'cs', 'changshu', '', '市', '320581', '0512', 6);
INSERT INTO `youbang_sys_area` VALUES (1259, '张家港', 199, 'z', 'zjg', 'zhangjiagang', '', '市', '320582', '0512', 7);
INSERT INTO `youbang_sys_area` VALUES (1260, '昆山', 199, 'k', 'ks', 'kunshan', '', '市', '320583', '0512', 8);
INSERT INTO `youbang_sys_area` VALUES (1261, '太仓', 199, 't', 'tc', 'taicang', '', '市', '320585', '0512', 9);
INSERT INTO `youbang_sys_area` VALUES (1262, '崇川', 200, 'c', 'cc', 'chongchuan', '', '区', '320602', '0513', 1);
INSERT INTO `youbang_sys_area` VALUES (1263, '港闸', 200, 'g', 'gz', 'gangzha', '', '区', '320611', '0513', 2);
INSERT INTO `youbang_sys_area` VALUES (1264, '通州', 200, 't', 'tz', 'tongzhou', '', '区', '320612', '0513', 3);
INSERT INTO `youbang_sys_area` VALUES (1265, '海安', 200, 'h', 'ha', 'haian', '', '县', '320621', '0513', 4);
INSERT INTO `youbang_sys_area` VALUES (1266, '如东', 200, 'r', 'rd', 'rudong', '', '县', '320623', '0513', 5);
INSERT INTO `youbang_sys_area` VALUES (1267, '启东', 200, 'q', 'qd', 'qidong', '', '市', '320681', '0513', 6);
INSERT INTO `youbang_sys_area` VALUES (1268, '如皋', 200, 'r', 'rg', 'rugao', '', '市', '320682', '0513', 7);
INSERT INTO `youbang_sys_area` VALUES (1269, '海门', 200, 'h', 'hm', 'haimen', '', '市', '320684', '0513', 8);
INSERT INTO `youbang_sys_area` VALUES (1270, '连云', 201, 'l', 'ly', 'lianyun', '', '区', '320703', '0518', 1);
INSERT INTO `youbang_sys_area` VALUES (1272, '海州', 201, 'h', 'hz', 'haizhou', '', '区', '320706', '0518', 2);
INSERT INTO `youbang_sys_area` VALUES (1273, '赣榆', 201, 'g', 'gy', 'ganyu', '', '区', '320721', '0518', 3);
INSERT INTO `youbang_sys_area` VALUES (1274, '东海', 201, 'd', 'dh', 'donghai', '', '县', '320722', '0518', 4);
INSERT INTO `youbang_sys_area` VALUES (1275, '灌云', 201, 'g', 'gy', 'guanyun', '', '县', '320723', '0518', 5);
INSERT INTO `youbang_sys_area` VALUES (1276, '灌南', 201, 'g', 'gn', 'guannan', '', '县', '320724', '0518', 6);
INSERT INTO `youbang_sys_area` VALUES (1277, '清河', 202, 'q', 'qh', 'qinghe', '', '区', '320802', '0517', 1);
INSERT INTO `youbang_sys_area` VALUES (1278, '淮安', 202, 'h', 'ha', 'huaian', '', '区', '320803', '0517', 2);
INSERT INTO `youbang_sys_area` VALUES (1279, '淮阴', 202, 'h', 'hy', 'huaiyin', '', '区', '320804', '0517', 3);
INSERT INTO `youbang_sys_area` VALUES (1280, '清浦', 202, 'q', 'qp', 'qingpu', '', '区', '320811', '0517', 4);
INSERT INTO `youbang_sys_area` VALUES (1281, '涟水', 202, 'l', 'ls', 'lianshui', '', '县', '320826', '0517', 5);
INSERT INTO `youbang_sys_area` VALUES (1282, '洪泽', 202, 'h', 'hz', 'hongze', '', '县', '320829', '0517', 6);
INSERT INTO `youbang_sys_area` VALUES (1283, '盱眙', 202, 'x', 'xy', 'xuyi', '', '县', '320830', '0517', 7);
INSERT INTO `youbang_sys_area` VALUES (1284, '金湖', 202, 'j', 'jh', 'jinhu', '', '县', '320831', '0517', 8);
INSERT INTO `youbang_sys_area` VALUES (1285, '亭湖', 203, 't', 'th', 'tinghu', '', '区', '320902', '0515', 1);
INSERT INTO `youbang_sys_area` VALUES (1286, '盐都', 203, 'y', 'yd', 'yandu', '', '区', '320903', '0515', 2);
INSERT INTO `youbang_sys_area` VALUES (1287, '响水', 203, 'x', 'xs', 'xiangshui', '', '县', '320921', '0515', 3);
INSERT INTO `youbang_sys_area` VALUES (1288, '滨海', 203, 'b', 'bh', 'binhai', '', '县', '320922', '0515', 4);
INSERT INTO `youbang_sys_area` VALUES (1289, '阜宁', 203, 'f', 'fn', 'funing', '', '县', '320923', '0515', 5);
INSERT INTO `youbang_sys_area` VALUES (1290, '射阳', 203, 's', 'sy', 'sheyang', '', '县', '320924', '0515', 6);
INSERT INTO `youbang_sys_area` VALUES (1291, '建湖', 203, 'j', 'jh', 'jianhu', '', '县', '320925', '0515', 7);
INSERT INTO `youbang_sys_area` VALUES (1292, '东台', 203, 'd', 'dt', 'dongtai', '', '市', '320981', '0515', 8);
INSERT INTO `youbang_sys_area` VALUES (1293, '大丰', 203, 'd', 'df', 'dafeng', '', '区', '320982', '0515', 9);
INSERT INTO `youbang_sys_area` VALUES (1294, '广陵', 204, 'g', 'gl', 'guangling', '', '区', '321002', '0514', 1);
INSERT INTO `youbang_sys_area` VALUES (1295, '邗江', 204, 'h', 'hj', 'hanjiang', '', '区', '321003', '0514', 2);
INSERT INTO `youbang_sys_area` VALUES (1296, '江都', 204, 'j', 'jd', 'jiangu', '', '区', '321012', '0514', 3);
INSERT INTO `youbang_sys_area` VALUES (1297, '宝应', 204, 'b', 'by', 'baoying', '', '县', '321023', '0514', 4);
INSERT INTO `youbang_sys_area` VALUES (1298, '仪征', 204, 'y', 'yz', 'yizheng', '', '市', '321081', '0514', 5);
INSERT INTO `youbang_sys_area` VALUES (1299, '高邮', 204, 'g', 'gy', 'gaoyou', '', '市', '321084', '0514', 6);
INSERT INTO `youbang_sys_area` VALUES (1300, '京口', 205, 'j', 'jk', 'jingkou', '', '区', '321102', '0511', 1);
INSERT INTO `youbang_sys_area` VALUES (1301, '润州', 205, 'r', 'rz', 'runzhou', '', '区', '321111', '0511', 2);
INSERT INTO `youbang_sys_area` VALUES (1302, '丹徒', 205, 'd', 'dt', 'dantu', '', '区', '321112', '0511', 3);
INSERT INTO `youbang_sys_area` VALUES (1303, '丹阳', 205, 'd', 'dy', 'danyang', '', '市', '321181', '0511', 4);
INSERT INTO `youbang_sys_area` VALUES (1304, '扬中', 205, 'y', 'yz', 'yangzhong', '', '市', '321182', '0511', 5);
INSERT INTO `youbang_sys_area` VALUES (1305, '句容', 205, 'j', 'jr', 'jurong', '', '市', '321183', '0511', 6);
INSERT INTO `youbang_sys_area` VALUES (1306, '海陵', 206, 'h', 'hl', 'hailing', '', '区', '321202', '0523', 1);
INSERT INTO `youbang_sys_area` VALUES (1307, '高港', 206, 'g', 'gg', 'gaogang', '', '区', '321203', '0523', 2);
INSERT INTO `youbang_sys_area` VALUES (1308, '兴化', 206, 'x', 'xh', 'xinghua', '', '市', '321281', '0523', 3);
INSERT INTO `youbang_sys_area` VALUES (1309, '靖江', 206, 'j', 'jj', 'jingjiang', '', '市', '321282', '0523', 4);
INSERT INTO `youbang_sys_area` VALUES (1310, '泰兴', 206, 't', 'tx', 'taixing', '', '市', '321283', '0523', 5);
INSERT INTO `youbang_sys_area` VALUES (1311, '姜堰', 206, 'j', 'jy', 'jiangyan', '', '区', '321284', '0523', 6);
INSERT INTO `youbang_sys_area` VALUES (1312, '宿城', 207, 's', 'sc', 'sucheng', '', '区', '321302', '0527', 1);
INSERT INTO `youbang_sys_area` VALUES (1313, '宿豫', 207, 's', 'sy', 'suyu', '', '区', '321311', '0527', 2);
INSERT INTO `youbang_sys_area` VALUES (1314, '沭阳', 207, 's', 'sy', 'shuyang', '', '县', '321322', '0527', 3);
INSERT INTO `youbang_sys_area` VALUES (1315, '泗阳', 207, 's', 'sy', 'siyang', '', '县', '321323', '0527', 4);
INSERT INTO `youbang_sys_area` VALUES (1316, '泗洪', 207, 's', 'sh', 'sihong', '', '县', '321324', '0527', 5);
INSERT INTO `youbang_sys_area` VALUES (1317, '上城', 208, 's', 'sc', 'shangcheng', '', '区', '330102', '0571', 1);
INSERT INTO `youbang_sys_area` VALUES (1318, '下城', 208, 'x', 'xc', 'xiacheng', '', '区', '330103', '0571', 2);
INSERT INTO `youbang_sys_area` VALUES (1319, '江干', 208, 'j', 'jg', 'jianggan', '', '区', '330104', '0571', 3);
INSERT INTO `youbang_sys_area` VALUES (1320, '拱墅', 208, 'g', 'gs', 'gongshu', '', '区', '330105', '0571', 4);
INSERT INTO `youbang_sys_area` VALUES (1321, '西湖', 208, 'x', 'xh', 'xihu', '', '区', '330106', '0571', 5);
INSERT INTO `youbang_sys_area` VALUES (1322, '滨江', 208, 'b', 'bj', 'binjiang', '', '区', '330108', '0571', 6);
INSERT INTO `youbang_sys_area` VALUES (1323, '萧山', 208, 'x', 'xs', 'xiaoshan', '', '区', '330109', '0571', 7);
INSERT INTO `youbang_sys_area` VALUES (1324, '余杭', 208, 'y', 'yh', 'yuhang', '', '区', '330110', '0571', 8);
INSERT INTO `youbang_sys_area` VALUES (1325, '桐庐', 208, 't', 'tl', 'tonglu', '', '县', '330122', '0571', 9);
INSERT INTO `youbang_sys_area` VALUES (1326, '淳安', 208, 'c', 'ca', 'chunan', '', '县', '330127', '0571', 11);
INSERT INTO `youbang_sys_area` VALUES (1327, '建德', 208, 'j', 'jd', 'jiande', '', '市', '330182', '0571', 12);
INSERT INTO `youbang_sys_area` VALUES (1328, '富阳', 208, 'f', 'fy', 'fuyang', '', '区', '330183', '0571', 10);
INSERT INTO `youbang_sys_area` VALUES (1329, '临安', 208, 'l', 'la', 'linan', '', '市', '330185', '0571', 13);
INSERT INTO `youbang_sys_area` VALUES (1330, '海曙', 209, 'h', 'hs', 'haishu', '', '区', '330203', '0574', 1);
INSERT INTO `youbang_sys_area` VALUES (1332, '江北', 209, 'j', 'jb', 'jiangbei', '', '区', '330205', '0574', 3);
INSERT INTO `youbang_sys_area` VALUES (1333, '北仑', 209, 'b', 'bl', 'beilun', '', '区', '330206', '0574', 4);
INSERT INTO `youbang_sys_area` VALUES (1334, '镇海', 209, 'z', 'zh', 'zhenhai', '', '区', '330211', '0574', 5);
INSERT INTO `youbang_sys_area` VALUES (1335, '鄞州', 209, 'y', 'yz', 'yinzhou', '', '区', '330212', '0574', 6);
INSERT INTO `youbang_sys_area` VALUES (1336, '象山', 209, 'x', 'xs', 'xiangshan', '', '县', '330225', '0574', 7);
INSERT INTO `youbang_sys_area` VALUES (1337, '宁海', 209, 'n', 'nh', 'ninghai', '', '县', '330226', '0574', 8);
INSERT INTO `youbang_sys_area` VALUES (1338, '余姚', 209, 'y', 'yy', 'yuyao', '', '市', '330281', '0574', 9);
INSERT INTO `youbang_sys_area` VALUES (1339, '慈溪', 209, 'c', 'cx', 'cixi', '', '市', '330282', '0574', 10);
INSERT INTO `youbang_sys_area` VALUES (1340, '奉化', 209, 'f', 'fh', 'fenghua', '', '区', '330283', '0574', 11);
INSERT INTO `youbang_sys_area` VALUES (1341, '鹿城', 210, 'l', 'lc', 'lucheng', '', '区', '330302', '0577', 1);
INSERT INTO `youbang_sys_area` VALUES (1342, '龙湾', 210, 'l', 'lw', 'longwan', '', '区', '330303', '0577', 2);
INSERT INTO `youbang_sys_area` VALUES (1343, '瓯海', 210, 'o', 'oh', 'ouhai', '', '区', '330304', '0577', 3);
INSERT INTO `youbang_sys_area` VALUES (1344, '洞头', 210, 'd', 'dt', 'dongtou', '', '区', '330322', '0577', 4);
INSERT INTO `youbang_sys_area` VALUES (1345, '永嘉', 210, 'y', 'yj', 'yongjia', '', '县', '330324', '0577', 5);
INSERT INTO `youbang_sys_area` VALUES (1346, '平阳', 210, 'p', 'py', 'pingyang', '', '县', '330326', '0577', 6);
INSERT INTO `youbang_sys_area` VALUES (1347, '苍南', 210, 'c', 'cn', 'cangnan', '', '县', '330327', '0577', 7);
INSERT INTO `youbang_sys_area` VALUES (1348, '文成', 210, 'w', 'wc', 'wencheng', '', '县', '330328', '0577', 8);
INSERT INTO `youbang_sys_area` VALUES (1349, '泰顺', 210, 't', 'ts', 'taishun', '', '县', '330329', '0577', 9);
INSERT INTO `youbang_sys_area` VALUES (1350, '瑞安', 210, 'r', 'ra', 'ruian', '', '市', '330381', '0577', 10);
INSERT INTO `youbang_sys_area` VALUES (1351, '乐清', 210, 'l', 'lq', 'leqing', '', '市', '330382', '0577', 11);
INSERT INTO `youbang_sys_area` VALUES (1352, '南湖', 211, 'n', 'nh', 'nanhu', '', '区', '330402', '0573', 1);
INSERT INTO `youbang_sys_area` VALUES (1353, '秀洲', 211, 'x', 'xz', 'xiuzhou', '', '区', '330411', '0573', 2);
INSERT INTO `youbang_sys_area` VALUES (1354, '嘉善', 211, 'j', 'js', 'jiashan', '', '县', '330421', '0573', 3);
INSERT INTO `youbang_sys_area` VALUES (1355, '海盐', 211, 'h', 'hy', 'haiyan', '', '县', '330424', '0573', 4);
INSERT INTO `youbang_sys_area` VALUES (1356, '海宁', 211, 'h', 'hn', 'haining', '', '市', '330481', '0573', 5);
INSERT INTO `youbang_sys_area` VALUES (1357, '平湖', 211, 'p', 'ph', 'pinghu', '', '市', '330482', '0573', 6);
INSERT INTO `youbang_sys_area` VALUES (1358, '桐乡', 211, 't', 'tx', 'tongxiang', '', '市', '330483', '0573', 7);
INSERT INTO `youbang_sys_area` VALUES (1359, '吴兴', 212, 'w', 'wx', 'wuxing', '', '区', '330502', '0572', 1);
INSERT INTO `youbang_sys_area` VALUES (1360, '南浔', 212, 'n', 'nx', 'nanxun', '', '区', '330503', '0572', 2);
INSERT INTO `youbang_sys_area` VALUES (1361, '德清', 212, 'd', 'dq', 'deqing', '', '县', '330521', '0572', 3);
INSERT INTO `youbang_sys_area` VALUES (1362, '长兴', 212, 'c', 'cx', 'changxing', '', '县', '330522', '0572', 4);
INSERT INTO `youbang_sys_area` VALUES (1363, '安吉', 212, 'a', 'aj', 'anji', '', '县', '330523', '0572', 5);
INSERT INTO `youbang_sys_area` VALUES (1364, '越城', 213, 'y', 'yc', 'yuecheng', '', '区', '330602', '0575', 1);
INSERT INTO `youbang_sys_area` VALUES (1365, '柯桥', 213, 'k', 'kq', 'keqiao', '', '区', '330603', '0575', 2);
INSERT INTO `youbang_sys_area` VALUES (1366, '新昌', 213, 'x', 'xc', 'xinchang', '', '县', '330624', '0575', 4);
INSERT INTO `youbang_sys_area` VALUES (1367, '诸暨', 213, 'z', 'zj', 'zhuji', '', '市', '330681', '0575', 5);
INSERT INTO `youbang_sys_area` VALUES (1368, '上虞', 213, 's', 'sy', 'shangyu', '', '区', '330604', '0575', 3);
INSERT INTO `youbang_sys_area` VALUES (1369, '嵊州', 213, 's', 'sz', 'shengzhou', '', '市', '330683', '0575', 6);
INSERT INTO `youbang_sys_area` VALUES (1370, '婺城', 214, 'w', 'wc', 'wucheng', '', '区', '330702', '0579', 1);
INSERT INTO `youbang_sys_area` VALUES (1371, '金东', 214, 'j', 'jd', 'jindong', '', '区', '330703', '0579', 2);
INSERT INTO `youbang_sys_area` VALUES (1372, '武义', 214, 'w', 'wy', 'wuyi', '', '县', '330723', '0579', 3);
INSERT INTO `youbang_sys_area` VALUES (1373, '浦江', 214, 'p', 'pj', 'pujiang', '', '县', '330726', '0579', 4);
INSERT INTO `youbang_sys_area` VALUES (1374, '磐安', 214, 'p', 'pa', 'panan', '', '县', '330727', '0579', 5);
INSERT INTO `youbang_sys_area` VALUES (1375, '兰溪', 214, 'l', 'lx', 'lanxi', '', '市', '330781', '0579', 6);
INSERT INTO `youbang_sys_area` VALUES (1376, '义乌', 214, 'y', 'yw', 'yiwu', '', '市', '330782', '0579', 7);
INSERT INTO `youbang_sys_area` VALUES (1377, '东阳', 214, 'd', 'dy', 'dongyang', '', '市', '330783', '0579', 8);
INSERT INTO `youbang_sys_area` VALUES (1378, '永康', 214, 'y', 'yk', 'yongkang', '', '市', '330784', '0579', 9);
INSERT INTO `youbang_sys_area` VALUES (1379, '柯城', 215, 'k', 'kc', 'kecheng', '', '区', '330802', '0570', 1);
INSERT INTO `youbang_sys_area` VALUES (1380, '衢江', 215, 'q', 'qj', 'qujiang', '', '区', '330803', '0570', 2);
INSERT INTO `youbang_sys_area` VALUES (1381, '常山', 215, 'c', 'cs', 'changshan', '', '县', '330822', '0570', 3);
INSERT INTO `youbang_sys_area` VALUES (1382, '开化', 215, 'k', 'kh', 'kaihua', '', '县', '330824', '0570', 4);
INSERT INTO `youbang_sys_area` VALUES (1383, '龙游', 215, 'l', 'ly', 'longyou', '', '县', '330825', '0570', 5);
INSERT INTO `youbang_sys_area` VALUES (1384, '江山', 215, 'j', 'js', 'jiangshan', '', '市', '330881', '0570', 6);
INSERT INTO `youbang_sys_area` VALUES (1385, '定海', 216, 'd', 'dh', 'dinghai', '', '区', '330902', '0580', 1);
INSERT INTO `youbang_sys_area` VALUES (1386, '普陀', 216, 'p', 'pt', 'putuo', '', '区', '330903', '0580', 2);
INSERT INTO `youbang_sys_area` VALUES (1387, '岱山', 216, 'd', 'ds', 'daishan', '', '县', '330921', '0580', 3);
INSERT INTO `youbang_sys_area` VALUES (1388, '嵊泗', 216, 's', 'ss', 'shengsi', '', '县', '330922', '0580', 4);
INSERT INTO `youbang_sys_area` VALUES (1389, '椒江', 217, 'j', 'jj', 'jiaojiang', '', '区', '331002', '0576', 1);
INSERT INTO `youbang_sys_area` VALUES (1390, '黄岩', 217, 'h', 'hy', 'huangyan', '', '区', '331003', '0576', 2);
INSERT INTO `youbang_sys_area` VALUES (1391, '路桥', 217, 'l', 'lq', 'luqiao', '', '区', '331004', '0576', 3);
INSERT INTO `youbang_sys_area` VALUES (1392, '玉环', 217, 'y', 'yh', 'yuhuan', '', '县', '331021', '0576', 4);
INSERT INTO `youbang_sys_area` VALUES (1393, '三门', 217, 's', 'sm', 'sanmen', '', '县', '331022', '0576', 5);
INSERT INTO `youbang_sys_area` VALUES (1394, '天台', 217, 't', 'tt', 'tiantai', '', '县', '331023', '0576', 6);
INSERT INTO `youbang_sys_area` VALUES (1395, '仙居', 217, 'x', 'xj', 'xianju', '', '县', '331024', '0576', 7);
INSERT INTO `youbang_sys_area` VALUES (1396, '温岭', 217, 'w', 'wl', 'wenling', '', '市', '331081', '0576', 8);
INSERT INTO `youbang_sys_area` VALUES (1397, '临海', 217, 'l', 'lh', 'linhai', '', '市', '331082', '0576', 9);
INSERT INTO `youbang_sys_area` VALUES (1398, '莲都', 218, 'l', 'ld', 'liandu', '', '区', '331102', '0578', 1);
INSERT INTO `youbang_sys_area` VALUES (1399, '青田', 218, 'q', 'qt', 'qingtian', '', '县', '331121', '0578', 2);
INSERT INTO `youbang_sys_area` VALUES (1400, '缙云', 218, 'j', 'jy', 'jinyun', '', '县', '331122', '0578', 3);
INSERT INTO `youbang_sys_area` VALUES (1401, '遂昌', 218, 's', 'sc', 'suichang', '', '县', '331123', '0578', 4);
INSERT INTO `youbang_sys_area` VALUES (1402, '松阳', 218, 's', 'sy', 'songyang', '', '县', '331124', '0578', 5);
INSERT INTO `youbang_sys_area` VALUES (1403, '云和', 218, 'y', 'yh', 'yunhe', '', '县', '331125', '0578', 6);
INSERT INTO `youbang_sys_area` VALUES (1404, '庆元', 218, 'q', 'qy', 'qingyuan', '', '县', '331126', '0578', 7);
INSERT INTO `youbang_sys_area` VALUES (1405, '景宁', 218, 'j', 'jn', 'jingning', '畲族', '自治县', '331127', '0578', 8);
INSERT INTO `youbang_sys_area` VALUES (1406, '龙泉', 218, 'l', 'lq', 'longquan', '', '市', '331181', '0578', 9);
INSERT INTO `youbang_sys_area` VALUES (1407, '瑶海', 219, 'y', 'yh', 'yaohai', '', '区', '340102', '0551', 1);
INSERT INTO `youbang_sys_area` VALUES (1408, '庐阳', 219, 'l', 'ly', 'luyang', '', '区', '340103', '0551', 2);
INSERT INTO `youbang_sys_area` VALUES (1409, '蜀山', 219, 's', 'ss', 'shushan', '', '区', '340104', '0551', 3);
INSERT INTO `youbang_sys_area` VALUES (1410, '包河', 219, 'b', 'bh', 'baohe', '', '区', '340111', '0551', 4);
INSERT INTO `youbang_sys_area` VALUES (1411, '长丰', 219, 'c', 'cf', 'changfeng', '', '县', '340121', '0551', 5);
INSERT INTO `youbang_sys_area` VALUES (1412, '肥东', 219, 'f', 'fd', 'feidong', '', '县', '340122', '0551', 6);
INSERT INTO `youbang_sys_area` VALUES (1413, '肥西', 219, 'f', 'fx', 'feixi', '', '县', '340123', '0551', 7);
INSERT INTO `youbang_sys_area` VALUES (1414, '庐江', 219, 'l', 'lj', 'lujiang', '', '县', '340124', '0551', 8);
INSERT INTO `youbang_sys_area` VALUES (1415, '巢湖', 219, 'c', 'ch', 'chaohu', '', '市', '340181', '0551', 9);
INSERT INTO `youbang_sys_area` VALUES (1416, '镜湖', 220, 'j', 'jh', 'jinghu', '', '区', '340202', '0553', 1);
INSERT INTO `youbang_sys_area` VALUES (1417, '弋江', 220, 'y', 'yj', 'yijiang', '', '区', '340203', '0553', 2);
INSERT INTO `youbang_sys_area` VALUES (1418, '鸠江', 220, 'j', 'jj', 'jiujiang', '', '区', '340207', '0553', 3);
INSERT INTO `youbang_sys_area` VALUES (1419, '三山', 220, 's', 'ss', 'sanshan', '', '区', '340208', '0553', 4);
INSERT INTO `youbang_sys_area` VALUES (1420, '芜湖', 220, 'w', 'wh', 'wuhu', '', '县', '340221', '0553', 5);
INSERT INTO `youbang_sys_area` VALUES (1421, '繁昌', 220, 'f', 'fc', 'fanchang', '', '县', '340222', '0553', 6);
INSERT INTO `youbang_sys_area` VALUES (1422, '南陵', 220, 'n', 'nl', 'nanling', '', '县', '340223', '0553', 7);
INSERT INTO `youbang_sys_area` VALUES (1423, '无为', 220, 'w', 'ww', 'wuwei', '', '县', '340225', '0553', 8);
INSERT INTO `youbang_sys_area` VALUES (1424, '龙子湖', 221, 'l', 'lzh', 'longzihu', '', '区', '340302', '0552', 1);
INSERT INTO `youbang_sys_area` VALUES (1425, '蚌山', 221, 'b', 'bs', 'bangshan', '', '区', '340303', '0552', 2);
INSERT INTO `youbang_sys_area` VALUES (1426, '禹会', 221, 'y', 'yh', 'yuhui', '', '区', '340304', '0552', 3);
INSERT INTO `youbang_sys_area` VALUES (1427, '淮上', 221, 'h', 'hs', 'huaishang', '', '区', '340311', '0552', 4);
INSERT INTO `youbang_sys_area` VALUES (1428, '怀远', 221, 'h', 'hy', 'huaiyuan', '', '县', '340321', '0552', 5);
INSERT INTO `youbang_sys_area` VALUES (1429, '五河', 221, 'w', 'wh', 'wuhe', '', '县', '340322', '0552', 6);
INSERT INTO `youbang_sys_area` VALUES (1430, '固镇', 221, 'g', 'gz', 'guzhen', '', '县', '340323', '0552', 7);
INSERT INTO `youbang_sys_area` VALUES (1431, '大通', 222, 'd', 'dt', 'datong', '', '区', '340402', '0554', 1);
INSERT INTO `youbang_sys_area` VALUES (1432, '田家庵', 222, 't', 'tja', 'tianjiaan', '', '区', '340403', '0554', 2);
INSERT INTO `youbang_sys_area` VALUES (1433, '谢家集', 222, 'x', 'xjj', 'xiejiaji', '', '区', '340404', '0554', 3);
INSERT INTO `youbang_sys_area` VALUES (1434, '八公山', 222, 'b', 'bgs', 'bagongshan', '', '区', '340405', '0554', 4);
INSERT INTO `youbang_sys_area` VALUES (1435, '潘集', 222, 'p', 'pj', 'panji', '', '区', '340406', '0554', 5);
INSERT INTO `youbang_sys_area` VALUES (1436, '凤台', 222, 'f', 'ft', 'fengtai', '', '县', '340421', '0554', 6);
INSERT INTO `youbang_sys_area` VALUES (1437, '花山', 223, 'h', 'hs', 'huashan', '', '区', '340503', '0555', 1);
INSERT INTO `youbang_sys_area` VALUES (1438, '雨山', 223, 'y', 'ys', 'yushan', '', '区', '340504', '0555', 2);
INSERT INTO `youbang_sys_area` VALUES (1439, '博望', 223, 'b', 'bw', 'bowang', '', '区', '340506', '0555', 3);
INSERT INTO `youbang_sys_area` VALUES (1440, '当涂', 223, 'd', 'dt', 'dangtu', '', '县', '340521', '0555', 4);
INSERT INTO `youbang_sys_area` VALUES (1441, '含山', 223, 'h', 'hs', 'hanshan', '', '县', '340522', '0555', 5);
INSERT INTO `youbang_sys_area` VALUES (1442, '和县', 223, 'h', 'hx', 'hexian', '', '', '340523', '0555', 6);
INSERT INTO `youbang_sys_area` VALUES (1443, '杜集', 224, 'd', 'dj', 'duji', '', '区', '340602', '0561', 1);
INSERT INTO `youbang_sys_area` VALUES (1444, '相山', 224, 'x', 'xs', 'xiangshan', '', '区', '340603', '0561', 2);
INSERT INTO `youbang_sys_area` VALUES (1445, '烈山', 224, 'l', 'ls', 'lieshan', '', '区', '340604', '0561', 3);
INSERT INTO `youbang_sys_area` VALUES (1446, '濉溪', 224, 's', 'sx', 'suixi', '', '县', '340621', '0561', 4);
INSERT INTO `youbang_sys_area` VALUES (1447, '铜官山', 225, 't', 'tgs', 'tongguanshan', '', '区', '340702', '0562', 1);
INSERT INTO `youbang_sys_area` VALUES (1449, '郊区', 225, 'j', 'jq', 'jiaoqu', '', '', '340711', '0562', 3);
INSERT INTO `youbang_sys_area` VALUES (1450, '义安', 225, 'y', 'ya', 'yian', '', '区', '340721', '0562', 4);
INSERT INTO `youbang_sys_area` VALUES (1451, '迎江', 226, 'y', 'yj', 'yingjiang', '', '区', '340802', '0556', 1);
INSERT INTO `youbang_sys_area` VALUES (1452, '大观', 226, 'd', 'dg', 'daguan', '', '区', '340803', '0556', 2);
INSERT INTO `youbang_sys_area` VALUES (1453, '宜秀', 226, 'y', 'yx', 'yixiu', '', '区', '340811', '0556', 3);
INSERT INTO `youbang_sys_area` VALUES (1454, '怀宁', 226, 'h', 'hn', 'huaining', '', '县', '340822', '0556', 4);
INSERT INTO `youbang_sys_area` VALUES (1455, '枞阳', 225, 'z', 'zy', 'zongyang', '', '县', '340823', '0556', 5);
INSERT INTO `youbang_sys_area` VALUES (1456, '潜山', 226, 'q', 'qs', 'qianshan', '', '县', '340824', '0556', 6);
INSERT INTO `youbang_sys_area` VALUES (1457, '太湖', 226, 't', 'th', 'taihu', '', '县', '340825', '0556', 7);
INSERT INTO `youbang_sys_area` VALUES (1458, '宿松', 226, 's', 'ss', 'susong', '', '县', '340826', '0556', 8);
INSERT INTO `youbang_sys_area` VALUES (1459, '望江', 226, 'w', 'wj', 'wangjiang', '', '县', '340827', '0556', 9);
INSERT INTO `youbang_sys_area` VALUES (1460, '岳西', 226, 'y', 'yx', 'yuexi', '', '县', '340828', '0556', 10);
INSERT INTO `youbang_sys_area` VALUES (1461, '桐城', 226, 't', 'tc', 'tongcheng', '', '市', '340881', '0556', 11);
INSERT INTO `youbang_sys_area` VALUES (1462, '屯溪', 227, 't', 'tx', 'tunxi', '', '区', '341002', '0559', 1);
INSERT INTO `youbang_sys_area` VALUES (1463, '黄山', 227, 'h', 'hs', 'huangshan', '', '区', '341003', '0559', 2);
INSERT INTO `youbang_sys_area` VALUES (1464, '徽州', 227, 'h', 'hz', 'huizhou', '', '区', '341004', '0559', 3);
INSERT INTO `youbang_sys_area` VALUES (1465, '歙县', 227, 's', 'sx', 'shexian', '', '', '341021', '0559', 4);
INSERT INTO `youbang_sys_area` VALUES (1466, '休宁', 227, 'x', 'xn', 'xiuning', '', '县', '341022', '0559', 5);
INSERT INTO `youbang_sys_area` VALUES (1467, '黟县', 227, 'y', 'yx', 'yixian', '', '', '341023', '0559', 6);
INSERT INTO `youbang_sys_area` VALUES (1468, '祁门', 227, 'q', 'qm', 'qimen', '', '县', '341024', '0559', 7);
INSERT INTO `youbang_sys_area` VALUES (1469, '琅玡', 228, 'l', 'ly', 'langya', '', '区', '341102', '0550', 1);
INSERT INTO `youbang_sys_area` VALUES (1470, '南谯', 228, 'n', 'nq', 'nanqiao', '', '区', '341103', '0550', 2);
INSERT INTO `youbang_sys_area` VALUES (1471, '来安', 228, 'l', 'la', 'laian', '', '县', '341122', '0550', 3);
INSERT INTO `youbang_sys_area` VALUES (1472, '全椒', 228, 'q', 'qj', 'quanjiao', '', '县', '341124', '0550', 4);
INSERT INTO `youbang_sys_area` VALUES (1473, '定远', 228, 'd', 'dy', 'dingyuan', '', '县', '341125', '0550', 5);
INSERT INTO `youbang_sys_area` VALUES (1474, '凤阳', 228, 'f', 'fy', 'fengyang', '', '县', '341126', '0550', 6);
INSERT INTO `youbang_sys_area` VALUES (1475, '天长', 228, 't', 'tc', 'tianchang', '', '市', '341181', '0550', 7);
INSERT INTO `youbang_sys_area` VALUES (1476, '明光', 228, 'm', 'mg', 'mingguang', '', '市', '341182', '0550', 8);
INSERT INTO `youbang_sys_area` VALUES (1477, '颍州', 229, 'y', 'yz', 'yingzhou', '', '区', '341202', '0558', 1);
INSERT INTO `youbang_sys_area` VALUES (1478, '颍东', 229, 'y', 'yd', 'yingdong', '', '区', '341203', '0558', 2);
INSERT INTO `youbang_sys_area` VALUES (1479, '颍泉', 229, 'y', 'yq', 'yingquan', '', '区', '341204', '0558', 3);
INSERT INTO `youbang_sys_area` VALUES (1480, '临泉', 229, 'l', 'lq', 'linquan', '', '县', '341221', '0558', 4);
INSERT INTO `youbang_sys_area` VALUES (1481, '太和', 229, 't', 'th', 'taihe', '', '县', '341222', '0558', 5);
INSERT INTO `youbang_sys_area` VALUES (1482, '阜南', 229, 'f', 'fn', 'funan', '', '县', '341225', '0558', 6);
INSERT INTO `youbang_sys_area` VALUES (1483, '颖上', 229, 'y', 'ys', 'yingshang', '', '县', '341226', '0558', 7);
INSERT INTO `youbang_sys_area` VALUES (1484, '界首', 229, 'j', 'js', 'jieshou', '', '市', '341282', '0558', 8);
INSERT INTO `youbang_sys_area` VALUES (1485, '埇桥', 230, 'y', 'yq', 'yongqiao', '', '区', '341302', '0557', 1);
INSERT INTO `youbang_sys_area` VALUES (1486, '砀山', 230, 'd', 'ds', 'dangshan', '', '县', '341321', '0557', 2);
INSERT INTO `youbang_sys_area` VALUES (1487, '萧县', 230, 'x', 'xx', 'xiaoxian', '', '', '341322', '0557', 3);
INSERT INTO `youbang_sys_area` VALUES (1488, '灵璧', 230, 'l', 'lb', 'lingbi', '', '县', '341323', '0557', 4);
INSERT INTO `youbang_sys_area` VALUES (1489, '泗县', 230, 's', 'sx', 'sixian', '', '', '341324', '0557', 5);
INSERT INTO `youbang_sys_area` VALUES (1490, '金安', 231, 'j', 'ja', 'jinan', '', '区', '341502', '0564', 1);
INSERT INTO `youbang_sys_area` VALUES (1491, '裕安', 231, 'y', 'ya', 'yuan', '', '区', '341503', '0564', 2);
INSERT INTO `youbang_sys_area` VALUES (1492, '寿县', 222, 's', 'sx', 'shouxian', '', '', '341521', '0564', 3);
INSERT INTO `youbang_sys_area` VALUES (1493, '霍邱', 231, 'h', 'hq', 'huoqiu', '', '县', '341522', '0564', 4);
INSERT INTO `youbang_sys_area` VALUES (1494, '舒城', 231, 's', 'sc', 'shucheng', '', '县', '341523', '0564', 5);
INSERT INTO `youbang_sys_area` VALUES (1495, '金寨', 231, 'j', 'jz', 'jinzhai', '', '县', '341524', '0564', 6);
INSERT INTO `youbang_sys_area` VALUES (1496, '霍山', 231, 'h', 'hs', 'huoshan', '', '县', '341525', '0564', 7);
INSERT INTO `youbang_sys_area` VALUES (1497, '谯城', 232, 'q', 'qc', 'qiaocheng', '', '区', '341602', '0558', 1);
INSERT INTO `youbang_sys_area` VALUES (1498, '涡阳', 232, 'w', 'wy', 'woyang', '', '县', '341621', '0558', 2);
INSERT INTO `youbang_sys_area` VALUES (1499, '蒙城', 232, 'm', 'mc', 'mengcheng', '', '县', '341622', '0558', 3);
INSERT INTO `youbang_sys_area` VALUES (1500, '利辛', 232, 'l', 'lx', 'lixin', '', '县', '341623', '0558', 4);
INSERT INTO `youbang_sys_area` VALUES (1501, '贵池', 233, 'g', 'gc', 'guichi', '', '区', '341702', '0566', 1);
INSERT INTO `youbang_sys_area` VALUES (1502, '东至', 233, 'd', 'dz', 'dongzhi', '', '县', '341721', '0566', 2);
INSERT INTO `youbang_sys_area` VALUES (1503, '石台', 233, 's', 'st', 'shitai', '', '县', '341722', '0566', 3);
INSERT INTO `youbang_sys_area` VALUES (1504, '青阳', 233, 'q', 'qy', 'qingyang', '', '县', '341723', '0566', 4);
INSERT INTO `youbang_sys_area` VALUES (1505, '宣州', 234, 'x', 'xz', 'xuanzhou', '', '区', '341802', '0563', 1);
INSERT INTO `youbang_sys_area` VALUES (1506, '郎溪', 234, 'l', 'lx', 'langxi', '', '县', '341821', '0563', 2);
INSERT INTO `youbang_sys_area` VALUES (1507, '广德', 234, 'g', 'gd', 'guangde', '', '县', '341822', '0563', 3);
INSERT INTO `youbang_sys_area` VALUES (1508, '泾县', 234, 'j', 'jx', 'jingxian', '', '', '341823', '0563', 4);
INSERT INTO `youbang_sys_area` VALUES (1509, '绩溪', 234, 'j', 'jx', 'jixi', '', '县', '341824', '0563', 5);
INSERT INTO `youbang_sys_area` VALUES (1510, '旌德', 234, 'j', 'jd', 'jingde', '', '县', '341825', '0563', 6);
INSERT INTO `youbang_sys_area` VALUES (1511, '宁国', 234, 'n', 'ng', 'ningguo', '', '市', '341881', '0563', 7);
INSERT INTO `youbang_sys_area` VALUES (1512, '鼓楼', 235, 'g', 'gl', 'gulou', '', '区', '350102', '0591', 1);
INSERT INTO `youbang_sys_area` VALUES (1513, '台江', 235, 't', 'tj', 'taijiang', '', '区', '350103', '0591', 2);
INSERT INTO `youbang_sys_area` VALUES (1514, '仓山', 235, 'c', 'cs', 'cangshan', '', '区', '350104', '0591', 3);
INSERT INTO `youbang_sys_area` VALUES (1515, '马尾', 235, 'm', 'mw', 'mawei', '', '区', '350105', '0591', 4);
INSERT INTO `youbang_sys_area` VALUES (1516, '晋安', 235, 'j', 'ja', 'jinan', '', '区', '350111', '0591', 5);
INSERT INTO `youbang_sys_area` VALUES (1517, '闽侯', 235, 'm', 'mh', 'minhou', '', '县', '350121', '0591', 7);
INSERT INTO `youbang_sys_area` VALUES (1518, '连江', 235, 'l', 'lj', 'lianjiang', '', '县', '350122', '0591', 8);
INSERT INTO `youbang_sys_area` VALUES (1519, '罗源', 235, 'l', 'ly', 'luoyuan', '', '县', '350123', '0591', 9);
INSERT INTO `youbang_sys_area` VALUES (1520, '闽清', 235, 'm', 'mq', 'minqing', '', '县', '350124', '0591', 10);
INSERT INTO `youbang_sys_area` VALUES (1521, '永泰', 235, 'y', 'yt', 'yongtai', '', '县', '350125', '0591', 11);
INSERT INTO `youbang_sys_area` VALUES (1522, '平潭', 235, 'p', 'pt', 'pingtan', '', '县', '350128', '0591', 12);
INSERT INTO `youbang_sys_area` VALUES (1523, '福清', 235, 'f', 'fq', 'fuqing', '', '市', '350181', '0591', 13);
INSERT INTO `youbang_sys_area` VALUES (1524, '长乐', 235, 'c', 'cl', 'changle', '', '区', '350112', '0591', 6);
INSERT INTO `youbang_sys_area` VALUES (1525, '思明', 236, 's', 'sm', 'siming', '', '区', '350203', '0592', 1);
INSERT INTO `youbang_sys_area` VALUES (1526, '海沧', 236, 'h', 'hc', 'haicang', '', '区', '350205', '0592', 2);
INSERT INTO `youbang_sys_area` VALUES (1527, '湖里', 236, 'h', 'hl', 'huli', '', '区', '350206', '0592', 3);
INSERT INTO `youbang_sys_area` VALUES (1528, '集美', 236, 'j', 'jm', 'jimei', '', '区', '350211', '0592', 4);
INSERT INTO `youbang_sys_area` VALUES (1529, '同安', 236, 't', 'ta', 'tongan', '', '区', '350212', '0592', 5);
INSERT INTO `youbang_sys_area` VALUES (1530, '翔安', 236, 'x', 'xa', 'xiangan', '', '区', '350213', '0592', 6);
INSERT INTO `youbang_sys_area` VALUES (1531, '城厢', 237, 'c', 'cx', 'chengxiang', '', '区', '350302', '0594', 1);
INSERT INTO `youbang_sys_area` VALUES (1532, '涵江', 237, 'h', 'hj', 'hanjiang', '', '区', '350303', '0594', 2);
INSERT INTO `youbang_sys_area` VALUES (1533, '荔城', 237, 'l', 'lc', 'licheng', '', '区', '350304', '0594', 3);
INSERT INTO `youbang_sys_area` VALUES (1534, '秀屿', 237, 'x', 'xy', 'xiuyu', '', '区', '350305', '0594', 4);
INSERT INTO `youbang_sys_area` VALUES (1535, '仙游', 237, 'x', 'xy', 'xianyou', '', '县', '350322', '0594', 5);
INSERT INTO `youbang_sys_area` VALUES (1536, '梅列', 238, 'm', 'ml', 'meilie', '', '区', '350402', '0598', 1);
INSERT INTO `youbang_sys_area` VALUES (1537, '三元', 238, 's', 'sy', 'sanyuan', '', '区', '350403', '0598', 2);
INSERT INTO `youbang_sys_area` VALUES (1538, '明溪', 238, 'm', 'mx', 'mingxi', '', '县', '350421', '0598', 3);
INSERT INTO `youbang_sys_area` VALUES (1539, '清流', 238, 'q', 'ql', 'qingliu', '', '县', '350423', '0598', 4);
INSERT INTO `youbang_sys_area` VALUES (1540, '宁化', 238, 'n', 'nh', 'ninghua', '', '县', '350424', '0598', 5);
INSERT INTO `youbang_sys_area` VALUES (1541, '大田', 238, 'd', 'dt', 'datian', '', '县', '350425', '0598', 6);
INSERT INTO `youbang_sys_area` VALUES (1542, '尤溪', 238, 'y', 'yx', 'youxi', '', '县', '350426', '0598', 7);
INSERT INTO `youbang_sys_area` VALUES (1543, '沙县', 238, 's', 'sx', 'shaxian', '', '', '350427', '0598', 8);
INSERT INTO `youbang_sys_area` VALUES (1544, '将乐', 238, 'j', 'jl', 'jiangle', '', '县', '350428', '0598', 9);
INSERT INTO `youbang_sys_area` VALUES (1545, '泰宁', 238, 't', 'tn', 'taining', '', '县', '350429', '0598', 10);
INSERT INTO `youbang_sys_area` VALUES (1546, '建宁', 238, 'j', 'jn', 'jianning', '', '县', '350430', '0598', 11);
INSERT INTO `youbang_sys_area` VALUES (1547, '永安', 238, 'y', 'ya', 'yongan', '', '市', '350481', '0598', 12);
INSERT INTO `youbang_sys_area` VALUES (1548, '鲤城', 239, 'l', 'lc', 'licheng', '', '区', '350502', '0595', 1);
INSERT INTO `youbang_sys_area` VALUES (1549, '丰泽', 239, 'f', 'fz', 'fengze', '', '区', '350503', '0595', 2);
INSERT INTO `youbang_sys_area` VALUES (1550, '洛江', 239, 'l', 'lj', 'luojiang', '', '区', '350504', '0595', 3);
INSERT INTO `youbang_sys_area` VALUES (1551, '泉港', 239, 'q', 'qg', 'quangang', '', '区', '350505', '0595', 4);
INSERT INTO `youbang_sys_area` VALUES (1552, '惠安', 239, 'h', 'ha', 'huian', '', '县', '350521', '0595', 5);
INSERT INTO `youbang_sys_area` VALUES (1553, '安溪', 239, 'a', 'ax', 'anxi', '', '县', '350524', '0595', 6);
INSERT INTO `youbang_sys_area` VALUES (1554, '永春', 239, 'y', 'yc', 'yongchun', '', '县', '350525', '0595', 7);
INSERT INTO `youbang_sys_area` VALUES (1555, '德化', 239, 'd', 'dh', 'dehua', '', '县', '350526', '0595', 8);
INSERT INTO `youbang_sys_area` VALUES (1556, '金门', 239, 'j', 'jm', 'jinmen', '', '县', '350527', '0595', 9);
INSERT INTO `youbang_sys_area` VALUES (1557, '石狮', 239, 's', 'ss', 'shishi', '', '市', '350581', '0595', 10);
INSERT INTO `youbang_sys_area` VALUES (1558, '晋江', 239, 'j', 'jj', 'jinjiang', '', '市', '350582', '0595', 11);
INSERT INTO `youbang_sys_area` VALUES (1559, '南安', 239, 'n', 'na', 'nanan', '', '市', '350583', '0595', 12);
INSERT INTO `youbang_sys_area` VALUES (1560, '芗城', 240, 'x', 'xc', 'xiangcheng', '', '区', '350602', '0596', 1);
INSERT INTO `youbang_sys_area` VALUES (1561, '龙文', 240, 'l', 'lw', 'longwen', '', '区', '350603', '0596', 2);
INSERT INTO `youbang_sys_area` VALUES (1562, '云霄', 240, 'y', 'yx', 'yunxiao', '', '县', '350622', '0596', 3);
INSERT INTO `youbang_sys_area` VALUES (1563, '漳浦', 240, 'z', 'zp', 'zhangpu', '', '县', '350623', '0596', 4);
INSERT INTO `youbang_sys_area` VALUES (1564, '诏安', 240, 'z', 'za', 'zhaoan', '', '县', '350624', '0596', 5);
INSERT INTO `youbang_sys_area` VALUES (1565, '长泰', 240, 'c', 'ct', 'changtai', '', '县', '350625', '0596', 6);
INSERT INTO `youbang_sys_area` VALUES (1566, '东山', 240, 'd', 'ds', 'dongshan', '', '县', '350626', '0596', 7);
INSERT INTO `youbang_sys_area` VALUES (1567, '南靖', 240, 'n', 'nj', 'nanjing', '', '县', '350627', '0596', 8);
INSERT INTO `youbang_sys_area` VALUES (1568, '平和', 240, 'p', 'ph', 'pinghe', '', '县', '350628', '0596', 9);
INSERT INTO `youbang_sys_area` VALUES (1569, '华安', 240, 'h', 'ha', 'huaan', '', '县', '350629', '0596', 10);
INSERT INTO `youbang_sys_area` VALUES (1570, '龙海', 240, 'l', 'lh', 'longhai', '', '市', '350681', '0596', 11);
INSERT INTO `youbang_sys_area` VALUES (1571, '延平', 241, 'y', 'yp', 'yanping', '', '区', '350702', '0599', 1);
INSERT INTO `youbang_sys_area` VALUES (1572, '顺昌', 241, 's', 'sc', 'shunchang', '', '县', '350721', '0599', 3);
INSERT INTO `youbang_sys_area` VALUES (1573, '浦城', 241, 'p', 'pc', 'pucheng', '', '县', '350722', '0599', 4);
INSERT INTO `youbang_sys_area` VALUES (1574, '光泽', 241, 'g', 'gz', 'guangze', '', '县', '350723', '0599', 5);
INSERT INTO `youbang_sys_area` VALUES (1575, '松溪', 241, 's', 'sx', 'songxi', '', '县', '350724', '0599', 6);
INSERT INTO `youbang_sys_area` VALUES (1576, '政和', 241, 'z', 'zh', 'zhenghe', '', '县', '350725', '0599', 7);
INSERT INTO `youbang_sys_area` VALUES (1577, '邵武', 241, 's', 'sw', 'shaowu', '', '市', '350781', '0599', 8);
INSERT INTO `youbang_sys_area` VALUES (1578, '武夷山', 241, 'w', 'wys', 'wuyishan', '', '市', '350782', '0599', 9);
INSERT INTO `youbang_sys_area` VALUES (1579, '建瓯', 241, 'j', 'jo', 'jianou', '', '市', '350783', '0599', 10);
INSERT INTO `youbang_sys_area` VALUES (1580, '建阳', 241, 'j', 'jy', 'jianyang', '', '区', '350703', '0599', 2);
INSERT INTO `youbang_sys_area` VALUES (1581, '新罗', 242, 'x', 'xl', 'xinluo', '', '区', '350802', '0597', 1);
INSERT INTO `youbang_sys_area` VALUES (1582, '长汀', 242, 'c', 'ct', 'changting', '', '县', '350821', '0597', 3);
INSERT INTO `youbang_sys_area` VALUES (1583, '永定', 242, 'y', 'yd', 'yongding', '', '区', '350803', '0597', 2);
INSERT INTO `youbang_sys_area` VALUES (1584, '上杭', 242, 's', 'sh', 'shanghang', '', '县', '350823', '0597', 4);
INSERT INTO `youbang_sys_area` VALUES (1585, '武平', 242, 'w', 'wp', 'wuping', '', '县', '350824', '0597', 5);
INSERT INTO `youbang_sys_area` VALUES (1586, '连城', 242, 'l', 'lc', 'liancheng', '', '县', '350825', '0597', 6);
INSERT INTO `youbang_sys_area` VALUES (1587, '漳平', 242, 'z', 'zp', 'zhangping', '', '市', '350881', '0597', 7);
INSERT INTO `youbang_sys_area` VALUES (1588, '蕉城', 243, 'j', 'jc', 'jiaocheng', '', '区', '350902', '0593', 1);
INSERT INTO `youbang_sys_area` VALUES (1589, '霞浦', 243, 'x', 'xp', 'xiapu', '', '县', '350921', '0593', 2);
INSERT INTO `youbang_sys_area` VALUES (1590, '古田', 243, 'g', 'gt', 'gutian', '', '县', '350922', '0593', 3);
INSERT INTO `youbang_sys_area` VALUES (1591, '屏南', 243, 'p', 'pn', 'pingnan', '', '县', '350923', '0593', 4);
INSERT INTO `youbang_sys_area` VALUES (1592, '寿宁', 243, 's', 'sn', 'shouning', '', '县', '350924', '0593', 5);
INSERT INTO `youbang_sys_area` VALUES (1593, '周宁', 243, 'z', 'zn', 'zhouning', '', '县', '350925', '0593', 6);
INSERT INTO `youbang_sys_area` VALUES (1594, '柘荣', 243, 'z', 'zr', 'zherong', '', '县', '350926', '0593', 7);
INSERT INTO `youbang_sys_area` VALUES (1595, '福安', 243, 'f', 'fa', 'fuan', '', '市', '350981', '0593', 8);
INSERT INTO `youbang_sys_area` VALUES (1596, '福鼎', 243, 'f', 'fd', 'fuding', '', '市', '350982', '0593', 9);
INSERT INTO `youbang_sys_area` VALUES (1597, '东湖', 244, 'd', 'dh', 'donghu', '', '区', '360102', '0791', 1);
INSERT INTO `youbang_sys_area` VALUES (1598, '西湖', 244, 'x', 'xh', 'xihu', '', '区', '360103', '0791', 2);
INSERT INTO `youbang_sys_area` VALUES (1599, '青云谱', 244, 'q', 'qyp', 'qingyunpu', '', '区', '360104', '0791', 3);
INSERT INTO `youbang_sys_area` VALUES (1600, '湾里', 244, 'w', 'wl', 'wanli', '', '区', '360105', '0791', 4);
INSERT INTO `youbang_sys_area` VALUES (1601, '青山湖', 244, 'q', 'qsh', 'qingshanhu', '', '区', '360111', '0791', 5);
INSERT INTO `youbang_sys_area` VALUES (1602, '南昌', 244, 'n', 'nc', 'nanchang', '', '县', '360121', '0791', 6);
INSERT INTO `youbang_sys_area` VALUES (1603, '新建', 244, 'x', 'xj', 'xinjian', '', '区', '360122', '0791', 7);
INSERT INTO `youbang_sys_area` VALUES (1604, '安义', 244, 'a', 'ay', 'anyi', '', '县', '360123', '0791', 8);
INSERT INTO `youbang_sys_area` VALUES (1605, '进贤', 244, 'j', 'jx', 'jinxian', '', '县', '360124', '0791', 9);
INSERT INTO `youbang_sys_area` VALUES (1606, '昌江', 245, 'c', 'cj', 'changjiang', '', '区', '360202', '0798', 1);
INSERT INTO `youbang_sys_area` VALUES (1607, '珠山', 245, 'z', 'zs', 'zhushan', '', '区', '360203', '0798', 2);
INSERT INTO `youbang_sys_area` VALUES (1608, '浮梁', 245, 'f', 'fl', 'fuliang', '', '县', '360222', '0798', 3);
INSERT INTO `youbang_sys_area` VALUES (1609, '乐平', 245, 'l', 'lp', 'leping', '', '市', '360281', '0798', 4);
INSERT INTO `youbang_sys_area` VALUES (1610, '安源', 246, 'a', 'ay', 'anyuan', '', '区', '360302', '0799', 1);
INSERT INTO `youbang_sys_area` VALUES (1611, '湘东', 246, 'x', 'xd', 'xiangdong', '', '区', '360313', '0799', 2);
INSERT INTO `youbang_sys_area` VALUES (1612, '莲花', 246, 'l', 'lh', 'lianhua', '', '县', '360321', '0799', 3);
INSERT INTO `youbang_sys_area` VALUES (1613, '上栗', 246, 's', 'sl', 'shangli', '', '县', '360322', '0799', 4);
INSERT INTO `youbang_sys_area` VALUES (1614, '芦溪', 246, 'l', 'lx', 'luxi', '', '县', '360323', '0799', 5);
INSERT INTO `youbang_sys_area` VALUES (1615, '濂溪', 247, 'l', 'lx', 'lianxi', '', '区', '360402', '0792', 1);
INSERT INTO `youbang_sys_area` VALUES (1616, '浔阳', 247, 'x', 'xy', 'xunyang', '', '区', '360403', '0792', 2);
INSERT INTO `youbang_sys_area` VALUES (1617, '九江', 247, 'j', 'jj', 'jiujiang', '', '县', '360421', '0792', 3);
INSERT INTO `youbang_sys_area` VALUES (1618, '武宁', 247, 'w', 'wn', 'wuning', '', '县', '360423', '0792', 4);
INSERT INTO `youbang_sys_area` VALUES (1619, '修水', 247, 'x', 'xs', 'xiushui', '', '县', '360424', '0792', 5);
INSERT INTO `youbang_sys_area` VALUES (1620, '永修', 247, 'y', 'yx', 'yongxiu', '', '县', '360425', '0792', 6);
INSERT INTO `youbang_sys_area` VALUES (1621, '德安', 247, 'd', 'da', 'dean', '', '县', '360426', '0792', 7);
INSERT INTO `youbang_sys_area` VALUES (1622, '庐山', 247, 'l', 'ls', 'lushan', '', '市', '360427', '0792', 8);
INSERT INTO `youbang_sys_area` VALUES (1623, '都昌', 247, 'd', 'dc', 'duchang', '', '县', '360428', '0792', 9);
INSERT INTO `youbang_sys_area` VALUES (1624, '湖口', 247, 'h', 'hk', 'hukou', '', '县', '360429', '0792', 10);
INSERT INTO `youbang_sys_area` VALUES (1625, '彭泽', 247, 'p', 'pz', 'pengze', '', '县', '360430', '0792', 11);
INSERT INTO `youbang_sys_area` VALUES (1626, '瑞昌', 247, 'r', 'rc', 'ruichang', '', '市', '360481', '0792', 12);
INSERT INTO `youbang_sys_area` VALUES (1627, '共青城', 247, 'g', 'gqc', 'gongqingcheng', '', '市', '360482', '0792', 13);
INSERT INTO `youbang_sys_area` VALUES (1628, '渝水', 248, 'y', 'ys', 'yushui', '', '区', '360502', '0790', 1);
INSERT INTO `youbang_sys_area` VALUES (1629, '分宜', 248, 'f', 'fy', 'fenyi', '', '县', '360521', '0790', 2);
INSERT INTO `youbang_sys_area` VALUES (1630, '月湖', 249, 'y', 'yh', 'yuehu', '', '区', '360602', '0701', 1);
INSERT INTO `youbang_sys_area` VALUES (1631, '余江', 249, 'y', 'yj', 'yujiang', '', '县', '360622', '0701', 2);
INSERT INTO `youbang_sys_area` VALUES (1632, '贵溪', 249, 'g', 'gx', 'guixi', '', '市', '360681', '0701', 3);
INSERT INTO `youbang_sys_area` VALUES (1633, '章贡', 250, 'z', 'zg', 'zhanggong', '', '区', '360702', '0797', 1);
INSERT INTO `youbang_sys_area` VALUES (1634, '赣县', 250, 'g', 'gx', 'ganxian', '', '区', '360721', '0797', 2);
INSERT INTO `youbang_sys_area` VALUES (1635, '信丰', 250, 'x', 'xf', 'xinfeng', '', '县', '360722', '0797', 3);
INSERT INTO `youbang_sys_area` VALUES (1636, '大余', 250, 'd', 'dy', 'dayu', '', '县', '360723', '0797', 4);
INSERT INTO `youbang_sys_area` VALUES (1637, '上犹', 250, 's', 'sy', 'shangyou', '', '县', '360724', '0797', 5);
INSERT INTO `youbang_sys_area` VALUES (1638, '崇义', 250, 'c', 'cy', 'chongyi', '', '县', '360725', '0797', 6);
INSERT INTO `youbang_sys_area` VALUES (1639, '安远', 250, 'a', 'ay', 'anyuan', '', '县', '360726', '0797', 7);
INSERT INTO `youbang_sys_area` VALUES (1640, '龙南', 250, 'l', 'ln', 'longnan', '', '县', '360727', '0797', 8);
INSERT INTO `youbang_sys_area` VALUES (1641, '定南', 250, 'd', 'dn', 'dingnan', '', '县', '360728', '0797', 9);
INSERT INTO `youbang_sys_area` VALUES (1642, '全南', 250, 'q', 'qn', 'quannan', '', '县', '360729', '0797', 10);
INSERT INTO `youbang_sys_area` VALUES (1643, '宁都', 250, 'n', 'nd', 'ningdu', '', '县', '360730', '0797', 11);
INSERT INTO `youbang_sys_area` VALUES (1644, '于都', 250, 'y', 'yd', 'yudu', '', '县', '360731', '0797', 12);
INSERT INTO `youbang_sys_area` VALUES (1645, '兴国', 250, 'x', 'xg', 'xingguo', '', '县', '360732', '0797', 13);
INSERT INTO `youbang_sys_area` VALUES (1646, '会昌', 250, 'h', 'hc', 'huichang', '', '县', '360733', '0797', 14);
INSERT INTO `youbang_sys_area` VALUES (1647, '寻乌', 250, 'x', 'xw', 'xunwu', '', '县', '360734', '0797', 15);
INSERT INTO `youbang_sys_area` VALUES (1648, '石城', 250, 's', 'sc', 'shicheng', '', '县', '360735', '0797', 16);
INSERT INTO `youbang_sys_area` VALUES (1649, '瑞金', 250, 'r', 'rj', 'ruijin', '', '市', '360781', '0797', 17);
INSERT INTO `youbang_sys_area` VALUES (1650, '南康', 250, 'n', 'nk', 'nankang', '', '区', '360782', '0797', 18);
INSERT INTO `youbang_sys_area` VALUES (1651, '吉州', 251, 'j', 'jz', 'jizhou', '', '区', '360802', '0796', 1);
INSERT INTO `youbang_sys_area` VALUES (1652, '青原', 251, 'q', 'qy', 'qingyuan', '', '区', '360803', '0796', 2);
INSERT INTO `youbang_sys_area` VALUES (1653, '吉安', 251, 'j', 'ja', 'jian', '', '县', '360821', '0796', 3);
INSERT INTO `youbang_sys_area` VALUES (1654, '吉水', 251, 'j', 'js', 'jishui', '', '县', '360822', '0796', 4);
INSERT INTO `youbang_sys_area` VALUES (1655, '峡江', 251, 'x', 'xj', 'xiajiang', '', '县', '360823', '0796', 5);
INSERT INTO `youbang_sys_area` VALUES (1656, '新干', 251, 'x', 'xg', 'xingan', '', '县', '360824', '0796', 6);
INSERT INTO `youbang_sys_area` VALUES (1657, '永丰', 251, 'y', 'yf', 'yongfeng', '', '县', '360825', '0796', 7);
INSERT INTO `youbang_sys_area` VALUES (1658, '泰和', 251, 't', 'th', 'taihe', '', '县', '360826', '0796', 8);
INSERT INTO `youbang_sys_area` VALUES (1659, '遂川', 251, 's', 'sc', 'suichuan', '', '县', '360827', '0796', 9);
INSERT INTO `youbang_sys_area` VALUES (1660, '万安', 251, 'w', 'wa', 'wanan', '', '县', '360828', '0796', 10);
INSERT INTO `youbang_sys_area` VALUES (1661, '安福', 251, 'a', 'af', 'anfu', '', '县', '360829', '0796', 11);
INSERT INTO `youbang_sys_area` VALUES (1662, '永新', 251, 'y', 'yx', 'yongxin', '', '县', '360830', '0796', 12);
INSERT INTO `youbang_sys_area` VALUES (1663, '井冈山', 251, 'j', 'jgs', 'jinggangshan', '', '市', '360881', '0796', 13);
INSERT INTO `youbang_sys_area` VALUES (1664, '袁州', 252, 'y', 'yz', 'yuanzhou', '', '区', '360902', '0795', 1);
INSERT INTO `youbang_sys_area` VALUES (1665, '奉新', 252, 'f', 'fx', 'fengxin', '', '县', '360921', '0795', 2);
INSERT INTO `youbang_sys_area` VALUES (1666, '万载', 252, 'w', 'wz', 'wanzai', '', '县', '360922', '0795', 3);
INSERT INTO `youbang_sys_area` VALUES (1667, '上高', 252, 's', 'sg', 'shanggao', '', '县', '360923', '0795', 4);
INSERT INTO `youbang_sys_area` VALUES (1668, '宜丰', 252, 'y', 'yf', 'yifeng', '', '县', '360924', '0795', 5);
INSERT INTO `youbang_sys_area` VALUES (1669, '靖安', 252, 'j', 'ja', 'jingan', '', '县', '360925', '0795', 6);
INSERT INTO `youbang_sys_area` VALUES (1670, '铜鼓', 252, 't', 'tg', 'tonggu', '', '县', '360926', '0795', 7);
INSERT INTO `youbang_sys_area` VALUES (1671, '丰城', 252, 'f', 'fc', 'fengcheng', '', '市', '360981', '0795', 8);
INSERT INTO `youbang_sys_area` VALUES (1672, '樟树', 252, 'z', 'zs', 'zhangshu', '', '市', '360982', '0795', 9);
INSERT INTO `youbang_sys_area` VALUES (1673, '高安', 252, 'g', 'ga', 'gaoan', '', '市', '360983', '0795', 10);
INSERT INTO `youbang_sys_area` VALUES (1674, '临川', 253, 'l', 'lc', 'linchuan', '', '区', '361002', '0794', 1);
INSERT INTO `youbang_sys_area` VALUES (1675, '南城', 253, 'n', 'nc', 'nancheng', '', '县', '361021', '0794', 2);
INSERT INTO `youbang_sys_area` VALUES (1676, '黎川', 253, 'l', 'lc', 'lichuan', '', '县', '361022', '0794', 3);
INSERT INTO `youbang_sys_area` VALUES (1677, '南丰', 253, 'n', 'nf', 'nanfeng', '', '县', '361023', '0794', 4);
INSERT INTO `youbang_sys_area` VALUES (1678, '崇仁', 253, 'c', 'cr', 'chongren', '', '县', '361024', '0794', 5);
INSERT INTO `youbang_sys_area` VALUES (1679, '乐安', 253, 'l', 'la', 'lean', '', '县', '361025', '0794', 6);
INSERT INTO `youbang_sys_area` VALUES (1680, '宜黄', 253, 'y', 'yh', 'yihuang', '', '县', '361026', '0794', 7);
INSERT INTO `youbang_sys_area` VALUES (1681, '金溪', 253, 'j', 'jx', 'jinxi', '', '县', '361027', '0794', 8);
INSERT INTO `youbang_sys_area` VALUES (1682, '资溪', 253, 'z', 'zx', 'zixi', '', '县', '361028', '0794', 9);
INSERT INTO `youbang_sys_area` VALUES (1683, '东乡', 253, 'd', 'dx', 'dongxiang', '', '县', '361029', '0794', 10);
INSERT INTO `youbang_sys_area` VALUES (1684, '广昌', 253, 'g', 'gc', 'guangchang', '', '县', '361030', '0794', 11);
INSERT INTO `youbang_sys_area` VALUES (1685, '信州', 254, 'x', 'xz', 'xinzhou', '', '区', '361102', '0793', 1);
INSERT INTO `youbang_sys_area` VALUES (1686, '上饶', 254, 's', 'sr', 'shangrao', '', '县', '361121', '0793', 3);
INSERT INTO `youbang_sys_area` VALUES (1687, '广丰', 254, 'g', 'gf', 'guangfeng', '', '区', '361122', '0793', 2);
INSERT INTO `youbang_sys_area` VALUES (1688, '玉山', 254, 'y', 'ys', 'yushan', '', '县', '361123', '0793', 4);
INSERT INTO `youbang_sys_area` VALUES (1689, '铅山', 254, 'q', 'qs', 'qianshan', '', '县', '361124', '0793', 5);
INSERT INTO `youbang_sys_area` VALUES (1690, '横峰', 254, 'h', 'hf', 'hengfeng', '', '县', '361125', '0793', 6);
INSERT INTO `youbang_sys_area` VALUES (1691, '弋阳', 254, 'y', 'yy', 'yiyang', '', '县', '361126', '0793', 7);
INSERT INTO `youbang_sys_area` VALUES (1692, '余干', 254, 'y', 'yg', 'yugan', '', '县', '361127', '0793', 8);
INSERT INTO `youbang_sys_area` VALUES (1693, '鄱阳', 254, 'p', 'py', 'poyang', '', '县', '361128', '0793', 9);
INSERT INTO `youbang_sys_area` VALUES (1694, '万年', 254, 'w', 'wn', 'wannian', '', '县', '361129', '0793', 10);
INSERT INTO `youbang_sys_area` VALUES (1695, '婺源', 254, 'w', 'wy', 'wuyuan', '', '县', '361130', '0793', 11);
INSERT INTO `youbang_sys_area` VALUES (1696, '德兴', 254, 'd', 'dx', 'dexing', '', '市', '361181', '0793', 12);
INSERT INTO `youbang_sys_area` VALUES (1697, '历下', 255, 'l', 'lx', 'lixia', '', '区', '370102', '0531', 1);
INSERT INTO `youbang_sys_area` VALUES (1698, '市中', 255, 's', 'sz', 'shizhong', '', '区', '370103', '0531', 2);
INSERT INTO `youbang_sys_area` VALUES (1699, '槐荫', 255, 'h', 'hy', 'huaiyin', '', '区', '370104', '0531', 3);
INSERT INTO `youbang_sys_area` VALUES (1700, '天桥', 255, 't', 'tq', 'tianqiao', '', '区', '370105', '0531', 4);
INSERT INTO `youbang_sys_area` VALUES (1701, '历城', 255, 'l', 'lc', 'licheng', '', '区', '370112', '0531', 5);
INSERT INTO `youbang_sys_area` VALUES (1702, '长清', 255, 'c', 'cq', 'changqing', '', '区', '370113', '0531', 6);
INSERT INTO `youbang_sys_area` VALUES (1703, '平阴', 255, 'p', 'py', 'pingyin', '', '县', '370124', '0531', 7);
INSERT INTO `youbang_sys_area` VALUES (1704, '济阳', 255, 'j', 'jy', 'jiyang', '', '区', '370125', '0531', 8);
INSERT INTO `youbang_sys_area` VALUES (1705, '商河', 255, 's', 'sh', 'shanghe', '', '县', '370126', '0531', 9);
INSERT INTO `youbang_sys_area` VALUES (1706, '章丘', 255, 'z', 'zq', 'zhangqiu', '', '区', '370181', '0531', 10);
INSERT INTO `youbang_sys_area` VALUES (1707, '市南', 256, 's', 'sn', 'shinan', '', '区', '370202', '0532', 1);
INSERT INTO `youbang_sys_area` VALUES (1708, '市北', 256, 's', 'sb', 'shibei', '', '区', '370203', '0532', 2);
INSERT INTO `youbang_sys_area` VALUES (1709, '黄岛', 256, 'h', 'hd', 'huangdao', '', '区', '370211', '0532', 3);
INSERT INTO `youbang_sys_area` VALUES (1710, '崂山', 256, 'l', 'ls', 'laoshan', '', '区', '370212', '0532', 4);
INSERT INTO `youbang_sys_area` VALUES (1711, '李沧', 256, 'l', 'lc', 'licang', '', '区', '370213', '0532', 5);
INSERT INTO `youbang_sys_area` VALUES (1712, '城阳', 256, 'c', 'cy', 'chengyang', '', '区', '370214', '0532', 6);
INSERT INTO `youbang_sys_area` VALUES (1713, '胶州', 256, 'j', 'jz', 'jiaozhou', '', '市', '370281', '0532', 7);
INSERT INTO `youbang_sys_area` VALUES (1714, '即墨', 256, 'j', 'jm', 'jimo', '', '市', '370282', '0532', 8);
INSERT INTO `youbang_sys_area` VALUES (1715, '平度', 256, 'p', 'pd', 'pingdu', '', '市', '370283', '0532', 9);
INSERT INTO `youbang_sys_area` VALUES (1716, '莱西', 256, 'l', 'lx', 'laixi', '', '市', '370285', '0532', 10);
INSERT INTO `youbang_sys_area` VALUES (1717, '淄川', 257, 'z', 'zc', 'zichuan', '', '区', '370302', '0533', 1);
INSERT INTO `youbang_sys_area` VALUES (1718, '张店', 257, 'z', 'zd', 'zhangdian', '', '区', '370303', '0533', 2);
INSERT INTO `youbang_sys_area` VALUES (1719, '博山', 257, 'b', 'bs', 'boshan', '', '区', '370304', '0533', 3);
INSERT INTO `youbang_sys_area` VALUES (1720, '临淄', 257, 'l', 'lz', 'linzi', '', '区', '370305', '0533', 4);
INSERT INTO `youbang_sys_area` VALUES (1721, '周村', 257, 'z', 'zc', 'zhoucun', '', '区', '370306', '0533', 5);
INSERT INTO `youbang_sys_area` VALUES (1722, '桓台', 257, 'h', 'ht', 'huantai', '', '县', '370321', '0533', 6);
INSERT INTO `youbang_sys_area` VALUES (1723, '高青', 257, 'g', 'gq', 'gaoqing', '', '县', '370322', '0533', 7);
INSERT INTO `youbang_sys_area` VALUES (1724, '沂源', 257, 'y', 'yy', 'yiyuan', '', '县', '370323', '0533', 8);
INSERT INTO `youbang_sys_area` VALUES (1725, '市中', 258, 's', 'sz', 'shizhong', '', '区', '370402', '0632', 1);
INSERT INTO `youbang_sys_area` VALUES (1726, '薛城', 258, 'x', 'xc', 'xuecheng', '', '区', '370403', '0632', 2);
INSERT INTO `youbang_sys_area` VALUES (1727, '峄城', 258, 'y', 'yc', 'yicheng', '', '区', '370404', '0632', 3);
INSERT INTO `youbang_sys_area` VALUES (1728, '台儿庄', 258, 't', 'tez', 'taierzhuang', '', '区', '370405', '0632', 4);
INSERT INTO `youbang_sys_area` VALUES (1729, '山亭', 258, 's', 'st', 'shanting', '', '区', '370406', '0632', 5);
INSERT INTO `youbang_sys_area` VALUES (1730, '滕州', 258, 't', 'tz', 'tengzhou', '', '市', '370481', '0632', 6);
INSERT INTO `youbang_sys_area` VALUES (1731, '东营', 259, 'd', 'dy', 'dongying', '', '区', '370502', '0546', 1);
INSERT INTO `youbang_sys_area` VALUES (1732, '河口', 259, 'h', 'hk', 'hekou', '', '区', '370503', '0546', 2);
INSERT INTO `youbang_sys_area` VALUES (1733, '垦利', 259, 'k', 'kl', 'kenli', '', '区', '370521', '0546', 3);
INSERT INTO `youbang_sys_area` VALUES (1734, '利津', 259, 'l', 'lj', 'lijin', '', '县', '370522', '0546', 4);
INSERT INTO `youbang_sys_area` VALUES (1735, '广饶', 259, 'g', 'gr', 'guangrao', '', '县', '370523', '0546', 5);
INSERT INTO `youbang_sys_area` VALUES (1736, '芝罘', 260, 'z', 'zf', 'zhifu', '', '区', '370602', '0535', 1);
INSERT INTO `youbang_sys_area` VALUES (1737, '福山', 260, 'f', 'fs', 'fushan', '', '区', '370611', '0535', 2);
INSERT INTO `youbang_sys_area` VALUES (1738, '牟平', 260, 'm', 'mp', 'mouping', '', '区', '370612', '0535', 3);
INSERT INTO `youbang_sys_area` VALUES (1739, '莱山', 260, 'l', 'ls', 'laishan', '', '区', '370613', '0535', 4);
INSERT INTO `youbang_sys_area` VALUES (1740, '长岛', 260, 'c', 'cd', 'changdao', '', '县', '370634', '0535', 5);
INSERT INTO `youbang_sys_area` VALUES (1741, '龙口', 260, 'l', 'lk', 'longkou', '', '市', '370681', '0535', 6);
INSERT INTO `youbang_sys_area` VALUES (1742, '莱阳', 260, 'l', 'ly', 'laiyang', '', '市', '370682', '0535', 7);
INSERT INTO `youbang_sys_area` VALUES (1743, '莱州', 260, 'l', 'lz', 'laizhou', '', '市', '370683', '0535', 8);
INSERT INTO `youbang_sys_area` VALUES (1744, '蓬莱', 260, 'p', 'pl', 'penglai', '', '市', '370684', '0535', 9);
INSERT INTO `youbang_sys_area` VALUES (1745, '招远', 260, 'z', 'zy', 'zhaoyuan', '', '市', '370685', '0535', 10);
INSERT INTO `youbang_sys_area` VALUES (1746, '栖霞', 260, 'q', 'qx', 'qixia', '', '市', '370686', '0535', 11);
INSERT INTO `youbang_sys_area` VALUES (1747, '海阳', 260, 'h', 'hy', 'haiyang', '', '市', '370687', '0535', 12);
INSERT INTO `youbang_sys_area` VALUES (1748, '潍城', 261, 'w', 'wc', 'weicheng', '', '区', '370702', '0536', 1);
INSERT INTO `youbang_sys_area` VALUES (1749, '寒亭', 261, 'h', 'ht', 'hanting', '', '区', '370703', '0536', 2);
INSERT INTO `youbang_sys_area` VALUES (1750, '坊子', 261, 'f', 'fz', 'fangzi', '', '区', '370704', '0536', 3);
INSERT INTO `youbang_sys_area` VALUES (1751, '奎文', 261, 'k', 'kw', 'kuiwen', '', '区', '370705', '0536', 4);
INSERT INTO `youbang_sys_area` VALUES (1752, '临朐', 261, 'l', 'lq', 'linqu', '', '县', '370724', '0536', 5);
INSERT INTO `youbang_sys_area` VALUES (1753, '昌乐', 261, 'c', 'cl', 'changle', '', '县', '370725', '0536', 6);
INSERT INTO `youbang_sys_area` VALUES (1754, '青州', 261, 'q', 'qz', 'qingzhou', '', '市', '370781', '0536', 7);
INSERT INTO `youbang_sys_area` VALUES (1755, '诸城', 261, 'z', 'zc', 'zhucheng', '', '市', '370782', '0536', 8);
INSERT INTO `youbang_sys_area` VALUES (1756, '寿光', 261, 's', 'sg', 'shouguang', '', '市', '370783', '0536', 9);
INSERT INTO `youbang_sys_area` VALUES (1757, '安丘', 261, 'a', 'aq', 'anqiu', '', '市', '370784', '0536', 10);
INSERT INTO `youbang_sys_area` VALUES (1758, '高密', 261, 'g', 'gm', 'gaomi', '', '市', '370785', '0536', 11);
INSERT INTO `youbang_sys_area` VALUES (1759, '昌邑', 261, 'c', 'cy', 'changyi', '', '市', '370786', '0536', 12);
INSERT INTO `youbang_sys_area` VALUES (1761, '任城', 262, 'r', 'rc', 'rencheng', '', '区', '370811', '0537', 1);
INSERT INTO `youbang_sys_area` VALUES (1762, '微山', 262, 'w', 'ws', 'weishan', '', '县', '370826', '0537', 3);
INSERT INTO `youbang_sys_area` VALUES (1763, '鱼台', 262, 'y', 'yt', 'yutai', '', '县', '370827', '0537', 4);
INSERT INTO `youbang_sys_area` VALUES (1764, '金乡', 262, 'j', 'jx', 'jinxiang', '', '县', '370828', '0537', 5);
INSERT INTO `youbang_sys_area` VALUES (1765, '嘉祥', 262, 'j', 'jx', 'jiaxiang', '', '县', '370829', '0537', 6);
INSERT INTO `youbang_sys_area` VALUES (1766, '汶上', 262, 'w', 'ws', 'wenshang', '', '县', '370830', '0537', 7);
INSERT INTO `youbang_sys_area` VALUES (1767, '泗水', 262, 's', 'ss', 'sishui', '', '县', '370831', '0537', 8);
INSERT INTO `youbang_sys_area` VALUES (1768, '梁山', 262, 'l', 'ls', 'liangshan', '', '县', '370832', '0537', 9);
INSERT INTO `youbang_sys_area` VALUES (1769, '曲阜', 262, 'q', 'qf', 'qufu', '', '市', '370881', '0537', 10);
INSERT INTO `youbang_sys_area` VALUES (1770, '兖州', 262, 'y', 'yz', 'yanzhou', '', '区', '370812', '0537', 2);
INSERT INTO `youbang_sys_area` VALUES (1771, '邹城', 262, 'z', 'zc', 'zoucheng', '', '市', '370883', '0537', 11);
INSERT INTO `youbang_sys_area` VALUES (1772, '泰山', 263, 't', 'ts', 'taishan', '', '区', '370902', '0538', 1);
INSERT INTO `youbang_sys_area` VALUES (1773, '岱岳', 263, 'd', 'dy', 'daiyue', '', '区', '370911', '0538', 2);
INSERT INTO `youbang_sys_area` VALUES (1774, '宁阳', 263, 'n', 'ny', 'ningyang', '', '县', '370921', '0538', 3);
INSERT INTO `youbang_sys_area` VALUES (1775, '东平', 263, 'd', 'dp', 'dongping', '', '县', '370923', '0538', 4);
INSERT INTO `youbang_sys_area` VALUES (1776, '新泰', 263, 'x', 'xt', 'xintai', '', '市', '370982', '0538', 5);
INSERT INTO `youbang_sys_area` VALUES (1777, '肥城', 263, 'f', 'fc', 'feicheng', '', '市', '370983', '0538', 6);
INSERT INTO `youbang_sys_area` VALUES (1778, '环翠', 264, 'h', 'hc', 'huancui', '', '区', '371002', '0631', 1);
INSERT INTO `youbang_sys_area` VALUES (1779, '文登', 264, 'w', 'wd', 'wendeng', '', '区', '371003', '0631', 2);
INSERT INTO `youbang_sys_area` VALUES (1780, '荣成', 264, 'r', 'rc', 'rongcheng', '', '市', '371082', '0631', 3);
INSERT INTO `youbang_sys_area` VALUES (1781, '乳山', 264, 'r', 'rs', 'rushan', '', '市', '371083', '0631', 4);
INSERT INTO `youbang_sys_area` VALUES (1782, '东港', 265, 'd', 'dg', 'donggang', '', '区', '371102', '0633', 1);
INSERT INTO `youbang_sys_area` VALUES (1783, '岚山', 265, 'l', 'ls', 'lanshan', '', '区', '371103', '0633', 2);
INSERT INTO `youbang_sys_area` VALUES (1784, '五莲', 265, 'w', 'wl', 'wulian', '', '县', '371121', '0633', 3);
INSERT INTO `youbang_sys_area` VALUES (1785, '莒县', 265, 'j', 'jx', 'juxian', '', '', '371122', '0633', 4);
INSERT INTO `youbang_sys_area` VALUES (1786, '莱芜', 255, 'l', 'lw', 'laiwu', '', '区', '371202', '0634', 1);
INSERT INTO `youbang_sys_area` VALUES (1787, '钢城', 255, 'g', 'gc', 'gangcheng', '', '区', '371203', '0634', 2);
INSERT INTO `youbang_sys_area` VALUES (1788, '兰山', 267, 'l', 'ls', 'lanshan', '', '区', '371302', '0539', 1);
INSERT INTO `youbang_sys_area` VALUES (1789, '罗庄', 267, 'l', 'lz', 'luozhuang', '', '区', '371311', '0539', 2);
INSERT INTO `youbang_sys_area` VALUES (1790, '河东', 267, 'h', 'hd', 'hedong', '', '区', '371312', '0539', 3);
INSERT INTO `youbang_sys_area` VALUES (1791, '沂南', 267, 'y', 'yn', 'yinan', '', '县', '371321', '0539', 4);
INSERT INTO `youbang_sys_area` VALUES (1792, '郯城', 267, 't', 'tc', 'tancheng', '', '县', '371322', '0539', 5);
INSERT INTO `youbang_sys_area` VALUES (1793, '沂水', 267, 'y', 'ys', 'yishui', '', '县', '371323', '0539', 6);
INSERT INTO `youbang_sys_area` VALUES (1794, '兰陵', 267, 'l', 'll', 'lanling', '', '县', '371324', '0539', 7);
INSERT INTO `youbang_sys_area` VALUES (1795, '费县', 267, 'f', 'fx', 'feixian', '', '', '371325', '0539', 8);
INSERT INTO `youbang_sys_area` VALUES (1796, '平邑', 267, 'p', 'py', 'pingyi', '', '县', '371326', '0539', 9);
INSERT INTO `youbang_sys_area` VALUES (1797, '莒南', 267, 'j', 'jn', 'junan', '', '县', '371327', '0539', 10);
INSERT INTO `youbang_sys_area` VALUES (1798, '蒙阴', 267, 'm', 'my', 'mengyin', '', '县', '371328', '0539', 11);
INSERT INTO `youbang_sys_area` VALUES (1799, '临沭', 267, 'l', 'ls', 'linshu', '', '县', '371329', '0539', 12);
INSERT INTO `youbang_sys_area` VALUES (1800, '德城', 268, 'd', 'dc', 'decheng', '', '区', '371402', '0534', 1);
INSERT INTO `youbang_sys_area` VALUES (1801, '陵城', 268, 'l', 'lc', 'lingcheng', '', '区', '371403', '0534', 2);
INSERT INTO `youbang_sys_area` VALUES (1802, '宁津', 268, 'n', 'nj', 'ningjin', '', '县', '371422', '0534', 3);
INSERT INTO `youbang_sys_area` VALUES (1803, '庆云', 268, 'q', 'qy', 'qingyun', '', '县', '371423', '0534', 4);
INSERT INTO `youbang_sys_area` VALUES (1804, '临邑', 268, 'l', 'ly', 'linyi', '', '县', '371424', '0534', 5);
INSERT INTO `youbang_sys_area` VALUES (1805, '齐河', 268, 'q', 'qh', 'qihe', '', '县', '371425', '0534', 6);
INSERT INTO `youbang_sys_area` VALUES (1806, '平原', 268, 'p', 'py', 'pingyuan', '', '县', '371426', '0534', 7);
INSERT INTO `youbang_sys_area` VALUES (1807, '夏津', 268, 'x', 'xj', 'xiajin', '', '县', '371427', '0534', 8);
INSERT INTO `youbang_sys_area` VALUES (1808, '武城', 268, 'w', 'wc', 'wucheng', '', '县', '371428', '0534', 9);
INSERT INTO `youbang_sys_area` VALUES (1809, '乐陵', 268, 'l', 'll', 'leling', '', '市', '371481', '0534', 10);
INSERT INTO `youbang_sys_area` VALUES (1810, '禹城', 268, 'y', 'yc', 'yucheng', '', '市', '371482', '0534', 11);
INSERT INTO `youbang_sys_area` VALUES (1811, '东昌府', 269, 'd', 'dcf', 'dongchangfu', '', '区', '371502', '0635', 1);
INSERT INTO `youbang_sys_area` VALUES (1812, '阳谷', 269, 'y', 'yg', 'yanggu', '', '县', '371521', '0635', 2);
INSERT INTO `youbang_sys_area` VALUES (1813, '莘县', 269, 'x', 'xx', 'xinxian', '', '', '371522', '0635', 3);
INSERT INTO `youbang_sys_area` VALUES (1814, '茌平', 269, 'c', 'cp', 'chiping', '', '县', '371523', '0635', 4);
INSERT INTO `youbang_sys_area` VALUES (1815, '东阿', 269, 'd', 'da', 'donga', '', '县', '371524', '0635', 5);
INSERT INTO `youbang_sys_area` VALUES (1816, '冠县', 269, 'g', 'gx', 'guanxian', '', '', '371525', '0635', 6);
INSERT INTO `youbang_sys_area` VALUES (1817, '高唐', 269, 'g', 'gt', 'gaotang', '', '县', '371526', '0635', 7);
INSERT INTO `youbang_sys_area` VALUES (1818, '临清', 269, 'l', 'lq', 'linqing', '', '市', '371581', '0635', 8);
INSERT INTO `youbang_sys_area` VALUES (1819, '滨城', 270, 'b', 'bc', 'bincheng', '', '区', '371602', '0543', 1);
INSERT INTO `youbang_sys_area` VALUES (1820, '惠民', 270, 'h', 'hm', 'huimin', '', '县', '371621', '0543', 2);
INSERT INTO `youbang_sys_area` VALUES (1821, '阳信', 270, 'y', 'yx', 'yangxin', '', '县', '371622', '0543', 3);
INSERT INTO `youbang_sys_area` VALUES (1822, '无棣', 270, 'w', 'wd', 'wudi', '', '县', '371623', '0543', 4);
INSERT INTO `youbang_sys_area` VALUES (1823, '沾化', 270, 'z', 'zh', 'zhanhua', '', '区', '371624', '0543', 5);
INSERT INTO `youbang_sys_area` VALUES (1824, '博兴', 270, 'b', 'bx', 'boxing', '', '县', '371625', '0543', 6);
INSERT INTO `youbang_sys_area` VALUES (1825, '邹平', 270, 'z', 'zp', 'zouping', '', '县', '371626', '0543', 7);
INSERT INTO `youbang_sys_area` VALUES (1826, '牡丹', 271, 'm', 'md', 'mudan', '', '区', '371702', '0530', 1);
INSERT INTO `youbang_sys_area` VALUES (1827, '曹县', 271, 'c', 'cx', 'caoxian', '', '', '371721', '0530', 2);
INSERT INTO `youbang_sys_area` VALUES (1828, '单县', 271, 'd', 'dx', 'danxian', '', '', '371722', '0530', 3);
INSERT INTO `youbang_sys_area` VALUES (1829, '成武', 271, 'c', 'cw', 'chengwu', '', '县', '371723', '0530', 4);
INSERT INTO `youbang_sys_area` VALUES (1830, '巨野', 271, 'j', 'jy', 'juye', '', '县', '371724', '0530', 5);
INSERT INTO `youbang_sys_area` VALUES (1831, '郓城', 271, 'y', 'yc', 'yuncheng', '', '县', '371725', '0530', 6);
INSERT INTO `youbang_sys_area` VALUES (1832, '鄄城', 271, 'j', 'jc', 'juancheng', '', '县', '371726', '0530', 7);
INSERT INTO `youbang_sys_area` VALUES (1833, '定陶', 271, 'd', 'dt', 'dingtao', '', '区', '371727', '0530', 8);
INSERT INTO `youbang_sys_area` VALUES (1834, '东明', 271, 'd', 'dm', 'dongming', '', '县', '371728', '0530', 9);
INSERT INTO `youbang_sys_area` VALUES (1835, '中原', 272, 'z', 'zy', 'zhongyuan', '', '区', '410102', '0371', 1);
INSERT INTO `youbang_sys_area` VALUES (1836, '二七', 272, 'e', 'eq', 'erqi', '', '区', '410103', '0371', 2);
INSERT INTO `youbang_sys_area` VALUES (1837, '管城', 272, 'g', 'gc', 'guancheng', '回族', '区', '410104', '0371', 3);
INSERT INTO `youbang_sys_area` VALUES (1838, '金水', 272, 'j', 'js', 'jinshui', '', '区', '410105', '0371', 4);
INSERT INTO `youbang_sys_area` VALUES (1839, '上街', 272, 's', 'sj', 'shangjie', '', '区', '410106', '0371', 5);
INSERT INTO `youbang_sys_area` VALUES (1840, '惠济', 272, 'h', 'hj', 'huiji', '', '区', '410108', '0371', 6);
INSERT INTO `youbang_sys_area` VALUES (1841, '中牟', 272, 'z', 'zm', 'zhongmou', '', '县', '410122', '0371', 7);
INSERT INTO `youbang_sys_area` VALUES (1842, '巩义', 272, 'g', 'gy', 'gongyi', '', '市', '410181', '0371', 8);
INSERT INTO `youbang_sys_area` VALUES (1843, '荥阳', 272, 'y', 'yy', 'yingyang', '', '市', '410182', '0371', 9);
INSERT INTO `youbang_sys_area` VALUES (1844, '新密', 272, 'x', 'xm', 'xinmi', '', '市', '410183', '0371', 10);
INSERT INTO `youbang_sys_area` VALUES (1845, '新郑', 272, 'x', 'xz', 'xinzheng', '', '市', '410184', '0371', 11);
INSERT INTO `youbang_sys_area` VALUES (1846, '登封', 272, 'd', 'df', 'dengfeng', '', '市', '410185', '0371', 12);
INSERT INTO `youbang_sys_area` VALUES (1847, '龙亭', 273, 'l', 'lt', 'longting', '', '区', '410202', '0378', 1);
INSERT INTO `youbang_sys_area` VALUES (1848, '顺河', 273, 's', 'sh', 'shunhe', '回族', '区', '410203', '0378', 2);
INSERT INTO `youbang_sys_area` VALUES (1849, '鼓楼', 273, 'g', 'gl', 'gulou', '', '区', '410204', '0378', 3);
INSERT INTO `youbang_sys_area` VALUES (1850, '禹王台', 273, 'y', 'ywt', 'yuwangtai', '', '区', '410205', '0378', 4);
INSERT INTO `youbang_sys_area` VALUES (1852, '杞县', 273, 'q', 'qx', 'qixian', '', '', '410221', '0378', 6);
INSERT INTO `youbang_sys_area` VALUES (1853, '通许', 273, 't', 'tx', 'tongxu', '', '县', '410222', '0378', 7);
INSERT INTO `youbang_sys_area` VALUES (1854, '尉氏', 273, 'w', 'ws', 'weishi', '', '县', '410223', '0378', 8);
INSERT INTO `youbang_sys_area` VALUES (1855, '祥符', 273, 'x', 'xf', 'kaifeng', '', '区', '410212', '0378', 5);
INSERT INTO `youbang_sys_area` VALUES (1856, '兰考', 273, 'l', 'lk', 'lankao', '', '县', '410225', '0378', 9);
INSERT INTO `youbang_sys_area` VALUES (1857, '老城', 274, 'l', 'lc', 'laocheng', '', '区', '410302', '0376', 1);
INSERT INTO `youbang_sys_area` VALUES (1858, '西工', 274, 'x', 'xg', 'xigong', '', '区', '410303', '0376', 2);
INSERT INTO `youbang_sys_area` VALUES (1859, '瀍河', 274, 'c', 'ch', 'chanhe', '回族', '区', '410304', '0376', 3);
INSERT INTO `youbang_sys_area` VALUES (1860, '涧西', 274, 'j', 'jx', 'jianxi', '', '区', '410305', '0376', 4);
INSERT INTO `youbang_sys_area` VALUES (1861, '吉利', 274, 'j', 'jl', 'jili', '', '区', '410306', '0376', 5);
INSERT INTO `youbang_sys_area` VALUES (1862, '洛龙', 274, 'l', 'll', 'luolong', '', '区', '410311', '0376', 6);
INSERT INTO `youbang_sys_area` VALUES (1863, '孟津', 274, 'm', 'mj', 'mengjin', '', '县', '410322', '0376', 7);
INSERT INTO `youbang_sys_area` VALUES (1864, '新安', 274, 'x', 'xa', 'xinan', '', '县', '410323', '0376', 8);
INSERT INTO `youbang_sys_area` VALUES (1865, '栾川', 274, 'l', 'lc', 'luanchuan', '', '县', '410324', '0376', 9);
INSERT INTO `youbang_sys_area` VALUES (1866, '嵩县', 274, 's', 'sx', 'songxian', '', '', '410325', '0376', 10);
INSERT INTO `youbang_sys_area` VALUES (1867, '汝阳', 274, 'r', 'ry', 'ruyang', '', '县', '410326', '0376', 11);
INSERT INTO `youbang_sys_area` VALUES (1868, '宜阳', 274, 'y', 'yy', 'yiyang', '', '县', '410327', '0376', 12);
INSERT INTO `youbang_sys_area` VALUES (1869, '洛宁', 274, 'l', 'ln', 'luoning', '', '县', '410328', '0376', 13);
INSERT INTO `youbang_sys_area` VALUES (1870, '伊川', 274, 'y', 'yc', 'yichuan', '', '县', '410329', '0376', 14);
INSERT INTO `youbang_sys_area` VALUES (1871, '偃师', 274, 'y', 'ys', 'yanshi', '', '市', '410381', '0376', 15);
INSERT INTO `youbang_sys_area` VALUES (1872, '新华', 275, 'x', 'xh', 'xinhua', '', '区', '410402', '0375', 1);
INSERT INTO `youbang_sys_area` VALUES (1873, '卫东', 275, 'w', 'wd', 'weidong', '', '区', '410403', '0375', 2);
INSERT INTO `youbang_sys_area` VALUES (1874, '石龙', 275, 's', 'sl', 'shilong', '', '区', '410404', '0375', 3);
INSERT INTO `youbang_sys_area` VALUES (1875, '湛河', 275, 'z', 'zh', 'zhanhe', '', '区', '410411', '0375', 4);
INSERT INTO `youbang_sys_area` VALUES (1876, '宝丰', 275, 'b', 'bf', 'baofeng', '', '县', '410421', '0375', 5);
INSERT INTO `youbang_sys_area` VALUES (1877, '叶县', 275, 'y', 'yx', 'yexian', '', '', '410422', '0375', 6);
INSERT INTO `youbang_sys_area` VALUES (1878, '鲁山', 275, 'l', 'ls', 'lushan', '', '县', '410423', '0375', 7);
INSERT INTO `youbang_sys_area` VALUES (1879, '郏县', 275, 'j', 'jx', 'jiaxian', '', '', '410425', '0375', 8);
INSERT INTO `youbang_sys_area` VALUES (1880, '舞钢', 275, 'w', 'wg', 'wugang', '', '市', '410481', '0375', 9);
INSERT INTO `youbang_sys_area` VALUES (1881, '汝州', 275, 'r', 'rz', 'ruzhou', '', '市', '410482', '0375', 10);
INSERT INTO `youbang_sys_area` VALUES (1882, '文峰', 276, 'w', 'wf', 'wenfeng', '', '区', '410502', '0372', 1);
INSERT INTO `youbang_sys_area` VALUES (1883, '北关', 276, 'b', 'bg', 'beiguan', '', '区', '410503', '0372', 2);
INSERT INTO `youbang_sys_area` VALUES (1884, '殷都', 276, 'y', 'yd', 'yindu', '', '区', '410505', '0372', 3);
INSERT INTO `youbang_sys_area` VALUES (1885, '龙安', 276, 'l', 'la', 'longan', '', '区', '410506', '0372', 4);
INSERT INTO `youbang_sys_area` VALUES (1886, '安阳', 276, 'a', 'ay', 'anyang', '', '县', '410522', '0372', 5);
INSERT INTO `youbang_sys_area` VALUES (1887, '汤阴', 276, 't', 'ty', 'tangyin', '', '县', '410523', '0372', 6);
INSERT INTO `youbang_sys_area` VALUES (1888, '滑县', 276, 'h', 'hx', 'huaxian', '', '', '410526', '0372', 7);
INSERT INTO `youbang_sys_area` VALUES (1889, '内黄', 276, 'n', 'nh', 'neihuang', '', '县', '410527', '0372', 8);
INSERT INTO `youbang_sys_area` VALUES (1890, '林州', 276, 'l', 'lz', 'linzhou', '', '市', '410581', '0372', 9);
INSERT INTO `youbang_sys_area` VALUES (1891, '鹤山', 277, 'h', 'hs', 'heshan', '', '区', '410602', '0392', 1);
INSERT INTO `youbang_sys_area` VALUES (1892, '山城', 277, 's', 'sc', 'shancheng', '', '区', '410603', '0392', 2);
INSERT INTO `youbang_sys_area` VALUES (1893, '淇滨', 277, 'q', 'qb', 'qibin', '', '区', '410611', '0392', 3);
INSERT INTO `youbang_sys_area` VALUES (1894, '浚县', 277, 'j', 'jx', 'junxian', '', '', '410621', '0392', 4);
INSERT INTO `youbang_sys_area` VALUES (1895, '淇县', 277, 'q', 'qx', 'qixian', '', '', '410622', '0392', 5);
INSERT INTO `youbang_sys_area` VALUES (1896, '红旗', 278, 'h', 'hq', 'hongqi', '', '区', '410702', '0373', 1);
INSERT INTO `youbang_sys_area` VALUES (1897, '卫滨', 278, 'w', 'wb', 'weibin', '', '区', '410703', '0373', 2);
INSERT INTO `youbang_sys_area` VALUES (1898, '凤泉', 278, 'f', 'fq', 'fengquan', '', '区', '410704', '0373', 3);
INSERT INTO `youbang_sys_area` VALUES (1899, '牧野', 278, 'm', 'my', 'muye', '', '区', '410711', '0373', 4);
INSERT INTO `youbang_sys_area` VALUES (1900, '新乡', 278, 'x', 'xx', 'xinxiang', '', '县', '410721', '0373', 5);
INSERT INTO `youbang_sys_area` VALUES (1901, '获嘉', 278, 'h', 'hj', 'huojia', '', '县', '410724', '0373', 6);
INSERT INTO `youbang_sys_area` VALUES (1902, '原阳', 278, 'y', 'yy', 'yuanyang', '', '县', '410725', '0373', 7);
INSERT INTO `youbang_sys_area` VALUES (1903, '延津', 278, 'y', 'yj', 'yanjin', '', '县', '410726', '0373', 8);
INSERT INTO `youbang_sys_area` VALUES (1904, '封丘', 278, 'f', 'fq', 'fengqiu', '', '县', '410727', '0373', 9);
INSERT INTO `youbang_sys_area` VALUES (1905, '长垣', 278, 'c', 'cy', 'changyuan', '', '县', '410728', '0373', 10);
INSERT INTO `youbang_sys_area` VALUES (1906, '卫辉', 278, 'w', 'wh', 'weihui', '', '市', '410781', '0373', 11);
INSERT INTO `youbang_sys_area` VALUES (1907, '辉县', 278, 'h', 'hx', 'huixian', '', '市', '410782', '0373', 12);
INSERT INTO `youbang_sys_area` VALUES (1908, '解放', 279, 'j', 'jf', 'jiefang', '', '区', '410802', '0391', 1);
INSERT INTO `youbang_sys_area` VALUES (1909, '中站', 279, 'z', 'zz', 'zhongzhan', '', '区', '410803', '0391', 2);
INSERT INTO `youbang_sys_area` VALUES (1910, '马村', 279, 'm', 'mc', 'macun', '', '区', '410804', '0391', 3);
INSERT INTO `youbang_sys_area` VALUES (1911, '山阳', 279, 's', 'sy', 'shanyang', '', '区', '410811', '0391', 4);
INSERT INTO `youbang_sys_area` VALUES (1912, '修武', 279, 'x', 'xw', 'xiuwu', '', '县', '410821', '0391', 5);
INSERT INTO `youbang_sys_area` VALUES (1913, '博爱', 279, 'b', 'ba', 'boai', '', '县', '410822', '0391', 6);
INSERT INTO `youbang_sys_area` VALUES (1914, '武陟', 279, 'w', 'wz', 'wuzhi', '', '县', '410823', '0391', 7);
INSERT INTO `youbang_sys_area` VALUES (1915, '温县', 279, 'w', 'wx', 'wenxian', '', '', '410825', '0391', 8);
INSERT INTO `youbang_sys_area` VALUES (1916, '沁阳', 279, 'q', 'qy', 'qinyang', '', '市', '410882', '0391', 9);
INSERT INTO `youbang_sys_area` VALUES (1917, '孟州', 279, 'm', 'mz', 'mengzhou', '', '市', '410883', '0391', 10);
INSERT INTO `youbang_sys_area` VALUES (1918, '华龙', 280, 'h', 'hl', 'hualong', '', '区', '410902', '', 1);
INSERT INTO `youbang_sys_area` VALUES (1919, '清丰', 280, 'q', 'qf', 'qingfeng', '', '县', '410922', '', 2);
INSERT INTO `youbang_sys_area` VALUES (1920, '南乐', 280, 'n', 'nl', 'nanle', '', '县', '410923', '', 3);
INSERT INTO `youbang_sys_area` VALUES (1921, '范县', 280, 'f', 'fx', 'fanxian', '', '', '410926', '', 4);
INSERT INTO `youbang_sys_area` VALUES (1922, '台前', 280, 't', 'tq', 'taiqian', '', '县', '410927', '', 5);
INSERT INTO `youbang_sys_area` VALUES (1923, '濮阳', 280, 'p', 'py', 'puyang', '', '县', '410928', '', 6);
INSERT INTO `youbang_sys_area` VALUES (1924, '魏都', 281, 'w', 'wd', 'weidu', '', '区', '411002', '0374', 1);
INSERT INTO `youbang_sys_area` VALUES (1925, '建安', 281, 'j', 'ja', 'jianan', '', '区', '411023', '0374', 2);
INSERT INTO `youbang_sys_area` VALUES (1926, '鄢陵', 281, 'y', 'yl', 'yanling', '', '县', '411024', '0374', 3);
INSERT INTO `youbang_sys_area` VALUES (1927, '襄城', 281, 'x', 'xc', 'xiangcheng', '', '县', '411025', '0374', 4);
INSERT INTO `youbang_sys_area` VALUES (1928, '禹州', 281, 'y', 'yz', 'yuzhou', '', '市', '411081', '0374', 5);
INSERT INTO `youbang_sys_area` VALUES (1929, '长葛', 281, 'c', 'cg', 'changge', '', '市', '411082', '0374', 6);
INSERT INTO `youbang_sys_area` VALUES (1930, '源汇', 282, 'y', 'yh', 'yuanhui', '', '区', '411102', '0395', 1);
INSERT INTO `youbang_sys_area` VALUES (1931, '郾城', 282, 'y', 'yc', 'yancheng', '', '区', '411103', '0395', 2);
INSERT INTO `youbang_sys_area` VALUES (1932, '召陵', 282, 'z', 'zl', 'zhaoling', '', '区', '411104', '0395', 3);
INSERT INTO `youbang_sys_area` VALUES (1933, '舞阳', 282, 'w', 'wy', 'wuyang', '', '县', '411121', '0395', 4);
INSERT INTO `youbang_sys_area` VALUES (1934, '临颍', 282, 'l', 'ly', 'linying', '', '县', '411122', '0395', 5);
INSERT INTO `youbang_sys_area` VALUES (1935, '湖滨', 283, 'h', 'hb', 'hubin', '', '区', '411202', '0398', 1);
INSERT INTO `youbang_sys_area` VALUES (1936, '渑池', 283, 'm', 'mc', 'mianchi', '', '县', '411221', '0398', 3);
INSERT INTO `youbang_sys_area` VALUES (1937, '陕州', 283, 's', 'sz', 'shanzhou', '', '区', '411222', '0398', 2);
INSERT INTO `youbang_sys_area` VALUES (1938, '卢氏', 283, 'l', 'ls', 'lushi', '', '县', '411224', '0398', 4);
INSERT INTO `youbang_sys_area` VALUES (1939, '义马', 283, 'y', 'ym', 'yima', '', '市', '411281', '0398', 5);
INSERT INTO `youbang_sys_area` VALUES (1940, '灵宝', 283, 'l', 'lb', 'lingbao', '', '市', '411282', '0398', 6);
INSERT INTO `youbang_sys_area` VALUES (1941, '宛城', 284, 'w', 'wc', 'wancheng', '', '区', '411302', '0377', 1);
INSERT INTO `youbang_sys_area` VALUES (1942, '卧龙', 284, 'w', 'wl', 'wolong', '', '区', '411303', '0377', 2);
INSERT INTO `youbang_sys_area` VALUES (1943, '南召', 284, 'n', 'nz', 'nanzhao', '', '县', '411321', '0377', 3);
INSERT INTO `youbang_sys_area` VALUES (1944, '方城', 284, 'f', 'fc', 'fangcheng', '', '县', '411322', '0377', 4);
INSERT INTO `youbang_sys_area` VALUES (1945, '西峡', 284, 'x', 'xx', 'xixia', '', '县', '411323', '0377', 5);
INSERT INTO `youbang_sys_area` VALUES (1946, '镇平', 284, 'z', 'zp', 'zhenping', '', '县', '411324', '0377', 6);
INSERT INTO `youbang_sys_area` VALUES (1947, '内乡', 284, 'n', 'nx', 'neixiang', '', '县', '411325', '0377', 7);
INSERT INTO `youbang_sys_area` VALUES (1948, '淅川', 284, 'x', 'xc', 'xichuan', '', '县', '411326', '0377', 8);
INSERT INTO `youbang_sys_area` VALUES (1949, '社旗', 284, 's', 'sq', 'sheqi', '', '县', '411327', '0377', 9);
INSERT INTO `youbang_sys_area` VALUES (1950, '唐河', 284, 't', 'th', 'tanghe', '', '县', '411328', '0377', 10);
INSERT INTO `youbang_sys_area` VALUES (1951, '新野', 284, 'x', 'xy', 'xinye', '', '县', '411329', '0377', 11);
INSERT INTO `youbang_sys_area` VALUES (1952, '桐柏', 284, 't', 'tb', 'tongbo', '', '县', '411330', '0377', 12);
INSERT INTO `youbang_sys_area` VALUES (1953, '邓州', 284, 'd', 'dz', 'dengzhou', '', '市', '411381', '0377', 13);
INSERT INTO `youbang_sys_area` VALUES (1954, '粱园', 285, 'l', 'ly', 'liangyuan', '', '区', '411402', '0370', 1);
INSERT INTO `youbang_sys_area` VALUES (1955, '睢阳', 285, 's', 'sy', 'suiyang', '', '区', '411403', '0370', 2);
INSERT INTO `youbang_sys_area` VALUES (1956, '民权', 285, 'm', 'mq', 'minquan', '', '县', '411421', '0370', 3);
INSERT INTO `youbang_sys_area` VALUES (1957, '睢县', 285, 's', 'sx', 'suixian', '', '', '411422', '0370', 4);
INSERT INTO `youbang_sys_area` VALUES (1958, '宁陵', 285, 'n', 'nl', 'ningling', '', '县', '411423', '0370', 5);
INSERT INTO `youbang_sys_area` VALUES (1959, '柘城', 285, 'z', 'zc', 'zhecheng', '', '县', '411424', '0370', 6);
INSERT INTO `youbang_sys_area` VALUES (1960, '虞城', 285, 'y', 'yc', 'yucheng', '', '县', '411425', '0370', 7);
INSERT INTO `youbang_sys_area` VALUES (1961, '夏邑', 285, 'x', 'xy', 'xiayi', '', '县', '411426', '0370', 8);
INSERT INTO `youbang_sys_area` VALUES (1962, '永城', 285, 'y', 'yc', 'yongcheng', '', '市', '411481', '0370', 9);
INSERT INTO `youbang_sys_area` VALUES (1963, '浉河', 286, 's', 'sh', 'shihe', '', '区', '411502', '0376', 1);
INSERT INTO `youbang_sys_area` VALUES (1964, '平桥', 286, 'p', 'pq', 'pingqiao', '', '区', '411503', '0376', 2);
INSERT INTO `youbang_sys_area` VALUES (1965, '罗山', 286, 'l', 'ls', 'luoshan', '', '县', '411521', '0376', 3);
INSERT INTO `youbang_sys_area` VALUES (1966, '光山', 286, 'g', 'gs', 'guangshan', '', '县', '411522', '0376', 4);
INSERT INTO `youbang_sys_area` VALUES (1967, '新县', 286, 'x', 'xx', 'xinxian', '', '', '411523', '0376', 5);
INSERT INTO `youbang_sys_area` VALUES (1968, '商城', 286, 's', 'sc', 'shangcheng', '', '县', '411524', '0376', 6);
INSERT INTO `youbang_sys_area` VALUES (1969, '固始', 286, 'g', 'gs', 'gushi', '', '县', '411525', '0376', 7);
INSERT INTO `youbang_sys_area` VALUES (1970, '潢川', 286, 'h', 'hc', 'huangchuan', '', '县', '411526', '0376', 8);
INSERT INTO `youbang_sys_area` VALUES (1971, '淮滨', 286, 'h', 'hb', 'huaibin', '', '县', '411527', '0376', 9);
INSERT INTO `youbang_sys_area` VALUES (1972, '息县', 286, 'x', 'xx', 'xixian', '', '', '411528', '0376', 10);
INSERT INTO `youbang_sys_area` VALUES (1973, '川汇', 287, 'c', 'ch', 'chuanhui', '', '区', '411602', '0394', 1);
INSERT INTO `youbang_sys_area` VALUES (1974, '扶沟', 287, 'f', 'fg', 'fugou', '', '县', '411621', '0394', 2);
INSERT INTO `youbang_sys_area` VALUES (1975, '西华', 287, 'x', 'xh', 'xihua', '', '县', '411622', '0394', 3);
INSERT INTO `youbang_sys_area` VALUES (1976, '商水', 287, 's', 'ss', 'shangshui', '', '县', '411623', '0394', 4);
INSERT INTO `youbang_sys_area` VALUES (1977, '沈丘', 287, 's', 'sq', 'shenqiu', '', '县', '411624', '0394', 5);
INSERT INTO `youbang_sys_area` VALUES (1978, '郸城', 287, 'd', 'dc', 'dancheng', '', '县', '411625', '0394', 6);
INSERT INTO `youbang_sys_area` VALUES (1979, '淮阳', 287, 'h', 'hy', 'huaiyang', '', '县', '411626', '0394', 7);
INSERT INTO `youbang_sys_area` VALUES (1980, '太康', 287, 't', 'tk', 'taikang', '', '县', '411627', '0394', 8);
INSERT INTO `youbang_sys_area` VALUES (1981, '鹿邑', 287, 'l', 'ly', 'luyi', '', '县', '411628', '0394', 9);
INSERT INTO `youbang_sys_area` VALUES (1982, '项城', 287, 'x', 'xc', 'xiangcheng', '', '市', '411681', '0394', 10);
INSERT INTO `youbang_sys_area` VALUES (1983, '驿城', 288, 'y', 'yc', 'yicheng', '', '区', '411702', '0396', 1);
INSERT INTO `youbang_sys_area` VALUES (1984, '西平', 288, 'x', 'xp', 'xiping', '', '县', '411721', '0396', 2);
INSERT INTO `youbang_sys_area` VALUES (1985, '上蔡', 288, 's', 'sc', 'shangcai', '', '县', '411722', '0396', 3);
INSERT INTO `youbang_sys_area` VALUES (1986, '平舆', 288, 'p', 'py', 'pingyu', '', '县', '411723', '0396', 4);
INSERT INTO `youbang_sys_area` VALUES (1987, '正阳', 288, 'z', 'zy', 'zhengyang', '', '县', '411724', '0396', 5);
INSERT INTO `youbang_sys_area` VALUES (1988, '确山', 288, 'q', 'qs', 'queshan', '', '县', '411725', '0396', 6);
INSERT INTO `youbang_sys_area` VALUES (1989, '泌阳', 288, 'm', 'my', 'miyang', '', '县', '411726', '0396', 7);
INSERT INTO `youbang_sys_area` VALUES (1990, '汝南', 288, 'r', 'rn', 'runan', '', '县', '411727', '0396', 8);
INSERT INTO `youbang_sys_area` VALUES (1991, '遂平', 288, 's', 'sp', 'suiping', '', '县', '411728', '0396', 9);
INSERT INTO `youbang_sys_area` VALUES (1992, '新蔡', 288, 'x', 'xc', 'xincai', '', '县', '411729', '0396', 10);
INSERT INTO `youbang_sys_area` VALUES (1993, '江岸', 290, 'j', 'ja', 'jiangan', '', '区', '420102', '027', 1);
INSERT INTO `youbang_sys_area` VALUES (1994, '江汉', 290, 'j', 'jh', 'jianghan', '', '区', '420103', '027', 2);
INSERT INTO `youbang_sys_area` VALUES (1995, '硚口', 290, 'q', 'qk', 'qiaokou', '', '区', '420104', '027', 3);
INSERT INTO `youbang_sys_area` VALUES (1996, '汉阳', 290, 'h', 'hy', 'hanyang', '', '区', '420105', '027', 4);
INSERT INTO `youbang_sys_area` VALUES (1997, '武昌', 290, 'w', 'wc', 'wuchang', '', '区', '420106', '027', 5);
INSERT INTO `youbang_sys_area` VALUES (1998, '青山', 290, 'q', 'qs', 'qingshan', '', '区', '420107', '027', 6);
INSERT INTO `youbang_sys_area` VALUES (1999, '洪山', 290, 'h', 'hs', 'hongshan', '', '区', '420111', '027', 7);
INSERT INTO `youbang_sys_area` VALUES (2000, '东西湖', 290, 'd', 'dxh', 'dongxihu', '', '区', '420112', '027', 8);
INSERT INTO `youbang_sys_area` VALUES (2001, '汉南', 290, 'h', 'hn', 'hannan', '', '区', '420113', '027', 9);
INSERT INTO `youbang_sys_area` VALUES (2002, '蔡甸', 290, 'c', 'cd', 'caidian', '', '区', '420114', '027', 10);
INSERT INTO `youbang_sys_area` VALUES (2003, '江夏', 290, 'j', 'jx', 'jiangxia', '', '区', '420115', '027', 11);
INSERT INTO `youbang_sys_area` VALUES (2004, '黄陂', 290, 'h', 'hp', 'huangpo', '', '区', '420116', '027', 12);
INSERT INTO `youbang_sys_area` VALUES (2005, '新洲', 290, 'x', 'xz', 'xinzhou', '', '区', '420117', '027', 13);
INSERT INTO `youbang_sys_area` VALUES (2006, '黄石港', 291, 'h', 'hsg', 'huangshigang', '', '区', '420202', '0714', 1);
INSERT INTO `youbang_sys_area` VALUES (2007, '西塞山', 291, 'x', 'xss', 'xisaishan', '', '区', '420203', '0714', 2);
INSERT INTO `youbang_sys_area` VALUES (2008, '下陆', 291, 'x', 'xl', 'xialu', '', '区', '420204', '0714', 3);
INSERT INTO `youbang_sys_area` VALUES (2009, '铁山', 291, 't', 'ts', 'tieshan', '', '区', '420205', '0714', 4);
INSERT INTO `youbang_sys_area` VALUES (2010, '阳新', 291, 'y', 'yx', 'yangxin', '', '县', '420222', '0714', 5);
INSERT INTO `youbang_sys_area` VALUES (2011, '大冶', 291, 'd', 'dy', 'daye', '', '市', '420281', '0714', 6);
INSERT INTO `youbang_sys_area` VALUES (2012, '茅箭', 292, 'm', 'mj', 'maojian', '', '区', '420302', '0719', 1);
INSERT INTO `youbang_sys_area` VALUES (2013, '张湾', 292, 'z', 'zw', 'zhangwan', '', '区', '420303', '0719', 2);
INSERT INTO `youbang_sys_area` VALUES (2014, '郧阳', 292, 'y', 'yy', 'yunyang', '', '区', '420304', '0719', 3);
INSERT INTO `youbang_sys_area` VALUES (2015, '郧西', 292, 'y', 'yx', 'yunxi', '', '县', '420322', '0719', 4);
INSERT INTO `youbang_sys_area` VALUES (2016, '竹山', 292, 'z', 'zs', 'zhushan', '', '县', '420323', '0719', 5);
INSERT INTO `youbang_sys_area` VALUES (2017, '竹溪', 292, 'z', 'zx', 'zhuxi', '', '县', '420324', '0719', 6);
INSERT INTO `youbang_sys_area` VALUES (2018, '房县', 292, 'f', 'fx', 'fangxian', '', '', '420325', '0719', 7);
INSERT INTO `youbang_sys_area` VALUES (2019, '丹江口', 292, 'd', 'djk', 'danjiangkou', '', '市', '420381', '0719', 8);
INSERT INTO `youbang_sys_area` VALUES (2020, '西陵', 293, 'x', 'xl', 'xiling', '', '区', '420502', '0717', 1);
INSERT INTO `youbang_sys_area` VALUES (2021, '伍家岗', 293, 'w', 'wjg', 'wujiagang', '', '区', '420503', '0717', 2);
INSERT INTO `youbang_sys_area` VALUES (2022, '点军', 293, 'd', 'dj', 'dianjun', '', '区', '420504', '0717', 3);
INSERT INTO `youbang_sys_area` VALUES (2023, '虢亭', 293, 'g', 'gt', 'guoting', '', '区', '420505', '0717', 4);
INSERT INTO `youbang_sys_area` VALUES (2024, '夷陵', 293, 'y', 'yl', 'yiling', '', '区', '420506', '0717', 5);
INSERT INTO `youbang_sys_area` VALUES (2025, '远安', 293, 'y', 'ya', 'yuanan', '', '县', '420525', '0717', 6);
INSERT INTO `youbang_sys_area` VALUES (2026, '兴山', 293, 'x', 'xs', 'xingshan', '', '县', '420526', '0717', 7);
INSERT INTO `youbang_sys_area` VALUES (2027, '秭归', 293, 'z', 'zg', 'zigui', '', '县', '420527', '0717', 8);
INSERT INTO `youbang_sys_area` VALUES (2028, '长阳', 293, 'c', 'cy', 'changyang', '土家族', '自治县', '420528', '0717', 9);
INSERT INTO `youbang_sys_area` VALUES (2029, '五峰', 293, 'w', 'wf', 'wufeng', '土家族', '自治县', '420529', '0717', 10);
INSERT INTO `youbang_sys_area` VALUES (2030, '宜都', 293, 'y', 'yd', 'yidu', '', '市', '420581', '0717', 11);
INSERT INTO `youbang_sys_area` VALUES (2031, '当阳', 293, 'd', 'dy', 'dangyang', '', '市', '420582', '0717', 12);
INSERT INTO `youbang_sys_area` VALUES (2032, '枝江', 293, 'z', 'zj', 'zhijiang', '', '市', '420583', '0717', 13);
INSERT INTO `youbang_sys_area` VALUES (2033, '襄城', 294, 'x', 'xc', 'xiangcheng', '', '区', '420602', '0710', 1);
INSERT INTO `youbang_sys_area` VALUES (2034, '樊城', 294, 'f', 'fc', 'fancheng', '', '区', '420606', '0710', 2);
INSERT INTO `youbang_sys_area` VALUES (2035, '襄州', 294, 'x', 'xz', 'xiangzhou', '', '区', '420607', '0710', 3);
INSERT INTO `youbang_sys_area` VALUES (2036, '南漳', 294, 'n', 'nz', 'nanzhang', '', '县', '420624', '0710', 4);
INSERT INTO `youbang_sys_area` VALUES (2037, '谷城', 294, 'g', 'gc', 'gucheng', '', '县', '420625', '0710', 5);
INSERT INTO `youbang_sys_area` VALUES (2038, '保康', 294, 'b', 'bk', 'baokang', '', '县', '420626', '0710', 6);
INSERT INTO `youbang_sys_area` VALUES (2039, '老河口', 294, 'l', 'lhk', 'laohekou', '', '市', '420682', '0710', 7);
INSERT INTO `youbang_sys_area` VALUES (2040, '枣阳', 294, 'z', 'zy', 'zaoyang', '', '市', '420683', '0710', 8);
INSERT INTO `youbang_sys_area` VALUES (2041, '宜城', 294, 'y', 'yc', 'yicheng', '', '市', '420684', '0710', 9);
INSERT INTO `youbang_sys_area` VALUES (2042, '粱子湖', 295, 'l', 'lzh', 'liangzihu', '', '区', '420702', '', 1);
INSERT INTO `youbang_sys_area` VALUES (2043, '华容', 295, 'h', 'hr', 'huarong', '', '区', '420703', '', 2);
INSERT INTO `youbang_sys_area` VALUES (2044, '鄂城', 295, 'e', 'ec', 'echeng', '', '区', '420704', '', 3);
INSERT INTO `youbang_sys_area` VALUES (2045, '东宝', 296, 'd', 'db', 'dongbao', '', '区', '420802', '0724', 1);
INSERT INTO `youbang_sys_area` VALUES (2046, '掇刀', 296, 'd', 'dd', 'duodao', '', '区', '420804', '0724', 2);
INSERT INTO `youbang_sys_area` VALUES (2047, '京山', 296, 'j', 'js', 'jingshan', '', '县', '420821', '0724', 3);
INSERT INTO `youbang_sys_area` VALUES (2048, '沙洋', 296, 's', 'sy', 'shayang', '', '县', '420822', '0724', 4);
INSERT INTO `youbang_sys_area` VALUES (2049, '钟祥', 296, 'z', 'zx', 'zhongxiang', '', '市', '420881', '0724', 5);
INSERT INTO `youbang_sys_area` VALUES (2050, '孝南', 297, 'x', 'xn', 'xiaonan', '', '区', '420902', '0712', 1);
INSERT INTO `youbang_sys_area` VALUES (2051, '大悟', 297, 'd', 'dw', 'dawu', '', '县', '420922', '0712', 2);
INSERT INTO `youbang_sys_area` VALUES (2052, '云梦', 297, 'y', 'ym', 'yunmeng', '', '县', '420923', '0712', 3);
INSERT INTO `youbang_sys_area` VALUES (2053, '应城', 297, 'y', 'yc', 'yingcheng', '', '市', '420981', '0712', 4);
INSERT INTO `youbang_sys_area` VALUES (2054, '安陆', 297, 'a', 'al', 'anlu', '', '市', '420982', '0712', 5);
INSERT INTO `youbang_sys_area` VALUES (2055, '汉川', 297, 'h', 'hc', 'hanchuan', '', '市', '420984', '0712', 6);
INSERT INTO `youbang_sys_area` VALUES (2056, '沙市', 298, 's', 'ss', 'shashi', '', '区', '421002', '0716', 1);
INSERT INTO `youbang_sys_area` VALUES (2057, '荆州', 298, 'j', 'jz', 'jingzhou', '', '区', '421003', '0716', 2);
INSERT INTO `youbang_sys_area` VALUES (2058, '公安', 298, 'g', 'ga', 'gongan', '', '县', '421022', '0716', 3);
INSERT INTO `youbang_sys_area` VALUES (2059, '监利', 298, 'j', 'jl', 'jianli', '', '县', '421023', '0716', 4);
INSERT INTO `youbang_sys_area` VALUES (2060, '江陵', 298, 'j', 'jl', 'jiangling', '', '县', '421024', '0716', 5);
INSERT INTO `youbang_sys_area` VALUES (2061, '石首', 298, 's', 'ss', 'shishou', '', '市', '421081', '0716', 6);
INSERT INTO `youbang_sys_area` VALUES (2062, '洪湖', 298, 'h', 'hh', 'honghu', '', '市', '421083', '0716', 7);
INSERT INTO `youbang_sys_area` VALUES (2063, '松滋', 298, 's', 'sz', 'songzi', '', '市', '421087', '0716', 8);
INSERT INTO `youbang_sys_area` VALUES (2064, '黄州', 299, 'h', 'hz', 'huangzhou', '', '区', '421102', '0713', 1);
INSERT INTO `youbang_sys_area` VALUES (2065, '团风', 299, 't', 'tf', 'tuanfeng', '', '县', '421121', '0713', 2);
INSERT INTO `youbang_sys_area` VALUES (2066, '红安', 299, 'h', 'ha', 'hongan', '', '县', '421122', '0713', 3);
INSERT INTO `youbang_sys_area` VALUES (2067, '罗田', 299, 'l', 'lt', 'luotian', '', '县', '421123', '0713', 4);
INSERT INTO `youbang_sys_area` VALUES (2068, '英山', 299, 'y', 'ys', 'yingshan', '', '县', '421124', '0713', 5);
INSERT INTO `youbang_sys_area` VALUES (2069, '浠水', 299, 'x', 'xs', 'xishui', '', '县', '421125', '0713', 6);
INSERT INTO `youbang_sys_area` VALUES (2070, '蕲春', 299, 'q', 'qc', 'qichun', '', '县', '421126', '0713', 7);
INSERT INTO `youbang_sys_area` VALUES (2071, '黄梅', 299, 'h', 'hm', 'huangmei', '', '县', '421127', '0713', 8);
INSERT INTO `youbang_sys_area` VALUES (2072, '麻城', 299, 'm', 'mc', 'macheng', '', '市', '421181', '0713', 9);
INSERT INTO `youbang_sys_area` VALUES (2073, '武穴', 299, 'w', 'wx', 'wuxue', '', '市', '421182', '0713', 10);
INSERT INTO `youbang_sys_area` VALUES (2074, '咸安', 300, 'x', 'xa', 'xianan', '', '区', '421202', '0715', 1);
INSERT INTO `youbang_sys_area` VALUES (2075, '嘉鱼', 300, 'j', 'jy', 'jiayu', '', '县', '421221', '0715', 2);
INSERT INTO `youbang_sys_area` VALUES (2076, '通城', 300, 't', 'tc', 'tongcheng', '', '县', '421222', '0715', 3);
INSERT INTO `youbang_sys_area` VALUES (2077, '崇阳', 300, 'c', 'cy', 'chongyang', '', '县', '421223', '0715', 4);
INSERT INTO `youbang_sys_area` VALUES (2078, '通山', 300, 't', 'ts', 'tongshan', '', '县', '421224', '0715', 5);
INSERT INTO `youbang_sys_area` VALUES (2079, '赤壁', 300, 'c', 'cb', 'chibi', '', '市', '421281', '0715', 6);
INSERT INTO `youbang_sys_area` VALUES (2080, '曾都', 301, 'c', 'cd', 'cengdu', '', '区', '421303', '0722', 1);
INSERT INTO `youbang_sys_area` VALUES (2081, '随县', 301, 's', 'sx', 'suixian', '', '', '421321', '0722', 2);
INSERT INTO `youbang_sys_area` VALUES (2082, '广水', 301, 'g', 'gs', 'guangshui', '', '市', '421381', '0722', 3);
INSERT INTO `youbang_sys_area` VALUES (2083, '恩施', 302, 'e', 'es', 'enshi', '', '市', '422801', '0718', 1);
INSERT INTO `youbang_sys_area` VALUES (2084, '利川', 302, 'l', 'lc', 'lichuan', '', '市', '422802', '0718', 2);
INSERT INTO `youbang_sys_area` VALUES (2085, '建始', 302, 'j', 'js', 'jianshi', '', '县', '422822', '0718', 3);
INSERT INTO `youbang_sys_area` VALUES (2086, '巴东', 302, 'b', 'bd', 'badong', '', '县', '422823', '0718', 4);
INSERT INTO `youbang_sys_area` VALUES (2087, '宣恩', 302, 'x', 'xe', 'xuanen', '', '县', '422825', '0718', 5);
INSERT INTO `youbang_sys_area` VALUES (2088, '咸丰', 302, 'x', 'xf', 'xianfeng', '', '县', '422826', '0718', 6);
INSERT INTO `youbang_sys_area` VALUES (2089, '来凤', 302, 'l', 'lf', 'laifeng', '', '县', '422827', '0718', 7);
INSERT INTO `youbang_sys_area` VALUES (2090, '鹤峰', 302, 'h', 'hf', 'hefeng', '', '县', '422828', '0718', 8);
INSERT INTO `youbang_sys_area` VALUES (2091, '芙蓉', 307, 'f', 'fr', 'furong', '', '区', '430102', '0731', 1);
INSERT INTO `youbang_sys_area` VALUES (2092, '天心', 307, 't', 'tx', 'tianxin', '', '区', '430103', '0731', 2);
INSERT INTO `youbang_sys_area` VALUES (2093, '岳麓', 307, 'y', 'yl', 'yuelu', '', '区', '430104', '0731', 3);
INSERT INTO `youbang_sys_area` VALUES (2094, '开福', 307, 'k', 'kf', 'kaifu', '', '区', '430105', '0731', 4);
INSERT INTO `youbang_sys_area` VALUES (2095, '雨花', 307, 'y', 'yh', 'yuhua', '', '区', '430111', '0731', 5);
INSERT INTO `youbang_sys_area` VALUES (2096, '望城', 307, 'w', 'wc', 'wangcheng', '', '区', '430112', '0731', 6);
INSERT INTO `youbang_sys_area` VALUES (2097, '长沙', 307, 'c', 'cs', 'changsha', '', '县', '430121', '0731', 7);
INSERT INTO `youbang_sys_area` VALUES (2098, '宁乡', 307, 'n', 'nx', 'ningxiang', '', '县', '430124', '0731', 8);
INSERT INTO `youbang_sys_area` VALUES (2099, '浏阳', 307, 'l', 'ly', 'liuyang', '', '市', '430181', '0731', 9);
INSERT INTO `youbang_sys_area` VALUES (2100, '荷塘', 308, 'h', 'ht', 'hetang', '', '区', '430202', '0731', 1);
INSERT INTO `youbang_sys_area` VALUES (2101, '芦淞', 308, 'l', 'ls', 'lusong', '', '区', '430203', '0731', 2);
INSERT INTO `youbang_sys_area` VALUES (2102, '石峰', 308, 's', 'sf', 'shifeng', '', '区', '430204', '0731', 3);
INSERT INTO `youbang_sys_area` VALUES (2103, '天元', 308, 't', 'ty', 'tianyuan', '', '区', '430211', '0731', 4);
INSERT INTO `youbang_sys_area` VALUES (2104, '株洲', 308, 'z', 'zz', 'zhuzhou', '', '县', '430221', '0731', 5);
INSERT INTO `youbang_sys_area` VALUES (2105, '攸县', 308, 'y', 'yx', 'youxian', '', '', '430223', '0731', 6);
INSERT INTO `youbang_sys_area` VALUES (2106, '茶陵', 308, 'c', 'cl', 'chaling', '', '县', '430224', '0731', 7);
INSERT INTO `youbang_sys_area` VALUES (2107, '炎陵', 308, 'y', 'yl', 'yanling', '', '县', '430225', '0731', 8);
INSERT INTO `youbang_sys_area` VALUES (2108, '醴陵', 308, 'l', 'll', 'liling', '', '市', '430281', '0731', 9);
INSERT INTO `youbang_sys_area` VALUES (2109, '雨湖', 309, 'y', 'yh', 'yuhu', '', '区', '430302', '0731', 1);
INSERT INTO `youbang_sys_area` VALUES (2110, '岳塘', 309, 'y', 'yt', 'yuetang', '', '区', '430304', '0731', 2);
INSERT INTO `youbang_sys_area` VALUES (2111, '湘潭', 309, 'x', 'xt', 'xiangtan', '', '县', '430321', '0731', 3);
INSERT INTO `youbang_sys_area` VALUES (2112, '湘乡', 309, 'x', 'xx', 'xiangxiang', '', '市', '430381', '0731', 4);
INSERT INTO `youbang_sys_area` VALUES (2113, '韶山', 309, 's', 'ss', 'shaoshan', '', '市', '430382', '0731', 5);
INSERT INTO `youbang_sys_area` VALUES (2114, '珠晖', 310, 'z', 'zh', 'zhuhui', '', '区', '430405', '0734', 1);
INSERT INTO `youbang_sys_area` VALUES (2115, '雁峰', 310, 'y', 'yf', 'yanfeng', '', '区', '430406', '0734', 2);
INSERT INTO `youbang_sys_area` VALUES (2116, '石鼓', 310, 's', 'sg', 'shigu', '', '区', '430407', '0734', 3);
INSERT INTO `youbang_sys_area` VALUES (2117, '蒸湘', 310, 'z', 'zx', 'zhengxiang', '', '区', '430408', '0734', 4);
INSERT INTO `youbang_sys_area` VALUES (2118, '南岳', 310, 'n', 'ny', 'nanyue', '', '区', '430412', '0734', 5);
INSERT INTO `youbang_sys_area` VALUES (2119, '衡阳', 310, 'h', 'hy', 'hengyang', '', '县', '430421', '0734', 6);
INSERT INTO `youbang_sys_area` VALUES (2120, '衡南', 310, 'h', 'hn', 'hengnan', '', '县', '430422', '0734', 7);
INSERT INTO `youbang_sys_area` VALUES (2121, '衡山', 310, 'h', 'hs', 'hengshan', '', '县', '430423', '0734', 8);
INSERT INTO `youbang_sys_area` VALUES (2122, '衡东', 310, 'h', 'hd', 'hengdong', '', '县', '430424', '0734', 9);
INSERT INTO `youbang_sys_area` VALUES (2123, '祁东', 310, 'q', 'qd', 'qidong', '', '县', '430426', '0734', 10);
INSERT INTO `youbang_sys_area` VALUES (2124, '耒阳', 310, 'l', 'ly', 'leiyang', '', '市', '430481', '0734', 11);
INSERT INTO `youbang_sys_area` VALUES (2125, '常宁', 310, 'c', 'cn', 'changning', '', '市', '430482', '0734', 12);
INSERT INTO `youbang_sys_area` VALUES (2126, '双清', 311, 's', 'sq', 'shuangqing', '', '区', '430502', '0739', 1);
INSERT INTO `youbang_sys_area` VALUES (2127, '大祥', 311, 'd', 'dx', 'daxiang', '', '区', '430503', '0739', 2);
INSERT INTO `youbang_sys_area` VALUES (2128, '北塔', 311, 'b', 'bt', 'beita', '', '区', '430511', '0739', 3);
INSERT INTO `youbang_sys_area` VALUES (2129, '邵东', 311, 's', 'sd', 'shaodong', '', '县', '430521', '0739', 4);
INSERT INTO `youbang_sys_area` VALUES (2130, '新邵', 311, 'x', 'xs', 'xinshao', '', '县', '430522', '0739', 5);
INSERT INTO `youbang_sys_area` VALUES (2131, '邵阳', 311, 's', 'sy', 'shaoyang', '', '县', '430523', '0739', 6);
INSERT INTO `youbang_sys_area` VALUES (2132, '隆回', 311, 'l', 'lh', 'longhui', '', '县', '430524', '0739', 7);
INSERT INTO `youbang_sys_area` VALUES (2133, '洞口', 311, 'd', 'dk', 'dongkou', '', '县', '430525', '0739', 8);
INSERT INTO `youbang_sys_area` VALUES (2134, '绥宁', 311, 's', 'sn', 'suining', '', '县', '430527', '0739', 9);
INSERT INTO `youbang_sys_area` VALUES (2135, '新宁', 311, 'x', 'xn', 'xinning', '', '县', '430528', '0739', 10);
INSERT INTO `youbang_sys_area` VALUES (2136, '城步', 311, 'c', 'cb', 'chengbu', '苗族', '自治县', '430529', '0739', 11);
INSERT INTO `youbang_sys_area` VALUES (2137, '武冈', 311, 'w', 'wg', 'wugang', '', '市', '430581', '0739', 12);
INSERT INTO `youbang_sys_area` VALUES (2138, '岳阳楼', 312, 'y', 'yyl', 'yueyanglou', '', '区', '430602', '0730', 1);
INSERT INTO `youbang_sys_area` VALUES (2139, '云溪', 312, 'y', 'yx', 'yunxi', '', '区', '430603', '0730', 2);
INSERT INTO `youbang_sys_area` VALUES (2140, '君山', 312, 'j', 'js', 'junshan', '', '区', '430611', '0730', 3);
INSERT INTO `youbang_sys_area` VALUES (2141, '岳阳', 312, 'y', 'yy', 'yueyang', '', '县', '430621', '0730', 4);
INSERT INTO `youbang_sys_area` VALUES (2142, '华容', 312, 'h', 'hr', 'huarong', '', '县', '430623', '0730', 5);
INSERT INTO `youbang_sys_area` VALUES (2143, '湘阴', 312, 'x', 'xy', 'xiangyin', '', '县', '430624', '0730', 6);
INSERT INTO `youbang_sys_area` VALUES (2144, '平江', 312, 'p', 'pj', 'pingjiang', '', '县', '430626', '0730', 7);
INSERT INTO `youbang_sys_area` VALUES (2145, '汨罗', 312, 'm', 'ml', 'miluo', '', '市', '430681', '0730', 8);
INSERT INTO `youbang_sys_area` VALUES (2146, '临湘', 312, 'l', 'lx', 'linxiang', '', '市', '430682', '0730', 9);
INSERT INTO `youbang_sys_area` VALUES (2147, '武陵', 313, 'w', 'wl', 'wuling', '', '区', '430702', '0736', 1);
INSERT INTO `youbang_sys_area` VALUES (2148, '鼎城', 313, 'd', 'dc', 'dingcheng', '', '区', '430703', '0736', 2);
INSERT INTO `youbang_sys_area` VALUES (2149, '安乡', 313, 'a', 'ax', 'anxiang', '', '县', '430721', '0736', 3);
INSERT INTO `youbang_sys_area` VALUES (2150, '汉寿', 313, 'h', 'hs', 'hanshou', '', '县', '430722', '0736', 4);
INSERT INTO `youbang_sys_area` VALUES (2151, '澧县', 313, 'l', 'lx', 'lixian', '', '', '430723', '0736', 5);
INSERT INTO `youbang_sys_area` VALUES (2152, '临澧', 313, 'l', 'll', 'linli', '', '县', '430724', '0736', 6);
INSERT INTO `youbang_sys_area` VALUES (2153, '桃源', 313, 't', 'ty', 'taoyuan', '', '县', '430725', '0736', 7);
INSERT INTO `youbang_sys_area` VALUES (2154, '石门', 313, 's', 'sm', 'shimen', '', '县', '430726', '0736', 8);
INSERT INTO `youbang_sys_area` VALUES (2155, '津市', 313, 'j', 'js', 'jinshi', '', '市', '430781', '0736', 9);
INSERT INTO `youbang_sys_area` VALUES (2156, '永定', 314, 'y', 'yd', 'yongding', '', '区', '430802', '0744', 1);
INSERT INTO `youbang_sys_area` VALUES (2157, '武陵源', 314, 'w', 'wly', 'wulingyuan', '', '区', '430811', '0744', 2);
INSERT INTO `youbang_sys_area` VALUES (2158, '慈利', 314, 'c', 'cl', 'cili', '', '县', '430821', '0744', 3);
INSERT INTO `youbang_sys_area` VALUES (2159, '桑植', 314, 's', 'sz', 'sangzhi', '', '县', '430822', '0744', 4);
INSERT INTO `youbang_sys_area` VALUES (2160, '资阳', 315, 'z', 'zy', 'ziyang', '', '区', '430902', '0737', 1);
INSERT INTO `youbang_sys_area` VALUES (2161, '赫山', 315, 'h', 'hs', 'heshan', '', '区', '430903', '0737', 2);
INSERT INTO `youbang_sys_area` VALUES (2162, '南县', 315, 'n', 'nx', 'nanxian', '', '', '430921', '0737', 3);
INSERT INTO `youbang_sys_area` VALUES (2163, '桃江', 315, 't', 'tj', 'taojiang', '', '县', '430922', '0737', 4);
INSERT INTO `youbang_sys_area` VALUES (2164, '安化', 315, 'a', 'ah', 'anhua', '', '县', '430923', '0737', 5);
INSERT INTO `youbang_sys_area` VALUES (2165, '沅江', 315, 'y', 'yj', 'yuanjiang', '', '市', '430981', '0737', 6);
INSERT INTO `youbang_sys_area` VALUES (2166, '北湖', 316, 'b', 'bh', 'beihu', '', '区', '431002', '0735', 1);
INSERT INTO `youbang_sys_area` VALUES (2167, '苏仙', 316, 's', 'sx', 'suxian', '', '区', '431003', '0735', 2);
INSERT INTO `youbang_sys_area` VALUES (2168, '桂阳', 316, 'g', 'gy', 'guiyang', '', '县', '431021', '0735', 3);
INSERT INTO `youbang_sys_area` VALUES (2169, '宜章', 316, 'y', 'yz', 'yizhang', '', '县', '431022', '0735', 4);
INSERT INTO `youbang_sys_area` VALUES (2170, '永兴', 316, 'y', 'yx', 'yongxing', '', '县', '431023', '0735', 5);
INSERT INTO `youbang_sys_area` VALUES (2171, '嘉禾', 316, 'j', 'jh', 'jiahe', '', '县', '431024', '0735', 6);
INSERT INTO `youbang_sys_area` VALUES (2172, '临武', 316, 'l', 'lw', 'linwu', '', '县', '431025', '0735', 7);
INSERT INTO `youbang_sys_area` VALUES (2173, '汝城', 316, 'r', 'rc', 'rucheng', '', '县', '431026', '0735', 8);
INSERT INTO `youbang_sys_area` VALUES (2174, '桂东', 316, 'g', 'gd', 'guidong', '', '县', '431027', '0735', 9);
INSERT INTO `youbang_sys_area` VALUES (2175, '安仁', 316, 'a', 'ar', 'anren', '', '县', '431028', '0735', 10);
INSERT INTO `youbang_sys_area` VALUES (2176, '资兴', 316, 'z', 'zx', 'zixing', '', '市', '431081', '0735', 11);
INSERT INTO `youbang_sys_area` VALUES (2177, '零陵', 317, 'l', 'll', 'lingling', '', '区', '431102', '0746', 1);
INSERT INTO `youbang_sys_area` VALUES (2178, '冷水滩', 317, 'l', 'lst', 'lengshuitan', '', '区', '431103', '0746', 2);
INSERT INTO `youbang_sys_area` VALUES (2179, '祁阳', 317, 'q', 'qy', 'qiyang', '', '县', '431121', '0746', 3);
INSERT INTO `youbang_sys_area` VALUES (2180, '东安', 317, 'd', 'da', 'dongan', '', '县', '431122', '0746', 4);
INSERT INTO `youbang_sys_area` VALUES (2181, '双牌', 317, 's', 'sp', 'shuangpai', '', '县', '431123', '0746', 5);
INSERT INTO `youbang_sys_area` VALUES (2182, '道县', 317, 'd', 'dx', 'daoxian', '', '', '431124', '0746', 6);
INSERT INTO `youbang_sys_area` VALUES (2183, '江永', 317, 'j', 'jy', 'jiangyong', '', '县', '431125', '0746', 7);
INSERT INTO `youbang_sys_area` VALUES (2184, '宁远', 317, 'n', 'ny', 'ningyuan', '', '县', '431126', '0746', 8);
INSERT INTO `youbang_sys_area` VALUES (2185, '蓝山', 317, 'l', 'ls', 'lanshan', '', '县', '431127', '0746', 9);
INSERT INTO `youbang_sys_area` VALUES (2186, '新田', 317, 'x', 'xt', 'xintian', '', '县', '431128', '0746', 10);
INSERT INTO `youbang_sys_area` VALUES (2187, '江华', 317, 'j', 'jh', 'jianghua', '瑶族', '自治县', '431129', '0746', 11);
INSERT INTO `youbang_sys_area` VALUES (2188, '鹤城', 318, 'h', 'hc', 'hecheng', '', '区', '431202', '0745', 1);
INSERT INTO `youbang_sys_area` VALUES (2189, '中方', 318, 'z', 'zf', 'zhongfang', '', '县', '431221', '0745', 2);
INSERT INTO `youbang_sys_area` VALUES (2190, '沅陵', 318, 'y', 'yl', 'yuanling', '', '县', '431222', '0745', 3);
INSERT INTO `youbang_sys_area` VALUES (2191, '辰溪', 318, 'c', 'cx', 'chenxi', '', '县', '431223', '0745', 4);
INSERT INTO `youbang_sys_area` VALUES (2192, '溆浦', 318, 'x', 'xp', 'xupu', '', '县', '431224', '0745', 5);
INSERT INTO `youbang_sys_area` VALUES (2193, '会同', 318, 'h', 'ht', 'huitong', '', '县', '431225', '0745', 6);
INSERT INTO `youbang_sys_area` VALUES (2194, '麻阳', 318, 'm', 'my', 'mayang', '苗族', '自治县', '431226', '0745', 7);
INSERT INTO `youbang_sys_area` VALUES (2195, '新晃', 318, 'x', 'xh', 'xinhuang', '侗族', '自治县', '431227', '0745', 8);
INSERT INTO `youbang_sys_area` VALUES (2196, '芷江', 318, 'z', 'zj', 'zhijiang', '侗族', '自治县', '431228', '0745', 9);
INSERT INTO `youbang_sys_area` VALUES (2197, '靖州', 318, 'j', 'jz', 'jingzhou', '苗族侗族', '自治县', '431229', '0745', 10);
INSERT INTO `youbang_sys_area` VALUES (2198, '通道', 318, 't', 'td', 'tongdao', '侗族', '自治县', '431230', '0745', 11);
INSERT INTO `youbang_sys_area` VALUES (2199, '洪江', 318, 'h', 'hj', 'hongjiang', '', '市', '431281', '0745', 12);
INSERT INTO `youbang_sys_area` VALUES (2200, '娄星', 319, 'l', 'lx', 'louxing', '', '区', '431302', '0738', 1);
INSERT INTO `youbang_sys_area` VALUES (2201, '双峰', 319, 's', 'sf', 'shuangfeng', '', '县', '431321', '0738', 2);
INSERT INTO `youbang_sys_area` VALUES (2202, '新化', 319, 'x', 'xh', 'xinhua', '', '县', '431322', '0738', 3);
INSERT INTO `youbang_sys_area` VALUES (2203, '冷水江', 319, 'l', 'lsj', 'lengshuijiang', '', '市', '431381', '0738', 4);
INSERT INTO `youbang_sys_area` VALUES (2204, '涟源', 319, 'l', 'ly', 'lianyuan', '', '市', '431382', '0738', 5);
INSERT INTO `youbang_sys_area` VALUES (2205, '吉首', 320, 'j', 'js', 'jishou', '', '市', '433101', '0743', 1);
INSERT INTO `youbang_sys_area` VALUES (2206, '泸溪', 320, 'l', 'lx', 'luxi', '', '县', '433122', '0743', 2);
INSERT INTO `youbang_sys_area` VALUES (2207, '凤凰', 320, 'f', 'fh', 'fenghuang', '', '县', '433123', '0743', 3);
INSERT INTO `youbang_sys_area` VALUES (2208, '花垣', 320, 'h', 'hy', 'huayuan', '', '县', '433124', '0743', 4);
INSERT INTO `youbang_sys_area` VALUES (2209, '保靖', 320, 'b', 'bj', 'baojing', '', '县', '433125', '0743', 5);
INSERT INTO `youbang_sys_area` VALUES (2210, '古丈', 320, 'g', 'gz', 'guzhang', '', '县', '433126', '0743', 6);
INSERT INTO `youbang_sys_area` VALUES (2211, '永顺', 320, 'y', 'ys', 'yongshun', '', '县', '433127', '0743', 7);
INSERT INTO `youbang_sys_area` VALUES (2212, '龙山', 320, 'l', 'ls', 'longshan', '', '县', '433130', '0743', 8);
INSERT INTO `youbang_sys_area` VALUES (2213, '荔湾', 321, 'l', 'lw', 'liwan', '', '区', '440103', '020', 1);
INSERT INTO `youbang_sys_area` VALUES (2214, '越秀', 321, 'y', 'yx', 'yuexiu', '', '区', '440104', '020', 2);
INSERT INTO `youbang_sys_area` VALUES (2215, '海珠', 321, 'h', 'hz', 'haizhu', '', '区', '440105', '020', 3);
INSERT INTO `youbang_sys_area` VALUES (2216, '天河', 321, 't', 'th', 'tianhe', '', '区', '440106', '020', 4);
INSERT INTO `youbang_sys_area` VALUES (2217, '白云', 321, 'b', 'by', 'baiyun', '', '区', '440111', '020', 5);
INSERT INTO `youbang_sys_area` VALUES (2218, '黄埔', 321, 'h', 'hp', 'huangpu', '', '区', '440112', '020', 6);
INSERT INTO `youbang_sys_area` VALUES (2219, '番禺', 321, 'f', 'fy', 'fanyu', '', '区', '440113', '020', 7);
INSERT INTO `youbang_sys_area` VALUES (2220, '花都', 321, 'h', 'hd', 'huadu', '', '区', '440114', '020', 8);
INSERT INTO `youbang_sys_area` VALUES (2221, '南沙', 321, 'n', 'ns', 'nansha', '', '区', '440115', '020', 9);
INSERT INTO `youbang_sys_area` VALUES (2223, '增城', 321, 'z', 'zc', 'zengcheng', '', '区', '440118', '020', 12);
INSERT INTO `youbang_sys_area` VALUES (2224, '从化', 321, 'c', 'ch', 'conghua', '', '区', '440117', '020', 11);
INSERT INTO `youbang_sys_area` VALUES (2225, '武江', 322, 'w', 'wj', 'wujiang', '', '区', '440203', '0751', 1);
INSERT INTO `youbang_sys_area` VALUES (2226, '浈江', 322, 'z', 'zj', 'zhenjiang', '', '区', '440204', '0751', 2);
INSERT INTO `youbang_sys_area` VALUES (2227, '曲江', 322, 'q', 'qj', 'qujiang', '', '区', '440205', '0751', 3);
INSERT INTO `youbang_sys_area` VALUES (2228, '始兴', 322, 's', 'sx', 'shixing', '', '县', '440222', '0751', 4);
INSERT INTO `youbang_sys_area` VALUES (2229, '仁化', 322, 'r', 'rh', 'renhua', '', '县', '440224', '0751', 5);
INSERT INTO `youbang_sys_area` VALUES (2230, '翁源', 322, 'w', 'wy', 'wengyuan', '', '县', '440229', '0751', 6);
INSERT INTO `youbang_sys_area` VALUES (2231, '乳源', 322, 'r', 'ry', 'ruyuan', '瑶族', '自治县', '440232', '0751', 7);
INSERT INTO `youbang_sys_area` VALUES (2232, '新丰', 322, 'x', 'xf', 'xinfeng', '', '县', '440233', '0751', 8);
INSERT INTO `youbang_sys_area` VALUES (2233, '乐昌', 322, 'l', 'lc', 'lechang', '', '市', '440281', '0751', 9);
INSERT INTO `youbang_sys_area` VALUES (2234, '南雄', 322, 'n', 'nx', 'nanxiong', '', '市', '440282', '0751', 10);
INSERT INTO `youbang_sys_area` VALUES (2235, '罗湖', 323, 'l', 'lh', 'luohu', '', '区', '440303', '0755', 1);
INSERT INTO `youbang_sys_area` VALUES (2236, '福田', 323, 'f', 'ft', 'futian', '', '区', '440304', '0755', 2);
INSERT INTO `youbang_sys_area` VALUES (2237, '南山', 323, 'n', 'ns', 'nanshan', '', '区', '440305', '0755', 3);
INSERT INTO `youbang_sys_area` VALUES (2238, '宝安', 323, 'b', 'ba', 'baoan', '', '区', '440306', '0755', 4);
INSERT INTO `youbang_sys_area` VALUES (2239, '龙岗', 323, 'l', 'lg', 'longgang', '', '区', '440307', '0755', 5);
INSERT INTO `youbang_sys_area` VALUES (2240, '盐田', 323, 'y', 'yt', 'yantian', '', '区', '440308', '0755', 6);
INSERT INTO `youbang_sys_area` VALUES (2241, '香洲', 324, 'x', 'xz', 'xiangzhou', '', '区', '440402', '0756', 1);
INSERT INTO `youbang_sys_area` VALUES (2242, '斗门', 324, 'd', 'dm', 'doumen', '', '区', '440403', '0756', 2);
INSERT INTO `youbang_sys_area` VALUES (2243, '金湾', 324, 'j', 'jw', 'jinwan', '', '区', '440404', '0756', 3);
INSERT INTO `youbang_sys_area` VALUES (2244, '龙湖', 325, 'l', 'lh', 'longhu', '', '区', '440507', '0754', 1);
INSERT INTO `youbang_sys_area` VALUES (2245, '金平', 325, 'j', 'jp', 'jinping', '', '区', '440511', '0754', 2);
INSERT INTO `youbang_sys_area` VALUES (2246, '濠江', 325, 'h', 'hj', 'haojiang', '', '区', '440512', '0754', 3);
INSERT INTO `youbang_sys_area` VALUES (2247, '潮阳', 325, 'c', 'cy', 'chaoyang', '', '区', '440513', '0754', 4);
INSERT INTO `youbang_sys_area` VALUES (2248, '潮南', 325, 'c', 'cn', 'chaonan', '', '区', '440514', '0754', 5);
INSERT INTO `youbang_sys_area` VALUES (2249, '澄海', 325, 'c', 'ch', 'chenghai', '', '区', '440515', '0754', 6);
INSERT INTO `youbang_sys_area` VALUES (2250, '南澳', 325, 'n', 'na', 'nanao', '', '县', '440523', '0754', 7);
INSERT INTO `youbang_sys_area` VALUES (2251, '禅城', 326, 's', 'sc', 'shancheng', '', '区', '440604', '0757', 1);
INSERT INTO `youbang_sys_area` VALUES (2252, '南海', 326, 'n', 'nh', 'nanhai', '', '区', '440605', '0757', 2);
INSERT INTO `youbang_sys_area` VALUES (2253, '顺德', 326, 's', 'sd', 'shunde', '', '区', '440606', '0757', 3);
INSERT INTO `youbang_sys_area` VALUES (2254, '三水', 326, 's', 'ss', 'sanshui', '', '区', '440607', '0757', 4);
INSERT INTO `youbang_sys_area` VALUES (2255, '高明', 326, 'g', 'gm', 'gaoming', '', '区', '440608', '0757', 5);
INSERT INTO `youbang_sys_area` VALUES (2256, '蓬江', 327, 'p', 'pj', 'pengjiang', '', '区', '440703', '0750', 1);
INSERT INTO `youbang_sys_area` VALUES (2257, '江海', 327, 'j', 'jh', 'jianghai', '', '区', '440704', '0750', 2);
INSERT INTO `youbang_sys_area` VALUES (2258, '新会', 327, 'x', 'xh', 'xinhui', '', '区', '440705', '0750', 3);
INSERT INTO `youbang_sys_area` VALUES (2259, '台山', 327, 't', 'ts', 'taishan', '', '市', '440781', '0750', 4);
INSERT INTO `youbang_sys_area` VALUES (2260, '开平', 327, 'k', 'kp', 'kaiping', '', '市', '440783', '0750', 5);
INSERT INTO `youbang_sys_area` VALUES (2261, '鹤山', 327, 'h', 'hs', 'heshan', '', '市', '440784', '0750', 6);
INSERT INTO `youbang_sys_area` VALUES (2262, '恩平', 327, 'e', 'ep', 'enping', '', '市', '440785', '0750', 7);
INSERT INTO `youbang_sys_area` VALUES (2263, '赤坎', 328, 'c', 'ck', 'chikan', '', '区', '440802', '0759', 1);
INSERT INTO `youbang_sys_area` VALUES (2264, '霞山', 328, 'x', 'xs', 'xiashan', '', '区', '440803', '0759', 2);
INSERT INTO `youbang_sys_area` VALUES (2265, '坡头', 328, 'p', 'pt', 'potou', '', '区', '440804', '0759', 3);
INSERT INTO `youbang_sys_area` VALUES (2266, '麻章', 328, 'm', 'mz', 'mazhang', '', '区', '440811', '0759', 4);
INSERT INTO `youbang_sys_area` VALUES (2267, '遂溪', 328, 's', 'sx', 'suixi', '', '县', '440823', '0759', 5);
INSERT INTO `youbang_sys_area` VALUES (2268, '徐闻', 328, 'x', 'xw', 'xuwen', '', '县', '440825', '0759', 6);
INSERT INTO `youbang_sys_area` VALUES (2269, '廉江', 328, 'l', 'lj', 'lianjiang', '', '市', '440881', '0759', 7);
INSERT INTO `youbang_sys_area` VALUES (2270, '雷州', 328, 'l', 'lz', 'leizhou', '', '市', '440882', '0759', 8);
INSERT INTO `youbang_sys_area` VALUES (2271, '吴川', 328, 'w', 'wc', 'wuchuan', '', '市', '440883', '0759', 9);
INSERT INTO `youbang_sys_area` VALUES (2272, '茂南', 329, 'm', 'mn', 'maonan', '', '区', '440902', '0668', 1);
INSERT INTO `youbang_sys_area` VALUES (2274, '电白', 329, 'd', 'db', 'dianbai', '', '区', '440904', '0668', 2);
INSERT INTO `youbang_sys_area` VALUES (2275, '高州', 329, 'g', 'gz', 'gaozhou', '', '市', '440981', '0668', 3);
INSERT INTO `youbang_sys_area` VALUES (2276, '化州', 329, 'h', 'hz', 'huazhou', '', '市', '440982', '0668', 4);
INSERT INTO `youbang_sys_area` VALUES (2277, '信宜', 329, 'x', 'xy', 'xinyi', '', '市', '440983', '0668', 5);
INSERT INTO `youbang_sys_area` VALUES (2278, '端州', 330, 'd', 'dz', 'duanzhou', '', '区', '441202', '0758', 1);
INSERT INTO `youbang_sys_area` VALUES (2279, '鼎湖', 330, 'd', 'dh', 'dinghu', '', '区', '441203', '0758', 2);
INSERT INTO `youbang_sys_area` VALUES (2280, '广宁', 330, 'g', 'gn', 'guangning', '', '县', '441223', '0758', 3);
INSERT INTO `youbang_sys_area` VALUES (2281, '怀集', 330, 'h', 'hj', 'huaiji', '', '县', '441224', '0758', 4);
INSERT INTO `youbang_sys_area` VALUES (2282, '封开', 330, 'f', 'fk', 'fengkai', '', '县', '441225', '0758', 5);
INSERT INTO `youbang_sys_area` VALUES (2283, '德庆', 330, 'd', 'dq', 'deqing', '', '县', '441226', '0758', 6);
INSERT INTO `youbang_sys_area` VALUES (2284, '高要', 330, 'g', 'gy', 'gaoyao', '', '区', '441283', '0758', 7);
INSERT INTO `youbang_sys_area` VALUES (2285, '四会', 330, 's', 'sh', 'sihui', '', '市', '441284', '0758', 8);
INSERT INTO `youbang_sys_area` VALUES (2286, '惠城', 331, 'h', 'hc', 'huicheng', '', '区', '441302', '0752', 1);
INSERT INTO `youbang_sys_area` VALUES (2287, '惠阳', 331, 'h', 'hy', 'huiyang', '', '区', '441303', '0752', 2);
INSERT INTO `youbang_sys_area` VALUES (2288, '博罗', 331, 'b', 'bl', 'boluo', '', '县', '441322', '0752', 3);
INSERT INTO `youbang_sys_area` VALUES (2289, '惠东', 331, 'h', 'hd', 'huidong', '', '县', '441323', '0752', 4);
INSERT INTO `youbang_sys_area` VALUES (2290, '龙门', 331, 'l', 'lm', 'longmen', '', '县', '441324', '0752', 5);
INSERT INTO `youbang_sys_area` VALUES (2291, '梅江', 332, 'm', 'mj', 'meijiang', '', '区', '441402', '0753', 1);
INSERT INTO `youbang_sys_area` VALUES (2292, '梅县', 332, 'm', 'mx', 'meixian', '', '区', '441403', '0753', 2);
INSERT INTO `youbang_sys_area` VALUES (2293, '大埔', 332, 'd', 'dp', 'dapu', '', '县', '441422', '0753', 3);
INSERT INTO `youbang_sys_area` VALUES (2294, '丰顺', 332, 'f', 'fs', 'fengshun', '', '县', '441423', '0753', 4);
INSERT INTO `youbang_sys_area` VALUES (2295, '五华', 332, 'w', 'wh', 'wuhua', '', '县', '441424', '0753', 5);
INSERT INTO `youbang_sys_area` VALUES (2296, '平远', 332, 'p', 'py', 'pingyuan', '', '县', '441426', '0753', 6);
INSERT INTO `youbang_sys_area` VALUES (2297, '蕉岭', 332, 'j', 'jl', 'jiaoling', '', '县', '441427', '0753', 7);
INSERT INTO `youbang_sys_area` VALUES (2298, '兴宁', 332, 'x', 'xn', 'xingning', '', '市', '441481', '0753', 8);
INSERT INTO `youbang_sys_area` VALUES (2299, '城区', 333, 'c', 'cq', 'chengqu', '', '区', '441502', '0660', 1);
INSERT INTO `youbang_sys_area` VALUES (2300, '海丰', 333, 'h', 'hf', 'haifeng', '', '县', '441521', '0660', 2);
INSERT INTO `youbang_sys_area` VALUES (2301, '陆河', 333, 'l', 'lh', 'luhe', '', '县', '441523', '0660', 3);
INSERT INTO `youbang_sys_area` VALUES (2302, '陆丰', 333, 'l', 'lf', 'lufeng', '', '市', '441581', '0660', 4);
INSERT INTO `youbang_sys_area` VALUES (2303, '源城', 334, 'y', 'yc', 'yuancheng', '', '区', '441602', '0762', 1);
INSERT INTO `youbang_sys_area` VALUES (2304, '紫金', 334, 'z', 'zj', 'zijin', '', '县', '441621', '0762', 2);
INSERT INTO `youbang_sys_area` VALUES (2305, '龙川', 334, 'l', 'lc', 'longchuan', '', '县', '441622', '0762', 3);
INSERT INTO `youbang_sys_area` VALUES (2306, '连平', 334, 'l', 'lp', 'lianping', '', '县', '441623', '0762', 4);
INSERT INTO `youbang_sys_area` VALUES (2307, '和平', 334, 'h', 'hp', 'heping', '', '县', '441624', '0762', 5);
INSERT INTO `youbang_sys_area` VALUES (2308, '东源', 334, 'd', 'dy', 'dongyuan', '', '县', '441625', '0762', 6);
INSERT INTO `youbang_sys_area` VALUES (2309, '江城', 335, 'j', 'jc', 'jiangcheng', '', '区', '441702', '0662', 1);
INSERT INTO `youbang_sys_area` VALUES (2310, '阳西', 335, 'y', 'yx', 'yangxi', '', '县', '441721', '0662', 2);
INSERT INTO `youbang_sys_area` VALUES (2311, '阳东', 335, 'y', 'yd', 'yangdong', '', '区', '441723', '0662', 3);
INSERT INTO `youbang_sys_area` VALUES (2312, '阳春', 335, 'y', 'yc', 'yangchun', '', '市', '441781', '0662', 4);
INSERT INTO `youbang_sys_area` VALUES (2313, '清城', 336, 'q', 'qc', 'qingcheng', '', '区', '441802', '0763', 1);
INSERT INTO `youbang_sys_area` VALUES (2314, '佛冈', 336, 'f', 'fg', 'fogang', '', '县', '441821', '0763', 2);
INSERT INTO `youbang_sys_area` VALUES (2315, '阳山', 336, 'y', 'ys', 'yangshan', '', '县', '441823', '0763', 3);
INSERT INTO `youbang_sys_area` VALUES (2316, '连山', 336, 'l', 'ls', 'lianshan', '壮族瑶族', '自治县', '441825', '0763', 4);
INSERT INTO `youbang_sys_area` VALUES (2317, '连南', 336, 'l', 'ln', 'liannan', '瑶族', '自治县', '441826', '0763', 5);
INSERT INTO `youbang_sys_area` VALUES (2318, '清新', 336, 'q', 'qx', 'qingxin', '', '县', '441827', '0763', 6);
INSERT INTO `youbang_sys_area` VALUES (2319, '英德', 336, 'y', 'yd', 'yingde', '', '市', '441881', '0763', 7);
INSERT INTO `youbang_sys_area` VALUES (2320, '连州', 336, 'l', 'lz', 'lianzhou', '', '市', '441882', '0763', 8);
INSERT INTO `youbang_sys_area` VALUES (2321, '湘桥', 339, 'x', 'xq', 'xiangqiao', '', '区', '445102', '0768', 1);
INSERT INTO `youbang_sys_area` VALUES (2322, '潮安', 339, 'c', 'ca', 'chaoan', '', '区', '445121', '0768', 2);
INSERT INTO `youbang_sys_area` VALUES (2323, '饶平', 339, 'r', 'rp', 'raoping', '', '县', '445122', '0768', 3);
INSERT INTO `youbang_sys_area` VALUES (2324, '榕城', 340, 'r', 'rc', 'rongcheng', '', '区', '445202', '0663', 1);
INSERT INTO `youbang_sys_area` VALUES (2325, '揭东', 340, 'j', 'jd', 'jiedong', '', '县', '445221', '0663', 2);
INSERT INTO `youbang_sys_area` VALUES (2326, '揭西', 340, 'j', 'jx', 'jiexi', '', '县', '445222', '0663', 3);
INSERT INTO `youbang_sys_area` VALUES (2327, '惠来', 340, 'h', 'hl', 'huilai', '', '县', '445224', '0663', 4);
INSERT INTO `youbang_sys_area` VALUES (2328, '普宁', 340, 'p', 'pn', 'puning', '', '市', '445281', '0663', 5);
INSERT INTO `youbang_sys_area` VALUES (2329, '云城', 341, 'y', 'yc', 'yuncheng', '', '区', '445302', '0766', 1);
INSERT INTO `youbang_sys_area` VALUES (2330, '新兴', 341, 'x', 'xx', 'xinxing', '', '县', '445321', '0766', 3);
INSERT INTO `youbang_sys_area` VALUES (2331, '郁南', 341, 'y', 'yn', 'yunan', '', '县', '445322', '0766', 4);
INSERT INTO `youbang_sys_area` VALUES (2332, '云安', 341, 'y', 'ya', 'yunan', '', '区', '445302', '0766', 2);
INSERT INTO `youbang_sys_area` VALUES (2333, '罗定', 341, 'l', 'ld', 'luoding', '', '市', '445381', '0766', 5);
INSERT INTO `youbang_sys_area` VALUES (2334, '兴宁', 342, 'x', 'xn', 'xingning', '', '区', '450102', '0771', 1);
INSERT INTO `youbang_sys_area` VALUES (2335, '青秀', 342, 'q', 'qx', 'qingxiu', '', '区', '450103', '0771', 2);
INSERT INTO `youbang_sys_area` VALUES (2336, '江南', 342, 'j', 'jn', 'jiangnan', '', '区', '450105', '0771', 3);
INSERT INTO `youbang_sys_area` VALUES (2337, '西乡塘', 342, 'x', 'xxt', 'xixiangtang', '', '区', '450107', '0771', 4);
INSERT INTO `youbang_sys_area` VALUES (2338, '良庆', 342, 'l', 'lq', 'liangqing', '', '区', '450108', '0771', 5);
INSERT INTO `youbang_sys_area` VALUES (2339, '邕宁', 342, 'y', 'yn', 'yongning', '', '区', '450109', '0771', 6);
INSERT INTO `youbang_sys_area` VALUES (2340, '武鸣', 342, 'w', 'wm', 'wuming', '', '区', '450122', '0771', 7);
INSERT INTO `youbang_sys_area` VALUES (2341, '隆安', 342, 'l', 'la', 'longan', '', '县', '450123', '0771', 8);
INSERT INTO `youbang_sys_area` VALUES (2342, '马山', 342, 'm', 'ms', 'mashan', '', '县', '450124', '0771', 9);
INSERT INTO `youbang_sys_area` VALUES (2343, '上林', 342, 's', 'sl', 'shanglin', '', '县', '450125', '0771', 10);
INSERT INTO `youbang_sys_area` VALUES (2344, '宾阳', 342, 'b', 'by', 'binyang', '', '县', '450126', '0771', 11);
INSERT INTO `youbang_sys_area` VALUES (2345, '横县', 342, 'h', 'hx', 'hengxian', '', '', '450127', '0771', 12);
INSERT INTO `youbang_sys_area` VALUES (2346, '城中', 343, 'c', 'cz', 'chengzhong', '', '区', '450202', '0772', 1);
INSERT INTO `youbang_sys_area` VALUES (2347, '鱼峰', 343, 'y', 'yf', 'yufeng', '', '区', '450203', '0772', 2);
INSERT INTO `youbang_sys_area` VALUES (2348, '柳南', 343, 'l', 'ln', 'liunan', '', '区', '450204', '0772', 3);
INSERT INTO `youbang_sys_area` VALUES (2349, '柳北', 343, 'l', 'lb', 'liubei', '', '区', '450205', '0772', 4);
INSERT INTO `youbang_sys_area` VALUES (2350, '柳江', 343, 'l', 'lj', 'liujiang', '', '区', '450221', '0772', 5);
INSERT INTO `youbang_sys_area` VALUES (2351, '柳城', 343, 'l', 'lc', 'liucheng', '', '县', '450222', '0772', 6);
INSERT INTO `youbang_sys_area` VALUES (2352, '鹿寨', 343, 'l', 'lz', 'luzhai', '', '县', '450223', '0772', 7);
INSERT INTO `youbang_sys_area` VALUES (2353, '融安', 343, 'r', 'ra', 'rongan', '', '县', '450224', '0772', 8);
INSERT INTO `youbang_sys_area` VALUES (2354, '融水', 343, 'r', 'rs', 'rongshui', '苗族', '自治县', '450225', '0772', 9);
INSERT INTO `youbang_sys_area` VALUES (2355, '三江', 343, 's', 'sj', 'sanjiang', '侗族', '自治县', '450226', '0772', 10);
INSERT INTO `youbang_sys_area` VALUES (2356, '秀峰', 344, 'x', 'xf', 'xiufeng', '', '区', '450302', '0773', 1);
INSERT INTO `youbang_sys_area` VALUES (2357, '叠彩', 344, 'd', 'dc', 'diecai', '', '区', '450303', '0773', 2);
INSERT INTO `youbang_sys_area` VALUES (2358, '象山', 344, 'x', 'xs', 'xiangshan', '', '区', '450304', '0773', 3);
INSERT INTO `youbang_sys_area` VALUES (2359, '七星', 344, 'q', 'qx', 'qixing', '', '区', '450305', '0773', 4);
INSERT INTO `youbang_sys_area` VALUES (2360, '雁山', 344, 'y', 'ys', 'yanshan', '', '区', '450311', '0773', 5);
INSERT INTO `youbang_sys_area` VALUES (2361, '阳朔', 344, 'y', 'ys', 'yangshuo', '', '县', '450321', '0773', 6);
INSERT INTO `youbang_sys_area` VALUES (2362, '临桂', 344, 'l', 'lg', 'lingui', '', '区', '450322', '0773', 7);
INSERT INTO `youbang_sys_area` VALUES (2363, '灵川', 344, 'l', 'lc', 'lingchuan', '', '县', '450323', '0773', 8);
INSERT INTO `youbang_sys_area` VALUES (2364, '全州', 344, 'q', 'qz', 'quanzhou', '', '县', '450324', '0773', 9);
INSERT INTO `youbang_sys_area` VALUES (2365, '兴安', 344, 'x', 'xa', 'xingan', '', '县', '450325', '0773', 10);
INSERT INTO `youbang_sys_area` VALUES (2366, '永福', 344, 'y', 'yf', 'yongfu', '', '县', '450326', '0773', 11);
INSERT INTO `youbang_sys_area` VALUES (2367, '灌阳', 344, 'g', 'gy', 'guanyang', '', '县', '450327', '0773', 12);
INSERT INTO `youbang_sys_area` VALUES (2368, '龙胜', 344, 'l', 'ls', 'longsheng', '各族', '自治县', '450328', '0773', 13);
INSERT INTO `youbang_sys_area` VALUES (2369, '资源', 344, 'z', 'zy', 'ziyuan', '', '县', '450329', '0773', 14);
INSERT INTO `youbang_sys_area` VALUES (2370, '平乐', 344, 'p', 'pl', 'pingle', '', '县', '450330', '0773', 15);
INSERT INTO `youbang_sys_area` VALUES (2371, '荔浦', 344, 'l', 'lp', 'lipu', '', '县', '450331', '0773', 16);
INSERT INTO `youbang_sys_area` VALUES (2372, '恭城', 344, 'g', 'gc', 'gongcheng', '瑶族', '自治县', '450332', '0773', 17);
INSERT INTO `youbang_sys_area` VALUES (2373, '龙圩', 345, 'l', 'lw', 'longwei', '', '区', '', '0774', 1);
INSERT INTO `youbang_sys_area` VALUES (2374, '万秀', 345, 'w', 'wx', 'wanxiu', '', '区', '450403', '0774', 2);
INSERT INTO `youbang_sys_area` VALUES (2375, '长洲', 345, 'c', 'cz', 'changzhou', '', '区', '450405', '0774', 3);
INSERT INTO `youbang_sys_area` VALUES (2376, '苍梧', 345, 'c', 'cw', 'cangwu', '', '县', '450421', '0774', 4);
INSERT INTO `youbang_sys_area` VALUES (2377, '藤县', 345, 't', 'tx', 'tengxian', '', '', '450422', '0774', 5);
INSERT INTO `youbang_sys_area` VALUES (2378, '蒙山', 345, 'm', 'ms', 'mengshan', '', '县', '450423', '0774', 6);
INSERT INTO `youbang_sys_area` VALUES (2379, '岑溪', 345, 'c', 'cx', 'cenxi', '', '市', '450481', '0774', 7);
INSERT INTO `youbang_sys_area` VALUES (2380, '海城', 346, 'h', 'hc', 'haicheng', '', '区', '450502', '0779', 1);
INSERT INTO `youbang_sys_area` VALUES (2381, '银海', 346, 'y', 'yh', 'yinhai', '', '区', '450503', '0779', 2);
INSERT INTO `youbang_sys_area` VALUES (2382, '铁山港', 346, 't', 'tsg', 'tieshangang', '', '区', '450512', '0779', 3);
INSERT INTO `youbang_sys_area` VALUES (2383, '合浦', 346, 'h', 'hp', 'hepu', '', '县', '450521', '0779', 4);
INSERT INTO `youbang_sys_area` VALUES (2384, '港口', 347, 'g', 'gk', 'gangkou', '', '区', '450602', '0770', 1);
INSERT INTO `youbang_sys_area` VALUES (2385, '防城', 347, 'f', 'fc', 'fangcheng', '', '区', '450603', '0770', 2);
INSERT INTO `youbang_sys_area` VALUES (2386, '上思', 347, 's', 'ss', 'shangsi', '', '县', '450621', '0770', 3);
INSERT INTO `youbang_sys_area` VALUES (2387, '东兴', 347, 'd', 'dx', 'dongxing', '', '市', '450681', '0770', 4);
INSERT INTO `youbang_sys_area` VALUES (2388, '钦南', 348, 'q', 'qn', 'qinnan', '', '区', '450702', '0777', 1);
INSERT INTO `youbang_sys_area` VALUES (2389, '钦北', 348, 'q', 'qb', 'qinbei', '', '区', '450703', '0777', 2);
INSERT INTO `youbang_sys_area` VALUES (2390, '灵山', 348, 'l', 'ls', 'lingshan', '', '县', '450721', '0777', 3);
INSERT INTO `youbang_sys_area` VALUES (2391, '浦北', 348, 'p', 'pb', 'pubei', '', '县', '450722', '0777', 4);
INSERT INTO `youbang_sys_area` VALUES (2392, '港北', 349, 'g', 'gb', 'gangbei', '', '区', '450802', '0775', 1);
INSERT INTO `youbang_sys_area` VALUES (2393, '港南', 349, 'g', 'gn', 'gangnan', '', '区', '450803', '0775', 2);
INSERT INTO `youbang_sys_area` VALUES (2394, '覃塘', 349, 't', 'tt', 'tantang', '', '区', '450804', '0775', 3);
INSERT INTO `youbang_sys_area` VALUES (2395, '桂平', 349, 'g', 'gp', 'guiping', '', '市', '450821', '0775', 4);
INSERT INTO `youbang_sys_area` VALUES (2396, '平南', 349, 'p', 'pn', 'pingnan', '', '县', '450881', '0775', 5);
INSERT INTO `youbang_sys_area` VALUES (2397, '玉州', 350, 'y', 'yz', 'yuzhou', '', '区', '450902', '0775', 1);
INSERT INTO `youbang_sys_area` VALUES (2398, '容县', 350, 'r', 'rx', 'rongxian', '', '', '450921', '0775', 3);
INSERT INTO `youbang_sys_area` VALUES (2399, '陆川', 350, 'l', 'lc', 'luchuan', '', '县', '450922', '0775', 4);
INSERT INTO `youbang_sys_area` VALUES (2400, '博白', 350, 'b', 'bb', 'bobai', '', '县', '450923', '0775', 5);
INSERT INTO `youbang_sys_area` VALUES (2401, '兴业', 350, 'x', 'xy', 'xingye', '', '县', '450924', '0775', 6);
INSERT INTO `youbang_sys_area` VALUES (2402, '北流', 350, 'b', 'bl', 'beiliu', '', '市', '450981', '0775', 7);
INSERT INTO `youbang_sys_area` VALUES (2403, '右江', 351, 'y', 'yj', 'youjiang', '', '区', '451002', '0776', 1);
INSERT INTO `youbang_sys_area` VALUES (2404, '田阳', 351, 't', 'ty', 'tianyang', '', '县', '451021', '0776', 2);
INSERT INTO `youbang_sys_area` VALUES (2405, '田东', 351, 't', 'td', 'tiandong', '', '县', '451022', '0776', 3);
INSERT INTO `youbang_sys_area` VALUES (2406, '平果', 351, 'p', 'pg', 'pingguo', '', '县', '451023', '0776', 4);
INSERT INTO `youbang_sys_area` VALUES (2407, '德保', 351, 'd', 'db', 'debao', '', '县', '451024', '0776', 5);
INSERT INTO `youbang_sys_area` VALUES (2408, '靖西', 351, 'j', 'jx', 'jingxi', '', '市', '451025', '0776', 6);
INSERT INTO `youbang_sys_area` VALUES (2409, '那坡', 351, 'n', 'np', 'neipo', '', '县', '451026', '0776', 7);
INSERT INTO `youbang_sys_area` VALUES (2410, '凌云', 351, 'l', 'ly', 'lingyun', '', '县', '451027', '0776', 8);
INSERT INTO `youbang_sys_area` VALUES (2411, '乐业', 351, 'l', 'ly', 'leye', '', '县', '451028', '0776', 9);
INSERT INTO `youbang_sys_area` VALUES (2412, '田林', 351, 't', 'tl', 'tianlin', '', '县', '451029', '0776', 10);
INSERT INTO `youbang_sys_area` VALUES (2413, '西林', 351, 'x', 'xl', 'xilin', '', '县', '451030', '0776', 11);
INSERT INTO `youbang_sys_area` VALUES (2414, '隆林', 351, 'l', 'll', 'longlin', '各族', '自治县', '451031', '0776', 12);
INSERT INTO `youbang_sys_area` VALUES (2415, '八步', 352, 'b', 'bb', 'babu', '', '区', '451102', '0774', 1);
INSERT INTO `youbang_sys_area` VALUES (2416, '昭平', 352, 'z', 'zp', 'zhaoping', '', '县', '451121', '0774', 3);
INSERT INTO `youbang_sys_area` VALUES (2417, '钟山', 352, 'z', 'zs', 'zhongshan', '', '县', '451122', '0774', 4);
INSERT INTO `youbang_sys_area` VALUES (2418, '富川', 352, 'f', 'fc', 'fuchuan', '瑶族', '自治县', '451123', '0774', 5);
INSERT INTO `youbang_sys_area` VALUES (2419, '金城江', 353, 'j', 'jcj', 'jinchengjiang', '', '区', '451202', '0778', 1);
INSERT INTO `youbang_sys_area` VALUES (2420, '南丹', 353, 'n', 'nd', 'nandan', '', '县', '451221', '0778', 3);
INSERT INTO `youbang_sys_area` VALUES (2421, '天峨', 353, 't', 'te', 'tiane', '', '县', '451222', '0778', 4);
INSERT INTO `youbang_sys_area` VALUES (2422, '凤山', 353, 'f', 'fs', 'fengshan', '', '县', '451223', '0778', 5);
INSERT INTO `youbang_sys_area` VALUES (2423, '东兰', 353, 'd', 'dl', 'donglan', '', '县', '451224', '0778', 6);
INSERT INTO `youbang_sys_area` VALUES (2424, '罗城', 353, 'l', 'lc', 'luocheng', '仫佬族', '自治县', '451225', '0778', 7);
INSERT INTO `youbang_sys_area` VALUES (2425, '环江', 353, 'h', 'hj', 'huanjiang', '毛南族', '自治县', '451226', '0778', 8);
INSERT INTO `youbang_sys_area` VALUES (2426, '巴马', 353, 'b', 'bm', 'bama', '瑶族', '自治县', '451227', '0778', 9);
INSERT INTO `youbang_sys_area` VALUES (2427, '都安', 353, 'd', 'da', 'duan', '瑶族', '自治县', '451228', '0778', 10);
INSERT INTO `youbang_sys_area` VALUES (2428, '大化', 353, 'd', 'dh', 'dahua', '瑶族', '自治县', '451229', '0778', 11);
INSERT INTO `youbang_sys_area` VALUES (2429, '宜州', 353, 'y', 'yz', 'yizhou', '', '区', '451281', '0778', 2);
INSERT INTO `youbang_sys_area` VALUES (2430, '兴宾', 354, 'x', 'xb', 'xingbin', '', '区', '451302', '0772', 1);
INSERT INTO `youbang_sys_area` VALUES (2431, '忻城', 354, 'x', 'xc', 'xincheng', '', '县', '451321', '0772', 2);
INSERT INTO `youbang_sys_area` VALUES (2432, '象州', 354, 'x', 'xz', 'xiangzhou', '', '县', '451322', '0772', 3);
INSERT INTO `youbang_sys_area` VALUES (2433, '武宣', 354, 'w', 'wx', 'wuxuan', '', '县', '451323', '0772', 4);
INSERT INTO `youbang_sys_area` VALUES (2434, '金秀', 354, 'j', 'jx', 'jinxiu', '瑶族', '自治县', '451324', '0772', 5);
INSERT INTO `youbang_sys_area` VALUES (2435, '合山', 354, 'h', 'hs', 'heshan', '', '市', '451381', '0772', 6);
INSERT INTO `youbang_sys_area` VALUES (2436, '江州', 355, 'j', 'jz', 'jiangzhou', '', '区', '451402', '0771', 1);
INSERT INTO `youbang_sys_area` VALUES (2437, '扶绥', 355, 'f', 'fs', 'fusui', '', '县', '451421', '0771', 2);
INSERT INTO `youbang_sys_area` VALUES (2438, '宁明', 355, 'n', 'nm', 'ningming', '', '县', '451422', '0771', 3);
INSERT INTO `youbang_sys_area` VALUES (2439, '龙州', 355, 'l', 'lz', 'longzhou', '', '县', '451423', '0771', 4);
INSERT INTO `youbang_sys_area` VALUES (2440, '大新', 355, 'd', 'dx', 'daxin', '', '县', '451424', '0771', 5);
INSERT INTO `youbang_sys_area` VALUES (2441, '天等', 355, 't', 'td', 'tiandeng', '', '县', '451425', '0771', 6);
INSERT INTO `youbang_sys_area` VALUES (2442, '凭祥', 355, 'p', 'px', 'pingxiang', '', '市', '451481', '0771', 7);
INSERT INTO `youbang_sys_area` VALUES (2443, '秀英', 356, 'x', 'xy', 'xiuying', '', '区', '460105', '0898', 1);
INSERT INTO `youbang_sys_area` VALUES (2444, '龙华', 356, 'l', 'lh', 'longhua', '', '区', '460106', '0898', 2);
INSERT INTO `youbang_sys_area` VALUES (2445, '琼山', 356, 'q', 'qs', 'qiongshan', '', '区', '460107', '0898', 3);
INSERT INTO `youbang_sys_area` VALUES (2446, '美兰', 356, 'm', 'ml', 'meilan', '', '区', '460108', '0898', 4);
INSERT INTO `youbang_sys_area` VALUES (2447, '锦江', 375, 'j', 'jj', 'jinjiang', '', '区', '510104', '028', 1);
INSERT INTO `youbang_sys_area` VALUES (2448, '青羊', 375, 'q', 'qy', 'qingyang', '', '区', '510105', '028', 2);
INSERT INTO `youbang_sys_area` VALUES (2449, '金牛', 375, 'j', 'jn', 'jinniu', '', '区', '510106', '028', 3);
INSERT INTO `youbang_sys_area` VALUES (2450, '武侯', 375, 'w', 'wh', 'wuhou', '', '区', '510107', '028', 4);
INSERT INTO `youbang_sys_area` VALUES (2451, '成华', 375, 'c', 'ch', 'chenghua', '', '区', '510108', '028', 5);
INSERT INTO `youbang_sys_area` VALUES (2452, '龙泉驿', 375, 'l', 'lqy', 'longquanyi', '', '区', '510112', '028', 6);
INSERT INTO `youbang_sys_area` VALUES (2453, '青白江', 375, 'q', 'qbj', 'qingbaijiang', '', '区', '510113', '028', 7);
INSERT INTO `youbang_sys_area` VALUES (2454, '新都', 375, 'x', 'xd', 'xindu', '', '区', '510114', '028', 8);
INSERT INTO `youbang_sys_area` VALUES (2455, '温江', 375, 'w', 'wj', 'wenjiang', '', '区', '510115', '028', 9);
INSERT INTO `youbang_sys_area` VALUES (2456, '金堂', 375, 'j', 'jt', 'jintang', '', '县', '510121', '028', 10);
INSERT INTO `youbang_sys_area` VALUES (2457, '双流', 375, 's', 'sl', 'shuangliu', '', '区', '510122', '028', 11);
INSERT INTO `youbang_sys_area` VALUES (2458, '郫都', 375, 'p', 'pd', 'pidu', '', '区', '510124', '028', 12);
INSERT INTO `youbang_sys_area` VALUES (2459, '大邑', 375, 'd', 'dy', 'dayi', '', '县', '510129', '028', 13);
INSERT INTO `youbang_sys_area` VALUES (2460, '蒲江', 375, 'p', 'pj', 'pujiang', '', '县', '510131', '028', 14);
INSERT INTO `youbang_sys_area` VALUES (2461, '新津', 375, 'x', 'xj', 'xinjin', '', '县', '510132', '028', 15);
INSERT INTO `youbang_sys_area` VALUES (2462, '都江堰', 375, 'd', 'djy', 'dujiangyan', '', '市', '510181', '028', 16);
INSERT INTO `youbang_sys_area` VALUES (2463, '彭州', 375, 'p', 'pz', 'pengzhou', '', '市', '510182', '028', 17);
INSERT INTO `youbang_sys_area` VALUES (2464, '邛崃', 375, 'q', 'ql', 'qionglai', '', '市', '510183', '028', 18);
INSERT INTO `youbang_sys_area` VALUES (2465, '崇州', 375, 'c', 'cz', 'chongzhou', '', '市', '510184', '028', 19);
INSERT INTO `youbang_sys_area` VALUES (2466, '自流井', 376, 'z', 'zlj', 'ziliujing', '', '区', '510302', '0813', 1);
INSERT INTO `youbang_sys_area` VALUES (2467, '贡井', 376, 'g', 'gj', 'gongjing', '', '区', '510303', '0813', 2);
INSERT INTO `youbang_sys_area` VALUES (2468, '大安', 376, 'd', 'da', 'daan', '', '区', '510304', '0813', 3);
INSERT INTO `youbang_sys_area` VALUES (2469, '沿滩', 376, 'y', 'yt', 'yantan', '', '区', '510311', '0813', 4);
INSERT INTO `youbang_sys_area` VALUES (2470, '荣县', 376, 'r', 'rx', 'rongxian', '', '', '510321', '0813', 5);
INSERT INTO `youbang_sys_area` VALUES (2471, '富顺', 376, 'f', 'fs', 'fushun', '', '县', '510322', '0813', 6);
INSERT INTO `youbang_sys_area` VALUES (2472, '东区', 377, 'd', 'dq', 'dongqu', '', '', '510402', '0812', 1);
INSERT INTO `youbang_sys_area` VALUES (2473, '西区', 377, 'x', 'xq', 'xiqu', '', '', '510403', '0812', 2);
INSERT INTO `youbang_sys_area` VALUES (2474, '仁和', 377, 'r', 'rh', 'renhe', '', '区', '510411', '0812', 3);
INSERT INTO `youbang_sys_area` VALUES (2475, '米易', 377, 'm', 'my', 'miyi', '', '县', '510421', '0812', 4);
INSERT INTO `youbang_sys_area` VALUES (2476, '盐边', 377, 'y', 'yb', 'yanbian', '', '县', '510422', '0812', 5);
INSERT INTO `youbang_sys_area` VALUES (2477, '江阳', 378, 'j', 'jy', 'jiangyang', '', '区', '510502', '0830', 1);
INSERT INTO `youbang_sys_area` VALUES (2478, '纳溪', 378, 'n', 'nx', 'naxi', '', '区', '510503', '0830', 2);
INSERT INTO `youbang_sys_area` VALUES (2479, '龙马潭', 378, 'l', 'lmt', 'longmatan', '', '区', '510504', '0830', 3);
INSERT INTO `youbang_sys_area` VALUES (2480, '泸县', 378, 'l', 'lx', 'luxian', '', '', '510521', '0830', 4);
INSERT INTO `youbang_sys_area` VALUES (2481, '合江', 378, 'h', 'hj', 'hejiang', '', '县', '510522', '0830', 5);
INSERT INTO `youbang_sys_area` VALUES (2482, '叙永', 378, 'x', 'xy', 'xuyong', '', '县', '510524', '0830', 6);
INSERT INTO `youbang_sys_area` VALUES (2483, '古蔺', 378, 'g', 'gl', 'gulin', '', '县', '510525', '0830', 7);
INSERT INTO `youbang_sys_area` VALUES (2484, '旌阳', 379, 'j', 'jy', 'jingyang', '', '区', '510603', '0838', 1);
INSERT INTO `youbang_sys_area` VALUES (2485, '中江', 379, 'z', 'zj', 'zhongjiang', '', '县', '510623', '0838', 2);
INSERT INTO `youbang_sys_area` VALUES (2486, '罗江', 379, 'l', 'lj', 'luojiang', '', '县', '510626', '0838', 3);
INSERT INTO `youbang_sys_area` VALUES (2487, '广汉', 379, 'g', 'gh', 'guanghan', '', '市', '510681', '0838', 4);
INSERT INTO `youbang_sys_area` VALUES (2488, '什邡', 379, 's', 'sf', 'shenfang', '', '市', '510682', '0838', 5);
INSERT INTO `youbang_sys_area` VALUES (2489, '绵竹', 379, 'm', 'mz', 'mianzhu', '', '市', '510683', '0838', 6);
INSERT INTO `youbang_sys_area` VALUES (2490, '涪城', 380, 'f', 'fc', 'fucheng', '', '区', '510703', '0816', 1);
INSERT INTO `youbang_sys_area` VALUES (2491, '游仙', 380, 'y', 'yx', 'youxian', '', '区', '510704', '0816', 2);
INSERT INTO `youbang_sys_area` VALUES (2492, '三台', 380, 's', 'st', 'santai', '', '县', '510722', '0816', 3);
INSERT INTO `youbang_sys_area` VALUES (2493, '盐亭', 380, 'y', 'yt', 'yanting', '', '县', '510723', '0816', 4);
INSERT INTO `youbang_sys_area` VALUES (2494, '安州', 380, 'a', 'az', 'anzhou', '', '区', '510724', '0816', 5);
INSERT INTO `youbang_sys_area` VALUES (2495, '梓潼', 380, 'z', 'zt', 'zitong', '', '县', '510725', '0816', 6);
INSERT INTO `youbang_sys_area` VALUES (2496, '北川', 380, 'b', 'bc', 'beichuan', '羌族', '自治县', '510726', '0816', 7);
INSERT INTO `youbang_sys_area` VALUES (2497, '平武', 380, 'p', 'pw', 'pingwu', '', '县', '510727', '0816', 8);
INSERT INTO `youbang_sys_area` VALUES (2498, '江油', 380, 'j', 'jy', 'jiangyou', '', '市', '510781', '0816', 9);
INSERT INTO `youbang_sys_area` VALUES (2499, '利州', 381, 'l', 'lz', 'lizhou', '', '区', '510802', '0839', 1);
INSERT INTO `youbang_sys_area` VALUES (2500, '昭化', 381, 'z', 'zh', 'zhaohua', '', '区', '510811', '0839', 2);
INSERT INTO `youbang_sys_area` VALUES (2501, '朝天', 381, 'c', 'ct', 'chaotian', '', '区', '510812', '0839', 3);
INSERT INTO `youbang_sys_area` VALUES (2502, '旺苍', 381, 'w', 'wc', 'wangcang', '', '县', '510821', '0839', 4);
INSERT INTO `youbang_sys_area` VALUES (2503, '青川', 381, 'q', 'qc', 'qingchuan', '', '县', '510822', '0839', 5);
INSERT INTO `youbang_sys_area` VALUES (2504, '剑阁', 381, 'j', 'jg', 'jiange', '', '县', '510823', '0839', 6);
INSERT INTO `youbang_sys_area` VALUES (2505, '苍溪', 381, 'c', 'cx', 'cangxi', '', '县', '510824', '0839', 7);
INSERT INTO `youbang_sys_area` VALUES (2506, '船山', 382, 'c', 'cs', 'chuanshan', '', '区', '510903', '0825', 1);
INSERT INTO `youbang_sys_area` VALUES (2507, '安居', 382, 'a', 'aj', 'anju', '', '区', '510904', '0825', 2);
INSERT INTO `youbang_sys_area` VALUES (2508, '蓬溪', 382, 'p', 'px', 'pengxi', '', '县', '510921', '0825', 3);
INSERT INTO `youbang_sys_area` VALUES (2509, '射洪', 382, 's', 'sh', 'shehong', '', '县', '510922', '0825', 4);
INSERT INTO `youbang_sys_area` VALUES (2510, '大英', 382, 'd', 'dy', 'daying', '', '县', '510923', '0825', 5);
INSERT INTO `youbang_sys_area` VALUES (2511, '市中', 383, 's', 'sz', 'shizhong', '', '区', '511002', '', 1);
INSERT INTO `youbang_sys_area` VALUES (2512, '东兴', 383, 'd', 'dx', 'dongxing', '', '区', '511011', '', 2);
INSERT INTO `youbang_sys_area` VALUES (2513, '威远', 383, 'w', 'wy', 'weiyuan', '', '县', '511024', '', 3);
INSERT INTO `youbang_sys_area` VALUES (2514, '资中', 383, 'z', 'zz', 'zizhong', '', '县', '511025', '', 4);
INSERT INTO `youbang_sys_area` VALUES (2515, '隆昌', 383, 'l', 'lc', 'longchang', '', '县', '511028', '', 5);
INSERT INTO `youbang_sys_area` VALUES (2516, '市中', 384, 's', 'sz', 'shizhong', '', '区', '511102', '0833', 1);
INSERT INTO `youbang_sys_area` VALUES (2517, '沙湾', 384, 's', 'sw', 'shawan', '', '区', '511111', '0833', 2);
INSERT INTO `youbang_sys_area` VALUES (2518, '五通桥', 384, 'w', 'wtq', 'wutongqiao', '', '区', '511112', '0833', 3);
INSERT INTO `youbang_sys_area` VALUES (2519, '金口河', 384, 'j', 'jkh', 'jinkouhe', '', '区', '511113', '0833', 4);
INSERT INTO `youbang_sys_area` VALUES (2520, '犍为', 384, 'j', 'jw', 'jianwei', '', '县', '511123', '0833', 5);
INSERT INTO `youbang_sys_area` VALUES (2521, '井研', 384, 'j', 'jy', 'jingyan', '', '县', '511124', '0833', 6);
INSERT INTO `youbang_sys_area` VALUES (2522, '夹江', 384, 'j', 'jj', 'jiajiang', '', '县', '511126', '0833', 7);
INSERT INTO `youbang_sys_area` VALUES (2523, '沐川', 384, 'm', 'mc', 'muchuan', '', '县', '511129', '0833', 8);
INSERT INTO `youbang_sys_area` VALUES (2524, '峨边', 384, 'e', 'eb', 'ebian', '彝族', '自治县', '511132', '0833', 9);
INSERT INTO `youbang_sys_area` VALUES (2525, '马边', 384, 'm', 'mb', 'mabian', '彝族', '自治县', '511133', '0833', 10);
INSERT INTO `youbang_sys_area` VALUES (2526, '峨眉山', 384, 'e', 'ems', 'emeishan', '', '市', '511181', '0833', 11);
INSERT INTO `youbang_sys_area` VALUES (2527, '顺庆', 385, 's', 'sq', 'shunqing', '', '区', '511302', '0817', 1);
INSERT INTO `youbang_sys_area` VALUES (2528, '高坪', 385, 'g', 'gp', 'gaoping', '', '区', '511303', '0817', 2);
INSERT INTO `youbang_sys_area` VALUES (2529, '嘉陵', 385, 'j', 'jl', 'jialing', '', '区', '511304', '0817', 3);
INSERT INTO `youbang_sys_area` VALUES (2530, '南部', 385, 'n', 'nb', 'nanbu', '', '县', '511321', '0817', 4);
INSERT INTO `youbang_sys_area` VALUES (2531, '营山', 385, 'y', 'ys', 'yingshan', '', '县', '511322', '0817', 5);
INSERT INTO `youbang_sys_area` VALUES (2532, '蓬安', 385, 'p', 'pa', 'pengan', '', '县', '511323', '0817', 6);
INSERT INTO `youbang_sys_area` VALUES (2533, '仪陇', 385, 'y', 'yl', 'yilong', '', '县', '511324', '0817', 7);
INSERT INTO `youbang_sys_area` VALUES (2534, '西充', 385, 'x', 'xc', 'xichong', '', '县', '511325', '0817', 8);
INSERT INTO `youbang_sys_area` VALUES (2535, '阆中', 385, 'l', 'lz', 'langzhong', '', '市', '511381', '0817', 9);
INSERT INTO `youbang_sys_area` VALUES (2536, '东坡', 386, 'd', 'dp', 'dongpo', '', '区', '511402', '028', 1);
INSERT INTO `youbang_sys_area` VALUES (2537, '仁寿', 386, 'r', 'rs', 'renshou', '', '县', '511421', '028', 2);
INSERT INTO `youbang_sys_area` VALUES (2538, '彭山', 386, 'p', 'ps', 'pengshan', '', '区', '511422', '028', 3);
INSERT INTO `youbang_sys_area` VALUES (2539, '洪雅', 386, 'h', 'hy', 'hongya', '', '县', '511423', '028', 4);
INSERT INTO `youbang_sys_area` VALUES (2540, '丹棱', 386, 'd', 'dl', 'danleng', '', '县', '511424', '028', 5);
INSERT INTO `youbang_sys_area` VALUES (2541, '青神', 386, 'q', 'qs', 'qingshen', '', '县', '511425', '028', 6);
INSERT INTO `youbang_sys_area` VALUES (2542, '翠屏', 387, 'c', 'cp', 'cuiping', '', '区', '511502', '0831', 1);
INSERT INTO `youbang_sys_area` VALUES (2543, '南溪', 387, 'n', 'nx', 'nanxi', '', '区', '511503', '0831', 2);
INSERT INTO `youbang_sys_area` VALUES (2544, '宜宾', 387, 'y', 'yb', 'yibin', '', '县', '511521', '0831', 3);
INSERT INTO `youbang_sys_area` VALUES (2545, '江安', 387, 'j', 'ja', 'jiangan', '', '县', '511523', '0831', 4);
INSERT INTO `youbang_sys_area` VALUES (2546, '长宁', 387, 'c', 'cn', 'changning', '', '县', '511524', '0831', 5);
INSERT INTO `youbang_sys_area` VALUES (2547, '高县', 387, 'g', 'gx', 'gaoxian', '', '', '511525', '0831', 6);
INSERT INTO `youbang_sys_area` VALUES (2548, '珙县', 387, 'g', 'gx', 'gongxian', '', '', '511526', '0831', 7);
INSERT INTO `youbang_sys_area` VALUES (2549, '筠连', 387, 'y', 'yl', 'yunlian', '', '县', '511527', '0831', 8);
INSERT INTO `youbang_sys_area` VALUES (2550, '兴文', 387, 'x', 'xw', 'xingwen', '', '县', '511528', '0831', 9);
INSERT INTO `youbang_sys_area` VALUES (2551, '屏山', 387, 'p', 'ps', 'pingshan', '', '县', '511529', '0831', 10);
INSERT INTO `youbang_sys_area` VALUES (2552, '广安', 388, 'g', 'ga', 'guangan', '', '区', '511602', '0826', 1);
INSERT INTO `youbang_sys_area` VALUES (2553, '岳池', 388, 'y', 'yc', 'yuechi', '', '县', '511621', '0826', 3);
INSERT INTO `youbang_sys_area` VALUES (2554, '武胜', 388, 'w', 'ws', 'wusheng', '', '县', '511622', '0826', 4);
INSERT INTO `youbang_sys_area` VALUES (2555, '邻水', 388, 'l', 'ls', 'linshui', '', '县', '511623', '0826', 5);
INSERT INTO `youbang_sys_area` VALUES (2556, '华蓥', 388, 'h', 'hy', 'huaying', '', '市', '511681', '0826', 6);
INSERT INTO `youbang_sys_area` VALUES (2557, '通川', 389, 't', 'tc', 'tongchuan', '', '区', '511702', '0818', 1);
INSERT INTO `youbang_sys_area` VALUES (2558, '达川', 389, 'd', 'dc', 'dachuan', '', '区', '511721', '0818', 2);
INSERT INTO `youbang_sys_area` VALUES (2559, '宣汉', 389, 'x', 'xh', 'xuanhan', '', '县', '511722', '0818', 3);
INSERT INTO `youbang_sys_area` VALUES (2560, '开江', 389, 'k', 'kj', 'kaijiang', '', '县', '511723', '0818', 4);
INSERT INTO `youbang_sys_area` VALUES (2561, '大竹', 389, 'd', 'dz', 'dazhu', '', '县', '511724', '0818', 5);
INSERT INTO `youbang_sys_area` VALUES (2562, '渠县', 389, 'q', 'qx', 'quxian', '', '', '511725', '0818', 6);
INSERT INTO `youbang_sys_area` VALUES (2563, '万源', 389, 'w', 'wy', 'wanyuan', '', '市', '511781', '0818', 7);
INSERT INTO `youbang_sys_area` VALUES (2564, '雨城', 390, 'y', 'yc', 'yucheng', '', '区', '511802', '0835', 1);
INSERT INTO `youbang_sys_area` VALUES (2565, '名山', 390, 'm', 'ms', 'mingshan', '', '区', '511803', '0835', 2);
INSERT INTO `youbang_sys_area` VALUES (2566, '荥经', 390, 'y', 'yj', 'yingjing', '', '县', '511822', '0835', 3);
INSERT INTO `youbang_sys_area` VALUES (2567, '汉源', 390, 'h', 'hy', 'hanyuan', '', '县', '511823', '0835', 4);
INSERT INTO `youbang_sys_area` VALUES (2568, '石棉', 390, 's', 'sm', 'shimian', '', '县', '511824', '0835', 5);
INSERT INTO `youbang_sys_area` VALUES (2569, '天全', 390, 't', 'tq', 'tianquan', '', '县', '511825', '0835', 6);
INSERT INTO `youbang_sys_area` VALUES (2570, '芦山', 390, 'l', 'ls', 'lushan', '', '县', '511826', '0835', 7);
INSERT INTO `youbang_sys_area` VALUES (2571, '宝兴', 390, 'b', 'bx', 'baoxing', '', '县', '511827', '0835', 8);
INSERT INTO `youbang_sys_area` VALUES (2572, '巴州', 391, 'b', 'bz', 'bazhou', '', '区', '511902', '0827', 1);
INSERT INTO `youbang_sys_area` VALUES (2573, '通江', 391, 't', 'tj', 'tongjiang', '', '县', '511921', '0827', 2);
INSERT INTO `youbang_sys_area` VALUES (2574, '南江', 391, 'n', 'nj', 'nanjiang', '', '县', '511922', '0827', 3);
INSERT INTO `youbang_sys_area` VALUES (2575, '平昌', 391, 'p', 'pc', 'pingchang', '', '县', '511923', '0827', 4);
INSERT INTO `youbang_sys_area` VALUES (2576, '雁江', 392, 'y', 'yj', 'yanjiang', '', '区', '512002', '028', 1);
INSERT INTO `youbang_sys_area` VALUES (2577, '安岳', 392, 'a', 'ay', 'anyue', '', '县', '512021', '028', 2);
INSERT INTO `youbang_sys_area` VALUES (2578, '乐至', 392, 'l', 'lz', 'lezhi', '', '县', '512022', '028', 3);
INSERT INTO `youbang_sys_area` VALUES (2579, '简阳', 375, 'j', 'jy', 'jianyang', '', '市', '512081', '028', 4);
INSERT INTO `youbang_sys_area` VALUES (2580, '马尔康', 393, 'm', 'mek', 'maerkang', '', '市', '513229', '0837', 1);
INSERT INTO `youbang_sys_area` VALUES (2581, '汶川', 393, 'w', 'wc', 'wenchuan', '', '县', '513221', '0837', 2);
INSERT INTO `youbang_sys_area` VALUES (2582, '理县', 393, 'l', 'lx', 'lixian', '', '', '513222', '0837', 3);
INSERT INTO `youbang_sys_area` VALUES (2583, '茂县', 393, 'm', 'mx', 'maoxian', '', '', '513223', '0837', 4);
INSERT INTO `youbang_sys_area` VALUES (2584, '松潘', 393, 's', 'sp', 'songpan', '', '县', '513224', '0837', 5);
INSERT INTO `youbang_sys_area` VALUES (2585, '九寨沟', 393, 'j', 'jzg', 'jiuzhaigou', '', '县', '513225', '0837', 6);
INSERT INTO `youbang_sys_area` VALUES (2586, '金川', 393, 'j', 'jc', 'jinchuan', '', '县', '513226', '0837', 7);
INSERT INTO `youbang_sys_area` VALUES (2587, '小金', 393, 'x', 'xj', 'xiaojin', '', '县', '513227', '0837', 8);
INSERT INTO `youbang_sys_area` VALUES (2588, '黑水', 393, 'h', 'hs', 'heishui', '', '县', '513228', '0837', 9);
INSERT INTO `youbang_sys_area` VALUES (2589, '壤塘', 393, 'r', 'rt', 'rangtang', '', '县', '513230', '0837', 10);
INSERT INTO `youbang_sys_area` VALUES (2590, '阿坝', 393, 'a', 'ab', 'aba', '', '县', '513231', '0837', 11);
INSERT INTO `youbang_sys_area` VALUES (2591, '若尔盖', 393, 'r', 'reg', 'ruoergai', '', '县', '513232', '0837', 12);
INSERT INTO `youbang_sys_area` VALUES (2592, '红原', 393, 'h', 'hy', 'hongyuan', '', '县', '513233', '0837', 13);
INSERT INTO `youbang_sys_area` VALUES (2593, '康定', 394, 'k', 'kd', 'kangding', '', '市', '513301', '0836', 1);
INSERT INTO `youbang_sys_area` VALUES (2594, '泸定', 394, 'l', 'ld', 'luding', '', '县', '513322', '0836', 2);
INSERT INTO `youbang_sys_area` VALUES (2595, '丹巴', 394, 'd', 'db', 'danba', '', '县', '513323', '0836', 3);
INSERT INTO `youbang_sys_area` VALUES (2596, '九龙', 394, 'j', 'jl', 'jiulong', '', '县', '513324', '0836', 4);
INSERT INTO `youbang_sys_area` VALUES (2597, '雅江', 394, 'y', 'yj', 'yajiang', '', '县', '513325', '0836', 5);
INSERT INTO `youbang_sys_area` VALUES (2598, '道孚', 394, 'd', 'df', 'daofu', '', '县', '513326', '0836', 6);
INSERT INTO `youbang_sys_area` VALUES (2599, '炉霍', 394, 'l', 'lh', 'luhuo', '', '县', '513327', '0836', 7);
INSERT INTO `youbang_sys_area` VALUES (2600, '甘孜', 394, 'g', 'gz', 'ganzi', '', '县', '513328', '0836', 8);
INSERT INTO `youbang_sys_area` VALUES (2601, '新龙', 394, 'x', 'xl', 'xinlong', '', '县', '513329', '0836', 9);
INSERT INTO `youbang_sys_area` VALUES (2602, '德格', 394, 'd', 'dg', 'dege', '', '县', '513330', '0836', 10);
INSERT INTO `youbang_sys_area` VALUES (2603, '白玉', 394, 'b', 'by', 'baiyu', '', '县', '513331', '0836', 11);
INSERT INTO `youbang_sys_area` VALUES (2604, '石渠', 394, 's', 'sq', 'shiqu', '', '县', '513332', '0836', 12);
INSERT INTO `youbang_sys_area` VALUES (2605, '色达', 394, 's', 'sd', 'seda', '', '县', '513333', '0836', 13);
INSERT INTO `youbang_sys_area` VALUES (2606, '理塘', 394, 'l', 'lt', 'litang', '', '县', '513334', '0836', 14);
INSERT INTO `youbang_sys_area` VALUES (2607, '巴塘', 394, 'b', 'bt', 'batang', '', '县', '513335', '0836', 15);
INSERT INTO `youbang_sys_area` VALUES (2608, '乡城', 394, 'x', 'xc', 'xiangcheng', '', '县', '513336', '0836', 16);
INSERT INTO `youbang_sys_area` VALUES (2609, '稻城', 394, 'd', 'dc', 'daocheng', '', '县', '513337', '0836', 17);
INSERT INTO `youbang_sys_area` VALUES (2610, '得荣', 394, 'd', 'dr', 'derong', '', '县', '513338', '0836', 18);
INSERT INTO `youbang_sys_area` VALUES (2611, '西昌', 395, 'x', 'xc', 'xichang', '', '市', '513401', '0834', 1);
INSERT INTO `youbang_sys_area` VALUES (2612, '木里', 395, 'm', 'ml', 'muli', '藏族', '自治县', '513422', '0834', 2);
INSERT INTO `youbang_sys_area` VALUES (2613, '盐源', 395, 'y', 'yy', 'yanyuan', '', '县', '513423', '0834', 3);
INSERT INTO `youbang_sys_area` VALUES (2614, '德昌', 395, 'd', 'dc', 'dechang', '', '县', '513424', '0834', 4);
INSERT INTO `youbang_sys_area` VALUES (2615, '会理', 395, 'h', 'hl', 'huili', '', '县', '513425', '0834', 5);
INSERT INTO `youbang_sys_area` VALUES (2616, '会东', 395, 'h', 'hd', 'huidong', '', '县', '513426', '0834', 6);
INSERT INTO `youbang_sys_area` VALUES (2617, '宁南', 395, 'n', 'nn', 'ningnan', '', '县', '513427', '0834', 7);
INSERT INTO `youbang_sys_area` VALUES (2618, '普格', 395, 'p', 'pg', 'puge', '', '县', '513428', '0834', 8);
INSERT INTO `youbang_sys_area` VALUES (2619, '布拖', 395, 'b', 'bt', 'butuo', '', '县', '513429', '0834', 9);
INSERT INTO `youbang_sys_area` VALUES (2620, '金阳', 395, 'j', 'jy', 'jinyang', '', '县', '513430', '0834', 10);
INSERT INTO `youbang_sys_area` VALUES (2621, '昭觉', 395, 'z', 'zj', 'zhaojue', '', '县', '513431', '0834', 11);
INSERT INTO `youbang_sys_area` VALUES (2622, '喜德', 395, 'x', 'xd', 'xide', '', '县', '513432', '0834', 12);
INSERT INTO `youbang_sys_area` VALUES (2623, '冕宁', 395, 'm', 'mn', 'mianning', '', '县', '513433', '0834', 13);
INSERT INTO `youbang_sys_area` VALUES (2624, '越西', 395, 'y', 'yx', 'yuexi', '', '县', '513434', '0834', 14);
INSERT INTO `youbang_sys_area` VALUES (2625, '甘洛', 395, 'g', 'gl', 'ganluo', '', '县', '513435', '0834', 15);
INSERT INTO `youbang_sys_area` VALUES (2626, '美姑', 395, 'm', 'mg', 'meigu', '', '县', '513436', '0834', 16);
INSERT INTO `youbang_sys_area` VALUES (2627, '雷波', 395, 'l', 'lb', 'leibo', '', '县', '513437', '0834', 17);
INSERT INTO `youbang_sys_area` VALUES (2628, '观山湖', 396, 'g', 'gsh', 'guanshanhu', '', '区', '', '0851', 1);
INSERT INTO `youbang_sys_area` VALUES (2629, '南明', 396, 'n', 'nm', 'nanming', '', '区', '520102', '0851', 2);
INSERT INTO `youbang_sys_area` VALUES (2630, '云岩', 396, 'y', 'yy', 'yunyan', '', '区', '520103', '0851', 3);
INSERT INTO `youbang_sys_area` VALUES (2631, '花溪', 396, 'h', 'hx', 'huaxi', '', '区', '520111', '0851', 4);
INSERT INTO `youbang_sys_area` VALUES (2632, '乌当', 396, 'w', 'wd', 'wudang', '', '区', '520112', '0851', 5);
INSERT INTO `youbang_sys_area` VALUES (2633, '白云', 396, 'b', 'by', 'baiyun', '', '区', '520113', '0851', 6);
INSERT INTO `youbang_sys_area` VALUES (2634, '开阳', 396, 'k', 'ky', 'kaiyang', '', '县', '520121', '0851', 7);
INSERT INTO `youbang_sys_area` VALUES (2635, '息烽', 396, 'x', 'xf', 'xifeng', '', '县', '520122', '0851', 8);
INSERT INTO `youbang_sys_area` VALUES (2636, '修文', 396, 'x', 'xw', 'xiuwen', '', '县', '520123', '0851', 9);
INSERT INTO `youbang_sys_area` VALUES (2637, '清镇', 396, 'q', 'qz', 'qingzhen', '', '市', '520181', '0851', 10);
INSERT INTO `youbang_sys_area` VALUES (2638, '钟山', 397, 'z', 'zs', 'zhongshan', '', '区', '520201', '0858', 1);
INSERT INTO `youbang_sys_area` VALUES (2639, '六枝特', 397, 'l', 'lzt', 'liuzhite', '', '区', '520203', '0858', 2);
INSERT INTO `youbang_sys_area` VALUES (2640, '水城', 397, 's', 'sc', 'shuicheng', '', '县', '520221', '0858', 3);
INSERT INTO `youbang_sys_area` VALUES (2641, '盘县', 397, 'p', 'px', 'panxian', '', '', '520222', '0858', 4);
INSERT INTO `youbang_sys_area` VALUES (2642, '红花岗', 398, 'h', 'hhg', 'honghuagang', '', '区', '520302', '0852', 1);
INSERT INTO `youbang_sys_area` VALUES (2643, '汇川', 398, 'h', 'hc', 'huichuan', '', '区', '520303', '0852', 2);
INSERT INTO `youbang_sys_area` VALUES (2644, '播州', 398, 'b', 'bz', 'bozhou', '', '区', '520321', '0852', 3);
INSERT INTO `youbang_sys_area` VALUES (2645, '桐梓', 398, 't', 'tz', 'tongzi', '', '县', '520322', '0852', 4);
INSERT INTO `youbang_sys_area` VALUES (2646, '绥阳', 398, 's', 'sy', 'suiyang', '', '县', '520323', '0852', 5);
INSERT INTO `youbang_sys_area` VALUES (2647, '正安', 398, 'z', 'za', 'zhengan', '', '县', '520324', '0852', 6);
INSERT INTO `youbang_sys_area` VALUES (2648, '道真', 398, 'd', 'dz', 'daozhen', '仡佬族苗族', '自治县', '520325', '0852', 7);
INSERT INTO `youbang_sys_area` VALUES (2649, '务川', 398, 'w', 'wc', 'wuchuan', '仡佬族苗族', '自治县', '520326', '0852', 8);
INSERT INTO `youbang_sys_area` VALUES (2650, '凤冈', 398, 'f', 'fg', 'fenggang', '', '县', '520327', '0852', 9);
INSERT INTO `youbang_sys_area` VALUES (2651, '湄潭', 398, 'm', 'mt', 'meitan', '', '县', '520328', '0852', 10);
INSERT INTO `youbang_sys_area` VALUES (2652, '余庆', 398, 'y', 'yq', 'yuqing', '', '县', '520329', '0852', 11);
INSERT INTO `youbang_sys_area` VALUES (2653, '习水', 398, 'x', 'xs', 'xishui', '', '县', '520330', '0852', 12);
INSERT INTO `youbang_sys_area` VALUES (2654, '赤水', 398, 'c', 'cs', 'chishui', '', '市', '520381', '0852', 13);
INSERT INTO `youbang_sys_area` VALUES (2655, '仁怀', 398, 'r', 'rh', 'renhuai', '', '市', '520382', '0852', 14);
INSERT INTO `youbang_sys_area` VALUES (2656, '西秀', 399, 'x', 'xx', 'xixiu', '', '区', '520402', '0853', 1);
INSERT INTO `youbang_sys_area` VALUES (2657, '平坝', 399, 'p', 'pb', 'pingba', '', '区', '520403', '0853', 2);
INSERT INTO `youbang_sys_area` VALUES (2658, '普定', 399, 'p', 'pd', 'puding', '', '县', '520422', '0853', 3);
INSERT INTO `youbang_sys_area` VALUES (2659, '镇宁', 399, 'z', 'zn', 'zhenning', '布依族苗族', '自治县', '520423', '0853', 4);
INSERT INTO `youbang_sys_area` VALUES (2660, '关岭', 399, 'g', 'gl', 'guanling', '布依族苗族', '自治县', '520424', '0853', 5);
INSERT INTO `youbang_sys_area` VALUES (2661, '紫云', 399, 'z', 'zy', 'ziyun', '苗族布依族', '自治县', '520425', '0853', 6);
INSERT INTO `youbang_sys_area` VALUES (2662, '七星关', 400, 'q', 'qxg', 'qixingguan', '', '区', '520502', '0857', 1);
INSERT INTO `youbang_sys_area` VALUES (2663, '大方', 400, 'd', 'df', 'dafang', '', '县', '520521', '0857', 2);
INSERT INTO `youbang_sys_area` VALUES (2664, '黔西', 400, 'q', 'qx', 'qianxi', '', '县', '520522', '0857', 3);
INSERT INTO `youbang_sys_area` VALUES (2665, '金沙', 400, 'j', 'js', 'jinsha', '', '县', '520523', '0857', 4);
INSERT INTO `youbang_sys_area` VALUES (2666, '织金', 400, 'z', 'zj', 'zhijin', '', '县', '520524', '0857', 5);
INSERT INTO `youbang_sys_area` VALUES (2667, '纳雍', 400, 'n', 'ny', 'nayong', '', '县', '520525', '0857', 6);
INSERT INTO `youbang_sys_area` VALUES (2668, '威宁', 400, 'w', 'wn', 'weining', '彝族回族苗族', '自治县', '520526', '0857', 7);
INSERT INTO `youbang_sys_area` VALUES (2669, '赫章', 400, 'h', 'hz', 'hezhang', '', '县', '520527', '0857', 8);
INSERT INTO `youbang_sys_area` VALUES (2670, '碧江', 401, 'b', 'bj', 'bijiang', '', '区', '520602', '0856', 1);
INSERT INTO `youbang_sys_area` VALUES (2671, '万山', 401, 'w', 'ws', 'wanshan', '', '区', '520603', '0856', 2);
INSERT INTO `youbang_sys_area` VALUES (2672, '江口', 401, 'j', 'jk', 'jiangkou', '', '县', '520621', '0856', 3);
INSERT INTO `youbang_sys_area` VALUES (2673, '玉屏', 401, 'y', 'yp', 'yuping', '侗族', '自治县', '520622', '0856', 4);
INSERT INTO `youbang_sys_area` VALUES (2674, '石阡', 401, 's', 'sq', 'shiqian', '', '县', '520623', '0856', 5);
INSERT INTO `youbang_sys_area` VALUES (2675, '思南', 401, 's', 'sn', 'sinan', '', '县', '520624', '0856', 6);
INSERT INTO `youbang_sys_area` VALUES (2676, '印江', 401, 'y', 'yj', 'yinjiang', '土家族苗族', '自治县', '520625', '0856', 7);
INSERT INTO `youbang_sys_area` VALUES (2677, '德江', 401, 'd', 'dj', 'dejiang', '', '县', '520626', '0856', 8);
INSERT INTO `youbang_sys_area` VALUES (2678, '沿河', 401, 'y', 'yh', 'yanhe', '土家族', '自治县', '520627', '0856', 9);
INSERT INTO `youbang_sys_area` VALUES (2679, '松桃', 401, 's', 'st', 'songtao', '苗族', '自治县', '520628', '0856', 10);
INSERT INTO `youbang_sys_area` VALUES (2680, '兴义', 402, 'x', 'xy', 'xingyi', '', '市', '522301', '0859', 1);
INSERT INTO `youbang_sys_area` VALUES (2681, '兴仁', 402, 'x', 'xr', 'xingren', '', '县', '522322', '0859', 2);
INSERT INTO `youbang_sys_area` VALUES (2682, '普安', 402, 'p', 'pa', 'puan', '', '县', '522323', '0859', 3);
INSERT INTO `youbang_sys_area` VALUES (2683, '晴隆', 402, 'q', 'ql', 'qinglong', '', '县', '522324', '0859', 4);
INSERT INTO `youbang_sys_area` VALUES (2684, '贞丰', 402, 'z', 'zf', 'zhenfeng', '', '县', '522325', '0859', 5);
INSERT INTO `youbang_sys_area` VALUES (2685, '望谟', 402, 'w', 'wm', 'wangmo', '', '县', '522326', '0859', 6);
INSERT INTO `youbang_sys_area` VALUES (2686, '册亨', 402, 'c', 'ch', 'ceheng', '', '县', '522327', '0859', 7);
INSERT INTO `youbang_sys_area` VALUES (2687, '安龙', 402, 'a', 'al', 'anlong', '', '县', '522328', '0859', 8);
INSERT INTO `youbang_sys_area` VALUES (2688, '凯里', 403, 'k', 'kl', 'kaili', '', '市', '522601', '0855', 1);
INSERT INTO `youbang_sys_area` VALUES (2689, '黄平', 403, 'h', 'hp', 'huangping', '', '县', '522622', '0855', 2);
INSERT INTO `youbang_sys_area` VALUES (2690, '施秉', 403, 's', 'sb', 'shibing', '', '县', '522623', '0855', 3);
INSERT INTO `youbang_sys_area` VALUES (2691, '三穗', 403, 's', 'ss', 'sansui', '', '县', '522624', '0855', 4);
INSERT INTO `youbang_sys_area` VALUES (2692, '镇远', 403, 'z', 'zy', 'zhenyuan', '', '县', '522625', '0855', 5);
INSERT INTO `youbang_sys_area` VALUES (2693, '岑巩', 403, 'c', 'cg', 'cengong', '', '县', '522626', '0855', 6);
INSERT INTO `youbang_sys_area` VALUES (2694, '天柱', 403, 't', 'tz', 'tianzhu', '', '县', '522627', '0855', 7);
INSERT INTO `youbang_sys_area` VALUES (2695, '锦屏', 403, 'j', 'jp', 'jinping', '', '县', '522628', '0855', 8);
INSERT INTO `youbang_sys_area` VALUES (2696, '剑河', 403, 'j', 'jh', 'jianhe', '', '县', '522629', '0855', 9);
INSERT INTO `youbang_sys_area` VALUES (2697, '台江', 403, 't', 'tj', 'taijiang', '', '县', '522630', '0855', 10);
INSERT INTO `youbang_sys_area` VALUES (2698, '黎平', 403, 'l', 'lp', 'liping', '', '县', '522631', '0855', 11);
INSERT INTO `youbang_sys_area` VALUES (2699, '榕江', 403, 'r', 'rj', 'rongjiang', '', '县', '522632', '0855', 12);
INSERT INTO `youbang_sys_area` VALUES (2700, '从江', 403, 'c', 'cj', 'congjiang', '', '县', '522633', '0855', 13);
INSERT INTO `youbang_sys_area` VALUES (2701, '雷山', 403, 'l', 'ls', 'leishan', '', '县', '522634', '0855', 14);
INSERT INTO `youbang_sys_area` VALUES (2702, '麻江', 403, 'm', 'mj', 'majiang', '', '县', '522635', '0855', 15);
INSERT INTO `youbang_sys_area` VALUES (2703, '丹寨', 403, 'd', 'dz', 'danzhai', '', '县', '522636', '0855', 16);
INSERT INTO `youbang_sys_area` VALUES (2704, '都匀', 404, 'd', 'dy', 'duyun', '', '市', '522701', '0854', 1);
INSERT INTO `youbang_sys_area` VALUES (2705, '福泉', 404, 'f', 'fq', 'fuquan', '', '市', '522702', '0854', 2);
INSERT INTO `youbang_sys_area` VALUES (2706, '荔波', 404, 'l', 'lb', 'libo', '', '县', '522722', '0854', 3);
INSERT INTO `youbang_sys_area` VALUES (2707, '贵定', 404, 'g', 'gd', 'guiding', '', '县', '522723', '0854', 4);
INSERT INTO `youbang_sys_area` VALUES (2708, '瓮安', 404, 'w', 'wa', 'wengan', '', '县', '522725', '0854', 5);
INSERT INTO `youbang_sys_area` VALUES (2709, '独山', 404, 'd', 'ds', 'dushan', '', '县', '522726', '0854', 6);
INSERT INTO `youbang_sys_area` VALUES (2710, '平塘', 404, 'p', 'pt', 'pingtang', '', '县', '522727', '0854', 7);
INSERT INTO `youbang_sys_area` VALUES (2711, '罗甸', 404, 'l', 'ld', 'luodian', '', '县', '522728', '0854', 8);
INSERT INTO `youbang_sys_area` VALUES (2712, '长顺', 404, 'c', 'cs', 'changshun', '', '县', '522729', '0854', 9);
INSERT INTO `youbang_sys_area` VALUES (2713, '龙里', 404, 'l', 'll', 'longli', '', '县', '522730', '0854', 10);
INSERT INTO `youbang_sys_area` VALUES (2714, '惠水', 404, 'h', 'hs', 'huishui', '', '县', '522731', '0854', 11);
INSERT INTO `youbang_sys_area` VALUES (2715, '三都', 404, 's', 'sd', 'sandu', '水族', '自治县', '522732', '0854', 12);
INSERT INTO `youbang_sys_area` VALUES (2716, '五华', 405, 'w', 'wh', 'wuhua', '', '区', '530102', '0871', 1);
INSERT INTO `youbang_sys_area` VALUES (2717, '盘龙', 405, 'p', 'pl', 'panlong', '', '区', '530103', '0871', 2);
INSERT INTO `youbang_sys_area` VALUES (2718, '官渡', 405, 'g', 'gd', 'guandu', '', '区', '530111', '0871', 3);
INSERT INTO `youbang_sys_area` VALUES (2719, '西山', 405, 'x', 'xs', 'xishan', '', '区', '530112', '0871', 4);
INSERT INTO `youbang_sys_area` VALUES (2720, '东川', 405, 'd', 'dc', 'dongchuan', '', '区', '530113', '0871', 5);
INSERT INTO `youbang_sys_area` VALUES (2721, '呈贡', 405, 'c', 'cg', 'chenggong', '', '区', '530114', '0871', 6);
INSERT INTO `youbang_sys_area` VALUES (2722, '晋宁', 405, 'j', 'jn', 'jinning', '', '区', '530122', '0871', 7);
INSERT INTO `youbang_sys_area` VALUES (2723, '富民', 405, 'f', 'fm', 'fumin', '', '县', '530124', '0871', 8);
INSERT INTO `youbang_sys_area` VALUES (2724, '宜良', 405, 'y', 'yl', 'yiliang', '', '县', '530125', '0871', 9);
INSERT INTO `youbang_sys_area` VALUES (2725, '石林', 405, 's', 'sl', 'shilin', '彝族', '自治县', '530126', '0871', 10);
INSERT INTO `youbang_sys_area` VALUES (2726, '嵩明', 405, 's', 'sm', 'songming', '', '县', '530127', '0871', 11);
INSERT INTO `youbang_sys_area` VALUES (2727, '禄劝', 405, 'l', 'lq', 'luquan', '彝族苗族', '自治县', '530128', '0871', 12);
INSERT INTO `youbang_sys_area` VALUES (2728, '寻甸', 405, 'x', 'xd', 'xundian', '回族彝族', '自治县', '530129', '0871', 13);
INSERT INTO `youbang_sys_area` VALUES (2729, '安宁', 405, 'a', 'an', 'anning', '', '市', '530181', '0871', 14);
INSERT INTO `youbang_sys_area` VALUES (2730, '麒麟', 406, 'q', 'ql', 'qilin', '', '区', '530302', '0874', 1);
INSERT INTO `youbang_sys_area` VALUES (2731, '马龙', 406, 'm', 'ml', 'malong', '', '县', '530321', '0874', 2);
INSERT INTO `youbang_sys_area` VALUES (2732, '陆良', 406, 'l', 'll', 'luliang', '', '县', '530322', '0874', 3);
INSERT INTO `youbang_sys_area` VALUES (2733, '师宗', 406, 's', 'sz', 'shizong', '', '县', '530323', '0874', 4);
INSERT INTO `youbang_sys_area` VALUES (2734, '罗平', 406, 'l', 'lp', 'luoping', '', '县', '530324', '0874', 5);
INSERT INTO `youbang_sys_area` VALUES (2735, '富源', 406, 'f', 'fy', 'fuyuan', '', '县', '530325', '0874', 6);
INSERT INTO `youbang_sys_area` VALUES (2736, '会泽', 406, 'h', 'hz', 'huize', '', '县', '530326', '0874', 7);
INSERT INTO `youbang_sys_area` VALUES (2737, '沾益', 406, 'z', 'zy', 'zhanyi', '', '区', '530328', '0874', 8);
INSERT INTO `youbang_sys_area` VALUES (2738, '宣威', 406, 'x', 'xw', 'xuanwei', '', '市', '530381', '0874', 9);
INSERT INTO `youbang_sys_area` VALUES (2739, '红塔', 407, 'h', 'ht', 'hongta', '', '区', '530402', '0877', 1);
INSERT INTO `youbang_sys_area` VALUES (2740, '江川', 407, 'j', 'jc', 'jiangchuan', '', '区', '530421', '0877', 2);
INSERT INTO `youbang_sys_area` VALUES (2741, '澄江', 407, 'c', 'cj', 'chengjiang', '', '县', '530422', '0877', 3);
INSERT INTO `youbang_sys_area` VALUES (2742, '通海', 407, 't', 'th', 'tonghai', '', '县', '530423', '0877', 4);
INSERT INTO `youbang_sys_area` VALUES (2743, '华宁', 407, 'h', 'hn', 'huaning', '', '县', '530424', '0877', 5);
INSERT INTO `youbang_sys_area` VALUES (2744, '易门', 407, 'y', 'ym', 'yimen', '', '县', '530425', '0877', 6);
INSERT INTO `youbang_sys_area` VALUES (2745, '峨山', 407, 'e', 'es', 'eshan', '彝族', '自治县', '530426', '0877', 7);
INSERT INTO `youbang_sys_area` VALUES (2746, '新平', 407, 'x', 'xp', 'xinping', '彝族傣族', '自治县', '530427', '0877', 8);
INSERT INTO `youbang_sys_area` VALUES (2747, '元江', 407, 'y', 'yj', 'yuanjiang', '哈尼族彝族傣族', '自治县', '530428', '0877', 9);
INSERT INTO `youbang_sys_area` VALUES (2748, '昭阳', 408, 'z', 'zy', 'zhaoyang', '', '区', '530602', '0870', 1);
INSERT INTO `youbang_sys_area` VALUES (2749, '鲁甸', 408, 'l', 'ld', 'ludian', '', '县', '530621', '0870', 2);
INSERT INTO `youbang_sys_area` VALUES (2750, '巧家', 408, 'q', 'qj', 'qiaojia', '', '县', '530622', '0870', 3);
INSERT INTO `youbang_sys_area` VALUES (2751, '盐津', 408, 'y', 'yj', 'yanjin', '', '县', '530623', '0870', 4);
INSERT INTO `youbang_sys_area` VALUES (2752, '大关', 408, 'd', 'dg', 'daguan', '', '县', '530624', '0870', 5);
INSERT INTO `youbang_sys_area` VALUES (2753, '永善', 408, 'y', 'ys', 'yongshan', '', '县', '530625', '0870', 6);
INSERT INTO `youbang_sys_area` VALUES (2754, '绥江', 408, 's', 'sj', 'suijiang', '', '县', '530626', '0870', 7);
INSERT INTO `youbang_sys_area` VALUES (2755, '镇雄', 408, 'z', 'zx', 'zhenxiong', '', '县', '530627', '0870', 8);
INSERT INTO `youbang_sys_area` VALUES (2756, '彝良', 408, 'y', 'yl', 'yiliang', '', '县', '530628', '0870', 9);
INSERT INTO `youbang_sys_area` VALUES (2757, '威信', 408, 'w', 'wx', 'weixin', '', '县', '530629', '0870', 10);
INSERT INTO `youbang_sys_area` VALUES (2758, '水富', 408, 's', 'sf', 'shuifu', '', '县', '530630', '0870', 11);
INSERT INTO `youbang_sys_area` VALUES (2759, '古城', 409, 'g', 'gc', 'gucheng', '', '区', '530702', '0888', 1);
INSERT INTO `youbang_sys_area` VALUES (2760, '玉龙', 409, 'y', 'yl', 'yulong', '纳西族', '自治县', '530721', '0888', 2);
INSERT INTO `youbang_sys_area` VALUES (2761, '永胜', 409, 'y', 'ys', 'yongsheng', '', '县', '530722', '0888', 3);
INSERT INTO `youbang_sys_area` VALUES (2762, '华坪', 409, 'h', 'hp', 'huaping', '', '县', '530723', '0888', 4);
INSERT INTO `youbang_sys_area` VALUES (2763, '宁蒗', 409, 'n', 'nl', 'ninglang', '彝族', '自治县', '530724', '0888', 5);
INSERT INTO `youbang_sys_area` VALUES (2764, '思茅', 410, 's', 'sm', 'simao', '', '区', '530802', '0879', 1);
INSERT INTO `youbang_sys_area` VALUES (2765, '宁洱', 410, 'n', 'ne', 'ninger', '哈尼族彝族', '县', '530821', '0879', 2);
INSERT INTO `youbang_sys_area` VALUES (2766, '墨江', 410, 'm', 'mj', 'mojiang', '哈尼族', '县', '530822', '0879', 3);
INSERT INTO `youbang_sys_area` VALUES (2767, '景东', 410, 'j', 'jd', 'jingdong', '彝族', '县', '530823', '0879', 4);
INSERT INTO `youbang_sys_area` VALUES (2768, '景谷', 410, 'j', 'jg', 'jinggu', '傣族彝族', '县', '530824', '0879', 5);
INSERT INTO `youbang_sys_area` VALUES (2769, '镇沅', 410, 'z', 'zy', 'zhenyuan', '彝族哈尼族拉祜族', '县', '530825', '0879', 6);
INSERT INTO `youbang_sys_area` VALUES (2770, '江城', 410, 'j', 'jc', 'jiangcheng', '哈尼族彝族', '县', '530826', '0879', 7);
INSERT INTO `youbang_sys_area` VALUES (2771, '孟连', 410, 'm', 'ml', 'menglian', '傣族拉祜族佤族', '县', '530827', '0879', 8);
INSERT INTO `youbang_sys_area` VALUES (2772, '澜沧', 410, 'l', 'lc', 'lancang', '拉祜族', '县', '530828', '0879', 9);
INSERT INTO `youbang_sys_area` VALUES (2773, '西盟', 410, 'x', 'xm', 'ximeng', '佤族', '县', '530829', '0879', 10);
INSERT INTO `youbang_sys_area` VALUES (2774, '临翔', 411, 'l', 'lx', 'linxiang', '', '区', '530902', '0883', 1);
INSERT INTO `youbang_sys_area` VALUES (2775, '凤庆', 411, 'f', 'fq', 'fengqing', '', '县', '530921', '0883', 2);
INSERT INTO `youbang_sys_area` VALUES (2776, '云县', 411, 'y', 'yx', 'yunxian', '', '', '530922', '0883', 3);
INSERT INTO `youbang_sys_area` VALUES (2777, '永德', 411, 'y', 'yd', 'yongde', '', '县', '530923', '0883', 4);
INSERT INTO `youbang_sys_area` VALUES (2778, '镇康', 411, 'z', 'zk', 'zhenkang', '', '县', '530924', '0883', 5);
INSERT INTO `youbang_sys_area` VALUES (2779, '双江', 411, 's', 'sj', 'shuangjiang', '拉祜族佤族布朗族傣族', '自治县', '530925', '0883', 6);
INSERT INTO `youbang_sys_area` VALUES (2780, '耿马', 411, 'g', 'gm', 'gengma', '傣族佤族', '自治县', '530926', '0883', 7);
INSERT INTO `youbang_sys_area` VALUES (2781, '沧源', 411, 'c', 'cy', 'cangyuan', '佤族', '自治县', '530927', '0883', 8);
INSERT INTO `youbang_sys_area` VALUES (2782, '楚雄', 412, 'c', 'cx', 'chuxiong', '', '市', '532301', '0878', 1);
INSERT INTO `youbang_sys_area` VALUES (2783, '双柏', 412, 's', 'sb', 'shuangbo', '', '县', '532322', '0878', 2);
INSERT INTO `youbang_sys_area` VALUES (2784, '牟定', 412, 'm', 'md', 'mouding', '', '县', '532323', '0878', 3);
INSERT INTO `youbang_sys_area` VALUES (2785, '南华', 412, 'n', 'nh', 'nanhua', '', '县', '532324', '0878', 4);
INSERT INTO `youbang_sys_area` VALUES (2786, '姚安', 412, 'y', 'ya', 'yaoan', '', '县', '532325', '0878', 5);
INSERT INTO `youbang_sys_area` VALUES (2787, '大姚', 412, 'd', 'dy', 'dayao', '', '县', '532326', '0878', 6);
INSERT INTO `youbang_sys_area` VALUES (2788, '永仁', 412, 'y', 'yr', 'yongren', '', '县', '532327', '0878', 7);
INSERT INTO `youbang_sys_area` VALUES (2789, '元谋', 412, 'y', 'ym', 'yuanmou', '', '县', '532328', '0878', 8);
INSERT INTO `youbang_sys_area` VALUES (2790, '武定', 412, 'w', 'wd', 'wuding', '', '县', '532329', '0878', 9);
INSERT INTO `youbang_sys_area` VALUES (2791, '禄丰', 412, 'l', 'lf', 'lufeng', '', '县', '532331', '0878', 10);
INSERT INTO `youbang_sys_area` VALUES (2792, '个旧', 413, 'g', 'gj', 'gejiu', '', '市', '532501', '0873', 1);
INSERT INTO `youbang_sys_area` VALUES (2793, '开远', 413, 'k', 'ky', 'kaiyuan', '', '市', '532502', '0873', 2);
INSERT INTO `youbang_sys_area` VALUES (2794, '蒙自', 413, 'm', 'mz', 'mengzi', '', '市', '532503', '0873', 3);
INSERT INTO `youbang_sys_area` VALUES (2795, '屏边', 413, 'p', 'pb', 'pingbian', '苗族', '自治县', '532523', '0873', 4);
INSERT INTO `youbang_sys_area` VALUES (2796, '建水', 413, 'j', 'js', 'jianshui', '', '县', '532524', '0873', 5);
INSERT INTO `youbang_sys_area` VALUES (2797, '石屏', 413, 's', 'sp', 'shiping', '', '县', '532525', '0873', 6);
INSERT INTO `youbang_sys_area` VALUES (2798, '弥勒', 413, 'm', 'ml', 'mile', '', '市', '532526', '0873', 7);
INSERT INTO `youbang_sys_area` VALUES (2799, '泸西', 413, 'l', 'lx', 'luxi', '', '县', '532527', '0873', 8);
INSERT INTO `youbang_sys_area` VALUES (2800, '元阳', 413, 'y', 'yy', 'yuanyang', '', '县', '532528', '0873', 9);
INSERT INTO `youbang_sys_area` VALUES (2801, '红河', 413, 'h', 'hh', 'honghe', '', '县', '532529', '0873', 10);
INSERT INTO `youbang_sys_area` VALUES (2802, '金平', 413, 'j', 'jp', 'jinping', '苗族瑶族傣族', '自治县', '532530', '0873', 11);
INSERT INTO `youbang_sys_area` VALUES (2803, '绿春', 413, 'l', 'lc', 'lu:chun', '', '县', '532531', '0873', 12);
INSERT INTO `youbang_sys_area` VALUES (2804, '河口', 413, 'h', 'hk', 'hekou', '瑶族', '自治县', '532532', '0873', 13);
INSERT INTO `youbang_sys_area` VALUES (2805, '文山', 414, 'w', 'ws', 'wenshan', '', '县', '532601', '0876', 1);
INSERT INTO `youbang_sys_area` VALUES (2806, '砚山', 414, 'y', 'ys', 'yanshan', '', '县', '532622', '0876', 2);
INSERT INTO `youbang_sys_area` VALUES (2807, '西畴', 414, 'x', 'xc', 'xichou', '', '县', '532623', '0876', 3);
INSERT INTO `youbang_sys_area` VALUES (2808, '麻栗坡', 414, 'm', 'mlp', 'malipo', '', '县', '532624', '0876', 4);
INSERT INTO `youbang_sys_area` VALUES (2809, '马关', 414, 'm', 'mg', 'maguan', '', '县', '532625', '0876', 5);
INSERT INTO `youbang_sys_area` VALUES (2810, '丘北', 414, 'q', 'qb', 'qiubei', '', '县', '532626', '0876', 6);
INSERT INTO `youbang_sys_area` VALUES (2811, '广南', 414, 'g', 'gn', 'guangnan', '', '县', '532627', '0876', 7);
INSERT INTO `youbang_sys_area` VALUES (2812, '富宁', 414, 'f', 'fn', 'funing', '', '县', '532628', '0876', 8);
INSERT INTO `youbang_sys_area` VALUES (2813, '景洪', 415, 'j', 'jh', 'jinghong', '', '市', '532801', '0691', 1);
INSERT INTO `youbang_sys_area` VALUES (2814, '勐海', 415, 'm', 'mh', 'menghai', '', '县', '532822', '0691', 2);
INSERT INTO `youbang_sys_area` VALUES (2815, '勐腊', 415, 'm', 'ml', 'mengla', '', '县', '532823', '0691', 3);
INSERT INTO `youbang_sys_area` VALUES (2816, '大理', 416, 'd', 'dl', 'dali', '', '市', '532901', '0872', 1);
INSERT INTO `youbang_sys_area` VALUES (2817, '漾濞', 416, 'y', 'yb', 'yangbi', '彝族', '自治县', '532922', '0872', 2);
INSERT INTO `youbang_sys_area` VALUES (2818, '祥云', 416, 'x', 'xy', 'xiangyun', '', '县', '532923', '0872', 3);
INSERT INTO `youbang_sys_area` VALUES (2819, '宾川', 416, 'b', 'bc', 'binchuan', '', '县', '532924', '0872', 4);
INSERT INTO `youbang_sys_area` VALUES (2820, '弥渡', 416, 'm', 'md', 'midu', '', '县', '532925', '0872', 5);
INSERT INTO `youbang_sys_area` VALUES (2821, '南涧', 416, 'n', 'nj', 'nanjian', '彝族', '自治县', '532926', '0872', 6);
INSERT INTO `youbang_sys_area` VALUES (2822, '巍山', 416, 'w', 'ws', 'weishan', '彝族回族', '自治县', '532927', '0872', 7);
INSERT INTO `youbang_sys_area` VALUES (2823, '永平', 416, 'y', 'yp', 'yongping', '', '县', '532928', '0872', 8);
INSERT INTO `youbang_sys_area` VALUES (2824, '云龙', 416, 'y', 'yl', 'yunlong', '', '县', '532929', '0872', 9);
INSERT INTO `youbang_sys_area` VALUES (2825, '洱源', 416, 'e', 'ey', 'eryuan', '', '县', '532930', '0872', 10);
INSERT INTO `youbang_sys_area` VALUES (2826, '剑川', 416, 'j', 'jc', 'jianchuan', '', '县', '532931', '0872', 11);
INSERT INTO `youbang_sys_area` VALUES (2827, '鹤庆', 416, 'h', 'hq', 'heqing', '', '县', '532932', '0872', 12);
INSERT INTO `youbang_sys_area` VALUES (2828, '瑞丽', 417, 'r', 'rl', 'ruili', '', '市', '533102', '0692', 1);
INSERT INTO `youbang_sys_area` VALUES (2829, '芒市', 417, 'm', 'ms', 'mangshi', '', '', '533103', '0692', 2);
INSERT INTO `youbang_sys_area` VALUES (2830, '梁河', 417, 'l', 'lh', 'lianghe', '', '县', '533122', '0692', 3);
INSERT INTO `youbang_sys_area` VALUES (2831, '盈江', 417, 'y', 'yj', 'yingjiang', '', '县', '533123', '0692', 4);
INSERT INTO `youbang_sys_area` VALUES (2832, '陇川', 417, 'l', 'lc', 'longchuan', '', '县', '533124', '0692', 5);
INSERT INTO `youbang_sys_area` VALUES (2833, '泸水', 418, 'l', 'ls', 'lushui', '', '市', '533321', '0886', 1);
INSERT INTO `youbang_sys_area` VALUES (2834, '福贡', 418, 'f', 'fg', 'fugong', '', '县', '533323', '0886', 2);
INSERT INTO `youbang_sys_area` VALUES (2835, '贡山', 418, 'g', 'gs', 'gongshan', '独龙族怒族', '县', '533324', '0886', 3);
INSERT INTO `youbang_sys_area` VALUES (2836, '兰坪', 418, 'l', 'lp', 'lanping', '白族普米族', '县', '533325', '0886', 4);
INSERT INTO `youbang_sys_area` VALUES (2837, '香格里拉', 419, 'x', 'xgll', 'xianggelila', '', '市', '533421', '0887', 1);
INSERT INTO `youbang_sys_area` VALUES (2838, '德钦', 419, 'd', 'dq', 'deqin', '', '县', '533422', '0887', 2);
INSERT INTO `youbang_sys_area` VALUES (2839, '维西', 419, 'w', 'wx', 'weixi', '', '县', '533423', '0887', 3);
INSERT INTO `youbang_sys_area` VALUES (2840, '隆阳', 420, 'l', 'ly', 'longyang', '', '区', '530502', '0875', 1);
INSERT INTO `youbang_sys_area` VALUES (2841, '施甸', 420, 's', 'sd', 'shidian', '', '县', '530521', '0875', 2);
INSERT INTO `youbang_sys_area` VALUES (2842, '腾冲', 420, 't', 'tc', 'tengchong', '', '市', '530522', '0875', 3);
INSERT INTO `youbang_sys_area` VALUES (2843, '龙陵', 420, 'l', 'll', 'longling', '', '县', '530523', '0875', 4);
INSERT INTO `youbang_sys_area` VALUES (2844, '昌宁', 420, 'c', 'cn', 'changning', '', '县', '530524', '0875', 5);
INSERT INTO `youbang_sys_area` VALUES (2845, '城关', 421, 'c', 'cg', 'chengguan', '', '区', '540102', '0891', 1);
INSERT INTO `youbang_sys_area` VALUES (2846, '林周', 421, 'l', 'lz', 'linzhou', '', '县', '540121', '0891', 2);
INSERT INTO `youbang_sys_area` VALUES (2847, '当雄', 421, 'd', 'dx', 'dangxiong', '', '县', '540122', '0891', 3);
INSERT INTO `youbang_sys_area` VALUES (2848, '尼木', 421, 'n', 'nm', 'nimu', '', '县', '540123', '0891', 4);
INSERT INTO `youbang_sys_area` VALUES (2849, '曲水', 421, 'q', 'qs', 'qushui', '', '县', '540124', '0891', 5);
INSERT INTO `youbang_sys_area` VALUES (2850, '堆龙德庆', 421, 'd', 'dldq', 'duilongdeqing', '', '区', '540125', '0891', 6);
INSERT INTO `youbang_sys_area` VALUES (2851, '达孜', 421, 'd', 'dz', 'dazi', '', '县', '540126', '0891', 7);
INSERT INTO `youbang_sys_area` VALUES (2852, '墨竹工卡', 421, 'm', 'mzgk', 'mozhugongka', '', '县', '540127', '0891', 8);
INSERT INTO `youbang_sys_area` VALUES (2853, '卡若', 422, 'k', 'kr', 'karuo', '', '区', '542121', '0895', 1);
INSERT INTO `youbang_sys_area` VALUES (2854, '江达', 422, 'j', 'jd', 'jiangda', '', '县', '542122', '0895', 2);
INSERT INTO `youbang_sys_area` VALUES (2855, '贡觉', 422, 'g', 'gj', 'gongjue', '', '县', '542123', '0895', 3);
INSERT INTO `youbang_sys_area` VALUES (2856, '类乌齐', 422, 'l', 'lwq', 'leiwuqi', '', '县', '542124', '0895', 4);
INSERT INTO `youbang_sys_area` VALUES (2857, '丁青', 422, 'd', 'dq', 'dingqing', '', '县', '542125', '0895', 5);
INSERT INTO `youbang_sys_area` VALUES (2858, '察雅', 422, 'c', 'cy', 'chaya', '', '县', '542126', '0895', 6);
INSERT INTO `youbang_sys_area` VALUES (2859, '八宿', 422, 'b', 'bs', 'basu', '', '县', '542127', '0895', 7);
INSERT INTO `youbang_sys_area` VALUES (2860, '左贡', 422, 'z', 'zg', 'zuogong', '', '县', '542128', '0895', 8);
INSERT INTO `youbang_sys_area` VALUES (2861, '芒康', 422, 'm', 'mk', 'mangkang', '', '县', '542129', '0895', 9);
INSERT INTO `youbang_sys_area` VALUES (2862, '洛隆', 422, 'l', 'll', 'luolong', '', '县', '542132', '0895', 10);
INSERT INTO `youbang_sys_area` VALUES (2863, '边坝', 422, 'b', 'bb', 'bianba', '', '县', '542133', '0895', 11);
INSERT INTO `youbang_sys_area` VALUES (2864, '乃东', 423, 'n', 'nd', 'naidong', '', '区', '542221', '0893', 1);
INSERT INTO `youbang_sys_area` VALUES (2865, '扎囊', 423, 'z', 'zn', 'zhanang', '', '县', '542222', '0893', 2);
INSERT INTO `youbang_sys_area` VALUES (2866, '贡嘎', 423, 'g', 'gg', 'gongga', '', '县', '542223', '0893', 3);
INSERT INTO `youbang_sys_area` VALUES (2867, '桑日', 423, 's', 'sr', 'sangri', '', '县', '542224', '0893', 4);
INSERT INTO `youbang_sys_area` VALUES (2868, '琼结', 423, 'q', 'qj', 'qiongjie', '', '县', '542225', '0893', 5);
INSERT INTO `youbang_sys_area` VALUES (2869, '曲松', 423, 'q', 'qs', 'qusong', '', '县', '542226', '0893', 6);
INSERT INTO `youbang_sys_area` VALUES (2870, '措美', 423, 'c', 'cm', 'cuomei', '', '县', '542227', '0893', 7);
INSERT INTO `youbang_sys_area` VALUES (2871, '洛扎', 423, 'l', 'lz', 'luozha', '', '县', '542228', '0893', 8);
INSERT INTO `youbang_sys_area` VALUES (2872, '加查', 423, 'j', 'jc', 'jiacha', '', '县', '542229', '0893', 9);
INSERT INTO `youbang_sys_area` VALUES (2873, '隆子', 423, 'l', 'lz', 'longzi', '', '县', '542231', '0893', 10);
INSERT INTO `youbang_sys_area` VALUES (2874, '错那', 423, 'c', 'cn', 'cuonei', '', '县', '542232', '0893', 11);
INSERT INTO `youbang_sys_area` VALUES (2875, '浪卡子', 423, 'l', 'lkz', 'langkazi', '', '县', '542233', '0893', 12);
INSERT INTO `youbang_sys_area` VALUES (2876, '桑珠孜', 424, 's', 'szz', 'sangzhuzi', '', '区', '542301', '0892', 1);
INSERT INTO `youbang_sys_area` VALUES (2877, '南木林', 424, 'n', 'nml', 'nanmulin', '', '县', '542322', '0892', 2);
INSERT INTO `youbang_sys_area` VALUES (2878, '江孜', 424, 'j', 'jz', 'jiangzi', '', '县', '542323', '0892', 3);
INSERT INTO `youbang_sys_area` VALUES (2879, '定日', 424, 'd', 'dr', 'dingri', '', '县', '542324', '0892', 4);
INSERT INTO `youbang_sys_area` VALUES (2880, '萨迦', 424, 's', 'sj', 'sajia', '', '县', '542325', '0892', 5);
INSERT INTO `youbang_sys_area` VALUES (2881, '拉孜', 424, 'l', 'lz', 'lazi', '', '县', '542326', '0892', 6);
INSERT INTO `youbang_sys_area` VALUES (2882, '昂仁', 424, 'a', 'ar', 'angren', '', '县', '542327', '0892', 7);
INSERT INTO `youbang_sys_area` VALUES (2883, '谢通门', 424, 'x', 'xtm', 'xietongmen', '', '县', '542328', '0892', 8);
INSERT INTO `youbang_sys_area` VALUES (2884, '白朗', 424, 'b', 'bl', 'bailang', '', '县', '542329', '0892', 9);
INSERT INTO `youbang_sys_area` VALUES (2885, '仁布', 424, 'r', 'rb', 'renbu', '', '县', '542330', '0892', 10);
INSERT INTO `youbang_sys_area` VALUES (2886, '康马', 424, 'k', 'km', 'kangma', '', '县', '542331', '0892', 11);
INSERT INTO `youbang_sys_area` VALUES (2887, '定结', 424, 'd', 'dj', 'dingjie', '', '县', '542332', '0892', 12);
INSERT INTO `youbang_sys_area` VALUES (2888, '仲巴', 424, 'z', 'zb', 'zhongba', '', '县', '542333', '0892', 13);
INSERT INTO `youbang_sys_area` VALUES (2889, '亚东', 424, 'y', 'yd', 'yadong', '', '县', '542334', '0892', 14);
INSERT INTO `youbang_sys_area` VALUES (2890, '吉隆', 424, 'j', 'jl', 'jilong', '', '县', '542335', '0892', 15);
INSERT INTO `youbang_sys_area` VALUES (2891, '聂拉木', 424, 'n', 'nlm', 'nielamu', '', '县', '542336', '0892', 16);
INSERT INTO `youbang_sys_area` VALUES (2892, '萨嘎', 424, 's', 'sg', 'saga', '', '县', '542337', '0892', 17);
INSERT INTO `youbang_sys_area` VALUES (2893, '岗巴', 424, 'g', 'gb', 'gangba', '', '县', '542338', '0892', 18);
INSERT INTO `youbang_sys_area` VALUES (2894, '双湖', 425, 's', 'sh', 'shuanghu', '', '县', '540630', '0896', 11);
INSERT INTO `youbang_sys_area` VALUES (2895, '色尼', 425, 's', 'sn', 'seni', '', '区', '540602', '0896', 1);
INSERT INTO `youbang_sys_area` VALUES (2896, '嘉黎', 425, 'j', 'jl', 'jiali', '', '县', '540621', '0896', 2);
INSERT INTO `youbang_sys_area` VALUES (2897, '比如', 425, 'b', 'br', 'biru', '', '县', '540622', '0896', 3);
INSERT INTO `youbang_sys_area` VALUES (2898, '聂荣', 425, 'n', 'nr', 'nierong', '', '县', '540623', '0896', 4);
INSERT INTO `youbang_sys_area` VALUES (2899, '安多', 425, 'a', 'ad', 'anduo', '', '县', '540624', '0896', 5);
INSERT INTO `youbang_sys_area` VALUES (2900, '申扎', 425, 's', 'sz', 'shenzha', '', '县', '540625', '0896', 6);
INSERT INTO `youbang_sys_area` VALUES (2901, '索县', 425, 's', 'sx', 'suoxian', '', '', '540626', '0896', 7);
INSERT INTO `youbang_sys_area` VALUES (2902, '班戈', 425, 'b', 'bg', 'bange', '', '县', '540627', '0896', 8);
INSERT INTO `youbang_sys_area` VALUES (2903, '巴青', 425, 'b', 'bq', 'baqing', '', '县', '540628', '0896', 9);
INSERT INTO `youbang_sys_area` VALUES (2904, '尼玛', 425, 'n', 'nm', 'nima', '', '县', '540629', '0896', 10);
INSERT INTO `youbang_sys_area` VALUES (2905, '普兰', 426, 'p', 'pl', 'pulan', '', '县', '542521', '0897', 1);
INSERT INTO `youbang_sys_area` VALUES (2906, '札达', 426, 'z', 'zd', 'zhada', '', '县', '542522', '0897', 2);
INSERT INTO `youbang_sys_area` VALUES (2907, '噶尔', 426, 'g', 'ge', 'gaer', '', '县', '542523', '0897', 3);
INSERT INTO `youbang_sys_area` VALUES (2908, '日土', 426, 'r', 'rt', 'ritu', '', '县', '542524', '0897', 4);
INSERT INTO `youbang_sys_area` VALUES (2909, '革吉', 426, 'g', 'gj', 'geji', '', '县', '542525', '0897', 5);
INSERT INTO `youbang_sys_area` VALUES (2910, '改则', 426, 'g', 'gz', 'gaize', '', '县', '542526', '0897', 6);
INSERT INTO `youbang_sys_area` VALUES (2911, '措勤', 426, 'c', 'cq', 'cuoqin', '', '县', '542527', '0897', 7);
INSERT INTO `youbang_sys_area` VALUES (2912, '巴宜', 427, 'b', 'by', 'bayi', '', '区', '540402', '0894', 1);
INSERT INTO `youbang_sys_area` VALUES (2913, '工布江达', 427, 'g', 'gbjd', 'gongbujiangda', '', '县', '542621', '0894', 2);
INSERT INTO `youbang_sys_area` VALUES (2914, '米林', 427, 'm', 'ml', 'milin', '', '县', '542621', '0894', 3);
INSERT INTO `youbang_sys_area` VALUES (2915, '墨脱', 427, 'm', 'mt', 'motuo', '', '县', '542621', '0894', 4);
INSERT INTO `youbang_sys_area` VALUES (2916, '波密', 427, 'b', 'bm', 'bomi', '', '县', '542621', '0894', 5);
INSERT INTO `youbang_sys_area` VALUES (2917, '察隅', 427, 'c', 'cy', 'chayu', '', '县', '542621', '0894', 6);
INSERT INTO `youbang_sys_area` VALUES (2918, '朗县', 427, 'l', 'lx', 'langxian', '', '', '542621', '0894', 7);
INSERT INTO `youbang_sys_area` VALUES (2919, '新城', 428, 'x', 'xc', 'xincheng', '', '区', '610102', '029', 1);
INSERT INTO `youbang_sys_area` VALUES (2920, '碑林', 428, 'b', 'bl', 'beilin', '', '区', '610103', '029', 2);
INSERT INTO `youbang_sys_area` VALUES (2921, '莲湖', 428, 'l', 'lh', 'lianhu', '', '区', '610104', '029', 3);
INSERT INTO `youbang_sys_area` VALUES (2922, '灞桥', 428, 'b', 'bq', 'baqiao', '', '区', '610111', '029', 4);
INSERT INTO `youbang_sys_area` VALUES (2923, '未央', 428, 'w', 'wy', 'weiyang', '', '区', '610112', '029', 5);
INSERT INTO `youbang_sys_area` VALUES (2924, '雁塔', 428, 'y', 'yt', 'yanta', '', '区', '610113', '029', 6);
INSERT INTO `youbang_sys_area` VALUES (2925, '阎良', 428, 'y', 'yl', 'yanliang', '', '区', '610114', '029', 7);
INSERT INTO `youbang_sys_area` VALUES (2926, '临潼', 428, 'l', 'lt', 'lintong', '', '区', '610115', '029', 8);
INSERT INTO `youbang_sys_area` VALUES (2927, '长安', 428, 'c', 'ca', 'changan', '', '区', '610116', '029', 9);
INSERT INTO `youbang_sys_area` VALUES (2928, '蓝田', 428, 'l', 'lt', 'lantian', '', '县', '610122', '029', 11);
INSERT INTO `youbang_sys_area` VALUES (2929, '周至', 428, 'z', 'zz', 'zhouzhi', '', '县', '610124', '029', 12);
INSERT INTO `youbang_sys_area` VALUES (2930, '鄠邑', 428, 'h', 'hy', 'huyi', '', '区', '610125', '029', 13);
INSERT INTO `youbang_sys_area` VALUES (2931, '高陵', 428, 'g', 'gl', 'gaoling', '', '区', '610117', '029', 10);
INSERT INTO `youbang_sys_area` VALUES (2932, '王益', 429, 'w', 'wy', 'wangyi', '', '区', '610202', '0919', 1);
INSERT INTO `youbang_sys_area` VALUES (2933, '印台', 429, 'y', 'yt', 'yintai', '', '区', '610203', '0919', 2);
INSERT INTO `youbang_sys_area` VALUES (2934, '耀州', 429, 'y', 'yz', 'yaozhou', '', '区', '610204', '0919', 3);
INSERT INTO `youbang_sys_area` VALUES (2935, '宜君', 429, 'y', 'yj', 'yijun', '', '县', '610222', '0919', 4);
INSERT INTO `youbang_sys_area` VALUES (2936, '渭滨', 430, 'w', 'wb', 'weibin', '', '区', '610302', '0917', 1);
INSERT INTO `youbang_sys_area` VALUES (2937, '金台', 430, 'j', 'jt', 'jintai', '', '区', '610303', '0917', 2);
INSERT INTO `youbang_sys_area` VALUES (2938, '陈仓', 430, 'c', 'cc', 'chencang', '', '区', '610304', '0917', 3);
INSERT INTO `youbang_sys_area` VALUES (2939, '凤翔', 430, 'f', 'fx', 'fengxiang', '', '县', '610322', '0917', 4);
INSERT INTO `youbang_sys_area` VALUES (2940, '岐山', 430, 'q', 'qs', 'qishan', '', '县', '610323', '0917', 5);
INSERT INTO `youbang_sys_area` VALUES (2941, '扶风', 430, 'f', 'ff', 'fufeng', '', '县', '610324', '0917', 6);
INSERT INTO `youbang_sys_area` VALUES (2942, '眉县', 430, 'm', 'mx', 'meixian', '', '', '610326', '0917', 7);
INSERT INTO `youbang_sys_area` VALUES (2943, '陇县', 430, 'l', 'lx', 'longxian', '', '', '610327', '0917', 8);
INSERT INTO `youbang_sys_area` VALUES (2944, '千阳', 430, 'q', 'qy', 'qianyang', '', '县', '610328', '0917', 9);
INSERT INTO `youbang_sys_area` VALUES (2945, '麟游', 430, 'l', 'ly', 'linyou', '', '县', '610329', '0917', 10);
INSERT INTO `youbang_sys_area` VALUES (2946, '凤县', 430, 'f', 'fx', 'fengxian', '', '', '610330', '0917', 11);
INSERT INTO `youbang_sys_area` VALUES (2947, '太白', 430, 't', 'tb', 'taibai', '', '县', '610331', '0917', 12);
INSERT INTO `youbang_sys_area` VALUES (2948, '秦都', 431, 'q', 'qd', 'qindu', '', '区', '610402', '029', 1);
INSERT INTO `youbang_sys_area` VALUES (2949, '杨陵', 431, 'y', 'yl', 'yangling', '', '区', '610403', '029', 2);
INSERT INTO `youbang_sys_area` VALUES (2950, '渭城', 431, 'w', 'wc', 'weicheng', '', '区', '610404', '029', 3);
INSERT INTO `youbang_sys_area` VALUES (2951, '三原', 431, 's', 'sy', 'sanyuan', '', '县', '610422', '029', 4);
INSERT INTO `youbang_sys_area` VALUES (2952, '泾阳', 431, 'j', 'jy', 'jingyang', '', '县', '610423', '029', 5);
INSERT INTO `youbang_sys_area` VALUES (2953, '乾县', 431, 'q', 'qx', 'qianxian', '', '', '610424', '029', 6);
INSERT INTO `youbang_sys_area` VALUES (2954, '礼泉', 431, 'l', 'lq', 'liquan', '', '县', '610425', '029', 7);
INSERT INTO `youbang_sys_area` VALUES (2955, '永寿', 431, 'y', 'ys', 'yongshou', '', '县', '610426', '029', 8);
INSERT INTO `youbang_sys_area` VALUES (2956, '彬县', 431, 'b', 'bx', 'binxian', '', '', '610427', '029', 9);
INSERT INTO `youbang_sys_area` VALUES (2957, '长武', 431, 'c', 'cw', 'changwu', '', '县', '610428', '029', 10);
INSERT INTO `youbang_sys_area` VALUES (2958, '旬邑', 431, 'x', 'xy', 'xunyi', '', '县', '610429', '029', 11);
INSERT INTO `youbang_sys_area` VALUES (2959, '淳化', 431, 'c', 'ch', 'chunhua', '', '县', '610430', '029', 12);
INSERT INTO `youbang_sys_area` VALUES (2960, '武功', 431, 'w', 'wg', 'wugong', '', '县', '610431', '029', 13);
INSERT INTO `youbang_sys_area` VALUES (2961, '兴平', 431, 'x', 'xp', 'xingping', '', '市', '610481', '029', 14);
INSERT INTO `youbang_sys_area` VALUES (2962, '临渭', 432, 'l', 'lw', 'linwei', '', '区', '610502', '0913', 1);
INSERT INTO `youbang_sys_area` VALUES (2963, '华州', 432, 'h', 'hz', 'huazhou', '', '区', '610521', '0913', 2);
INSERT INTO `youbang_sys_area` VALUES (2964, '潼关', 432, 't', 'tg', 'tongguan', '', '县', '610522', '0913', 3);
INSERT INTO `youbang_sys_area` VALUES (2965, '大荔', 432, 'd', 'dl', 'dali', '', '县', '610523', '0913', 4);
INSERT INTO `youbang_sys_area` VALUES (2966, '合阳', 432, 'h', 'hy', 'heyang', '', '县', '610524', '0913', 5);
INSERT INTO `youbang_sys_area` VALUES (2967, '澄城', 432, 'c', 'cc', 'chengcheng', '', '县', '610525', '0913', 6);
INSERT INTO `youbang_sys_area` VALUES (2968, '蒲城', 432, 'p', 'pc', 'pucheng', '', '县', '610526', '0913', 7);
INSERT INTO `youbang_sys_area` VALUES (2969, '白水', 432, 'b', 'bs', 'baishui', '', '县', '610527', '0913', 8);
INSERT INTO `youbang_sys_area` VALUES (2970, '富平', 432, 'f', 'fp', 'fuping', '', '县', '610528', '0913', 9);
INSERT INTO `youbang_sys_area` VALUES (2971, '韩城', 432, 'h', 'hc', 'hancheng', '', '市', '610581', '0913', 10);
INSERT INTO `youbang_sys_area` VALUES (2972, '华阴', 432, 'h', 'hy', 'huayin', '', '市', '610582', '0913', 11);
INSERT INTO `youbang_sys_area` VALUES (2973, '宝塔', 433, 'b', 'bt', 'baota', '', '区', '610602', '0911', 1);
INSERT INTO `youbang_sys_area` VALUES (2974, '延长', 433, 'y', 'yc', 'yanchang', '', '县', '610621', '0911', 2);
INSERT INTO `youbang_sys_area` VALUES (2975, '延川', 433, 'y', 'yc', 'yanchuan', '', '县', '610622', '0911', 3);
INSERT INTO `youbang_sys_area` VALUES (2976, '子长', 433, 'z', 'zc', 'zichang', '', '县', '610623', '0911', 4);
INSERT INTO `youbang_sys_area` VALUES (2977, '安塞', 433, 'a', 'as', 'ansai', '', '区', '610624', '0911', 5);
INSERT INTO `youbang_sys_area` VALUES (2978, '志丹', 433, 'z', 'zd', 'zhidan', '', '县', '610625', '0911', 6);
INSERT INTO `youbang_sys_area` VALUES (2979, '吴起', 433, 'w', 'wq', 'wuqi', '', '县', '610626', '0911', 7);
INSERT INTO `youbang_sys_area` VALUES (2980, '甘泉', 433, 'g', 'gq', 'ganquan', '', '县', '610627', '0911', 8);
INSERT INTO `youbang_sys_area` VALUES (2981, '富县', 433, 'f', 'fx', 'fuxian', '', '', '610628', '0911', 9);
INSERT INTO `youbang_sys_area` VALUES (2982, '洛川', 433, 'l', 'lc', 'luochuan', '', '县', '610629', '0911', 10);
INSERT INTO `youbang_sys_area` VALUES (2983, '宜川', 433, 'y', 'yc', 'yichuan', '', '县', '610630', '0911', 11);
INSERT INTO `youbang_sys_area` VALUES (2984, '黄龙', 433, 'h', 'hl', 'huanglong', '', '县', '610631', '0911', 12);
INSERT INTO `youbang_sys_area` VALUES (2985, '黄陵', 433, 'h', 'hl', 'huangling', '', '县', '610632', '0911', 13);
INSERT INTO `youbang_sys_area` VALUES (2986, '汉台', 434, 'h', 'ht', 'hantai', '', '区', '610702', '0916', 1);
INSERT INTO `youbang_sys_area` VALUES (2987, '南郑', 434, 'n', 'nz', 'nanzheng', '', '县', '610721', '0916', 2);
INSERT INTO `youbang_sys_area` VALUES (2988, '城固', 434, 'c', 'cg', 'chenggu', '', '县', '610722', '0916', 3);
INSERT INTO `youbang_sys_area` VALUES (2989, '洋县', 434, 'y', 'yx', 'yangxian', '', '', '610723', '0916', 4);
INSERT INTO `youbang_sys_area` VALUES (2990, '西乡', 434, 'x', 'xx', 'xixiang', '', '县', '610724', '0916', 5);
INSERT INTO `youbang_sys_area` VALUES (2991, '勉县', 434, 'm', 'mx', 'mianxian', '', '', '610725', '0916', 6);
INSERT INTO `youbang_sys_area` VALUES (2992, '宁强', 434, 'n', 'nq', 'ningqiang', '', '县', '610726', '0916', 7);
INSERT INTO `youbang_sys_area` VALUES (2993, '略阳', 434, 'l', 'ly', 'lu:eyang', '', '县', '610727', '0916', 8);
INSERT INTO `youbang_sys_area` VALUES (2994, '镇巴', 434, 'z', 'zb', 'zhenba', '', '县', '610728', '0916', 9);
INSERT INTO `youbang_sys_area` VALUES (2995, '留坝', 434, 'l', 'lb', 'liuba', '', '县', '610729', '0916', 10);
INSERT INTO `youbang_sys_area` VALUES (2996, '佛坪', 434, 'f', 'fp', 'foping', '', '县', '610730', '0916', 11);
INSERT INTO `youbang_sys_area` VALUES (2997, '榆阳', 435, 'y', 'yy', 'yuyang', '', '区', '610802', '0912', 1);
INSERT INTO `youbang_sys_area` VALUES (2998, '神木', 435, 's', 'sm', 'shenmu', '', '县', '610821', '0912', 2);
INSERT INTO `youbang_sys_area` VALUES (2999, '府谷', 435, 'f', 'fg', 'fugu', '', '县', '610822', '0912', 3);
INSERT INTO `youbang_sys_area` VALUES (3000, '横山', 435, 'h', 'hs', 'hengshan', '', '区', '610823', '0912', 4);
INSERT INTO `youbang_sys_area` VALUES (3001, '靖边', 435, 'j', 'jb', 'jingbian', '', '县', '610824', '0912', 5);
INSERT INTO `youbang_sys_area` VALUES (3002, '定边', 435, 'd', 'db', 'dingbian', '', '县', '610825', '0912', 6);
INSERT INTO `youbang_sys_area` VALUES (3003, '绥德', 435, 's', 'sd', 'suide', '', '县', '610826', '0912', 7);
INSERT INTO `youbang_sys_area` VALUES (3004, '米脂', 435, 'm', 'mz', 'mizhi', '', '县', '610827', '0912', 8);
INSERT INTO `youbang_sys_area` VALUES (3005, '佳县', 435, 'j', 'jx', 'jiaxian', '', '', '610828', '0912', 9);
INSERT INTO `youbang_sys_area` VALUES (3006, '吴堡', 435, 'w', 'wb', 'wubao', '', '县', '610829', '0912', 10);
INSERT INTO `youbang_sys_area` VALUES (3007, '清涧', 435, 'q', 'qj', 'qingjian', '', '县', '610830', '0912', 11);
INSERT INTO `youbang_sys_area` VALUES (3008, '子洲', 435, 'z', 'zz', 'zizhou', '', '县', '610831', '0912', 12);
INSERT INTO `youbang_sys_area` VALUES (3009, '汉滨', 436, 'h', 'hb', 'hanbin', '', '区', '610902', '0915', 1);
INSERT INTO `youbang_sys_area` VALUES (3010, '汉阴', 436, 'h', 'hy', 'hanyin', '', '县', '610921', '0915', 2);
INSERT INTO `youbang_sys_area` VALUES (3011, '石泉', 436, 's', 'sq', 'shiquan', '', '县', '610922', '0915', 3);
INSERT INTO `youbang_sys_area` VALUES (3012, '宁陕', 436, 'n', 'ns', 'ningshan', '', '县', '610923', '0915', 4);
INSERT INTO `youbang_sys_area` VALUES (3013, '紫阳', 436, 'z', 'zy', 'ziyang', '', '县', '610924', '0915', 5);
INSERT INTO `youbang_sys_area` VALUES (3014, '岚皋', 436, 'l', 'lg', 'langao', '', '县', '610925', '0915', 6);
INSERT INTO `youbang_sys_area` VALUES (3015, '平利', 436, 'p', 'pl', 'pingli', '', '县', '610926', '0915', 7);
INSERT INTO `youbang_sys_area` VALUES (3016, '镇坪', 436, 'z', 'zp', 'zhenping', '', '县', '610927', '0915', 8);
INSERT INTO `youbang_sys_area` VALUES (3017, '旬阳', 436, 'x', 'xy', 'xunyang', '', '县', '610928', '0915', 9);
INSERT INTO `youbang_sys_area` VALUES (3018, '白河', 436, 'b', 'bh', 'baihe', '', '县', '610929', '0915', 10);
INSERT INTO `youbang_sys_area` VALUES (3019, '商州', 437, 's', 'sz', 'shangzhou', '', '区', '611002', '0914', 1);
INSERT INTO `youbang_sys_area` VALUES (3020, '洛南', 437, 'l', 'ln', 'luonan', '', '县', '611021', '0914', 2);
INSERT INTO `youbang_sys_area` VALUES (3021, '丹凤', 437, 'd', 'df', 'danfeng', '', '县', '611022', '0914', 3);
INSERT INTO `youbang_sys_area` VALUES (3022, '商南', 437, 's', 'sn', 'shangnan', '', '县', '611023', '0914', 4);
INSERT INTO `youbang_sys_area` VALUES (3023, '山阳', 437, 's', 'sy', 'shanyang', '', '县', '611024', '0914', 5);
INSERT INTO `youbang_sys_area` VALUES (3024, '镇安', 437, 'z', 'za', 'zhenan', '', '县', '611025', '0914', 6);
INSERT INTO `youbang_sys_area` VALUES (3025, '柞水', 437, 'z', 'zs', 'zuoshui', '', '县', '611026', '0914', 7);
INSERT INTO `youbang_sys_area` VALUES (3026, '城关', 438, 'c', 'cg', 'chengguan', '', '区', '620102', '0931', 1);
INSERT INTO `youbang_sys_area` VALUES (3027, '七里河', 438, 'q', 'qlh', 'qilihe', '', '区', '620103', '0931', 2);
INSERT INTO `youbang_sys_area` VALUES (3028, '西固', 438, 'x', 'xg', 'xigu', '', '区', '620104', '0931', 3);
INSERT INTO `youbang_sys_area` VALUES (3029, '安宁', 438, 'a', 'an', 'anning', '', '区', '620105', '0931', 4);
INSERT INTO `youbang_sys_area` VALUES (3030, '红古', 438, 'h', 'hg', 'honggu', '', '区', '620111', '0931', 5);
INSERT INTO `youbang_sys_area` VALUES (3031, '永登', 438, 'y', 'yd', 'yongdeng', '', '县', '620121', '0931', 6);
INSERT INTO `youbang_sys_area` VALUES (3032, '皋兰', 438, 'g', 'gl', 'gaolan', '', '县', '620122', '0931', 7);
INSERT INTO `youbang_sys_area` VALUES (3033, '榆中', 438, 'y', 'yz', 'yuzhong', '', '县', '620123', '0931', 8);
INSERT INTO `youbang_sys_area` VALUES (3034, '镜铁', 439, 'j', 'jt', 'jingtie', '', '区', '620201', '0937', 1);
INSERT INTO `youbang_sys_area` VALUES (3035, '长城', 439, 'c', 'cc', 'changcheng', '', '区', '620201', '0937', 2);
INSERT INTO `youbang_sys_area` VALUES (3036, '雄关', 439, 'x', 'xg', 'xiongguan', '', '区', '620201', '0937', 3);
INSERT INTO `youbang_sys_area` VALUES (3037, '金川', 440, 'j', 'jc', 'jinchuan', '', '区', '620302', '0935', 1);
INSERT INTO `youbang_sys_area` VALUES (3038, '永昌', 440, 'y', 'yc', 'yongchang', '', '县', '620321', '0935', 2);
INSERT INTO `youbang_sys_area` VALUES (3039, '白银', 441, 'b', 'by', 'baiyin', '', '区', '620402', '0943', 1);
INSERT INTO `youbang_sys_area` VALUES (3040, '平川', 441, 'p', 'pc', 'pingchuan', '', '区', '620403', '0943', 2);
INSERT INTO `youbang_sys_area` VALUES (3041, '靖远', 441, 'j', 'jy', 'jingyuan', '', '县', '620421', '0943', 3);
INSERT INTO `youbang_sys_area` VALUES (3042, '会宁', 441, 'h', 'hn', 'huining', '', '县', '620422', '0943', 4);
INSERT INTO `youbang_sys_area` VALUES (3043, '景泰', 441, 'j', 'jt', 'jingtai', '', '县', '620423', '0943', 5);
INSERT INTO `youbang_sys_area` VALUES (3044, '秦州', 442, 'q', 'qz', 'qinzhou', '', '区', '620502', '0938', 1);
INSERT INTO `youbang_sys_area` VALUES (3045, '麦积', 442, 'm', 'mj', 'maiji', '', '区', '620503', '0938', 2);
INSERT INTO `youbang_sys_area` VALUES (3046, '清水', 442, 'q', 'qs', 'qingshui', '', '县', '620521', '0938', 3);
INSERT INTO `youbang_sys_area` VALUES (3047, '秦安', 442, 'q', 'qa', 'qinan', '', '县', '620522', '0938', 4);
INSERT INTO `youbang_sys_area` VALUES (3048, '甘谷', 442, 'g', 'gg', 'gangu', '', '县', '620523', '0938', 5);
INSERT INTO `youbang_sys_area` VALUES (3049, '武山', 442, 'w', 'ws', 'wushan', '', '县', '620524', '0938', 6);
INSERT INTO `youbang_sys_area` VALUES (3050, '张家川', 442, 'z', 'zjc', 'zhangjiachuan', '回族', '自治县', '620525', '0938', 7);
INSERT INTO `youbang_sys_area` VALUES (3051, '凉州', 443, 'l', 'lz', 'liangzhou', '', '区', '620602', '0935', 1);
INSERT INTO `youbang_sys_area` VALUES (3052, '民勤', 443, 'm', 'mq', 'minqin', '', '县', '620621', '0935', 2);
INSERT INTO `youbang_sys_area` VALUES (3053, '古浪', 443, 'g', 'gl', 'gulang', '', '县', '620622', '0935', 3);
INSERT INTO `youbang_sys_area` VALUES (3054, '天祝', 443, 't', 'tz', 'tianzhu', '藏族', '自治县', '620623', '0935', 4);
INSERT INTO `youbang_sys_area` VALUES (3055, '甘州', 444, 'g', 'gz', 'ganzhou', '', '区', '620702', '0936', 1);
INSERT INTO `youbang_sys_area` VALUES (3056, '肃南', 444, 's', 'sn', 'sunan', '裕固族', '自治县', '620721', '0936', 2);
INSERT INTO `youbang_sys_area` VALUES (3057, '民乐', 444, 'm', 'ml', 'minle', '', '县', '620722', '0936', 3);
INSERT INTO `youbang_sys_area` VALUES (3058, '临泽', 444, 'l', 'lz', 'linze', '', '县', '620723', '0936', 4);
INSERT INTO `youbang_sys_area` VALUES (3059, '高台', 444, 'g', 'gt', 'gaotai', '', '县', '620724', '0936', 5);
INSERT INTO `youbang_sys_area` VALUES (3060, '山丹', 444, 's', 'sd', 'shandan', '', '县', '620725', '0936', 6);
INSERT INTO `youbang_sys_area` VALUES (3061, '崆峒', 445, 'k', 'kt', 'kongtong', '', '区', '620802', '0933', 1);
INSERT INTO `youbang_sys_area` VALUES (3062, '泾川', 445, 'j', 'jc', 'jingchuan', '', '县', '620821', '0933', 2);
INSERT INTO `youbang_sys_area` VALUES (3063, '灵台', 445, 'l', 'lt', 'lingtai', '', '县', '620822', '0933', 3);
INSERT INTO `youbang_sys_area` VALUES (3064, '崇信', 445, 'c', 'cx', 'chongxin', '', '县', '620823', '0933', 4);
INSERT INTO `youbang_sys_area` VALUES (3065, '华亭', 445, 'h', 'ht', 'huating', '', '县', '620824', '0933', 5);
INSERT INTO `youbang_sys_area` VALUES (3066, '庄浪', 445, 'z', 'zl', 'zhuanglang', '', '县', '620825', '0933', 6);
INSERT INTO `youbang_sys_area` VALUES (3067, '静宁', 445, 'j', 'jn', 'jingning', '', '县', '620826', '0933', 7);
INSERT INTO `youbang_sys_area` VALUES (3068, '肃州', 446, 's', 'sz', 'suzhou', '', '区', '620902', '0937', 1);
INSERT INTO `youbang_sys_area` VALUES (3069, '金塔', 446, 'j', 'jt', 'jinta', '', '县', '620921', '0937', 2);
INSERT INTO `youbang_sys_area` VALUES (3070, '瓜州', 446, 'g', 'gz', 'guazhou', '', '县', '620922', '0937', 3);
INSERT INTO `youbang_sys_area` VALUES (3071, '肃北', 446, 's', 'sb', 'subei', '蒙古族', '自治县', '620923', '0937', 4);
INSERT INTO `youbang_sys_area` VALUES (3072, '阿克塞', 446, 'a', 'aks', 'akesai', '哈萨克族', '自治县', '620924', '0937', 5);
INSERT INTO `youbang_sys_area` VALUES (3073, '玉门', 446, 'y', 'ym', 'yumen', '', '市', '620981', '0937', 6);
INSERT INTO `youbang_sys_area` VALUES (3074, '敦煌', 446, 'd', 'dh', 'dunhuang', '', '市', '620982', '0937', 7);
INSERT INTO `youbang_sys_area` VALUES (3075, '西峰', 447, 'x', 'xf', 'xifeng', '', '区', '621002', '0934', 1);
INSERT INTO `youbang_sys_area` VALUES (3076, '庆城', 447, 'q', 'qc', 'qingcheng', '', '县', '621021', '0934', 2);
INSERT INTO `youbang_sys_area` VALUES (3077, '环县', 447, 'h', 'hx', 'huanxian', '', '', '621022', '0934', 3);
INSERT INTO `youbang_sys_area` VALUES (3078, '华池', 447, 'h', 'hc', 'huachi', '', '县', '621023', '0934', 4);
INSERT INTO `youbang_sys_area` VALUES (3079, '合水', 447, 'h', 'hs', 'heshui', '', '县', '621024', '0934', 5);
INSERT INTO `youbang_sys_area` VALUES (3080, '正宁', 447, 'z', 'zn', 'zhengning', '', '县', '621025', '0934', 6);
INSERT INTO `youbang_sys_area` VALUES (3081, '宁县', 447, 'n', 'nx', 'ningxian', '', '', '621026', '0934', 7);
INSERT INTO `youbang_sys_area` VALUES (3082, '镇原', 447, 'z', 'zy', 'zhenyuan', '', '县', '621027', '0934', 8);
INSERT INTO `youbang_sys_area` VALUES (3083, '安定', 448, 'a', 'ad', 'anding', '', '区', '621102', '0932', 1);
INSERT INTO `youbang_sys_area` VALUES (3084, '通渭', 448, 't', 'tw', 'tongwei', '', '县', '621121', '0932', 2);
INSERT INTO `youbang_sys_area` VALUES (3085, '陇西', 448, 'l', 'lx', 'longxi', '', '县', '621122', '0932', 3);
INSERT INTO `youbang_sys_area` VALUES (3086, '渭源', 448, 'w', 'wy', 'weiyuan', '', '县', '621123', '0932', 4);
INSERT INTO `youbang_sys_area` VALUES (3087, '临洮', 448, 'l', 'lt', 'lintao', '', '县', '621124', '0932', 5);
INSERT INTO `youbang_sys_area` VALUES (3088, '漳县', 448, 'z', 'zx', 'zhangxian', '', '', '621125', '0932', 6);
INSERT INTO `youbang_sys_area` VALUES (3089, '岷县', 448, 'm', 'mx', 'minxian', '', '', '621126', '0932', 7);
INSERT INTO `youbang_sys_area` VALUES (3090, '武都', 449, 'w', 'wd', 'wudu', '', '区', '621202', '0939', 1);
INSERT INTO `youbang_sys_area` VALUES (3091, '成县', 449, 'c', 'cx', 'chengxian', '', '', '621221', '0939', 2);
INSERT INTO `youbang_sys_area` VALUES (3092, '文县', 449, 'w', 'wx', 'wenxian', '', '', '621222', '0939', 3);
INSERT INTO `youbang_sys_area` VALUES (3093, '宕昌', 449, 'd', 'dc', 'dangchang', '', '县', '621223', '0939', 4);
INSERT INTO `youbang_sys_area` VALUES (3094, '康县', 449, 'k', 'kx', 'kangxian', '', '', '621224', '0939', 5);
INSERT INTO `youbang_sys_area` VALUES (3095, '西和', 449, 'x', 'xh', 'xihe', '', '县', '621225', '0939', 6);
INSERT INTO `youbang_sys_area` VALUES (3096, '礼县', 449, 'l', 'lx', 'lixian', '', '', '621226', '0939', 7);
INSERT INTO `youbang_sys_area` VALUES (3097, '徽县', 449, 'h', 'hx', 'huixian', '', '', '621227', '0939', 8);
INSERT INTO `youbang_sys_area` VALUES (3098, '两当', 449, 'l', 'ld', 'liangdang', '', '县', '621228', '0939', 9);
INSERT INTO `youbang_sys_area` VALUES (3099, '临夏', 450, 'l', 'lx', 'linxia', '', '市', '622901', '0930', 1);
INSERT INTO `youbang_sys_area` VALUES (3100, '临夏', 450, 'l', 'lx', 'linxia', '', '县', '622921', '0930', 2);
INSERT INTO `youbang_sys_area` VALUES (3101, '康乐', 450, 'k', 'kl', 'kangle', '', '县', '622922', '0930', 3);
INSERT INTO `youbang_sys_area` VALUES (3102, '永靖', 450, 'y', 'yj', 'yongjing', '', '县', '622923', '0930', 4);
INSERT INTO `youbang_sys_area` VALUES (3103, '广河', 450, 'g', 'gh', 'guanghe', '', '县', '622924', '0930', 5);
INSERT INTO `youbang_sys_area` VALUES (3104, '和政', 450, 'h', 'hz', 'hezheng', '', '县', '622925', '0930', 6);
INSERT INTO `youbang_sys_area` VALUES (3105, '东乡族', 450, 'd', 'dxz', 'dongxiangzu', '', '自治县', '622926', '0930', 7);
INSERT INTO `youbang_sys_area` VALUES (3106, '积石山', 450, 'j', 'jss', 'jishishan', '保安族东乡族撒拉族', '自治县', '622927', '0930', 8);
INSERT INTO `youbang_sys_area` VALUES (3107, '合作', 451, 'h', 'hz', 'hezuo', '', '市', '623001', '0941', 1);
INSERT INTO `youbang_sys_area` VALUES (3108, '临潭', 451, 'l', 'lt', 'lintan', '', '县', '623021', '0941', 2);
INSERT INTO `youbang_sys_area` VALUES (3109, '卓尼', 451, 'z', 'zn', 'zhuoni', '', '县', '623022', '0941', 3);
INSERT INTO `youbang_sys_area` VALUES (3110, '舟曲', 451, 'z', 'zq', 'zhouqu', '', '县', '623023', '0941', 4);
INSERT INTO `youbang_sys_area` VALUES (3111, '迭部', 451, 'd', 'db', 'diebu', '', '县', '623024', '0941', 5);
INSERT INTO `youbang_sys_area` VALUES (3112, '玛曲', 451, 'm', 'mq', 'maqu', '', '县', '623025', '0941', 6);
INSERT INTO `youbang_sys_area` VALUES (3113, '碌曲', 451, 'l', 'lq', 'liuqu', '', '县', '623026', '0941', 7);
INSERT INTO `youbang_sys_area` VALUES (3114, '夏河', 451, 'x', 'xh', 'xiahe', '', '县', '623027', '0941', 8);
INSERT INTO `youbang_sys_area` VALUES (3115, '城东', 452, 'c', 'cd', 'chengdong', '', '区', '630102', '0971', 1);
INSERT INTO `youbang_sys_area` VALUES (3116, '城中', 452, 'c', 'cz', 'chengzhong', '', '区', '630103', '0971', 2);
INSERT INTO `youbang_sys_area` VALUES (3117, '城西', 452, 'c', 'cx', 'chengxi', '', '区', '630104', '0971', 3);
INSERT INTO `youbang_sys_area` VALUES (3118, '城北', 452, 'c', 'cb', 'chengbei', '', '区', '630105', '0971', 4);
INSERT INTO `youbang_sys_area` VALUES (3119, '大通', 452, 'd', 'dt', 'datong', '回族土族', '自治县', '630121', '0971', 5);
INSERT INTO `youbang_sys_area` VALUES (3120, '湟中', 452, 'h', 'hz', 'huangzhong', '', '县', '630122', '0971', 6);
INSERT INTO `youbang_sys_area` VALUES (3121, '湟源', 452, 'h', 'hy', 'huangyuan', '', '县', '630123', '0971', 7);
INSERT INTO `youbang_sys_area` VALUES (3122, '乐都', 453, 'l', 'ld', 'ledu', '', '区', '630202', '0972', 1);
INSERT INTO `youbang_sys_area` VALUES (3123, '平安', 453, 'p', 'pa', 'pingan', '', '区', '632121', '0972', 2);
INSERT INTO `youbang_sys_area` VALUES (3124, '民和', 453, 'm', 'mh', 'minhe', '回族土族', '自治县', '632122', '0972', 3);
INSERT INTO `youbang_sys_area` VALUES (3125, '互助', 453, 'h', 'hz', 'huzhu', '土族', '自治县', '632126', '0972', 4);
INSERT INTO `youbang_sys_area` VALUES (3126, '化隆', 453, 'h', 'hl', 'hualong', '回族', '自治县', '632127', '0972', 5);
INSERT INTO `youbang_sys_area` VALUES (3127, '循化', 453, 'x', 'xh', 'xunhua', '撒拉族', '自治县', '632128', '0972', 6);
INSERT INTO `youbang_sys_area` VALUES (3128, '门源', 454, 'm', 'my', 'menyuan', '回族', '自治县', '632221', '0970', 1);
INSERT INTO `youbang_sys_area` VALUES (3129, '祁连', 454, 'q', 'ql', 'qilian', '', '县', '632222', '0970', 2);
INSERT INTO `youbang_sys_area` VALUES (3130, '海晏', 454, 'h', 'hy', 'haiyan', '', '县', '632223', '0970', 3);
INSERT INTO `youbang_sys_area` VALUES (3131, '刚察', 454, 'g', 'gc', 'gangcha', '', '县', '632224', '0970', 4);
INSERT INTO `youbang_sys_area` VALUES (3132, '同仁', 455, 't', 'tr', 'tongren', '', '县', '632321', '0973', 1);
INSERT INTO `youbang_sys_area` VALUES (3133, '尖扎', 455, 'j', 'jz', 'jianzha', '', '县', '632322', '0973', 2);
INSERT INTO `youbang_sys_area` VALUES (3134, '泽库', 455, 'z', 'zk', 'zeku', '', '县', '632323', '0973', 3);
INSERT INTO `youbang_sys_area` VALUES (3135, '河南', 455, 'h', 'hn', 'henan', '蒙古族', '自治县', '632324', '0973', 4);
INSERT INTO `youbang_sys_area` VALUES (3136, '共和', 456, 'g', 'gh', 'gonghe', '', '县', '632521', '0974', 1);
INSERT INTO `youbang_sys_area` VALUES (3137, '同德', 456, 't', 'td', 'tongde', '', '县', '632522', '0974', 2);
INSERT INTO `youbang_sys_area` VALUES (3138, '贵德', 456, 'g', 'gd', 'guide', '', '县', '632523', '0974', 3);
INSERT INTO `youbang_sys_area` VALUES (3139, '兴海', 456, 'x', 'xh', 'xinghai', '', '县', '632524', '0974', 4);
INSERT INTO `youbang_sys_area` VALUES (3140, '贵南', 456, 'g', 'gn', 'guinan', '', '县', '632525', '0974', 5);
INSERT INTO `youbang_sys_area` VALUES (3141, '玛沁', 457, 'm', 'mq', 'maqin', '', '县', '632621', '0975', 1);
INSERT INTO `youbang_sys_area` VALUES (3142, '班玛', 457, 'b', 'bm', 'banma', '', '县', '632622', '0975', 2);
INSERT INTO `youbang_sys_area` VALUES (3143, '甘德', 457, 'g', 'gd', 'gande', '', '县', '632623', '0975', 3);
INSERT INTO `youbang_sys_area` VALUES (3144, '达日', 457, 'd', 'dr', 'dari', '', '县', '632624', '0975', 4);
INSERT INTO `youbang_sys_area` VALUES (3145, '久治', 457, 'j', 'jz', 'jiuzhi', '', '县', '632625', '0975', 5);
INSERT INTO `youbang_sys_area` VALUES (3146, '玛多', 457, 'm', 'md', 'maduo', '', '县', '632626', '0975', 6);
INSERT INTO `youbang_sys_area` VALUES (3147, '玉树', 458, 'y', 'ys', 'yushu', '', '市', '632721', '0976', 1);
INSERT INTO `youbang_sys_area` VALUES (3148, '杂多', 458, 'z', 'zd', 'zaduo', '', '县', '632722', '0976', 2);
INSERT INTO `youbang_sys_area` VALUES (3149, '治多', 458, 'z', 'zd', 'zhiduo', '', '县', '632724', '0976', 3);
INSERT INTO `youbang_sys_area` VALUES (3150, '囊谦', 458, 'n', 'nq', 'nangqian', '', '县', '632725', '0976', 4);
INSERT INTO `youbang_sys_area` VALUES (3151, '曲麻莱', 458, 'q', 'qml', 'qumalai', '', '县', '632726', '0976', 5);
INSERT INTO `youbang_sys_area` VALUES (3152, '大柴旦', 459, 'd', 'dcd', 'dachaidan', '', '行委', '', '0977', 1);
INSERT INTO `youbang_sys_area` VALUES (3153, '冷湖', 459, 'l', 'lh', 'lenghu', '', '行委', '', '0977', 2);
INSERT INTO `youbang_sys_area` VALUES (3154, '茫崖', 459, 'm', 'my', 'mangya', '', '行委', '', '0977', 3);
INSERT INTO `youbang_sys_area` VALUES (3155, '格尔木', 459, 'g', 'gem', 'geermu', '', '市', '632801', '0977', 4);
INSERT INTO `youbang_sys_area` VALUES (3156, '德令哈', 459, 'd', 'dlh', 'delingha', '', '市', '632802', '0977', 5);
INSERT INTO `youbang_sys_area` VALUES (3157, '乌兰', 459, 'w', 'wl', 'wulan', '', '县', '632821', '0977', 6);
INSERT INTO `youbang_sys_area` VALUES (3158, '都兰', 459, 'd', 'dl', 'dulan', '', '县', '632822', '0977', 7);
INSERT INTO `youbang_sys_area` VALUES (3159, '天峻', 459, 't', 'tj', 'tianjun', '', '县', '632823', '0977', 8);
INSERT INTO `youbang_sys_area` VALUES (3160, '兴庆', 460, 'x', 'xq', 'xingqing', '', '区', '640104', '0951', 1);
INSERT INTO `youbang_sys_area` VALUES (3161, '西夏', 460, 'x', 'xx', 'xixia', '', '区', '640105', '0951', 2);
INSERT INTO `youbang_sys_area` VALUES (3162, '金凤', 460, 'j', 'jf', 'jinfeng', '', '区', '640106', '0951', 3);
INSERT INTO `youbang_sys_area` VALUES (3163, '永宁', 460, 'y', 'yn', 'yongning', '', '县', '640121', '0951', 4);
INSERT INTO `youbang_sys_area` VALUES (3164, '贺兰', 460, 'h', 'hl', 'helan', '', '县', '640122', '0951', 5);
INSERT INTO `youbang_sys_area` VALUES (3165, '灵武', 460, 'l', 'lw', 'lingwu', '', '市', '640181', '0951', 6);
INSERT INTO `youbang_sys_area` VALUES (3166, '大武口', 461, 'd', 'dwk', 'dawukou', '', '区', '640202', '0952', 1);
INSERT INTO `youbang_sys_area` VALUES (3167, '惠农', 461, 'h', 'hn', 'huinong', '', '区', '640205', '0952', 2);
INSERT INTO `youbang_sys_area` VALUES (3168, '平罗', 461, 'p', 'pl', 'pingluo', '', '县', '640221', '0952', 3);
INSERT INTO `youbang_sys_area` VALUES (3169, '红寺堡', 462, 'h', 'hsb', 'hongsibao', '', '区', '', '0953', 1);
INSERT INTO `youbang_sys_area` VALUES (3170, '利通', 462, 'l', 'lt', 'litong', '', '区', '640302', '0953', 2);
INSERT INTO `youbang_sys_area` VALUES (3171, '盐池', 462, 'y', 'yc', 'yanchi', '', '县', '640323', '0953', 3);
INSERT INTO `youbang_sys_area` VALUES (3172, '同心', 462, 't', 'tx', 'tongxin', '', '县', '640324', '0953', 4);
INSERT INTO `youbang_sys_area` VALUES (3173, '青铜峡', 462, 'q', 'qtx', 'qingtongxia', '', '市', '640381', '0953', 5);
INSERT INTO `youbang_sys_area` VALUES (3174, '原州', 463, 'y', 'yz', 'yuanzhou', '', '区', '640402', '0954', 1);
INSERT INTO `youbang_sys_area` VALUES (3175, '西吉', 463, 'x', 'xj', 'xiji', '', '县', '640422', '0954', 2);
INSERT INTO `youbang_sys_area` VALUES (3176, '隆德', 463, 'l', 'ld', 'longde', '', '县', '640423', '0954', 3);
INSERT INTO `youbang_sys_area` VALUES (3177, '泾源', 463, 'j', 'jy', 'jingyuan', '', '县', '640424', '0954', 4);
INSERT INTO `youbang_sys_area` VALUES (3178, '彭阳', 463, 'p', 'py', 'pengyang', '', '县', '640425', '0954', 5);
INSERT INTO `youbang_sys_area` VALUES (3179, '沙坡头', 464, 's', 'spt', 'shapotou', '', '区', '640502', '', 1);
INSERT INTO `youbang_sys_area` VALUES (3180, '中宁', 464, 'z', 'zn', 'zhongning', '', '县', '640521', '', 2);
INSERT INTO `youbang_sys_area` VALUES (3181, '海原', 464, 'h', 'hy', 'haiyuan', '', '县', '640522', '', 3);
INSERT INTO `youbang_sys_area` VALUES (3182, '天山', 465, 't', 'ts', 'tianshan', '', '区', '650102', '0991', 1);
INSERT INTO `youbang_sys_area` VALUES (3183, '沙依巴克', 465, 's', 'sybk', 'shayibake', '', '区', '650103', '0991', 2);
INSERT INTO `youbang_sys_area` VALUES (3184, '新市', 465, 'x', 'xs', 'xinshi', '', '区', '650104', '0991', 3);
INSERT INTO `youbang_sys_area` VALUES (3185, '水磨沟', 465, 's', 'smg', 'shuimogou', '', '区', '650105', '0991', 4);
INSERT INTO `youbang_sys_area` VALUES (3186, '头屯河', 465, 't', 'tth', 'toutunhe', '', '区', '650106', '0991', 5);
INSERT INTO `youbang_sys_area` VALUES (3187, '达坂城', 465, 'd', 'dbc', 'dabancheng', '', '区', '650107', '0991', 6);
INSERT INTO `youbang_sys_area` VALUES (3188, '米东', 465, 'm', 'md', 'midong', '', '区', '650109', '0991', 7);
INSERT INTO `youbang_sys_area` VALUES (3189, '乌鲁木齐', 465, 'w', 'wlmq', 'wulumuqi', '', '县', '650121', '0991', 8);
INSERT INTO `youbang_sys_area` VALUES (3190, '独山子', 466, 'd', 'dsz', 'dushanzi', '', '区', '650202', '0990', 1);
INSERT INTO `youbang_sys_area` VALUES (3191, '克拉玛依', 466, 'k', 'klmy', 'kelamayi', '', '区', '650203', '0990', 2);
INSERT INTO `youbang_sys_area` VALUES (3192, '白碱滩', 466, 'b', 'bjt', 'baijiantan', '', '区', '650204', '0990', 3);
INSERT INTO `youbang_sys_area` VALUES (3193, '乌尔禾', 466, 'w', 'weh', 'wuerhe', '', '区', '650205', '0990', 4);
INSERT INTO `youbang_sys_area` VALUES (3194, '高昌', 467, 'g', 'gc', 'gaochang', '', '区', '652101', '0995', 1);
INSERT INTO `youbang_sys_area` VALUES (3195, '鄯善', 467, 's', 'ss', 'shanshan', '', '县', '652122', '0995', 2);
INSERT INTO `youbang_sys_area` VALUES (3196, '托克逊', 467, 't', 'tkx', 'tuokexun', '', '县', '652123', '0995', 3);
INSERT INTO `youbang_sys_area` VALUES (3197, '伊州', 468, 'y', 'yz', 'yizhou', '', '区', '652201', '0902', 1);
INSERT INTO `youbang_sys_area` VALUES (3198, '巴里坤', 468, 'b', 'blk', 'balikun', '哈萨克', '自治县', '650521', '0902', 2);
INSERT INTO `youbang_sys_area` VALUES (3199, '伊吾', 468, 'y', 'yw', 'yiwu', '', '县', '652223', '0902', 3);
INSERT INTO `youbang_sys_area` VALUES (3200, '昌吉', 469, 'c', 'cj', 'changji', '', '市', '652301', '0994', 1);
INSERT INTO `youbang_sys_area` VALUES (3201, '阜康', 469, 'f', 'fk', 'fukang', '', '市', '652302', '0994', 2);
INSERT INTO `youbang_sys_area` VALUES (3202, '呼图壁', 469, 'h', 'htb', 'hutubi', '', '县', '652323', '0994', 3);
INSERT INTO `youbang_sys_area` VALUES (3203, '玛纳斯', 469, 'm', 'mns', 'manasi', '', '县', '652324', '0994', 4);
INSERT INTO `youbang_sys_area` VALUES (3204, '奇台', 469, 'q', 'qt', 'qitai', '', '县', '652325', '0994', 5);
INSERT INTO `youbang_sys_area` VALUES (3205, '吉木萨尔', 469, 'j', 'jmse', 'jimusaer', '', '县', '652327', '0994', 6);
INSERT INTO `youbang_sys_area` VALUES (3206, '木垒', 469, 'm', 'ml', 'mulei', '哈萨克', '自治县', '652328', '0994', 7);
INSERT INTO `youbang_sys_area` VALUES (3207, '阿拉山口', 470, 'a', 'alsk', 'alashankou', '', '市', '', '0909', 1);
INSERT INTO `youbang_sys_area` VALUES (3208, '博乐', 470, 'b', 'bl', 'bole', '', '市', '652701', '0909', 2);
INSERT INTO `youbang_sys_area` VALUES (3209, '精河', 470, 'j', 'jh', 'jinghe', '', '县', '652722', '0909', 3);
INSERT INTO `youbang_sys_area` VALUES (3210, '温泉', 470, 'w', 'wq', 'wenquan', '', '县', '652723', '0909', 4);
INSERT INTO `youbang_sys_area` VALUES (3211, '库尔勒', 471, 'k', 'kel', 'kuerle', '', '市', '652801', '0996', 1);
INSERT INTO `youbang_sys_area` VALUES (3212, '轮台', 471, 'l', 'lt', 'luntai', '', '县', '652822', '0996', 2);
INSERT INTO `youbang_sys_area` VALUES (3213, '尉犁', 471, 'w', 'wl', 'weili', '', '县', '652823', '0996', 3);
INSERT INTO `youbang_sys_area` VALUES (3214, '若羌', 471, 'r', 'rq', 'ruoqiang', '', '县', '652824', '0996', 4);
INSERT INTO `youbang_sys_area` VALUES (3215, '且末', 471, 'q', 'qm', 'qiemo', '', '县', '652825', '0996', 5);
INSERT INTO `youbang_sys_area` VALUES (3216, '焉耆', 471, 'y', 'yq', 'yanqi', '回族', '自治县', '652826', '0996', 6);
INSERT INTO `youbang_sys_area` VALUES (3217, '和静', 471, 'h', 'hj', 'hejing', '', '县', '652827', '0996', 7);
INSERT INTO `youbang_sys_area` VALUES (3218, '和硕', 471, 'h', 'hs', 'heshuo', '', '县', '652828', '0996', 8);
INSERT INTO `youbang_sys_area` VALUES (3219, '博湖', 471, 'b', 'bh', 'bohu', '', '县', '652829', '0996', 9);
INSERT INTO `youbang_sys_area` VALUES (3220, '阿克苏', 472, 'a', 'aks', 'akesu', '', '市', '652901', '', 1);
INSERT INTO `youbang_sys_area` VALUES (3221, '温宿', 472, 'w', 'ws', 'wensu', '', '县', '652922', '', 2);
INSERT INTO `youbang_sys_area` VALUES (3222, '库车', 472, 'k', 'kc', 'kuche', '', '县', '652923', '', 3);
INSERT INTO `youbang_sys_area` VALUES (3223, '沙雅', 472, 's', 'sy', 'shaya', '', '县', '652924', '', 4);
INSERT INTO `youbang_sys_area` VALUES (3224, '新和', 472, 'x', 'xh', 'xinhe', '', '县', '652925', '', 5);
INSERT INTO `youbang_sys_area` VALUES (3225, '拜城', 472, 'b', 'bc', 'baicheng', '', '县', '652926', '', 6);
INSERT INTO `youbang_sys_area` VALUES (3226, '乌什', 472, 'w', 'ws', 'wushen', '', '县', '652927', '', 7);
INSERT INTO `youbang_sys_area` VALUES (3227, '阿瓦提', 472, 'a', 'awt', 'awati', '', '县', '652928', '', 8);
INSERT INTO `youbang_sys_area` VALUES (3228, '柯坪', 472, 'k', 'kp', 'keping', '', '县', '652929', '', 9);
INSERT INTO `youbang_sys_area` VALUES (3229, '阿图什', 473, 'a', 'ats', 'atushen', '', '市', '653001', '0908', 1);
INSERT INTO `youbang_sys_area` VALUES (3230, '阿克陶', 473, 'a', 'akt', 'aketao', '', '县', '653022', '0908', 2);
INSERT INTO `youbang_sys_area` VALUES (3231, '阿合奇', 473, 'a', 'ahq', 'aheqi', '', '县', '653023', '0997', 3);
INSERT INTO `youbang_sys_area` VALUES (3232, '乌恰', 473, 'w', 'wq', 'wuqia', '', '县', '653024', '0908', 4);
INSERT INTO `youbang_sys_area` VALUES (3233, '喀什', 474, 'k', 'ks', 'kashen', '', '市', '653101', '0998', 1);
INSERT INTO `youbang_sys_area` VALUES (3234, '疏附', 474, 's', 'sf', 'shufu', '', '县', '653121', '0998', 2);
INSERT INTO `youbang_sys_area` VALUES (3235, '疏勒', 474, 's', 'sl', 'shule', '', '县', '653122', '0998', 3);
INSERT INTO `youbang_sys_area` VALUES (3236, '英吉沙', 474, 'y', 'yjs', 'yingjisha', '', '县', '653123', '0998', 4);
INSERT INTO `youbang_sys_area` VALUES (3237, '泽普', 474, 'z', 'zp', 'zepu', '', '县', '653124', '0998', 5);
INSERT INTO `youbang_sys_area` VALUES (3238, '莎车', 474, 's', 'sc', 'shache', '', '县', '653125', '0998', 6);
INSERT INTO `youbang_sys_area` VALUES (3239, '叶城', 474, 'y', 'yc', 'yecheng', '', '县', '653126', '0998', 7);
INSERT INTO `youbang_sys_area` VALUES (3240, '麦盖提', 474, 'm', 'mgt', 'maigaiti', '', '县', '653127', '0998', 8);
INSERT INTO `youbang_sys_area` VALUES (3241, '岳普湖', 474, 'y', 'yph', 'yuepuhu', '', '县', '653128', '0998', 9);
INSERT INTO `youbang_sys_area` VALUES (3242, '伽师', 474, 'j', 'js', 'jiashi', '', '县', '653129', '0998', 10);
INSERT INTO `youbang_sys_area` VALUES (3243, '巴楚', 474, 'b', 'bc', 'bachu', '', '县', '653130', '0998', 11);
INSERT INTO `youbang_sys_area` VALUES (3244, '塔什库尔干', 474, 't', 'tskeg', 'tashenkuergan', '塔吉克', '自治县', '653131', '0998', 12);
INSERT INTO `youbang_sys_area` VALUES (3245, '和田', 475, 'h', 'ht', 'hetian', '', '市', '653201', '0903', 1);
INSERT INTO `youbang_sys_area` VALUES (3246, '和田', 475, 'h', 'ht', 'hetian', '', '县', '653221', '0903', 2);
INSERT INTO `youbang_sys_area` VALUES (3247, '墨玉', 475, 'm', 'my', 'moyu', '', '县', '653222', '0903', 3);
INSERT INTO `youbang_sys_area` VALUES (3248, '皮山', 475, 'p', 'ps', 'pishan', '', '县', '653223', '0903', 4);
INSERT INTO `youbang_sys_area` VALUES (3249, '洛浦', 475, 'l', 'lp', 'luopu', '', '县', '653224', '0903', 5);
INSERT INTO `youbang_sys_area` VALUES (3250, '策勒', 475, 'c', 'cl', 'cele', '', '县', '653225', '0903', 6);
INSERT INTO `youbang_sys_area` VALUES (3251, '于田', 475, 'y', 'yt', 'yutian', '', '县', '653226', '0903', 7);
INSERT INTO `youbang_sys_area` VALUES (3252, '民丰', 475, 'm', 'mf', 'minfeng', '', '县', '653227', '0903', 8);
INSERT INTO `youbang_sys_area` VALUES (3253, '伊宁', 476, 'y', 'yn', 'yining', '', '市', '654002', '0999', 1);
INSERT INTO `youbang_sys_area` VALUES (3254, '奎屯', 476, 'k', 'kt', 'kuitun', '', '市', '654003', '0999', 2);
INSERT INTO `youbang_sys_area` VALUES (3255, '伊宁', 476, 'y', 'yn', 'yining', '', '县', '654021', '0999', 4);
INSERT INTO `youbang_sys_area` VALUES (3256, '察布查尔锡伯', 476, 'c', 'cbcexb', 'chabuchaerxibo', '', '自治县', '654022', '0999', 5);
INSERT INTO `youbang_sys_area` VALUES (3257, '霍城', 476, 'h', 'hc', 'huocheng', '', '县', '654023', '0999', 6);
INSERT INTO `youbang_sys_area` VALUES (3258, '巩留', 476, 'g', 'gl', 'gongliu', '', '县', '654024', '0999', 7);
INSERT INTO `youbang_sys_area` VALUES (3259, '新源', 476, 'x', 'xy', 'xinyuan', '', '县', '654025', '0999', 8);
INSERT INTO `youbang_sys_area` VALUES (3260, '昭苏', 476, 'z', 'zs', 'zhaosu', '', '县', '654026', '0999', 9);
INSERT INTO `youbang_sys_area` VALUES (3261, '特克斯', 476, 't', 'tks', 'tekesi', '', '县', '654027', '0999', 10);
INSERT INTO `youbang_sys_area` VALUES (3262, '尼勒克', 476, 'n', 'nlk', 'nileke', '', '县', '654028', '0999', 11);
INSERT INTO `youbang_sys_area` VALUES (3263, '塔城', 477, 't', 'tc', 'tacheng', '', '市', '654201', '0901', 1);
INSERT INTO `youbang_sys_area` VALUES (3264, '乌苏', 477, 'w', 'ws', 'wusu', '', '市', '654202', '0901', 2);
INSERT INTO `youbang_sys_area` VALUES (3265, '额敏', 477, 'e', 'em', 'emin', '', '县', '654221', '0901', 3);
INSERT INTO `youbang_sys_area` VALUES (3266, '沙湾', 477, 's', 'sw', 'shawan', '', '县', '654223', '0901', 4);
INSERT INTO `youbang_sys_area` VALUES (3267, '托里', 477, 't', 'tl', 'tuoli', '', '县', '654224', '0901', 5);
INSERT INTO `youbang_sys_area` VALUES (3268, '裕民', 477, 'y', 'ym', 'yumin', '', '县', '654225', '0901', 6);
INSERT INTO `youbang_sys_area` VALUES (3269, '和布克赛尔', 477, 'h', 'hbkse', 'hebukesaier', '蒙古', '自治县', '654226', '0901', 7);
INSERT INTO `youbang_sys_area` VALUES (3270, '阿勒泰', 478, 'a', 'alt', 'aletai', '', '市', '654301', '0906', 1);
INSERT INTO `youbang_sys_area` VALUES (3271, '布尔津', 478, 'b', 'bej', 'buerjin', '', '县', '654321', '0906', 2);
INSERT INTO `youbang_sys_area` VALUES (3272, '富蕴', 478, 'f', 'fy', 'fuyun', '', '县', '654322', '0906', 3);
INSERT INTO `youbang_sys_area` VALUES (3273, '福海', 478, 'f', 'fh', 'fuhai', '', '县', '654323', '0906', 4);
INSERT INTO `youbang_sys_area` VALUES (3274, '哈巴河', 478, 'h', 'hbh', 'habahe', '', '县', '654324', '0906', 5);
INSERT INTO `youbang_sys_area` VALUES (3275, '青河', 478, 'q', 'qh', 'qinghe', '', '县', '654325', '0906', 6);
INSERT INTO `youbang_sys_area` VALUES (3276, '吉木乃', 478, 'j', 'jmn', 'jimunai', '', '县', '654326', '0906', 7);
INSERT INTO `youbang_sys_area` VALUES (3277, '松山', 485, 's', 'ss', 'songshan', '', '区', '6300100', '02', 1);
INSERT INTO `youbang_sys_area` VALUES (3278, '信义', 485, 'x', 'xy', 'xinyi', '', '区', '6300200', '02', 2);
INSERT INTO `youbang_sys_area` VALUES (3279, '大安', 485, 'd', 'da', 'daan', '', '区', '6300300', '02', 3);
INSERT INTO `youbang_sys_area` VALUES (3280, '中山', 485, 'z', 'zs', 'zhongshan', '', '区', '6300400', '02', 4);
INSERT INTO `youbang_sys_area` VALUES (3281, '中正', 485, 'z', 'zz', 'zhongzheng', '', '区', '6300500', '02', 5);
INSERT INTO `youbang_sys_area` VALUES (3282, '大同', 485, 'd', 'dt', 'datong', '', '区', '6300600', '02', 6);
INSERT INTO `youbang_sys_area` VALUES (3283, '万华', 485, 'w', 'wh', 'wanhua', '', '区', '6300700', '02', 7);
INSERT INTO `youbang_sys_area` VALUES (3284, '文山', 485, 'w', 'ws', 'wenshan', '', '区', '6300800', '02', 8);
INSERT INTO `youbang_sys_area` VALUES (3285, '南港', 485, 'n', 'ng', 'nangang', '', '区', '6300900', '02', 9);
INSERT INTO `youbang_sys_area` VALUES (3286, '内湖', 485, 'n', 'nh', 'neihu', '', '区', '6301000', '02', 10);
INSERT INTO `youbang_sys_area` VALUES (3287, '士林', 485, 's', 'sl', 'shilin', '', '区', '6301100', '02', 11);
INSERT INTO `youbang_sys_area` VALUES (3288, '北投', 485, 'b', 'bt', 'beitou', '', '区', '6301200', '02', 12);
INSERT INTO `youbang_sys_area` VALUES (3289, '盐埕', 486, 'y', 'yc', 'yancheng', '', '区', '6400100', '07', 1);
INSERT INTO `youbang_sys_area` VALUES (3290, '鼓山', 486, 'g', 'gs', 'gushan', '', '区', '6400200', '07', 2);
INSERT INTO `youbang_sys_area` VALUES (3291, '左营', 486, 'z', 'zy', 'zuoying', '', '区', '6400300', '07', 3);
INSERT INTO `youbang_sys_area` VALUES (3292, '楠梓', 486, 'n', 'nz', 'nanzi', '', '区', '6400400', '07', 4);
INSERT INTO `youbang_sys_area` VALUES (3293, '三民', 486, 's', 'sm', 'sanmin', '', '区', '6400500', '07', 5);
INSERT INTO `youbang_sys_area` VALUES (3294, '新兴', 486, 'x', 'xx', 'xinxing', '', '区', '6400600', '07', 6);
INSERT INTO `youbang_sys_area` VALUES (3295, '前金', 486, 'q', 'qj', 'qianjin', '', '区', '6400700', '07', 7);
INSERT INTO `youbang_sys_area` VALUES (3296, '苓雅', 486, 'l', 'ly', 'lingya', '', '区', '6400800', '07', 8);
INSERT INTO `youbang_sys_area` VALUES (3297, '前镇', 486, 'q', 'qz', 'qianzhen', '', '区', '6400900', '07', 9);
INSERT INTO `youbang_sys_area` VALUES (3298, '旗津', 486, 'q', 'qj', 'qijin', '', '区', '6401000', '07', 10);
INSERT INTO `youbang_sys_area` VALUES (3299, '小港', 486, 'x', 'xg', 'xiaogang', '', '区', '6401100', '07', 11);
INSERT INTO `youbang_sys_area` VALUES (3300, '中正', 487, 'z', 'zz', 'zhongzheng', '', '区', '1001701', '02', 1);
INSERT INTO `youbang_sys_area` VALUES (3301, '七堵', 487, 'q', 'qd', 'qidu', '', '区', '1001702', '02', 2);
INSERT INTO `youbang_sys_area` VALUES (3302, '暖暖', 487, 'n', 'nn', 'nuannuan', '', '区', '1001703', '02', 3);
INSERT INTO `youbang_sys_area` VALUES (3303, '仁爱', 487, 'r', 'ra', 'renai', '', '区', '1001704', '02', 4);
INSERT INTO `youbang_sys_area` VALUES (3304, '中山', 487, 'z', 'zs', 'zhongshan', '', '区', '1001705', '02', 5);
INSERT INTO `youbang_sys_area` VALUES (3305, '安乐', 487, 'a', 'al', 'anle', '', '区', '1001706', '02', 6);
INSERT INTO `youbang_sys_area` VALUES (3306, '信义', 487, 'x', 'xy', 'xinyi', '', '区', '1001707', '02', 7);
INSERT INTO `youbang_sys_area` VALUES (3307, '大安', 488, 'd', 'da', 'daan', '', '区', '', '04', 1);
INSERT INTO `youbang_sys_area` VALUES (3308, '神冈', 488, 's', 'sg', 'shengang', '', '区', '', '04', 2);
INSERT INTO `youbang_sys_area` VALUES (3309, '石冈', 488, 's', 'sg', 'shigang', '', '区', '', '04', 3);
INSERT INTO `youbang_sys_area` VALUES (3310, '东势', 488, 'd', 'ds', 'dongshi', '', '区', '', '04', 4);
INSERT INTO `youbang_sys_area` VALUES (3311, '新社', 488, 'x', 'xs', 'xinshe', '', '区', '', '04', 5);
INSERT INTO `youbang_sys_area` VALUES (3312, '和平', 488, 'h', 'hp', 'heping', '', '区', '', '04', 6);
INSERT INTO `youbang_sys_area` VALUES (3313, '大肚', 488, 'd', 'dd', 'dadu', '', '区', '', '04', 7);
INSERT INTO `youbang_sys_area` VALUES (3314, '沙鹿', 488, 's', 'sl', 'shalu', '', '区', '', '04', 8);
INSERT INTO `youbang_sys_area` VALUES (3315, '龙井', 488, 'l', 'lj', 'longjing', '', '区', '', '04', 9);
INSERT INTO `youbang_sys_area` VALUES (3316, '梧栖', 488, 'w', 'wq', 'wuqi', '', '区', '', '04', 10);
INSERT INTO `youbang_sys_area` VALUES (3317, '清水', 488, 'q', 'qs', 'qingshui', '', '区', '', '04', 11);
INSERT INTO `youbang_sys_area` VALUES (3318, '大甲', 488, 'd', 'dj', 'dajia', '', '区', '', '04', 12);
INSERT INTO `youbang_sys_area` VALUES (3319, '外埔', 488, 'w', 'wp', 'waipu', '', '区', '', '04', 13);
INSERT INTO `youbang_sys_area` VALUES (3320, '大雅', 488, 'd', 'dy', 'daya', '', '区', '', '04', 14);
INSERT INTO `youbang_sys_area` VALUES (3321, '潭子', 488, 't', 'tz', 'tanzi', '', '区', '', '04', 15);
INSERT INTO `youbang_sys_area` VALUES (3322, '后里', 488, 'h', 'hl', 'houli', '', '区', '', '04', 16);
INSERT INTO `youbang_sys_area` VALUES (3323, '丰原', 488, 'f', 'fy', 'fengyuan', '', '区', '', '04', 17);
INSERT INTO `youbang_sys_area` VALUES (3324, '乌日', 488, 'w', 'wr', 'wuri', '', '区', '', '04', 18);
INSERT INTO `youbang_sys_area` VALUES (3325, '雾峰', 488, 'w', 'wf', 'wufeng', '', '区', '', '04', 19);
INSERT INTO `youbang_sys_area` VALUES (3326, '大里', 488, 'd', 'dl', 'dali', '', '区', '', '04', 20);
INSERT INTO `youbang_sys_area` VALUES (3327, '太平', 488, 't', 'tp', 'taiping', '', '区', '', '04', 21);
INSERT INTO `youbang_sys_area` VALUES (3328, '中区', 488, 'z', 'zq', 'zhongqu', '', '', '1001901', '04', 22);
INSERT INTO `youbang_sys_area` VALUES (3329, '东区', 488, 'd', 'dq', 'dongqu', '', '', '1001902', '04', 23);
INSERT INTO `youbang_sys_area` VALUES (3330, '南区', 488, 'n', 'nq', 'nanqu', '', '', '1001903', '04', 24);
INSERT INTO `youbang_sys_area` VALUES (3331, '西区', 488, 'x', 'xq', 'xiqu', '', '', '1001904', '04', 25);
INSERT INTO `youbang_sys_area` VALUES (3332, '北区', 488, 'b', 'bq', 'beiqu', '', '', '1001905', '04', 26);
INSERT INTO `youbang_sys_area` VALUES (3333, '西屯', 488, 'x', 'xt', 'xitun', '', '区', '1001906', '04', 27);
INSERT INTO `youbang_sys_area` VALUES (3334, '南屯', 488, 'n', 'nt', 'nantun', '', '区', '1001907', '04', 28);
INSERT INTO `youbang_sys_area` VALUES (3335, '北屯', 488, 'b', 'bt', 'beitun', '', '区', '1001908', '04', 29);
INSERT INTO `youbang_sys_area` VALUES (3336, '东区', 489, 'd', 'dq', 'dongqu', '', '', '1002101', '06', 1);
INSERT INTO `youbang_sys_area` VALUES (3337, '南区', 489, 'n', 'nq', 'nanqu', '', '', '1002102', '06', 2);
INSERT INTO `youbang_sys_area` VALUES (3338, '北区', 489, 'b', 'bq', 'beiqu', '', '', '1002104', '06', 3);
INSERT INTO `youbang_sys_area` VALUES (3339, '安南', 489, 'a', 'an', 'annan', '', '区', '1002106', '06', 4);
INSERT INTO `youbang_sys_area` VALUES (3340, '安平', 489, 'a', 'ap', 'anping', '', '区', '1002107', '06', 5);
INSERT INTO `youbang_sys_area` VALUES (3341, '中西', 489, 'z', 'zx', 'zhongxi', '', '区', '1002108', '06', 6);
INSERT INTO `youbang_sys_area` VALUES (3342, '东区', 490, 'd', 'dq', 'dongqu', '', '', '1001801', '', 1);
INSERT INTO `youbang_sys_area` VALUES (3343, '北区', 490, 'b', 'bq', 'beiqu', '', '', '1001802', '', 2);
INSERT INTO `youbang_sys_area` VALUES (3344, '香山', 490, 'x', 'xs', 'xiangshan', '', '区', '1001803', '', 3);
INSERT INTO `youbang_sys_area` VALUES (3345, '东区', 491, 'd', 'dq', 'dongqu', '', '', '1002001', '05', 1);
INSERT INTO `youbang_sys_area` VALUES (3346, '西区', 491, 'x', 'xq', 'xiqu', '', '', '1002002', '05', 2);
INSERT INTO `youbang_sys_area` VALUES (3347, '板桥', 492, 'b', 'bq', 'banqiao', '', '区', '', '', 1);
INSERT INTO `youbang_sys_area` VALUES (3348, '瑞芳', 492, 'r', 'rf', 'ruifang', '', '区', '', '', 2);
INSERT INTO `youbang_sys_area` VALUES (3349, '八里', 492, 'b', 'bl', 'bali', '', '区', '', '', 3);
INSERT INTO `youbang_sys_area` VALUES (3350, '深坑', 492, 's', 'sk', 'shenkeng', '', '区', '', '', 4);
INSERT INTO `youbang_sys_area` VALUES (3351, '三芝', 492, 's', 'sz', 'sanzhi', '', '区', '', '', 5);
INSERT INTO `youbang_sys_area` VALUES (3352, '金山', 492, 'j', 'js', 'jinshan', '', '区', '', '', 6);
INSERT INTO `youbang_sys_area` VALUES (3353, '万里', 492, 'w', 'wl', 'wanli', '', '区', '', '', 7);
INSERT INTO `youbang_sys_area` VALUES (3354, '贡寮', 492, 'g', 'gl', 'gongliao', '', '区', '', '', 8);
INSERT INTO `youbang_sys_area` VALUES (3355, '石门', 492, 's', 'sm', 'shimen', '', '区', '', '', 9);
INSERT INTO `youbang_sys_area` VALUES (3356, '双溪', 492, 's', 'sx', 'shuangxi', '', '区', '', '', 10);
INSERT INTO `youbang_sys_area` VALUES (3357, '石碇', 492, 's', 'sd', 'shiding', '', '区', '', '', 11);
INSERT INTO `youbang_sys_area` VALUES (3358, '坪林', 492, 'p', 'pl', 'pinglin', '', '区', '', '', 12);
INSERT INTO `youbang_sys_area` VALUES (3359, '乌来', 492, 'w', 'wl', 'wulai', '', '区', '', '', 13);
INSERT INTO `youbang_sys_area` VALUES (3360, '泰山', 492, 't', 'ts', 'taishan', '', '区', '', '', 14);
INSERT INTO `youbang_sys_area` VALUES (3361, '五股', 492, 'w', 'wg', 'wugu', '', '区', '', '', 15);
INSERT INTO `youbang_sys_area` VALUES (3362, '莺歌', 492, 'y', 'yg', 'yingge', '', '区', '', '', 16);
INSERT INTO `youbang_sys_area` VALUES (3363, '中和', 492, 'z', 'zh', 'zhonghe', '', '区', '', '', 17);
INSERT INTO `youbang_sys_area` VALUES (3364, '新庄', 492, 'x', 'xz', 'xinzhuang', '', '区', '', '', 18);
INSERT INTO `youbang_sys_area` VALUES (3365, '三重', 492, 's', 'sz', 'sanzhong', '', '区', '', '', 19);
INSERT INTO `youbang_sys_area` VALUES (3366, '新店', 492, 'x', 'xd', 'xindian', '', '区', '', '', 20);
INSERT INTO `youbang_sys_area` VALUES (3367, '土城', 492, 't', 'tc', 'tucheng', '', '区', '', '', 21);
INSERT INTO `youbang_sys_area` VALUES (3368, '永和', 492, 'y', 'yh', 'yonghe', '', '区', '', '', 22);
INSERT INTO `youbang_sys_area` VALUES (3369, '芦洲', 492, 'l', 'lz', 'luzhou', '', '区', '', '', 23);
INSERT INTO `youbang_sys_area` VALUES (3370, '汐止', 492, 'x', 'xz', 'xizhi', '', '区', '', '', 24);
INSERT INTO `youbang_sys_area` VALUES (3371, '树林', 492, 's', 'sl', 'shulin', '', '区', '', '', 25);
INSERT INTO `youbang_sys_area` VALUES (3372, '淡水', 492, 'd', 'ds', 'danshui', '', '区', '', '', 26);
INSERT INTO `youbang_sys_area` VALUES (3373, '三峡', 492, 's', 'sx', 'sanxia', '', '区', '', '', 27);
INSERT INTO `youbang_sys_area` VALUES (3374, '林口', 492, 'l', 'lk', 'linkou', '', '区', '', '', 28);
INSERT INTO `youbang_sys_area` VALUES (3375, '平溪', 492, 'p', 'px', 'pingxi', '', '区', '', '', 29);
INSERT INTO `youbang_sys_area` VALUES (3376, '宜兰', 493, 'y', 'yl', 'yilan', '', '市', '1000201', '', 1);
INSERT INTO `youbang_sys_area` VALUES (3377, '罗东', 493, 'l', 'ld', 'luodong', '', '镇', '1000202', '', 2);
INSERT INTO `youbang_sys_area` VALUES (3378, '苏澳', 493, 's', 'sa', 'suao', '', '镇', '1000203', '', 3);
INSERT INTO `youbang_sys_area` VALUES (3379, '头城', 493, 't', 'tc', 'toucheng', '', '乡', '1000204', '', 4);
INSERT INTO `youbang_sys_area` VALUES (3380, '礁溪', 493, 'j', 'jx', 'jiaoxi', '', '乡', '1000205', '', 5);
INSERT INTO `youbang_sys_area` VALUES (3381, '壮围', 493, 'z', 'zw', 'zhuangwei', '', '乡', '1000206', '', 6);
INSERT INTO `youbang_sys_area` VALUES (3382, '员山', 493, 'y', 'ys', 'yuanshan', '', '乡', '1000207', '', 7);
INSERT INTO `youbang_sys_area` VALUES (3383, '冬山', 493, 'd', 'ds', 'dongshan', '', '乡', '1000208', '', 8);
INSERT INTO `youbang_sys_area` VALUES (3384, '五结', 493, 'w', 'wj', 'wujie', '', '乡', '1000209', '', 9);
INSERT INTO `youbang_sys_area` VALUES (3385, '三星', 493, 's', 'sx', 'sanxing', '', '乡', '1000210', '', 10);
INSERT INTO `youbang_sys_area` VALUES (3386, '大同', 493, 'd', 'dt', 'datong', '', '乡', '1000211', '', 11);
INSERT INTO `youbang_sys_area` VALUES (3387, '南澳', 493, 'n', 'na', 'nanao', '', '乡', '1000212', '', 12);
INSERT INTO `youbang_sys_area` VALUES (3388, '桃园', 494, 't', 'ty', 'taoyuan', '', '市', '1000301', '', 1);
INSERT INTO `youbang_sys_area` VALUES (3389, '中坜', 494, 'z', 'zl', 'zhongli', '', '市', '1000302', '', 2);
INSERT INTO `youbang_sys_area` VALUES (3390, '大溪', 494, 'd', 'dx', 'daxi', '', '镇', '1000303', '', 3);
INSERT INTO `youbang_sys_area` VALUES (3391, '杨梅', 494, 'y', 'ym', 'yangmei', '', '镇', '1000304', '', 4);
INSERT INTO `youbang_sys_area` VALUES (3392, '芦竹', 494, 'l', 'lz', 'luzhu', '', '乡', '1000305', '', 5);
INSERT INTO `youbang_sys_area` VALUES (3393, '大园', 494, 'd', 'dy', 'dayuan', '', '乡', '1000306', '', 6);
INSERT INTO `youbang_sys_area` VALUES (3394, '龟山', 494, 'g', 'gs', 'guishan', '', '乡', '1000307', '', 7);
INSERT INTO `youbang_sys_area` VALUES (3395, '八德', 494, 'b', 'bd', 'bade', '', '市', '1000308', '', 8);
INSERT INTO `youbang_sys_area` VALUES (3396, '龙潭', 494, 'l', 'lt', 'longtan', '', '乡', '1000309', '', 9);
INSERT INTO `youbang_sys_area` VALUES (3397, '平镇', 494, 'p', 'pz', 'pingzhen', '', '市', '1000310', '', 10);
INSERT INTO `youbang_sys_area` VALUES (3398, '新屋', 494, 'x', 'xw', 'xinwu', '', '乡', '1000311', '', 11);
INSERT INTO `youbang_sys_area` VALUES (3399, '观音', 494, 'g', 'gy', 'guanyin', '', '乡', '1000312', '', 12);
INSERT INTO `youbang_sys_area` VALUES (3400, '复兴', 494, 'f', 'fx', 'fuxing', '', '乡', '1000313', '', 13);
INSERT INTO `youbang_sys_area` VALUES (3401, '竹北', 495, 'z', 'zb', 'zhubei', '', '市', '1000401', '', 1);
INSERT INTO `youbang_sys_area` VALUES (3402, '竹东', 495, 'z', 'zd', 'zhudong', '', '镇', '1000402', '', 2);
INSERT INTO `youbang_sys_area` VALUES (3403, '新埔', 495, 'x', 'xp', 'xinpu', '', '镇', '1000403', '', 3);
INSERT INTO `youbang_sys_area` VALUES (3404, '关西', 495, 'g', 'gx', 'guanxi', '', '镇', '1000404', '', 4);
INSERT INTO `youbang_sys_area` VALUES (3405, '湖口', 495, 'h', 'hk', 'hukou', '', '乡', '1000405', '', 5);
INSERT INTO `youbang_sys_area` VALUES (3406, '新丰', 495, 'x', 'xf', 'xinfeng', '', '乡', '1000406', '', 6);
INSERT INTO `youbang_sys_area` VALUES (3407, '芎林', 495, 'x', 'xl', 'xionglin', '', '乡', '1000407', '', 7);
INSERT INTO `youbang_sys_area` VALUES (3408, '横山', 495, 'h', 'hs', 'hengshan', '', '乡', '1000408', '', 8);
INSERT INTO `youbang_sys_area` VALUES (3409, '北埔', 495, 'b', 'bp', 'beipu', '', '乡', '1000409', '', 9);
INSERT INTO `youbang_sys_area` VALUES (3410, '宝山', 495, 'b', 'bs', 'baoshan', '', '乡', '1000410', '', 10);
INSERT INTO `youbang_sys_area` VALUES (3411, '峨眉', 495, 'e', 'em', 'emei', '', '乡', '1000411', '', 11);
INSERT INTO `youbang_sys_area` VALUES (3412, '尖石', 495, 'j', 'js', 'jianshi', '', '乡', '1000412', '', 12);
INSERT INTO `youbang_sys_area` VALUES (3413, '五峰', 495, 'w', 'wf', 'wufeng', '', '乡', '1000413', '', 13);
INSERT INTO `youbang_sys_area` VALUES (3414, '苗栗', 496, 'm', 'ml', 'miaoli', '', '市', '1000501', '', 1);
INSERT INTO `youbang_sys_area` VALUES (3415, '苑里', 496, 'y', 'yl', 'yuanli', '', '镇', '1000502', '', 2);
INSERT INTO `youbang_sys_area` VALUES (3416, '通霄', 496, 't', 'tx', 'tongxiao', '', '镇', '1000503', '', 3);
INSERT INTO `youbang_sys_area` VALUES (3417, '竹南', 496, 'z', 'zn', 'zhunan', '', '镇', '1000504', '', 4);
INSERT INTO `youbang_sys_area` VALUES (3418, '头份', 496, 't', 'tf', 'toufen', '', '镇', '1000505', '', 5);
INSERT INTO `youbang_sys_area` VALUES (3419, '后龙', 496, 'h', 'hl', 'houlong', '', '镇', '1000506', '', 6);
INSERT INTO `youbang_sys_area` VALUES (3420, '卓兰', 496, 'z', 'zl', 'zhuolan', '', '镇', '1000507', '', 7);
INSERT INTO `youbang_sys_area` VALUES (3421, '大湖', 496, 'd', 'dh', 'dahu', '', '乡', '1000508', '', 8);
INSERT INTO `youbang_sys_area` VALUES (3422, '公馆', 496, 'g', 'gg', 'gongguan', '', '乡', '1000509', '', 9);
INSERT INTO `youbang_sys_area` VALUES (3423, '铜锣', 496, 't', 'tl', 'tongluo', '', '乡', '1000510', '', 10);
INSERT INTO `youbang_sys_area` VALUES (3424, '南庄', 496, 'n', 'nz', 'nanzhuang', '', '乡', '1000511', '', 11);
INSERT INTO `youbang_sys_area` VALUES (3425, '头屋', 496, 't', 'tw', 'touwu', '', '乡', '1000512', '', 12);
INSERT INTO `youbang_sys_area` VALUES (3426, '三义', 496, 's', 'sy', 'sanyi', '', '乡', '1000513', '', 13);
INSERT INTO `youbang_sys_area` VALUES (3427, '西湖', 496, 'x', 'xh', 'xihu', '', '乡', '1000514', '', 14);
INSERT INTO `youbang_sys_area` VALUES (3428, '造桥', 496, 'z', 'zq', 'zaoqiao', '', '乡', '1000515', '', 15);
INSERT INTO `youbang_sys_area` VALUES (3429, '三湾', 496, 's', 'sw', 'sanwan', '', '乡', '1000516', '', 16);
INSERT INTO `youbang_sys_area` VALUES (3430, '狮潭', 496, 's', 'st', 'shitan', '', '乡', '1000517', '', 17);
INSERT INTO `youbang_sys_area` VALUES (3431, '泰安', 496, 't', 'ta', 'taian', '', '乡', '1000518', '', 18);
INSERT INTO `youbang_sys_area` VALUES (3432, '彰化', 497, 'z', 'zh', 'zhanghua', '', '市', '1000701', '', 1);
INSERT INTO `youbang_sys_area` VALUES (3433, '鹿港', 497, 'l', 'lg', 'lugang', '', '镇', '1000702', '', 2);
INSERT INTO `youbang_sys_area` VALUES (3434, '和美', 497, 'h', 'hm', 'hemei', '', '镇', '1000703', '', 3);
INSERT INTO `youbang_sys_area` VALUES (3435, '线西', 497, 'x', 'xx', 'xianxi', '', '乡', '1000704', '', 4);
INSERT INTO `youbang_sys_area` VALUES (3436, '伸港', 497, 's', 'sg', 'shengang', '', '乡', '1000705', '', 5);
INSERT INTO `youbang_sys_area` VALUES (3437, '福兴', 497, 'f', 'fx', 'fuxing', '', '乡', '1000706', '', 6);
INSERT INTO `youbang_sys_area` VALUES (3438, '秀水', 497, 'x', 'xs', 'xiushui', '', '乡', '1000707', '', 7);
INSERT INTO `youbang_sys_area` VALUES (3439, '花坛', 497, 'h', 'ht', 'huatan', '', '乡', '1000708', '', 8);
INSERT INTO `youbang_sys_area` VALUES (3440, '芬园', 497, 'f', 'fy', 'fenyuan', '', '乡', '1000709', '', 9);
INSERT INTO `youbang_sys_area` VALUES (3441, '员林', 497, 'y', 'yl', 'yuanlin', '', '镇', '1000710', '', 10);
INSERT INTO `youbang_sys_area` VALUES (3442, '溪湖', 497, 'x', 'xh', 'xihu', '', '镇', '1000711', '', 11);
INSERT INTO `youbang_sys_area` VALUES (3443, '田中', 497, 't', 'tz', 'tianzhong', '', '镇', '1000712', '', 12);
INSERT INTO `youbang_sys_area` VALUES (3444, '大村', 497, 'd', 'dc', 'dacun', '', '乡', '1000713', '', 13);
INSERT INTO `youbang_sys_area` VALUES (3445, '埔盐', 497, 'p', 'py', 'puyan', '', '乡', '1000714', '', 14);
INSERT INTO `youbang_sys_area` VALUES (3446, '埔心', 497, 'p', 'px', 'puxin', '', '乡', '1000715', '', 15);
INSERT INTO `youbang_sys_area` VALUES (3447, '永靖', 497, 'y', 'yj', 'yongjing', '', '乡', '1000716', '', 16);
INSERT INTO `youbang_sys_area` VALUES (3448, '社头', 497, 's', 'st', 'shetou', '', '乡', '1000717', '', 17);
INSERT INTO `youbang_sys_area` VALUES (3449, '二水', 497, 'e', 'es', 'ershui', '', '乡', '1000718', '', 18);
INSERT INTO `youbang_sys_area` VALUES (3450, '北斗', 497, 'b', 'bd', 'beidou', '', '镇', '1000719', '', 19);
INSERT INTO `youbang_sys_area` VALUES (3451, '二林', 497, 'e', 'el', 'erlin', '', '镇', '1000720', '', 20);
INSERT INTO `youbang_sys_area` VALUES (3452, '田尾', 497, 't', 'tw', 'tianwei', '', '乡', '1000721', '', 21);
INSERT INTO `youbang_sys_area` VALUES (3453, '埤头', 497, 'p', 'pt', 'pitou', '', '乡', '1000722', '', 22);
INSERT INTO `youbang_sys_area` VALUES (3454, '芳苑', 497, 'f', 'fy', 'fangyuan', '', '乡', '1000723', '', 23);
INSERT INTO `youbang_sys_area` VALUES (3455, '大城', 497, 'd', 'dc', 'dacheng', '', '乡', '1000724', '', 24);
INSERT INTO `youbang_sys_area` VALUES (3456, '竹塘', 497, 'z', 'zt', 'zhutang', '', '乡', '1000725', '', 25);
INSERT INTO `youbang_sys_area` VALUES (3457, '溪州', 497, 'x', 'xz', 'xizhou', '', '乡', '1000726', '', 26);
INSERT INTO `youbang_sys_area` VALUES (3458, '南投', 498, 'n', 'nt', 'nantou', '', '市', '1000801', '', 1);
INSERT INTO `youbang_sys_area` VALUES (3459, '南投', 498, 'n', 'nt', 'nantou', '', '镇', '1000802', '', 2);
INSERT INTO `youbang_sys_area` VALUES (3460, '草屯', 498, 'c', 'ct', 'caotun', '', '镇', '1000803', '', 3);
INSERT INTO `youbang_sys_area` VALUES (3461, '竹山', 498, 'z', 'zs', 'zhushan', '', '镇', '1000804', '', 4);
INSERT INTO `youbang_sys_area` VALUES (3462, '集集', 498, 'j', 'jj', 'jiji', '', '镇', '1000805', '', 5);
INSERT INTO `youbang_sys_area` VALUES (3463, '名间', 498, 'm', 'mj', 'mingjian', '', '乡', '1000806', '', 6);
INSERT INTO `youbang_sys_area` VALUES (3464, '鹿谷', 498, 'l', 'lg', 'lugu', '', '乡', '1000807', '', 7);
INSERT INTO `youbang_sys_area` VALUES (3465, '中寮', 498, 'z', 'zl', 'zhongliao', '', '乡', '1000808', '', 8);
INSERT INTO `youbang_sys_area` VALUES (3466, '鱼池', 498, 'y', 'yc', 'yuchi', '', '乡', '1000809', '', 9);
INSERT INTO `youbang_sys_area` VALUES (3467, '国姓', 498, 'g', 'gx', 'guoxing', '', '乡', '1000810', '', 10);
INSERT INTO `youbang_sys_area` VALUES (3468, '水里', 498, 's', 'sl', 'shuili', '', '乡', '1000811', '', 11);
INSERT INTO `youbang_sys_area` VALUES (3469, '信义', 498, 'x', 'xy', 'xinyi', '', '乡', '1000812', '', 12);
INSERT INTO `youbang_sys_area` VALUES (3470, '仁爱', 498, 'r', 'ra', 'renai', '', '乡', '1000813', '', 13);
INSERT INTO `youbang_sys_area` VALUES (3471, '斗六', 499, 'd', 'dl', 'douliu', '', '市', '1000901', '', 1);
INSERT INTO `youbang_sys_area` VALUES (3472, '斗南', 499, 'd', 'dn', 'dounan', '', '镇', '1000902', '', 2);
INSERT INTO `youbang_sys_area` VALUES (3473, '虎尾', 499, 'h', 'hw', 'huwei', '', '镇', '1000903', '', 3);
INSERT INTO `youbang_sys_area` VALUES (3474, '西螺', 499, 'x', 'xl', 'xiluo', '', '镇', '1000904', '', 4);
INSERT INTO `youbang_sys_area` VALUES (3475, '土库', 499, 't', 'tk', 'tuku', '', '镇', '1000905', '', 5);
INSERT INTO `youbang_sys_area` VALUES (3476, '北港', 499, 'b', 'bg', 'beigang', '', '镇', '1000906', '', 6);
INSERT INTO `youbang_sys_area` VALUES (3477, '古坑', 499, 'g', 'gk', 'gukeng', '', '乡', '1000907', '', 7);
INSERT INTO `youbang_sys_area` VALUES (3478, '大埤', 499, 'd', 'dp', 'dapi', '', '乡', '1000908', '', 8);
INSERT INTO `youbang_sys_area` VALUES (3479, '莿桐', 499, 'c', 'ct', 'citong', '', '乡', '1000909', '', 9);
INSERT INTO `youbang_sys_area` VALUES (3480, '林内', 499, 'l', 'ln', 'linnei', '', '乡', '1000910', '', 10);
INSERT INTO `youbang_sys_area` VALUES (3481, '二仑', 499, 'e', 'el', 'erlun', '', '乡', '1000911', '', 11);
INSERT INTO `youbang_sys_area` VALUES (3482, '仑背', 499, 'l', 'lb', 'lunbei', '', '乡', '1000912', '', 12);
INSERT INTO `youbang_sys_area` VALUES (3483, '麦寮', 499, 'm', 'ml', 'mailiao', '', '乡', '1000913', '', 13);
INSERT INTO `youbang_sys_area` VALUES (3484, '东势', 499, 'd', 'ds', 'dongshi', '', '乡', '1000914', '', 14);
INSERT INTO `youbang_sys_area` VALUES (3485, '褒忠', 499, 'b', 'bz', 'baozhong', '', '乡', '1000915', '', 15);
INSERT INTO `youbang_sys_area` VALUES (3486, '台西', 499, 't', 'tx', 'taixi', '', '乡', '1000916', '', 16);
INSERT INTO `youbang_sys_area` VALUES (3487, '元长', 499, 'y', 'yc', 'yuanchang', '', '乡', '1000917', '', 17);
INSERT INTO `youbang_sys_area` VALUES (3488, '四湖', 499, 's', 'sh', 'sihu', '', '乡', '1000918', '', 18);
INSERT INTO `youbang_sys_area` VALUES (3489, '口湖', 499, 'k', 'kh', 'kouhu', '', '乡', '1000919', '', 19);
INSERT INTO `youbang_sys_area` VALUES (3490, '水林', 499, 's', 'sl', 'shuilin', '', '乡', '1000920', '', 20);
INSERT INTO `youbang_sys_area` VALUES (3491, '太保', 500, 't', 'tb', 'taibao', '', '市', '', '', 1);
INSERT INTO `youbang_sys_area` VALUES (3492, '朴子', 500, 'p', 'pz', 'pozi', '', '市', '', '', 2);
INSERT INTO `youbang_sys_area` VALUES (3493, '布袋', 500, 'b', 'bd', 'budai', '', '镇', '', '', 3);
INSERT INTO `youbang_sys_area` VALUES (3494, '大林', 500, 'd', 'dl', 'dalin', '', '镇', '10010', '', 4);
INSERT INTO `youbang_sys_area` VALUES (3495, '民雄', 500, 'm', 'mx', 'minxiong', '', '乡', '1001001', '', 5);
INSERT INTO `youbang_sys_area` VALUES (3496, '溪口', 500, 'x', 'xk', 'xikou', '', '乡', '1001002', '', 6);
INSERT INTO `youbang_sys_area` VALUES (3497, '新港', 500, 'x', 'xg', 'xingang', '', '乡', '1001003', '', 7);
INSERT INTO `youbang_sys_area` VALUES (3498, '六脚', 500, 'l', 'lj', 'liujiao', '', '乡', '1001004', '', 8);
INSERT INTO `youbang_sys_area` VALUES (3499, '东石', 500, 'd', 'ds', 'dongshi', '', '乡', '1001005', '', 9);
INSERT INTO `youbang_sys_area` VALUES (3500, '义竹', 500, 'y', 'yz', 'yizhu', '', '乡', '1001006', '', 10);
INSERT INTO `youbang_sys_area` VALUES (3501, '鹿草', 500, 'l', 'lc', 'lucao', '', '乡', '1001007', '', 11);
INSERT INTO `youbang_sys_area` VALUES (3502, '水上', 500, 's', 'ss', 'shuishang', '', '乡', '1001008', '', 12);
INSERT INTO `youbang_sys_area` VALUES (3503, '中埔', 500, 'z', 'zp', 'zhongpu', '', '乡', '1001009', '', 13);
INSERT INTO `youbang_sys_area` VALUES (3504, '竹崎', 500, 'z', 'zq', 'zhuqi', '', '乡', '1001010', '', 14);
INSERT INTO `youbang_sys_area` VALUES (3505, '梅山', 500, 'm', 'ms', 'meishan', '', '乡', '1001011', '', 15);
INSERT INTO `youbang_sys_area` VALUES (3506, '番路', 500, 'f', 'fl', 'fanlu', '', '乡', '1001012', '', 16);
INSERT INTO `youbang_sys_area` VALUES (3507, '大埔', 500, 'd', 'dp', 'dapu', '', '乡', '1001013', '', 17);
INSERT INTO `youbang_sys_area` VALUES (3508, '阿里山', 500, 'a', 'als', 'alishan', '', '乡', '1001014', '', 18);
INSERT INTO `youbang_sys_area` VALUES (3509, '屏东', 501, 'p', 'pd', 'pingdong', '', '市', '1001301', '', 1);
INSERT INTO `youbang_sys_area` VALUES (3510, '潮州', 501, 'c', 'cz', 'chaozhou', '', '镇', '1001302', '', 2);
INSERT INTO `youbang_sys_area` VALUES (3511, '东港', 501, 'd', 'dg', 'donggang', '', '镇', '1001303', '', 3);
INSERT INTO `youbang_sys_area` VALUES (3512, '恒春', 501, 'h', 'hc', 'hengchun', '', '镇', '1001304', '', 4);
INSERT INTO `youbang_sys_area` VALUES (3513, '万丹', 501, 'w', 'wd', 'wandan', '', '乡', '1001305', '', 5);
INSERT INTO `youbang_sys_area` VALUES (3514, '长治', 501, 'c', 'cz', 'changzhi', '', '乡', '1001306', '', 6);
INSERT INTO `youbang_sys_area` VALUES (3515, '麟洛', 501, 'l', 'll', 'linluo', '', '乡', '1001307', '', 7);
INSERT INTO `youbang_sys_area` VALUES (3516, '九如', 501, 'j', 'jr', 'jiuru', '', '乡', '1001308', '', 8);
INSERT INTO `youbang_sys_area` VALUES (3517, '里港', 501, 'l', 'lg', 'ligang', '', '乡', '1001309', '', 9);
INSERT INTO `youbang_sys_area` VALUES (3518, '盐埔', 501, 'y', 'yp', 'yanpu', '', '乡', '1001310', '', 10);
INSERT INTO `youbang_sys_area` VALUES (3519, '高树', 501, 'g', 'gs', 'gaoshu', '', '乡', '1001311', '', 11);
INSERT INTO `youbang_sys_area` VALUES (3520, '万峦', 501, 'w', 'wl', 'wanluan', '', '乡', '1001312', '', 12);
INSERT INTO `youbang_sys_area` VALUES (3521, '内埔', 501, 'n', 'np', 'neipu', '', '乡', '1001313', '', 13);
INSERT INTO `youbang_sys_area` VALUES (3522, '竹田', 501, 'z', 'zt', 'zhutian', '', '乡', '1001314', '', 14);
INSERT INTO `youbang_sys_area` VALUES (3523, '新埤', 501, 'x', 'xp', 'xinpi', '', '乡', '1001315', '', 15);
INSERT INTO `youbang_sys_area` VALUES (3524, '枋寮', 501, 'f', 'fl', 'fangliao', '', '乡', '1001316', '', 16);
INSERT INTO `youbang_sys_area` VALUES (3525, '新园', 501, 'x', 'xy', 'xinyuan', '', '乡', '1001317', '', 17);
INSERT INTO `youbang_sys_area` VALUES (3526, '崁顶', 501, 'k', 'kd', 'kanding', '', '乡', '1001318', '', 18);
INSERT INTO `youbang_sys_area` VALUES (3527, '林边', 501, 'l', 'lb', 'linbian', '', '乡', '1001319', '', 19);
INSERT INTO `youbang_sys_area` VALUES (3528, '南州', 501, 'n', 'nz', 'nanzhou', '', '乡', '1001320', '', 20);
INSERT INTO `youbang_sys_area` VALUES (3529, '佳冬', 501, 'j', 'jd', 'jiadong', '', '乡', '1001321', '', 21);
INSERT INTO `youbang_sys_area` VALUES (3530, '琉球', 501, 'l', 'lq', 'liuqiu', '', '乡', '1001322', '', 22);
INSERT INTO `youbang_sys_area` VALUES (3531, '车城', 501, 'c', 'cc', 'checheng', '', '乡', '1001323', '', 23);
INSERT INTO `youbang_sys_area` VALUES (3532, '满州', 501, 'm', 'mz', 'manzhou', '', '乡', '1001324', '', 24);
INSERT INTO `youbang_sys_area` VALUES (3533, '枋山', 501, 'f', 'fs', 'fangshan', '', '乡', '1001325', '', 25);
INSERT INTO `youbang_sys_area` VALUES (3534, '三地门', 501, 's', 'sdm', 'sandimen', '', '乡', '1001326', '', 26);
INSERT INTO `youbang_sys_area` VALUES (3535, '雾台', 501, 'w', 'wt', 'wutai', '', '乡', '1001327', '', 27);
INSERT INTO `youbang_sys_area` VALUES (3536, '玛家', 501, 'm', 'mj', 'majia', '', '乡', '1001328', '', 28);
INSERT INTO `youbang_sys_area` VALUES (3537, '泰武', 501, 't', 'tw', 'taiwu', '', '乡', '1001329', '', 29);
INSERT INTO `youbang_sys_area` VALUES (3538, '来义', 501, 'l', 'ly', 'laiyi', '', '乡', '1001330', '', 30);
INSERT INTO `youbang_sys_area` VALUES (3539, '春日', 501, 'c', 'cr', 'chunri', '', '乡', '1001331', '', 31);
INSERT INTO `youbang_sys_area` VALUES (3540, '狮子', 501, 's', 'sz', 'shizi', '', '乡', '1001332', '', 32);
INSERT INTO `youbang_sys_area` VALUES (3541, '牡丹', 501, 'm', 'md', 'mudan', '', '乡', '1001333', '', 33);
INSERT INTO `youbang_sys_area` VALUES (3542, '卑南', 502, 'b', 'bn', 'beinan', '', '乡', '', '', 1);
INSERT INTO `youbang_sys_area` VALUES (3543, '台东', 502, 't', 'td', 'taidong', '', '市', '1001401', '', 2);
INSERT INTO `youbang_sys_area` VALUES (3544, '成功', 502, 'c', 'cg', 'chenggong', '', '镇', '1001402', '', 3);
INSERT INTO `youbang_sys_area` VALUES (3545, '关山', 502, 'g', 'gs', 'guanshan', '', '镇', '1001403', '', 4);
INSERT INTO `youbang_sys_area` VALUES (3546, '鹿野', 502, 'l', 'ly', 'luye', '', '乡', '1001405', '', 5);
INSERT INTO `youbang_sys_area` VALUES (3547, '池上', 502, 'c', 'cs', 'chishang', '', '乡', '1001406', '', 6);
INSERT INTO `youbang_sys_area` VALUES (3548, '东河', 502, 'd', 'dh', 'donghe', '', '乡', '1001407', '', 7);
INSERT INTO `youbang_sys_area` VALUES (3549, '长滨', 502, 'c', 'cb', 'changbin', '', '乡', '1001408', '', 8);
INSERT INTO `youbang_sys_area` VALUES (3550, '太麻里', 502, 't', 'tml', 'taimali', '', '乡', '1001409', '', 9);
INSERT INTO `youbang_sys_area` VALUES (3551, '大武', 502, 'd', 'dw', 'dawu', '', '乡', '1001410', '', 10);
INSERT INTO `youbang_sys_area` VALUES (3552, '绿岛', 502, 'l', 'ld', 'lu:dao', '', '乡', '1001411', '', 11);
INSERT INTO `youbang_sys_area` VALUES (3553, '海端', 502, 'h', 'hd', 'haiduan', '', '乡', '1001412', '', 12);
INSERT INTO `youbang_sys_area` VALUES (3554, '延平', 502, 'y', 'yp', 'yanping', '', '乡', '1001413', '', 13);
INSERT INTO `youbang_sys_area` VALUES (3555, '金峰', 502, 'j', 'jf', 'jinfeng', '', '乡', '1001414', '', 14);
INSERT INTO `youbang_sys_area` VALUES (3556, '达仁', 502, 'd', 'dr', 'daren', '', '乡', '1001415', '', 15);
INSERT INTO `youbang_sys_area` VALUES (3557, '兰屿', 502, 'l', 'ly', 'lanyu', '', '乡', '1001416', '', 16);
INSERT INTO `youbang_sys_area` VALUES (3558, '花莲', 503, 'h', 'hl', 'hualian', '', '市', '1001501', '', 1);
INSERT INTO `youbang_sys_area` VALUES (3559, '凤林', 503, 'f', 'fl', 'fenglin', '', '镇', '1001502', '', 2);
INSERT INTO `youbang_sys_area` VALUES (3560, '玉里', 503, 'y', 'yl', 'yuli', '', '镇', '1001503', '', 3);
INSERT INTO `youbang_sys_area` VALUES (3561, '新城', 503, 'x', 'xc', 'xincheng', '', '乡', '1001504', '', 4);
INSERT INTO `youbang_sys_area` VALUES (3562, '吉安', 503, 'j', 'ja', 'jian', '', '乡', '1001505', '', 5);
INSERT INTO `youbang_sys_area` VALUES (3563, '寿丰', 503, 's', 'sf', 'shoufeng', '', '乡', '1001506', '', 6);
INSERT INTO `youbang_sys_area` VALUES (3564, '光复', 503, 'g', 'gf', 'guangfu', '', '乡', '1001507', '', 7);
INSERT INTO `youbang_sys_area` VALUES (3565, '丰滨', 503, 'f', 'fb', 'fengbin', '', '乡', '1001508', '', 8);
INSERT INTO `youbang_sys_area` VALUES (3566, '瑞穗', 503, 'r', 'rs', 'ruisui', '', '乡', '1001509', '', 9);
INSERT INTO `youbang_sys_area` VALUES (3567, '富里', 503, 'f', 'fl', 'fuli', '', '乡', '1001510', '', 10);
INSERT INTO `youbang_sys_area` VALUES (3568, '秀林', 503, 'x', 'xl', 'xiulin', '', '乡', '1001511', '', 11);
INSERT INTO `youbang_sys_area` VALUES (3569, '万荣', 503, 'w', 'wr', 'wanrong', '', '乡', '1001512', '', 12);
INSERT INTO `youbang_sys_area` VALUES (3570, '卓溪', 503, 'z', 'zx', 'zhuoxi', '', '乡', '1001513', '', 13);
INSERT INTO `youbang_sys_area` VALUES (3571, '马公', 504, 'm', 'mg', 'magong', '', '市', '1001601', '07', 1);
INSERT INTO `youbang_sys_area` VALUES (3572, '湖西', 504, 'h', 'hx', 'huxi', '', '乡', '1001602', '07', 2);
INSERT INTO `youbang_sys_area` VALUES (3573, '白沙', 504, 'b', 'bs', 'baisha', '', '乡', '1001603', '07', 3);
INSERT INTO `youbang_sys_area` VALUES (3574, '西屿', 504, 'x', 'xy', 'xiyu', '', '乡', '1001604', '07', 4);
INSERT INTO `youbang_sys_area` VALUES (3575, '望安', 504, 'w', 'wa', 'wangan', '', '乡', '1001605', '07', 5);
INSERT INTO `youbang_sys_area` VALUES (3576, '七美', 504, 'q', 'qm', 'qimei', '', '乡', '1001606', '07', 6);
INSERT INTO `youbang_sys_area` VALUES (3577, '双河', 31, 's', 'sh', 'shuanghe', '', '市', '659007', '0909', 21);
INSERT INTO `youbang_sys_area` VALUES (3578, '海棠', 357, 'h', 'ht', 'haitang', '', '区', '', '0898', 1);
INSERT INTO `youbang_sys_area` VALUES (3579, '吉阳', 357, 'j', 'jy', 'jiyang', '', '区', '', '0898', 2);
INSERT INTO `youbang_sys_area` VALUES (3580, '天涯', 357, 't', 'ty', 'tianya', '', '区', '', '0898', 3);
INSERT INTO `youbang_sys_area` VALUES (3581, '崖州', 357, 'y', 'yz', 'yazhou', '', '区', '', '0898', 4);
INSERT INTO `youbang_sys_area` VALUES (3582, '霍尔果斯', 476, 'h', 'hegs', 'huoerguosi', '', '市', '654004', '0999', 3);
INSERT INTO `youbang_sys_area` VALUES (3583, '前锋', 388, 'q', 'qf', 'qianfeng', '', '区', '', '0826', 2);
INSERT INTO `youbang_sys_area` VALUES (3584, '福绵', 350, 'f', 'fm', 'fumian', '', '区', '450903', '0775', 2);
INSERT INTO `youbang_sys_area` VALUES (3585, '可克达拉', 31, 'k', 'kdkl', 'kedakela', '', '市', '659008', '0999', 22);
INSERT INTO `youbang_sys_area` VALUES (7036, '龙华', 323, 'l', 'lh', 'longhua', '', '区', '', '0755', 7);
INSERT INTO `youbang_sys_area` VALUES (7037, '坪山', 323, 'p', 'ps', 'pingshan', '', '区', '', '0755', 8);
INSERT INTO `youbang_sys_area` VALUES (7038, '昆玉', 31, 'k', 'ky', 'kunyu', '', '市', '659009', '0903', 23);
INSERT INTO `youbang_sys_area` VALUES (7039, '平桂', 352, 'p', 'pg', 'pinggui', '', '区', '', '0774', 2);
INSERT INTO `youbang_sys_area` VALUES (7040, '巴什', 152, 'b', 'bs', 'bashi', '', '区', '', '0477', 9);
INSERT INTO `youbang_sys_area` VALUES (7041, '叶集', 231, 'y', 'yj', 'yeji', '', '区', '', '0564', 8);

-- ----------------------------
-- Table structure for youbang_sys_logo
-- ----------------------------
DROP TABLE IF EXISTS `youbang_sys_logo`;
CREATE TABLE `youbang_sys_logo`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '缓存在服务器如：Memcache',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '经度',
  `width` int(11) NULL DEFAULT NULL COMMENT '宽度',
  `height` int(11) NULL DEFAULT NULL COMMENT '高度',
  `enabled` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '高度',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for youbang_sys_map
-- ----------------------------
DROP TABLE IF EXISTS `youbang_sys_map`;
CREATE TABLE `youbang_sys_map`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '缓存在服务器如：Memcache',
  `lx` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '经度',
  `ly` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '纬度',
  `Location` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT 'IP跳转到当前城市',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for youbang_sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `youbang_sys_menu`;
CREATE TABLE `youbang_sys_menu`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0 COMMENT '上级菜单id',
  `icon` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单图标（css名称）',
  `name` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '100' COMMENT '菜单名称',
  `weight` smallint(6) NULL DEFAULT NULL COMMENT '排序',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单地址',
  `show` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否在菜单栏显示',
  `valid` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '1请示时需要校验操作权限',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30909 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of youbang_sys_menu
-- ----------------------------
INSERT INTO `youbang_sys_menu` VALUES (1, 0, 'icon', '首页', 0, '/admin/index/index', '1', '0');
INSERT INTO `youbang_sys_menu` VALUES (2, 0, 'icon', '系统管理', 0, '', '1', '1');
INSERT INTO `youbang_sys_menu` VALUES (3, 0, 'icon', '项目管理', 0, '', '1', '1');
INSERT INTO `youbang_sys_menu` VALUES (101, 1, 'icon', '数据走势', 0, '/admin/index/index', '1', '1');
INSERT INTO `youbang_sys_menu` VALUES (102, 1, 'icon', '退出系统', 0, '/admin/sign/_exit', '1', '1');
INSERT INTO `youbang_sys_menu` VALUES (201, 2, 'icon', '系统设置', 0, NULL, '1', '1');
INSERT INTO `youbang_sys_menu` VALUES (202, 2, 'icon', '用户组管理', 0, NULL, '1', '1');
INSERT INTO `youbang_sys_menu` VALUES (203, 2, 'icon', '用户管理', 0, NULL, '1', '1');
INSERT INTO `youbang_sys_menu` VALUES (204, 2, 'icon', '权限管理', 0, NULL, '1', '1');
INSERT INTO `youbang_sys_menu` VALUES (205, 2, 'icon', '栏目管理', 0, '', '1', '1');
INSERT INTO `youbang_sys_menu` VALUES (206, 2, 'icon', '原数据管理', 0, NULL, '1', '1');
INSERT INTO `youbang_sys_menu` VALUES (207, 2, 'icon', '应用', 0, '/admin/component/index', '1', '1');
INSERT INTO `youbang_sys_menu` VALUES (301, 3, 'icon', '工程信息', 0, NULL, '1', '1');
INSERT INTO `youbang_sys_menu` VALUES (302, 3, 'icon', '企业信息', 0, NULL, '1', '1');
INSERT INTO `youbang_sys_menu` VALUES (303, 3, 'icon', '劳务信息管理', 0, NULL, '1', '1');
INSERT INTO `youbang_sys_menu` VALUES (304, 3, 'icon', '装饰装修', 0, NULL, '1', '1');
INSERT INTO `youbang_sys_menu` VALUES (305, 3, 'icon', '金融合作', 0, NULL, '1', '1');
INSERT INTO `youbang_sys_menu` VALUES (306, 3, 'icon', '工程机械', 0, NULL, '1', '1');
INSERT INTO `youbang_sys_menu` VALUES (307, 3, 'icon', '租房售房', 0, NULL, '1', '1');
INSERT INTO `youbang_sys_menu` VALUES (308, 3, 'icon', '店铺管理', 0, NULL, '1', '1');
INSERT INTO `youbang_sys_menu` VALUES (309, 3, 'icon', '人才信息管理', 0, '', '1', '1');
INSERT INTO `youbang_sys_menu` VALUES (20101, 201, 'icon', '基本设置', 0, '/admin/sys/bases', '1', '1');
INSERT INTO `youbang_sys_menu` VALUES (20102, 201, 'icon', '安全设置', 0, '/admin/sys/securitySet', '1', '1');
INSERT INTO `youbang_sys_menu` VALUES (20103, 201, 'icon', '验证码设置', 0, '/admin/sys/code', '1', '1');
INSERT INTO `youbang_sys_menu` VALUES (20104, 201, 'icon', '网站logo', 0, '/admin/sys/logo', '1', '1');
INSERT INTO `youbang_sys_menu` VALUES (20105, 201, 'icon', '地图设置', 0, '/admin/sys/mapSet', '1', '1');
INSERT INTO `youbang_sys_menu` VALUES (20106, 201, 'icon', '缓存设置 ', 0, '/admin/sys/cache', '1', '1');
INSERT INTO `youbang_sys_menu` VALUES (20107, 201, 'icon', '上传设置', 0, '/admin/sys/upload', '1', '1');
INSERT INTO `youbang_sys_menu` VALUES (20108, 201, 'icon', '友情链接', 0, '/admin/sys/flink', '1', '1');
INSERT INTO `youbang_sys_menu` VALUES (20201, 202, 'icon', '添加用户组', 0, '/admin/group/addGroup', '1', '1');
INSERT INTO `youbang_sys_menu` VALUES (20202, 202, 'icon', '管理用户组', 0, '/admin/group/groupList', '1', '1');
INSERT INTO `youbang_sys_menu` VALUES (20301, 203, 'icon', '添加用户', 0, '/admin/manage/addManage', '1', '1');
INSERT INTO `youbang_sys_menu` VALUES (20302, 203, 'icon', '管理用户', 0, '/admin/manage/listManage', '1', '1');
INSERT INTO `youbang_sys_menu` VALUES (20401, 204, 'icon', '组权限', 0, '/admin/permit/getGroupAll', '1', '1');
INSERT INTO `youbang_sys_menu` VALUES (20402, 204, 'icon', '用户权限', 0, '/admin/permit/getAcountAll', '1', '1');
INSERT INTO `youbang_sys_menu` VALUES (20501, 205, 'icon', '添加栏目 ', 0, '/admin/type/add', '1', '1');
INSERT INTO `youbang_sys_menu` VALUES (20502, 205, 'icon', '管理栏目', 0, '/admin/type/index', '1', '1');
INSERT INTO `youbang_sys_menu` VALUES (20503, 205, 'icon', '保存栏目信息', 0, '/admin/type/save', '0', '1');
INSERT INTO `youbang_sys_menu` VALUES (20601, 206, 'icon', '下拉列表\r\n', 0, NULL, '1', '1');
INSERT INTO `youbang_sys_menu` VALUES (20701, 207, 'icon', '应用列表', 0, '/admin/component/index', '1', '1');
INSERT INTO `youbang_sys_menu` VALUES (20702, 207, 'icon', '添加应用', 0, '/admin/component/add', '1', '1');
INSERT INTO `youbang_sys_menu` VALUES (20703, 207, 'icon', '编辑应用', 0, '/admin/component/edt', '1', '1');
INSERT INTO `youbang_sys_menu` VALUES (30101, 301, 'icon', '发布工程信息', 0, '/admin/arc/add/ctag/infos', '1', '1');
INSERT INTO `youbang_sys_menu` VALUES (30102, 301, 'icon', '查看信息', 0, '/admin/arc/show/ctag/infos', '1', '1');
INSERT INTO `youbang_sys_menu` VALUES (30103, 301, 'icon', '添加栏目', 0, '/admin/type/add/ctag/infos', '1', '1');
INSERT INTO `youbang_sys_menu` VALUES (30104, 301, 'icon', '查看栏目', 0, '/admin/type/index/ctag/infos', '1', '1');
INSERT INTO `youbang_sys_menu` VALUES (30105, 301, 'icon', '管理分类', 0, '/admin/classify/index/ctag/infos', '1', '1');
INSERT INTO `youbang_sys_menu` VALUES (30106, 301, 'icon', '信息概览', 0, NULL, '1', '1');
INSERT INTO `youbang_sys_menu` VALUES (30201, 302, 'icon', '发布企业信息', 0, NULL, '1', '1');
INSERT INTO `youbang_sys_menu` VALUES (30202, 302, 'icon', '查看信息', 0, NULL, '1', '1');
INSERT INTO `youbang_sys_menu` VALUES (30203, 302, 'icon', '信息概览', 0, NULL, '1', '1');
INSERT INTO `youbang_sys_menu` VALUES (30301, 303, 'icon', '发布劳务信息', 0, '/admin/arc/add/ctag/perrecruit', '1', '1');
INSERT INTO `youbang_sys_menu` VALUES (30302, 303, 'icon', '查看劳务信息', 0, '/admin/arc/show/ctag/perrecruit', '1', '1');
INSERT INTO `youbang_sys_menu` VALUES (30303, 303, 'icon', '添加栏目', 0, '/admin/type/add/ctag/perrecruit', '1', '1');
INSERT INTO `youbang_sys_menu` VALUES (30304, 303, 'icon', '查看栏目', 0, '/admin/type/index/ctag/perrecruit', '1', '1');
INSERT INTO `youbang_sys_menu` VALUES (30305, 303, 'icon', '管理分类', 0, '/admin/classify/index/ctag/perrecruit', '1', '1');
INSERT INTO `youbang_sys_menu` VALUES (30306, 303, 'icon', '信息概览', 0, NULL, '1', '1');
INSERT INTO `youbang_sys_menu` VALUES (30801, 308, 'icon', '添加商品', 0, '/admin/arc/add/ctag/commodities', '1', '1');
INSERT INTO `youbang_sys_menu` VALUES (30802, 308, 'icon', '所有商品', 0, '/admin/arc/show/ctag/commodities', '1', '1');
INSERT INTO `youbang_sys_menu` VALUES (30803, 308, 'icon', '添加栏目', 0, '/admin/type/add/ctag/commodities', '1', '1');
INSERT INTO `youbang_sys_menu` VALUES (30804, 308, 'icon', '查看栏目', 0, '/admin/type/index/ctag/commodities', '1', '1');
INSERT INTO `youbang_sys_menu` VALUES (30805, 308, 'icon', '管理分类', 0, '/admin/classify/index/ctag/commodities', '1', '1');
INSERT INTO `youbang_sys_menu` VALUES (30806, 308, 'icon', '商城概览', 0, NULL, '1', '1');
INSERT INTO `youbang_sys_menu` VALUES (30807, 308, 'icon', '管理订单', 0, '/admin/order/index', '1', '1');
INSERT INTO `youbang_sys_menu` VALUES (30901, 309, 'icon', '发布求职信息', 0, '/admin/arc/add/ctag/jobwanted', '1', '1');
INSERT INTO `youbang_sys_menu` VALUES (30902, 309, 'icon', '查看求职信息', 0, '/admin/arc/show/ctag/jobwanted', '1', '1');
INSERT INTO `youbang_sys_menu` VALUES (30903, 309, 'icon', '添加栏目', 0, '/admin/type/add/ctag/jobwanted', '1', '1');
INSERT INTO `youbang_sys_menu` VALUES (30904, 309, 'icon', '查看栏目', 0, '/admin/type/index/ctag/jobwanted', '1', '1');
INSERT INTO `youbang_sys_menu` VALUES (30905, 309, 'icon', '管理分类', 0, '/admin/classify/index/ctag/jobwanted', '1', '1');
INSERT INTO `youbang_sys_menu` VALUES (30906, 309, 'icon', '信息概览', 0, NULL, '1', '1');

-- ----------------------------
-- Table structure for youbang_sys_option
-- ----------------------------
DROP TABLE IF EXISTS `youbang_sys_option`;
CREATE TABLE `youbang_sys_option`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tagname` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目标识',
  `name` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目名称',
  `key1` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注1',
  `enabled` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否启用',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统参数表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of youbang_sys_option
-- ----------------------------
INSERT INTO `youbang_sys_option` VALUES (1, 'SYS_UPDATE', '上传配置', '{\"fileSize\":\"5\",\"imgFileSize\":\"5\",\"imgTtype\":\"png,jpg,jpeg,bmp,gif\",\"fileType\":\"rar,zip,doc,docx,xls,xlsx\"}', '1');
INSERT INTO `youbang_sys_option` VALUES (2, 'SYS_CACHE', '缓存配置', '{\"redis\":\"1\",\"local\":\"127.0.0.1\",\"port\":\"6379\",\"cacheTime\":\"3600\"}', '1');
INSERT INTO `youbang_sys_option` VALUES (3, 'SYS_MAP', '地图配置', '{\"urlMap\":\"1\",\"mapKey\":\"F9bfbeb26054d97898571a1df965d8af\",\"x\":\"104.873715\",\"y\":\"25.101647\"}', '1');
INSERT INTO `youbang_sys_option` VALUES (4, 'SYS_LOGO', 'logo配置', '{\"pcImage\":\"files/2019/7/8/8b99f4257c74aff6650f3036cecb6910.jpe\",\"menberImage\":\"files/2019/7/8/8b99f4257c74aff6650f3036cecb6910.jpe\",\"merchantImage\":\"files/2019/7/8/8b99f4257c74aff6650f3036cecb6910.jpe\",\"mobelImage\":\"files/2019/7/8/8b99f4257c74aff6650f3036cecb6910.jpe\",\"wapImage\":\"files/2019/7/8/c128703829266e744e4f0b16afb807c4.png\"}', '1');
INSERT INTO `youbang_sys_option` VALUES (5, 'SYS_CODE', '验证码配置', '{\"codeSwitch\":[\"reg\",\"index\",\"admin\"],\"codeType\":\"english\",\"codeImgType\":\"png\",\"codeImgFize\":\"200*50\",\"codeLength\":\"4\"}', '1');
INSERT INTO `youbang_sys_option` VALUES (6, 'SYS_SECUR', '安全配置', '{\"securityCode\":\"pykjpykj\",\"filterKey\":\"撒大声地实打实\",\"repKey\":\"萨达\",\"prohibitIP\":\"127.0.0.1\"}', '1');
INSERT INTO `youbang_sys_option` VALUES (7, 'SYS_BASIC', '基本配置', '{\"webName\":\"友邦拉拉工程信息平台\",\"webAddress\":\"https://www/youbanglala.com\",\"webSwitch\":\"1\",\"webList\":\"10\",\"closeReason\":\"网站升级中，请联系管理员！\",\"webCopyright\":\"Copyright C 2019 All Rights Reserved 版权所有 友邦拉拉，拉拉友邦\",\"webkeyWords\":\"友邦拉拉工程信息平台\",\"webDiscripts\":\"友邦拉拉工程信息平台\",\"webEmail\":\"88888888@qq.com\",\"webPhone\":\"188888888888\",\"webFxa\":\"0859-88888888\",\"recordNo\":\"黔ICP备4549413号-3\",\"serviceMobel\":\"0859-8888888\",\"workTime\":\"9:00-18:00\",\"serviceQQ\":\"123456789\",\"compAddress\":\"黔西南兴义市某某街道某某号\",\"statisticalCcode\":\"\"}', '1');

-- ----------------------------
-- Table structure for youbang_sys_permit
-- ----------------------------
DROP TABLE IF EXISTS `youbang_sys_permit`;
CREATE TABLE `youbang_sys_permit`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `userId` int(11) NULL DEFAULT NULL,
  `groupId` int(4) NULL DEFAULT NULL COMMENT '组id',
  `menuId` smallint(6) NULL DEFAULT NULL,
  `add` enum('-1','0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '-1无相关操作0禁用操作1启用操作',
  `delete` enum('-1','0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '-1无相关操作0禁用操作1启用操作',
  `edit` enum('-1','0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '-1无相关操作0禁用操作1启用操作',
  `show` enum('-1','0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '-1无相关操作0禁查看页面1允许查看页面',
  `enable` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否为id对应的用户开放权限,0禁止所有权限',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 72 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of youbang_sys_permit
-- ----------------------------
INSERT INTO `youbang_sys_permit` VALUES (1, NULL, 1, 1, '1', '1', '1', '1', '1');
INSERT INTO `youbang_sys_permit` VALUES (2, NULL, 1, 2, '1', '1', '1', '1', '1');
INSERT INTO `youbang_sys_permit` VALUES (3, NULL, 1, 3, '1', '1', '1', '1', '1');
INSERT INTO `youbang_sys_permit` VALUES (4, NULL, 1, 101, '1', '1', '1', '1', '1');
INSERT INTO `youbang_sys_permit` VALUES (5, NULL, 1, 102, '1', '1', '1', '1', '1');
INSERT INTO `youbang_sys_permit` VALUES (6, NULL, 1, 201, '1', '1', '1', '1', '1');
INSERT INTO `youbang_sys_permit` VALUES (7, NULL, 1, 202, '1', '1', '1', '1', '1');
INSERT INTO `youbang_sys_permit` VALUES (8, NULL, 1, 203, '1', '1', '1', '1', '1');
INSERT INTO `youbang_sys_permit` VALUES (9, NULL, 1, 204, '1', '1', '1', '1', '1');
INSERT INTO `youbang_sys_permit` VALUES (10, NULL, 1, 205, '1', '1', '1', '1', '1');
INSERT INTO `youbang_sys_permit` VALUES (11, NULL, 1, 206, '1', '1', '1', '1', '1');
INSERT INTO `youbang_sys_permit` VALUES (12, NULL, 1, 301, '1', '1', '1', '1', '1');
INSERT INTO `youbang_sys_permit` VALUES (13, NULL, 1, 302, '1', '1', '1', '1', '1');
INSERT INTO `youbang_sys_permit` VALUES (14, NULL, 1, 303, '1', '1', '1', '1', '1');
INSERT INTO `youbang_sys_permit` VALUES (15, NULL, 1, 304, '1', '1', '1', '1', '1');
INSERT INTO `youbang_sys_permit` VALUES (16, NULL, 1, 305, '1', '1', '1', '1', '1');
INSERT INTO `youbang_sys_permit` VALUES (17, NULL, 1, 306, '1', '1', '1', '1', '1');
INSERT INTO `youbang_sys_permit` VALUES (18, NULL, 1, 307, '1', '1', '1', '1', '1');
INSERT INTO `youbang_sys_permit` VALUES (19, NULL, 1, 308, '1', '1', '1', '1', '1');
INSERT INTO `youbang_sys_permit` VALUES (20, NULL, 1, 20101, '1', '1', '1', '1', '1');
INSERT INTO `youbang_sys_permit` VALUES (21, NULL, 1, 20102, '1', '1', '1', '1', '1');
INSERT INTO `youbang_sys_permit` VALUES (22, NULL, 1, 20103, '1', '1', '1', '1', '1');
INSERT INTO `youbang_sys_permit` VALUES (23, NULL, 1, 20104, '1', '1', '1', '1', '1');
INSERT INTO `youbang_sys_permit` VALUES (24, NULL, 1, 20105, '1', '1', '1', '1', '1');
INSERT INTO `youbang_sys_permit` VALUES (25, NULL, 1, 20106, '1', '1', '1', '1', '1');
INSERT INTO `youbang_sys_permit` VALUES (26, NULL, 1, 20201, '1', '1', '1', '1', '1');
INSERT INTO `youbang_sys_permit` VALUES (27, NULL, 1, 20202, '1', '1', '1', '1', '1');
INSERT INTO `youbang_sys_permit` VALUES (28, NULL, 1, 20301, '1', '1', '1', '1', '1');
INSERT INTO `youbang_sys_permit` VALUES (29, NULL, 1, 20302, '1', '1', '1', '1', '1');
INSERT INTO `youbang_sys_permit` VALUES (30, NULL, 1, 20401, '1', '1', '1', '1', '1');
INSERT INTO `youbang_sys_permit` VALUES (31, NULL, 1, 20402, '1', '1', '1', '1', '1');
INSERT INTO `youbang_sys_permit` VALUES (32, NULL, 1, 20501, '1', '1', '1', '1', '1');
INSERT INTO `youbang_sys_permit` VALUES (33, NULL, 1, 20502, '1', '1', '1', '1', '1');
INSERT INTO `youbang_sys_permit` VALUES (34, NULL, 1, 20601, '1', '1', '1', '1', '1');
INSERT INTO `youbang_sys_permit` VALUES (35, NULL, 1, 30101, '1', '1', '1', '1', '1');
INSERT INTO `youbang_sys_permit` VALUES (36, NULL, 1, 30102, '1', '1', '1', '1', '1');
INSERT INTO `youbang_sys_permit` VALUES (37, NULL, 1, 30103, '1', '1', '1', '1', '1');
INSERT INTO `youbang_sys_permit` VALUES (38, NULL, 1, 30104, '1', '1', '1', '1', '1');
INSERT INTO `youbang_sys_permit` VALUES (39, NULL, 1, 30105, '1', '1', '1', '1', '1');
INSERT INTO `youbang_sys_permit` VALUES (40, NULL, 1, 30106, '1', '1', '1', '1', '1');
INSERT INTO `youbang_sys_permit` VALUES (42, NULL, 1, 30201, '1', '1', '1', '1', '1');
INSERT INTO `youbang_sys_permit` VALUES (43, NULL, 1, 30202, '1', '1', '1', '1', '1');
INSERT INTO `youbang_sys_permit` VALUES (44, NULL, 1, 30203, '1', '1', '1', '1', '1');
INSERT INTO `youbang_sys_permit` VALUES (45, NULL, 1, 20107, '1', '1', '1', '1', '1');
INSERT INTO `youbang_sys_permit` VALUES (46, NULL, 1, 207, '1', '1', '1', '1', '1');
INSERT INTO `youbang_sys_permit` VALUES (47, NULL, 1, 20108, '1', '1', '1', '1', '1');
INSERT INTO `youbang_sys_permit` VALUES (48, NULL, 1, 20503, '1', '1', '1', '1', '1');
INSERT INTO `youbang_sys_permit` VALUES (49, NULL, 1, 30801, '1', '1', '1', '1', '1');
INSERT INTO `youbang_sys_permit` VALUES (50, NULL, 1, 30802, '1', '1', '1', '1', '1');
INSERT INTO `youbang_sys_permit` VALUES (51, NULL, 1, 30803, '1', '1', '1', '1', '1');
INSERT INTO `youbang_sys_permit` VALUES (52, NULL, 1, 30804, '1', '1', '1', '1', '1');
INSERT INTO `youbang_sys_permit` VALUES (53, NULL, 1, 30805, '1', '1', '1', '1', '1');
INSERT INTO `youbang_sys_permit` VALUES (54, NULL, 1, 30806, '1', '1', '1', '1', '1');
INSERT INTO `youbang_sys_permit` VALUES (55, NULL, 1, 30807, '1', '1', '1', '1', '1');
INSERT INTO `youbang_sys_permit` VALUES (56, NULL, 1, 309, '1', '1', '1', '1', '1');
INSERT INTO `youbang_sys_permit` VALUES (57, NULL, 1, 30901, '1', '1', '1', '1', '1');
INSERT INTO `youbang_sys_permit` VALUES (58, NULL, 1, 30902, '1', '1', '1', '1', '1');
INSERT INTO `youbang_sys_permit` VALUES (59, NULL, 1, 30903, '1', '1', '1', '1', '1');
INSERT INTO `youbang_sys_permit` VALUES (60, NULL, 1, 30904, '1', '1', '1', '1', '1');
INSERT INTO `youbang_sys_permit` VALUES (61, NULL, 1, 30905, '1', '1', '1', '1', '1');
INSERT INTO `youbang_sys_permit` VALUES (62, NULL, 1, 30906, '1', '1', '1', '1', '1');
INSERT INTO `youbang_sys_permit` VALUES (63, NULL, 1, 30301, '1', '1', '1', '1', '1');
INSERT INTO `youbang_sys_permit` VALUES (64, NULL, 1, 30302, '1', '1', '1', '1', '1');
INSERT INTO `youbang_sys_permit` VALUES (65, NULL, 1, 30303, '1', '1', '1', '1', '1');
INSERT INTO `youbang_sys_permit` VALUES (66, NULL, 1, 30304, '1', '1', '1', '1', '1');
INSERT INTO `youbang_sys_permit` VALUES (67, NULL, 1, 30305, '1', '1', '1', '1', '1');
INSERT INTO `youbang_sys_permit` VALUES (68, NULL, 1, 30306, '1', '1', '1', '1', '1');
INSERT INTO `youbang_sys_permit` VALUES (69, NULL, 1, 20701, '1', '1', '1', '1', '1');
INSERT INTO `youbang_sys_permit` VALUES (70, NULL, 1, 20702, '1', '1', '1', '1', '1');
INSERT INTO `youbang_sys_permit` VALUES (71, NULL, 1, 20703, '1', '1', '1', '1', '1');

-- ----------------------------
-- Table structure for youbang_sys_template
-- ----------------------------
DROP TABLE IF EXISTS `youbang_sys_template`;
CREATE TABLE `youbang_sys_template`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模板名称',
  `industry` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '行业ID',
  `models` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '模块名称',
  `enable` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否启用，１启用',
  `isdel` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是不删除，１已经删除',
  `icon` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片APP asset中',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of youbang_sys_template
-- ----------------------------
INSERT INTO `youbang_sys_template` VALUES (1, 'base', 1, '{\"_pc_cms_home\":[\"/cms/info/header/shouye_header\",\"/cms/info/nva/shouye_nav\",\"/cms/info/body/shouye_body\",\"/cms/info/footer/0\"],\"style\":\".them{background-color:#438EB9;color:#ffffff;}\"}', '1', '0', 't1.png');

-- ----------------------------
-- Table structure for youbang_sys_template_users
-- ----------------------------
DROP TABLE IF EXISTS `youbang_sys_template_users`;
CREATE TABLE `youbang_sys_template_users`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `templateId` int(11) NOT NULL COMMENT '模板id',
  `userId` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `enable` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否启用，１启用',
  `isdel` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是不删除，１已经删除',
  `effectiveTime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'vip生效时间',
  `expirationTime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'vip过期时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of youbang_sys_template_users
-- ----------------------------
INSERT INTO `youbang_sys_template_users` VALUES (1, 1, 1, '1', '0', '2019-04-19 23:34:57', '2038-05-31 21:34:57');

-- ----------------------------
-- Function structure for aOrder
-- ----------------------------
DROP FUNCTION IF EXISTS `aOrder`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `aOrder`(id int) RETURNS varchar(255) CHARSET utf8
begin
return id;
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table youbang_commidity_spec
-- ----------------------------
DROP TRIGGER IF EXISTS `delete specotion`;
delimiter ;;
CREATE TRIGGER `delete specotion` BEFORE DELETE ON `youbang_commidity_spec` FOR EACH ROW DELETE FROM youbang_commidity_specoption where commodityid=old.commodityid
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table youbang_commidity_spec
-- ----------------------------
DROP TRIGGER IF EXISTS `delete specitem`;
delimiter ;;
CREATE TRIGGER `delete specitem` AFTER DELETE ON `youbang_commidity_spec` FOR EACH ROW DELETE FROM youbang_commidity_specitem where specid=old.id
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table youbang_sys_acount
-- ----------------------------
DROP TRIGGER IF EXISTS `初始化管理用户信息`;
delimiter ;;
CREATE TRIGGER `初始化管理用户信息` AFTER INSERT ON `youbang_sys_acount` FOR EACH ROW insert into youbang_sys_acount_manager (`acountid`) values(new.id)
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;

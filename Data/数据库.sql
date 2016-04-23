/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50173
Source Host           : localhost:3306
Source Database       : yao

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2016-04-23 14:30:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for zc_banner
-- ----------------------------
DROP TABLE IF EXISTS `zc_banner`;
CREATE TABLE `zc_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '广告ID',
  `cid` int(11) NOT NULL COMMENT '广告分类ID',
  `title` varchar(255) NOT NULL COMMENT '广告名称',
  `link` varchar(255) NOT NULL COMMENT '广告链接',
  `image` varchar(255) DEFAULT NULL COMMENT '图片',
  `featured` tinyint(4) DEFAULT '0' COMMENT '是否置顶',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `hits` int(11) NOT NULL DEFAULT '0' COMMENT '点击量',
  `state` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态',
  `order` int(4) NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zc_banner
-- ----------------------------
INSERT INTO `zc_banner` VALUES ('1', '0', '王鑫尧，我爱你', 'http://www.yjshare.cn', '/Uploads/banner/20160403/57011414cb639.jpg', '1', '2016-04-03 21:14:00', '0', '1', '0');
INSERT INTO `zc_banner` VALUES ('3', '0', '永远在一起', 'http://love.com', '/Uploads/banner/20160403/570117ea887d6.jpg', '0', '2016-04-03 21:14:00', '0', '1', '0');
INSERT INTO `zc_banner` VALUES ('4', '0', '熊妈妈', 'http://xiongjia.com', '/Uploads/banner/20160403/5701189d18a6c.jpg', '0', '2016-04-03 21:19:44', '0', '1', '0');
INSERT INTO `zc_banner` VALUES ('5', '0', '我要睡觉啦，亲耐的', 'http://www.aini.com', '/Uploads/banner/20160403/57011f2b9f009.jpg', '0', '2016-04-03 21:48:02', '0', '1', '0');

-- ----------------------------
-- Table structure for zc_banner_type
-- ----------------------------
DROP TABLE IF EXISTS `zc_banner_type`;
CREATE TABLE `zc_banner_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `state` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zc_banner_type
-- ----------------------------

-- ----------------------------
-- Table structure for zc_brand
-- ----------------------------
DROP TABLE IF EXISTS `zc_brand`;
CREATE TABLE `zc_brand` (
  `brand_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(60) NOT NULL DEFAULT '',
  `brand_logo` varchar(80) NOT NULL DEFAULT '',
  `brand_desc` text NOT NULL,
  `site_url` varchar(255) NOT NULL DEFAULT '',
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '50',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`brand_id`),
  KEY `is_show` (`is_show`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zc_brand
-- ----------------------------
INSERT INTO `zc_brand` VALUES ('1', '诺基亚', '/Uploads/Brand/20160407/570675289b85d.jpg', '公司网站：http://www.nokia.com.cn/客服电话：400-880-0123', 'http://www.nokia.com.cn/', '1', '1');
INSERT INTO `zc_brand` VALUES ('2', '摩托罗拉', '/Uploads/Brand/20160407/570675a099252.jpg', '官方咨询电话：4008105050售后网点：http://www.motorola.com.cn/service/carecenter/search.asp ', 'http://www.motorola.com.cn', '5', '1');
INSERT INTO `zc_brand` VALUES ('3', '多普达', '/Uploads/Brand/20160407/57067578e6781.jpg', '官方咨询电话：4008201668售后网点：http://www.dopod.com/pc/service/searchresult2.php ', 'http://www.dopod.com ', '3', '1');
INSERT INTO `zc_brand` VALUES ('4', '飞利浦', '/Uploads/Brand/20160407/5706753ed929b.jpg', '官方咨询电话：4008800008售后网点：http://www.philips.com.cn/service/mustservice/index.page ', 'http://www.philips.com.cn ', '2', '1');
INSERT INTO `zc_brand` VALUES ('5', '夏新', '/Uploads/images/20160403/5700da8eb39fc.jpg', '官方咨询电话：4008875777售后网点：http://www.amobile.com.cn/service_fwyzc.asp ', 'http://www.amobile.com.cn', '7', '1');
INSERT INTO `zc_brand` VALUES ('6', '三星', '/Uploads/Brand/20160407/57067589b2f69.jpg', '官方咨询电话：8008105858售后网点：http://cn.samsungmobile.com/cn/support/search_area_o.jsp ', 'http://cn.samsungmobile.com', '4', '1');
INSERT INTO `zc_brand` VALUES ('7', '索爱', '/Uploads/Brand/20160407/570675c6865e9.jpg', '官方咨询电话：4008100000售后网点：http://www.sonyericsson.com/cws/common/contact?cc=cn&lc=zh ', 'http://www.sonyericsson.com.cn/', '6', '1');
INSERT INTO `zc_brand` VALUES ('8', 'LG', '/Uploads/Brand/20160407/570675e6de1fd.jpg', '官方咨询电话：4008199999售后网点：http://www.lg.com.cn/front.support.svccenter.retrieveCenter.laf?hrefId=9 ', 'http://cn.wowlg.com', '8', '1');
INSERT INTO `zc_brand` VALUES ('9', '联想', '/Uploads/Brand/20160407/570674ea69aa8.jpg', '官方咨询电话：4008188818售后网点：http://www.lenovomobile.com/service/kf-wanglou.asp', 'http://www.lenovomobile.com/', '9', '1');
INSERT INTO `zc_brand` VALUES ('11', '  恒基伟业', '/Uploads/Brand/20160407/570675f219c4b.jpg', '官方咨询电话：4008899126售后网点：http://www.htwchina.com/htwt/wexiu.shtml ', 'http://www.htwchina.com', '10', '1');

-- ----------------------------
-- Table structure for zc_cart
-- ----------------------------
DROP TABLE IF EXISTS `zc_cart`;
CREATE TABLE `zc_cart` (
  `rec_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '购物车记录ID',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `session_id` char(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '' COMMENT '会话ID',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '商品ID',
  `goods_name` varchar(120) NOT NULL DEFAULT '' COMMENT '商品名称',
  `market_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '市场价',
  `goods_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品价',
  `goods_number` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '商品数量',
  `goods_attr` text NOT NULL COMMENT '商品属性',
  `goods_attr_id` varchar(255) NOT NULL DEFAULT '' COMMENT '商品属性ID',
  PRIMARY KEY (`rec_id`),
  KEY `session_id` (`session_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of zc_cart
-- ----------------------------

-- ----------------------------
-- Table structure for zc_category
-- ----------------------------
DROP TABLE IF EXISTS `zc_category`;
CREATE TABLE `zc_category` (
  `cat_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(90) NOT NULL DEFAULT '' COMMENT '分类名称',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键词',
  `cat_desc` varchar(255) NOT NULL DEFAULT '' COMMENT '分类描述',
  `parent_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '父分类',
  `sort_order` tinyint(1) unsigned NOT NULL DEFAULT '50' COMMENT '排序',
  `template_file` varchar(50) NOT NULL DEFAULT '' COMMENT '模板文件',
  `measure_unit` varchar(15) NOT NULL DEFAULT '' COMMENT '计量单位',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  PRIMARY KEY (`cat_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zc_category
-- ----------------------------
INSERT INTO `zc_category` VALUES ('1', '手机类型', '', '', '0', '50', '', '', '1');
INSERT INTO `zc_category` VALUES ('2', 'CDMA手机', '', '', '1', '50', '', '', '1');
INSERT INTO `zc_category` VALUES ('3', 'GSM手机', '', '', '1', '50', '', '台', '1');
INSERT INTO `zc_category` VALUES ('4', '3G手机', '', '', '1', '50', '', '', '1');
INSERT INTO `zc_category` VALUES ('5', '双模手机', '', '', '1', '50', '', '', '1');
INSERT INTO `zc_category` VALUES ('6', '手机配件', '', '', '0', '50', '', '', '1');
INSERT INTO `zc_category` VALUES ('7', '充电器', '', '', '6', '50', '', '', '1');
INSERT INTO `zc_category` VALUES ('8', '耳机', '', '', '6', '50', '', '', '1');
INSERT INTO `zc_category` VALUES ('9', '电池', '', '', '6', '50', '', '', '1');
INSERT INTO `zc_category` VALUES ('11', '读卡器和内存卡', '', '', '6', '50', '', '', '1');
INSERT INTO `zc_category` VALUES ('12', '充值卡', '', '', '0', '50', '', '', '1');
INSERT INTO `zc_category` VALUES ('13', '小灵通/固话充值卡', '', '', '12', '50', '', '', '1');
INSERT INTO `zc_category` VALUES ('14', '移动手机充值卡', '', '', '12', '50', '', '', '1');
INSERT INTO `zc_category` VALUES ('15', '联通手机充值卡', '', '', '12', '50', '', '', '1');

-- ----------------------------
-- Table structure for zc_goods
-- ----------------------------
DROP TABLE IF EXISTS `zc_goods`;
CREATE TABLE `zc_goods` (
  `goods_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `cat_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '商品分类ID',
  `goods_name` varchar(120) NOT NULL DEFAULT '' COMMENT '商品名称',
  `click_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击量',
  `brand_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '品牌',
  `goods_weight` decimal(10,3) unsigned NOT NULL DEFAULT '0.000' COMMENT '商品重量',
  `shop_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '商品价格',
  `promote_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '促销价',
  `promote_start_date` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '促销开始时间',
  `promote_end_date` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '促销结束时间',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键词',
  `goods_desc` text NOT NULL COMMENT '商品描述',
  `goods_img` varchar(255) NOT NULL DEFAULT '' COMMENT '商品图片',
  `is_on_sale` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否出售',
  `add_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '添加时间',
  `sort_order` smallint(4) unsigned NOT NULL DEFAULT '100' COMMENT '排序',
  `is_promote` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否促销',
  `goods_type` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '商品类型',
  PRIMARY KEY (`goods_id`),
  KEY `cat_id` (`cat_id`),
  KEY `brand_id` (`brand_id`),
  KEY `goods_weight` (`goods_weight`),
  KEY `promote_end_date` (`promote_end_date`),
  KEY `promote_start_date` (`promote_start_date`),
  KEY `sort_order` (`sort_order`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zc_goods
-- ----------------------------
INSERT INTO `zc_goods` VALUES ('1', '3', 'KD876', '7', '8', '0.110', '1388.00', '0.00', '0', '0', 'LG 3g 876 支持 双模 2008年04月 灰色 GSM,850,900,1800,1900', '<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 很多朋友都已经抢先体验了3G网络的可视通话、高速上网等功能。LG KD876手机<span style=\"font-size: x-large;\"><span style=\"color: rgb(255, 0, 0);\"><strong>支持TD-SCDMA/GSM双模单待</strong></span></span>，便于测试初期GSM网络和TD网络之间的切换和共享。</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LG KD876手机整体采用银色塑料材质，<strong><span style=\"font-size: x-large;\"><span style=\"color: rgb(255, 0, 0);\">特殊的旋转屏设计是本机的亮点</span></span></strong>，而机身背部的300万像素摄像头也是首发的六款TD-SCDMA手机中配置最高的。LG KD876手机屏幕下方设置有外键盘，该键盘由左/右软键、通话/挂机键、返回键、五维摇杆组成，摇杆灵敏度很高，定位准确。KD876的内键盘由标准12个电话键和三个功能键、一个内置摄像头组成。三个功能键分别为视频通话、MP3、和菜单键，所有按键的手感都比较一般，键程适中，当由于按键排列过于紧密，快速发短信时很容易误按，用户在使用时一定要多加注意。LG KD876手机机身周边的接口设计非常简洁，手机的厚度主要来自屏幕旋转轴的长度，如果舍弃旋屏设计的话，估计<span style=\"font-size: x-large;\"><strong><span style=\"color: rgb(255, 0, 0);\">厚度可以做到10mm以下</span></strong></span>。</p>', '/Uploads/Images/20160410/5709337ec2269.jpg', '1', '2016-04-02 10:00:00', '100', '0', '3');
INSERT INTO `zc_goods` VALUES ('4', '8', '诺基亚N85原装充电器', '0', '1', '0.000', '58.00', '0.00', '0', '0', '', '', 'images/200905/goods_img/4_G_1241422402722.jpg', '0', '2016-04-02 10:00:00', '100', '0', '6');
INSERT INTO `zc_goods` VALUES ('3', '8', '诺基亚原装5800耳机', '3', '1', '0.000', '68.00', '0.00', '0', '0', '', '', 'images/200905/goods_img/3_G_1241422082168.jpg', '0', '2016-04-02 10:00:00', '100', '0', '6');
INSERT INTO `zc_goods` VALUES ('5', '11', '索爱原装M2卡读卡器', '3', '7', '0.000', '20.00', '0.00', '0', '0', '', '', 'images/200905/goods_img/5_G_1241422518773.jpg', '0', '2016-04-02 10:00:00', '100', '0', '2');
INSERT INTO `zc_goods` VALUES ('6', '11', '胜创KINGMAX内存卡', '0', '0', '0.000', '42.00', '0.00', '0', '0', '', '', '', '0', '2016-04-02 10:00:00', '100', '0', '6');
INSERT INTO `zc_goods` VALUES ('7', '8', '诺基亚N85原装立体声耳机HS-82', '0', '1', '0.000', '100.00', '0.00', '0', '0', '', '', 'images/200905/goods_img/7_G_1241422785856.jpg', '0', '2016-04-02 10:00:00', '100', '0', '2');
INSERT INTO `zc_goods` VALUES ('8', '4', '飞利浦9@9v', '9', '4', '0.075', '399.00', '385.00', '1241366400', '1417276800', '双模 2008年春 黑色 直板 中低档', '<p align=\"left\">作为一款性价比极高的入门级<font size=\"3\" color=\"#ff0000\"><strong>商务手机</strong></font>，飞利浦<a href=\"mailto:9@9v\">Xenium&nbsp; 9@9v</a>三围大小为105&times;44&times;15.8mm，机身重量仅为<strong><font size=\"3\" color=\"#ff0000\">75g</font></strong>，装配了一块低规格1.75英寸128&times;160像素65000色CSTN显示屏。身正面采用月银色功能键区与屏幕数字键区相分隔，键盘设计较为<font size=\"3\"><strong><font color=\"#ff0000\">别</font><font color=\"#ff0000\">致</font></strong></font>，中部导航键区采用钛金色的&ldquo;腰带&rdquo;彰显出浓郁的商务气息。</p>\r\n<p align=\"left\">&nbsp;</p>\r\n<p align=\"left\">此款手机采用<strong><font size=\"3\" color=\"#ff0000\">触摸屏</font></strong>设计，搭配精致的手写笔，可支持手写中文和英文两个版本。增强的内置系统还能识别潦草字迹，确保在移动中和匆忙时输入文字的识别率。手写指令功能还支持特定图案的瞬间调用，独特的手写记事本功能，可以在触摸屏上随意绘制个性化的图案并进行<strong><font size=\"3\" color=\"#ff0000\">记事提醒</font></strong>，让商务应用更加随意。</p>\r\n<p align=\"left\">&nbsp;</p>\r\n<p align=\"left\">&nbsp;作为入门级为数不多支持<strong><font size=\"3\" color=\"#ff0000\">双卡功能</font></strong>的手机，可以同时插入两张SIM卡，通过菜单随意切换，只需开启漫游自动切换模式，<a href=\"mailto:9@9V\">9@9V</a>在该模式下能够判断网络情况，自动切换适合的手机号。</p>\r\n<p align=\"left\">&nbsp;</p>\r\n<p align=\"left\">&nbsp;</p>', 'images/200905/goods_img/8_G_1241425513055.jpg', '0', '2016-04-02 10:00:00', '100', '1', '9');
INSERT INTO `zc_goods` VALUES ('9', '4', '诺基亚E66', '20', '1', '0.121', '2298.00', '0.00', '0', '0', 'SMS EMS MMS 短消息群发 语音 阅读器 SMS,EMS,MMS,短消息群发语音合成信息阅读器 黑色 白色 滑盖', '<p>在机身材质方面，诺基亚E66大量采用金属材质，刨光的金属表面光泽动人，背面的点状效果规则却又不失变化，时尚感总是在不经意间诠释出来，并被人们所感知。E66机身尺寸为<span style=\"color: rgb(255, 0, 0);\"><span style=\"font-size: larger;\"><strong>107.5&times;49.5&times;13.6毫米，重量为121克</strong></span></span>，滑盖的造型竟然比E71还要轻一些。</p>\r\n<p>&nbsp;</p>\r\n<div>诺基亚E66机身正面是<span style=\"color: rgb(255, 0, 0);\"><span style=\"font-size: larger;\"><strong>一块2.4英寸1600万色QVGA分辨率（240&times;320像素）液晶显示屏</strong></span></span>。屏幕上方拥有光线感应元件，能够自适应周 围环境光调节屏幕亮度；屏幕下方是方向功能键区。打开滑盖，可以看到传统的数字键盘，按键的大小、手感、间隔以及键程适中，手感非常舒适。</div>\r\n<div>&nbsp;</div>\r\n<div>诺基亚为E66配备了一颗320万像素自动对焦摄像头，带有LED 闪光灯，支持多种拍照尺寸选择。</div>\r\n<p>&nbsp;</p>', '/Uploads/images/20160403/5700d9e974edd.jpg', '0', '2016-04-02 10:00:00', '100', '0', '4');
INSERT INTO `zc_goods` VALUES ('10', '4', '索爱C702c', '11', '7', '0.000', '1328.00', '1250.00', '1243785600', '1277827200', '2008年05月 GSM,850,900,1800,1900 直板', '<p>C702可以说是一种在外观上复古的产物，不仅延续T系列早期的直板造型，而且在屏幕和键盘的组合分布上都继承了前辈的精髓。C702的机身尺寸为106&times;48&times;15.5毫米，重量为105克。此外索尼爱立信为C702融入了<font size=\"3\" color=\"#ff0000\"><strong>三防特性，即防尘、防滑和防水溅</strong></font>，这款新的C702搭载了索尼爱立信经典A200平台，界面布局与W908c、K858c一致，典型的特征就是配备左右软键、中央确定键和通话/挂机键。</p>\r\n<p>索尼爱立信C702配备一块<strong><font size=\"3\" color=\"#ff0000\">2.2英寸26万色TFT液晶显示屏</font></strong>，分辨率为240&times;320像素(QVGA)，显示效果属于目前主流水准。C702可以说是索尼爱立信首批<strong><font size=\"3\" color=\"#ff0000\">内置GPS模块</font></strong>的 手机产品之一，C702的搜星、定位一气呵成，十分精准，误差大约在10米之内。基本上定位后可以将有效卫星数量控制在4&mdash;6颗，可以说可以满足我们的需 要了。C702还提供了&ldquo;影像定位&rdquo;功能，配合内置的AGPS全球定位辅助系统，只须启动Geo-Tagging智能影像定位功能，便可将拍摄地点记录在 照片内，方便用户随时查询。</p>\r\n<p>&nbsp;</p>\r\n<p>作为一款Cyber-shot系列影像手机，索尼爱立信C702在拍照功能方面同样有不俗的表现。并且手机内置的<strong><font size=\"3\" color=\"#ff0000\">320万像素摄像头</font></strong>也 同样在拍照功能上也不错的表现。不仅支持自动聚焦和双LED闪光功能，而且还拥有2倍数码变焦、防红眼、Photo fix优画及场景模式等功能。索尼爱立信C702除了配备的是最大光圈为F3.2的4.2毫米镜头之外，该机也如同门中的旗舰C902一样增加了对脸部有 先自动聚焦功能的支持。</p>\r\n<p>&nbsp;</p>', 'images/200905/goods_img/10_G_1242973436141.jpg', '0', '2016-04-02 10:00:00', '100', '1', '9');
INSERT INTO `zc_goods` VALUES ('11', '4', '索爱C702c', '0', '7', '0.000', '1300.00', '0.00', '0', '0', '直板', '', '/Uploads/Images/20160410/57092a52e7434.jpg', '0', '2016-04-02 10:00:00', '100', '0', '4');
INSERT INTO `zc_goods` VALUES ('12', '4', '摩托罗拉A810', '13', '2', '0.000', '983.00', '960.00', '1241107200', '1255104000', 'SMS EMS MMS pda 摄像 智能 音乐 SMS,EMS,MMS', '<p>全机使用的材质除去电池盖部分采用了金属以外，其它均使用了ABS工程塑料作为主材，这款手机的三围是105&times;51&times;14毫米，有着100克的轻量级重量，拿在手中的感觉还是非常不错的。A810手机作为一款<strong><font size=\"3\" color=\"#ff0000\">PDA手机</font></strong>在设计的时候取消了键盘配置，一切数字键都要依靠手机内提供的虚拟键盘进行操作，在手机的左上侧是一个<strong><font size=\"3\" color=\"#ff0000\">3.5mm的标准耳机插口</font></strong>，这种设计可以让用户使用自己习惯或者喜欢的耳机去欣赏音乐。</p>\r\n<p>&nbsp;</p>\r\n<p>这款摩托罗拉A810手机配置了一块<font size=\"3\" color=\"#ff0000\"><strong>26万色的2.2英寸TFT全触摸屏幕</strong></font>，其分辨率达到了主流的QVGA水平（240&times;320像素），摩托罗拉A810采用了内部核心为2.6.10的<strong><font size=\"3\" color=\"#ff0000\">LINUX操作系统</font></strong>，菜单上依然采用传统的9宫格的显示方式，一般手机的名片式电话本只能支持诸如电话、邮件、传真、公司等一些基本信息，而A810手机的电话本除了这些还支持公司地址，配偶信息、子女姓名、上司名称、助手等等，对于一款手机来说，电话本不可谓不强大。A810的<strong><font size=\"3\" color=\"#ff0000\">手写识别能力相当的惊人</font></strong>，对连笔、草书和倒插笔的识别率都相当的高，同时还为左右手设置了不同的书写习惯选择，并支持手写速度的调节。</p>\r\n<p>这款A810手机<strong><font size=\"3\" color=\"#ff0000\">内置的音乐播放功能</font></strong>可以支持MP3、WAV、AMR、AAC等格式的音乐播放，<font size=\"3\" color=\"#ff0000\"><strong>支持后台播放</strong></font>。视频方面，这款A810支持MP4、3GP、H.263格式的播放，视频播放器同样简约，操作方便，这款摩托罗拉A810还内置了6款游戏，每一款都有很高的耐玩性，而且都是支持触摸屏操作的，同时这款手机还内置了<strong><font size=\"3\" color=\"#ff0000\">FM收音机</font></strong>，支持自动搜索，并提供了20个频道供用户存储，不过收音机并不支持后台播放。</p>\r\n<p>&nbsp;</p>', '/Uploads/images/20160403/5700da4b63789.jpg', '0', '2016-04-02 10:00:00', '100', '1', '4');
INSERT INTO `zc_goods` VALUES ('13', '4', '诺基亚5320 XpressMusic', '13', '1', '0.000', '1311.00', '0.00', '0', '0', '摄像 智能 音乐 蓝色 红色 舒适 直板 中档 2008年07月 黑色 GSM,850,900,1800,1900', '<p>诺基亚5320XpressMusic音乐手机采用XpressMusic系列常见的黑红、黑蓝配色方案，而材质方便则选用的是经过<strong><font size=\"3\" color=\"#ff0000\">抛光处理</font></strong>的工程塑料；三围/体重为，为108&times;46&times;15mm/<strong><font size=\"3\" color=\"#ff0000\">90g</font></strong>，手感舒适。</p>\r\n<p>&nbsp;</p>\r\n<p>诺基亚5320采用的是一块可视面积为2.0英寸的<font size=\"3\" color=\"#ff0000\"><strong>1600万色</strong></font>屏幕，分辨率是常见的240&times;320像素（QVGA）。虽然屏幕不是特别大，但效果非常精细，色彩还原不错。</p>\r\n<p>&nbsp;</p>\r\n<p>手机背面，诺基亚为5320XM配备一颗<strong><font size=\"3\" color=\"#ff0000\">200W像素</font></strong>的摄像头，并且带有<strong><font size=\"3\" color=\"#ff0000\">两个LED的补光灯</font></strong>，可以实现拍照、摄像功能，并能通过彩信、邮件方式发送给朋友。</p>\r\n<p>&nbsp;</p>', '/Uploads/images/20160403/5700da7a0b594.jpg', '0', '2016-04-02 10:00:00', '100', '0', '4');
INSERT INTO `zc_goods` VALUES ('14', '3', '诺基亚5800XM', '6', '1', '0.000', '2625.00', '0.00', '0', '0', 'GSM 64和弦 2009年2月 320万摄像头 GPS 直板 工程塑料 支持 2008年10月 黑色', '', '/Uploads/Images/20160410/57092926e2c9e.jpg', '0', '2016-04-02 10:00:00', '100', '0', '3');
INSERT INTO `zc_goods` VALUES ('15', '4', '摩托罗拉A810', '8', '2', '0.000', '788.00', '0.00', '0', '0', '600 直板 工程塑料 蓝牙 视频拍摄 音乐 黑色 白色', '', 'images/200905/goods_img/15_G_1242973362318.jpg', '0', '2016-04-02 10:00:00', '100', '0', '9');
INSERT INTO `zc_goods` VALUES ('16', '2', '恒基伟业G101', '3', '11', '0.000', '823.33', '0.00', '0', '0', '', '', 'images/200905/goods_img/16_G_1241968949002.jpg', '0', '2016-04-02 10:00:00', '100', '0', '2');
INSERT INTO `zc_goods` VALUES ('17', '4', '夏新N7', '2', '5', '0.000', '2300.00', '0.00', '0', '0', '2008年01月 GSM,900,1800,1900,2100 直板 262144万 240×400 像素 SMS,EMS,MMS,超长信息发送,短消息群发 黑色 CDMA', '', 'images/200905/goods_img/17_G_1241969394677.jpg', '0', '2016-04-02 10:00:00', '100', '0', '9');
INSERT INTO `zc_goods` VALUES ('18', '3', '夏新T5', '0', '5', '0.000', '2878.00', '0.00', '0', '0', '2008年04月 3G(GSM,900,1800,1900,TD-SCDMA ) 直板 262144万 320×240 像素 是 银色', '<p>&nbsp;  TD-SCDMA/GSM两种模式任意切换，中国3G手机先驱，支持大陆特有3G网络，轻松实现可视电话、视频留言、视频会议功能，2.6英寸Q屏，手写、键盘双输入，内置移动证券，支持手机邮箱、手机地图、无驱U盘</p>', '', '0', '2016-04-02 10:00:00', '100', '0', '2');
INSERT INTO `zc_goods` VALUES ('19', '4', '三星SGH-F258', '7', '6', '0.000', '858.00', '0.00', '0', '0', '滑盖 GSM 258 时尚 蓝牙 黑色 金色 白色', '<p>从整体来看，三星SGH-F258比较<font size=\"3\" color=\"#ff0000\"><strong>时尚</strong></font>可爱，三围尺寸为94&times;46&times;17.5mm，重量为96克，曲线柔和具有玲珑美感。</p>\r\n<p>&nbsp;</p>\r\n<p>三星F258的前面板整体应用<strong><font size=\"3\" color=\"#ff0000\">镜面效果</font></strong>，2.0英寸显示屏幕略显窄小，导航键与功能键在滑盖滑开之前是前面板的全部控制键，没有挂断和接听键，不过，五向键有<font size=\"3\"><strong><font color=\"#ff0000\">音乐操</font><font color=\"#ff0000\">作</font></strong></font>功能，明确显示了F258音乐手机的定位。</p>\r\n<p>&nbsp;</p>\r\n<p>F258的数字键键区采用了极具金属质感的平板式设计，每颗按键的面积足够大，按键与按键之间的间隔明显，操作起来手感舒适。</p>', 'images/200905/goods_img/19_G_1241970175091.jpg', '0', '2016-04-02 10:00:00', '100', '0', '9');
INSERT INTO `zc_goods` VALUES ('20', '4', '三星BC01', '14', '6', '0.000', '280.00', '238.00', '1241884800', '1251648000', 'GSM 直板 40和弦 金属材质 2008年07月 黑色 GSM,900,1800,1900,2100', '', '/Uploads/Images/20160410/570927d5332db.jpg', '0', '2016-04-02 10:00:00', '100', '1', '4');
INSERT INTO `zc_goods` VALUES ('21', '4', '金立 A30', '4', '1', '0.000', '2000.00', '0.00', '0', '0', '2008年03月 GSM,900,1800,1900,2100 直板 1600万 240×400 像素 2007年12月 200万摄像头 黑色', '<p>&nbsp;</p>\r\n<p align=\"left\"><span style=\"font-size: medium;\"><font size=\"3\">标准配置: 标准锂电池两块,充电器两个,立体声耳机一个,数据线,说明书送256TF</font></span></p>\r\n<p align=\"left\"><span style=\"font-size: medium;\"><font size=\"3\">通讯功能&nbsp; 输入法 短信功能 话机通讯录 通话记录</font></span></p>\r\n<p align=\"left\"><span style=\"font-size: medium;\"><font size=\"3\">输入法: 中文输入法</font></span></p>\r\n<p align=\"left\"><span style=\"font-size: medium;\"><font size=\"3\">短信功能: 支持短信300条和彩信100条</font></span></p>\r\n<p align=\"left\"><span style=\"font-size: medium;\"><font size=\"3\">话机通讯录: 1000组名片式电话存储 来电防火墙功能&nbsp; 来电大头贴及来电铃声识别</font></span></p>\r\n<p align=\"left\"><span style=\"font-size: medium;\"><font size=\"3\">通话记录：支持电话录音,恢复/静音,双音多频,免提</font></span></p>\r\n<p>&nbsp;</p>\r\n<p><font size=\"3\">高级功能</font></p>\r\n<p align=\"left\"><span style=\"font-size: medium;\"><font size=\"3\">多媒体娱乐: 200万像素，最大支持10240*960，11级数码变焦,多种效果设置,连拍可全屏查看拍摄或下载的图片.支持有声MP4短片拍摄，录像时间根据内存 大小而定，拍摄录像,TV电视可跟朋友家人一起分享。支持网络摄像头功能 支持MPEG4、3GP(H.263)等视频格式 支持MP3等音频格式播放， 支持歌词播放</font></span></p>\r\n<p align=\"left\"><span style=\"font-size: medium;\"><font size=\"3\">内置游戏:智能拼图</font></span></p>\r\n<p align=\"left\"><span style=\"font-size: medium;\"><font size=\"3\">扩展存储功能:支持TF扩展,支持U盘功能,本机内置1M,随机赠送256TF卡</font></span></p>\r\n<p align=\"left\"><span style=\"font-size: medium;\"><font size=\"3\">高级功能:直板/智能PDA手写/键盘输入 超长待机 WAP上网&nbsp; 录音 蓝牙 FM收音机 电子书 Java扩展 TV电视输出 声控语音拨号 免费电视 来电防火墙&nbsp;&nbsp;&nbsp;</font></span></p>\r\n<p align=\"left\"><span style=\"font-size: medium;\"><font size=\"3\">附加功能: 日历 计算器 闹钟 记事本 日程表 秒表 单位换算</font></span></p>\r\n<p><span style=\"font-size: medium;\"><font size=\"3\">提醒 以上性能均为本公司员工试机后所写,产品资料仅供参考,请以收到实物为准</font></span></p>', '/Uploads/Brand/20160407/5706753ed929b.jpg', '1', '2016-04-02 10:00:00', '100', '0', '3');
INSERT INTO `zc_goods` VALUES ('22', '4', '多普达Touch HD', '15', '3', '0.000', '5999.00', '0.00', '0', '0', '500万摄像头 蓝牙 手写 GPS 办公应用 语音拨号 2008年12月 黑色 GSM,850,900,1800,1900 直板', '<p><img src=\"http://xgone.xgou.com/xgoumanage/upload/20090325/2009032502045081100887.jpg\" alt=\"\" /></p>\r\n<p>&nbsp;</p>\r\n<p><img src=\"http://www.ouku.com/upimg/ouku/Image/002(1).jpg\" alt=\"\" /></p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>', '/Uploads/images/20160403/5700d6294a051.jpg', '1', '2016-04-02 10:00:00', '100', '0', '3');
INSERT INTO `zc_goods` VALUES ('23', '5', '诺基亚N96', '17', '1', '0.000', '3700.00', '0.00', '0', '0', '500万摄像头 microSD 工程塑料 蓝牙 数码相机 内置游戏 滑盖 高档 2008年09月 320×240 像素 黑色', '<p>诺基亚N96采用了<strong><font size=\"3\" color=\"#ff0000\">双向滑盖</font></strong>设计，机身整体呈灰黑色，沉稳、大气，机身材质采用了高强度的塑料材质，手机背面采用了抛光面板的设计风格。N96三维体积103*55*20mm，重量为125g。屏幕方面，诺基亚N96配备一块<strong><font size=\"3\" color=\"#ff0000\">2.8英寸</font></strong>的屏幕，支持<strong><font size=\"3\" color=\"#ff0000\">1670万色</font></strong>显示，分辨率达到QVGA（320&times;240）水准。</p>\r\n<p><img alt=\"\" src=\"file:///C:/DOCUME~1/user/LOCALS~1/Temp/moz-screenshot.jpg\" /></p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;<img src=\"http://img2.zol.com.cn/product/21/896/ceN6LBMCid3X6.jpg\" alt=\"\" /></p>\r\n<p>诺基亚N96设置有专门的<strong><font size=\"3\" color=\"#ff0000\">音乐播放键</font></strong>和标准的3.5毫米音频插口，支持多格式音乐播放。内置了<strong><font size=\"3\" color=\"#ff0000\">多媒体播放器</font></strong>，支持FM调频收音机等娱乐功能。N96手机支持<strong><font size=\"3\" color=\"#ff0000\">N-Gage游戏平台</font></strong>，内置包括<font size=\"3\" color=\"#ff0000\"><strong>《PinBall》完整版</strong></font>在内的四款N-Gage游戏，除了手机本身内置的游戏，还可以从N-Gage的网站下载或者购买最新的游戏，而且可以在论坛里和其他玩家一起讨论。</p>\r\n<p><img src=\"http://img2.zol.com.cn/product/21/898/cekkw57qJjSI.jpg\" alt=\"\" /></p>\r\n<p>&nbsp;</p>', '/Uploads/images/20160403/5700da7a0b594.jpg', '1', '2016-04-02 10:00:00', '100', '0', '5');
INSERT INTO `zc_goods` VALUES ('24', '4', 'P806', '35', '9', '0.000', '2000.00', '1850.00', '1243785600', '1277827200', '旅行充电器 图形菜单 Wap 上网 红外接口 移动 MSN 支持 2008年06月 灰色', '<div>\r\n<div>\r\n<div><font size=\"4\">规格参数</font></div>\r\n<p><font size=\"4\"><span>上市时间：</span><span>2008年06月</span></font></p>\r\n<p><font size=\"4\"><span>网络频率：</span><span>GSM/GPRS；900/1800MHz</span></font></p>\r\n<p><font size=\"4\"><span>重　量　：</span><span>未知</span></font></p>\r\n<p><font size=\"4\"><span>尺寸/体积：</span><span>未知</span></font></p>\r\n<p><font size=\"4\"><span>可选颜色：</span><span>银色</span></font></p>\r\n<p><font size=\"4\"><span>屏幕参数：</span><span>26万色TFT彩色屏幕；</span></font></p>\r\n<p><font size=\"4\"><span>WAP上网：</span><span>支持飞笺</span></font></p>\r\n<p><font size=\"4\"><span>基本配置:<em><strong><font size=\"5\" color=\"#ff00ff\">二电(1760毫安) 一充 数据线 耳机 手写笔 512M内存卡</font></strong></em></span></font></p>\r\n<p>&nbsp;</p>\r\n</div>\r\n</div>\r\n<div><font size=\"4\">基本功能</font></div>\r\n<p><font size=\"4\"><span>『时钟』</span><span>『内置振动』</span><span>『录音』</span><span>『可选铃声』</span></font></p>\r\n<p><font size=\"4\"><span>『和弦铃声』</span><span>『MP3铃声』</span><span>『来电铃声识别』</span><span>『来电图片识别』</span></font></p>\r\n<p><font size=\"4\"><span>『情景模式』</span><span>『待机图片』</span><span>『图形菜单』</span><span>『触摸屏』</span></font></p>\r\n<p><span><font size=\"4\">『手写输入』</font></span></p>\r\n<div><font size=\"4\">通信功能</font></div>\r\n<p><font size=\"4\"><span>『双卡双待』</span><span>『内置天线』</span><span>『输入法』</span><span>『中文短信』</span></font></p>\r\n<p><font size=\"4\"><span>『短信群发』</span><span>『多媒体短信』</span><span>『话机通讯录』</span><span>『通话记录』</span></font></p>\r\n<p><font size=\"4\"><span>『免提通话』</span><span>『飞行模式』</span></font></p>\r\n<div><font size=\"4\">多媒体娱乐 :支持3GP、MP4文件播放</font></div>\r\n<p><font size=\"4\"><span>『视频播放』</span><span>『MP3播放器』</span></font></p>\r\n<p><font size=\"4\"><span>多媒体卡扩展：</span><span>支持microSD卡扩展&nbsp;</span></font></p>\r\n<p><font size=\"4\"><span>摄像头：</span><span>内置</span></font></p>\r\n<p><font size=\"4\"><span>摄像头像素：</span><span>30万像素</span></font></p>\r\n<p><font size=\"4\"><span>传感器类型：</span><span>CMOS</span></font></p>\r\n<p><font size=\"4\"><span>变焦模式：</span><span>数码变焦</span></font></p>\r\n<p><font size=\"4\"><span>照片分辨率：</span><span>多种照片分辨率选择</span></font></p>\r\n<p><font size=\"4\"><span>拍摄模式：</span><span>多种拍摄模式选择</span></font></p>\r\n<p><font size=\"4\"><span>照片质量：</span><span>多种照片质量选择</span></font></p>\r\n<p><font size=\"4\"><span>视频拍摄：</span><span>有声视频拍摄</span></font></p>\r\n<div><font size=\"4\">数据传输</font></div>\r\n<p><font size=\"4\"><span>『WAP浏览器』</span><span>『数据线接口』</span></font></p>\r\n<div><font size=\"4\">个人助理</font></div>\r\n<p><font size=\"4\"><span>『闹钟』</span><span>『日历』</span><span>『计算器』</span></font></p>', '/Uploads/images/20160403/5700d334ccd23.jpg', '1', '2016-04-02 10:00:00', '100', '1', '3');
INSERT INTO `zc_goods` VALUES ('25', '13', '小灵通/固话50元充值卡', '0', '1', '0.000', '48.00', '0.00', '0', '0', '', '', '/Uploads/images/20160403/57011784572ad.jpg', '1', '2016-04-02 10:00:00', '100', '0', '13');
INSERT INTO `zc_goods` VALUES ('26', '13', '小灵通/固话20元充值卡', '0', '0', '0.000', '19.00', '0.00', '0', '0', '', '', '/Uploads/images/20160403/5700dc677153e.jpg', '1', '2016-04-02 10:00:00', '100', '0', '1');
INSERT INTO `zc_goods` VALUES ('27', '15', '联通100元充值卡', '0', '0', '0.000', '95.00', '0.00', '0', '0', '', '', '/Uploads/images/20160403/5700dc3ee04d5.jpg', '1', '2016-04-02 10:00:00', '100', '0', '1');
INSERT INTO `zc_goods` VALUES ('28', '15', '联通50元充值卡', '0', '0', '0.000', '45.00', '0.00', '0', '0', '', '', '/Uploads/images/20160403/5700dc3ee04d5.jpg', '1', '2016-04-02 10:00:00', '100', '0', '1');
INSERT INTO `zc_goods` VALUES ('29', '14', '移动100元充值卡', '0', '0', '0.000', '90.00', '0.00', '0', '0', '', '', '/Uploads/images/20160403/5700d334ccd23.jpg', '1', '2016-04-02 10:00:00', '100', '0', '1');
INSERT INTO `zc_goods` VALUES ('30', '14', '移动20元充值卡', '1', '0', '0.000', '18.00', '0.00', '0', '0', '', '', '/Uploads/images/20160403/5700da4b63789.jpg', '1', '2016-04-02 10:00:00', '100', '0', '1');
INSERT INTO `zc_goods` VALUES ('31', '4', '摩托罗拉E8 ', '5', '2', '0.000', '1337.00', '0.00', '0', '0', '直板', '', '/Uploads/images/20160403/5700d9e974edd.jpg', '1', '2016-04-02 10:00:00', '100', '0', '2');
INSERT INTO `zc_goods` VALUES ('32', '4', '诺基亚N85', '9', '1', '0.000', '3010.00', '2750.00', '1243785600', '1417276800', '2008年10月 GSM,850,900,1800,1900 黑色', '<p>诺基亚N85参数</p>\r\n<div>&nbsp;</div>\r\n<div>\r\n<table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n    <tbody>\r\n        <tr>\r\n            <td bgcolor=\"#f1f7fc\" colspan=\"2\">\r\n            <p><b>基本参数</b></p>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">手机昵称</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">N85</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">上市日期</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">2008年10月</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">手机类型</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">3G手机；拍照手机；智能手机</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">手机制式</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">GSM</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">支持频段</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">GSM850/900/1800/1900MHz</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">数据传输</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">GPRS、EDGE</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">屏幕材质</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">AMOLED</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">屏幕色彩</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">1600万色</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">主屏尺寸</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">2.6英寸</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">主屏参数</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">QVGA 320&times;240像素</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">铃音描述</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">可选MP3、WAV、AAC或和弦Midi铃声等格式</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">操作系统</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">Symbian OS v9.3操作系统与S60 v3.2平台的组合</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">机身内存</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">74MB 内部动态存储空间<br />\r\n            78MB 内置NAND闪存</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">存储卡</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">支持MicroSD(T-Flash)卡扩展最大至8GB</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">电池规格</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">1200毫安时锂电池</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">标配</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">诺基亚 N85<br />\r\n            诺基亚电池（BL-5K）<br />\r\n            诺基亚旅行充电器（AC-10）<br />\r\n            诺基亚视频数据线（CA-75U）<br />\r\n            诺基亚数据线（CA-101）<br />\r\n            诺基亚音乐耳机（HS-45、AD-54）<br />\r\n            诺基亚 8 GB microSD 卡（MU-43）<br />\r\n            《用户手册》<br />\r\n            《快速入门》</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">理论通话时间</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">6.9 小时</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">理论待机时间</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">363 小时</td>\r\n        </tr>\r\n        <tr>\r\n            <td bgcolor=\"#f1f7fc\" colspan=\"2\">\r\n            <p><b>产品外形</b></p>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">外观设计</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">双向滑盖</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">产品尺寸</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">103&times;50&times;16mm<br />\r\n            体积：76 立方厘米</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">手机重量</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">128克</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">产品天线</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">内置</td>\r\n        </tr>\r\n        <tr>\r\n            <td bgcolor=\"#f1f7fc\" colspan=\"2\">\r\n            <p><b>拍照功能</b></p>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"550\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\" style=\"padding: 8px 0px;\" colspan=\"2\">\r\n            <table cellspacing=\"1\" cellpadding=\"0\" border=\"0\" align=\"left\">\r\n                <tbody>\r\n                    <tr>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">定时器</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">&nbsp;</td>\r\n                    </tr>\r\n                </tbody>\r\n            </table>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">摄像头</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">内置</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">摄像头像素</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">500万像素</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">连拍功能</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">支持</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">LED闪光灯</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">双LED 闪光灯</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">数码变焦</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">20 倍数码变焦</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">拍摄模式</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">静止、连拍、自动定时器、摄像</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">照片特效</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">正常、怀旧、黑白、负片、逼真</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">拍照描述</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">支持最大2592&times;1944分辨率照片拍摄<br />\r\n            支持JPEG、Exif格式<br />\r\n            白平衡模式：自动、阳光、阴天、白炽灯、荧光灯<br />\r\n            感光度模式：高、中、低、自动</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">视频拍摄</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">最高支持640 x 480 像素（VGA）、30 帧/秒</td>\r\n        </tr>\r\n        <tr>\r\n            <td bgcolor=\"#f1f7fc\" colspan=\"2\">\r\n            <p><b>娱乐功能</b></p>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"550\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\" style=\"padding: 8px 0px;\" colspan=\"2\">\r\n            <table cellspacing=\"1\" cellpadding=\"0\" border=\"0\" align=\"left\">\r\n                <tbody>\r\n                    <tr>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">收音机</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">TV-OUT</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">录音功能</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">电子书</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">&nbsp;</td>\r\n                    </tr>\r\n                </tbody>\r\n            </table>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">视频播放</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">内置RealPlayer播放器, 支持MPEG4、H.264/AVC、H.263/3GP、RealVideo等视频格式全屏播放</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">音乐播放</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">内置播放器, 支持mp3、.wma、.aac、eAAC、eAAC+格式</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">游戏</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">内置</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">Java功能</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">支持Java MIDP 2.0 CLDC 1.1</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">Flash功能</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">第3.0版Flash lite播放器</td>\r\n        </tr>\r\n        <tr>\r\n            <td bgcolor=\"#f1f7fc\" colspan=\"2\">\r\n            <p><b>数据功能</b></p>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"550\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\" style=\"padding: 8px 0px;\" colspan=\"2\">\r\n            <table cellspacing=\"1\" cellpadding=\"0\" border=\"0\" align=\"left\">\r\n                <tbody>\r\n                    <tr>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">蓝牙功能</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">&nbsp;</td>\r\n                    </tr>\r\n                </tbody>\r\n            </table>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">数据线接口</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">USB数据线 3.5mm立体声耳机插孔</td>\r\n        </tr>\r\n        <tr>\r\n            <td bgcolor=\"#f1f7fc\" colspan=\"2\">\r\n            <p><b>基本功能</b></p>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"550\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\" style=\"padding: 8px 0px;\" colspan=\"2\">\r\n            <table cellspacing=\"1\" cellpadding=\"0\" border=\"0\" align=\"left\">\r\n                <tbody>\r\n                    <tr>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">短信(SMS)</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">彩信(MMS)</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">免提通话</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">情景模式</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">闹钟功能</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">日历功能</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">&nbsp;</td>\r\n                    </tr>\r\n                </tbody>\r\n            </table>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">输入方式</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">键盘</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">通话记录</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">未接来电+已接来电+已拨电话记录</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">通讯录</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">S60标准化名片式通讯录</td>\r\n        </tr>\r\n        <tr>\r\n            <td bgcolor=\"#f1f7fc\" colspan=\"2\">\r\n            <p><b>网络功能</b></p>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"550\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\" style=\"padding: 8px 0px;\" colspan=\"2\">\r\n            <table cellspacing=\"1\" cellpadding=\"0\" border=\"0\" align=\"left\">\r\n                <tbody>\r\n                    <tr>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">电子邮件</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">WWW浏览器</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">WAP浏览器</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">&nbsp;</td>\r\n                    </tr>\r\n                </tbody>\r\n            </table>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td bgcolor=\"#f1f7fc\" colspan=\"2\">\r\n            <p><b>商务功能</b></p>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"550\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\" style=\"padding: 8px 0px;\" colspan=\"2\">\r\n            <table cellspacing=\"1\" cellpadding=\"0\" border=\"0\" align=\"left\">\r\n                <tbody>\r\n                    <tr>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">飞行模式</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">语音拨号</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">备忘录</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">日程表</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">世界时间</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">&nbsp;</td>\r\n                    </tr>\r\n                </tbody>\r\n            </table>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td bgcolor=\"#f1f7fc\" colspan=\"2\">\r\n            <p><b>其他功能</b></p>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"550\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\" style=\"padding: 8px 0px;\" colspan=\"2\">\r\n            <table cellspacing=\"1\" cellpadding=\"0\" border=\"0\" align=\"left\">\r\n                <tbody>\r\n                    <tr>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">GPS功能</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">电子词典</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">待机图片</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">计算器</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">来电铃声识别</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">来电图片识别</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">来电防火墙</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">动画屏保</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">图形菜单</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">秒表</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">单位换算</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" align=\"middle\" style=\"padding: 2px; float: none;\">&nbsp;</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                    </tr>\r\n                </tbody>\r\n            </table>\r\n            </td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n</div>\r\n<p>&nbsp;</p>', '/Uploads/Images/20160407/5706749270701.jpg', '1', '2016-04-02 10:00:00', '100', '1', '3');
INSERT INTO `zc_goods` VALUES ('35', '0', '诺基亚N85', '0', '2', '0.000', '301.00', '0.00', '0', '0', '', '', '/Uploads/images/20160403/5700c5e935318.jpg', '1', '2016-04-02 10:00:00', '100', '1', '1');
INSERT INTO `zc_goods` VALUES ('36', '0', 'Galxy4', '0', '6', '0.000', '3200.00', '0.00', '0', '0', '', '', '/Uploads/images/20160403/5700da7a0b594.jpg', '1', '2016-04-02 10:55:00', '100', '0', '1');

-- ----------------------------
-- Table structure for zc_goods_attr
-- ----------------------------
DROP TABLE IF EXISTS `zc_goods_attr`;
CREATE TABLE `zc_goods_attr` (
  `goods_attr_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `attr_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attr_value` text NOT NULL,
  `attr_price` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`goods_attr_id`),
  KEY `goods_id` (`goods_id`),
  KEY `attr_id` (`attr_id`)
) ENGINE=MyISAM AUTO_INCREMENT=244 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zc_goods_attr
-- ----------------------------
INSERT INTO `zc_goods_attr` VALUES ('238', '1', '173', 'GSM,850,900,1800,1900', '0');
INSERT INTO `zc_goods_attr` VALUES ('237', '1', '185', '灰色', '1');
INSERT INTO `zc_goods_attr` VALUES ('236', '1', '191', '支持', '0');
INSERT INTO `zc_goods_attr` VALUES ('235', '1', '190', '支持', '0');
INSERT INTO `zc_goods_attr` VALUES ('234', '1', '189', '2.4英寸', '0');
INSERT INTO `zc_goods_attr` VALUES ('233', '1', '172', '2008年04月', '0');
INSERT INTO `zc_goods_attr` VALUES ('228', '9', '178', '滑盖', '0');
INSERT INTO `zc_goods_attr` VALUES ('227', '9', '185', '白色', '0');
INSERT INTO `zc_goods_attr` VALUES ('226', '9', '185', '黑色', '10');
INSERT INTO `zc_goods_attr` VALUES ('232', '8', '178', '直板', '0');
INSERT INTO `zc_goods_attr` VALUES ('231', '8', '185', '黑色', '1');
INSERT INTO `zc_goods_attr` VALUES ('230', '8', '190', '支持', '0');
INSERT INTO `zc_goods_attr` VALUES ('229', '8', '189', '1.75英寸', '0');
INSERT INTO `zc_goods_attr` VALUES ('217', '13', '185', '黑色', '1');
INSERT INTO `zc_goods_attr` VALUES ('216', '13', '189', '2.0英寸', '0');
INSERT INTO `zc_goods_attr` VALUES ('215', '13', '172', '2008年07月', '0');
INSERT INTO `zc_goods_attr` VALUES ('225', '10', '178', '直板', '0');
INSERT INTO `zc_goods_attr` VALUES ('221', '13', '178', '直板', '0');
INSERT INTO `zc_goods_attr` VALUES ('222', '10', '172', '2008年05月', '0');
INSERT INTO `zc_goods_attr` VALUES ('223', '10', '189', '2.2英寸', '0');
INSERT INTO `zc_goods_attr` VALUES ('224', '10', '173', 'GSM,850,900,1800,1900', '0');
INSERT INTO `zc_goods_attr` VALUES ('220', '13', '175', '300小时', '0');
INSERT INTO `zc_goods_attr` VALUES ('219', '13', '174', '4小时', '0');
INSERT INTO `zc_goods_attr` VALUES ('212', '14', '172', '2008年10月', '0');
INSERT INTO `zc_goods_attr` VALUES ('213', '14', '185', '黑色', '0');
INSERT INTO `zc_goods_attr` VALUES ('214', '14', '178', '直板', '0');
INSERT INTO `zc_goods_attr` VALUES ('218', '13', '173', 'GSM,850,900,1800,1900', '0');
INSERT INTO `zc_goods_attr` VALUES ('211', '15', '178', '直板', '0');
INSERT INTO `zc_goods_attr` VALUES ('210', '15', '210', '线控耳机', '50');
INSERT INTO `zc_goods_attr` VALUES ('200', '17', '189', '2.8英寸', '0');
INSERT INTO `zc_goods_attr` VALUES ('201', '17', '185', '黑色', '11');
INSERT INTO `zc_goods_attr` VALUES ('202', '17', '173', 'CDMA', '0');
INSERT INTO `zc_goods_attr` VALUES ('203', '17', '174', '8小时', '0');
INSERT INTO `zc_goods_attr` VALUES ('204', '17', '175', '300小时', '0');
INSERT INTO `zc_goods_attr` VALUES ('205', '17', '178', '直板', '0');
INSERT INTO `zc_goods_attr` VALUES ('206', '15', '58', '2.2英寸', '10');
INSERT INTO `zc_goods_attr` VALUES ('207', '15', '185', '黑色', '22');
INSERT INTO `zc_goods_attr` VALUES ('208', '15', '185', '白色', '20');
INSERT INTO `zc_goods_attr` VALUES ('209', '15', '210', '数据线', '20');
INSERT INTO `zc_goods_attr` VALUES ('196', '19', '185', '黑色', '33');
INSERT INTO `zc_goods_attr` VALUES ('197', '19', '185', '金色', '10');
INSERT INTO `zc_goods_attr` VALUES ('198', '19', '185', '白色', '20');
INSERT INTO `zc_goods_attr` VALUES ('199', '19', '178', '滑盖', '0');
INSERT INTO `zc_goods_attr` VALUES ('195', '20', '173', 'GSM,900,1800,1900,2100', '0');
INSERT INTO `zc_goods_attr` VALUES ('193', '20', '172', '2008年07月', '0');
INSERT INTO `zc_goods_attr` VALUES ('194', '20', '185', '黑色', '22');
INSERT INTO `zc_goods_attr` VALUES ('187', '21', '180', 'T-Flash', '0');
INSERT INTO `zc_goods_attr` VALUES ('189', '21', '210', '线控耳机', '50');
INSERT INTO `zc_goods_attr` VALUES ('188', '21', '185', '黑色', '22');
INSERT INTO `zc_goods_attr` VALUES ('186', '22', '178', '直板', '0');
INSERT INTO `zc_goods_attr` VALUES ('182', '22', '185', '黑色', '22');
INSERT INTO `zc_goods_attr` VALUES ('183', '22', '173', 'GSM,850,900,1800,1900', '0');
INSERT INTO `zc_goods_attr` VALUES ('184', '22', '174', '6.5小时', '0');
INSERT INTO `zc_goods_attr` VALUES ('185', '22', '175', '450小时', '0');
INSERT INTO `zc_goods_attr` VALUES ('181', '22', '181', '288MB', '0');
INSERT INTO `zc_goods_attr` VALUES ('180', '22', '180', 'microSD', '0');
INSERT INTO `zc_goods_attr` VALUES ('179', '22', '172', '2008年12月', '0');
INSERT INTO `zc_goods_attr` VALUES ('192', '21', '175', '100小时', '0');
INSERT INTO `zc_goods_attr` VALUES ('191', '21', '174', '2.5小时', '0');
INSERT INTO `zc_goods_attr` VALUES ('178', '23', '178', '滑盖', '0');
INSERT INTO `zc_goods_attr` VALUES ('190', '21', '210', '数据线', '20');
INSERT INTO `zc_goods_attr` VALUES ('176', '23', '174', '2.5小时', '0');
INSERT INTO `zc_goods_attr` VALUES ('177', '23', '175', '200小时', '0');
INSERT INTO `zc_goods_attr` VALUES ('173', '23', '188', '320×240 像素', '0');
INSERT INTO `zc_goods_attr` VALUES ('174', '23', '189', '2.8英寸', '0');
INSERT INTO `zc_goods_attr` VALUES ('175', '23', '185', '黑色', '33');
INSERT INTO `zc_goods_attr` VALUES ('172', '23', '182', 'Symbian OS 9.3操作系统', '0');
INSERT INTO `zc_goods_attr` VALUES ('171', '23', '181', '256MB', '0');
INSERT INTO `zc_goods_attr` VALUES ('170', '23', '172', '2008年09月', '0');
INSERT INTO `zc_goods_attr` VALUES ('169', '24', '179', 'SMS', '0');
INSERT INTO `zc_goods_attr` VALUES ('166', '24', '190', '支持', '0');
INSERT INTO `zc_goods_attr` VALUES ('167', '24', '185', '灰色', '33');
INSERT INTO `zc_goods_attr` VALUES ('168', '24', '210', '数据线', '20');
INSERT INTO `zc_goods_attr` VALUES ('165', '24', '183', '支持', '0');
INSERT INTO `zc_goods_attr` VALUES ('164', '24', '172', '2008年06月', '0');
INSERT INTO `zc_goods_attr` VALUES ('152', '32', '172', '2008年10月', '0');
INSERT INTO `zc_goods_attr` VALUES ('153', '32', '180', 'MicroSD', '0');
INSERT INTO `zc_goods_attr` VALUES ('154', '32', '181', '78MB', '0');
INSERT INTO `zc_goods_attr` VALUES ('155', '32', '182', 'Symbian OS v9.3', '0');
INSERT INTO `zc_goods_attr` VALUES ('156', '32', '189', '2.6英寸', '0');
INSERT INTO `zc_goods_attr` VALUES ('157', '32', '210', '线控耳机', '50');
INSERT INTO `zc_goods_attr` VALUES ('158', '32', '210', '蓝牙耳机', '100');
INSERT INTO `zc_goods_attr` VALUES ('159', '32', '210', '数据线', '12');
INSERT INTO `zc_goods_attr` VALUES ('160', '32', '173', 'GSM,850,900,1800,1900', '0');
INSERT INTO `zc_goods_attr` VALUES ('161', '32', '174', '6.9 小时', '0');
INSERT INTO `zc_goods_attr` VALUES ('162', '32', '175', '363 小时', '0');
INSERT INTO `zc_goods_attr` VALUES ('163', '32', '185', '黑色', '22');
INSERT INTO `zc_goods_attr` VALUES ('239', '10', '185', '黑色', '11');
INSERT INTO `zc_goods_attr` VALUES ('240', '10', '185', '白色', '22');
INSERT INTO `zc_goods_attr` VALUES ('241', '15', '189', '2.2英寸', '0');
INSERT INTO `zc_goods_attr` VALUES ('243', '15', '189', '2.2英寸', '10');

-- ----------------------------
-- Table structure for zc_goods_attribute
-- ----------------------------
DROP TABLE IF EXISTS `zc_goods_attribute`;
CREATE TABLE `zc_goods_attribute` (
  `attr_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '属性ID',
  `cat_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '分类ID',
  `attr_name` varchar(60) NOT NULL DEFAULT '' COMMENT '属性名称',
  `attr_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '属性类型',
  `attr_values` text NOT NULL COMMENT '属性值',
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `attr_group` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '属性组',
  PRIMARY KEY (`attr_id`),
  KEY `cat_id` (`cat_id`)
) ENGINE=MyISAM AUTO_INCREMENT=213 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zc_goods_attribute
-- ----------------------------
INSERT INTO `zc_goods_attribute` VALUES ('1', '1', '作者', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('2', '1', '出版社', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('3', '1', '图书书号/ISBN', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('4', '1', '出版日期', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('5', '1', '开本', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('6', '1', '图书页数', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('7', '1', '图书装订', '0', '平装\r\n黑白', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('8', '1', '图书规格', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('9', '1', '版次', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('10', '1', '印张', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('11', '1', '字数', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('12', '1', '所属分类', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('13', '2', '中文片名', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('14', '2', '英文片名', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('15', '2', '商品别名', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('16', '2', '介质/格式', '0', 'HDCD\r\nDTS\r\nDVD\r\nDVD9\r\nVCD\r\nCD\r\nTAPE\r\nLP', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('17', '2', '片装数', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('18', '2', '国家地区', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('19', '2', '语种', '0', '中文\r\n英文\r\n法文\r\n西班牙文', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('20', '2', '导演/指挥', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('21', '2', '主唱', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('22', '2', '所属类别', '0', '古典\r\n流行\r\n摇滚\r\n乡村\r\n民谣\r\n爵士\r\n蓝调\r\n电子\r\n舞曲\r\n国乐\r\n民族\r\n怀旧\r\n经典\r\n人声\r\n合唱\r\n发烧\r\n试音\r\n儿童\r\n胎教\r\n轻音乐\r\n世界音乐\r\n庆典音乐\r\n影视音乐\r\n新世纪音乐\r\n大自然音乐', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('23', '2', '长度', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('24', '2', '歌词', '0', '有\r\n无', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('25', '2', '碟片代码', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('26', '2', 'ISRC码', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('27', '2', '发行公司', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('28', '2', '出版', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('29', '2', '出版号', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('30', '2', '引进号', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('31', '2', '版权号', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('32', '3', '中文片名', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('33', '3', '英文片名', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('34', '3', '商品别名', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('35', '3', '介质/格式', '0', 'HDCD\r\nDTS\r\nDVD\r\nDVD9\r\nVCD', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('36', '3', '碟片类型', '0', '单面\r\n双层', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('37', '3', '片装数', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('38', '3', '国家地区', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('39', '3', '语种/配音', '0', '中文\r\n英文\r\n法文\r\n西班牙文', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('40', '3', '字幕', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('41', '3', '色彩', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('42', '3', '中文字幕', '0', '有\r\n无', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('43', '3', '导演', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('44', '3', '表演者', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('45', '3', '所属类别', '0', '爱情\r\n偶像\r\n生活\r\n社会\r\n科幻\r\n神话\r\n武侠\r\n动作\r\n惊险\r\n恐怖\r\n传奇\r\n人物\r\n侦探\r\n警匪\r\n历史\r\n军事\r\n戏剧\r\n舞台\r\n经典\r\n名著\r\n喜剧\r\n情景\r\n动漫\r\n卡通\r\n儿童\r\n伦理激情', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('46', '3', '年份', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('47', '3', '音频格式', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('48', '3', '区码', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('49', '3', '碟片代码', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('50', '3', 'ISRC码', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('51', '3', '发行公司', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('52', '3', '出版 ', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('53', '3', '出版号', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('54', '3', '引进号', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('55', '3', '版权号', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('56', '4', '网络制式', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('57', '4', '支持频率/网络频率', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('58', '4', '尺寸体积', '0', '   ', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('59', '4', '外观样式/手机类型', '0', '翻盖\r\n滑盖\r\n直板\r\n折叠\r\n手写', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('60', '4', '主屏参数/内屏参数', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('61', '4', '副屏参数/外屏参数', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('62', '4', '清晰度', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('63', '4', '色数/灰度', '0', '   ', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('64', '4', '长度', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('65', '4', '宽度', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('66', '4', '厚度', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('67', '4', '屏幕材质', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('68', '4', '内存容量', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('69', '4', '操作系统', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('70', '4', '通话时间', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('71', '4', '待机时间', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('72', '4', '标准配置', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('73', '4', 'WAP上网', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('74', '4', '数据业务', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('75', '4', '天线位置', '0', '内置\r\n外置', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('76', '4', '随机配件', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('77', '4', '铃声', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('78', '4', '摄像头', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('79', '4', '彩信/彩e', '0', '支持\r\n不支持', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('80', '4', '红外/蓝牙', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('81', '4', '价格等级', '0', '高价机\r\n中价机\r\n低价机', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('82', '5', '型号', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('83', '5', '详细规格', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('84', '5', '笔记本尺寸', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('85', '5', '处理器类型', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('86', '5', '处理器最高主频', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('87', '5', '二级缓存', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('88', '5', '系统总线', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('89', '5', '主板芯片组', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('90', '5', '内存容量', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('91', '5', '内存类型', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('92', '5', '硬盘', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('93', '5', '屏幕尺寸', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('94', '5', '显示芯片', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('95', '5', '标称频率', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('96', '5', '显卡显存', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('97', '5', '显卡类型', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('98', '5', '光驱类型', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('99', '5', '电池容量', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('100', '5', '其他配置', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('101', '6', '类型', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('102', '6', '最大像素/总像素  ', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('103', '6', '有效像素', '0', '  ', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('104', '6', '光学变焦倍数', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('105', '6', '数字变焦倍数', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('106', '6', '操作模式', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('107', '6', '显示屏类型', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('108', '6', '显示屏尺寸', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('109', '6', '感光器件', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('110', '6', '感光器件尺寸', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('111', '6', '最高分辨率', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('112', '6', '图像分辨率', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('113', '6', '传感器类型', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('114', '6', '传感器尺寸', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('115', '6', '镜头', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('116', '6', '光圈', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('117', '6', '焦距', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('118', '6', '旋转液晶屏', '0', '支持\r\n不支持', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('119', '6', '存储介质', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('120', '6', '存储卡', '0', '  记录媒体\r\n存储卡容量', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('121', '6', '影像格式', '0', '    静像\r\n动画', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('122', '6', '曝光控制', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('123', '6', '曝光模式', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('124', '6', '曝光补偿', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('125', '6', '白平衡', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('126', '6', '连拍', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('127', '6', '快门速度', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('128', '6', '闪光灯', '0', '内置\r\n外置', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('129', '6', '拍摄范围', '0', '  ', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('130', '6', '自拍定时器', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('131', '6', 'ISO感光度', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('132', '6', '测光模式', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('133', '6', '场景模式', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('134', '6', '短片拍摄', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('135', '6', '外接接口', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('136', '6', '电源', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('137', '6', '电池使用时间', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('138', '6', '外形尺寸', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('139', '6', '标配软件', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('140', '6', '标准配件', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('141', '6', '兼容操作系统', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('142', '7', '编号', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('143', '7', '类型', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('144', '7', '外型尺寸', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('145', '7', '最大像素数', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('146', '7', '光学变焦倍数', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('147', '7', '数字变焦倍数', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('148', '7', '显示屏尺寸及类型', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('149', '7', '感光器件', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('150', '7', '感光器件尺寸', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('151', '7', '感光器件数量', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('152', '7', '像素范围', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('153', '7', '传感器数量', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('154', '7', '传感器尺寸', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('155', '7', '水平清晰度', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('156', '7', '取景器', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('157', '7', '数码效果', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('158', '7', '镜头性能', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('159', '7', '对焦方式', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('160', '7', '曝光控制', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('161', '7', '其他接口', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('162', '7', '随机存储', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('163', '7', '电池类型', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('164', '7', '电池供电时间', '0', '100小时', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('165', '8', '产地', '0', '美国', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('166', '8', '产品规格/容量', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('167', '8', '主要原料', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('168', '8', '所属类别', '0', '彩妆\r\n化妆工具\r\n护肤品\r\n香水', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('169', '8', '使用部位', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('170', '8', '适合肤质', '0', '油性\r\n中性\r\n干性', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('171', '8', '适用人群', '0', '女性\r\n男性', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('172', '9', '上市日期', '0', '2008年01月\r\n2008年02月\r\n2008年03月\r\n2008年04月\r\n2008年05月\r\n2008年06月\r\n2008年07月\r\n2008年08月\r\n2008年09月\r\n2008年10月\r\n2008年11月\r\n2008年12月\r\n2007年01月\r\n2007年02月\r\n2007年03月\r\n2007年04月\r\n2007年05月\r\n2007年06月\r\n2007年07月\r\n2007年08月\r\n2007年09月\r\n2007年10月\r\n2007年11月\r\n2007年12月', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('173', '9', '手机制式', '0', 'GSM,850,900,1800,1900\r\nGSM,900,1800,1900,2100\r\nCDMA\r\n双模（GSM,900,1800,CDMA 1X）\r\n3G(GSM,900,1800,1900,TD-SCDMA )', '1', '0');
INSERT INTO `zc_goods_attribute` VALUES ('174', '9', '理论通话时间', '0', '', '2', '0');
INSERT INTO `zc_goods_attribute` VALUES ('175', '9', '理论待机时间', '0', '', '3', '0');
INSERT INTO `zc_goods_attribute` VALUES ('176', '9', '铃声', '0', '', '4', '0');
INSERT INTO `zc_goods_attribute` VALUES ('177', '9', '铃声格式', '0', '', '5', '0');
INSERT INTO `zc_goods_attribute` VALUES ('178', '9', '外观样式', '0', '翻盖\r\n滑盖\r\n直板\r\n折叠', '6', '0');
INSERT INTO `zc_goods_attribute` VALUES ('179', '9', '中文短消息', '0', '', '7', '0');
INSERT INTO `zc_goods_attribute` VALUES ('180', '9', '存储卡格式', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('181', '9', '内存容量', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('182', '9', '操作系统', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('183', '9', 'K-JAVA', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('184', '9', '尺寸体积', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('185', '9', '颜色', '1', '黑色\r\n白色\r\n蓝色\r\n金色\r\n粉色\r\n银色\r\n灰色\r\n深李色\r\n黑红色\r\n黑蓝色\r\n白紫色', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('186', '9', '屏幕颜色', '0', '1600万\r\n262144万', '0', '1');
INSERT INTO `zc_goods_attribute` VALUES ('187', '9', '屏幕材质', '0', 'TFT', '0', '1');
INSERT INTO `zc_goods_attribute` VALUES ('188', '9', '屏幕分辨率', '0', '320×240 像素\r\n240×400 像素\r\n240×320 像素\r\n176x220 像素', '0', '1');
INSERT INTO `zc_goods_attribute` VALUES ('189', '9', '屏幕大小', '0', '', '0', '1');
INSERT INTO `zc_goods_attribute` VALUES ('190', '9', '中文输入法', '0', '', '0', '2');
INSERT INTO `zc_goods_attribute` VALUES ('191', '9', '情景模式', '0', '', '0', '2');
INSERT INTO `zc_goods_attribute` VALUES ('192', '9', '网络链接', '0', '', '0', '2');
INSERT INTO `zc_goods_attribute` VALUES ('193', '9', '蓝牙接口', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('194', '9', '数据线接口', '0', '', '0', '2');
INSERT INTO `zc_goods_attribute` VALUES ('195', '9', '电子邮件', '0', '', '0', '2');
INSERT INTO `zc_goods_attribute` VALUES ('196', '9', '闹钟', '0', '', '35', '4');
INSERT INTO `zc_goods_attribute` VALUES ('197', '9', '办公功能', '0', '', '0', '4');
INSERT INTO `zc_goods_attribute` VALUES ('198', '9', '数码相机', '0', '', '0', '3');
INSERT INTO `zc_goods_attribute` VALUES ('199', '9', '像素', '0', '', '0', '3');
INSERT INTO `zc_goods_attribute` VALUES ('200', '9', '传感器', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('201', '9', '变焦模式', '0', '', '0', '3');
INSERT INTO `zc_goods_attribute` VALUES ('202', '9', '视频拍摄', '0', '', '0', '3');
INSERT INTO `zc_goods_attribute` VALUES ('203', '9', 'MP3播放器', '0', '', '0', '3');
INSERT INTO `zc_goods_attribute` VALUES ('204', '9', '视频播放', '0', '', '0', '3');
INSERT INTO `zc_goods_attribute` VALUES ('205', '9', 'CPU频率', '0', '', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('206', '9', '收音机', '0', '', '0', '3');
INSERT INTO `zc_goods_attribute` VALUES ('207', '9', '耳机接口', '0', '', '0', '3');
INSERT INTO `zc_goods_attribute` VALUES ('208', '9', '闪光灯', '0', '', '0', '3');
INSERT INTO `zc_goods_attribute` VALUES ('209', '9', '浏览器', '0', '', '0', '2');
INSERT INTO `zc_goods_attribute` VALUES ('210', '9', '配件', '2', '线控耳机\r\n蓝牙耳机\r\n数据线', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('211', '165', '', '1', '美国', '0', '1');

-- ----------------------------
-- Table structure for zc_goods_cat
-- ----------------------------
DROP TABLE IF EXISTS `zc_goods_cat`;
CREATE TABLE `zc_goods_cat` (
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `cat_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`goods_id`,`cat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zc_goods_cat
-- ----------------------------
INSERT INTO `zc_goods_cat` VALUES ('8', '2');
INSERT INTO `zc_goods_cat` VALUES ('8', '5');
INSERT INTO `zc_goods_cat` VALUES ('16', '3');
INSERT INTO `zc_goods_cat` VALUES ('16', '5');

-- ----------------------------
-- Table structure for zc_goods_type
-- ----------------------------
DROP TABLE IF EXISTS `zc_goods_type`;
CREATE TABLE `zc_goods_type` (
  `cat_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(60) NOT NULL DEFAULT '',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `attr_group` varchar(255) NOT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zc_goods_type
-- ----------------------------
INSERT INTO `zc_goods_type` VALUES ('1', '书', '0', '6');
INSERT INTO `zc_goods_type` VALUES ('2', '音乐', '0', '5');
INSERT INTO `zc_goods_type` VALUES ('3', '电影', '0', '4');
INSERT INTO `zc_goods_type` VALUES ('4', '手机', '0', '4');
INSERT INTO `zc_goods_type` VALUES ('5', '笔记本电脑', '0', '3');
INSERT INTO `zc_goods_type` VALUES ('6', '数码相机', '0', '2');
INSERT INTO `zc_goods_type` VALUES ('7', '数码摄像机', '0', '2');

-- ----------------------------
-- Table structure for zc_menus
-- ----------------------------
DROP TABLE IF EXISTS `zc_menus`;
CREATE TABLE `zc_menus` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `pid` int(5) NOT NULL,
  `title` varchar(255) NOT NULL,
  `state` tinyint(4) NOT NULL DEFAULT '1',
  `path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zc_menus
-- ----------------------------
INSERT INTO `zc_menus` VALUES ('1', '0', '笔记本', '1', '/desktop/');
INSERT INTO `zc_menus` VALUES ('2', '0', '手机', '1', '/phone/');
INSERT INTO `zc_menus` VALUES ('3', '2', 'Iphone', '1', '/phone/iphone/');
INSERT INTO `zc_menus` VALUES ('4', '1', '戴尔', '1', '/desktop/dell/');

-- ----------------------------
-- Table structure for zc_ucenter_admin
-- ----------------------------
DROP TABLE IF EXISTS `zc_ucenter_admin`;
CREATE TABLE `zc_ucenter_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `member_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员用户ID',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '管理员状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of zc_ucenter_admin
-- ----------------------------

-- ----------------------------
-- Table structure for zc_users
-- ----------------------------
DROP TABLE IF EXISTS `zc_users`;
CREATE TABLE `zc_users` (
  `user_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `email` varchar(60) NOT NULL DEFAULT '' COMMENT '邮箱',
  `user_name` varchar(60) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `sex` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` date NOT NULL DEFAULT '0000-00-00' COMMENT '生日',
  `user_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '账户余额',
  `address_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '地址',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '上次登录时间',
  `qq` varchar(20) NOT NULL COMMENT 'QQ号码',
  `home_phone` varchar(20) NOT NULL COMMENT '住宅电话',
  `mobile_phone` varchar(20) NOT NULL COMMENT '手机号码',
  `is_validated` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否通过验证',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_name` (`user_name`),
  KEY `email` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of zc_users
-- ----------------------------

/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : yao

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2016-05-07 23:29:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for zc_addons
-- ----------------------------
DROP TABLE IF EXISTS `zc_addons`;
CREATE TABLE `zc_addons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL COMMENT '插件名或标识',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '中文名',
  `description` text COMMENT '插件描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `config` text COMMENT '配置',
  `author` varchar(40) DEFAULT '' COMMENT '作者',
  `version` varchar(20) DEFAULT '' COMMENT '版本号',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `has_adminlist` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台列表',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='插件表';

-- ----------------------------
-- Records of zc_addons
-- ----------------------------
INSERT INTO `zc_addons` VALUES ('15', 'EditorForAdmin', '后台编辑器', '用于增强整站长文本的输入和显示', '1', '{\"editor_type\":\"2\",\"editor_wysiwyg\":\"1\",\"editor_height\":\"500px\",\"editor_resize_type\":\"1\"}', 'thinkphp', '0.1', '1383126253', '0');
INSERT INTO `zc_addons` VALUES ('2', 'SiteStat', '站点统计信息', '统计站点的基础信息', '1', '{\"title\":\"\\u7cfb\\u7edf\\u4fe1\\u606f\",\"width\":\"1\",\"display\":\"1\",\"status\":\"0\"}', 'thinkphp', '0.1', '1379512015', '0');
INSERT INTO `zc_addons` VALUES ('3', 'DevTeam', '开发团队信息', '开发团队成员信息', '1', '{\"title\":\"OneThink\\u5f00\\u53d1\\u56e2\\u961f\",\"width\":\"2\",\"display\":\"1\"}', 'thinkphp', '0.1', '1379512022', '0');
INSERT INTO `zc_addons` VALUES ('4', 'SystemInfo', '系统环境信息', '用于显示一些服务器的信息', '1', '{\"title\":\"\\u7cfb\\u7edf\\u4fe1\\u606f\",\"width\":\"2\",\"display\":\"1\"}', 'thinkphp', '0.1', '1379512036', '0');
INSERT INTO `zc_addons` VALUES ('5', 'Editor', '前台编辑器', '用于增强整站长文本的输入和显示', '1', '{\"editor_type\":\"2\",\"editor_wysiwyg\":\"1\",\"editor_height\":\"300px\",\"editor_resize_type\":\"1\"}', 'thinkphp', '0.1', '1379830910', '0');
INSERT INTO `zc_addons` VALUES ('6', 'Attachment', '附件', '用于文档模型上传附件', '1', 'null', 'thinkphp', '0.1', '1379842319', '1');
INSERT INTO `zc_addons` VALUES ('9', 'SocialComment', '通用社交化评论', '集成了各种社交化评论插件，轻松集成到系统中。', '1', '{\"comment_type\":\"1\",\"comment_uid_youyan\":\"\",\"comment_short_name_duoshuo\":\"\",\"comment_data_list_duoshuo\":\"\"}', 'thinkphp', '0.1', '1380273962', '0');

-- ----------------------------
-- Table structure for zc_area_region
-- ----------------------------
DROP TABLE IF EXISTS `zc_area_region`;
CREATE TABLE `zc_area_region` (
  `shipping_area_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `region_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`shipping_area_id`,`region_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zc_area_region
-- ----------------------------
INSERT INTO `zc_area_region` VALUES ('1', '1');
INSERT INTO `zc_area_region` VALUES ('2', '1');
INSERT INTO `zc_area_region` VALUES ('3', '1');
INSERT INTO `zc_area_region` VALUES ('4', '3');
INSERT INTO `zc_area_region` VALUES ('4', '4');
INSERT INTO `zc_area_region` VALUES ('4', '6');
INSERT INTO `zc_area_region` VALUES ('4', '9');
INSERT INTO `zc_area_region` VALUES ('4', '30');
INSERT INTO `zc_area_region` VALUES ('4', '32');

-- ----------------------------
-- Table structure for zc_attachment
-- ----------------------------
DROP TABLE IF EXISTS `zc_attachment`;
CREATE TABLE `zc_attachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '附件显示名',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件类型',
  `source` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '资源ID',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联记录ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '附件大小',
  `dir` int(12) unsigned NOT NULL DEFAULT '0' COMMENT '上级目录ID',
  `sort` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `idx_record_status` (`record_id`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表';

-- ----------------------------
-- Records of zc_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for zc_attribute
-- ----------------------------
DROP TABLE IF EXISTS `zc_attribute`;
CREATE TABLE `zc_attribute` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '字段名',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '字段注释',
  `field` varchar(100) NOT NULL DEFAULT '' COMMENT '字段定义',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '数据类型',
  `value` varchar(100) NOT NULL DEFAULT '' COMMENT '字段默认值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '备注',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '参数',
  `model_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '模型id',
  `is_must` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否必填',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `validate_rule` varchar(255) NOT NULL,
  `validate_time` tinyint(1) unsigned NOT NULL,
  `error_info` varchar(100) NOT NULL,
  `validate_type` varchar(25) NOT NULL,
  `auto_rule` varchar(100) NOT NULL,
  `auto_time` tinyint(1) unsigned NOT NULL,
  `auto_type` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `model_id` (`model_id`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COMMENT='模型属性表';

-- ----------------------------
-- Records of zc_attribute
-- ----------------------------
INSERT INTO `zc_attribute` VALUES ('1', 'uid', '用户ID', 'int(10) unsigned NOT NULL ', 'num', '0', '', '0', '', '1', '0', '1', '1384508362', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `zc_attribute` VALUES ('2', 'name', '标识', 'char(40) NOT NULL ', 'string', '', '同一根节点下标识不重复', '1', '', '1', '0', '1', '1383894743', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `zc_attribute` VALUES ('3', 'title', '标题', 'char(80) NOT NULL ', 'string', '', '文档标题', '1', '', '1', '0', '1', '1383894778', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `zc_attribute` VALUES ('4', 'category_id', '所属分类', 'int(10) unsigned NOT NULL ', 'string', '', '', '0', '', '1', '0', '1', '1384508336', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `zc_attribute` VALUES ('5', 'description', '描述', 'char(140) NOT NULL ', 'textarea', '', '', '1', '', '1', '0', '1', '1383894927', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `zc_attribute` VALUES ('6', 'root', '根节点', 'int(10) unsigned NOT NULL ', 'num', '0', '该文档的顶级文档编号', '0', '', '1', '0', '1', '1384508323', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `zc_attribute` VALUES ('7', 'pid', '所属ID', 'int(10) unsigned NOT NULL ', 'num', '0', '父文档编号', '0', '', '1', '0', '1', '1384508543', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `zc_attribute` VALUES ('8', 'model_id', '内容模型ID', 'tinyint(3) unsigned NOT NULL ', 'num', '0', '该文档所对应的模型', '0', '', '1', '0', '1', '1384508350', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `zc_attribute` VALUES ('9', 'type', '内容类型', 'tinyint(3) unsigned NOT NULL ', 'select', '2', '', '1', '1:目录\r\n2:主题\r\n3:段落', '1', '0', '1', '1384511157', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `zc_attribute` VALUES ('10', 'position', '推荐位', 'smallint(5) unsigned NOT NULL ', 'checkbox', '0', '多个推荐则将其推荐值相加', '1', '1:列表推荐\r\n2:频道页推荐\r\n4:首页推荐', '1', '0', '1', '1383895640', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `zc_attribute` VALUES ('11', 'link_id', '外链', 'int(10) unsigned NOT NULL ', 'num', '0', '0-非外链，大于0-外链ID,需要函数进行链接与编号的转换', '1', '', '1', '0', '1', '1383895757', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `zc_attribute` VALUES ('12', 'cover_id', '封面', 'int(10) unsigned NOT NULL ', 'picture', '0', '0-无封面，大于0-封面图片ID，需要函数处理', '1', '', '1', '0', '1', '1384147827', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `zc_attribute` VALUES ('13', 'display', '可见性', 'tinyint(3) unsigned NOT NULL ', 'radio', '1', '', '1', '0:不可见\r\n1:所有人可见', '1', '0', '1', '1386662271', '1383891233', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `zc_attribute` VALUES ('14', 'deadline', '截至时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '0-永久有效', '1', '', '1', '0', '1', '1387163248', '1383891233', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `zc_attribute` VALUES ('15', 'attach', '附件数量', 'tinyint(3) unsigned NOT NULL ', 'num', '0', '', '0', '', '1', '0', '1', '1387260355', '1383891233', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `zc_attribute` VALUES ('16', 'view', '浏览量', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '1', '0', '1', '1383895835', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `zc_attribute` VALUES ('17', 'comment', '评论数', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '1', '0', '1', '1383895846', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `zc_attribute` VALUES ('18', 'extend', '扩展统计字段', 'int(10) unsigned NOT NULL ', 'num', '0', '根据需求自行使用', '0', '', '1', '0', '1', '1384508264', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `zc_attribute` VALUES ('19', 'level', '优先级', 'int(10) unsigned NOT NULL ', 'num', '0', '越高排序越靠前', '1', '', '1', '0', '1', '1383895894', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `zc_attribute` VALUES ('20', 'create_time', '创建时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', '1', '', '1', '0', '1', '1383895903', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `zc_attribute` VALUES ('21', 'update_time', '更新时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', '0', '', '1', '0', '1', '1384508277', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `zc_attribute` VALUES ('22', 'status', '数据状态', 'tinyint(4) NOT NULL ', 'radio', '0', '', '0', '-1:删除\r\n0:禁用\r\n1:正常\r\n2:待审核\r\n3:草稿', '1', '0', '1', '1384508496', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `zc_attribute` VALUES ('23', 'parse', '内容解析类型', 'tinyint(3) unsigned NOT NULL ', 'select', '0', '', '0', '0:html\r\n1:ubb\r\n2:markdown', '2', '0', '1', '1384511049', '1383891243', '', '0', '', '', '', '0', '');
INSERT INTO `zc_attribute` VALUES ('24', 'content', '文章内容', 'text NOT NULL ', 'editor', '', '', '1', '', '2', '0', '1', '1383896225', '1383891243', '', '0', '', '', '', '0', '');
INSERT INTO `zc_attribute` VALUES ('25', 'template', '详情页显示模板', 'varchar(100) NOT NULL ', 'string', '', '参照display方法参数的定义', '1', '', '2', '0', '1', '1383896190', '1383891243', '', '0', '', '', '', '0', '');
INSERT INTO `zc_attribute` VALUES ('26', 'bookmark', '收藏数', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '2', '0', '1', '1383896103', '1383891243', '', '0', '', '', '', '0', '');
INSERT INTO `zc_attribute` VALUES ('27', 'parse', '内容解析类型', 'tinyint(3) unsigned NOT NULL ', 'select', '0', '', '0', '0:html\r\n1:ubb\r\n2:markdown', '3', '0', '1', '1387260461', '1383891252', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `zc_attribute` VALUES ('28', 'content', '下载详细描述', 'text NOT NULL ', 'editor', '', '', '1', '', '3', '0', '1', '1383896438', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `zc_attribute` VALUES ('29', 'template', '详情页显示模板', 'varchar(100) NOT NULL ', 'string', '', '', '1', '', '3', '0', '1', '1383896429', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `zc_attribute` VALUES ('30', 'file_id', '文件ID', 'int(10) unsigned NOT NULL ', 'file', '0', '需要函数处理', '1', '', '3', '0', '1', '1383896415', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `zc_attribute` VALUES ('31', 'download', '下载次数', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '3', '0', '1', '1383896380', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `zc_attribute` VALUES ('32', 'size', '文件大小', 'bigint(20) unsigned NOT NULL ', 'num', '0', '单位bit', '1', '', '3', '0', '1', '1383896371', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `zc_attribute` VALUES ('33', 'name', '名称', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '4', '1', '1', '1459608388', '1459608388', '', '3', '', 'regex', '', '3', 'function');

-- ----------------------------
-- Table structure for zc_auth_extend
-- ----------------------------
DROP TABLE IF EXISTS `zc_auth_extend`;
CREATE TABLE `zc_auth_extend` (
  `group_id` mediumint(10) unsigned NOT NULL COMMENT '用户id',
  `extend_id` mediumint(8) unsigned NOT NULL COMMENT '扩展表中数据的id',
  `type` tinyint(1) unsigned NOT NULL COMMENT '扩展类型标识 1:栏目分类权限;2:模型权限',
  UNIQUE KEY `group_extend_type` (`group_id`,`extend_id`,`type`),
  KEY `uid` (`group_id`),
  KEY `group_id` (`extend_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户组与分类的对应关系表';

-- ----------------------------
-- Records of zc_auth_extend
-- ----------------------------
INSERT INTO `zc_auth_extend` VALUES ('1', '1', '1');
INSERT INTO `zc_auth_extend` VALUES ('1', '1', '2');
INSERT INTO `zc_auth_extend` VALUES ('1', '2', '1');
INSERT INTO `zc_auth_extend` VALUES ('1', '2', '2');
INSERT INTO `zc_auth_extend` VALUES ('1', '3', '1');
INSERT INTO `zc_auth_extend` VALUES ('1', '3', '2');
INSERT INTO `zc_auth_extend` VALUES ('1', '4', '1');
INSERT INTO `zc_auth_extend` VALUES ('1', '37', '1');

-- ----------------------------
-- Table structure for zc_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `zc_auth_group`;
CREATE TABLE `zc_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '用户组所属模块',
  `type` tinyint(4) NOT NULL COMMENT '组类型',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `description` varchar(80) NOT NULL DEFAULT '' COMMENT '描述信息',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户组状态：为1正常，为0禁用,-1为删除',
  `rules` varchar(500) NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id，多个规则 , 隔开',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zc_auth_group
-- ----------------------------
INSERT INTO `zc_auth_group` VALUES ('1', 'admin', '1', '默认用户组', '', '1', '1,2,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,79,80,81,82,83,84,86,87,88,89,90,91,92,93,94,95,96,97,100,102,103,105,106');
INSERT INTO `zc_auth_group` VALUES ('2', 'admin', '1', '测试用户', '测试用户', '1', '1,2,5,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,79,80,82,83,84,88,89,90,91,92,93,96,97,100,102,103,195');

-- ----------------------------
-- Table structure for zc_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `zc_auth_group_access`;
CREATE TABLE `zc_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '用户组id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zc_auth_group_access
-- ----------------------------

-- ----------------------------
-- Table structure for zc_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `zc_auth_rule`;
CREATE TABLE `zc_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1-url;2-主菜单',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=217 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zc_auth_rule
-- ----------------------------
INSERT INTO `zc_auth_rule` VALUES ('1', 'admin', '2', 'Admin/Index/index', '首页', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('2', 'admin', '2', 'Admin/Article/mydocument', '内容', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('3', 'admin', '2', 'Admin/User/index', '用户', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('4', 'admin', '2', 'Admin/Addons/index', '扩展', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('5', 'admin', '2', 'Admin/Config/group', '系统', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('7', 'admin', '1', 'Admin/article/add', '新增', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('8', 'admin', '1', 'Admin/article/edit', '编辑', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('9', 'admin', '1', 'Admin/article/setStatus', '改变状态', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('10', 'admin', '1', 'Admin/article/update', '保存', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('11', 'admin', '1', 'Admin/article/autoSave', '保存草稿', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('12', 'admin', '1', 'Admin/article/move', '移动', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('13', 'admin', '1', 'Admin/article/copy', '复制', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('14', 'admin', '1', 'Admin/article/paste', '粘贴', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('15', 'admin', '1', 'Admin/article/permit', '还原', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('16', 'admin', '1', 'Admin/article/clear', '清空', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('17', 'admin', '1', 'Admin/article/index', '文档列表', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('18', 'admin', '1', 'Admin/article/recycle', '回收站', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('19', 'admin', '1', 'Admin/User/addaction', '新增用户行为', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('20', 'admin', '1', 'Admin/User/editaction', '编辑用户行为', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('21', 'admin', '1', 'Admin/User/saveAction', '保存用户行为', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('22', 'admin', '1', 'Admin/User/setStatus', '变更行为状态', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('23', 'admin', '1', 'Admin/User/changeStatus?method=forbidUser', '禁用会员', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('24', 'admin', '1', 'Admin/User/changeStatus?method=resumeUser', '启用会员', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('25', 'admin', '1', 'Admin/User/changeStatus?method=deleteUser', '删除会员', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('26', 'admin', '1', 'Admin/User/index', '用户信息', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('27', 'admin', '1', 'Admin/User/action', '用户行为', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('28', 'admin', '1', 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('29', 'admin', '1', 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('30', 'admin', '1', 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('31', 'admin', '1', 'Admin/AuthManager/createGroup', '新增', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('32', 'admin', '1', 'Admin/AuthManager/editGroup', '编辑', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('33', 'admin', '1', 'Admin/AuthManager/writeGroup', '保存用户组', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('34', 'admin', '1', 'Admin/AuthManager/group', '授权', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('35', 'admin', '1', 'Admin/AuthManager/access', '访问授权', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('36', 'admin', '1', 'Admin/AuthManager/user', '成员授权', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('37', 'admin', '1', 'Admin/AuthManager/removeFromGroup', '解除授权', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('38', 'admin', '1', 'Admin/AuthManager/addToGroup', '保存成员授权', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('39', 'admin', '1', 'Admin/AuthManager/category', '分类授权', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('40', 'admin', '1', 'Admin/AuthManager/addToCategory', '保存分类授权', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('41', 'admin', '1', 'Admin/AuthManager/index', '权限管理', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('42', 'admin', '1', 'Admin/Addons/create', '创建', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('43', 'admin', '1', 'Admin/Addons/checkForm', '检测创建', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('44', 'admin', '1', 'Admin/Addons/preview', '预览', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('45', 'admin', '1', 'Admin/Addons/build', '快速生成插件', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('46', 'admin', '1', 'Admin/Addons/config', '设置', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('47', 'admin', '1', 'Admin/Addons/disable', '禁用', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('48', 'admin', '1', 'Admin/Addons/enable', '启用', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('49', 'admin', '1', 'Admin/Addons/install', '安装', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('50', 'admin', '1', 'Admin/Addons/uninstall', '卸载', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('51', 'admin', '1', 'Admin/Addons/saveconfig', '更新配置', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('52', 'admin', '1', 'Admin/Addons/adminList', '插件后台列表', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('53', 'admin', '1', 'Admin/Addons/execute', 'URL方式访问插件', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('54', 'admin', '1', 'Admin/Addons/index', '插件管理', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('55', 'admin', '1', 'Admin/Addons/hooks', '钩子管理', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('56', 'admin', '1', 'Admin/model/add', '新增', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('57', 'admin', '1', 'Admin/model/edit', '编辑', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('58', 'admin', '1', 'Admin/model/setStatus', '改变状态', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('59', 'admin', '1', 'Admin/model/update', '保存数据', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('60', 'admin', '1', 'Admin/Model/index', '模型管理', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('61', 'admin', '1', 'Admin/Config/edit', '编辑', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('62', 'admin', '1', 'Admin/Config/del', '删除', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('63', 'admin', '1', 'Admin/Config/add', '新增', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('64', 'admin', '1', 'Admin/Config/save', '保存', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('65', 'admin', '1', 'Admin/Config/group', '网站设置', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('66', 'admin', '1', 'Admin/Config/index', '配置管理', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('67', 'admin', '1', 'Admin/Channel/add', '新增', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('68', 'admin', '1', 'Admin/Channel/edit', '编辑', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('69', 'admin', '1', 'Admin/Channel/del', '删除', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('70', 'admin', '1', 'Admin/Channel/index', '导航管理', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('71', 'admin', '1', 'Admin/Category/edit', '编辑', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('72', 'admin', '1', 'Admin/Category/add', '新增', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('73', 'admin', '1', 'Admin/Category/remove', '删除', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('74', 'admin', '1', 'Admin/Category/index', '分类管理', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('75', 'admin', '1', 'Admin/file/upload', '上传控件', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('76', 'admin', '1', 'Admin/file/uploadPicture', '上传图片', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('77', 'admin', '1', 'Admin/file/download', '下载', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('94', 'admin', '1', 'Admin/AuthManager/modelauth', '模型授权', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('79', 'admin', '1', 'Admin/article/batchOperate', '导入', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('80', 'admin', '1', 'Admin/Database/index?type=export', '备份数据库', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('81', 'admin', '1', 'Admin/Database/index?type=import', '还原数据库', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('82', 'admin', '1', 'Admin/Database/export', '备份', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('83', 'admin', '1', 'Admin/Database/optimize', '优化表', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('84', 'admin', '1', 'Admin/Database/repair', '修复表', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('86', 'admin', '1', 'Admin/Database/import', '恢复', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('87', 'admin', '1', 'Admin/Database/del', '删除', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('88', 'admin', '1', 'Admin/User/add', '新增用户', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('89', 'admin', '1', 'Admin/Attribute/index', '属性管理', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('90', 'admin', '1', 'Admin/Attribute/add', '新增', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('91', 'admin', '1', 'Admin/Attribute/edit', '编辑', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('92', 'admin', '1', 'Admin/Attribute/setStatus', '改变状态', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('93', 'admin', '1', 'Admin/Attribute/update', '保存数据', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('95', 'admin', '1', 'Admin/AuthManager/addToModel', '保存模型授权', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('96', 'admin', '1', 'Admin/Category/move', '移动', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('97', 'admin', '1', 'Admin/Category/merge', '合并', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('98', 'admin', '1', 'Admin/Config/menu', '后台菜单管理', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('99', 'admin', '1', 'Admin/Article/mydocument', '内容', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('100', 'admin', '1', 'Admin/Menu/index', '菜单管理', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('101', 'admin', '1', 'Admin/other', '其他', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('102', 'admin', '1', 'Admin/Menu/add', '新增', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('103', 'admin', '1', 'Admin/Menu/edit', '编辑', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('104', 'admin', '1', 'Admin/Think/lists?model=article', '文章管理', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('105', 'admin', '1', 'Admin/Think/lists?model=download', '下载管理', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('106', 'admin', '1', 'Admin/Think/lists?model=config', '配置管理', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('107', 'admin', '1', 'Admin/Action/actionlog', '行为日志', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('108', 'admin', '1', 'Admin/User/updatePassword', '修改密码', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('109', 'admin', '1', 'Admin/User/updateNickname', '修改昵称', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('110', 'admin', '1', 'Admin/action/edit', '查看行为日志', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('205', 'admin', '1', 'Admin/think/add', '新增数据', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('111', 'admin', '2', 'Admin/article/index', '文档列表', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('112', 'admin', '2', 'Admin/article/add', '新增', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('113', 'admin', '2', 'Admin/article/edit', '编辑', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('114', 'admin', '2', 'Admin/article/setStatus', '改变状态', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('115', 'admin', '2', 'Admin/article/update', '保存', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('116', 'admin', '2', 'Admin/article/autoSave', '保存草稿', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('117', 'admin', '2', 'Admin/article/move', '移动', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('118', 'admin', '2', 'Admin/article/copy', '复制', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('119', 'admin', '2', 'Admin/article/paste', '粘贴', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('120', 'admin', '2', 'Admin/article/batchOperate', '导入', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('121', 'admin', '2', 'Admin/article/recycle', '回收站', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('122', 'admin', '2', 'Admin/article/permit', '还原', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('123', 'admin', '2', 'Admin/article/clear', '清空', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('124', 'admin', '2', 'Admin/User/add', '新增用户', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('125', 'admin', '2', 'Admin/User/action', '用户行为', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('126', 'admin', '2', 'Admin/User/addAction', '新增用户行为', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('127', 'admin', '2', 'Admin/User/editAction', '编辑用户行为', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('128', 'admin', '2', 'Admin/User/saveAction', '保存用户行为', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('129', 'admin', '2', 'Admin/User/setStatus', '变更行为状态', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('130', 'admin', '2', 'Admin/User/changeStatus?method=forbidUser', '禁用会员', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('131', 'admin', '2', 'Admin/User/changeStatus?method=resumeUser', '启用会员', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('132', 'admin', '2', 'Admin/User/changeStatus?method=deleteUser', '删除会员', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('133', 'admin', '2', 'Admin/AuthManager/index', '权限管理', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('134', 'admin', '2', 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('135', 'admin', '2', 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('136', 'admin', '2', 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('137', 'admin', '2', 'Admin/AuthManager/createGroup', '新增', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('138', 'admin', '2', 'Admin/AuthManager/editGroup', '编辑', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('139', 'admin', '2', 'Admin/AuthManager/writeGroup', '保存用户组', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('140', 'admin', '2', 'Admin/AuthManager/group', '授权', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('141', 'admin', '2', 'Admin/AuthManager/access', '访问授权', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('142', 'admin', '2', 'Admin/AuthManager/user', '成员授权', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('143', 'admin', '2', 'Admin/AuthManager/removeFromGroup', '解除授权', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('144', 'admin', '2', 'Admin/AuthManager/addToGroup', '保存成员授权', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('145', 'admin', '2', 'Admin/AuthManager/category', '分类授权', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('146', 'admin', '2', 'Admin/AuthManager/addToCategory', '保存分类授权', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('147', 'admin', '2', 'Admin/AuthManager/modelauth', '模型授权', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('148', 'admin', '2', 'Admin/AuthManager/addToModel', '保存模型授权', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('149', 'admin', '2', 'Admin/Addons/create', '创建', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('150', 'admin', '2', 'Admin/Addons/checkForm', '检测创建', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('151', 'admin', '2', 'Admin/Addons/preview', '预览', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('152', 'admin', '2', 'Admin/Addons/build', '快速生成插件', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('153', 'admin', '2', 'Admin/Addons/config', '设置', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('154', 'admin', '2', 'Admin/Addons/disable', '禁用', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('155', 'admin', '2', 'Admin/Addons/enable', '启用', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('156', 'admin', '2', 'Admin/Addons/install', '安装', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('157', 'admin', '2', 'Admin/Addons/uninstall', '卸载', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('158', 'admin', '2', 'Admin/Addons/saveconfig', '更新配置', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('159', 'admin', '2', 'Admin/Addons/adminList', '插件后台列表', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('160', 'admin', '2', 'Admin/Addons/execute', 'URL方式访问插件', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('161', 'admin', '2', 'Admin/Addons/hooks', '钩子管理', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('162', 'admin', '2', 'Admin/Model/index', '模型管理', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('163', 'admin', '2', 'Admin/model/add', '新增', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('164', 'admin', '2', 'Admin/model/edit', '编辑', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('165', 'admin', '2', 'Admin/model/setStatus', '改变状态', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('166', 'admin', '2', 'Admin/model/update', '保存数据', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('167', 'admin', '2', 'Admin/Attribute/index', '属性管理', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('168', 'admin', '2', 'Admin/Attribute/add', '新增', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('169', 'admin', '2', 'Admin/Attribute/edit', '编辑', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('170', 'admin', '2', 'Admin/Attribute/setStatus', '改变状态', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('171', 'admin', '2', 'Admin/Attribute/update', '保存数据', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('172', 'admin', '2', 'Admin/Config/index', '配置管理', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('173', 'admin', '2', 'Admin/Config/edit', '编辑', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('174', 'admin', '2', 'Admin/Config/del', '删除', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('175', 'admin', '2', 'Admin/Config/add', '新增', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('176', 'admin', '2', 'Admin/Config/save', '保存', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('177', 'admin', '2', 'Admin/Menu/index', '菜单管理', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('178', 'admin', '2', 'Admin/Channel/index', '导航管理', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('179', 'admin', '2', 'Admin/Channel/add', '新增', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('180', 'admin', '2', 'Admin/Channel/edit', '编辑', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('181', 'admin', '2', 'Admin/Channel/del', '删除', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('182', 'admin', '2', 'Admin/Category/index', '分类管理', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('183', 'admin', '2', 'Admin/Category/edit', '编辑', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('184', 'admin', '2', 'Admin/Category/add', '新增', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('185', 'admin', '2', 'Admin/Category/remove', '删除', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('186', 'admin', '2', 'Admin/Category/move', '移动', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('187', 'admin', '2', 'Admin/Category/merge', '合并', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('188', 'admin', '2', 'Admin/Database/index?type=export', '备份数据库', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('189', 'admin', '2', 'Admin/Database/export', '备份', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('190', 'admin', '2', 'Admin/Database/optimize', '优化表', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('191', 'admin', '2', 'Admin/Database/repair', '修复表', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('192', 'admin', '2', 'Admin/Database/index?type=import', '还原数据库', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('193', 'admin', '2', 'Admin/Database/import', '恢复', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('194', 'admin', '2', 'Admin/Database/del', '删除', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('195', 'admin', '2', 'Admin/other', '其他', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('196', 'admin', '2', 'Admin/Menu/add', '新增', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('197', 'admin', '2', 'Admin/Menu/edit', '编辑', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('198', 'admin', '2', 'Admin/Think/lists?model=article', '应用', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('199', 'admin', '2', 'Admin/Think/lists?model=download', '下载管理', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('200', 'admin', '2', 'Admin/Think/lists?model=config', '应用', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('201', 'admin', '2', 'Admin/Action/actionlog', '行为日志', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('202', 'admin', '2', 'Admin/User/updatePassword', '修改密码', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('203', 'admin', '2', 'Admin/User/updateNickname', '修改昵称', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('204', 'admin', '2', 'Admin/action/edit', '查看行为日志', '-1', '');
INSERT INTO `zc_auth_rule` VALUES ('206', 'admin', '1', 'Admin/think/edit', '编辑数据', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('207', 'admin', '1', 'Admin/Menu/import', '导入', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('208', 'admin', '1', 'Admin/Model/generate', '生成', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('209', 'admin', '1', 'Admin/Addons/addHook', '新增钩子', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('210', 'admin', '1', 'Admin/Addons/edithook', '编辑钩子', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('211', 'admin', '1', 'Admin/Article/sort', '文档排序', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('212', 'admin', '1', 'Admin/Config/sort', '排序', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('213', 'admin', '1', 'Admin/Menu/sort', '排序', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('214', 'admin', '1', 'Admin/Channel/sort', '排序', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('215', 'admin', '1', 'Admin/Category/operate/type/move', '移动', '1', '');
INSERT INTO `zc_auth_rule` VALUES ('216', 'admin', '1', 'Admin/Category/operate/type/merge', '合并', '1', '');

-- ----------------------------
-- Table structure for zc_banner
-- ----------------------------
DROP TABLE IF EXISTS `zc_banner`;
CREATE TABLE `zc_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `featured` tinyint(4) DEFAULT '0',
  `created_time` datetime NOT NULL,
  `hits` int(11) NOT NULL DEFAULT '0',
  `state` tinyint(4) NOT NULL DEFAULT '1',
  `order` int(4) NOT NULL,
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
  `rec_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `session_id` char(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_sn` varchar(60) NOT NULL DEFAULT '',
  `product_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_name` varchar(120) NOT NULL DEFAULT '',
  `market_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `goods_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `goods_number` smallint(5) unsigned NOT NULL DEFAULT '0',
  `goods_attr` text NOT NULL,
  `is_real` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `extension_code` varchar(30) NOT NULL DEFAULT '',
  `parent_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `rec_type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_gift` smallint(5) unsigned NOT NULL DEFAULT '0',
  `is_shipping` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `can_handsel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `goods_attr_id` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`rec_id`),
  KEY `session_id` (`session_id`)
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zc_cart
-- ----------------------------
INSERT INTO `zc_cart` VALUES ('40', '0', '50267c918cd909d345dc03549b4c2718', '24', 'ECS000024', '0', 'P806', '2400.00', '2000.00', '1', '', '1', '', '0', '0', '0', '0', '0', '0');
INSERT INTO `zc_cart` VALUES ('42', '1', 'bcbcc1492eca623e624aa93a978ee66d', '24', 'ECS000024', '0', 'P806', '2400.00', '100.00', '5', '', '1', '', '0', '1', '0', '0', '0', '0');
INSERT INTO `zc_cart` VALUES ('43', '9', 'dsvg0irkq7ishks0as7v844ij2', '37', '', '0', '', '0.00', '0.00', '1', '', '0', '', '0', '0', '0', '0', '0', '');
INSERT INTO `zc_cart` VALUES ('44', '9', 'dsvg0irkq7ishks0as7v844ij2', '36', '', '0', '', '0.00', '0.00', '1', '', '0', '', '0', '0', '0', '0', '0', '');
INSERT INTO `zc_cart` VALUES ('45', '9', 'dsvg0irkq7ishks0as7v844ij2', '35', '', '0', '', '0.00', '0.00', '2', '', '0', '', '0', '0', '0', '0', '0', '');
INSERT INTO `zc_cart` VALUES ('46', '9', 'dsvg0irkq7ishks0as7v844ij2', '32', '', '0', '', '0.00', '0.00', '1', '', '0', '', '0', '0', '0', '0', '0', '');
INSERT INTO `zc_cart` VALUES ('47', '9', 't21qpsbldcabm1nq4mq3fr7ms2', '23', '', '0', '', '0.00', '0.00', '1', '', '0', '', '0', '0', '0', '0', '0', '');
INSERT INTO `zc_cart` VALUES ('48', '9', '5h26t04hn1aerkoiskjqasq4v7', '42', '', '0', '', '0.00', '0.00', '1', '', '0', '', '0', '0', '0', '0', '0', '');
INSERT INTO `zc_cart` VALUES ('49', '9', '5h26t04hn1aerkoiskjqasq4v7', '48', '', '0', '', '0.00', '0.00', '1', '', '0', '', '0', '0', '0', '0', '0', '');

-- ----------------------------
-- Table structure for zc_category
-- ----------------------------
DROP TABLE IF EXISTS `zc_category`;
CREATE TABLE `zc_category` (
  `cat_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(90) NOT NULL DEFAULT '',
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `cat_desc` varchar(255) NOT NULL DEFAULT '',
  `parent_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `sort_order` tinyint(1) unsigned NOT NULL DEFAULT '50',
  `template_file` varchar(50) NOT NULL DEFAULT '',
  `measure_unit` varchar(15) NOT NULL DEFAULT '',
  `show_in_nav` tinyint(1) NOT NULL DEFAULT '0',
  `style` varchar(150) NOT NULL,
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `grade` tinyint(4) NOT NULL DEFAULT '0',
  `filter_attr` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cat_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zc_category
-- ----------------------------
INSERT INTO `zc_category` VALUES ('1', '手机', '', '', '0', '50', '', '', '0', '', '1', '5', '172,185,178');
INSERT INTO `zc_category` VALUES ('26', '键盘', '', '', '25', '1', '', '件', '0', '', '1', '0', '0');
INSERT INTO `zc_category` VALUES ('25', '3C配件', '', '', '0', '8', '', '个', '0', '', '1', '0', '0');
INSERT INTO `zc_category` VALUES ('16', 'Iphone', '', '', '1', '1', '', '台', '0', '', '1', '0', '0');
INSERT INTO `zc_category` VALUES ('24', '铁三角', '', '', '23', '1', '', '个', '0', '', '1', '0', '0');
INSERT INTO `zc_category` VALUES ('23', '耳机', '', '', '0', '6', '', '个', '0', '', '1', '0', '0');
INSERT INTO `zc_category` VALUES ('22', '佳能', '', '', '21', '1', '', '台', '0', '', '1', '0', '0');
INSERT INTO `zc_category` VALUES ('21', '相机', '', '', '0', '5', '', '台', '0', '', '1', '0', '0');
INSERT INTO `zc_category` VALUES ('20', '索尼', '', '', '19', '1', '', '台', '0', '', '1', '0', '0');
INSERT INTO `zc_category` VALUES ('19', '电视机', '', '', '0', '3', '', '台', '0', '', '1', '0', '0');
INSERT INTO `zc_category` VALUES ('18', '三星', '', '', '1', '2', '', '台', '0', '', '1', '0', '0');
INSERT INTO `zc_category` VALUES ('17', '笔记本', '', '', '0', '2', '', '台', '0', '', '1', '0', '0');
INSERT INTO `zc_category` VALUES ('27', '鼠标', '', '', '25', '2', '', '个', '0', '', '1', '0', '0');
INSERT INTO `zc_category` VALUES ('28', '音响', '', '', '25', '3', '', '个', '0', '', '1', '0', '0');
INSERT INTO `zc_category` VALUES ('29', '体重秤', '', '', '25', '4', '', '台', '0', '', '1', '0', '0');
INSERT INTO `zc_category` VALUES ('30', '手环', '', '', '25', '5', '', '个', '0', '', '1', '0', '0');
INSERT INTO `zc_category` VALUES ('31', '充电宝', '', '', '25', '6', '', '个', '0', '', '1', '0', '0');
INSERT INTO `zc_category` VALUES ('32', '诺基亚', '', '', '1', '3', '', '台', '0', '', '1', '0', '0');
INSERT INTO `zc_category` VALUES ('33', '摩托罗拉', '', '', '1', '4', '', '台', '0', '', '1', '0', '0');
INSERT INTO `zc_category` VALUES ('34', '其他', '', '', '0', '7', '', '个', '0', '', '1', '0', '0');
INSERT INTO `zc_category` VALUES ('35', '充值卡', '', '', '34', '1', '', '张', '0', '', '1', '0', '0');

-- ----------------------------
-- Table structure for zc_comment
-- ----------------------------
DROP TABLE IF EXISTS `zc_comment`;
CREATE TABLE `zc_comment` (
  `comment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `comment_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `id_value` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `email` varchar(60) NOT NULL DEFAULT '',
  `user_name` varchar(60) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `comment_rank` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  `ip_address` varchar(15) NOT NULL DEFAULT '',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_id`),
  KEY `parent_id` (`parent_id`),
  KEY `id_value` (`id_value`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zc_comment
-- ----------------------------
INSERT INTO `zc_comment` VALUES ('1', '0', '12', 'ecshop@ecshop.com', 'ecshop', '很好，我很喜欢', '5', '1242107120', '0.0.0.0', '1', '0', '1');
INSERT INTO `zc_comment` VALUES ('2', '0', '22', 'ecshop@ecshop.com', 'ecshop', '这个我不是很适合我', '5', '1242107295', '0.0.0.0', '0', '0', '1');

-- ----------------------------
-- Table structure for zc_config
-- ----------------------------
DROP TABLE IF EXISTS `zc_config`;
CREATE TABLE `zc_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置说明',
  `group` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(100) NOT NULL COMMENT '配置说明',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `value` text NOT NULL COMMENT '配置值',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `type` (`type`),
  KEY `group` (`group`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zc_config
-- ----------------------------
INSERT INTO `zc_config` VALUES ('1', 'WEB_SITE_TITLE', '1', '网站标题', '1', '', '网站标题前台显示标题', '1378898976', '1379235274', '1', 'ZCStore后台', '0');
INSERT INTO `zc_config` VALUES ('2', 'WEB_SITE_DESCRIPTION', '2', '网站描述', '1', '', '网站搜索引擎描述', '1378898976', '1379235841', '1', 'ZCStore后台', '1');
INSERT INTO `zc_config` VALUES ('3', 'WEB_SITE_KEYWORD', '2', '网站关键字', '1', '', '网站搜索引擎关键字', '1378898976', '1381390100', '1', 'zcstore,store', '8');
INSERT INTO `zc_config` VALUES ('4', 'WEB_SITE_CLOSE', '4', '关闭站点', '1', '0:关闭,1:开启', '站点关闭后其他用户不能访问，管理员可以正常访问', '1378898976', '1379235296', '1', '1', '1');
INSERT INTO `zc_config` VALUES ('9', 'CONFIG_TYPE_LIST', '3', '配置类型列表', '4', '', '主要用于数据解析和页面表单的生成', '1378898976', '1379235348', '1', '0:数字\r\n1:字符\r\n2:文本\r\n3:数组\r\n4:枚举', '2');
INSERT INTO `zc_config` VALUES ('10', 'WEB_SITE_ICP', '1', '网站备案号', '1', '', '设置在网站底部显示的备案号，如“沪ICP备12007941号-2', '1378900335', '1379235859', '1', '', '9');
INSERT INTO `zc_config` VALUES ('11', 'DOCUMENT_POSITION', '3', '文档推荐位', '2', '', '文档推荐位，推荐到多个位置KEY值相加即可', '1379053380', '1379235329', '1', '1:列表页推荐\r\n2:频道页推荐\r\n4:网站首页推荐', '3');
INSERT INTO `zc_config` VALUES ('12', 'DOCUMENT_DISPLAY', '3', '文档可见性', '2', '', '文章可见性仅影响前台显示，后台不收影响', '1379056370', '1379235322', '1', '0:所有人可见\r\n1:仅注册会员可见\r\n2:仅管理员可见', '4');
INSERT INTO `zc_config` VALUES ('13', 'COLOR_STYLE', '4', '后台色系', '1', 'default_color:默认\r\nblue_color:紫罗兰', '后台颜色风格', '1379122533', '1379235904', '1', 'default_color', '10');
INSERT INTO `zc_config` VALUES ('20', 'CONFIG_GROUP_LIST', '3', '配置分组', '4', '', '配置分组', '1379228036', '1384418383', '1', '1:基本\r\n2:内容\r\n3:用户\r\n4:系统', '4');
INSERT INTO `zc_config` VALUES ('21', 'HOOKS_TYPE', '3', '钩子的类型', '4', '', '类型 1-用于扩展显示内容，2-用于扩展业务处理', '1379313397', '1379313407', '1', '1:视图\r\n2:控制器', '6');
INSERT INTO `zc_config` VALUES ('22', 'AUTH_CONFIG', '3', 'Auth配置', '4', '', '自定义Auth.class.php类配置', '1379409310', '1379409564', '1', 'AUTH_ON:1\r\nAUTH_TYPE:2', '8');
INSERT INTO `zc_config` VALUES ('23', 'OPEN_DRAFTBOX', '4', '是否开启草稿功能', '2', '0:关闭草稿功能\r\n1:开启草稿功能\r\n', '新增文章时的草稿功能配置', '1379484332', '1379484591', '1', '1', '1');
INSERT INTO `zc_config` VALUES ('24', 'DRAFT_AOTOSAVE_INTERVAL', '0', '自动保存草稿时间', '2', '', '自动保存草稿的时间间隔，单位：秒', '1379484574', '1386143323', '1', '60', '2');
INSERT INTO `zc_config` VALUES ('25', 'LIST_ROWS', '0', '后台每页记录数', '2', '', '后台数据每页显示记录数', '1379503896', '1460038797', '1', '10', '10');
INSERT INTO `zc_config` VALUES ('26', 'USER_ALLOW_REGISTER', '4', '是否允许用户注册', '3', '0:关闭注册\r\n1:允许注册', '是否开放用户注册', '1379504487', '1379504580', '1', '1', '3');
INSERT INTO `zc_config` VALUES ('27', 'CODEMIRROR_THEME', '4', '预览插件的CodeMirror主题', '4', '3024-day:3024 day\r\n3024-night:3024 night\r\nambiance:ambiance\r\nbase16-dark:base16 dark\r\nbase16-light:base16 light\r\nblackboard:blackboard\r\ncobalt:cobalt\r\neclipse:eclipse\r\nelegant:elegant\r\nerlang-dark:erlang-dark\r\nlesser-dark:lesser-dark\r\nmidnight:midnight', '详情见CodeMirror官网', '1379814385', '1384740813', '1', 'ambiance', '3');
INSERT INTO `zc_config` VALUES ('28', 'DATA_BACKUP_PATH', '1', '数据库备份根路径', '4', '', '路径必须以 / 结尾', '1381482411', '1381482411', '1', './Data/', '5');
INSERT INTO `zc_config` VALUES ('29', 'DATA_BACKUP_PART_SIZE', '0', '数据库备份卷大小', '4', '', '该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M', '1381482488', '1381729564', '1', '20971520', '7');
INSERT INTO `zc_config` VALUES ('30', 'DATA_BACKUP_COMPRESS', '4', '数据库备份文件是否启用压缩', '4', '0:不压缩\r\n1:启用压缩', '压缩备份文件需要PHP环境支持gzopen,gzwrite函数', '1381713345', '1381729544', '1', '1', '9');
INSERT INTO `zc_config` VALUES ('31', 'DATA_BACKUP_COMPRESS_LEVEL', '4', '数据库备份文件压缩级别', '4', '1:普通\r\n4:一般\r\n9:最高', '数据库备份文件的压缩级别，该配置在开启压缩时生效', '1381713408', '1381713408', '1', '9', '10');
INSERT INTO `zc_config` VALUES ('32', 'DEVELOP_MODE', '4', '开启开发者模式', '4', '0:关闭\r\n1:开启', '是否开启开发者模式', '1383105995', '1383291877', '1', '1', '11');
INSERT INTO `zc_config` VALUES ('33', 'ALLOW_VISIT', '3', '不受限控制器方法', '0', '', '', '1386644047', '1386644741', '1', '0:article/draftbox\r\n1:article/mydocument\r\n2:Category/tree\r\n3:Index/verify\r\n4:file/upload\r\n5:file/download\r\n6:user/updatePassword\r\n7:user/updateNickname\r\n8:user/submitPassword\r\n9:user/submitNickname\r\n10:file/uploadpicture', '0');
INSERT INTO `zc_config` VALUES ('34', 'DENY_VISIT', '3', '超管专限控制器方法', '0', '', '仅超级管理员可访问的控制器方法', '1386644141', '1386644659', '1', '0:Addons/addhook\r\n1:Addons/edithook\r\n2:Addons/delhook\r\n3:Addons/updateHook\r\n4:Admin/getMenus\r\n5:Admin/recordList\r\n6:AuthManager/updateRules\r\n7:AuthManager/tree', '0');
INSERT INTO `zc_config` VALUES ('35', 'REPLY_LIST_ROWS', '0', '回复列表每页条数', '2', '', '', '1386645376', '1387178083', '1', '10', '0');
INSERT INTO `zc_config` VALUES ('36', 'ADMIN_ALLOW_IP', '2', '后台允许访问IP', '4', '', '多个用逗号分隔，如果不配置表示不限制IP访问', '1387165454', '1387165553', '1', '', '12');
INSERT INTO `zc_config` VALUES ('37', 'SHOW_PAGE_TRACE', '4', '是否显示页面Trace', '4', '0:关闭\r\n1:开启', '是否显示页面Trace信息', '1387165685', '1387165685', '1', '0', '1');

-- ----------------------------
-- Table structure for zc_goods
-- ----------------------------
DROP TABLE IF EXISTS `zc_goods`;
CREATE TABLE `zc_goods` (
  `goods_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `cat_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `goods_name` varchar(120) NOT NULL DEFAULT '',
  `click_count` int(10) unsigned NOT NULL DEFAULT '0',
  `brand_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `provider_name` varchar(100) NOT NULL DEFAULT '',
  `goods_number` smallint(5) unsigned NOT NULL DEFAULT '0',
  `goods_weight` decimal(10,3) unsigned NOT NULL DEFAULT '0.000',
  `shop_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `promote_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `promote_start_date` int(11) unsigned NOT NULL DEFAULT '0',
  `promote_end_date` int(11) unsigned NOT NULL DEFAULT '0',
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `goods_brief` varchar(255) NOT NULL DEFAULT '',
  `goods_desc` text NOT NULL,
  `goods_thumb` varchar(255) NOT NULL DEFAULT '',
  `goods_img` varchar(255) NOT NULL DEFAULT '',
  `original_img` varchar(255) NOT NULL DEFAULT '',
  `is_real` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `extension_code` varchar(30) NOT NULL DEFAULT '',
  `is_on_sale` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `is_alone_sale` tinyint(1) unsigned DEFAULT '1',
  `is_shipping` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `integral` int(10) unsigned NOT NULL DEFAULT '0',
  `add_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sort_order` smallint(4) unsigned NOT NULL DEFAULT '100',
  `is_delete` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_best` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_new` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_hot` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_promote` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `bonus_type_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `last_update` int(10) unsigned NOT NULL DEFAULT '0',
  `goods_type` smallint(5) unsigned NOT NULL DEFAULT '0',
  `seller_note` varchar(255) NOT NULL DEFAULT '',
  `give_integral` int(11) NOT NULL DEFAULT '-1',
  `rank_integral` int(11) NOT NULL DEFAULT '-1',
  `suppliers_id` smallint(5) unsigned DEFAULT NULL,
  `is_check` tinyint(1) unsigned DEFAULT NULL,
  `goods_info` text,
  PRIMARY KEY (`goods_id`),
  KEY `cat_id` (`cat_id`),
  KEY `last_update` (`last_update`),
  KEY `brand_id` (`brand_id`),
  KEY `goods_weight` (`goods_weight`),
  KEY `promote_end_date` (`promote_end_date`),
  KEY `promote_start_date` (`promote_start_date`),
  KEY `goods_number` (`goods_number`),
  KEY `sort_order` (`sort_order`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zc_goods
-- ----------------------------
INSERT INTO `zc_goods` VALUES ('1', '3', 'KD876', '7', '8', '', '1', '0.110', '1388.00', '0.00', '0', '0', 'LG 3g 876 支持 双模 2008年04月 灰色 GSM,850,900,1800,1900', '', '徒徒，我会想你的', 'images/200905/thumb_img/1_thumb_G_1240902890710.jpg', '/Uploads/Images/20160410/5709337ec2269.jpg', 'images/200905/source_img/1_G_1240902890895.gif', '1', '', '1', '1', '0', '13', '2016-04-02 10:00:00', '100', '0', '1', '1', '1', '0', '0', '1269589545', '3', '', '-1', '-1', null, null, '<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 很多朋友都已经抢先体验了3G网络的可视通话、高速上网等功能。LG KD876手机<span style=\"font-size: x-large;\"><span style=\"color: rgb(255, 0, 0);\"><strong>支持TD-SCDMA/GSM双模单待</strong></span></span>，便于测试初期GSM网络和TD网络之间的切换和共享。</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LG KD876手机整体采用银色塑料材质，<strong><span style=\"font-size: x-large;\"><span style=\"color: rgb(255, 0, 0);\">特殊的旋转屏设计是本机的亮点</span></span></strong>，而机身背部的300万像素摄像头也是首发的六款TD-SCDMA手机中配置最高的。LG KD876手机屏幕下方设置有外键盘，该键盘由左/右软键、通话/挂机键、返回键、五维摇杆组成，摇杆灵敏度很高，定位准确。KD876的内键盘由标准12个电话键和三个功能键、一个内置摄像头组成。三个功能键分别为视频通话、MP3、和菜单键，所有按键的手感都比较一般，键程适中，当由于按键排列过于紧密，快速发短信时很容易误按，用户在使用时一定要多加注意。LG KD876手机机身周边的接口设计非常简洁，手机的厚度主要来自屏幕旋转轴的长度，如果舍弃旋屏设计的话，估计<span style=\"font-size: x-large;\"><strong><span style=\"color: rgb(255, 0, 0);\">厚度可以做到10mm以下</span></strong></span>。</p>');
INSERT INTO `zc_goods` VALUES ('4', '8', '诺基亚N85原装充电器', '0', '1', '', '17', '0.000', '58.00', '0.00', '0', '0', '', '', '徒徒，我会想你的', 'images/200905/thumb_img/4_thumb_G_1241422402467.jpg', 'images/200905/goods_img/4_G_1241422402722.jpg', 'images/200905/source_img/4_G_1241422402919.jpg', '1', '', '0', '0', '0', '0', '2016-04-02 10:00:00', '100', '0', '0', '0', '0', '0', '0', '1242110662', '6', '', '-1', '-1', null, null, '');
INSERT INTO `zc_goods` VALUES ('3', '8', '诺基亚原装5800耳机', '3', '1', '', '24', '0.000', '68.00', '0.00', '0', '0', '', '', '徒徒，我会想你的', 'images/200905/thumb_img/3_thumb_G_1241422082679.jpg', 'images/200905/goods_img/3_G_1241422082168.jpg', 'images/200905/source_img/3_G_1241422082367.jpg', '1', '', '0', '1', '0', '0', '2016-04-02 10:00:00', '100', '0', '0', '0', '0', '0', '0', '1241972255', '6', '', '-1', '-1', null, null, '');
INSERT INTO `zc_goods` VALUES ('5', '11', '索爱原装M2卡读卡器', '3', '7', '', '8', '0.000', '20.00', '0.00', '0', '0', '', '', '徒徒，我会想你的', 'images/200905/thumb_img/5_thumb_G_1241422518886.jpg', 'images/200905/goods_img/5_G_1241422518773.jpg', 'images/200905/source_img/5_G_1241422518470.jpg', '1', '', '0', '1', '0', '0', '2016-04-02 10:00:00', '100', '0', '1', '1', '0', '0', '0', '1241972241', '2', '', '-1', '-1', null, null, '');
INSERT INTO `zc_goods` VALUES ('6', '11', '胜创KINGMAX内存卡', '0', '0', '', '15', '0.000', '42.00', '0.00', '0', '0', '', '', '徒徒，我会想你的', '', '', '', '1', '', '0', '0', '0', '0', '2016-04-02 10:00:00', '100', '0', '0', '0', '0', '0', '0', '1241972238', '6', '', '-1', '-1', null, null, '');
INSERT INTO `zc_goods` VALUES ('7', '8', '诺基亚N85原装立体声耳机HS-82', '0', '1', '', '20', '0.000', '100.00', '0.00', '0', '0', '', '', '徒徒，我会想你的', 'images/200905/thumb_img/7_thumb_G_1241422785492.jpg', 'images/200905/goods_img/7_G_1241422785856.jpg', 'images/200905/source_img/7_G_1241422785657.jpg', '1', '', '0', '1', '0', '1', '2016-04-02 10:00:00', '100', '0', '0', '0', '0', '0', '0', '1241972232', '2', '', '-1', '-1', null, null, '');
INSERT INTO `zc_goods` VALUES ('8', '1', '飞利浦9@9v', '9', '4', '', '1', '0.075', '399.00', '385.00', '1241366400', '1417276800', '双模 2008年春 黑色 直板 中低档', '', '徒徒，我会想你的', 'images/200905/thumb_img/8_thumb_G_1241425513488.jpg', '[\"\\/Uploads\\/Images\\/20160507\\/572da79194880.jpg\",\"\\/Uploads\\/Images\\/20160507\\/572da791add34.jpg\",\"\\/Uploads\\/Images\\/20160507\\/572d83caddd5d.jpg\",\"\\/Uploads\\/Images\\/20160507\\/572d96edee969.jpg\"]', 'images/200905/source_img/8_G_1241425513518.jpg', '1', '', '0', '1', '0', '3', '2016-04-02 10:00:00', '100', '0', '1', '1', '1', '1', '0', '1269589533', '9', '', '-1', '-1', null, null, '<p style=\"text-align:left;\">作为一款性价比极高的入门级<span style=\"font-size:16px;color:#ff0000\"><strong>商务手机</strong></span>，飞利浦<a href=\"mailto:9@9v\">Xenium&nbsp; 9@9v</a>三围大小为105&amp;times;44&amp;times;15.8mm，机身重量仅为<strong><span style=\"font-size:16px;color:#ff0000\">75g</span></strong>，装配了一块低规格1.75英寸128&amp;times;160像素65000色CSTN显示屏。身正面采用月银色功能键区与屏幕数字键区相分隔，键盘设计较为<span style=\"font-size:16px\"><strong><span style=\"color:#ff0000\">别</span><span style=\"color:#ff0000\">致</span></strong></span>，中部导航键区采用钛金色的&amp;ldquo;腰带&amp;rdquo;彰显出浓郁的商务气息。</p><p style=\"text-align:left;\">&nbsp;</p><p style=\"text-align:left;\">此款手机采用<strong><span style=\"font-size:16px;color:#ff0000\">触摸屏</span></strong>设计，搭配精致的手写笔，可支持手写中文和英文两个版本。增强的内置系统还能识别潦草字迹，确保在移动中和匆忙时输入文字的识别率。手写指令功能还支持特定图案的瞬间调用，独特的手写记事本功能，可以在触摸屏上随意绘制个性化的图案并进行<strong><span style=\"font-size:16px;color:#ff0000\">记事提醒</span></strong>，让商务应用更加随意。</p><p style=\"text-align:left;\">&nbsp;</p><p style=\"text-align:left;\">&nbsp;作为入门级为数不多支持<strong><span style=\"font-size:16px;color:#ff0000\">双卡功能</span></strong>的手机，可以同时插入两张SIM卡，通过菜单随意切换，只需开启漫游自动切换模式，<a href=\"mailto:9@9V\">9@9V</a>在该模式下能够判断网络情况，自动切换适合的手机号。</p><p style=\"text-align:left;\">&nbsp;</p><p style=\"text-align: left;\">&nbsp;</p>');
INSERT INTO `zc_goods` VALUES ('9', '4', '诺基亚E66', '20', '1', '', '4', '0.121', '2298.00', '0.00', '0', '0', 'SMS EMS MMS 短消息群发 语音 阅读器 SMS,EMS,MMS,短消息群发语音合成信息阅读器 黑色 白色 滑盖', '', '徒徒，我会想你的', 'images/200905/thumb_img/9_thumb_G_1241511871555.jpg', '/Uploads/images/20160403/5700d9e974edd.jpg', 'images/200905/source_img/9_G_1241511871550.jpg', '1', '', '0', '1', '0', '22', '2016-04-02 10:00:00', '100', '0', '1', '1', '1', '0', '0', '1269589743', '4', '', '-1', '-1', null, null, '<p>在机身材质方面，诺基亚E66大量采用金属材质，刨光的金属表面光泽动人，背面的点状效果规则却又不失变化，时尚感总是在不经意间诠释出来，并被人们所感知。E66机身尺寸为<span style=\"color: rgb(255, 0, 0);\"><span style=\"font-size: larger;\"><strong>107.5&times;49.5&times;13.6毫米，重量为121克</strong></span></span>，滑盖的造型竟然比E71还要轻一些。</p>\r\n<p>&nbsp;</p>\r\n<div>诺基亚E66机身正面是<span style=\"color: rgb(255, 0, 0);\"><span style=\"font-size: larger;\"><strong>一块2.4英寸1600万色QVGA分辨率（240&times;320像素）液晶显示屏</strong></span></span>。屏幕上方拥有光线感应元件，能够自适应周 围环境光调节屏幕亮度；屏幕下方是方向功能键区。打开滑盖，可以看到传统的数字键盘，按键的大小、手感、间隔以及键程适中，手感非常舒适。</div>\r\n<div>&nbsp;</div>\r\n<div>诺基亚为E66配备了一颗320万像素自动对焦摄像头，带有LED 闪光灯，支持多种拍照尺寸选择。</div>\r\n<p>&nbsp;</p>');
INSERT INTO `zc_goods` VALUES ('10', '4', '索爱C702c', '11', '7', '', '7', '0.000', '1328.00', '1250.00', '1243785600', '1277827200', '2008年05月 GSM,850,900,1800,1900 直板', '', '徒徒，我会想你的', 'images/200905/thumb_img/10_thumb_G_1242973436403.jpg', 'images/200905/goods_img/10_G_1242973436141.jpg', 'images/200905/source_img/10_G_1242973436172.jpg', '1', '', '0', '1', '0', '13', '2016-04-02 10:00:00', '100', '0', '0', '0', '1', '1', '0', '1245290333', '9', '', '-1', '-1', null, null, '<p>C702可以说是一种在外观上复古的产物，不仅延续T系列早期的直板造型，而且在屏幕和键盘的组合分布上都继承了前辈的精髓。C702的机身尺寸为106&times;48&times;15.5毫米，重量为105克。此外索尼爱立信为C702融入了<font size=\"3\" color=\"#ff0000\"><strong>三防特性，即防尘、防滑和防水溅</strong></font>，这款新的C702搭载了索尼爱立信经典A200平台，界面布局与W908c、K858c一致，典型的特征就是配备左右软键、中央确定键和通话/挂机键。</p>\r\n<p>索尼爱立信C702配备一块<strong><font size=\"3\" color=\"#ff0000\">2.2英寸26万色TFT液晶显示屏</font></strong>，分辨率为240&times;320像素(QVGA)，显示效果属于目前主流水准。C702可以说是索尼爱立信首批<strong><font size=\"3\" color=\"#ff0000\">内置GPS模块</font></strong>的 手机产品之一，C702的搜星、定位一气呵成，十分精准，误差大约在10米之内。基本上定位后可以将有效卫星数量控制在4&mdash;6颗，可以说可以满足我们的需 要了。C702还提供了&ldquo;影像定位&rdquo;功能，配合内置的AGPS全球定位辅助系统，只须启动Geo-Tagging智能影像定位功能，便可将拍摄地点记录在 照片内，方便用户随时查询。</p>\r\n<p>&nbsp;</p>\r\n<p>作为一款Cyber-shot系列影像手机，索尼爱立信C702在拍照功能方面同样有不俗的表现。并且手机内置的<strong><font size=\"3\" color=\"#ff0000\">320万像素摄像头</font></strong>也 同样在拍照功能上也不错的表现。不仅支持自动聚焦和双LED闪光功能，而且还拥有2倍数码变焦、防红眼、Photo fix优画及场景模式等功能。索尼爱立信C702除了配备的是最大光圈为F3.2的4.2毫米镜头之外，该机也如同门中的旗舰C902一样增加了对脸部有 先自动聚焦功能的支持。</p>\r\n<p>&nbsp;</p>');
INSERT INTO `zc_goods` VALUES ('11', '4', '索爱C702c', '0', '7', '', '1', '0.000', '1300.00', '0.00', '0', '0', '直板', '', '徒徒，我会想你的', '', '/Uploads/Images/20160410/57092a52e7434.jpg', '', '1', '', '0', '1', '0', '0', '2016-04-02 10:00:00', '100', '1', '0', '0', '0', '0', '0', '1241966960', '4', '', '-1', '-1', null, null, '');
INSERT INTO `zc_goods` VALUES ('12', '4', '摩托罗拉A810', '13', '2', '', '8', '0.000', '983.00', '960.00', '1241107200', '1255104000', 'SMS EMS MMS pda 摄像 智能 音乐 SMS,EMS,MMS', '', '徒徒，我会想你的', 'images/200905/thumb_img/12_thumb_G_1241965978410.jpg', '/Uploads/images/20160403/5700da4b63789.jpg', 'images/200905/source_img/12_G_1241965978878.jpg', '1', '', '0', '1', '0', '9', '2016-04-02 10:00:00', '100', '0', '0', '1', '0', '1', '0', '1245297670', '4', '', '-1', '-1', null, null, '<p>全机使用的材质除去电池盖部分采用了金属以外，其它均使用了ABS工程塑料作为主材，这款手机的三围是105&times;51&times;14毫米，有着100克的轻量级重量，拿在手中的感觉还是非常不错的。A810手机作为一款<strong><font size=\"3\" color=\"#ff0000\">PDA手机</font></strong>在设计的时候取消了键盘配置，一切数字键都要依靠手机内提供的虚拟键盘进行操作，在手机的左上侧是一个<strong><font size=\"3\" color=\"#ff0000\">3.5mm的标准耳机插口</font></strong>，这种设计可以让用户使用自己习惯或者喜欢的耳机去欣赏音乐。</p>\r\n<p>&nbsp;</p>\r\n<p>这款摩托罗拉A810手机配置了一块<font size=\"3\" color=\"#ff0000\"><strong>26万色的2.2英寸TFT全触摸屏幕</strong></font>，其分辨率达到了主流的QVGA水平（240&times;320像素），摩托罗拉A810采用了内部核心为2.6.10的<strong><font size=\"3\" color=\"#ff0000\">LINUX操作系统</font></strong>，菜单上依然采用传统的9宫格的显示方式，一般手机的名片式电话本只能支持诸如电话、邮件、传真、公司等一些基本信息，而A810手机的电话本除了这些还支持公司地址，配偶信息、子女姓名、上司名称、助手等等，对于一款手机来说，电话本不可谓不强大。A810的<strong><font size=\"3\" color=\"#ff0000\">手写识别能力相当的惊人</font></strong>，对连笔、草书和倒插笔的识别率都相当的高，同时还为左右手设置了不同的书写习惯选择，并支持手写速度的调节。</p>\r\n<p>这款A810手机<strong><font size=\"3\" color=\"#ff0000\">内置的音乐播放功能</font></strong>可以支持MP3、WAV、AMR、AAC等格式的音乐播放，<font size=\"3\" color=\"#ff0000\"><strong>支持后台播放</strong></font>。视频方面，这款A810支持MP4、3GP、H.263格式的播放，视频播放器同样简约，操作方便，这款摩托罗拉A810还内置了6款游戏，每一款都有很高的耐玩性，而且都是支持触摸屏操作的，同时这款手机还内置了<strong><font size=\"3\" color=\"#ff0000\">FM收音机</font></strong>，支持自动搜索，并提供了20个频道供用户存储，不过收音机并不支持后台播放。</p>\r\n<p>&nbsp;</p>');
INSERT INTO `zc_goods` VALUES ('13', '4', '诺基亚5320 XpressMusic', '13', '1', '', '8', '0.000', '1311.00', '0.00', '0', '0', '摄像 智能 音乐 蓝色 红色 舒适 直板 中档 2008年07月 黑色 GSM,850,900,1800,1900', '', '徒徒，我会想你的', 'images/200905/thumb_img/13_thumb_G_1241968002527.jpg', '/Uploads/images/20160403/5700da7a0b594.jpg', 'images/200905/source_img/13_G_1241968002732.jpg', '1', '', '0', '1', '0', '13', '2016-04-02 10:00:00', '100', '0', '0', '0', '1', '0', '0', '1269589198', '4', '', '-1', '-1', null, null, '<p>诺基亚5320XpressMusic音乐手机采用XpressMusic系列常见的黑红、黑蓝配色方案，而材质方便则选用的是经过<strong><font size=\"3\" color=\"#ff0000\">抛光处理</font></strong>的工程塑料；三围/体重为，为108&times;46&times;15mm/<strong><font size=\"3\" color=\"#ff0000\">90g</font></strong>，手感舒适。</p>\r\n<p>&nbsp;</p>\r\n<p>诺基亚5320采用的是一块可视面积为2.0英寸的<font size=\"3\" color=\"#ff0000\"><strong>1600万色</strong></font>屏幕，分辨率是常见的240&times;320像素（QVGA）。虽然屏幕不是特别大，但效果非常精细，色彩还原不错。</p>\r\n<p>&nbsp;</p>\r\n<p>手机背面，诺基亚为5320XM配备一颗<strong><font size=\"3\" color=\"#ff0000\">200W像素</font></strong>的摄像头，并且带有<strong><font size=\"3\" color=\"#ff0000\">两个LED的补光灯</font></strong>，可以实现拍照、摄像功能，并能通过彩信、邮件方式发送给朋友。</p>\r\n<p>&nbsp;</p>');
INSERT INTO `zc_goods` VALUES ('14', '3', '诺基亚5800XM', '6', '1', '', '1', '0.000', '2625.00', '0.00', '0', '0', 'GSM 64和弦 2009年2月 320万摄像头 GPS 直板 工程塑料 支持 2008年10月 黑色', '', '徒徒，我会想你的', 'images/200905/thumb_img/14_thumb_G_1241968492116.jpg', '/Uploads/Images/20160410/57092926e2c9e.jpg', 'images/200905/source_img/14_G_1241968492305.jpg', '1', '', '0', '1', '0', '26', '2016-04-02 10:00:00', '100', '0', '0', '0', '1', '0', '0', '1269589186', '3', '', '-1', '-1', null, null, '');
INSERT INTO `zc_goods` VALUES ('15', '4', '摩托罗拉A810', '8', '2', '', '3', '0.000', '788.00', '0.00', '0', '0', '600 直板 工程塑料 蓝牙 视频拍摄 音乐 黑色 白色', '', '徒徒，我会想你的', 'images/200905/thumb_img/15_thumb_G_1242973362970.jpg', 'images/200905/goods_img/15_G_1242973362318.jpg', 'images/200905/source_img/15_G_1242973362751.jpg', '1', '', '0', '1', '0', '5', '2016-04-02 10:00:00', '100', '1', '0', '1', '1', '0', '0', '1245297631', '9', '', '-1', '-1', null, null, '');
INSERT INTO `zc_goods` VALUES ('16', '2', '恒基伟业G101', '3', '11', '', '0', '0.000', '823.33', '0.00', '0', '0', '', '', '徒徒，我会想你的', 'images/200905/thumb_img/16_thumb_G_1241968949103.jpg', 'images/200905/goods_img/16_G_1241968949002.jpg', 'images/200905/source_img/16_G_1241968949402.jpg', '1', '', '0', '1', '0', '8', '2016-04-02 10:00:00', '100', '0', '0', '0', '0', '0', '0', '1245290562', '2', '', '-1', '-1', null, null, '');
INSERT INTO `zc_goods` VALUES ('17', '4', '夏新N7', '2', '5', '', '1', '0.000', '2300.00', '0.00', '0', '0', '2008年01月 GSM,900,1800,1900,2100 直板 262144万 240×400 像素 SMS,EMS,MMS,超长信息发送,短消息群发 黑色 CDMA', '', '徒徒，我会想你的', 'images/200905/thumb_img/17_thumb_G_1241969394587.jpg', 'images/200905/goods_img/17_G_1241969394677.jpg', 'images/200905/source_img/17_G_1241969394844.jpg', '1', '', '0', '1', '0', '23', '2016-04-02 10:00:00', '100', '0', '1', '0', '1', '0', '0', '1269589169', '9', '', '-1', '-1', null, null, '');
INSERT INTO `zc_goods` VALUES ('18', '3', '夏新T5', '0', '5', '', '1', '0.000', '2878.00', '0.00', '0', '0', '2008年04月 3G(GSM,900,1800,1900,TD-SCDMA ) 直板 262144万 320×240 像素 是 银色', '', '徒徒，我会想你的', '', '', '', '1', '', '0', '1', '0', '28', '2016-04-02 10:00:00', '100', '1', '0', '0', '0', '0', '0', '1241969533', '2', '', '-1', '-1', null, null, '<p>&nbsp;  TD-SCDMA/GSM两种模式任意切换，中国3G手机先驱，支持大陆特有3G网络，轻松实现可视电话、视频留言、视频会议功能，2.6英寸Q屏，手写、键盘双输入，内置移动证券，支持手机邮箱、手机地图、无驱U盘</p>');
INSERT INTO `zc_goods` VALUES ('19', '4', '三星SGH-F258', '7', '6', '', '12', '0.000', '858.00', '0.00', '0', '0', '滑盖 GSM 258 时尚 蓝牙 黑色 金色 白色', '从整体来看，三星SGH-F258比较时尚可爱，三围尺寸为94×46×17.5mm，重量为96克，曲线柔和具有玲珑美感\r\n', '徒徒，我会想你的', 'images/200905/thumb_img/19_thumb_G_1241970175208.jpg', 'images/200905/goods_img/19_G_1241970175091.jpg', 'images/200905/source_img/19_G_1241970175549.jpg', '1', '', '0', '1', '0', '8', '2016-04-02 10:00:00', '100', '0', '1', '1', '1', '0', '0', '1269589154', '9', '', '-1', '-1', null, null, '<p>从整体来看，三星SGH-F258比较<font size=\"3\" color=\"#ff0000\"><strong>时尚</strong></font>可爱，三围尺寸为94&times;46&times;17.5mm，重量为96克，曲线柔和具有玲珑美感。</p>\r\n<p>&nbsp;</p>\r\n<p>三星F258的前面板整体应用<strong><font size=\"3\" color=\"#ff0000\">镜面效果</font></strong>，2.0英寸显示屏幕略显窄小，导航键与功能键在滑盖滑开之前是前面板的全部控制键，没有挂断和接听键，不过，五向键有<font size=\"3\"><strong><font color=\"#ff0000\">音乐操</font><font color=\"#ff0000\">作</font></strong></font>功能，明确显示了F258音乐手机的定位。</p>\r\n<p>&nbsp;</p>\r\n<p>F258的数字键键区采用了极具金属质感的平板式设计，每颗按键的面积足够大，按键与按键之间的间隔明显，操作起来手感舒适。</p>');
INSERT INTO `zc_goods` VALUES ('20', '4', '三星BC01', '14', '6', '', '12', '0.000', '280.00', '238.00', '1241884800', '1251648000', 'GSM 直板 40和弦 金属材质 2008年07月 黑色 GSM,900,1800,1900,2100', '', '徒徒，我会想你的', 'images/200905/thumb_img/20_thumb_G_1242106490058.jpg', '/Uploads/Images/20160410/570927d5332db.jpg', 'images/200905/source_img/20_G_1242106490922.jpg', '1', '', '0', '1', '0', '2', '2016-04-02 10:00:00', '100', '0', '1', '1', '1', '1', '0', '1269589110', '4', '', '-1', '-1', null, null, '');
INSERT INTO `zc_goods` VALUES ('21', '1', '诺基亚7230', '4', '1', '', '40', '0.000', '2000.00', '1899.00', '0', '0', '2008年03月 GSM,900,1800,1900,2100 直板 1600万 240×400 像素 2007年12月 200万摄像头 黑色', '', '徒徒，我会想你的', 'images/200905/thumb_img/21_thumb_G_1242109298150.jpg', '[\"\\/Uploads\\/Images\\/20160507\\/572d78e545085.jpg\",\"\\/Uploads\\/Images\\/20160507\\/572d89e83299f.jpg\",\"\\/Uploads\\/Images\\/20160507\\/572d89e85d923.jpg\"]', 'images/200905/source_img/21_G_1242109298831.jpg', '1', '', '1', '1', '0', '20', '2016-04-02 10:00:00', '100', '0', '0', '0', '0', '0', '0', '1269589102', '3', '', '-1', '-1', null, null, '<p>&nbsp;</p><p style=\"text-align:left;\"><span style=\"font-size: medium;\"><span style=\"font-size:16px\">标准配置: 标准锂电池两块,充电器两个,立体声耳机一个,数据线,说明书送256TF</span></span></p><p style=\"text-align:left;\"><span style=\"font-size: medium;\"><span style=\"font-size:16px\">通讯功能&nbsp; 输入法 短信功能 话机通讯录 通话记录</span></span></p><p style=\"text-align:left;\"><span style=\"font-size: medium;\"><span style=\"font-size:16px\">输入法: 中文输入法</span></span></p><p style=\"text-align:left;\"><span style=\"font-size: medium;\"><span style=\"font-size:16px\">短信功能: 支持短信300条和彩信100条</span></span></p><p style=\"text-align:left;\"><span style=\"font-size: medium;\"><span style=\"font-size:16px\">话机通讯录: 1000组名片式电话存储 来电防火墙功能&nbsp; 来电大头贴及来电铃声识别</span></span></p><p style=\"text-align:left;\"><span style=\"font-size: medium;\"><span style=\"font-size:16px\">通话记录：支持电话录音,恢复/静音,双音多频,免提</span></span></p><p>&nbsp;</p><p><span style=\"font-size:16px\">高级功能</span></p><p style=\"text-align:left;\"><span style=\"font-size: medium;\"><span style=\"font-size:16px\">多媒体娱乐: 200万像素，最大支持10240*960，11级数码变焦,多种效果设置,连拍可全屏查看拍摄或下载的图片.支持有声MP4短片拍摄，录像时间根据内存 大小而定，拍摄录像,TV电视可跟朋友家人一起分享。支持网络摄像头功能 支持MPEG4、3GP(H.263)等视频格式 支持MP3等音频格式播放， 支持歌词播放</span></span></p><p style=\"text-align:left;\"><span style=\"font-size: medium;\"><span style=\"font-size:16px\">内置游戏:智能拼图</span></span></p><p style=\"text-align:left;\"><span style=\"font-size: medium;\"><span style=\"font-size:16px\">扩展存储功能:支持TF扩展,支持U盘功能,本机内置1M,随机赠送256TF卡</span></span></p><p style=\"text-align:left;\"><span style=\"font-size: medium;\"><span style=\"font-size:16px\">高级功能:直板/智能PDA手写/键盘输入 超长待机 WAP上网&nbsp; 录音 蓝牙 FM收音机 电子书 Java扩展 TV电视输出 声控语音拨号 免费电视 来电防火墙&nbsp;&nbsp;&nbsp;</span></span></p><p style=\"text-align:left;\"><span style=\"font-size: medium;\"><span style=\"font-size:16px\">附加功能: 日历 计算器 闹钟 记事本 日程表 秒表 单位换算</span></span></p><p><span style=\"font-size: medium;\"><span style=\"font-size:16px\">提醒 以上性能均为本公司员工试机后所写,产品资料仅供参考,请以收到实物为准</span></span></p>');
INSERT INTO `zc_goods` VALUES ('22', '1', '多普达Touch HD', '15', '3', '', '1', '0.000', '5999.00', '0.00', '0', '0', '500万摄像头 蓝牙 手写 GPS 办公应用 语音拨号 2008年12月 黑色 GSM,850,900,1800,1900 直板', '', '徒徒，我会想你的', 'images/200905/thumb_img/22_thumb_G_1241971076803.jpg', '/Uploads/images/20160403/5700d6294a051.jpg', 'images/200905/source_img/22_G_1241971076130.jpg', '1', '', '1', '1', '0', '59', '2016-04-02 10:00:00', '100', '0', '1', '1', '0', '0', '0', '1269589090', '3', '', '-1', '-1', null, null, '<p><img src=\"http://xgone.xgou.com/xgoumanage/upload/20090325/2009032502045081100887.jpg\" alt=\"\" /></p>\r\n<p>&nbsp;</p>\r\n<p><img src=\"http://www.ouku.com/upimg/ouku/Image/002(1).jpg\" alt=\"\" /></p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>');
INSERT INTO `zc_goods` VALUES ('23', '32', '诺基亚N96', '17', '1', '', '8', '0.000', '3700.00', '0.00', '0', '0', '500万摄像头 microSD 工程塑料 蓝牙 数码相机 内置游戏 滑盖 高档 2008年09月 320×240 像素 黑色', '', '徒徒，我会想你的', 'images/200905/thumb_img/23_thumb_G_1241971556399.jpg', '/Uploads/images/20160403/5700da7a0b594.jpg', 'images/200905/source_img/23_G_1241971556256.jpg', '1', '', '1', '1', '0', '37', '2016-04-02 10:00:00', '100', '0', '1', '1', '0', '0', '0', '1269589078', '5', '', '-1', '-1', null, null, '<p>诺基亚N96采用了<strong><font size=\"3\" color=\"#ff0000\">双向滑盖</font></strong>设计，机身整体呈灰黑色，沉稳、大气，机身材质采用了高强度的塑料材质，手机背面采用了抛光面板的设计风格。N96三维体积103*55*20mm，重量为125g。屏幕方面，诺基亚N96配备一块<strong><font size=\"3\" color=\"#ff0000\">2.8英寸</font></strong>的屏幕，支持<strong><font size=\"3\" color=\"#ff0000\">1670万色</font></strong>显示，分辨率达到QVGA（320&times;240）水准。</p>\r\n<p><img alt=\"\" src=\"file:///C:/DOCUME~1/user/LOCALS~1/Temp/moz-screenshot.jpg\" /></p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;<img src=\"http://img2.zol.com.cn/product/21/896/ceN6LBMCid3X6.jpg\" alt=\"\" /></p>\r\n<p>诺基亚N96设置有专门的<strong><font size=\"3\" color=\"#ff0000\">音乐播放键</font></strong>和标准的3.5毫米音频插口，支持多格式音乐播放。内置了<strong><font size=\"3\" color=\"#ff0000\">多媒体播放器</font></strong>，支持FM调频收音机等娱乐功能。N96手机支持<strong><font size=\"3\" color=\"#ff0000\">N-Gage游戏平台</font></strong>，内置包括<font size=\"3\" color=\"#ff0000\"><strong>《PinBall》完整版</strong></font>在内的四款N-Gage游戏，除了手机本身内置的游戏，还可以从N-Gage的网站下载或者购买最新的游戏，而且可以在论坛里和其他玩家一起讨论。</p>\r\n<p><img src=\"http://img2.zol.com.cn/product/21/898/cekkw57qJjSI.jpg\" alt=\"\" /></p>\r\n<p>&nbsp;</p>');
INSERT INTO `zc_goods` VALUES ('24', '1', 'P806', '35', '9', '', '100', '0.000', '2000.00', '1850.00', '1243785600', '1277827200', '旅行充电器 图形菜单 Wap 上网 红外接口 移动 MSN 支持 2008年06月 灰色', '', '徒徒，我会想你的', 'images/200905/thumb_img/24_thumb_G_1241971981429.jpg', '/Uploads/images/20160403/5700d334ccd23.jpg', 'images/200905/source_img/24_G_1241971981107.jpg', '1', '', '1', '1', '0', '20', '2016-04-02 10:00:00', '100', '0', '1', '1', '1', '1', '0', '1269589064', '3', '', '-1', '-1', null, null, '<div>\r\n<div>\r\n<div><font size=\"4\">规格参数</font></div>\r\n<p><font size=\"4\"><span>上市时间：</span><span>2008年06月</span></font></p>\r\n<p><font size=\"4\"><span>网络频率：</span><span>GSM/GPRS；900/1800MHz</span></font></p>\r\n<p><font size=\"4\"><span>重　量　：</span><span>未知</span></font></p>\r\n<p><font size=\"4\"><span>尺寸/体积：</span><span>未知</span></font></p>\r\n<p><font size=\"4\"><span>可选颜色：</span><span>银色</span></font></p>\r\n<p><font size=\"4\"><span>屏幕参数：</span><span>26万色TFT彩色屏幕；</span></font></p>\r\n<p><font size=\"4\"><span>WAP上网：</span><span>支持飞笺</span></font></p>\r\n<p><font size=\"4\"><span>基本配置:<em><strong><font size=\"5\" color=\"#ff00ff\">二电(1760毫安) 一充 数据线 耳机 手写笔 512M内存卡</font></strong></em></span></font></p>\r\n<p>&nbsp;</p>\r\n</div>\r\n</div>\r\n<div><font size=\"4\">基本功能</font></div>\r\n<p><font size=\"4\"><span>『时钟』</span><span>『内置振动』</span><span>『录音』</span><span>『可选铃声』</span></font></p>\r\n<p><font size=\"4\"><span>『和弦铃声』</span><span>『MP3铃声』</span><span>『来电铃声识别』</span><span>『来电图片识别』</span></font></p>\r\n<p><font size=\"4\"><span>『情景模式』</span><span>『待机图片』</span><span>『图形菜单』</span><span>『触摸屏』</span></font></p>\r\n<p><span><font size=\"4\">『手写输入』</font></span></p>\r\n<div><font size=\"4\">通信功能</font></div>\r\n<p><font size=\"4\"><span>『双卡双待』</span><span>『内置天线』</span><span>『输入法』</span><span>『中文短信』</span></font></p>\r\n<p><font size=\"4\"><span>『短信群发』</span><span>『多媒体短信』</span><span>『话机通讯录』</span><span>『通话记录』</span></font></p>\r\n<p><font size=\"4\"><span>『免提通话』</span><span>『飞行模式』</span></font></p>\r\n<div><font size=\"4\">多媒体娱乐 :支持3GP、MP4文件播放</font></div>\r\n<p><font size=\"4\"><span>『视频播放』</span><span>『MP3播放器』</span></font></p>\r\n<p><font size=\"4\"><span>多媒体卡扩展：</span><span>支持microSD卡扩展&nbsp;</span></font></p>\r\n<p><font size=\"4\"><span>摄像头：</span><span>内置</span></font></p>\r\n<p><font size=\"4\"><span>摄像头像素：</span><span>30万像素</span></font></p>\r\n<p><font size=\"4\"><span>传感器类型：</span><span>CMOS</span></font></p>\r\n<p><font size=\"4\"><span>变焦模式：</span><span>数码变焦</span></font></p>\r\n<p><font size=\"4\"><span>照片分辨率：</span><span>多种照片分辨率选择</span></font></p>\r\n<p><font size=\"4\"><span>拍摄模式：</span><span>多种拍摄模式选择</span></font></p>\r\n<p><font size=\"4\"><span>照片质量：</span><span>多种照片质量选择</span></font></p>\r\n<p><font size=\"4\"><span>视频拍摄：</span><span>有声视频拍摄</span></font></p>\r\n<div><font size=\"4\">数据传输</font></div>\r\n<p><font size=\"4\"><span>『WAP浏览器』</span><span>『数据线接口』</span></font></p>\r\n<div><font size=\"4\">个人助理</font></div>\r\n<p><font size=\"4\"><span>『闹钟』</span><span>『日历』</span><span>『计算器』</span></font></p>');
INSERT INTO `zc_goods` VALUES ('25', '35', '小灵通/固话50元充值卡', '0', '1', '', '2', '0.000', '48.00', '0.00', '0', '0', '', '', '徒徒，我会想你的', 'images/200905/thumb_img/25_thumb_G_1241972709885.jpg', '/Uploads/images/20160403/57011784572ad.jpg', 'images/200905/source_img/25_G_1241972709750.jpg', '0', 'virtual_card', '1', '1', '0', '0', '2016-04-02 10:00:00', '100', '0', '1', '0', '1', '0', '0', '1245047546', '13', '', '-1', '-1', null, null, '');
INSERT INTO `zc_goods` VALUES ('26', '35', '小灵通/固话20元充值卡', '0', '1', '', '2', '0.000', '19.00', '0.00', '0', '0', '', '', '徒徒，我会想你的', 'images/200905/thumb_img/26_thumb_G_1241972789393.jpg', '/Uploads/images/20160403/5700dc677153e.jpg', 'images/200905/source_img/26_G_1241972789353.jpg', '0', 'virtual_card', '1', '1', '0', '0', '2016-04-02 10:00:00', '100', '0', '0', '0', '1', '0', '0', '1245047540', '1', '', '-1', '-1', null, null, '');
INSERT INTO `zc_goods` VALUES ('27', '35', '联通100元充值卡', '0', '1', '', '2', '0.000', '95.00', '0.00', '0', '0', '', '', '徒徒，我会想你的', 'images/200905/thumb_img/27_thumb_G_1241972894068.jpg', '/Uploads/images/20160403/5700dc3ee04d5.jpg', 'images/200905/source_img/27_G_1241972894069.jpg', '0', 'virtual_card', '1', '1', '0', '0', '2016-04-02 10:00:00', '100', '0', '1', '1', '1', '0', '0', '1245047557', '1', '', '-1', '-1', null, null, '');
INSERT INTO `zc_goods` VALUES ('28', '35', '联通50元充值卡', '0', '1', '', '0', '0.000', '45.00', '0.00', '0', '0', '', '', '徒徒，我会想你的', 'images/200905/thumb_img/28_thumb_G_1241972976986.jpg', '/Uploads/images/20160403/5700dc3ee04d5.jpg', 'images/200905/source_img/28_G_1241972976695.jpg', '0', 'virtual_card', '1', '1', '0', '0', '2016-04-02 10:00:00', '100', '0', '0', '0', '1', '0', '0', '1245047542', '1', '', '-1', '-1', null, null, '');
INSERT INTO `zc_goods` VALUES ('29', '35', '移动100元充值卡', '0', '1', '', '0', '0.000', '90.00', '0.00', '0', '0', '', '', '徒徒，我会想你的', 'images/200905/thumb_img/29_thumb_G_1241973022239.jpg', '/Uploads/images/20160403/5700d334ccd23.jpg', 'images/200905/source_img/29_G_1241973022514.jpg', '0', 'virtual_card', '1', '1', '0', '0', '2016-04-02 10:00:00', '100', '0', '1', '0', '1', '0', '0', '1245047543', '1', '', '-1', '-1', null, null, '');
INSERT INTO `zc_goods` VALUES ('30', '35', '移动20元充值卡', '1', '1', '', '9', '0.000', '18.00', '0.00', '0', '0', '', '', '徒徒，我会想你的', 'images/200905/thumb_img/30_thumb_G_1241973114800.jpg', '/Uploads/images/20160403/5700da4b63789.jpg', 'images/200905/source_img/30_G_1241973114587.jpg', '0', 'virtual_card', '1', '1', '0', '0', '2016-04-02 10:00:00', '100', '0', '1', '0', '1', '0', '0', '1245047549', '1', '', '-1', '-1', null, null, '');
INSERT INTO `zc_goods` VALUES ('31', '33', '摩托罗拉E8 ', '5', '2', '', '1', '0.000', '1337.00', '0.00', '0', '0', '直板', '', '徒徒，我会想你的', 'images/200905/thumb_img/31_thumb_G_1242110412996.jpg', '/Uploads/images/20160403/5700d9e974edd.jpg', 'images/200905/source_img/31_G_1242110412519.jpg', '1', '', '1', '1', '0', '13', '2016-04-02 10:00:00', '100', '0', '0', '0', '0', '0', '0', '1242140652', '2', '', '-1', '-1', null, null, '');
INSERT INTO `zc_goods` VALUES ('32', '32', '诺基亚N85', '9', '1', '', '4', '0.000', '3010.00', '2750.00', '1243785600', '1417276800', '2008年10月 GSM,850,900,1800,1900 黑色', '', '徒徒，我会想你的', 'images/200905/thumb_img/32_thumb_G_1242110760196.jpg', '/Uploads/Images/20160407/5706749270701.jpg', 'images/200905/source_img/32_G_1242110760437.jpg', '1', '', '1', '1', '0', '30', '2016-04-02 10:00:00', '100', '0', '0', '1', '1', '1', '0', '1269589051', '3', '', '-1', '-1', null, null, '<p>诺基亚N85参数</p>\r\n<div>&nbsp;</div>\r\n<div>\r\n<table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n    <tbody>\r\n        <tr>\r\n            <td bgcolor=\"#f1f7fc\" colspan=\"2\">\r\n            <p><b>基本参数</b></p>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">手机昵称</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">N85</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">上市日期</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">2008年10月</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">手机类型</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">3G手机；拍照手机；智能手机</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">手机制式</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">GSM</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">支持频段</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">GSM850/900/1800/1900MHz</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">数据传输</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">GPRS、EDGE</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">屏幕材质</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">AMOLED</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">屏幕色彩</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">1600万色</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">主屏尺寸</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">2.6英寸</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">主屏参数</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">QVGA 320&times;240像素</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">铃音描述</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">可选MP3、WAV、AAC或和弦Midi铃声等格式</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">操作系统</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">Symbian OS v9.3操作系统与S60 v3.2平台的组合</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">机身内存</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">74MB 内部动态存储空间<br />\r\n            78MB 内置NAND闪存</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">存储卡</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">支持MicroSD(T-Flash)卡扩展最大至8GB</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">电池规格</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">1200毫安时锂电池</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">标配</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">诺基亚 N85<br />\r\n            诺基亚电池（BL-5K）<br />\r\n            诺基亚旅行充电器（AC-10）<br />\r\n            诺基亚视频数据线（CA-75U）<br />\r\n            诺基亚数据线（CA-101）<br />\r\n            诺基亚音乐耳机（HS-45、AD-54）<br />\r\n            诺基亚 8 GB microSD 卡（MU-43）<br />\r\n            《用户手册》<br />\r\n            《快速入门》</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">理论通话时间</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">6.9 小时</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">理论待机时间</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">363 小时</td>\r\n        </tr>\r\n        <tr>\r\n            <td bgcolor=\"#f1f7fc\" colspan=\"2\">\r\n            <p><b>产品外形</b></p>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">外观设计</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">双向滑盖</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">产品尺寸</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">103&times;50&times;16mm<br />\r\n            体积：76 立方厘米</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">手机重量</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">128克</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">产品天线</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">内置</td>\r\n        </tr>\r\n        <tr>\r\n            <td bgcolor=\"#f1f7fc\" colspan=\"2\">\r\n            <p><b>拍照功能</b></p>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"550\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\" style=\"padding: 8px 0px;\" colspan=\"2\">\r\n            <table cellspacing=\"1\" cellpadding=\"0\" border=\"0\" align=\"left\">\r\n                <tbody>\r\n                    <tr>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">定时器</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">&nbsp;</td>\r\n                    </tr>\r\n                </tbody>\r\n            </table>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">摄像头</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">内置</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">摄像头像素</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">500万像素</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">连拍功能</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">支持</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">LED闪光灯</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">双LED 闪光灯</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">数码变焦</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">20 倍数码变焦</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">拍摄模式</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">静止、连拍、自动定时器、摄像</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">照片特效</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">正常、怀旧、黑白、负片、逼真</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">拍照描述</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">支持最大2592&times;1944分辨率照片拍摄<br />\r\n            支持JPEG、Exif格式<br />\r\n            白平衡模式：自动、阳光、阴天、白炽灯、荧光灯<br />\r\n            感光度模式：高、中、低、自动</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">视频拍摄</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">最高支持640 x 480 像素（VGA）、30 帧/秒</td>\r\n        </tr>\r\n        <tr>\r\n            <td bgcolor=\"#f1f7fc\" colspan=\"2\">\r\n            <p><b>娱乐功能</b></p>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"550\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\" style=\"padding: 8px 0px;\" colspan=\"2\">\r\n            <table cellspacing=\"1\" cellpadding=\"0\" border=\"0\" align=\"left\">\r\n                <tbody>\r\n                    <tr>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">收音机</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">TV-OUT</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">录音功能</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">电子书</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">&nbsp;</td>\r\n                    </tr>\r\n                </tbody>\r\n            </table>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">视频播放</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">内置RealPlayer播放器, 支持MPEG4、H.264/AVC、H.263/3GP、RealVideo等视频格式全屏播放</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">音乐播放</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">内置播放器, 支持mp3、.wma、.aac、eAAC、eAAC+格式</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">游戏</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">内置</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">Java功能</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">支持Java MIDP 2.0 CLDC 1.1</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">Flash功能</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">第3.0版Flash lite播放器</td>\r\n        </tr>\r\n        <tr>\r\n            <td bgcolor=\"#f1f7fc\" colspan=\"2\">\r\n            <p><b>数据功能</b></p>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"550\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\" style=\"padding: 8px 0px;\" colspan=\"2\">\r\n            <table cellspacing=\"1\" cellpadding=\"0\" border=\"0\" align=\"left\">\r\n                <tbody>\r\n                    <tr>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">蓝牙功能</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">&nbsp;</td>\r\n                    </tr>\r\n                </tbody>\r\n            </table>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">数据线接口</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">USB数据线 3.5mm立体声耳机插孔</td>\r\n        </tr>\r\n        <tr>\r\n            <td bgcolor=\"#f1f7fc\" colspan=\"2\">\r\n            <p><b>基本功能</b></p>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"550\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\" style=\"padding: 8px 0px;\" colspan=\"2\">\r\n            <table cellspacing=\"1\" cellpadding=\"0\" border=\"0\" align=\"left\">\r\n                <tbody>\r\n                    <tr>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">短信(SMS)</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">彩信(MMS)</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">免提通话</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">情景模式</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">闹钟功能</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">日历功能</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">&nbsp;</td>\r\n                    </tr>\r\n                </tbody>\r\n            </table>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">输入方式</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">键盘</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">通话记录</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">未接来电+已接来电+已拨电话记录</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">通讯录</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">S60标准化名片式通讯录</td>\r\n        </tr>\r\n        <tr>\r\n            <td bgcolor=\"#f1f7fc\" colspan=\"2\">\r\n            <p><b>网络功能</b></p>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"550\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\" style=\"padding: 8px 0px;\" colspan=\"2\">\r\n            <table cellspacing=\"1\" cellpadding=\"0\" border=\"0\" align=\"left\">\r\n                <tbody>\r\n                    <tr>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">电子邮件</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">WWW浏览器</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">WAP浏览器</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">&nbsp;</td>\r\n                    </tr>\r\n                </tbody>\r\n            </table>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td bgcolor=\"#f1f7fc\" colspan=\"2\">\r\n            <p><b>商务功能</b></p>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"550\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\" style=\"padding: 8px 0px;\" colspan=\"2\">\r\n            <table cellspacing=\"1\" cellpadding=\"0\" border=\"0\" align=\"left\">\r\n                <tbody>\r\n                    <tr>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">飞行模式</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">语音拨号</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">备忘录</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">日程表</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">世界时间</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">&nbsp;</td>\r\n                    </tr>\r\n                </tbody>\r\n            </table>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td bgcolor=\"#f1f7fc\" colspan=\"2\">\r\n            <p><b>其他功能</b></p>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"550\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\" style=\"padding: 8px 0px;\" colspan=\"2\">\r\n            <table cellspacing=\"1\" cellpadding=\"0\" border=\"0\" align=\"left\">\r\n                <tbody>\r\n                    <tr>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">GPS功能</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">电子词典</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">待机图片</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">计算器</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">来电铃声识别</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">来电图片识别</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">来电防火墙</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">动画屏保</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">图形菜单</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">秒表</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">单位换算</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" align=\"middle\" style=\"padding: 2px; float: none;\">&nbsp;</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                    </tr>\r\n                </tbody>\r\n            </table>\r\n            </td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n</div>\r\n<p>&nbsp;</p>');
INSERT INTO `zc_goods` VALUES ('35', '32', '诺基亚N85', '0', '2', '', '0', '0.000', '301.00', '0.00', '0', '0', '', '', '徒徒，我会想你的', '', '/Uploads/images/20160403/5700c5e935318.jpg', '', '1', '', '1', '1', '0', '0', '2016-04-02 10:00:00', '100', '0', '0', '0', '0', '1', '0', '0', '1', '', '-1', '-1', null, null, '');
INSERT INTO `zc_goods` VALUES ('36', '18', 'Galxy4', '0', '6', '', '0', '0.000', '3200.00', '0.00', '0', '0', '', '', '徒徒，我会想你的', '', '/Uploads/images/20160403/5700da7a0b594.jpg', '', '1', '', '1', '1', '0', '0', '2016-04-02 10:55:00', '100', '0', '0', '0', '0', '0', '0', '0', '1', '', '-1', '-1', null, null, '');
INSERT INTO `zc_goods` VALUES ('37', '32', '测试商品', '0', '1', '', '0', '0.000', '8888.00', '0.00', '0', '0', '', '', '徒徒，我会想你的', '', '[\"undefined\",\"undefined\",\"undefined\",\"undefined\"]', '', '1', '', '1', '1', '0', '0', '2016-05-03 10:19:11', '100', '0', '0', '0', '0', '0', '0', '0', '0', '', '-1', '-1', null, null, '');
INSERT INTO `zc_goods` VALUES ('38', '1', '测试', '0', '1', '', '0', '0.000', '23232.00', '0.00', '0', '0', '', '', '徒徒，我会想你的', '', '[\"\\/Uploads\\/Images\\/20160507\\/572da2cc1d88a.jpg\",\"\\/Uploads\\/Images\\/20160507\\/572da4429b8b2.jpg\",\"\\/Uploads\\/Images\\/20160507\\/572da442b852c.jpg\",\"\\/Uploads\\/Images\\/20160507\\/572da442ce5c0.jpg\",\"\\/Uploads\\/Images\\/20160507\\/572da44306ec0.jpg\"]', '', '1', '', '1', '1', '0', '0', '2016-05-04 23:38:49', '100', '0', '0', '0', '0', '0', '0', '0', '0', '', '-1', '-1', null, null, '<p>所有在 Apple Store 官方旗舰店的订单的发货时间、付款期限及购买上限均以商品页面规定为准。<br style=\"margin: 0px; padding: 0px;\"/>所有在本店销售的商品，请在拍下后 15 分钟内完成支付。 逾期，您的订单将被关闭。</p><p><img src=\"https://gdp.alicdn.com/imgextra/i1/1917047079/TB2NKYBaXXXXXa_XpXXXXXXXXXX_!!1917047079.png\" width=\"350\" border=\"0\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle;\"/><br style=\"margin: 0px; padding: 0px;\"/><br style=\"margin: 0px; padding: 0px;\"/><span style=\"margin: 0px; padding: 0px; line-height: 1.5em; font-size: 30px;\">一小部的一大步</span></p><p><a href=\"https://apple.tmall.com/p/rd224395.htm?scene=taobao_shop\" style=\"margin: 0px; padding: 0px; text-decoration: none; outline: 0px; color: rgb(0, 136, 204);\">购买</a></p><p><img src=\"https://gdp.alicdn.com/imgextra/i3/1917047079/TB2tFkTbXXXXXa9XpXXXXXXXXXX_!!1917047079.png\" width=\"1192\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle;\"/></p><p><img src=\"https://gdp.alicdn.com/imgextra/i3/1917047079/TB2shhHipXXXXXzXpXXXXXXXXXX_!!1917047079.png\" width=\"230\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle;\"/></p><p><a href=\"https://apple.tmall.com/category-922259627.htm?spm=0.0.0.0.fatzfX&search=y&parentCatId=922259623&parentCatName=iPhone&catName=iPhone+%C5%E4%BC%FE&scene=taobao_shop#bd\" target=\"_blank\" style=\"margin: 0px; padding: 0px; text-decoration: none; outline: 0px; color: rgb(0, 136, 204); font-size: 14px;\">立即购买</a></p><p><img src=\"https://gdp.alicdn.com/imgextra/i3/1917047079/TB2ArR0ipXXXXacXXXXXXXXXXXX_!!1917047079.jpg\" width=\"2560\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle;\"/></p><p><img src=\"https://gdp.alicdn.com/imgextra/i3/1917047079/TB2sHRWcXXXXXa0XpXXXXXXXXXX_!!1917047079.png\" border=\"0\" alt=\"和 Apple Specialist 专家沟通\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle;\"/></p><p>我们会帮助你选择适合的产品和配件</p><p><a href=\"https://apple.tmall.com/p/rd001197.htm?scene=taobao_shop\" target=\"_blank\" style=\"margin: 0px; padding: 0px; text-decoration: none; outline: 0px; color: rgb(41, 83, 166); position: relative; z-index: 20; display: block; width: 150px; height: 150px;\"></a></p><p><img src=\"https://gdp.alicdn.com/imgextra/i3/1917047079/TB28vPybXXXXXcbXXXXXXXXXXXX_!!1917047079.png\" width=\"100\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle;\"/></p><p><img src=\"https://gdp.alicdn.com/imgextra/i2/1917047079/TB2MCrzbXXXXXagXXXXXXXXXXXX_!!1917047079.png\" width=\"100\" border=\"0\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle;\"/><br style=\"margin: 0px; padding: 0px;\"/>查找零售店</p><p><img src=\"https://gdp.alicdn.com/imgextra/i1/1917047079/TB2Y7mOdpXXXXaRXXXXXXXXXXXX_!!1917047079.jpg\" width=\"1920\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle;\"/></p><p>&nbsp;</p><p><img src=\"https://gdp.alicdn.com/imgextra/i2/1917047079/TB21RMrcXXXXXX1XpXXXXXXXXXX_!!1917047079.jpg\" border=\"0\" width=\"64\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle;\"/></p><p><img src=\"https://gdp.alicdn.com/imgextra/i3/1917047079/TB2cxwxcXXXXXbCXXXXXXXXXXXX_!!1917047079.png\" border=\"0\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle;\"/></p><p>使用崭新 Apple Store app 选购、搜索及查看即将举行的活动，并通过访问零售店获益更多。</p><p><br/></p>');
INSERT INTO `zc_goods` VALUES ('39', '1', '规范', '0', '1', '', '0', '0.000', '24323.00', '0.00', '0', '0', '', '', '徒徒，我会想你的', '', '[\"\\/Uploads\\/Images\\/20160507\\/572d78e513648.jpg\",\"\\/Uploads\\/Images\\/20160507\\/572d78e5258e8.jpg\",\"\\/Uploads\\/Images\\/20160507\\/572d78e545085.jpg\",\"\\/Uploads\\/Images\\/20160507\\/572d89e83299f.jpg\"]', '', '1', '', '1', '1', '0', '0', '2016-05-04 23:39:20', '100', '0', '0', '0', '0', '0', '0', '0', '0', '', '-1', '-1', null, null, '<p>逆着洋流独自流到底。</p><p><br/></p><p>沉默的沉默到深海里。</p><p><br/></p><p><img src=\"/ueditor/php/upload/image/20160507/1462608624124232.jpg\" title=\"1462608624124232.jpg\" alt=\"2012-05-28.jpg\"/></p><p><br/></p><p><img src=\"/ueditor/php/upload/image/20160507/1462608644629727.jpg\" title=\"1462608644629727.jpg\" alt=\"16.jpg\"/></p>');
INSERT INTO `zc_goods` VALUES ('40', '16', '发送到发送到', '0', '1', '', '0', '0.000', '4322.00', '0.00', '0', '0', '', '', '徒徒，我会想你的', '', '[\"undefined\",\"undefined\",\"undefined\",\"undefined\",\"undefined\",\"undefined\"]', '', '1', '', '1', '1', '0', '0', '2016-05-04 23:40:00', '100', '0', '0', '0', '0', '0', '0', '0', '0', '', '-1', '-1', null, null, '');
INSERT INTO `zc_goods` VALUES ('41', '32', '分文未', '0', '1', '', '0', '0.000', '3211.00', '0.00', '0', '0', '', '', '徒徒，我会想你的', '', '[\"undefined\",\"undefined\",\"undefined\",\"undefined\",\"undefined\",\"undefined\"]', '', '1', '', '1', '1', '0', '0', '2016-05-04 23:40:32', '100', '0', '0', '0', '0', '0', '0', '0', '0', '', '-1', '-1', null, null, '');
INSERT INTO `zc_goods` VALUES ('42', '1', '改的', '0', '1', '', '0', '0.000', '4344.00', '0.00', '0', '0', '', '', '徒徒，我会想你的', '', '[\"\\/Uploads\\/Images\\/20160507\\/572d83caddd5d.jpg\",\"\\/Uploads\\/Images\\/20160507\\/572d96edee969.jpg\",\"\\/Uploads\\/Images\\/20160507\\/572d96ee11c6f.jpg\",\"\\/Uploads\\/Images\\/20160507\\/572d96ee29eff.jpg\",\"\\/Uploads\\/Images\\/20160507\\/572d96ee4433a.jpg\"]', '', '1', '', '1', '1', '0', '0', '2016-05-04 23:41:33', '100', '0', '0', '0', '0', '0', '0', '0', '0', '', '-1', '-1', null, null, '<p>我爱你，徒徒老婆</p><p><br/></p><p>回学校要经常给我打电话啊</p><p><br/></p><p>我会乖乖等老婆回来的</p><p><br/></p><p><img src=\"/ueditor/php/upload/image/20160507/1462605451627575.gif\" title=\"1462605451627575.gif\" alt=\"back.gif\"/></p>');
INSERT INTO `zc_goods` VALUES ('43', '1', '诺基亚7230', '0', '1', '', '0', '0.000', '2000.00', '1899.00', '0', '0', '', '', '徒徒，我会想你的', '', '\"\"', '', '1', '', '1', '1', '0', '0', '2016-04-02 10:00:00', '100', '0', '0', '0', '0', '0', '0', '0', '0', '', '-1', '-1', null, null, '<p>&nbsp;</p><p style=\"text-align:left;\"><span style=\"font-size: medium;\"><span style=\"font-size:16px\">标准配置: 标准锂电池两块,充电器两个,立体声耳机一个,数据线,说明书送256TF</span></span></p><p style=\"text-align:left;\"><span style=\"font-size: medium;\"><span style=\"font-size:16px\">通讯功能&nbsp; 输入法 短信功能 话机通讯录 通话记录</span></span></p><p style=\"text-align:left;\"><span style=\"font-size: medium;\"><span style=\"font-size:16px\">输入法: 中文输入法</span></span></p><p style=\"text-align:left;\"><span style=\"font-size: medium;\"><span style=\"font-size:16px\">短信功能: 支持短信300条和彩信100条</span></span></p><p style=\"text-align:left;\"><span style=\"font-size: medium;\"><span style=\"font-size:16px\">话机通讯录: 1000组名片式电话存储 来电防火墙功能&nbsp; 来电大头贴及来电铃声识别</span></span></p><p style=\"text-align:left;\"><span style=\"font-size: medium;\"><span style=\"font-size:16px\">通话记录：支持电话录音,恢复/静音,双音多频,免提</span></span></p><p>&nbsp;</p><p><span style=\"font-size:16px\">高级功能</span></p><p style=\"text-align:left;\"><span style=\"font-size: medium;\"><span style=\"font-size:16px\">多媒体娱乐: 200万像素，最大支持10240*960，11级数码变焦,多种效果设置,连拍可全屏查看拍摄或下载的图片.支持有声MP4短片拍摄，录像时间根据内存 大小而定，拍摄录像,TV电视可跟朋友家人一起分享。支持网络摄像头功能 支持MPEG4、3GP(H.263)等视频格式 支持MP3等音频格式播放， 支持歌词播放</span></span></p><p style=\"text-align:left;\"><span style=\"font-size: medium;\"><span style=\"font-size:16px\">内置游戏:智能拼图</span></span></p><p style=\"text-align:left;\"><span style=\"font-size: medium;\"><span style=\"font-size:16px\">扩展存储功能:支持TF扩展,支持U盘功能,本机内置1M,随机赠送256TF卡</span></span></p><p style=\"text-align:left;\"><span style=\"font-size: medium;\"><span style=\"font-size:16px\">高级功能:直板/智能PDA手写/键盘输入 超长待机 WAP上网&nbsp; 录音 蓝牙 FM收音机 电子书 Java扩展 TV电视输出 声控语音拨号 免费电视 来电防火墙&nbsp;&nbsp;&nbsp;</span></span></p><p style=\"text-align:left;\"><span style=\"font-size: medium;\"><span style=\"font-size:16px\">附加功能: 日历 计算器 闹钟 记事本 日程表 秒表 单位换算</span></span></p><p><span style=\"font-size: medium;\"><span style=\"font-size:16px\">提醒 以上性能均为本公司员工试机后所写,产品资料仅供参考,请以收到实物为准</span></span></p>');
INSERT INTO `zc_goods` VALUES ('44', '1', '诺基亚7230', '0', '1', '', '0', '0.000', '2000.00', '1899.00', '0', '0', '', '', '徒徒，我会想你的', '', '[\"\\/Uploads\\/Images\\/20160507\\/572d82e97b589.jpg\",\"\\/Uploads\\/Images\\/20160507\\/572d78e486f1f.jpg\",\"\\/Uploads\\/Images\\/20160507\\/572d78e4a4343.jpg\",\"\\/Uploads\\/Images\\/20160507\\/572d78e4ee30c.jpg\",\"\\/Uploads\\/Images\\/20160507\\/572d78e513648.jpg\"]', '', '1', '', '1', '1', '0', '0', '2016-04-02 10:00:00', '100', '0', '0', '0', '0', '0', '0', '0', '0', '', '-1', '-1', null, null, '<p>&nbsp;</p><p style=\"text-align:left;\"><span style=\"font-size: medium;\"><span style=\"font-size:16px\">标准配置: 标准锂电池两块,充电器两个,立体声耳机一个,数据线,说明书送256TF</span></span></p><p style=\"text-align:left;\"><span style=\"font-size: medium;\"><span style=\"font-size:16px\">通讯功能&nbsp; 输入法 短信功能 话机通讯录 通话记录</span></span></p><p style=\"text-align:left;\"><span style=\"font-size: medium;\"><span style=\"font-size:16px\">输入法: 中文输入法</span></span></p><p style=\"text-align:left;\"><span style=\"font-size: medium;\"><span style=\"font-size:16px\">短信功能: 支持短信300条和彩信100条</span></span></p><p style=\"text-align:left;\"><span style=\"font-size: medium;\"><span style=\"font-size:16px\">话机通讯录: 1000组名片式电话存储 来电防火墙功能&nbsp; 来电大头贴及来电铃声识别</span></span></p><p style=\"text-align:left;\"><span style=\"font-size: medium;\"><span style=\"font-size:16px\">通话记录：支持电话录音,恢复/静音,双音多频,免提</span></span></p><p>&nbsp;</p><p><span style=\"font-size:16px\">高级功能</span></p><p style=\"text-align:left;\"><span style=\"font-size: medium;\"><span style=\"font-size:16px\">多媒体娱乐: 200万像素，最大支持10240*960，11级数码变焦,多种效果设置,连拍可全屏查看拍摄或下载的图片.支持有声MP4短片拍摄，录像时间根据内存 大小而定，拍摄录像,TV电视可跟朋友家人一起分享。支持网络摄像头功能 支持MPEG4、3GP(H.263)等视频格式 支持MP3等音频格式播放， 支持歌词播放</span></span></p><p style=\"text-align:left;\"><span style=\"font-size: medium;\"><span style=\"font-size:16px\">内置游戏:智能拼图</span></span></p><p style=\"text-align:left;\"><span style=\"font-size: medium;\"><span style=\"font-size:16px\">扩展存储功能:支持TF扩展,支持U盘功能,本机内置1M,随机赠送256TF卡</span></span></p><p style=\"text-align:left;\"><span style=\"font-size: medium;\"><span style=\"font-size:16px\">高级功能:直板/智能PDA手写/键盘输入 超长待机 WAP上网&nbsp; 录音 蓝牙 FM收音机 电子书 Java扩展 TV电视输出 声控语音拨号 免费电视 来电防火墙&nbsp;&nbsp;&nbsp;</span></span></p><p style=\"text-align:left;\"><span style=\"font-size: medium;\"><span style=\"font-size:16px\">附加功能: 日历 计算器 闹钟 记事本 日程表 秒表 单位换算</span></span></p><p><span style=\"font-size: medium;\"><span style=\"font-size:16px\">提醒 以上性能均为本公司员工试机后所写,产品资料仅供参考,请以收到实物为准</span></span></p>');
INSERT INTO `zc_goods` VALUES ('45', '1', '诺基亚7230', '0', '1', '', '0', '0.000', '2000.00', '1899.00', '0', '0', '', '', '徒徒，我会想你的', '', '[\"\\/Uploads\\/Images\\/20160507\\/572d78e5258e8.jpg\",\"\\/Uploads\\/Images\\/20160507\\/572d78e545085.jpg\",\"\\/Uploads\\/Images\\/20160507\\/572d89e83299f.jpg\"]', '', '1', '', '1', '1', '0', '0', '2016-04-02 10:00:00', '100', '0', '0', '0', '0', '0', '0', '0', '0', '', '-1', '-1', null, null, '<p>&nbsp;</p><p style=\"text-align:left;\"><span style=\"font-size: medium;\"><span style=\"font-size:16px\">标准配置: 标准锂电池两块,充电器两个,立体声耳机一个,数据线,说明书送256TF</span></span></p><p style=\"text-align:left;\"><span style=\"font-size: medium;\"><span style=\"font-size:16px\">通讯功能&nbsp; 输入法 短信功能 话机通讯录 通话记录</span></span></p><p style=\"text-align:left;\"><span style=\"font-size: medium;\"><span style=\"font-size:16px\">输入法: 中文输入法</span></span></p><p style=\"text-align:left;\"><span style=\"font-size: medium;\"><span style=\"font-size:16px\">短信功能: 支持短信300条和彩信100条</span></span></p><p style=\"text-align:left;\"><span style=\"font-size: medium;\"><span style=\"font-size:16px\">话机通讯录: 1000组名片式电话存储 来电防火墙功能&nbsp; 来电大头贴及来电铃声识别</span></span></p><p style=\"text-align:left;\"><span style=\"font-size: medium;\"><span style=\"font-size:16px\">通话记录：支持电话录音,恢复/静音,双音多频,免提</span></span></p><p>&nbsp;</p><p><span style=\"font-size:16px\">高级功能</span></p><p style=\"text-align:left;\"><span style=\"font-size: medium;\"><span style=\"font-size:16px\">多媒体娱乐: 200万像素，最大支持10240*960，11级数码变焦,多种效果设置,连拍可全屏查看拍摄或下载的图片.支持有声MP4短片拍摄，录像时间根据内存 大小而定，拍摄录像,TV电视可跟朋友家人一起分享。支持网络摄像头功能 支持MPEG4、3GP(H.263)等视频格式 支持MP3等音频格式播放， 支持歌词播放</span></span></p><p style=\"text-align:left;\"><span style=\"font-size: medium;\"><span style=\"font-size:16px\">内置游戏:智能拼图</span></span></p><p style=\"text-align:left;\"><span style=\"font-size: medium;\"><span style=\"font-size:16px\">扩展存储功能:支持TF扩展,支持U盘功能,本机内置1M,随机赠送256TF卡</span></span></p><p style=\"text-align:left;\"><span style=\"font-size: medium;\"><span style=\"font-size:16px\">高级功能:直板/智能PDA手写/键盘输入 超长待机 WAP上网&nbsp; 录音 蓝牙 FM收音机 电子书 Java扩展 TV电视输出 声控语音拨号 免费电视 来电防火墙&nbsp;&nbsp;&nbsp;</span></span></p><p style=\"text-align:left;\"><span style=\"font-size: medium;\"><span style=\"font-size:16px\">附加功能: 日历 计算器 闹钟 记事本 日程表 秒表 单位换算</span></span></p><p><span style=\"font-size: medium;\"><span style=\"font-size:16px\">提醒 以上性能均为本公司员工试机后所写,产品资料仅供参考,请以收到实物为准</span></span></p>');
INSERT INTO `zc_goods` VALUES ('46', '1', '诺基亚7230', '0', '1', '', '0', '0.000', '2000.00', '1899.00', '0', '0', '', '', '徒徒，我会想你的', '', '[\"\\/Uploads\\/Images\\/20160507\\/572d78e5258e8.jpg\",\"\\/Uploads\\/Images\\/20160507\\/572d78e545085.jpg\",\"\\/Uploads\\/Images\\/20160507\\/572d89e83299f.jpg\",\"\\/Uploads\\/Images\\/20160507\\/572d89e85d923.jpg\",\"\\/Uploads\\/Images\\/20160507\\/572d89e87a3b2.jpg\"]', '', '1', '', '1', '1', '0', '0', '2016-04-02 10:00:00', '100', '0', '0', '0', '0', '0', '0', '0', '0', '', '-1', '-1', null, null, '<p>&nbsp;</p><p style=\"text-align:left;\"><span style=\"font-size: medium;\"><span style=\"font-size:16px\">标准配置: 标准锂电池两块,充电器两个,立体声耳机一个,数据线,说明书送256TF</span></span></p><p style=\"text-align:left;\"><span style=\"font-size: medium;\"><span style=\"font-size:16px\">通讯功能&nbsp; 输入法 短信功能 话机通讯录 通话记录</span></span></p><p style=\"text-align:left;\"><span style=\"font-size: medium;\"><span style=\"font-size:16px\">输入法: 中文输入法</span></span></p><p style=\"text-align:left;\"><span style=\"font-size: medium;\"><span style=\"font-size:16px\">短信功能: 支持短信300条和彩信100条</span></span></p><p style=\"text-align:left;\"><span style=\"font-size: medium;\"><span style=\"font-size:16px\">话机通讯录: 1000组名片式电话存储 来电防火墙功能&nbsp; 来电大头贴及来电铃声识别</span></span></p><p style=\"text-align:left;\"><span style=\"font-size: medium;\"><span style=\"font-size:16px\">通话记录：支持电话录音,恢复/静音,双音多频,免提</span></span></p><p>&nbsp;</p><p><span style=\"font-size:16px\">高级功能</span></p><p style=\"text-align:left;\"><span style=\"font-size: medium;\"><span style=\"font-size:16px\">多媒体娱乐: 200万像素，最大支持10240*960，11级数码变焦,多种效果设置,连拍可全屏查看拍摄或下载的图片.支持有声MP4短片拍摄，录像时间根据内存 大小而定，拍摄录像,TV电视可跟朋友家人一起分享。支持网络摄像头功能 支持MPEG4、3GP(H.263)等视频格式 支持MP3等音频格式播放， 支持歌词播放</span></span></p><p style=\"text-align:left;\"><span style=\"font-size: medium;\"><span style=\"font-size:16px\">内置游戏:智能拼图</span></span></p><p style=\"text-align:left;\"><span style=\"font-size: medium;\"><span style=\"font-size:16px\">扩展存储功能:支持TF扩展,支持U盘功能,本机内置1M,随机赠送256TF卡</span></span></p><p style=\"text-align:left;\"><span style=\"font-size: medium;\"><span style=\"font-size:16px\">高级功能:直板/智能PDA手写/键盘输入 超长待机 WAP上网&nbsp; 录音 蓝牙 FM收音机 电子书 Java扩展 TV电视输出 声控语音拨号 免费电视 来电防火墙&nbsp;&nbsp;&nbsp;</span></span></p><p style=\"text-align:left;\"><span style=\"font-size: medium;\"><span style=\"font-size:16px\">附加功能: 日历 计算器 闹钟 记事本 日程表 秒表 单位换算</span></span></p><p><span style=\"font-size: medium;\"><span style=\"font-size:16px\">提醒 以上性能均为本公司员工试机后所写,产品资料仅供参考,请以收到实物为准</span></span></p>');
INSERT INTO `zc_goods` VALUES ('47', '1', '诺基亚7230', '0', '1', '', '0', '0.000', '2000.00', '1899.00', '0', '0', '', '', '徒徒，我会想你的', '', '[\"\\/Uploads\\/Images\\/20160507\\/572d82e97b589.jpg\",\"\\/Uploads\\/Images\\/20160507\\/572d78e4ee30c.jpg\",\"\\/Uploads\\/Images\\/20160507\\/572d78e513648.jpg\",\"\\/Uploads\\/Images\\/20160507\\/572da50721691.jpg\"]', '', '1', '', '1', '1', '0', '0', '2016-04-02 10:00:00', '100', '0', '0', '0', '0', '0', '0', '0', '0', '', '-1', '-1', null, null, '<p>包装内容</p><p><img border=\"0\" src=\"/ueditor/php/upload/image/20160507/1462614360398904.png\" width=\"120\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top;\"/></p><p>具有线控功能和麦克风的 Apple EarPods</p><p><img border=\"0\" src=\"/ueditor/php/upload/image/20160507/1462614361119679.png\" width=\"300\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top;\"/></p><p>iPhone</p><p><img border=\"0\" src=\"/ueditor/php/upload/image/20160507/1462614361856590.png\" width=\"170\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top;\"/></p><p>Lightning 对 USB 连接线</p><p><img border=\"0\" src=\"/ueditor/php/upload/image/20160507/1462614361518446.jpg\" width=\"170\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top;\"/></p><p>5W USB 电源转换器</p><p>这款无需合约的 iPhone 6 支持中国移动、中国电信和中国联通的 4G LTE 网络。</p><p>购买须知</p><p>产品交付须知</p><p>Apple Store 官方旗舰店产品由指定的送货员在周一至周日的营业时间内送货。所有交货均须签名。订单在产品有货时装运，并可能会导致多次送货。如果送货不成，会给您留下一张名片，通知您联系送货员以安排一个更为方便的送货日期。为了您的便利，您可能更愿意将您的订单送至您的办公地址。请注意，如果您如此决定，货物可能由收发部门接收。为安全起见，不允许送货至邮箱。为核验之目的，运送地址的接收方须向我们指定的承运人提供买方或者订单所列接受方的身份证明。</p><p>购买资格</p><p>Apple Store 官方旗舰店仅向个人用户销售和运送产品。尽管已确认订单或付款，如果苹果有合理理由相信产品购买并非为了个人使用，它可以取消任何订单。</p><p>经营时间</p><p>如果您想获得产品和定价信息，我们的在线客服会在周一至周日上午 9 点到晚上 6 点（不含中国公众假期）为您提供帮助。对订单状态信息或对您已在 Apple Store 官方旗舰店下发订单的其他帮助， 请联系在线客服。</p><p>查看订单状态</p><p>您可以登录天猫查看您的订单状况。</p><p>付款</p><p>您需要使用支付宝进行支付，关于支付宝具体详情，请参见支付宝支付帮助介绍。<br style=\"margin: 0px; padding: 0px;\"/>http://help.alipay.com/lab/index.htm</p><p>发票</p><p>我们将提供普通增值税发票，您将可在请求个人补偿、证明保修资格以及申请维修时使用。如需修改发票抬头，需要与客服沟通确认后方可生效。<br style=\"margin: 0px; padding: 0px;\"/>收到发票后，如发现发票抬头，内容或金额等，与下订单时或者要求重开时所填写的内容不符。请先与旺旺客服联系确认后，并将原始发票邮寄回苹果公司才予以重开。如因客户方面的问题需要重开发票，需要自费寄回。已退回部分商品将无法更改发票抬头。<br style=\"margin: 0px; padding: 0px;\"/>补开或重开发票仅限一次，期限为发票日期的 14 天内提出申请。</p><p>退款与退货</p><p>苹果遵守中国三包规定，为 Apple Store 官方旗舰店消费者提供 7 天的退货服务。 Apple Store 官方旗舰店提示您： 在收到商品后，请第一时间仔细检查产品的外观，颜色和配置符合需求，如果发现任何疑问，请马上联系在线客服人员，等待 Apple 免费上门将商品取回。您无需自行寄回，也无需选择运费险。我们收到退件后，经过相关部门核实无误，可以为您办理退换货。<br style=\"margin: 0px; padding: 0px;\"/><br style=\"margin: 0px; padding: 0px;\"/>如果我们接受您退回的产品，我们将向您返还您的购买价格中的现金部分，即除去天猫积分，天猫点券及积分宝抵扣价格部分。</p><p><br/></p>');
INSERT INTO `zc_goods` VALUES ('48', '1', '徒徒PK 小师傅', '0', '1', '', '0', '0.000', '99999999.99', '99999999.99', '0', '0', '', '', '徒徒爱小师傅，小师傅爱徒徒', '', '[\"\\/Uploads\\/Images\\/20160507\\/572d96ee29eff.jpg\",\"\\/Uploads\\/Images\\/20160507\\/572d96ee4433a.jpg\",\"\\/Uploads\\/Images\\/20160507\\/572de58dafb0e.jpg\"]', '', '1', '', '1', '1', '0', '0', '2016-05-07 20:51:08', '100', '0', '0', '0', '0', '0', '0', '0', '0', '', '-1', '-1', null, null, '<p>\n    <span style=\"margin: 0px; padding: 0px;\"></span>\n</p>\n<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 1.4;\">\n    <img src=\"https://gdp.alicdn.com/imgextra/i4/2675244787/TB2Jv5IhFXXXXcfXXXXXXXXXXXX_!!2675244787.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: none; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: middle; display: inline-block; line-height: 1.5;\"/>\n</p>\n<p>\n    <br/>\n</p>\n<p>\n    <span style=\"margin: 0px; padding: 0px;text-decoration:line-through;\"><strong style=\"margin: 0px; padding: 0px;\"></strong></span>\n</p>\n<p>\n    <span style=\"margin: 0px; padding: 0px;text-decoration:line-through;\"><strong style=\"margin: 0px; padding: 0px;\"></strong></span>\n</p>\n<p>\n    <span style=\"margin: 0px; padding: 0px;\"></span>\n</p>\n<p>\n    <br/>\n</p>\n<p>\n    <span style=\"margin: 0px; padding: 0px;text-decoration:line-through;\"><strong style=\"margin: 0px; padding: 0px;\"></strong></span>\n</p>\n<p>\n    <span style=\"margin: 0px; padding: 0px;text-decoration:line-through;\"><strong style=\"margin: 0px; padding: 0px;\"></strong></span>\n</p>\n<p>\n    <span style=\"margin: 0px; padding: 0px;\"></span>\n</p>\n<p>\n    <a class=\"jdb abs aj15f-B1gP mcblack\" href=\"https://yaoxun.tmall.com/p/rd041984.htm?\" target=\"_blank\" data-linkmode=\"ptlink\" data-appid=\"aj15f-B1gP\" style=\"margin: 0px; padding: 0px; text-decoration: none; color: rgb(41, 83, 166); outline: none; border-width: 0px; position: absolute; display: block; width: 790px; height: 232px; top: 0px; left: 0px; z-index: 10;\"></a>\n</p>\n<p>\n    <br/>\n</p>\n<p>\n    <span style=\"margin: 0px; padding: 0px;text-decoration:line-through;\"><strong style=\"margin: 0px; padding: 0px;\"></strong></span>\n</p>\n<p>\n    <span style=\"margin: 0px; padding: 0px;text-decoration:line-through;\"><strong style=\"margin: 0px; padding: 0px;\"></strong></span>\n</p>\n<p>\n    <span style=\"margin: 0px; padding: 0px;\"></span>\n</p>\n<p>\n    <br/>\n</p>\n<p>\n    <span style=\"margin: 0px; padding: 0px;text-decoration:line-through;\"><strong style=\"margin: 0px; padding: 0px;\"></strong></span>\n</p>\n<p>\n    <span style=\"margin: 0px; padding: 0px;text-decoration:line-through;\"><strong style=\"margin: 0px; padding: 0px;\"></strong></span>\n</p>\n<p>\n    <span style=\"margin: 0px; padding: 0px;\"></span>\n</p>\n\n<p>\n    <br/>\n</p>\n<p>\n    <span style=\"margin: 0px; padding: 0px;text-decoration:line-through;\"><strong style=\"margin: 0px; padding: 0px;\"></strong></span>\n</p>\n<p>\n    <span style=\"margin: 0px; padding: 0px;text-decoration:line-through;\"><strong style=\"margin: 0px; padding: 0px;\"></strong></span>\n</p>\n<p>\n    <span style=\"margin: 0px; padding: 0px;\"></span>\n</p>\n<p>\n    &nbsp;\n</p>\n<p>\n    <br/>\n</p>\n<p>\n    <span style=\"margin: 0px; padding: 0px;text-decoration:line-through;\"><strong style=\"margin: 0px; padding: 0px;\"></strong></span>\n</p>\n<p>\n    <span style=\"margin: 0px; padding: 0px;text-decoration:line-through;\"><strong style=\"margin: 0px; padding: 0px;\"></strong></span>\n</p>\n<p>\n    <span style=\"margin: 0px; padding: 0px;\"></span>\n</p>\n<p>\n    &nbsp;\n</p>\n<p>\n    <br/>\n</p>\n<p>\n    <span style=\"margin: 0px; padding: 0px;text-decoration:line-through;\"><strong style=\"margin: 0px; padding: 0px;\"></strong></span>\n</p>\n<p>\n    <span style=\"margin: 0px; padding: 0px;text-decoration:line-through;\"><strong style=\"margin: 0px; padding: 0px;\"></strong></span>\n</p>\n<p>\n    <span style=\"margin: 0px; padding: 0px;\"></span>\n</p>\n\n<p>\n    <br/>\n</p>\n<p>\n    <span style=\"margin: 0px; padding: 0px;text-decoration:line-through;\"><strong style=\"margin: 0px; padding: 0px;\"></strong></span>\n</p>\n<p>\n    <span style=\"margin: 0px; padding: 0px;text-decoration:line-through;\"><strong style=\"margin: 0px; padding: 0px;\"></strong></span>\n</p>\n<p>\n    <span style=\"margin: 0px; padding: 0px;\"></span>\n</p>\n<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 1.4;\">\n    <img src=\"https://gdp.alicdn.com/imgextra/i4/2675244787/TB2HqFriFXXXXbZXXXXXXXXXXXX_!!2675244787.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: none; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: middle; display: inline-block;\"/>\n</p>\n<p>\n    <br/>\n</p>\n<p>\n    <span style=\"margin: 0px; padding: 0px;text-decoration:line-through;\"><strong style=\"margin: 0px; padding: 0px;\"></strong></span>\n</p>\n<p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; line-height: 1.4;\">\n    <img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/2675244787/TB2EfoKmVXXXXcRXpXXXXXXXXXX_!!2675244787.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/2675244787/TB22vkmnVXXXXadXpXXXXXXXXXX_!!2675244787.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/2675244787/TB2QX5llVXXXXcdXXXXXXXXXXXX_!!2675244787.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; line-height: 1.5;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/2675244787/TB29QhZlVXXXXb8XpXXXXXXXXXX_!!2675244787.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; line-height: 1.5;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/2675244787/TB2bNU2mVXXXXX_XpXXXXXXXXXX_!!2675244787.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/2675244787/TB2DnILoXXXXXXcXFXXXXXXXXXX_!!2675244787.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/2675244787/TB2zIdXopXXXXcPXXXXXXXXXXXX_!!2675244787.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/2675244787/TB2mGM7oXXXXXXRXpXXXXXXXXXX_!!2675244787.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/2675244787/TB2UeYFXpXXXXcqXpXXXXXXXXXX_!!2675244787.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/2675244787/TB2BWkYoXXXXXbHXpXXXXXXXXXX_!!2675244787.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/2675244787/TB2YqsWoXXXXXbNXpXXXXXXXXXX_!!2675244787.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/2675244787/TB2Jj.4oXXXXXabXpXXXXXXXXXX_!!2675244787.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/2675244787/TB2yus5mVXXXXXGXpXXXXXXXXXX_!!2675244787.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/2675244787/TB2u7JnlVXXXXaCXpXXXXXXXXXX_!!2675244787.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; line-height: 1.5;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/2675244787/TB2EI0MlVXXXXatXXXXXXXXXXXX_!!2675244787.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; line-height: 1.5;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/2675244787/TB2kolknXXXXXaBXXXXXXXXXXXX_!!2675244787.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/2675244787/TB2QODjlVXXXXbNXpXXXXXXXXXX_!!2675244787.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; line-height: 1.5;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/2675244787/TB2OUDclVXXXXbQXpXXXXXXXXXX_!!2675244787.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; line-height: 1.5;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/2675244787/TB2d_TflVXXXXblXpXXXXXXXXXX_!!2675244787.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; line-height: 1.5;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/2675244787/TB2_96XlVXXXXb6XpXXXXXXXXXX_!!2675244787.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; line-height: 1.5;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/2675244787/TB2pETslVXXXXbOXXXXXXXXXXXX_!!2675244787.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; line-height: 1.5;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/2675244787/TB2H4_klVXXXXaLXpXXXXXXXXXX_!!2675244787.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; line-height: 1.5;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/2675244787/TB2jUe_lVXXXXcEXpXXXXXXXXXX_!!2675244787.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; line-height: 1.5;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/2675244787/TB2VmDVlVXXXXXcXXXXXXXXXXXX_!!2675244787.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; line-height: 1.5;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/2675244787/TB29OQNmVXXXXcBXpXXXXXXXXXX_!!2675244787.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/2675244787/TB2oCnllVXXXXaCXpXXXXXXXXXX_!!2675244787.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; line-height: 1.5;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/2675244787/TB22rvDlVXXXXbZXXXXXXXXXXXX_!!2675244787.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; line-height: 1.5;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/2675244787/TB2Y_LElVXXXXbnXXXXXXXXXXXX_!!2675244787.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; line-height: 1.5;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/2675244787/TB2jiLmlVXXXXaAXpXXXXXXXXXX_!!2675244787.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; line-height: 1.5;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/2675244787/TB2Too.lVXXXXbwXpXXXXXXXXXX_!!2675244787.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; line-height: 1.5;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/2675244787/TB2P6cWmVXXXXaOXpXXXXXXXXXX_!!2675244787.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/2675244787/TB2Io8IlVXXXXbfXXXXXXXXXXXX_!!2675244787.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; line-height: 1.5;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/2675244787/TB22PNrlVXXXXazXpXXXXXXXXXX_!!2675244787.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; line-height: 1.5;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/2675244787/TB2MQhylVXXXXc_XXXXXXXXXXXX_!!2675244787.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; line-height: 1.5;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/2675244787/TB2dQtAlVXXXXcGXXXXXXXXXXXX_!!2675244787.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; line-height: 1.5;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/2675244787/TB2mz0rlVXXXXX3XpXXXXXXXXXX_!!2675244787.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; line-height: 1.5;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/2675244787/TB28_DFlVXXXXX1XXXXXXXXXXXX_!!2675244787.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; line-height: 1.5;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/2675244787/TB2CEu6lVXXXXa6XpXXXXXXXXXX_!!2675244787.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; line-height: 1.5;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/2675244787/TB23slwlVXXXXXsXpXXXXXXXXXX_!!2675244787.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; line-height: 1.5;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/2675244787/TB250tBlVXXXXcbXXXXXXXXXXXX_!!2675244787.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; line-height: 1.5;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/2675244787/TB2QshxlVXXXXXeXpXXXXXXXXXX_!!2675244787.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; line-height: 1.5;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/2675244787/TB2SIuomXXXXXcEXXXXXXXXXXXX_!!2675244787.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/2675244787/TB2h945mXXXXXbYXpXXXXXXXXXX_!!2675244787.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/2675244787/TB2aiGymXXXXXbhXXXXXXXXXXXX_!!2675244787.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\"/>\n</p>\n<p>\n    <br/>\n</p>');

-- ----------------------------
-- Table structure for zc_goods_activity
-- ----------------------------
DROP TABLE IF EXISTS `zc_goods_activity`;
CREATE TABLE `zc_goods_activity` (
  `act_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `act_name` varchar(255) NOT NULL,
  `act_desc` text NOT NULL,
  `act_type` tinyint(3) unsigned NOT NULL,
  `goods_id` mediumint(8) unsigned NOT NULL,
  `product_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_name` varchar(255) NOT NULL,
  `start_time` int(10) unsigned NOT NULL,
  `end_time` int(10) unsigned NOT NULL,
  `is_finished` tinyint(3) unsigned NOT NULL,
  `ext_info` text NOT NULL,
  PRIMARY KEY (`act_id`),
  KEY `act_name` (`act_name`,`act_type`,`goods_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zc_goods_activity
-- ----------------------------
INSERT INTO `zc_goods_activity` VALUES ('1', '夺宝奇兵之诺基亚N96', '新一轮的夺宝开始了\n本期是 诺基亚n96', '0', '23', '0', '诺基亚N96', '1242107580', '1242193980', '0', 'a:4:{s:11:\"start_price\";s:4:\"1.00\";s:9:\"end_price\";s:6:\"800.00\";s:9:\"max_price\";i:0;s:11:\"cost_points\";s:1:\"1\";}');
INSERT INTO `zc_goods_activity` VALUES ('2', '夺宝奇兵之夏新N7', '本期的夺宝奖品是 夏新N7', '0', '17', '0', '夏新N7', '1242107820', '1250661420', '0', 'a:4:{s:11:\"start_price\";s:4:\"1.00\";s:9:\"end_price\";s:6:\"800.00\";s:9:\"max_price\";i:0;s:11:\"cost_points\";s:1:\"1\";}');
INSERT INTO `zc_goods_activity` VALUES ('3', 'P806', '本期团购活动——联想新品P806\n团购买的多优惠多', '1', '24', '0', 'P806', '1241971200', '1242403200', '3', 'a:4:{s:12:\"price_ladder\";a:3:{i:0;a:2:{s:6:\"amount\";i:10;s:5:\"price\";d:1850;}i:1;a:2:{s:6:\"amount\";i:15;s:5:\"price\";d:1800;}i:2;a:2:{s:6:\"amount\";i:20;s:5:\"price\";d:1780;}}s:15:\"restrict_amount\";i:0;s:13:\"gift_integral\";i:0;s:7:\"deposit\";d:1000;}');
INSERT INTO `zc_goods_activity` VALUES ('4', '拍卖活动——索爱C702c', '', '2', '10', '0', '索爱C702c', '1242144000', '1242403200', '0', 'a:5:{s:7:\"deposit\";d:0;s:11:\"start_price\";d:0;s:9:\"end_price\";i:0;s:9:\"amplitude\";d:20;s:6:\"no_top\";i:1;}');
INSERT INTO `zc_goods_activity` VALUES ('5', '摩托罗拉E8 大礼包', '礼包大优惠', '4', '31', '0', '摩托罗拉E8 ', '1242110400', '1252046400', '0', 'a:1:{s:13:\"package_price\";s:4:\"1430\";}');
INSERT INTO `zc_goods_activity` VALUES ('6', '诺基亚N85大礼包', '诺基亚N85超值大礼包', '4', '32', '0', '诺基亚N85', '1242110760', '1248936360', '0', 'a:1:{s:13:\"package_price\";s:4:\"3150\";}');
INSERT INTO `zc_goods_activity` VALUES ('7', '拍卖活动——索爱C702c(第2期)', '拍卖活动————索爱C702c （第2期）', '2', '10', '0', '索爱C702c', '1241712000', '1274803200', '0', 'a:5:{s:7:\"deposit\";d:50;s:11:\"start_price\";d:0;s:9:\"end_price\";i:0;s:9:\"amplitude\";d:50;s:6:\"no_top\";i:1;}');
INSERT INTO `zc_goods_activity` VALUES ('8', 'P806', '团购第2期', '1', '24', '0', 'P806', '1242316800', '1274803200', '0', 'a:4:{s:12:\"price_ladder\";a:2:{i:0;a:2:{s:6:\"amount\";i:5;s:5:\"price\";d:1910;}i:1;a:2:{s:6:\"amount\";i:10;s:5:\"price\";d:1860;}}s:15:\"restrict_amount\";i:0;s:13:\"gift_integral\";i:0;s:7:\"deposit\";d:1000;}');

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
INSERT INTO `zc_goods_attr` VALUES ('238', '48', '173', 'GSM,850,900,1800,1900', '0');
INSERT INTO `zc_goods_attr` VALUES ('237', '48', '185', '灰色', '1');
INSERT INTO `zc_goods_attr` VALUES ('236', '48', '191', '支持', '0');
INSERT INTO `zc_goods_attr` VALUES ('235', '48', '190', '支持', '0');
INSERT INTO `zc_goods_attr` VALUES ('234', '48', '189', '2.4英寸', '0');
INSERT INTO `zc_goods_attr` VALUES ('233', '48', '172', '2008年04月', '0');
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
  `attr_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `cat_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attr_name` varchar(60) NOT NULL DEFAULT '',
  `attr_input_type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `attr_type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `attr_values` text NOT NULL,
  `attr_index` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `is_linked` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `attr_group` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`attr_id`),
  KEY `cat_id` (`cat_id`)
) ENGINE=MyISAM AUTO_INCREMENT=213 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zc_goods_attribute
-- ----------------------------
INSERT INTO `zc_goods_attribute` VALUES ('1', '1', '作者', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('2', '1', '出版社', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('3', '1', '图书书号/ISBN', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('4', '1', '出版日期', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('5', '1', '开本', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('6', '1', '图书页数', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('7', '1', '图书装订', '1', '0', '平装\r\n黑白', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('8', '1', '图书规格', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('9', '1', '版次', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('10', '1', '印张', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('11', '1', '字数', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('12', '1', '所属分类', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('32', '3', '中文片名', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('33', '3', '英文片名', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('34', '3', '商品别名', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('35', '3', '介质/格式', '1', '0', 'HDCD\r\nDTS\r\nDVD\r\nDVD9\r\nVCD', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('36', '3', '碟片类型', '1', '0', '单面\r\n双层', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('37', '3', '片装数', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('38', '3', '国家地区', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('39', '3', '语种/配音', '1', '0', '中文\r\n英文\r\n法文\r\n西班牙文', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('40', '3', '字幕', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('41', '3', '色彩', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('42', '3', '中文字幕', '1', '0', '有\r\n无', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('43', '3', '导演', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('44', '3', '表演者', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('45', '3', '所属类别', '1', '0', '爱情\r\n偶像\r\n生活\r\n社会\r\n科幻\r\n神话\r\n武侠\r\n动作\r\n惊险\r\n恐怖\r\n传奇\r\n人物\r\n侦探\r\n警匪\r\n历史\r\n军事\r\n戏剧\r\n舞台\r\n经典\r\n名著\r\n喜剧\r\n情景\r\n动漫\r\n卡通\r\n儿童\r\n伦理激情', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('46', '3', '年份', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('47', '3', '音频格式', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('48', '3', '区码', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('49', '3', '碟片代码', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('50', '3', 'ISRC码', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('51', '3', '发行公司', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('52', '3', '出版 ', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('53', '3', '出版号', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('54', '3', '引进号', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('55', '3', '版权号', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('56', '1', '网络制式', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('57', '1', '支持频率/网络频率', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('58', '1', '尺寸体积', '1', '0', '   ', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('59', '1', '外观样式/手机类型', '1', '0', '翻盖\r\n滑盖\r\n直板\r\n折叠\r\n手写', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('60', '1', '主屏参数/内屏参数', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('61', '1', '副屏参数/外屏参数', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('62', '1', '清晰度', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('63', '1', '色数/灰度', '1', '0', '   ', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('64', '1', '长度', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('65', '1', '宽度', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('66', '1', '厚度', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('67', '1', '屏幕材质', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('68', '1', '内存容量', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('69', '1', '操作系统', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('70', '1', '通话时间', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('71', '1', '待机时间', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('72', '1', '标准配置', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('73', '1', 'WAP上网', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('74', '1', '数据业务', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('75', '1', '天线位置', '1', '0', '内置,外置', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('76', '1', '随机配件', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('77', '1', '铃声', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('78', '1', '摄像头', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('79', '1', '彩信/彩e', '1', '0', '支持,不支持', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('80', '1', '红外/蓝牙', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('81', '1', '价格等级', '1', '0', '高价机,中价机,低价机', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('82', '5', '型号', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('83', '5', '详细规格', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('84', '5', '笔记本尺寸', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('85', '5', '处理器类型', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('86', '5', '处理器最高主频', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('87', '5', '二级缓存', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('88', '5', '系统总线', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('89', '5', '主板芯片组', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('90', '5', '内存容量', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('91', '5', '内存类型', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('92', '5', '硬盘', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('93', '5', '屏幕尺寸', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('94', '5', '显示芯片', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('95', '5', '标称频率', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('96', '5', '显卡显存', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('97', '5', '显卡类型', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('98', '5', '光驱类型', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('99', '5', '电池容量', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('100', '5', '其他配置', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('101', '6', '类型', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('102', '6', '最大像素/总像素  ', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('103', '6', '有效像素', '1', '0', '  ', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('104', '6', '光学变焦倍数', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('105', '6', '数字变焦倍数', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('106', '6', '操作模式', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('107', '6', '显示屏类型', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('108', '6', '显示屏尺寸', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('109', '6', '感光器件', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('110', '6', '感光器件尺寸', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('111', '6', '最高分辨率', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('112', '6', '图像分辨率', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('113', '6', '传感器类型', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('114', '6', '传感器尺寸', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('115', '6', '镜头', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('116', '6', '光圈', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('117', '6', '焦距', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('118', '6', '旋转液晶屏', '1', '0', '支持\r\n不支持', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('119', '6', '存储介质', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('120', '6', '存储卡', '1', '0', '  记录媒体\r\n存储卡容量', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('121', '6', '影像格式', '1', '0', '    静像\r\n动画', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('122', '6', '曝光控制', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('123', '6', '曝光模式', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('124', '6', '曝光补偿', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('125', '6', '白平衡', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('126', '6', '连拍', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('127', '6', '快门速度', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('128', '6', '闪光灯', '1', '0', '内置\r\n外置', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('129', '6', '拍摄范围', '1', '0', '  ', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('130', '6', '自拍定时器', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('131', '6', 'ISO感光度', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('132', '6', '测光模式', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('133', '6', '场景模式', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('134', '6', '短片拍摄', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('135', '6', '外接接口', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('136', '6', '电源', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('137', '6', '电池使用时间', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('138', '6', '外形尺寸', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('139', '6', '标配软件', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('140', '6', '标准配件', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('141', '6', '兼容操作系统', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('142', '7', '编号', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('143', '7', '类型', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('144', '7', '外型尺寸', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('145', '7', '最大像素数', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('146', '7', '光学变焦倍数', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('147', '7', '数字变焦倍数', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('148', '7', '显示屏尺寸及类型', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('149', '7', '感光器件', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('150', '7', '感光器件尺寸', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('151', '7', '感光器件数量', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('152', '7', '像素范围', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('153', '7', '传感器数量', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('154', '7', '传感器尺寸', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('155', '7', '水平清晰度', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('156', '7', '取景器', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('157', '7', '数码效果', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('158', '7', '镜头性能', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('159', '7', '对焦方式', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('160', '7', '曝光控制', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('161', '7', '其他接口', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('162', '7', '随机存储', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('163', '7', '电池类型', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('164', '7', '电池供电时间', '0', '0', '100小时', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('165', '8', '产地', '0', '0', '美国', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('166', '8', '产品规格/容量', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('167', '8', '主要原料', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('168', '8', '所属类别', '1', '0', '彩妆\r\n化妆工具\r\n护肤品\r\n香水', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('169', '8', '使用部位', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('170', '8', '适合肤质', '1', '0', '油性\r\n中性\r\n干性', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('171', '8', '适用人群', '1', '0', '女性\r\n男性', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('172', '9', '上市日期', '1', '0', '2008年01月\r\n2008年02月\r\n2008年03月\r\n2008年04月\r\n2008年05月\r\n2008年06月\r\n2008年07月\r\n2008年08月\r\n2008年09月\r\n2008年10月\r\n2008年11月\r\n2008年12月\r\n2007年01月\r\n2007年02月\r\n2007年03月\r\n2007年04月\r\n2007年05月\r\n2007年06月\r\n2007年07月\r\n2007年08月\r\n2007年09月\r\n2007年10月\r\n2007年11月\r\n2007年12月', '1', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('173', '9', '手机制式', '1', '0', 'GSM,850,900,1800,1900\r\nGSM,900,1800,1900,2100\r\nCDMA\r\n双模（GSM,900,1800,CDMA 1X）\r\n3G(GSM,900,1800,1900,TD-SCDMA )', '1', '1', '1', '0');
INSERT INTO `zc_goods_attribute` VALUES ('174', '9', '理论通话时间', '0', '0', '', '0', '2', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('175', '9', '理论待机时间', '0', '0', '', '0', '3', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('176', '9', '铃声', '0', '0', '', '0', '4', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('177', '9', '铃声格式', '0', '0', '', '0', '5', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('178', '9', '外观样式', '1', '0', '翻盖\r\n滑盖\r\n直板\r\n折叠', '1', '6', '1', '0');
INSERT INTO `zc_goods_attribute` VALUES ('179', '9', '中文短消息', '0', '0', '', '0', '7', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('180', '9', '存储卡格式', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('181', '9', '内存容量', '0', '0', '', '2', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('182', '9', '操作系统', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('183', '9', 'K-JAVA', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('184', '9', '尺寸体积', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('185', '9', '颜色', '1', '1', '黑色\r\n白色\r\n蓝色\r\n金色\r\n粉色\r\n银色\r\n灰色\r\n深李色\r\n黑红色\r\n黑蓝色\r\n白紫色', '1', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('186', '9', '屏幕颜色', '1', '0', '1600万\r\n262144万', '1', '0', '1', '1');
INSERT INTO `zc_goods_attribute` VALUES ('187', '9', '屏幕材质', '1', '0', 'TFT', '0', '0', '0', '1');
INSERT INTO `zc_goods_attribute` VALUES ('188', '9', '屏幕分辨率', '1', '0', '320×240 像素\r\n240×400 像素\r\n240×320 像素\r\n176x220 像素', '1', '0', '0', '1');
INSERT INTO `zc_goods_attribute` VALUES ('189', '9', '屏幕大小', '0', '0', '', '0', '0', '0', '1');
INSERT INTO `zc_goods_attribute` VALUES ('190', '9', '中文输入法', '0', '0', '', '0', '0', '0', '2');
INSERT INTO `zc_goods_attribute` VALUES ('191', '9', '情景模式', '0', '0', '', '0', '0', '0', '2');
INSERT INTO `zc_goods_attribute` VALUES ('192', '9', '网络链接', '0', '0', '', '0', '0', '0', '2');
INSERT INTO `zc_goods_attribute` VALUES ('193', '9', '蓝牙接口', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('194', '9', '数据线接口', '0', '0', '', '0', '0', '0', '2');
INSERT INTO `zc_goods_attribute` VALUES ('195', '9', '电子邮件', '0', '0', '', '0', '0', '0', '2');
INSERT INTO `zc_goods_attribute` VALUES ('196', '9', '闹钟', '0', '0', '', '0', '35', '0', '4');
INSERT INTO `zc_goods_attribute` VALUES ('197', '9', '办公功能', '0', '0', '', '0', '0', '0', '4');
INSERT INTO `zc_goods_attribute` VALUES ('198', '9', '数码相机', '0', '0', '', '1', '0', '0', '3');
INSERT INTO `zc_goods_attribute` VALUES ('199', '9', '像素', '0', '0', '', '0', '0', '0', '3');
INSERT INTO `zc_goods_attribute` VALUES ('200', '9', '传感器', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('201', '9', '变焦模式', '0', '0', '', '0', '0', '0', '3');
INSERT INTO `zc_goods_attribute` VALUES ('202', '9', '视频拍摄', '0', '0', '', '0', '0', '0', '3');
INSERT INTO `zc_goods_attribute` VALUES ('203', '9', 'MP3播放器', '0', '0', '', '0', '0', '0', '3');
INSERT INTO `zc_goods_attribute` VALUES ('204', '9', '视频播放', '0', '0', '', '0', '0', '0', '3');
INSERT INTO `zc_goods_attribute` VALUES ('205', '9', 'CPU频率', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('206', '9', '收音机', '0', '0', '', '0', '0', '0', '3');
INSERT INTO `zc_goods_attribute` VALUES ('207', '9', '耳机接口', '0', '0', '', '0', '0', '0', '3');
INSERT INTO `zc_goods_attribute` VALUES ('208', '9', '闪光灯', '0', '0', '', '0', '0', '0', '3');
INSERT INTO `zc_goods_attribute` VALUES ('209', '9', '浏览器', '0', '0', '', '0', '0', '0', '2');
INSERT INTO `zc_goods_attribute` VALUES ('210', '9', '配件', '1', '2', '线控耳机,蓝牙耳机,数据线', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('211', '165', '', '1', '1', '美国', '0', '0', '0', '1');

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
INSERT INTO `zc_goods_type` VALUES ('4', '手机', '0', '4');
INSERT INTO `zc_goods_type` VALUES ('5', '笔记本电脑', '0', '3');
INSERT INTO `zc_goods_type` VALUES ('6', '数码相机', '0', '2');
INSERT INTO `zc_goods_type` VALUES ('7', '数码摄像机', '0', '2');

-- ----------------------------
-- Table structure for zc_member
-- ----------------------------
DROP TABLE IF EXISTS `zc_member`;
CREATE TABLE `zc_member` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `nickname` char(16) NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` date NOT NULL DEFAULT '0000-00-00' COMMENT '生日',
  `qq` char(10) NOT NULL DEFAULT '' COMMENT 'qq号',
  `score` mediumint(8) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `login` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '会员状态',
  PRIMARY KEY (`uid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='会员表';

-- ----------------------------
-- Records of zc_member
-- ----------------------------
INSERT INTO `zc_member` VALUES ('1', 'root', '0', '0000-00-00', '', '60', '27', '0', '1459130284', '2130706433', '1462584819', '1');

-- ----------------------------
-- Table structure for zc_menu
-- ----------------------------
DROP TABLE IF EXISTS `zc_menu`;
CREATE TABLE `zc_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `hide` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `tip` varchar(255) NOT NULL DEFAULT '' COMMENT '提示',
  `group` varchar(50) DEFAULT '' COMMENT '分组',
  `is_dev` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否仅开发者模式可见',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=131 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zc_menu
-- ----------------------------
INSERT INTO `zc_menu` VALUES ('1', '首页', '0', '1', 'Index/index', '1', '', '', '0');
INSERT INTO `zc_menu` VALUES ('2', '内容', '0', '9', 'Article/mydocument', '1', '', '', '0');
INSERT INTO `zc_menu` VALUES ('3', '文档列表', '2', '0', 'article/index', '1', '', '内容', '0');
INSERT INTO `zc_menu` VALUES ('4', '新增', '3', '0', 'article/add', '0', '', '', '0');
INSERT INTO `zc_menu` VALUES ('5', '编辑', '3', '0', 'article/edit', '0', '', '', '0');
INSERT INTO `zc_menu` VALUES ('6', '改变状态', '3', '0', 'article/setStatus', '0', '', '', '0');
INSERT INTO `zc_menu` VALUES ('7', '保存', '3', '0', 'article/update', '0', '', '', '0');
INSERT INTO `zc_menu` VALUES ('8', '保存草稿', '3', '0', 'article/autoSave', '0', '', '', '0');
INSERT INTO `zc_menu` VALUES ('9', '移动', '3', '0', 'article/move', '0', '', '', '0');
INSERT INTO `zc_menu` VALUES ('10', '复制', '3', '0', 'article/copy', '0', '', '', '0');
INSERT INTO `zc_menu` VALUES ('11', '粘贴', '3', '0', 'article/paste', '0', '', '', '0');
INSERT INTO `zc_menu` VALUES ('12', '导入', '3', '0', 'article/batchOperate', '0', '', '', '0');
INSERT INTO `zc_menu` VALUES ('13', '回收站', '2', '0', 'article/recycle', '1', '', '内容', '0');
INSERT INTO `zc_menu` VALUES ('14', '还原', '13', '0', 'article/permit', '0', '', '', '0');
INSERT INTO `zc_menu` VALUES ('15', '清空', '13', '0', 'article/clear', '0', '', '', '0');
INSERT INTO `zc_menu` VALUES ('16', '用户', '0', '5', 'User/index', '0', '', '', '0');
INSERT INTO `zc_menu` VALUES ('17', '用户信息', '16', '0', 'User/index', '0', '', '后台用户', '0');
INSERT INTO `zc_menu` VALUES ('18', '新增用户', '17', '0', 'User/add', '0', '添加新用户', '', '0');
INSERT INTO `zc_menu` VALUES ('19', '用户行为', '16', '0', 'User/action', '0', '', '后台用户', '0');
INSERT INTO `zc_menu` VALUES ('20', '新增用户行为', '19', '0', 'User/addaction', '0', '', '', '0');
INSERT INTO `zc_menu` VALUES ('21', '编辑用户行为', '19', '0', 'User/editaction', '0', '', '', '0');
INSERT INTO `zc_menu` VALUES ('22', '保存用户行为', '19', '0', 'User/saveAction', '0', '\"用户->用户行为\"保存编辑和新增的用户行为', '', '0');
INSERT INTO `zc_menu` VALUES ('23', '变更行为状态', '19', '0', 'User/setStatus', '0', '\"用户->用户行为\"中的启用,禁用和删除权限', '', '0');
INSERT INTO `zc_menu` VALUES ('24', '禁用会员', '19', '0', 'User/changeStatus?method=forbidUser', '0', '\"用户->用户信息\"中的禁用', '', '0');
INSERT INTO `zc_menu` VALUES ('25', '启用会员', '19', '0', 'User/changeStatus?method=resumeUser', '0', '\"用户->用户信息\"中的启用', '', '0');
INSERT INTO `zc_menu` VALUES ('26', '删除会员', '19', '0', 'User/changeStatus?method=deleteUser', '0', '\"用户->用户信息\"中的删除', '', '0');
INSERT INTO `zc_menu` VALUES ('27', '权限管理', '16', '0', 'AuthManager/index', '0', '', '后台用户', '0');
INSERT INTO `zc_menu` VALUES ('28', '删除', '27', '0', 'AuthManager/changeStatus?method=deleteGroup', '0', '删除用户组', '', '0');
INSERT INTO `zc_menu` VALUES ('29', '禁用', '27', '0', 'AuthManager/changeStatus?method=forbidGroup', '0', '禁用用户组', '', '0');
INSERT INTO `zc_menu` VALUES ('30', '恢复', '27', '0', 'AuthManager/changeStatus?method=resumeGroup', '0', '恢复已禁用的用户组', '', '0');
INSERT INTO `zc_menu` VALUES ('31', '新增', '27', '0', 'AuthManager/createGroup', '0', '创建新的用户组', '', '0');
INSERT INTO `zc_menu` VALUES ('32', '编辑', '27', '0', 'AuthManager/editGroup', '0', '编辑用户组名称和描述', '', '0');
INSERT INTO `zc_menu` VALUES ('33', '保存用户组', '27', '0', 'AuthManager/writeGroup', '0', '新增和编辑用户组的\"保存\"按钮', '', '0');
INSERT INTO `zc_menu` VALUES ('34', '授权', '27', '0', 'AuthManager/group', '0', '\"后台 \\ 用户 \\ 用户信息\"列表页的\"授权\"操作按钮,用于设置用户所属用户组', '', '0');
INSERT INTO `zc_menu` VALUES ('35', '访问授权', '27', '0', 'AuthManager/access', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"访问授权\"操作按钮', '', '0');
INSERT INTO `zc_menu` VALUES ('36', '成员授权', '27', '0', 'AuthManager/user', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"成员授权\"操作按钮', '', '0');
INSERT INTO `zc_menu` VALUES ('37', '解除授权', '27', '0', 'AuthManager/removeFromGroup', '0', '\"成员授权\"列表页内的解除授权操作按钮', '', '0');
INSERT INTO `zc_menu` VALUES ('38', '保存成员授权', '27', '0', 'AuthManager/addToGroup', '0', '\"用户信息\"列表页\"授权\"时的\"保存\"按钮和\"成员授权\"里右上角的\"添加\"按钮)', '', '0');
INSERT INTO `zc_menu` VALUES ('39', '分类授权', '27', '0', 'AuthManager/category', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"分类授权\"操作按钮', '', '0');
INSERT INTO `zc_menu` VALUES ('40', '保存分类授权', '27', '0', 'AuthManager/addToCategory', '0', '\"分类授权\"页面的\"保存\"按钮', '', '0');
INSERT INTO `zc_menu` VALUES ('41', '模型授权', '27', '0', 'AuthManager/modelauth', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"模型授权\"操作按钮', '', '0');
INSERT INTO `zc_menu` VALUES ('42', '保存模型授权', '27', '0', 'AuthManager/addToModel', '0', '\"分类授权\"页面的\"保存\"按钮', '', '0');
INSERT INTO `zc_menu` VALUES ('43', '扩展', '0', '7', 'Addons/index', '1', '', '', '0');
INSERT INTO `zc_menu` VALUES ('44', '插件管理', '43', '1', 'Addons/index', '0', '', '扩展', '0');
INSERT INTO `zc_menu` VALUES ('45', '创建', '44', '0', 'Addons/create', '0', '服务器上创建插件结构向导', '', '0');
INSERT INTO `zc_menu` VALUES ('46', '检测创建', '44', '0', 'Addons/checkForm', '0', '检测插件是否可以创建', '', '0');
INSERT INTO `zc_menu` VALUES ('47', '预览', '44', '0', 'Addons/preview', '0', '预览插件定义类文件', '', '0');
INSERT INTO `zc_menu` VALUES ('48', '快速生成插件', '44', '0', 'Addons/build', '0', '开始生成插件结构', '', '0');
INSERT INTO `zc_menu` VALUES ('49', '设置', '44', '0', 'Addons/config', '0', '设置插件配置', '', '0');
INSERT INTO `zc_menu` VALUES ('50', '禁用', '44', '0', 'Addons/disable', '0', '禁用插件', '', '0');
INSERT INTO `zc_menu` VALUES ('51', '启用', '44', '0', 'Addons/enable', '0', '启用插件', '', '0');
INSERT INTO `zc_menu` VALUES ('52', '安装', '44', '0', 'Addons/install', '0', '安装插件', '', '0');
INSERT INTO `zc_menu` VALUES ('53', '卸载', '44', '0', 'Addons/uninstall', '0', '卸载插件', '', '0');
INSERT INTO `zc_menu` VALUES ('54', '更新配置', '44', '0', 'Addons/saveconfig', '0', '更新插件配置处理', '', '0');
INSERT INTO `zc_menu` VALUES ('55', '插件后台列表', '44', '0', 'Addons/adminList', '0', '', '', '0');
INSERT INTO `zc_menu` VALUES ('56', 'URL方式访问插件', '44', '0', 'Addons/execute', '0', '控制是否有权限通过url访问插件控制器方法', '', '0');
INSERT INTO `zc_menu` VALUES ('57', '钩子管理', '43', '2', 'Addons/hooks', '0', '', '扩展', '0');
INSERT INTO `zc_menu` VALUES ('127', '菜单管理', '126', '0', 'menus/index', '0', '', '菜单管理', '0');
INSERT INTO `zc_menu` VALUES ('59', '新增', '58', '0', 'model/add', '0', '', '', '0');
INSERT INTO `zc_menu` VALUES ('60', '编辑', '58', '0', 'model/edit', '0', '', '', '0');
INSERT INTO `zc_menu` VALUES ('61', '改变状态', '58', '0', 'model/setStatus', '0', '', '', '0');
INSERT INTO `zc_menu` VALUES ('62', '保存数据', '58', '0', 'model/update', '0', '', '', '0');
INSERT INTO `zc_menu` VALUES ('63', '属性管理', '68', '0', 'Attribute/index', '1', '网站属性配置。', '', '0');
INSERT INTO `zc_menu` VALUES ('64', '新增', '63', '0', 'Attribute/add', '0', '', '', '0');
INSERT INTO `zc_menu` VALUES ('65', '编辑', '63', '0', 'Attribute/edit', '0', '', '', '0');
INSERT INTO `zc_menu` VALUES ('66', '改变状态', '63', '0', 'Attribute/setStatus', '0', '', '', '0');
INSERT INTO `zc_menu` VALUES ('67', '保存数据', '63', '0', 'Attribute/update', '0', '', '', '0');
INSERT INTO `zc_menu` VALUES ('68', '系统', '0', '10', 'Config/group', '0', '', '', '0');
INSERT INTO `zc_menu` VALUES ('69', '网站设置', '68', '1', 'Config/group', '0', '', '系统设置', '0');
INSERT INTO `zc_menu` VALUES ('70', '配置管理', '68', '4', 'Config/index', '0', '', '系统设置', '0');
INSERT INTO `zc_menu` VALUES ('71', '编辑', '70', '0', 'Config/edit', '0', '新增编辑和保存配置', '', '0');
INSERT INTO `zc_menu` VALUES ('72', '删除', '70', '0', 'Config/del', '0', '删除配置', '', '0');
INSERT INTO `zc_menu` VALUES ('73', '新增', '70', '0', 'Config/add', '0', '新增配置', '', '0');
INSERT INTO `zc_menu` VALUES ('74', '保存', '70', '0', 'Config/save', '0', '保存配置', '', '0');
INSERT INTO `zc_menu` VALUES ('75', '菜单管理', '68', '5', 'Menu/index', '0', '', '系统设置', '0');
INSERT INTO `zc_menu` VALUES ('76', '导航管理', '68', '6', 'Channel/index', '0', '', '系统设置', '0');
INSERT INTO `zc_menu` VALUES ('77', '新增', '76', '0', 'Channel/add', '0', '', '', '0');
INSERT INTO `zc_menu` VALUES ('78', '编辑', '76', '0', 'Channel/edit', '0', '', '', '0');
INSERT INTO `zc_menu` VALUES ('79', '删除', '76', '0', 'Channel/del', '0', '', '', '0');
INSERT INTO `zc_menu` VALUES ('128', '新增菜单', '127', '0', 'menus/editmenus', '0', '', '', '0');
INSERT INTO `zc_menu` VALUES ('81', '编辑', '80', '0', 'Category/edit', '0', '编辑和保存栏目分类', '', '0');
INSERT INTO `zc_menu` VALUES ('82', '新增', '80', '0', 'Category/add', '0', '新增栏目分类', '', '0');
INSERT INTO `zc_menu` VALUES ('83', '删除', '80', '0', 'Category/remove', '0', '删除栏目分类', '', '0');
INSERT INTO `zc_menu` VALUES ('84', '移动', '80', '0', 'Category/operate/type/move', '0', '移动栏目分类', '', '0');
INSERT INTO `zc_menu` VALUES ('85', '合并', '80', '0', 'Category/operate/type/merge', '0', '合并栏目分类', '', '0');
INSERT INTO `zc_menu` VALUES ('126', '菜单', '0', '6', 'menus/index', '0', '', '', '0');
INSERT INTO `zc_menu` VALUES ('87', '备份', '86', '0', 'Database/export', '0', '备份数据库', '', '0');
INSERT INTO `zc_menu` VALUES ('88', '优化表', '86', '0', 'Database/optimize', '0', '优化数据表', '', '0');
INSERT INTO `zc_menu` VALUES ('89', '修复表', '86', '0', 'Database/repair', '0', '修复数据表', '', '0');
INSERT INTO `zc_menu` VALUES ('125', '用户信息', '16', '0', 'customrer', '0', '', '商城用户', '0');
INSERT INTO `zc_menu` VALUES ('91', '恢复', '90', '0', 'Database/import', '0', '数据库恢复', '', '0');
INSERT INTO `zc_menu` VALUES ('92', '删除', '90', '0', 'Database/del', '0', '删除备份文件', '', '0');
INSERT INTO `zc_menu` VALUES ('96', '新增', '75', '0', 'Menu/add', '0', '', '系统设置', '0');
INSERT INTO `zc_menu` VALUES ('98', '编辑', '75', '0', 'Menu/edit', '0', '', '', '0');
INSERT INTO `zc_menu` VALUES ('104', '下载管理', '102', '0', 'Think/lists?model=download', '0', '', '', '0');
INSERT INTO `zc_menu` VALUES ('105', '配置管理', '102', '0', 'Think/lists?model=config', '0', '', '', '0');
INSERT INTO `zc_menu` VALUES ('106', '行为日志', '16', '0', 'Action/actionlog', '0', '', '后台用户', '0');
INSERT INTO `zc_menu` VALUES ('108', '修改密码', '16', '0', 'User/updatePassword', '1', '', '', '0');
INSERT INTO `zc_menu` VALUES ('109', '修改昵称', '16', '0', 'User/updateNickname', '1', '', '', '0');
INSERT INTO `zc_menu` VALUES ('110', '查看行为日志', '106', '0', 'action/edit', '1', '', '', '0');
INSERT INTO `zc_menu` VALUES ('112', '新增数据', '58', '0', 'think/add', '1', '', '', '0');
INSERT INTO `zc_menu` VALUES ('113', '编辑数据', '58', '0', 'think/edit', '1', '', '', '0');
INSERT INTO `zc_menu` VALUES ('114', '导入', '75', '0', 'Menu/import', '0', '', '', '0');
INSERT INTO `zc_menu` VALUES ('115', '生成', '58', '0', 'Model/generate', '0', '', '', '0');
INSERT INTO `zc_menu` VALUES ('116', '新增钩子', '57', '0', 'Addons/addHook', '0', '', '', '0');
INSERT INTO `zc_menu` VALUES ('117', '编辑钩子', '57', '0', 'Addons/edithook', '0', '', '', '0');
INSERT INTO `zc_menu` VALUES ('118', '文档排序', '3', '0', 'Article/sort', '1', '', '', '0');
INSERT INTO `zc_menu` VALUES ('119', '排序', '70', '0', 'Config/sort', '1', '', '', '0');
INSERT INTO `zc_menu` VALUES ('120', '排序', '75', '0', 'Menu/sort', '1', '', '', '0');
INSERT INTO `zc_menu` VALUES ('121', '排序', '76', '0', 'Channel/sort', '1', '', '', '0');
INSERT INTO `zc_menu` VALUES ('122', '商品', '0', '2', 'Goods/index', '0', '商品分类', '', '0');
INSERT INTO `zc_menu` VALUES ('123', '订单', '0', '3', 'Order/index', '0', '', '', '0');
INSERT INTO `zc_menu` VALUES ('124', '广告', '0', '4', 'Banner/index', '0', '', '', '0');
INSERT INTO `zc_menu` VALUES ('130', '订单管理', '123', '0', 'Order/index', '0', '', '', '0');

-- ----------------------------
-- Table structure for zc_menus
-- ----------------------------
DROP TABLE IF EXISTS `zc_menus`;
CREATE TABLE `zc_menus` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `pid` int(5) NOT NULL,
  `title` varchar(255) NOT NULL,
  `menu_state` tinyint(4) NOT NULL DEFAULT '1',
  `path` varchar(255) DEFAULT NULL,
  `menu_order` int(4) DEFAULT '1',
  `menu_type` varchar(64) DEFAULT NULL,
  `menu_value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zc_menus
-- ----------------------------
INSERT INTO `zc_menus` VALUES ('1', '0', '笔记本', '1', '/desktop/', '1', 'cid', '17');
INSERT INTO `zc_menus` VALUES ('2', '0', '手机', '1', '/phone/', '1', 'cid', '1');
INSERT INTO `zc_menus` VALUES ('3', '2', 'Iphone', '1', '/phone/iphone/', '1', 'cid', '16');
INSERT INTO `zc_menus` VALUES ('4', '1', '戴尔', '1', '/desktop/dell/', '1', 'cid', '19');
INSERT INTO `zc_menus` VALUES ('5', '2', '三星', '1', '', '2', 'cid', '18');
INSERT INTO `zc_menus` VALUES ('6', '0', '首页', '1', '/', '0', '', '');
INSERT INTO `zc_menus` VALUES ('7', '0', '电视机', '1', '', '4', 'cid', '19');
INSERT INTO `zc_menus` VALUES ('8', '7', '索尼', '1', '', '1', 'cid', '20');
INSERT INTO `zc_menus` VALUES ('9', '0', '相机', '1', '', '6', 'cid', '21');
INSERT INTO `zc_menus` VALUES ('10', '9', '佳能', '1', '', '1', 'cid', '22');
INSERT INTO `zc_menus` VALUES ('11', '0', '耳机', '1', '', '7', 'cid', '23');
INSERT INTO `zc_menus` VALUES ('12', '11', '铁三角', '1', '', '1', 'cid', '24');
INSERT INTO `zc_menus` VALUES ('13', '0', '3C配件', '1', '', '8', 'cid', '25');
INSERT INTO `zc_menus` VALUES ('14', '0', '联系我们', '1', '/home/index/contact', '15', '', '');
INSERT INTO `zc_menus` VALUES ('15', '13', '鼠标', '1', '', '1', 'cid', '27');
INSERT INTO `zc_menus` VALUES ('16', '13', '键盘', '1', '', '2', 'cid', '26');
INSERT INTO `zc_menus` VALUES ('17', '13', '音响', '1', '', '3', 'cid', '28');
INSERT INTO `zc_menus` VALUES ('18', '13', '体重秤', '1', '', '4', 'cid', '29');
INSERT INTO `zc_menus` VALUES ('19', '13', '手环', '1', '', '5', 'cid', '30');
INSERT INTO `zc_menus` VALUES ('20', '13', '充电宝', '1', '', '6', 'cid', '31');
INSERT INTO `zc_menus` VALUES ('21', '2', '诺基亚', '1', '', '3', 'cid', '32');
INSERT INTO `zc_menus` VALUES ('22', '0', '其他', '1', '', '9', 'cid', '34');
INSERT INTO `zc_menus` VALUES ('23', '22', '充值卡', '1', '', '1', 'cid', '35');

-- ----------------------------
-- Table structure for zc_model
-- ----------------------------
DROP TABLE IF EXISTS `zc_model`;
CREATE TABLE `zc_model` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '模型ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '模型标识',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '模型名称',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '继承的模型',
  `relation` varchar(30) NOT NULL DEFAULT '' COMMENT '继承与被继承模型的关联字段',
  `need_pk` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '新建表时是否需要主键字段',
  `field_sort` text NOT NULL COMMENT '表单字段排序',
  `field_group` varchar(255) NOT NULL DEFAULT '1:基础' COMMENT '字段分组',
  `attribute_list` text NOT NULL COMMENT '属性列表（表的字段）',
  `template_list` varchar(100) NOT NULL DEFAULT '' COMMENT '列表模板',
  `template_add` varchar(100) NOT NULL DEFAULT '' COMMENT '新增模板',
  `template_edit` varchar(100) NOT NULL DEFAULT '' COMMENT '编辑模板',
  `list_grid` text NOT NULL COMMENT '列表定义',
  `list_row` smallint(2) unsigned NOT NULL DEFAULT '10' COMMENT '列表数据长度',
  `search_key` varchar(50) NOT NULL DEFAULT '' COMMENT '默认搜索字段',
  `search_list` varchar(255) NOT NULL DEFAULT '' COMMENT '高级搜索的字段',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `engine_type` varchar(25) NOT NULL DEFAULT 'MyISAM' COMMENT '数据库引擎',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='文档模型表';

-- ----------------------------
-- Records of zc_model
-- ----------------------------
INSERT INTO `zc_model` VALUES ('1', 'document', '基础文档', '0', '', '1', '{\"1\":[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\"]}', '1:基础', '', '', '', '', 'id:编号\r\ntitle:标题:article/index?cate_id=[category_id]&pid=[id]\r\ntype|get_document_type:类型\r\nlevel:优先级\r\nupdate_time|time_format:最后更新\r\nstatus_text:状态\r\nview:浏览\r\nid:操作:[EDIT]&cate_id=[category_id]|编辑,article/setstatus?status=-1&ids=[id]|删除', '0', '', '', '1383891233', '1384507827', '1', 'MyISAM');
INSERT INTO `zc_model` VALUES ('2', 'article', '文章', '1', '', '1', '{\"1\":[\"3\",\"24\",\"2\",\"5\"],\"2\":[\"9\",\"13\",\"19\",\"10\",\"12\",\"16\",\"17\",\"26\",\"20\",\"14\",\"11\",\"25\"]}', '1:基础,2:扩展', '', '', '', '', 'id:编号\r\ntitle:标题:article/edit?cate_id=[category_id]&id=[id]\r\ncontent:内容', '0', '', '', '1383891243', '1387260622', '1', 'MyISAM');
INSERT INTO `zc_model` VALUES ('3', 'download', '下载', '1', '', '1', '{\"1\":[\"3\",\"28\",\"30\",\"32\",\"2\",\"5\",\"31\"],\"2\":[\"13\",\"10\",\"27\",\"9\",\"12\",\"16\",\"17\",\"19\",\"11\",\"20\",\"14\",\"29\"]}', '1:基础,2:扩展', '', '', '', '', 'id:编号\r\ntitle:标题', '0', '', '', '1383891252', '1387260449', '1', 'MyISAM');
INSERT INTO `zc_model` VALUES ('4', 'goods', '商品', '1', '', '1', '', '1:基础', '', '', '', '', '', '10', '', '', '1459608084', '1459608084', '1', 'InnoDB');

-- ----------------------------
-- Table structure for zc_order_goods
-- ----------------------------
DROP TABLE IF EXISTS `zc_order_goods`;
CREATE TABLE `zc_order_goods` (
  `rec_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_name` varchar(120) NOT NULL DEFAULT '',
  `goods_number` smallint(5) unsigned NOT NULL DEFAULT '1',
  `market_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `goods_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `goods_attr` text NOT NULL,
  `send_number` smallint(5) unsigned NOT NULL DEFAULT '0',
  `parent_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_attr_id` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`rec_id`),
  KEY `order_id` (`order_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zc_order_goods
-- ----------------------------
INSERT INTO `zc_order_goods` VALUES ('1', '1', '8', '飞利浦9@9v', '1', '478.79', '385.00', '颜色:黑 \n', '0', '0', '231');
INSERT INTO `zc_order_goods` VALUES ('2', '2', '12', '摩托罗拉A810', '1', '1179.60', '960.00', '', '0', '0', '');
INSERT INTO `zc_order_goods` VALUES ('3', '3', '17', '夏新N7', '1', '2760.00', '2300.00', '', '0', '0', '');
INSERT INTO `zc_order_goods` VALUES ('4', '4', '22', '多普达Touch HD', '1', '7198.80', '5999.00', '', '0', '0', '');
INSERT INTO `zc_order_goods` VALUES ('5', '5', '9', '诺基亚E66', '3', '2757.60', '2200.00', '', '0', '0', '');
INSERT INTO `zc_order_goods` VALUES ('6', '5', '24', 'P806', '1', '2400.00', '2000.00', '', '0', '0', '');
INSERT INTO `zc_order_goods` VALUES ('7', '6', '5', '索爱原装M2卡读卡器', '1', '24.00', '20.00', '', '0', '0', '');
INSERT INTO `zc_order_goods` VALUES ('8', '7', '9', '诺基亚E66', '1', '2757.60', '2298.00', '', '0', '0', '');
INSERT INTO `zc_order_goods` VALUES ('9', '8', '20', '三星BC01', '1', '336.00', '238.00', '', '0', '0', '');
INSERT INTO `zc_order_goods` VALUES ('10', '8', '8', '飞利浦9@9v', '1', '478.79', '385.00', '颜色:黑 \n', '0', '0', '231');
INSERT INTO `zc_order_goods` VALUES ('11', '9', '24', 'P806', '1', '2400.00', '2000.00', '', '0', '0', '');
INSERT INTO `zc_order_goods` VALUES ('12', '10', '24', 'P806', '1', '2400.00', '0.00', '', '0', '0', '');
INSERT INTO `zc_order_goods` VALUES ('13', '11', '23', '诺基亚N96', '1', '4440.00', '3800.00', '附加配件: 原装电池 [+100]', '0', '0', '');
INSERT INTO `zc_order_goods` VALUES ('14', '12', '20', '三星BC01', '1', '336.00', '238.00', '', '0', '0', '');
INSERT INTO `zc_order_goods` VALUES ('15', '13', '12', '摩托罗拉A810', '1', '1179.60', '960.00', '', '0', '0', '');
INSERT INTO `zc_order_goods` VALUES ('16', '14', '15', '摩托罗拉A810', '5', '705.60', '588.00', '', '0', '0', '');
INSERT INTO `zc_order_goods` VALUES ('17', '14', '20', '三星BC01', '1', '336.00', '238.00', '', '0', '0', '');
INSERT INTO `zc_order_goods` VALUES ('18', '14', '22', '多普达Touch HD', '1', '7198.80', '5999.00', '', '0', '0', '');
INSERT INTO `zc_order_goods` VALUES ('19', '14', '3', '诺基亚原装5800耳机', '4', '81.60', '68.00', '颜色:银色 \n', '0', '0', '');
INSERT INTO `zc_order_goods` VALUES ('20', '14', '9', '诺基亚E66', '2', '2757.60', '2298.00', '', '0', '0', '');
INSERT INTO `zc_order_goods` VALUES ('21', '15', '13', '诺基亚5320 XpressMusic', '3', '1583.20', '1210.00', '颜色:红[10] \n', '0', '0', '');
INSERT INTO `zc_order_goods` VALUES ('22', '15', '14', '诺基亚5800XM', '1', '3150.00', '2493.75', '', '0', '0', '');
INSERT INTO `zc_order_goods` VALUES ('23', '15', '24', 'P806', '4', '2400.00', '1900.00', '', '0', '0', '');
INSERT INTO `zc_order_goods` VALUES ('24', '15', '9', '诺基亚E66', '1', '2757.60', '2183.10', '', '0', '0', '');
INSERT INTO `zc_order_goods` VALUES ('25', '15', '8', '飞利浦9@9v', '3', '478.79', '379.05', '颜色:黑 \n', '0', '0', '231');
INSERT INTO `zc_order_goods` VALUES ('26', '16', '12', '摩托罗拉A810', '2', '1179.60', '933.85', '', '2', '0', '');
INSERT INTO `zc_order_goods` VALUES ('27', '16', '1', 'KD876', '1', '1665.60', '1318.60', '', '0', '0', '');
INSERT INTO `zc_order_goods` VALUES ('28', '17', '24', 'P806', '1', '2400.00', '1900.00', '', '0', '0', '');
INSERT INTO `zc_order_goods` VALUES ('29', '18', '24', 'P806', '5', '2400.00', '100.00', '', '0', '0', '');
INSERT INTO `zc_order_goods` VALUES ('30', '19', '12', '摩托罗拉A810', '2', '1179.60', '933.85', '', '2', '0', '');
INSERT INTO `zc_order_goods` VALUES ('31', '19', '24', 'P806', '2', '2400.00', '1850.00', '颜色:灰色 \n', '2', '0', '167');

-- ----------------------------
-- Table structure for zc_order_info
-- ----------------------------
DROP TABLE IF EXISTS `zc_order_info`;
CREATE TABLE `zc_order_info` (
  `order_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `order_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '订单状态',
  `shipping_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '配送状态',
  `pay_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '支付状态',
  `consignee` varchar(60) NOT NULL DEFAULT '' COMMENT '收货人',
  `country` smallint(5) unsigned NOT NULL DEFAULT '0',
  `province` smallint(5) unsigned NOT NULL DEFAULT '0',
  `city` smallint(5) unsigned NOT NULL DEFAULT '0',
  `district` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '区',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '详细地址',
  `zipcode` varchar(60) NOT NULL DEFAULT '' COMMENT '邮政编码',
  `tel` varchar(60) NOT NULL DEFAULT '',
  `mobile` varchar(60) NOT NULL DEFAULT '',
  `email` varchar(60) NOT NULL DEFAULT '',
  `best_time` varchar(120) NOT NULL DEFAULT '' COMMENT '最佳配送时间',
  `shipping_id` tinyint(3) NOT NULL DEFAULT '0' COMMENT '运单号',
  `shipping_name` varchar(120) NOT NULL DEFAULT '',
  `pay_id` tinyint(3) NOT NULL DEFAULT '0' COMMENT '支付方式',
  `pay_name` varchar(120) NOT NULL DEFAULT '',
  `goods_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `shipping_fee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '运费',
  `pay_fee` decimal(10,2) NOT NULL DEFAULT '0.00',
  `order_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单总计价格',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `confirm_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '确认时间',
  `pay_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '支付时间',
  `discount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '折扣',
  PRIMARY KEY (`order_id`),
  KEY `user_id` (`user_id`),
  KEY `order_status` (`order_status`),
  KEY `shipping_status` (`shipping_status`),
  KEY `pay_status` (`pay_status`),
  KEY `shipping_id` (`shipping_id`),
  KEY `pay_id` (`pay_id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zc_order_info
-- ----------------------------
INSERT INTO `zc_order_info` VALUES ('1', '1', '1', '2', '2', '刘先生', '1', '2', '52', '500', '[中国 北京 北京 海淀区] 中关村海兴大厦', '100085', '010-25851234', '13986765412', 'ecshop@ecshop.com', '中午', '5', '申通快递', '1', '余额支付', '385.00', '15.00', '0.00', '0.00', '1242142274', '1242142274', '1242142274', '0.00');
INSERT INTO `zc_order_info` VALUES ('2', '1', '4', '0', '0', '刘先生', '1', '2', '52', '500', '[中国 北京 北京 海淀区] 中关村海兴大厦', '100085', '010-25851234', '13986765412', 'ecshop@ecshop.com', '中午', '3', '城际快递', '1', '余额支付', '960.00', '10.00', '0.00', '0.00', '1242142324', '1242142324', '1242142324', '0.00');
INSERT INTO `zc_order_info` VALUES ('3', '1', '4', '0', '0', '刘先生', '1', '2', '52', '500', '[中国 北京 北京 海淀区] 中关村海兴大厦', '100085', '010-25851234', '13986765412', 'ecshop@ecshop.com', '中午', '3', '城际快递', '1', '余额支付', '2300.00', '10.00', '0.00', '0.00', '1242142549', '1242142549', '1242142549', '0.00');
INSERT INTO `zc_order_info` VALUES ('4', '1', '1', '0', '2', '刘先生', '1', '2', '52', '500', '[中国 北京 北京 海淀区] 中关村海兴大厦', '100085', '010-25851234', '13986765412', 'ecshop@ecshop.com', '中午', '3', '城际快递', '1', '余额支付', '5999.00', '10.00', '0.00', '0.00', '1242142681', '1242142681', '1242142681', '0.00');
INSERT INTO `zc_order_info` VALUES ('5', '1', '1', '3', '2', '刘先生', '1', '2', '52', '500', '[中国 北京 北京 海淀区] 中关村海兴大厦', '100085', '010-25851234', '13986765412', 'ecshop@ecshop.com', '中午', '3', '城际快递', '1', '余额支付', '8600.00', '10.00', '0.00', '0.00', '1242142808', '1242142808', '1242142808', '0.00');
INSERT INTO `zc_order_info` VALUES ('6', '3', '3', '0', '0', '叶先生', '1', '2', '52', '510', '通州区旗舰凯旋小区', '', '13588104710', '', 'text@ecshop.com', '', '5', '申通快递', '2', '银行汇款/转帐', '20.00', '15.00', '0.00', '35.00', '1242143292', '0', '0', '0.00');
INSERT INTO `zc_order_info` VALUES ('7', '3', '1', '0', '0', '叶先生', '1', '2', '52', '510', '通州区旗舰凯旋小区', '', '13588104710', '', 'text@ecshop.com', '', '5', '申通快递', '2', '银行汇款/转帐', '2298.00', '15.00', '0.00', '1198.10', '1242143383', '1242143454', '0', '114.90');
INSERT INTO `zc_order_info` VALUES ('8', '3', '0', '0', '0', '叶先生', '1', '2', '52', '510', '通州区旗舰凯旋小区', '', '13588104710', '', 'text@ecshop.com', '', '5', '申通快递', '2', '银行汇款/转帐', '623.00', '15.00', '0.00', '638.00', '1242143444', '0', '0', '0.00');
INSERT INTO `zc_order_info` VALUES ('9', '3', '0', '0', '0', '叶先生', '1', '2', '52', '510', '通州区旗舰凯旋小区', '', '13588104710', '', 'text@ecshop.com', '', '5', '申通快递', '2', '银行汇款/转帐', '2000.00', '15.00', '0.00', '2015.00', '1242143732', '0', '0', '0.00');
INSERT INTO `zc_order_info` VALUES ('10', '1', '1', '0', '2', '刘先生', '1', '2', '52', '500', '海兴大厦', '', '010-25851234', '13986765412', 'ecshop@ecshop.com', '', '3', '城际快递', '1', '余额支付', '0.00', '10.00', '0.00', '0.00', '1242143920', '1242143920', '1242143920', '0.00');
INSERT INTO `zc_order_info` VALUES ('11', '1', '1', '0', '0', '林小姐', '1', '2', '52', '500', '中关村海兴大厦', '', '135474510', '', 'linzi@116.com', '', '3', '城际快递', '2', '银行汇款/转帐', '3800.00', '10.00', '0.00', '3810.00', '1242144250', '1242144363', '0', '0.00');
INSERT INTO `zc_order_info` VALUES ('12', '1', '2', '0', '0', '刘先生', '1', '2', '52', '502', '海兴大厦', '', '010-25851234', '13986765412', 'ecshop@ecshop.com', '', '3', '城际快递', '3', '货到付款', '238.00', '10.00', '5.00', '253.00', '1242576304', '0', '0', '0.00');
INSERT INTO `zc_order_info` VALUES ('13', '1', '1', '1', '0', '刘先生', '1', '2', '52', '502', '海兴大厦', '', '010-25851234', '13986765412', 'ecshop@ecshop.com', '', '3', '城际快递', '3', '货到付款', '960.00', '10.00', '5.00', '975.00', '1242576341', '1242576445', '0', '0.00');
INSERT INTO `zc_order_info` VALUES ('14', '1', '1', '1', '2', '刘先生', '1', '2', '52', '502', '海兴大厦', '', '010-25851234', '13986765412', 'ecshop@ecshop.com', '', '3', '城际快递', '1', '余额支付', '14045.00', '10.00', '0.00', '0.00', '1242976699', '1242976699', '1242976699', '243.40');
INSERT INTO `zc_order_info` VALUES ('15', '1', '4', '0', '0', '刘先生', '1', '2', '52', '502', '海兴大厦', '', '010-25851234', '13986765412', 'ecshop@ecshop.com', '', '3', '城际快递', '2', '银行汇款/转帐', '17044.00', '10.00', '0.00', '17054.00', '1245044533', '1245044587', '1245044644', '0.00');
INSERT INTO `zc_order_info` VALUES ('16', '1', '1', '4', '2', '刘先生', '1', '2', '52', '502', '海兴大厦', '', '010-25851234', '13986765412', 'ecshop@ecshop.com', '', '3', '城际快递', '1', '余额支付', '3186.30', '10.00', '0.00', '0.00', '1245045672', '1245045672', '1245045672', '0.00');
INSERT INTO `zc_order_info` VALUES ('17', '1', '4', '0', '0', '刘先生', '1', '2', '52', '502', '海兴大厦', '', '010-25851234', '13986765412', 'ecshop@ecshop.com', '', '3', '城际快递', '1', '余额支付', '1900.00', '10.00', '0.00', '0.00', '1245047978', '1245047978', '1245047978', '0.00');
INSERT INTO `zc_order_info` VALUES ('18', '1', '1', '0', '2', '刘先生', '1', '2', '52', '502', '海兴大厦', '', '010-25851234', '13986765412', 'ecshop@ecshop.com', '', '3', '城际快递', '1', '余额支付', '500.00', '10.00', '0.00', '0.00', '1245048585', '1245048585', '1245048585', '0.00');
INSERT INTO `zc_order_info` VALUES ('19', '1', '1', '1', '2', '刘先生', '1', '2', '52', '502', '海兴大厦', '', '010-25851234', '13986765412', 'ecshop@ecshop.com', '', '3', '城际快递', '1', '余额支付', '5567.70', '10.00', '0.00', '0.00', '1245384008', '1245384008', '1245384008', '0.00');

-- ----------------------------
-- Table structure for zc_picture
-- ----------------------------
DROP TABLE IF EXISTS `zc_picture`;
CREATE TABLE `zc_picture` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id自增',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '路径',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片链接',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zc_picture
-- ----------------------------
INSERT INTO `zc_picture` VALUES ('38', '/Uploads/Images/20160506/572ca2d4876eb.jpg', '', 'fdbb9fed12753de4ecf87f99df85a4c3', 'e1de773df96c7611c5b8e66ce6e81ca5bcb5ec2d', '1', '1462543060');
INSERT INTO `zc_picture` VALUES ('39', '/Uploads/Images/20160506/572ca2d49f448.jpg', '', 'b99285d9c513a46b17ce029a08c6f10d', '3b520e392f054f415adcf07d11fe7b1966e9a161', '1', '1462543060');
INSERT INTO `zc_picture` VALUES ('40', '/Uploads/Images/20160506/572ca2d4b3bec.jpg', '', '62d281ddbd0bccc2148cd888f6fa221f', '2f8e499979cc9399cdacd9189286b157b9129d35', '1', '1462543060');
INSERT INTO `zc_picture` VALUES ('41', '/Uploads/Images/20160506/572ca2d4c9ea5.jpg', '', 'c573a12cf2babd63106e8c5a14d92384', 'd9c66e817302c42637daf8aef5f75a7804fb17c1', '1', '1462543060');
INSERT INTO `zc_picture` VALUES ('42', '/Uploads/Images/20160506/572ca2d4ebe8a.jpg', '', '081886e998494a7f324a01d5ad57565a', '435004f8f2aaa6b1425f5a46afe1f6d3d44334f8', '1', '1462543060');
INSERT INTO `zc_picture` VALUES ('43', '/Uploads/Images/20160506/572ca2d50a49a.png', '', 'ac5b0f456c32f053ae4b9c9d68dd4579', '0777d567949589c6d88e16f59fa3ac5dee0daace', '1', '1462543060');
INSERT INTO `zc_picture` VALUES ('44', '/Uploads/Images/20160506/572ca2d51a18c.jpg', '', '9652e95d9953cd163bf88e65b5242666', 'cd7dc2a25c9464603eb5b8f00900fa015d654a20', '1', '1462543060');
INSERT INTO `zc_picture` VALUES ('45', '/Uploads/Images/20160506/572ca2d5270de.jpg', '', '18e272b7ae00e894c3c8d57a67481abb', '3065d4dc515bb2827299326092a9ada33509727e', '1', '1462543061');
INSERT INTO `zc_picture` VALUES ('46', '/Uploads/Images/20160507/572d78e486f1f.jpg', '', 'ad4fa1728d72f10e5c2ff95e3087001c', '596fa87c83d1363329d9e01948706f7acb541fe3', '1', '1462597860');
INSERT INTO `zc_picture` VALUES ('47', '/Uploads/Images/20160507/572d78e4a4343.jpg', '', '55c5516cb9e6fac422e3a2306247f527', '85cc946deaf9029e1607e2b47ef6d110b3679696', '1', '1462597860');
INSERT INTO `zc_picture` VALUES ('48', '/Uploads/Images/20160507/572d78e4ee30c.jpg', '', '26f7343b342382a4e018a2fcd0a125d2', 'a21022eef219d426c87f6dd58a8d430bbb6fdea8', '1', '1462597860');
INSERT INTO `zc_picture` VALUES ('49', '/Uploads/Images/20160507/572d78e513648.jpg', '', '5f95eda00eac2a6cc7ab6f4fa342e950', '402f39d46b8771eb5c88b1d3b71c97bde86efd80', '1', '1462597860');
INSERT INTO `zc_picture` VALUES ('50', '/Uploads/Images/20160507/572d78e5258e8.jpg', '', '5418096a15e02d072c941eaa23251aee', '79e59f7ca49483c12dbc7ae358a02ceed97e4399', '1', '1462597861');
INSERT INTO `zc_picture` VALUES ('51', '/Uploads/Images/20160507/572d78e545085.jpg', '', 'e36a78f9c5f8e01de59ce6fe115c5a6b', 'b20d90875cc51fb9fd080ddbfd25e463519d30a1', '1', '1462597861');
INSERT INTO `zc_picture` VALUES ('52', '/Uploads/Images/20160507/572d82e97b589.jpg', '', '2c332eb2a62769d8373226c4fb5a1169', '7c54305a6db3c13352c1322183d9df386d466f6e', '1', '1462600425');
INSERT INTO `zc_picture` VALUES ('53', '/Uploads/Images/20160507/572d83caddd5d.jpg', '', '27cca12a8cfed9e88d9d2d0ca302329e', 'c16aac73da7881cbdb4b030ef62ce57ede96ffe2', '1', '1462600650');
INSERT INTO `zc_picture` VALUES ('54', '/Uploads/Images/20160507/572d89e83299f.jpg', '', '0f696d9c125707d57db998bd6803a2b1', 'ac4fbd337bf84d888f8ffc58ac5bd15c218e19bb', '1', '1462602216');
INSERT INTO `zc_picture` VALUES ('55', '/Uploads/Images/20160507/572d89e85d923.jpg', '', 'f21482b8821928c0c57089bfba800566', '99c65f84d3c60cadc1f06cda3375a5b79ff0a4d7', '1', '1462602216');
INSERT INTO `zc_picture` VALUES ('56', '/Uploads/Images/20160507/572d89e87a3b2.jpg', '', '4f79799e611967423d3da55a7752b187', '1a5e7e05cd70d09fa777672f2a36d690dd659fa5', '1', '1462602216');
INSERT INTO `zc_picture` VALUES ('57', '/Uploads/Images/20160507/572d96edee969.jpg', '', '490c325c88bd8a7397f9a00b3a926986', '9dfbb4b9dbeabfe4ae4de047d2c89137d6f981f8', '1', '1462605549');
INSERT INTO `zc_picture` VALUES ('58', '/Uploads/Images/20160507/572d96ee11c6f.jpg', '', '6c85e6421d2eee1c116069a64c148328', '4da154c83bd51130aac5217fd26a901afce74f3c', '1', '1462605549');
INSERT INTO `zc_picture` VALUES ('59', '/Uploads/Images/20160507/572d96ee29eff.jpg', '', '200032102c95efffc94c748281221336', '475d166eccaecc1cb752970688181082e33984d1', '1', '1462605550');
INSERT INTO `zc_picture` VALUES ('60', '/Uploads/Images/20160507/572d96ee4433a.jpg', '', '68c6db01aaa3b6f2a84d6d53ec40cfa2', '7aa64d7b0bd0143fdb5b3d037367c562094a7579', '1', '1462605550');
INSERT INTO `zc_picture` VALUES ('61', '/Uploads/Images/20160507/572da2cb9c1b6.jpg', '', 'c3d63137d91d0c8ad13749e395a80a13', '9967380299cccb9dce19760d169baea9079c2367', '1', '1462608587');
INSERT INTO `zc_picture` VALUES ('62', '/Uploads/Images/20160507/572da2cbcaee3.jpg', '', 'b90148193e95c87b724b49e60e766596', '76a934e98268f88d750c64dd1e624a38d6b96685', '1', '1462608587');
INSERT INTO `zc_picture` VALUES ('63', '/Uploads/Images/20160507/572da2cbebe5d.jpg', '', '8428ca6c38e4cc4730808496cc905836', 'd5f2492a8ad99f497e390b4b6965f1b64f19607f', '1', '1462608587');
INSERT INTO `zc_picture` VALUES ('64', '/Uploads/Images/20160507/572da2cc0abda.jpg', '', '81e20a1689be83cd6dc83da7e1e20762', 'cbf4cf053c825b31026fb658a07590cb3b92c754', '1', '1462608587');
INSERT INTO `zc_picture` VALUES ('65', '/Uploads/Images/20160507/572da2cc1d88a.jpg', '', 'f3ce1a47f0b2f150eb3da6df70bad9df', 'acf9f7085d0e81bad8471a6f0bb97b03a56644be', '1', '1462608587');
INSERT INTO `zc_picture` VALUES ('66', '/Uploads/Images/20160507/572da4429b8b2.jpg', '', '409832396c1bfdbfcd344720e37992a0', 'e70eb4afdc33101bc7101c80c0cc7de4a0be2d00', '1', '1462608962');
INSERT INTO `zc_picture` VALUES ('67', '/Uploads/Images/20160507/572da442b852c.jpg', '', '298723fb9220660ddebf584abc0437e6', '092cc2a1fb81e32486a06688eb92c652581a251d', '1', '1462608962');
INSERT INTO `zc_picture` VALUES ('68', '/Uploads/Images/20160507/572da442ce5c0.jpg', '', '461d1a143476cbcc8298771e46e232d6', 'f3a39cfadd90f927afe480f0c3e428ac76a7734b', '1', '1462608962');
INSERT INTO `zc_picture` VALUES ('69', '/Uploads/Images/20160507/572da44306ec0.jpg', '', '2d52d19f1557ad9e68c8ec6efaf33201', '3b7d74d1d9725d62fca2e242c683f7729e36fd1b', '1', '1462608962');
INSERT INTO `zc_picture` VALUES ('70', '/Uploads/Images/20160507/572da50721691.jpg', '', '97668650805565e52bd5d3c456a2b4a6', '392f4728156a606b0c9aeb2d4df909031db2c668', '1', '1462609159');
INSERT INTO `zc_picture` VALUES ('71', '/Uploads/Images/20160507/572da79194880.jpg', '', '2fce450cedf69caed51cbe17b5525c41', 'b4dc8857efd7ed4c678ac83de8c436d5d1309310', '1', '1462609809');
INSERT INTO `zc_picture` VALUES ('72', '/Uploads/Images/20160507/572da791add34.jpg', '', 'c40c6631d4dc829b5665b9ae4f31a61a', '6ebde8d5c76754bb9d3b8a36f9b52f7be81a7b23', '1', '1462609809');
INSERT INTO `zc_picture` VALUES ('73', '/Uploads/Images/20160507/572de58dafb0e.jpg', '', '16dcd0a5af8b2e9ed5af5853268ad32d', 'b1542522287f3199dc5a252759c7fb90ecec67eb', '1', '1462625677');

-- ----------------------------
-- Table structure for zc_region
-- ----------------------------
DROP TABLE IF EXISTS `zc_region`;
CREATE TABLE `zc_region` (
  `region_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `region_name` varchar(120) NOT NULL DEFAULT '',
  `region_type` tinyint(1) NOT NULL DEFAULT '2',
  `agency_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`region_id`),
  KEY `parent_id` (`parent_id`),
  KEY `region_type` (`region_type`),
  KEY `agency_id` (`agency_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3409 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zc_region
-- ----------------------------
INSERT INTO `zc_region` VALUES ('1', '0', '中国', '0', '0');
INSERT INTO `zc_region` VALUES ('2', '1', '北京', '1', '0');
INSERT INTO `zc_region` VALUES ('3', '1', '安徽', '1', '0');
INSERT INTO `zc_region` VALUES ('4', '1', '福建', '1', '0');
INSERT INTO `zc_region` VALUES ('5', '1', '甘肃', '1', '0');
INSERT INTO `zc_region` VALUES ('6', '1', '广东', '1', '0');
INSERT INTO `zc_region` VALUES ('7', '1', '广西', '1', '0');
INSERT INTO `zc_region` VALUES ('8', '1', '贵州', '1', '0');
INSERT INTO `zc_region` VALUES ('9', '1', '海南', '1', '0');
INSERT INTO `zc_region` VALUES ('10', '1', '河北', '1', '0');
INSERT INTO `zc_region` VALUES ('11', '1', '河南', '1', '0');
INSERT INTO `zc_region` VALUES ('12', '1', '黑龙江', '1', '0');
INSERT INTO `zc_region` VALUES ('13', '1', '湖北', '1', '0');
INSERT INTO `zc_region` VALUES ('14', '1', '湖南', '1', '0');
INSERT INTO `zc_region` VALUES ('15', '1', '吉林', '1', '0');
INSERT INTO `zc_region` VALUES ('16', '1', '江苏', '1', '0');
INSERT INTO `zc_region` VALUES ('17', '1', '江西', '1', '0');
INSERT INTO `zc_region` VALUES ('18', '1', '辽宁', '1', '0');
INSERT INTO `zc_region` VALUES ('19', '1', '内蒙古', '1', '0');
INSERT INTO `zc_region` VALUES ('20', '1', '宁夏', '1', '0');
INSERT INTO `zc_region` VALUES ('21', '1', '青海', '1', '0');
INSERT INTO `zc_region` VALUES ('22', '1', '山东', '1', '0');
INSERT INTO `zc_region` VALUES ('23', '1', '山西', '1', '0');
INSERT INTO `zc_region` VALUES ('24', '1', '陕西', '1', '0');
INSERT INTO `zc_region` VALUES ('25', '1', '上海', '1', '0');
INSERT INTO `zc_region` VALUES ('26', '1', '四川', '1', '0');
INSERT INTO `zc_region` VALUES ('27', '1', '天津', '1', '0');
INSERT INTO `zc_region` VALUES ('28', '1', '西藏', '1', '0');
INSERT INTO `zc_region` VALUES ('29', '1', '新疆', '1', '0');
INSERT INTO `zc_region` VALUES ('30', '1', '云南', '1', '0');
INSERT INTO `zc_region` VALUES ('31', '1', '浙江', '1', '0');
INSERT INTO `zc_region` VALUES ('32', '1', '重庆', '1', '0');
INSERT INTO `zc_region` VALUES ('33', '1', '香港', '1', '0');
INSERT INTO `zc_region` VALUES ('34', '1', '澳门', '1', '0');
INSERT INTO `zc_region` VALUES ('35', '1', '台湾', '1', '0');
INSERT INTO `zc_region` VALUES ('36', '3', '安庆', '2', '0');
INSERT INTO `zc_region` VALUES ('37', '3', '蚌埠', '2', '0');
INSERT INTO `zc_region` VALUES ('38', '3', '巢湖', '2', '0');
INSERT INTO `zc_region` VALUES ('39', '3', '池州', '2', '0');
INSERT INTO `zc_region` VALUES ('40', '3', '滁州', '2', '0');
INSERT INTO `zc_region` VALUES ('41', '3', '阜阳', '2', '0');
INSERT INTO `zc_region` VALUES ('42', '3', '淮北', '2', '0');
INSERT INTO `zc_region` VALUES ('43', '3', '淮南', '2', '0');
INSERT INTO `zc_region` VALUES ('44', '3', '黄山', '2', '0');
INSERT INTO `zc_region` VALUES ('45', '3', '六安', '2', '0');
INSERT INTO `zc_region` VALUES ('46', '3', '马鞍山', '2', '0');
INSERT INTO `zc_region` VALUES ('47', '3', '宿州', '2', '0');
INSERT INTO `zc_region` VALUES ('48', '3', '铜陵', '2', '0');
INSERT INTO `zc_region` VALUES ('49', '3', '芜湖', '2', '0');
INSERT INTO `zc_region` VALUES ('50', '3', '宣城', '2', '0');
INSERT INTO `zc_region` VALUES ('51', '3', '亳州', '2', '0');
INSERT INTO `zc_region` VALUES ('52', '2', '北京', '2', '0');
INSERT INTO `zc_region` VALUES ('53', '4', '福州', '2', '0');
INSERT INTO `zc_region` VALUES ('54', '4', '龙岩', '2', '0');
INSERT INTO `zc_region` VALUES ('55', '4', '南平', '2', '0');
INSERT INTO `zc_region` VALUES ('56', '4', '宁德', '2', '0');
INSERT INTO `zc_region` VALUES ('57', '4', '莆田', '2', '0');
INSERT INTO `zc_region` VALUES ('58', '4', '泉州', '2', '0');
INSERT INTO `zc_region` VALUES ('59', '4', '三明', '2', '0');
INSERT INTO `zc_region` VALUES ('60', '4', '厦门', '2', '0');
INSERT INTO `zc_region` VALUES ('61', '4', '漳州', '2', '0');
INSERT INTO `zc_region` VALUES ('62', '5', '兰州', '2', '0');
INSERT INTO `zc_region` VALUES ('63', '5', '白银', '2', '0');
INSERT INTO `zc_region` VALUES ('64', '5', '定西', '2', '0');
INSERT INTO `zc_region` VALUES ('65', '5', '甘南', '2', '0');
INSERT INTO `zc_region` VALUES ('66', '5', '嘉峪关', '2', '0');
INSERT INTO `zc_region` VALUES ('67', '5', '金昌', '2', '0');
INSERT INTO `zc_region` VALUES ('68', '5', '酒泉', '2', '0');
INSERT INTO `zc_region` VALUES ('69', '5', '临夏', '2', '0');
INSERT INTO `zc_region` VALUES ('70', '5', '陇南', '2', '0');
INSERT INTO `zc_region` VALUES ('71', '5', '平凉', '2', '0');
INSERT INTO `zc_region` VALUES ('72', '5', '庆阳', '2', '0');
INSERT INTO `zc_region` VALUES ('73', '5', '天水', '2', '0');
INSERT INTO `zc_region` VALUES ('74', '5', '武威', '2', '0');
INSERT INTO `zc_region` VALUES ('75', '5', '张掖', '2', '0');
INSERT INTO `zc_region` VALUES ('76', '6', '广州', '2', '0');
INSERT INTO `zc_region` VALUES ('77', '6', '深圳', '2', '0');
INSERT INTO `zc_region` VALUES ('78', '6', '潮州', '2', '0');
INSERT INTO `zc_region` VALUES ('79', '6', '东莞', '2', '0');
INSERT INTO `zc_region` VALUES ('80', '6', '佛山', '2', '0');
INSERT INTO `zc_region` VALUES ('81', '6', '河源', '2', '0');
INSERT INTO `zc_region` VALUES ('82', '6', '惠州', '2', '0');
INSERT INTO `zc_region` VALUES ('83', '6', '江门', '2', '0');
INSERT INTO `zc_region` VALUES ('84', '6', '揭阳', '2', '0');
INSERT INTO `zc_region` VALUES ('85', '6', '茂名', '2', '0');
INSERT INTO `zc_region` VALUES ('86', '6', '梅州', '2', '0');
INSERT INTO `zc_region` VALUES ('87', '6', '清远', '2', '0');
INSERT INTO `zc_region` VALUES ('88', '6', '汕头', '2', '0');
INSERT INTO `zc_region` VALUES ('89', '6', '汕尾', '2', '0');
INSERT INTO `zc_region` VALUES ('90', '6', '韶关', '2', '0');
INSERT INTO `zc_region` VALUES ('91', '6', '阳江', '2', '0');
INSERT INTO `zc_region` VALUES ('92', '6', '云浮', '2', '0');
INSERT INTO `zc_region` VALUES ('93', '6', '湛江', '2', '0');
INSERT INTO `zc_region` VALUES ('94', '6', '肇庆', '2', '0');
INSERT INTO `zc_region` VALUES ('95', '6', '中山', '2', '0');
INSERT INTO `zc_region` VALUES ('96', '6', '珠海', '2', '0');
INSERT INTO `zc_region` VALUES ('97', '7', '南宁', '2', '0');
INSERT INTO `zc_region` VALUES ('98', '7', '桂林', '2', '0');
INSERT INTO `zc_region` VALUES ('99', '7', '百色', '2', '0');
INSERT INTO `zc_region` VALUES ('100', '7', '北海', '2', '0');
INSERT INTO `zc_region` VALUES ('101', '7', '崇左', '2', '0');
INSERT INTO `zc_region` VALUES ('102', '7', '防城港', '2', '0');
INSERT INTO `zc_region` VALUES ('103', '7', '贵港', '2', '0');
INSERT INTO `zc_region` VALUES ('104', '7', '河池', '2', '0');
INSERT INTO `zc_region` VALUES ('105', '7', '贺州', '2', '0');
INSERT INTO `zc_region` VALUES ('106', '7', '来宾', '2', '0');
INSERT INTO `zc_region` VALUES ('107', '7', '柳州', '2', '0');
INSERT INTO `zc_region` VALUES ('108', '7', '钦州', '2', '0');
INSERT INTO `zc_region` VALUES ('109', '7', '梧州', '2', '0');
INSERT INTO `zc_region` VALUES ('110', '7', '玉林', '2', '0');
INSERT INTO `zc_region` VALUES ('111', '8', '贵阳', '2', '0');
INSERT INTO `zc_region` VALUES ('112', '8', '安顺', '2', '0');
INSERT INTO `zc_region` VALUES ('113', '8', '毕节', '2', '0');
INSERT INTO `zc_region` VALUES ('114', '8', '六盘水', '2', '0');
INSERT INTO `zc_region` VALUES ('115', '8', '黔东南', '2', '0');
INSERT INTO `zc_region` VALUES ('116', '8', '黔南', '2', '0');
INSERT INTO `zc_region` VALUES ('117', '8', '黔西南', '2', '0');
INSERT INTO `zc_region` VALUES ('118', '8', '铜仁', '2', '0');
INSERT INTO `zc_region` VALUES ('119', '8', '遵义', '2', '0');
INSERT INTO `zc_region` VALUES ('120', '9', '海口', '2', '0');
INSERT INTO `zc_region` VALUES ('121', '9', '三亚', '2', '0');
INSERT INTO `zc_region` VALUES ('122', '9', '白沙', '2', '0');
INSERT INTO `zc_region` VALUES ('123', '9', '保亭', '2', '0');
INSERT INTO `zc_region` VALUES ('124', '9', '昌江', '2', '0');
INSERT INTO `zc_region` VALUES ('125', '9', '澄迈县', '2', '0');
INSERT INTO `zc_region` VALUES ('126', '9', '定安县', '2', '0');
INSERT INTO `zc_region` VALUES ('127', '9', '东方', '2', '0');
INSERT INTO `zc_region` VALUES ('128', '9', '乐东', '2', '0');
INSERT INTO `zc_region` VALUES ('129', '9', '临高县', '2', '0');
INSERT INTO `zc_region` VALUES ('130', '9', '陵水', '2', '0');
INSERT INTO `zc_region` VALUES ('131', '9', '琼海', '2', '0');
INSERT INTO `zc_region` VALUES ('132', '9', '琼中', '2', '0');
INSERT INTO `zc_region` VALUES ('133', '9', '屯昌县', '2', '0');
INSERT INTO `zc_region` VALUES ('134', '9', '万宁', '2', '0');
INSERT INTO `zc_region` VALUES ('135', '9', '文昌', '2', '0');
INSERT INTO `zc_region` VALUES ('136', '9', '五指山', '2', '0');
INSERT INTO `zc_region` VALUES ('137', '9', '儋州', '2', '0');
INSERT INTO `zc_region` VALUES ('138', '10', '石家庄', '2', '0');
INSERT INTO `zc_region` VALUES ('139', '10', '保定', '2', '0');
INSERT INTO `zc_region` VALUES ('140', '10', '沧州', '2', '0');
INSERT INTO `zc_region` VALUES ('141', '10', '承德', '2', '0');
INSERT INTO `zc_region` VALUES ('142', '10', '邯郸', '2', '0');
INSERT INTO `zc_region` VALUES ('143', '10', '衡水', '2', '0');
INSERT INTO `zc_region` VALUES ('144', '10', '廊坊', '2', '0');
INSERT INTO `zc_region` VALUES ('145', '10', '秦皇岛', '2', '0');
INSERT INTO `zc_region` VALUES ('146', '10', '唐山', '2', '0');
INSERT INTO `zc_region` VALUES ('147', '10', '邢台', '2', '0');
INSERT INTO `zc_region` VALUES ('148', '10', '张家口', '2', '0');
INSERT INTO `zc_region` VALUES ('149', '11', '郑州', '2', '0');
INSERT INTO `zc_region` VALUES ('150', '11', '洛阳', '2', '0');
INSERT INTO `zc_region` VALUES ('151', '11', '开封', '2', '0');
INSERT INTO `zc_region` VALUES ('152', '11', '安阳', '2', '0');
INSERT INTO `zc_region` VALUES ('153', '11', '鹤壁', '2', '0');
INSERT INTO `zc_region` VALUES ('154', '11', '济源', '2', '0');
INSERT INTO `zc_region` VALUES ('155', '11', '焦作', '2', '0');
INSERT INTO `zc_region` VALUES ('156', '11', '南阳', '2', '0');
INSERT INTO `zc_region` VALUES ('157', '11', '平顶山', '2', '0');
INSERT INTO `zc_region` VALUES ('158', '11', '三门峡', '2', '0');
INSERT INTO `zc_region` VALUES ('159', '11', '商丘', '2', '0');
INSERT INTO `zc_region` VALUES ('160', '11', '新乡', '2', '0');
INSERT INTO `zc_region` VALUES ('161', '11', '信阳', '2', '0');
INSERT INTO `zc_region` VALUES ('162', '11', '许昌', '2', '0');
INSERT INTO `zc_region` VALUES ('163', '11', '周口', '2', '0');
INSERT INTO `zc_region` VALUES ('164', '11', '驻马店', '2', '0');
INSERT INTO `zc_region` VALUES ('165', '11', '漯河', '2', '0');
INSERT INTO `zc_region` VALUES ('166', '11', '濮阳', '2', '0');
INSERT INTO `zc_region` VALUES ('167', '12', '哈尔滨', '2', '0');
INSERT INTO `zc_region` VALUES ('168', '12', '大庆', '2', '0');
INSERT INTO `zc_region` VALUES ('169', '12', '大兴安岭', '2', '0');
INSERT INTO `zc_region` VALUES ('170', '12', '鹤岗', '2', '0');
INSERT INTO `zc_region` VALUES ('171', '12', '黑河', '2', '0');
INSERT INTO `zc_region` VALUES ('172', '12', '鸡西', '2', '0');
INSERT INTO `zc_region` VALUES ('173', '12', '佳木斯', '2', '0');
INSERT INTO `zc_region` VALUES ('174', '12', '牡丹江', '2', '0');
INSERT INTO `zc_region` VALUES ('175', '12', '七台河', '2', '0');
INSERT INTO `zc_region` VALUES ('176', '12', '齐齐哈尔', '2', '0');
INSERT INTO `zc_region` VALUES ('177', '12', '双鸭山', '2', '0');
INSERT INTO `zc_region` VALUES ('178', '12', '绥化', '2', '0');
INSERT INTO `zc_region` VALUES ('179', '12', '伊春', '2', '0');
INSERT INTO `zc_region` VALUES ('180', '13', '武汉', '2', '0');
INSERT INTO `zc_region` VALUES ('181', '13', '仙桃', '2', '0');
INSERT INTO `zc_region` VALUES ('182', '13', '鄂州', '2', '0');
INSERT INTO `zc_region` VALUES ('183', '13', '黄冈', '2', '0');
INSERT INTO `zc_region` VALUES ('184', '13', '黄石', '2', '0');
INSERT INTO `zc_region` VALUES ('185', '13', '荆门', '2', '0');
INSERT INTO `zc_region` VALUES ('186', '13', '荆州', '2', '0');
INSERT INTO `zc_region` VALUES ('187', '13', '潜江', '2', '0');
INSERT INTO `zc_region` VALUES ('188', '13', '神农架林区', '2', '0');
INSERT INTO `zc_region` VALUES ('189', '13', '十堰', '2', '0');
INSERT INTO `zc_region` VALUES ('190', '13', '随州', '2', '0');
INSERT INTO `zc_region` VALUES ('191', '13', '天门', '2', '0');
INSERT INTO `zc_region` VALUES ('192', '13', '咸宁', '2', '0');
INSERT INTO `zc_region` VALUES ('193', '13', '襄樊', '2', '0');
INSERT INTO `zc_region` VALUES ('194', '13', '孝感', '2', '0');
INSERT INTO `zc_region` VALUES ('195', '13', '宜昌', '2', '0');
INSERT INTO `zc_region` VALUES ('196', '13', '恩施', '2', '0');
INSERT INTO `zc_region` VALUES ('197', '14', '长沙', '2', '0');
INSERT INTO `zc_region` VALUES ('198', '14', '张家界', '2', '0');
INSERT INTO `zc_region` VALUES ('199', '14', '常德', '2', '0');
INSERT INTO `zc_region` VALUES ('200', '14', '郴州', '2', '0');
INSERT INTO `zc_region` VALUES ('201', '14', '衡阳', '2', '0');
INSERT INTO `zc_region` VALUES ('202', '14', '怀化', '2', '0');
INSERT INTO `zc_region` VALUES ('203', '14', '娄底', '2', '0');
INSERT INTO `zc_region` VALUES ('204', '14', '邵阳', '2', '0');
INSERT INTO `zc_region` VALUES ('205', '14', '湘潭', '2', '0');
INSERT INTO `zc_region` VALUES ('206', '14', '湘西', '2', '0');
INSERT INTO `zc_region` VALUES ('207', '14', '益阳', '2', '0');
INSERT INTO `zc_region` VALUES ('208', '14', '永州', '2', '0');
INSERT INTO `zc_region` VALUES ('209', '14', '岳阳', '2', '0');
INSERT INTO `zc_region` VALUES ('210', '14', '株洲', '2', '0');
INSERT INTO `zc_region` VALUES ('211', '15', '长春', '2', '0');
INSERT INTO `zc_region` VALUES ('212', '15', '吉林', '2', '0');
INSERT INTO `zc_region` VALUES ('213', '15', '白城', '2', '0');
INSERT INTO `zc_region` VALUES ('214', '15', '白山', '2', '0');
INSERT INTO `zc_region` VALUES ('215', '15', '辽源', '2', '0');
INSERT INTO `zc_region` VALUES ('216', '15', '四平', '2', '0');
INSERT INTO `zc_region` VALUES ('217', '15', '松原', '2', '0');
INSERT INTO `zc_region` VALUES ('218', '15', '通化', '2', '0');
INSERT INTO `zc_region` VALUES ('219', '15', '延边', '2', '0');
INSERT INTO `zc_region` VALUES ('220', '16', '南京', '2', '0');
INSERT INTO `zc_region` VALUES ('221', '16', '苏州', '2', '0');
INSERT INTO `zc_region` VALUES ('222', '16', '无锡', '2', '0');
INSERT INTO `zc_region` VALUES ('223', '16', '常州', '2', '0');
INSERT INTO `zc_region` VALUES ('224', '16', '淮安', '2', '0');
INSERT INTO `zc_region` VALUES ('225', '16', '连云港', '2', '0');
INSERT INTO `zc_region` VALUES ('226', '16', '南通', '2', '0');
INSERT INTO `zc_region` VALUES ('227', '16', '宿迁', '2', '0');
INSERT INTO `zc_region` VALUES ('228', '16', '泰州', '2', '0');
INSERT INTO `zc_region` VALUES ('229', '16', '徐州', '2', '0');
INSERT INTO `zc_region` VALUES ('230', '16', '盐城', '2', '0');
INSERT INTO `zc_region` VALUES ('231', '16', '扬州', '2', '0');
INSERT INTO `zc_region` VALUES ('232', '16', '镇江', '2', '0');
INSERT INTO `zc_region` VALUES ('233', '17', '南昌', '2', '0');
INSERT INTO `zc_region` VALUES ('234', '17', '抚州', '2', '0');
INSERT INTO `zc_region` VALUES ('235', '17', '赣州', '2', '0');
INSERT INTO `zc_region` VALUES ('236', '17', '吉安', '2', '0');
INSERT INTO `zc_region` VALUES ('237', '17', '景德镇', '2', '0');
INSERT INTO `zc_region` VALUES ('238', '17', '九江', '2', '0');
INSERT INTO `zc_region` VALUES ('239', '17', '萍乡', '2', '0');
INSERT INTO `zc_region` VALUES ('240', '17', '上饶', '2', '0');
INSERT INTO `zc_region` VALUES ('241', '17', '新余', '2', '0');
INSERT INTO `zc_region` VALUES ('242', '17', '宜春', '2', '0');
INSERT INTO `zc_region` VALUES ('243', '17', '鹰潭', '2', '0');
INSERT INTO `zc_region` VALUES ('244', '18', '沈阳', '2', '0');
INSERT INTO `zc_region` VALUES ('245', '18', '大连', '2', '0');
INSERT INTO `zc_region` VALUES ('246', '18', '鞍山', '2', '0');
INSERT INTO `zc_region` VALUES ('247', '18', '本溪', '2', '0');
INSERT INTO `zc_region` VALUES ('248', '18', '朝阳', '2', '0');
INSERT INTO `zc_region` VALUES ('249', '18', '丹东', '2', '0');
INSERT INTO `zc_region` VALUES ('250', '18', '抚顺', '2', '0');
INSERT INTO `zc_region` VALUES ('251', '18', '阜新', '2', '0');
INSERT INTO `zc_region` VALUES ('252', '18', '葫芦岛', '2', '0');
INSERT INTO `zc_region` VALUES ('253', '18', '锦州', '2', '0');
INSERT INTO `zc_region` VALUES ('254', '18', '辽阳', '2', '0');
INSERT INTO `zc_region` VALUES ('255', '18', '盘锦', '2', '0');
INSERT INTO `zc_region` VALUES ('256', '18', '铁岭', '2', '0');
INSERT INTO `zc_region` VALUES ('257', '18', '营口', '2', '0');
INSERT INTO `zc_region` VALUES ('258', '19', '呼和浩特', '2', '0');
INSERT INTO `zc_region` VALUES ('259', '19', '阿拉善盟', '2', '0');
INSERT INTO `zc_region` VALUES ('260', '19', '巴彦淖尔盟', '2', '0');
INSERT INTO `zc_region` VALUES ('261', '19', '包头', '2', '0');
INSERT INTO `zc_region` VALUES ('262', '19', '赤峰', '2', '0');
INSERT INTO `zc_region` VALUES ('263', '19', '鄂尔多斯', '2', '0');
INSERT INTO `zc_region` VALUES ('264', '19', '呼伦贝尔', '2', '0');
INSERT INTO `zc_region` VALUES ('265', '19', '通辽', '2', '0');
INSERT INTO `zc_region` VALUES ('266', '19', '乌海', '2', '0');
INSERT INTO `zc_region` VALUES ('267', '19', '乌兰察布市', '2', '0');
INSERT INTO `zc_region` VALUES ('268', '19', '锡林郭勒盟', '2', '0');
INSERT INTO `zc_region` VALUES ('269', '19', '兴安盟', '2', '0');
INSERT INTO `zc_region` VALUES ('270', '20', '银川', '2', '0');
INSERT INTO `zc_region` VALUES ('271', '20', '固原', '2', '0');
INSERT INTO `zc_region` VALUES ('272', '20', '石嘴山', '2', '0');
INSERT INTO `zc_region` VALUES ('273', '20', '吴忠', '2', '0');
INSERT INTO `zc_region` VALUES ('274', '20', '中卫', '2', '0');
INSERT INTO `zc_region` VALUES ('275', '21', '西宁', '2', '0');
INSERT INTO `zc_region` VALUES ('276', '21', '果洛', '2', '0');
INSERT INTO `zc_region` VALUES ('277', '21', '海北', '2', '0');
INSERT INTO `zc_region` VALUES ('278', '21', '海东', '2', '0');
INSERT INTO `zc_region` VALUES ('279', '21', '海南', '2', '0');
INSERT INTO `zc_region` VALUES ('280', '21', '海西', '2', '0');
INSERT INTO `zc_region` VALUES ('281', '21', '黄南', '2', '0');
INSERT INTO `zc_region` VALUES ('282', '21', '玉树', '2', '0');
INSERT INTO `zc_region` VALUES ('283', '22', '济南', '2', '0');
INSERT INTO `zc_region` VALUES ('284', '22', '青岛', '2', '0');
INSERT INTO `zc_region` VALUES ('285', '22', '滨州', '2', '0');
INSERT INTO `zc_region` VALUES ('286', '22', '德州', '2', '0');
INSERT INTO `zc_region` VALUES ('287', '22', '东营', '2', '0');
INSERT INTO `zc_region` VALUES ('288', '22', '菏泽', '2', '0');
INSERT INTO `zc_region` VALUES ('289', '22', '济宁', '2', '0');
INSERT INTO `zc_region` VALUES ('290', '22', '莱芜', '2', '0');
INSERT INTO `zc_region` VALUES ('291', '22', '聊城', '2', '0');
INSERT INTO `zc_region` VALUES ('292', '22', '临沂', '2', '0');
INSERT INTO `zc_region` VALUES ('293', '22', '日照', '2', '0');
INSERT INTO `zc_region` VALUES ('294', '22', '泰安', '2', '0');
INSERT INTO `zc_region` VALUES ('295', '22', '威海', '2', '0');
INSERT INTO `zc_region` VALUES ('296', '22', '潍坊', '2', '0');
INSERT INTO `zc_region` VALUES ('297', '22', '烟台', '2', '0');
INSERT INTO `zc_region` VALUES ('298', '22', '枣庄', '2', '0');
INSERT INTO `zc_region` VALUES ('299', '22', '淄博', '2', '0');
INSERT INTO `zc_region` VALUES ('300', '23', '太原', '2', '0');
INSERT INTO `zc_region` VALUES ('301', '23', '长治', '2', '0');
INSERT INTO `zc_region` VALUES ('302', '23', '大同', '2', '0');
INSERT INTO `zc_region` VALUES ('303', '23', '晋城', '2', '0');
INSERT INTO `zc_region` VALUES ('304', '23', '晋中', '2', '0');
INSERT INTO `zc_region` VALUES ('305', '23', '临汾', '2', '0');
INSERT INTO `zc_region` VALUES ('306', '23', '吕梁', '2', '0');
INSERT INTO `zc_region` VALUES ('307', '23', '朔州', '2', '0');
INSERT INTO `zc_region` VALUES ('308', '23', '忻州', '2', '0');
INSERT INTO `zc_region` VALUES ('309', '23', '阳泉', '2', '0');
INSERT INTO `zc_region` VALUES ('310', '23', '运城', '2', '0');
INSERT INTO `zc_region` VALUES ('311', '24', '西安', '2', '0');
INSERT INTO `zc_region` VALUES ('312', '24', '安康', '2', '0');
INSERT INTO `zc_region` VALUES ('313', '24', '宝鸡', '2', '0');
INSERT INTO `zc_region` VALUES ('314', '24', '汉中', '2', '0');
INSERT INTO `zc_region` VALUES ('315', '24', '商洛', '2', '0');
INSERT INTO `zc_region` VALUES ('316', '24', '铜川', '2', '0');
INSERT INTO `zc_region` VALUES ('317', '24', '渭南', '2', '0');
INSERT INTO `zc_region` VALUES ('318', '24', '咸阳', '2', '0');
INSERT INTO `zc_region` VALUES ('319', '24', '延安', '2', '0');
INSERT INTO `zc_region` VALUES ('320', '24', '榆林', '2', '0');
INSERT INTO `zc_region` VALUES ('321', '25', '上海', '2', '0');
INSERT INTO `zc_region` VALUES ('322', '26', '成都', '2', '0');
INSERT INTO `zc_region` VALUES ('323', '26', '绵阳', '2', '0');
INSERT INTO `zc_region` VALUES ('324', '26', '阿坝', '2', '0');
INSERT INTO `zc_region` VALUES ('325', '26', '巴中', '2', '0');
INSERT INTO `zc_region` VALUES ('326', '26', '达州', '2', '0');
INSERT INTO `zc_region` VALUES ('327', '26', '德阳', '2', '0');
INSERT INTO `zc_region` VALUES ('328', '26', '甘孜', '2', '0');
INSERT INTO `zc_region` VALUES ('329', '26', '广安', '2', '0');
INSERT INTO `zc_region` VALUES ('330', '26', '广元', '2', '0');
INSERT INTO `zc_region` VALUES ('331', '26', '乐山', '2', '0');
INSERT INTO `zc_region` VALUES ('332', '26', '凉山', '2', '0');
INSERT INTO `zc_region` VALUES ('333', '26', '眉山', '2', '0');
INSERT INTO `zc_region` VALUES ('334', '26', '南充', '2', '0');
INSERT INTO `zc_region` VALUES ('335', '26', '内江', '2', '0');
INSERT INTO `zc_region` VALUES ('336', '26', '攀枝花', '2', '0');
INSERT INTO `zc_region` VALUES ('337', '26', '遂宁', '2', '0');
INSERT INTO `zc_region` VALUES ('338', '26', '雅安', '2', '0');
INSERT INTO `zc_region` VALUES ('339', '26', '宜宾', '2', '0');
INSERT INTO `zc_region` VALUES ('340', '26', '资阳', '2', '0');
INSERT INTO `zc_region` VALUES ('341', '26', '自贡', '2', '0');
INSERT INTO `zc_region` VALUES ('342', '26', '泸州', '2', '0');
INSERT INTO `zc_region` VALUES ('343', '27', '天津', '2', '0');
INSERT INTO `zc_region` VALUES ('344', '28', '拉萨', '2', '0');
INSERT INTO `zc_region` VALUES ('345', '28', '阿里', '2', '0');
INSERT INTO `zc_region` VALUES ('346', '28', '昌都', '2', '0');
INSERT INTO `zc_region` VALUES ('347', '28', '林芝', '2', '0');
INSERT INTO `zc_region` VALUES ('348', '28', '那曲', '2', '0');
INSERT INTO `zc_region` VALUES ('349', '28', '日喀则', '2', '0');
INSERT INTO `zc_region` VALUES ('350', '28', '山南', '2', '0');
INSERT INTO `zc_region` VALUES ('351', '29', '乌鲁木齐', '2', '0');
INSERT INTO `zc_region` VALUES ('352', '29', '阿克苏', '2', '0');
INSERT INTO `zc_region` VALUES ('353', '29', '阿拉尔', '2', '0');
INSERT INTO `zc_region` VALUES ('354', '29', '巴音郭楞', '2', '0');
INSERT INTO `zc_region` VALUES ('355', '29', '博尔塔拉', '2', '0');
INSERT INTO `zc_region` VALUES ('356', '29', '昌吉', '2', '0');
INSERT INTO `zc_region` VALUES ('357', '29', '哈密', '2', '0');
INSERT INTO `zc_region` VALUES ('358', '29', '和田', '2', '0');
INSERT INTO `zc_region` VALUES ('359', '29', '喀什', '2', '0');
INSERT INTO `zc_region` VALUES ('360', '29', '克拉玛依', '2', '0');
INSERT INTO `zc_region` VALUES ('361', '29', '克孜勒苏', '2', '0');
INSERT INTO `zc_region` VALUES ('362', '29', '石河子', '2', '0');
INSERT INTO `zc_region` VALUES ('363', '29', '图木舒克', '2', '0');
INSERT INTO `zc_region` VALUES ('364', '29', '吐鲁番', '2', '0');
INSERT INTO `zc_region` VALUES ('365', '29', '五家渠', '2', '0');
INSERT INTO `zc_region` VALUES ('366', '29', '伊犁', '2', '0');
INSERT INTO `zc_region` VALUES ('367', '30', '昆明', '2', '0');
INSERT INTO `zc_region` VALUES ('368', '30', '怒江', '2', '0');
INSERT INTO `zc_region` VALUES ('369', '30', '普洱', '2', '0');
INSERT INTO `zc_region` VALUES ('370', '30', '丽江', '2', '0');
INSERT INTO `zc_region` VALUES ('371', '30', '保山', '2', '0');
INSERT INTO `zc_region` VALUES ('372', '30', '楚雄', '2', '0');
INSERT INTO `zc_region` VALUES ('373', '30', '大理', '2', '0');
INSERT INTO `zc_region` VALUES ('374', '30', '德宏', '2', '0');
INSERT INTO `zc_region` VALUES ('375', '30', '迪庆', '2', '0');
INSERT INTO `zc_region` VALUES ('376', '30', '红河', '2', '0');
INSERT INTO `zc_region` VALUES ('377', '30', '临沧', '2', '0');
INSERT INTO `zc_region` VALUES ('378', '30', '曲靖', '2', '0');
INSERT INTO `zc_region` VALUES ('379', '30', '文山', '2', '0');
INSERT INTO `zc_region` VALUES ('380', '30', '西双版纳', '2', '0');
INSERT INTO `zc_region` VALUES ('381', '30', '玉溪', '2', '0');
INSERT INTO `zc_region` VALUES ('382', '30', '昭通', '2', '0');
INSERT INTO `zc_region` VALUES ('383', '31', '杭州', '2', '0');
INSERT INTO `zc_region` VALUES ('384', '31', '湖州', '2', '0');
INSERT INTO `zc_region` VALUES ('385', '31', '嘉兴', '2', '0');
INSERT INTO `zc_region` VALUES ('386', '31', '金华', '2', '0');
INSERT INTO `zc_region` VALUES ('387', '31', '丽水', '2', '0');
INSERT INTO `zc_region` VALUES ('388', '31', '宁波', '2', '0');
INSERT INTO `zc_region` VALUES ('389', '31', '绍兴', '2', '0');
INSERT INTO `zc_region` VALUES ('390', '31', '台州', '2', '0');
INSERT INTO `zc_region` VALUES ('391', '31', '温州', '2', '0');
INSERT INTO `zc_region` VALUES ('392', '31', '舟山', '2', '0');
INSERT INTO `zc_region` VALUES ('393', '31', '衢州', '2', '0');
INSERT INTO `zc_region` VALUES ('394', '32', '重庆', '2', '0');
INSERT INTO `zc_region` VALUES ('395', '33', '香港', '2', '0');
INSERT INTO `zc_region` VALUES ('396', '34', '澳门', '2', '0');
INSERT INTO `zc_region` VALUES ('397', '35', '台湾', '2', '0');
INSERT INTO `zc_region` VALUES ('398', '36', '迎江区', '3', '0');
INSERT INTO `zc_region` VALUES ('399', '36', '大观区', '3', '0');
INSERT INTO `zc_region` VALUES ('400', '36', '宜秀区', '3', '0');
INSERT INTO `zc_region` VALUES ('401', '36', '桐城市', '3', '0');
INSERT INTO `zc_region` VALUES ('402', '36', '怀宁县', '3', '0');
INSERT INTO `zc_region` VALUES ('403', '36', '枞阳县', '3', '0');
INSERT INTO `zc_region` VALUES ('404', '36', '潜山县', '3', '0');
INSERT INTO `zc_region` VALUES ('405', '36', '太湖县', '3', '0');
INSERT INTO `zc_region` VALUES ('406', '36', '宿松县', '3', '0');
INSERT INTO `zc_region` VALUES ('407', '36', '望江县', '3', '0');
INSERT INTO `zc_region` VALUES ('408', '36', '岳西县', '3', '0');
INSERT INTO `zc_region` VALUES ('409', '37', '中市区', '3', '0');
INSERT INTO `zc_region` VALUES ('410', '37', '东市区', '3', '0');
INSERT INTO `zc_region` VALUES ('411', '37', '西市区', '3', '0');
INSERT INTO `zc_region` VALUES ('412', '37', '郊区', '3', '0');
INSERT INTO `zc_region` VALUES ('413', '37', '怀远县', '3', '0');
INSERT INTO `zc_region` VALUES ('414', '37', '五河县', '3', '0');
INSERT INTO `zc_region` VALUES ('415', '37', '固镇县', '3', '0');
INSERT INTO `zc_region` VALUES ('416', '38', '居巢区', '3', '0');
INSERT INTO `zc_region` VALUES ('417', '38', '庐江县', '3', '0');
INSERT INTO `zc_region` VALUES ('418', '38', '无为县', '3', '0');
INSERT INTO `zc_region` VALUES ('419', '38', '含山县', '3', '0');
INSERT INTO `zc_region` VALUES ('420', '38', '和县', '3', '0');
INSERT INTO `zc_region` VALUES ('421', '39', '贵池区', '3', '0');
INSERT INTO `zc_region` VALUES ('422', '39', '东至县', '3', '0');
INSERT INTO `zc_region` VALUES ('423', '39', '石台县', '3', '0');
INSERT INTO `zc_region` VALUES ('424', '39', '青阳县', '3', '0');
INSERT INTO `zc_region` VALUES ('425', '40', '琅琊区', '3', '0');
INSERT INTO `zc_region` VALUES ('426', '40', '南谯区', '3', '0');
INSERT INTO `zc_region` VALUES ('427', '40', '天长市', '3', '0');
INSERT INTO `zc_region` VALUES ('428', '40', '明光市', '3', '0');
INSERT INTO `zc_region` VALUES ('429', '40', '来安县', '3', '0');
INSERT INTO `zc_region` VALUES ('430', '40', '全椒县', '3', '0');
INSERT INTO `zc_region` VALUES ('431', '40', '定远县', '3', '0');
INSERT INTO `zc_region` VALUES ('432', '40', '凤阳县', '3', '0');
INSERT INTO `zc_region` VALUES ('433', '41', '蚌山区', '3', '0');
INSERT INTO `zc_region` VALUES ('434', '41', '龙子湖区', '3', '0');
INSERT INTO `zc_region` VALUES ('435', '41', '禹会区', '3', '0');
INSERT INTO `zc_region` VALUES ('436', '41', '淮上区', '3', '0');
INSERT INTO `zc_region` VALUES ('437', '41', '颍州区', '3', '0');
INSERT INTO `zc_region` VALUES ('438', '41', '颍东区', '3', '0');
INSERT INTO `zc_region` VALUES ('439', '41', '颍泉区', '3', '0');
INSERT INTO `zc_region` VALUES ('440', '41', '界首市', '3', '0');
INSERT INTO `zc_region` VALUES ('441', '41', '临泉县', '3', '0');
INSERT INTO `zc_region` VALUES ('442', '41', '太和县', '3', '0');
INSERT INTO `zc_region` VALUES ('443', '41', '阜南县', '3', '0');
INSERT INTO `zc_region` VALUES ('444', '41', '颖上县', '3', '0');
INSERT INTO `zc_region` VALUES ('445', '42', '相山区', '3', '0');
INSERT INTO `zc_region` VALUES ('446', '42', '杜集区', '3', '0');
INSERT INTO `zc_region` VALUES ('447', '42', '烈山区', '3', '0');
INSERT INTO `zc_region` VALUES ('448', '42', '濉溪县', '3', '0');
INSERT INTO `zc_region` VALUES ('449', '43', '田家庵区', '3', '0');
INSERT INTO `zc_region` VALUES ('450', '43', '大通区', '3', '0');
INSERT INTO `zc_region` VALUES ('451', '43', '谢家集区', '3', '0');
INSERT INTO `zc_region` VALUES ('452', '43', '八公山区', '3', '0');
INSERT INTO `zc_region` VALUES ('453', '43', '潘集区', '3', '0');
INSERT INTO `zc_region` VALUES ('454', '43', '凤台县', '3', '0');
INSERT INTO `zc_region` VALUES ('455', '44', '屯溪区', '3', '0');
INSERT INTO `zc_region` VALUES ('456', '44', '黄山区', '3', '0');
INSERT INTO `zc_region` VALUES ('457', '44', '徽州区', '3', '0');
INSERT INTO `zc_region` VALUES ('458', '44', '歙县', '3', '0');
INSERT INTO `zc_region` VALUES ('459', '44', '休宁县', '3', '0');
INSERT INTO `zc_region` VALUES ('460', '44', '黟县', '3', '0');
INSERT INTO `zc_region` VALUES ('461', '44', '祁门县', '3', '0');
INSERT INTO `zc_region` VALUES ('462', '45', '金安区', '3', '0');
INSERT INTO `zc_region` VALUES ('463', '45', '裕安区', '3', '0');
INSERT INTO `zc_region` VALUES ('464', '45', '寿县', '3', '0');
INSERT INTO `zc_region` VALUES ('465', '45', '霍邱县', '3', '0');
INSERT INTO `zc_region` VALUES ('466', '45', '舒城县', '3', '0');
INSERT INTO `zc_region` VALUES ('467', '45', '金寨县', '3', '0');
INSERT INTO `zc_region` VALUES ('468', '45', '霍山县', '3', '0');
INSERT INTO `zc_region` VALUES ('469', '46', '雨山区', '3', '0');
INSERT INTO `zc_region` VALUES ('470', '46', '花山区', '3', '0');
INSERT INTO `zc_region` VALUES ('471', '46', '金家庄区', '3', '0');
INSERT INTO `zc_region` VALUES ('472', '46', '当涂县', '3', '0');
INSERT INTO `zc_region` VALUES ('473', '47', '埇桥区', '3', '0');
INSERT INTO `zc_region` VALUES ('474', '47', '砀山县', '3', '0');
INSERT INTO `zc_region` VALUES ('475', '47', '萧县', '3', '0');
INSERT INTO `zc_region` VALUES ('476', '47', '灵璧县', '3', '0');
INSERT INTO `zc_region` VALUES ('477', '47', '泗县', '3', '0');
INSERT INTO `zc_region` VALUES ('478', '48', '铜官山区', '3', '0');
INSERT INTO `zc_region` VALUES ('479', '48', '狮子山区', '3', '0');
INSERT INTO `zc_region` VALUES ('480', '48', '郊区', '3', '0');
INSERT INTO `zc_region` VALUES ('481', '48', '铜陵县', '3', '0');
INSERT INTO `zc_region` VALUES ('482', '49', '镜湖区', '3', '0');
INSERT INTO `zc_region` VALUES ('483', '49', '弋江区', '3', '0');
INSERT INTO `zc_region` VALUES ('484', '49', '鸠江区', '3', '0');
INSERT INTO `zc_region` VALUES ('485', '49', '三山区', '3', '0');
INSERT INTO `zc_region` VALUES ('486', '49', '芜湖县', '3', '0');
INSERT INTO `zc_region` VALUES ('487', '49', '繁昌县', '3', '0');
INSERT INTO `zc_region` VALUES ('488', '49', '南陵县', '3', '0');
INSERT INTO `zc_region` VALUES ('489', '50', '宣州区', '3', '0');
INSERT INTO `zc_region` VALUES ('490', '50', '宁国市', '3', '0');
INSERT INTO `zc_region` VALUES ('491', '50', '郎溪县', '3', '0');
INSERT INTO `zc_region` VALUES ('492', '50', '广德县', '3', '0');
INSERT INTO `zc_region` VALUES ('493', '50', '泾县', '3', '0');
INSERT INTO `zc_region` VALUES ('494', '50', '绩溪县', '3', '0');
INSERT INTO `zc_region` VALUES ('495', '50', '旌德县', '3', '0');
INSERT INTO `zc_region` VALUES ('496', '51', '涡阳县', '3', '0');
INSERT INTO `zc_region` VALUES ('497', '51', '蒙城县', '3', '0');
INSERT INTO `zc_region` VALUES ('498', '51', '利辛县', '3', '0');
INSERT INTO `zc_region` VALUES ('499', '51', '谯城区', '3', '0');
INSERT INTO `zc_region` VALUES ('500', '52', '东城区', '3', '0');
INSERT INTO `zc_region` VALUES ('501', '52', '西城区', '3', '0');
INSERT INTO `zc_region` VALUES ('502', '52', '海淀区', '3', '0');
INSERT INTO `zc_region` VALUES ('503', '52', '朝阳区', '3', '0');
INSERT INTO `zc_region` VALUES ('504', '52', '崇文区', '3', '0');
INSERT INTO `zc_region` VALUES ('505', '52', '宣武区', '3', '0');
INSERT INTO `zc_region` VALUES ('506', '52', '丰台区', '3', '0');
INSERT INTO `zc_region` VALUES ('507', '52', '石景山区', '3', '0');
INSERT INTO `zc_region` VALUES ('508', '52', '房山区', '3', '0');
INSERT INTO `zc_region` VALUES ('509', '52', '门头沟区', '3', '0');
INSERT INTO `zc_region` VALUES ('510', '52', '通州区', '3', '0');
INSERT INTO `zc_region` VALUES ('511', '52', '顺义区', '3', '0');
INSERT INTO `zc_region` VALUES ('512', '52', '昌平区', '3', '0');
INSERT INTO `zc_region` VALUES ('513', '52', '怀柔区', '3', '0');
INSERT INTO `zc_region` VALUES ('514', '52', '平谷区', '3', '0');
INSERT INTO `zc_region` VALUES ('515', '52', '大兴区', '3', '0');
INSERT INTO `zc_region` VALUES ('516', '52', '密云县', '3', '0');
INSERT INTO `zc_region` VALUES ('517', '52', '延庆县', '3', '0');
INSERT INTO `zc_region` VALUES ('518', '53', '鼓楼区', '3', '0');
INSERT INTO `zc_region` VALUES ('519', '53', '台江区', '3', '0');
INSERT INTO `zc_region` VALUES ('520', '53', '仓山区', '3', '0');
INSERT INTO `zc_region` VALUES ('521', '53', '马尾区', '3', '0');
INSERT INTO `zc_region` VALUES ('522', '53', '晋安区', '3', '0');
INSERT INTO `zc_region` VALUES ('523', '53', '福清市', '3', '0');
INSERT INTO `zc_region` VALUES ('524', '53', '长乐市', '3', '0');
INSERT INTO `zc_region` VALUES ('525', '53', '闽侯县', '3', '0');
INSERT INTO `zc_region` VALUES ('526', '53', '连江县', '3', '0');
INSERT INTO `zc_region` VALUES ('527', '53', '罗源县', '3', '0');
INSERT INTO `zc_region` VALUES ('528', '53', '闽清县', '3', '0');
INSERT INTO `zc_region` VALUES ('529', '53', '永泰县', '3', '0');
INSERT INTO `zc_region` VALUES ('530', '53', '平潭县', '3', '0');
INSERT INTO `zc_region` VALUES ('531', '54', '新罗区', '3', '0');
INSERT INTO `zc_region` VALUES ('532', '54', '漳平市', '3', '0');
INSERT INTO `zc_region` VALUES ('533', '54', '长汀县', '3', '0');
INSERT INTO `zc_region` VALUES ('534', '54', '永定县', '3', '0');
INSERT INTO `zc_region` VALUES ('535', '54', '上杭县', '3', '0');
INSERT INTO `zc_region` VALUES ('536', '54', '武平县', '3', '0');
INSERT INTO `zc_region` VALUES ('537', '54', '连城县', '3', '0');
INSERT INTO `zc_region` VALUES ('538', '55', '延平区', '3', '0');
INSERT INTO `zc_region` VALUES ('539', '55', '邵武市', '3', '0');
INSERT INTO `zc_region` VALUES ('540', '55', '武夷山市', '3', '0');
INSERT INTO `zc_region` VALUES ('541', '55', '建瓯市', '3', '0');
INSERT INTO `zc_region` VALUES ('542', '55', '建阳市', '3', '0');
INSERT INTO `zc_region` VALUES ('543', '55', '顺昌县', '3', '0');
INSERT INTO `zc_region` VALUES ('544', '55', '浦城县', '3', '0');
INSERT INTO `zc_region` VALUES ('545', '55', '光泽县', '3', '0');
INSERT INTO `zc_region` VALUES ('546', '55', '松溪县', '3', '0');
INSERT INTO `zc_region` VALUES ('547', '55', '政和县', '3', '0');
INSERT INTO `zc_region` VALUES ('548', '56', '蕉城区', '3', '0');
INSERT INTO `zc_region` VALUES ('549', '56', '福安市', '3', '0');
INSERT INTO `zc_region` VALUES ('550', '56', '福鼎市', '3', '0');
INSERT INTO `zc_region` VALUES ('551', '56', '霞浦县', '3', '0');
INSERT INTO `zc_region` VALUES ('552', '56', '古田县', '3', '0');
INSERT INTO `zc_region` VALUES ('553', '56', '屏南县', '3', '0');
INSERT INTO `zc_region` VALUES ('554', '56', '寿宁县', '3', '0');
INSERT INTO `zc_region` VALUES ('555', '56', '周宁县', '3', '0');
INSERT INTO `zc_region` VALUES ('556', '56', '柘荣县', '3', '0');
INSERT INTO `zc_region` VALUES ('557', '57', '城厢区', '3', '0');
INSERT INTO `zc_region` VALUES ('558', '57', '涵江区', '3', '0');
INSERT INTO `zc_region` VALUES ('559', '57', '荔城区', '3', '0');
INSERT INTO `zc_region` VALUES ('560', '57', '秀屿区', '3', '0');
INSERT INTO `zc_region` VALUES ('561', '57', '仙游县', '3', '0');
INSERT INTO `zc_region` VALUES ('562', '58', '鲤城区', '3', '0');
INSERT INTO `zc_region` VALUES ('563', '58', '丰泽区', '3', '0');
INSERT INTO `zc_region` VALUES ('564', '58', '洛江区', '3', '0');
INSERT INTO `zc_region` VALUES ('565', '58', '清濛开发区', '3', '0');
INSERT INTO `zc_region` VALUES ('566', '58', '泉港区', '3', '0');
INSERT INTO `zc_region` VALUES ('567', '58', '石狮市', '3', '0');
INSERT INTO `zc_region` VALUES ('568', '58', '晋江市', '3', '0');
INSERT INTO `zc_region` VALUES ('569', '58', '南安市', '3', '0');
INSERT INTO `zc_region` VALUES ('570', '58', '惠安县', '3', '0');
INSERT INTO `zc_region` VALUES ('571', '58', '安溪县', '3', '0');
INSERT INTO `zc_region` VALUES ('572', '58', '永春县', '3', '0');
INSERT INTO `zc_region` VALUES ('573', '58', '德化县', '3', '0');
INSERT INTO `zc_region` VALUES ('574', '58', '金门县', '3', '0');
INSERT INTO `zc_region` VALUES ('575', '59', '梅列区', '3', '0');
INSERT INTO `zc_region` VALUES ('576', '59', '三元区', '3', '0');
INSERT INTO `zc_region` VALUES ('577', '59', '永安市', '3', '0');
INSERT INTO `zc_region` VALUES ('578', '59', '明溪县', '3', '0');
INSERT INTO `zc_region` VALUES ('579', '59', '清流县', '3', '0');
INSERT INTO `zc_region` VALUES ('580', '59', '宁化县', '3', '0');
INSERT INTO `zc_region` VALUES ('581', '59', '大田县', '3', '0');
INSERT INTO `zc_region` VALUES ('582', '59', '尤溪县', '3', '0');
INSERT INTO `zc_region` VALUES ('583', '59', '沙县', '3', '0');
INSERT INTO `zc_region` VALUES ('584', '59', '将乐县', '3', '0');
INSERT INTO `zc_region` VALUES ('585', '59', '泰宁县', '3', '0');
INSERT INTO `zc_region` VALUES ('586', '59', '建宁县', '3', '0');
INSERT INTO `zc_region` VALUES ('587', '60', '思明区', '3', '0');
INSERT INTO `zc_region` VALUES ('588', '60', '海沧区', '3', '0');
INSERT INTO `zc_region` VALUES ('589', '60', '湖里区', '3', '0');
INSERT INTO `zc_region` VALUES ('590', '60', '集美区', '3', '0');
INSERT INTO `zc_region` VALUES ('591', '60', '同安区', '3', '0');
INSERT INTO `zc_region` VALUES ('592', '60', '翔安区', '3', '0');
INSERT INTO `zc_region` VALUES ('593', '61', '芗城区', '3', '0');
INSERT INTO `zc_region` VALUES ('594', '61', '龙文区', '3', '0');
INSERT INTO `zc_region` VALUES ('595', '61', '龙海市', '3', '0');
INSERT INTO `zc_region` VALUES ('596', '61', '云霄县', '3', '0');
INSERT INTO `zc_region` VALUES ('597', '61', '漳浦县', '3', '0');
INSERT INTO `zc_region` VALUES ('598', '61', '诏安县', '3', '0');
INSERT INTO `zc_region` VALUES ('599', '61', '长泰县', '3', '0');
INSERT INTO `zc_region` VALUES ('600', '61', '东山县', '3', '0');
INSERT INTO `zc_region` VALUES ('601', '61', '南靖县', '3', '0');
INSERT INTO `zc_region` VALUES ('602', '61', '平和县', '3', '0');
INSERT INTO `zc_region` VALUES ('603', '61', '华安县', '3', '0');
INSERT INTO `zc_region` VALUES ('604', '62', '皋兰县', '3', '0');
INSERT INTO `zc_region` VALUES ('605', '62', '城关区', '3', '0');
INSERT INTO `zc_region` VALUES ('606', '62', '七里河区', '3', '0');
INSERT INTO `zc_region` VALUES ('607', '62', '西固区', '3', '0');
INSERT INTO `zc_region` VALUES ('608', '62', '安宁区', '3', '0');
INSERT INTO `zc_region` VALUES ('609', '62', '红古区', '3', '0');
INSERT INTO `zc_region` VALUES ('610', '62', '永登县', '3', '0');
INSERT INTO `zc_region` VALUES ('611', '62', '榆中县', '3', '0');
INSERT INTO `zc_region` VALUES ('612', '63', '白银区', '3', '0');
INSERT INTO `zc_region` VALUES ('613', '63', '平川区', '3', '0');
INSERT INTO `zc_region` VALUES ('614', '63', '会宁县', '3', '0');
INSERT INTO `zc_region` VALUES ('615', '63', '景泰县', '3', '0');
INSERT INTO `zc_region` VALUES ('616', '63', '靖远县', '3', '0');
INSERT INTO `zc_region` VALUES ('617', '64', '临洮县', '3', '0');
INSERT INTO `zc_region` VALUES ('618', '64', '陇西县', '3', '0');
INSERT INTO `zc_region` VALUES ('619', '64', '通渭县', '3', '0');
INSERT INTO `zc_region` VALUES ('620', '64', '渭源县', '3', '0');
INSERT INTO `zc_region` VALUES ('621', '64', '漳县', '3', '0');
INSERT INTO `zc_region` VALUES ('622', '64', '岷县', '3', '0');
INSERT INTO `zc_region` VALUES ('623', '64', '安定区', '3', '0');
INSERT INTO `zc_region` VALUES ('624', '64', '安定区', '3', '0');
INSERT INTO `zc_region` VALUES ('625', '65', '合作市', '3', '0');
INSERT INTO `zc_region` VALUES ('626', '65', '临潭县', '3', '0');
INSERT INTO `zc_region` VALUES ('627', '65', '卓尼县', '3', '0');
INSERT INTO `zc_region` VALUES ('628', '65', '舟曲县', '3', '0');
INSERT INTO `zc_region` VALUES ('629', '65', '迭部县', '3', '0');
INSERT INTO `zc_region` VALUES ('630', '65', '玛曲县', '3', '0');
INSERT INTO `zc_region` VALUES ('631', '65', '碌曲县', '3', '0');
INSERT INTO `zc_region` VALUES ('632', '65', '夏河县', '3', '0');
INSERT INTO `zc_region` VALUES ('633', '66', '嘉峪关市', '3', '0');
INSERT INTO `zc_region` VALUES ('634', '67', '金川区', '3', '0');
INSERT INTO `zc_region` VALUES ('635', '67', '永昌县', '3', '0');
INSERT INTO `zc_region` VALUES ('636', '68', '肃州区', '3', '0');
INSERT INTO `zc_region` VALUES ('637', '68', '玉门市', '3', '0');
INSERT INTO `zc_region` VALUES ('638', '68', '敦煌市', '3', '0');
INSERT INTO `zc_region` VALUES ('639', '68', '金塔县', '3', '0');
INSERT INTO `zc_region` VALUES ('640', '68', '瓜州县', '3', '0');
INSERT INTO `zc_region` VALUES ('641', '68', '肃北', '3', '0');
INSERT INTO `zc_region` VALUES ('642', '68', '阿克塞', '3', '0');
INSERT INTO `zc_region` VALUES ('643', '69', '临夏市', '3', '0');
INSERT INTO `zc_region` VALUES ('644', '69', '临夏县', '3', '0');
INSERT INTO `zc_region` VALUES ('645', '69', '康乐县', '3', '0');
INSERT INTO `zc_region` VALUES ('646', '69', '永靖县', '3', '0');
INSERT INTO `zc_region` VALUES ('647', '69', '广河县', '3', '0');
INSERT INTO `zc_region` VALUES ('648', '69', '和政县', '3', '0');
INSERT INTO `zc_region` VALUES ('649', '69', '东乡族自治县', '3', '0');
INSERT INTO `zc_region` VALUES ('650', '69', '积石山', '3', '0');
INSERT INTO `zc_region` VALUES ('651', '70', '成县', '3', '0');
INSERT INTO `zc_region` VALUES ('652', '70', '徽县', '3', '0');
INSERT INTO `zc_region` VALUES ('653', '70', '康县', '3', '0');
INSERT INTO `zc_region` VALUES ('654', '70', '礼县', '3', '0');
INSERT INTO `zc_region` VALUES ('655', '70', '两当县', '3', '0');
INSERT INTO `zc_region` VALUES ('656', '70', '文县', '3', '0');
INSERT INTO `zc_region` VALUES ('657', '70', '西和县', '3', '0');
INSERT INTO `zc_region` VALUES ('658', '70', '宕昌县', '3', '0');
INSERT INTO `zc_region` VALUES ('659', '70', '武都区', '3', '0');
INSERT INTO `zc_region` VALUES ('660', '71', '崇信县', '3', '0');
INSERT INTO `zc_region` VALUES ('661', '71', '华亭县', '3', '0');
INSERT INTO `zc_region` VALUES ('662', '71', '静宁县', '3', '0');
INSERT INTO `zc_region` VALUES ('663', '71', '灵台县', '3', '0');
INSERT INTO `zc_region` VALUES ('664', '71', '崆峒区', '3', '0');
INSERT INTO `zc_region` VALUES ('665', '71', '庄浪县', '3', '0');
INSERT INTO `zc_region` VALUES ('666', '71', '泾川县', '3', '0');
INSERT INTO `zc_region` VALUES ('667', '72', '合水县', '3', '0');
INSERT INTO `zc_region` VALUES ('668', '72', '华池县', '3', '0');
INSERT INTO `zc_region` VALUES ('669', '72', '环县', '3', '0');
INSERT INTO `zc_region` VALUES ('670', '72', '宁县', '3', '0');
INSERT INTO `zc_region` VALUES ('671', '72', '庆城县', '3', '0');
INSERT INTO `zc_region` VALUES ('672', '72', '西峰区', '3', '0');
INSERT INTO `zc_region` VALUES ('673', '72', '镇原县', '3', '0');
INSERT INTO `zc_region` VALUES ('674', '72', '正宁县', '3', '0');
INSERT INTO `zc_region` VALUES ('675', '73', '甘谷县', '3', '0');
INSERT INTO `zc_region` VALUES ('676', '73', '秦安县', '3', '0');
INSERT INTO `zc_region` VALUES ('677', '73', '清水县', '3', '0');
INSERT INTO `zc_region` VALUES ('678', '73', '秦州区', '3', '0');
INSERT INTO `zc_region` VALUES ('679', '73', '麦积区', '3', '0');
INSERT INTO `zc_region` VALUES ('680', '73', '武山县', '3', '0');
INSERT INTO `zc_region` VALUES ('681', '73', '张家川', '3', '0');
INSERT INTO `zc_region` VALUES ('682', '74', '古浪县', '3', '0');
INSERT INTO `zc_region` VALUES ('683', '74', '民勤县', '3', '0');
INSERT INTO `zc_region` VALUES ('684', '74', '天祝', '3', '0');
INSERT INTO `zc_region` VALUES ('685', '74', '凉州区', '3', '0');
INSERT INTO `zc_region` VALUES ('686', '75', '高台县', '3', '0');
INSERT INTO `zc_region` VALUES ('687', '75', '临泽县', '3', '0');
INSERT INTO `zc_region` VALUES ('688', '75', '民乐县', '3', '0');
INSERT INTO `zc_region` VALUES ('689', '75', '山丹县', '3', '0');
INSERT INTO `zc_region` VALUES ('690', '75', '肃南', '3', '0');
INSERT INTO `zc_region` VALUES ('691', '75', '甘州区', '3', '0');
INSERT INTO `zc_region` VALUES ('692', '76', '从化市', '3', '0');
INSERT INTO `zc_region` VALUES ('693', '76', '天河区', '3', '0');
INSERT INTO `zc_region` VALUES ('694', '76', '东山区', '3', '0');
INSERT INTO `zc_region` VALUES ('695', '76', '白云区', '3', '0');
INSERT INTO `zc_region` VALUES ('696', '76', '海珠区', '3', '0');
INSERT INTO `zc_region` VALUES ('697', '76', '荔湾区', '3', '0');
INSERT INTO `zc_region` VALUES ('698', '76', '越秀区', '3', '0');
INSERT INTO `zc_region` VALUES ('699', '76', '黄埔区', '3', '0');
INSERT INTO `zc_region` VALUES ('700', '76', '番禺区', '3', '0');
INSERT INTO `zc_region` VALUES ('701', '76', '花都区', '3', '0');
INSERT INTO `zc_region` VALUES ('702', '76', '增城区', '3', '0');
INSERT INTO `zc_region` VALUES ('703', '76', '从化区', '3', '0');
INSERT INTO `zc_region` VALUES ('704', '76', '市郊', '3', '0');
INSERT INTO `zc_region` VALUES ('705', '77', '福田区', '3', '0');
INSERT INTO `zc_region` VALUES ('706', '77', '罗湖区', '3', '0');
INSERT INTO `zc_region` VALUES ('707', '77', '南山区', '3', '0');
INSERT INTO `zc_region` VALUES ('708', '77', '宝安区', '3', '0');
INSERT INTO `zc_region` VALUES ('709', '77', '龙岗区', '3', '0');
INSERT INTO `zc_region` VALUES ('710', '77', '盐田区', '3', '0');
INSERT INTO `zc_region` VALUES ('711', '78', '湘桥区', '3', '0');
INSERT INTO `zc_region` VALUES ('712', '78', '潮安县', '3', '0');
INSERT INTO `zc_region` VALUES ('713', '78', '饶平县', '3', '0');
INSERT INTO `zc_region` VALUES ('714', '79', '南城区', '3', '0');
INSERT INTO `zc_region` VALUES ('715', '79', '东城区', '3', '0');
INSERT INTO `zc_region` VALUES ('716', '79', '万江区', '3', '0');
INSERT INTO `zc_region` VALUES ('717', '79', '莞城区', '3', '0');
INSERT INTO `zc_region` VALUES ('718', '79', '石龙镇', '3', '0');
INSERT INTO `zc_region` VALUES ('719', '79', '虎门镇', '3', '0');
INSERT INTO `zc_region` VALUES ('720', '79', '麻涌镇', '3', '0');
INSERT INTO `zc_region` VALUES ('721', '79', '道滘镇', '3', '0');
INSERT INTO `zc_region` VALUES ('722', '79', '石碣镇', '3', '0');
INSERT INTO `zc_region` VALUES ('723', '79', '沙田镇', '3', '0');
INSERT INTO `zc_region` VALUES ('724', '79', '望牛墩镇', '3', '0');
INSERT INTO `zc_region` VALUES ('725', '79', '洪梅镇', '3', '0');
INSERT INTO `zc_region` VALUES ('726', '79', '茶山镇', '3', '0');
INSERT INTO `zc_region` VALUES ('727', '79', '寮步镇', '3', '0');
INSERT INTO `zc_region` VALUES ('728', '79', '大岭山镇', '3', '0');
INSERT INTO `zc_region` VALUES ('729', '79', '大朗镇', '3', '0');
INSERT INTO `zc_region` VALUES ('730', '79', '黄江镇', '3', '0');
INSERT INTO `zc_region` VALUES ('731', '79', '樟木头', '3', '0');
INSERT INTO `zc_region` VALUES ('732', '79', '凤岗镇', '3', '0');
INSERT INTO `zc_region` VALUES ('733', '79', '塘厦镇', '3', '0');
INSERT INTO `zc_region` VALUES ('734', '79', '谢岗镇', '3', '0');
INSERT INTO `zc_region` VALUES ('735', '79', '厚街镇', '3', '0');
INSERT INTO `zc_region` VALUES ('736', '79', '清溪镇', '3', '0');
INSERT INTO `zc_region` VALUES ('737', '79', '常平镇', '3', '0');
INSERT INTO `zc_region` VALUES ('738', '79', '桥头镇', '3', '0');
INSERT INTO `zc_region` VALUES ('739', '79', '横沥镇', '3', '0');
INSERT INTO `zc_region` VALUES ('740', '79', '东坑镇', '3', '0');
INSERT INTO `zc_region` VALUES ('741', '79', '企石镇', '3', '0');
INSERT INTO `zc_region` VALUES ('742', '79', '石排镇', '3', '0');
INSERT INTO `zc_region` VALUES ('743', '79', '长安镇', '3', '0');
INSERT INTO `zc_region` VALUES ('744', '79', '中堂镇', '3', '0');
INSERT INTO `zc_region` VALUES ('745', '79', '高埗镇', '3', '0');
INSERT INTO `zc_region` VALUES ('746', '80', '禅城区', '3', '0');
INSERT INTO `zc_region` VALUES ('747', '80', '南海区', '3', '0');
INSERT INTO `zc_region` VALUES ('748', '80', '顺德区', '3', '0');
INSERT INTO `zc_region` VALUES ('749', '80', '三水区', '3', '0');
INSERT INTO `zc_region` VALUES ('750', '80', '高明区', '3', '0');
INSERT INTO `zc_region` VALUES ('751', '81', '东源县', '3', '0');
INSERT INTO `zc_region` VALUES ('752', '81', '和平县', '3', '0');
INSERT INTO `zc_region` VALUES ('753', '81', '源城区', '3', '0');
INSERT INTO `zc_region` VALUES ('754', '81', '连平县', '3', '0');
INSERT INTO `zc_region` VALUES ('755', '81', '龙川县', '3', '0');
INSERT INTO `zc_region` VALUES ('756', '81', '紫金县', '3', '0');
INSERT INTO `zc_region` VALUES ('757', '82', '惠阳区', '3', '0');
INSERT INTO `zc_region` VALUES ('758', '82', '惠城区', '3', '0');
INSERT INTO `zc_region` VALUES ('759', '82', '大亚湾', '3', '0');
INSERT INTO `zc_region` VALUES ('760', '82', '博罗县', '3', '0');
INSERT INTO `zc_region` VALUES ('761', '82', '惠东县', '3', '0');
INSERT INTO `zc_region` VALUES ('762', '82', '龙门县', '3', '0');
INSERT INTO `zc_region` VALUES ('763', '83', '江海区', '3', '0');
INSERT INTO `zc_region` VALUES ('764', '83', '蓬江区', '3', '0');
INSERT INTO `zc_region` VALUES ('765', '83', '新会区', '3', '0');
INSERT INTO `zc_region` VALUES ('766', '83', '台山市', '3', '0');
INSERT INTO `zc_region` VALUES ('767', '83', '开平市', '3', '0');
INSERT INTO `zc_region` VALUES ('768', '83', '鹤山市', '3', '0');
INSERT INTO `zc_region` VALUES ('769', '83', '恩平市', '3', '0');
INSERT INTO `zc_region` VALUES ('770', '84', '榕城区', '3', '0');
INSERT INTO `zc_region` VALUES ('771', '84', '普宁市', '3', '0');
INSERT INTO `zc_region` VALUES ('772', '84', '揭东县', '3', '0');
INSERT INTO `zc_region` VALUES ('773', '84', '揭西县', '3', '0');
INSERT INTO `zc_region` VALUES ('774', '84', '惠来县', '3', '0');
INSERT INTO `zc_region` VALUES ('775', '85', '茂南区', '3', '0');
INSERT INTO `zc_region` VALUES ('776', '85', '茂港区', '3', '0');
INSERT INTO `zc_region` VALUES ('777', '85', '高州市', '3', '0');
INSERT INTO `zc_region` VALUES ('778', '85', '化州市', '3', '0');
INSERT INTO `zc_region` VALUES ('779', '85', '信宜市', '3', '0');
INSERT INTO `zc_region` VALUES ('780', '85', '电白县', '3', '0');
INSERT INTO `zc_region` VALUES ('781', '86', '梅县', '3', '0');
INSERT INTO `zc_region` VALUES ('782', '86', '梅江区', '3', '0');
INSERT INTO `zc_region` VALUES ('783', '86', '兴宁市', '3', '0');
INSERT INTO `zc_region` VALUES ('784', '86', '大埔县', '3', '0');
INSERT INTO `zc_region` VALUES ('785', '86', '丰顺县', '3', '0');
INSERT INTO `zc_region` VALUES ('786', '86', '五华县', '3', '0');
INSERT INTO `zc_region` VALUES ('787', '86', '平远县', '3', '0');
INSERT INTO `zc_region` VALUES ('788', '86', '蕉岭县', '3', '0');
INSERT INTO `zc_region` VALUES ('789', '87', '清城区', '3', '0');
INSERT INTO `zc_region` VALUES ('790', '87', '英德市', '3', '0');
INSERT INTO `zc_region` VALUES ('791', '87', '连州市', '3', '0');
INSERT INTO `zc_region` VALUES ('792', '87', '佛冈县', '3', '0');
INSERT INTO `zc_region` VALUES ('793', '87', '阳山县', '3', '0');
INSERT INTO `zc_region` VALUES ('794', '87', '清新县', '3', '0');
INSERT INTO `zc_region` VALUES ('795', '87', '连山', '3', '0');
INSERT INTO `zc_region` VALUES ('796', '87', '连南', '3', '0');
INSERT INTO `zc_region` VALUES ('797', '88', '南澳县', '3', '0');
INSERT INTO `zc_region` VALUES ('798', '88', '潮阳区', '3', '0');
INSERT INTO `zc_region` VALUES ('799', '88', '澄海区', '3', '0');
INSERT INTO `zc_region` VALUES ('800', '88', '龙湖区', '3', '0');
INSERT INTO `zc_region` VALUES ('801', '88', '金平区', '3', '0');
INSERT INTO `zc_region` VALUES ('802', '88', '濠江区', '3', '0');
INSERT INTO `zc_region` VALUES ('803', '88', '潮南区', '3', '0');
INSERT INTO `zc_region` VALUES ('804', '89', '城区', '3', '0');
INSERT INTO `zc_region` VALUES ('805', '89', '陆丰市', '3', '0');
INSERT INTO `zc_region` VALUES ('806', '89', '海丰县', '3', '0');
INSERT INTO `zc_region` VALUES ('807', '89', '陆河县', '3', '0');
INSERT INTO `zc_region` VALUES ('808', '90', '曲江县', '3', '0');
INSERT INTO `zc_region` VALUES ('809', '90', '浈江区', '3', '0');
INSERT INTO `zc_region` VALUES ('810', '90', '武江区', '3', '0');
INSERT INTO `zc_region` VALUES ('811', '90', '曲江区', '3', '0');
INSERT INTO `zc_region` VALUES ('812', '90', '乐昌市', '3', '0');
INSERT INTO `zc_region` VALUES ('813', '90', '南雄市', '3', '0');
INSERT INTO `zc_region` VALUES ('814', '90', '始兴县', '3', '0');
INSERT INTO `zc_region` VALUES ('815', '90', '仁化县', '3', '0');
INSERT INTO `zc_region` VALUES ('816', '90', '翁源县', '3', '0');
INSERT INTO `zc_region` VALUES ('817', '90', '新丰县', '3', '0');
INSERT INTO `zc_region` VALUES ('818', '90', '乳源', '3', '0');
INSERT INTO `zc_region` VALUES ('819', '91', '江城区', '3', '0');
INSERT INTO `zc_region` VALUES ('820', '91', '阳春市', '3', '0');
INSERT INTO `zc_region` VALUES ('821', '91', '阳西县', '3', '0');
INSERT INTO `zc_region` VALUES ('822', '91', '阳东县', '3', '0');
INSERT INTO `zc_region` VALUES ('823', '92', '云城区', '3', '0');
INSERT INTO `zc_region` VALUES ('824', '92', '罗定市', '3', '0');
INSERT INTO `zc_region` VALUES ('825', '92', '新兴县', '3', '0');
INSERT INTO `zc_region` VALUES ('826', '92', '郁南县', '3', '0');
INSERT INTO `zc_region` VALUES ('827', '92', '云安县', '3', '0');
INSERT INTO `zc_region` VALUES ('828', '93', '赤坎区', '3', '0');
INSERT INTO `zc_region` VALUES ('829', '93', '霞山区', '3', '0');
INSERT INTO `zc_region` VALUES ('830', '93', '坡头区', '3', '0');
INSERT INTO `zc_region` VALUES ('831', '93', '麻章区', '3', '0');
INSERT INTO `zc_region` VALUES ('832', '93', '廉江市', '3', '0');
INSERT INTO `zc_region` VALUES ('833', '93', '雷州市', '3', '0');
INSERT INTO `zc_region` VALUES ('834', '93', '吴川市', '3', '0');
INSERT INTO `zc_region` VALUES ('835', '93', '遂溪县', '3', '0');
INSERT INTO `zc_region` VALUES ('836', '93', '徐闻县', '3', '0');
INSERT INTO `zc_region` VALUES ('837', '94', '肇庆市', '3', '0');
INSERT INTO `zc_region` VALUES ('838', '94', '高要市', '3', '0');
INSERT INTO `zc_region` VALUES ('839', '94', '四会市', '3', '0');
INSERT INTO `zc_region` VALUES ('840', '94', '广宁县', '3', '0');
INSERT INTO `zc_region` VALUES ('841', '94', '怀集县', '3', '0');
INSERT INTO `zc_region` VALUES ('842', '94', '封开县', '3', '0');
INSERT INTO `zc_region` VALUES ('843', '94', '德庆县', '3', '0');
INSERT INTO `zc_region` VALUES ('844', '95', '石岐街道', '3', '0');
INSERT INTO `zc_region` VALUES ('845', '95', '东区街道', '3', '0');
INSERT INTO `zc_region` VALUES ('846', '95', '西区街道', '3', '0');
INSERT INTO `zc_region` VALUES ('847', '95', '环城街道', '3', '0');
INSERT INTO `zc_region` VALUES ('848', '95', '中山港街道', '3', '0');
INSERT INTO `zc_region` VALUES ('849', '95', '五桂山街道', '3', '0');
INSERT INTO `zc_region` VALUES ('850', '96', '香洲区', '3', '0');
INSERT INTO `zc_region` VALUES ('851', '96', '斗门区', '3', '0');
INSERT INTO `zc_region` VALUES ('852', '96', '金湾区', '3', '0');
INSERT INTO `zc_region` VALUES ('853', '97', '邕宁区', '3', '0');
INSERT INTO `zc_region` VALUES ('854', '97', '青秀区', '3', '0');
INSERT INTO `zc_region` VALUES ('855', '97', '兴宁区', '3', '0');
INSERT INTO `zc_region` VALUES ('856', '97', '良庆区', '3', '0');
INSERT INTO `zc_region` VALUES ('857', '97', '西乡塘区', '3', '0');
INSERT INTO `zc_region` VALUES ('858', '97', '江南区', '3', '0');
INSERT INTO `zc_region` VALUES ('859', '97', '武鸣县', '3', '0');
INSERT INTO `zc_region` VALUES ('860', '97', '隆安县', '3', '0');
INSERT INTO `zc_region` VALUES ('861', '97', '马山县', '3', '0');
INSERT INTO `zc_region` VALUES ('862', '97', '上林县', '3', '0');
INSERT INTO `zc_region` VALUES ('863', '97', '宾阳县', '3', '0');
INSERT INTO `zc_region` VALUES ('864', '97', '横县', '3', '0');
INSERT INTO `zc_region` VALUES ('865', '98', '秀峰区', '3', '0');
INSERT INTO `zc_region` VALUES ('866', '98', '叠彩区', '3', '0');
INSERT INTO `zc_region` VALUES ('867', '98', '象山区', '3', '0');
INSERT INTO `zc_region` VALUES ('868', '98', '七星区', '3', '0');
INSERT INTO `zc_region` VALUES ('869', '98', '雁山区', '3', '0');
INSERT INTO `zc_region` VALUES ('870', '98', '阳朔县', '3', '0');
INSERT INTO `zc_region` VALUES ('871', '98', '临桂县', '3', '0');
INSERT INTO `zc_region` VALUES ('872', '98', '灵川县', '3', '0');
INSERT INTO `zc_region` VALUES ('873', '98', '全州县', '3', '0');
INSERT INTO `zc_region` VALUES ('874', '98', '平乐县', '3', '0');
INSERT INTO `zc_region` VALUES ('875', '98', '兴安县', '3', '0');
INSERT INTO `zc_region` VALUES ('876', '98', '灌阳县', '3', '0');
INSERT INTO `zc_region` VALUES ('877', '98', '荔浦县', '3', '0');
INSERT INTO `zc_region` VALUES ('878', '98', '资源县', '3', '0');
INSERT INTO `zc_region` VALUES ('879', '98', '永福县', '3', '0');
INSERT INTO `zc_region` VALUES ('880', '98', '龙胜', '3', '0');
INSERT INTO `zc_region` VALUES ('881', '98', '恭城', '3', '0');
INSERT INTO `zc_region` VALUES ('882', '99', '右江区', '3', '0');
INSERT INTO `zc_region` VALUES ('883', '99', '凌云县', '3', '0');
INSERT INTO `zc_region` VALUES ('884', '99', '平果县', '3', '0');
INSERT INTO `zc_region` VALUES ('885', '99', '西林县', '3', '0');
INSERT INTO `zc_region` VALUES ('886', '99', '乐业县', '3', '0');
INSERT INTO `zc_region` VALUES ('887', '99', '德保县', '3', '0');
INSERT INTO `zc_region` VALUES ('888', '99', '田林县', '3', '0');
INSERT INTO `zc_region` VALUES ('889', '99', '田阳县', '3', '0');
INSERT INTO `zc_region` VALUES ('890', '99', '靖西县', '3', '0');
INSERT INTO `zc_region` VALUES ('891', '99', '田东县', '3', '0');
INSERT INTO `zc_region` VALUES ('892', '99', '那坡县', '3', '0');
INSERT INTO `zc_region` VALUES ('893', '99', '隆林', '3', '0');
INSERT INTO `zc_region` VALUES ('894', '100', '海城区', '3', '0');
INSERT INTO `zc_region` VALUES ('895', '100', '银海区', '3', '0');
INSERT INTO `zc_region` VALUES ('896', '100', '铁山港区', '3', '0');
INSERT INTO `zc_region` VALUES ('897', '100', '合浦县', '3', '0');
INSERT INTO `zc_region` VALUES ('898', '101', '江州区', '3', '0');
INSERT INTO `zc_region` VALUES ('899', '101', '凭祥市', '3', '0');
INSERT INTO `zc_region` VALUES ('900', '101', '宁明县', '3', '0');
INSERT INTO `zc_region` VALUES ('901', '101', '扶绥县', '3', '0');
INSERT INTO `zc_region` VALUES ('902', '101', '龙州县', '3', '0');
INSERT INTO `zc_region` VALUES ('903', '101', '大新县', '3', '0');
INSERT INTO `zc_region` VALUES ('904', '101', '天等县', '3', '0');
INSERT INTO `zc_region` VALUES ('905', '102', '港口区', '3', '0');
INSERT INTO `zc_region` VALUES ('906', '102', '防城区', '3', '0');
INSERT INTO `zc_region` VALUES ('907', '102', '东兴市', '3', '0');
INSERT INTO `zc_region` VALUES ('908', '102', '上思县', '3', '0');
INSERT INTO `zc_region` VALUES ('909', '103', '港北区', '3', '0');
INSERT INTO `zc_region` VALUES ('910', '103', '港南区', '3', '0');
INSERT INTO `zc_region` VALUES ('911', '103', '覃塘区', '3', '0');
INSERT INTO `zc_region` VALUES ('912', '103', '桂平市', '3', '0');
INSERT INTO `zc_region` VALUES ('913', '103', '平南县', '3', '0');
INSERT INTO `zc_region` VALUES ('914', '104', '金城江区', '3', '0');
INSERT INTO `zc_region` VALUES ('915', '104', '宜州市', '3', '0');
INSERT INTO `zc_region` VALUES ('916', '104', '天峨县', '3', '0');
INSERT INTO `zc_region` VALUES ('917', '104', '凤山县', '3', '0');
INSERT INTO `zc_region` VALUES ('918', '104', '南丹县', '3', '0');
INSERT INTO `zc_region` VALUES ('919', '104', '东兰县', '3', '0');
INSERT INTO `zc_region` VALUES ('920', '104', '都安', '3', '0');
INSERT INTO `zc_region` VALUES ('921', '104', '罗城', '3', '0');
INSERT INTO `zc_region` VALUES ('922', '104', '巴马', '3', '0');
INSERT INTO `zc_region` VALUES ('923', '104', '环江', '3', '0');
INSERT INTO `zc_region` VALUES ('924', '104', '大化', '3', '0');
INSERT INTO `zc_region` VALUES ('925', '105', '八步区', '3', '0');
INSERT INTO `zc_region` VALUES ('926', '105', '钟山县', '3', '0');
INSERT INTO `zc_region` VALUES ('927', '105', '昭平县', '3', '0');
INSERT INTO `zc_region` VALUES ('928', '105', '富川', '3', '0');
INSERT INTO `zc_region` VALUES ('929', '106', '兴宾区', '3', '0');
INSERT INTO `zc_region` VALUES ('930', '106', '合山市', '3', '0');
INSERT INTO `zc_region` VALUES ('931', '106', '象州县', '3', '0');
INSERT INTO `zc_region` VALUES ('932', '106', '武宣县', '3', '0');
INSERT INTO `zc_region` VALUES ('933', '106', '忻城县', '3', '0');
INSERT INTO `zc_region` VALUES ('934', '106', '金秀', '3', '0');
INSERT INTO `zc_region` VALUES ('935', '107', '城中区', '3', '0');
INSERT INTO `zc_region` VALUES ('936', '107', '鱼峰区', '3', '0');
INSERT INTO `zc_region` VALUES ('937', '107', '柳北区', '3', '0');
INSERT INTO `zc_region` VALUES ('938', '107', '柳南区', '3', '0');
INSERT INTO `zc_region` VALUES ('939', '107', '柳江县', '3', '0');
INSERT INTO `zc_region` VALUES ('940', '107', '柳城县', '3', '0');
INSERT INTO `zc_region` VALUES ('941', '107', '鹿寨县', '3', '0');
INSERT INTO `zc_region` VALUES ('942', '107', '融安县', '3', '0');
INSERT INTO `zc_region` VALUES ('943', '107', '融水', '3', '0');
INSERT INTO `zc_region` VALUES ('944', '107', '三江', '3', '0');
INSERT INTO `zc_region` VALUES ('945', '108', '钦南区', '3', '0');
INSERT INTO `zc_region` VALUES ('946', '108', '钦北区', '3', '0');
INSERT INTO `zc_region` VALUES ('947', '108', '灵山县', '3', '0');
INSERT INTO `zc_region` VALUES ('948', '108', '浦北县', '3', '0');
INSERT INTO `zc_region` VALUES ('949', '109', '万秀区', '3', '0');
INSERT INTO `zc_region` VALUES ('950', '109', '蝶山区', '3', '0');
INSERT INTO `zc_region` VALUES ('951', '109', '长洲区', '3', '0');
INSERT INTO `zc_region` VALUES ('952', '109', '岑溪市', '3', '0');
INSERT INTO `zc_region` VALUES ('953', '109', '苍梧县', '3', '0');
INSERT INTO `zc_region` VALUES ('954', '109', '藤县', '3', '0');
INSERT INTO `zc_region` VALUES ('955', '109', '蒙山县', '3', '0');
INSERT INTO `zc_region` VALUES ('956', '110', '玉州区', '3', '0');
INSERT INTO `zc_region` VALUES ('957', '110', '北流市', '3', '0');
INSERT INTO `zc_region` VALUES ('958', '110', '容县', '3', '0');
INSERT INTO `zc_region` VALUES ('959', '110', '陆川县', '3', '0');
INSERT INTO `zc_region` VALUES ('960', '110', '博白县', '3', '0');
INSERT INTO `zc_region` VALUES ('961', '110', '兴业县', '3', '0');
INSERT INTO `zc_region` VALUES ('962', '111', '南明区', '3', '0');
INSERT INTO `zc_region` VALUES ('963', '111', '云岩区', '3', '0');
INSERT INTO `zc_region` VALUES ('964', '111', '花溪区', '3', '0');
INSERT INTO `zc_region` VALUES ('965', '111', '乌当区', '3', '0');
INSERT INTO `zc_region` VALUES ('966', '111', '白云区', '3', '0');
INSERT INTO `zc_region` VALUES ('967', '111', '小河区', '3', '0');
INSERT INTO `zc_region` VALUES ('968', '111', '金阳新区', '3', '0');
INSERT INTO `zc_region` VALUES ('969', '111', '新天园区', '3', '0');
INSERT INTO `zc_region` VALUES ('970', '111', '清镇市', '3', '0');
INSERT INTO `zc_region` VALUES ('971', '111', '开阳县', '3', '0');
INSERT INTO `zc_region` VALUES ('972', '111', '修文县', '3', '0');
INSERT INTO `zc_region` VALUES ('973', '111', '息烽县', '3', '0');
INSERT INTO `zc_region` VALUES ('974', '112', '西秀区', '3', '0');
INSERT INTO `zc_region` VALUES ('975', '112', '关岭', '3', '0');
INSERT INTO `zc_region` VALUES ('976', '112', '镇宁', '3', '0');
INSERT INTO `zc_region` VALUES ('977', '112', '紫云', '3', '0');
INSERT INTO `zc_region` VALUES ('978', '112', '平坝县', '3', '0');
INSERT INTO `zc_region` VALUES ('979', '112', '普定县', '3', '0');
INSERT INTO `zc_region` VALUES ('980', '113', '毕节市', '3', '0');
INSERT INTO `zc_region` VALUES ('981', '113', '大方县', '3', '0');
INSERT INTO `zc_region` VALUES ('982', '113', '黔西县', '3', '0');
INSERT INTO `zc_region` VALUES ('983', '113', '金沙县', '3', '0');
INSERT INTO `zc_region` VALUES ('984', '113', '织金县', '3', '0');
INSERT INTO `zc_region` VALUES ('985', '113', '纳雍县', '3', '0');
INSERT INTO `zc_region` VALUES ('986', '113', '赫章县', '3', '0');
INSERT INTO `zc_region` VALUES ('987', '113', '威宁', '3', '0');
INSERT INTO `zc_region` VALUES ('988', '114', '钟山区', '3', '0');
INSERT INTO `zc_region` VALUES ('989', '114', '六枝特区', '3', '0');
INSERT INTO `zc_region` VALUES ('990', '114', '水城县', '3', '0');
INSERT INTO `zc_region` VALUES ('991', '114', '盘县', '3', '0');
INSERT INTO `zc_region` VALUES ('992', '115', '凯里市', '3', '0');
INSERT INTO `zc_region` VALUES ('993', '115', '黄平县', '3', '0');
INSERT INTO `zc_region` VALUES ('994', '115', '施秉县', '3', '0');
INSERT INTO `zc_region` VALUES ('995', '115', '三穗县', '3', '0');
INSERT INTO `zc_region` VALUES ('996', '115', '镇远县', '3', '0');
INSERT INTO `zc_region` VALUES ('997', '115', '岑巩县', '3', '0');
INSERT INTO `zc_region` VALUES ('998', '115', '天柱县', '3', '0');
INSERT INTO `zc_region` VALUES ('999', '115', '锦屏县', '3', '0');
INSERT INTO `zc_region` VALUES ('1000', '115', '剑河县', '3', '0');
INSERT INTO `zc_region` VALUES ('1001', '115', '台江县', '3', '0');
INSERT INTO `zc_region` VALUES ('1002', '115', '黎平县', '3', '0');
INSERT INTO `zc_region` VALUES ('1003', '115', '榕江县', '3', '0');
INSERT INTO `zc_region` VALUES ('1004', '115', '从江县', '3', '0');
INSERT INTO `zc_region` VALUES ('1005', '115', '雷山县', '3', '0');
INSERT INTO `zc_region` VALUES ('1006', '115', '麻江县', '3', '0');
INSERT INTO `zc_region` VALUES ('1007', '115', '丹寨县', '3', '0');
INSERT INTO `zc_region` VALUES ('1008', '116', '都匀市', '3', '0');
INSERT INTO `zc_region` VALUES ('1009', '116', '福泉市', '3', '0');
INSERT INTO `zc_region` VALUES ('1010', '116', '荔波县', '3', '0');
INSERT INTO `zc_region` VALUES ('1011', '116', '贵定县', '3', '0');
INSERT INTO `zc_region` VALUES ('1012', '116', '瓮安县', '3', '0');
INSERT INTO `zc_region` VALUES ('1013', '116', '独山县', '3', '0');
INSERT INTO `zc_region` VALUES ('1014', '116', '平塘县', '3', '0');
INSERT INTO `zc_region` VALUES ('1015', '116', '罗甸县', '3', '0');
INSERT INTO `zc_region` VALUES ('1016', '116', '长顺县', '3', '0');
INSERT INTO `zc_region` VALUES ('1017', '116', '龙里县', '3', '0');
INSERT INTO `zc_region` VALUES ('1018', '116', '惠水县', '3', '0');
INSERT INTO `zc_region` VALUES ('1019', '116', '三都', '3', '0');
INSERT INTO `zc_region` VALUES ('1020', '117', '兴义市', '3', '0');
INSERT INTO `zc_region` VALUES ('1021', '117', '兴仁县', '3', '0');
INSERT INTO `zc_region` VALUES ('1022', '117', '普安县', '3', '0');
INSERT INTO `zc_region` VALUES ('1023', '117', '晴隆县', '3', '0');
INSERT INTO `zc_region` VALUES ('1024', '117', '贞丰县', '3', '0');
INSERT INTO `zc_region` VALUES ('1025', '117', '望谟县', '3', '0');
INSERT INTO `zc_region` VALUES ('1026', '117', '册亨县', '3', '0');
INSERT INTO `zc_region` VALUES ('1027', '117', '安龙县', '3', '0');
INSERT INTO `zc_region` VALUES ('1028', '118', '铜仁市', '3', '0');
INSERT INTO `zc_region` VALUES ('1029', '118', '江口县', '3', '0');
INSERT INTO `zc_region` VALUES ('1030', '118', '石阡县', '3', '0');
INSERT INTO `zc_region` VALUES ('1031', '118', '思南县', '3', '0');
INSERT INTO `zc_region` VALUES ('1032', '118', '德江县', '3', '0');
INSERT INTO `zc_region` VALUES ('1033', '118', '玉屏', '3', '0');
INSERT INTO `zc_region` VALUES ('1034', '118', '印江', '3', '0');
INSERT INTO `zc_region` VALUES ('1035', '118', '沿河', '3', '0');
INSERT INTO `zc_region` VALUES ('1036', '118', '松桃', '3', '0');
INSERT INTO `zc_region` VALUES ('1037', '118', '万山特区', '3', '0');
INSERT INTO `zc_region` VALUES ('1038', '119', '红花岗区', '3', '0');
INSERT INTO `zc_region` VALUES ('1039', '119', '务川县', '3', '0');
INSERT INTO `zc_region` VALUES ('1040', '119', '道真县', '3', '0');
INSERT INTO `zc_region` VALUES ('1041', '119', '汇川区', '3', '0');
INSERT INTO `zc_region` VALUES ('1042', '119', '赤水市', '3', '0');
INSERT INTO `zc_region` VALUES ('1043', '119', '仁怀市', '3', '0');
INSERT INTO `zc_region` VALUES ('1044', '119', '遵义县', '3', '0');
INSERT INTO `zc_region` VALUES ('1045', '119', '桐梓县', '3', '0');
INSERT INTO `zc_region` VALUES ('1046', '119', '绥阳县', '3', '0');
INSERT INTO `zc_region` VALUES ('1047', '119', '正安县', '3', '0');
INSERT INTO `zc_region` VALUES ('1048', '119', '凤冈县', '3', '0');
INSERT INTO `zc_region` VALUES ('1049', '119', '湄潭县', '3', '0');
INSERT INTO `zc_region` VALUES ('1050', '119', '余庆县', '3', '0');
INSERT INTO `zc_region` VALUES ('1051', '119', '习水县', '3', '0');
INSERT INTO `zc_region` VALUES ('1052', '119', '道真', '3', '0');
INSERT INTO `zc_region` VALUES ('1053', '119', '务川', '3', '0');
INSERT INTO `zc_region` VALUES ('1054', '120', '秀英区', '3', '0');
INSERT INTO `zc_region` VALUES ('1055', '120', '龙华区', '3', '0');
INSERT INTO `zc_region` VALUES ('1056', '120', '琼山区', '3', '0');
INSERT INTO `zc_region` VALUES ('1057', '120', '美兰区', '3', '0');
INSERT INTO `zc_region` VALUES ('1058', '137', '市区', '3', '0');
INSERT INTO `zc_region` VALUES ('1059', '137', '洋浦开发区', '3', '0');
INSERT INTO `zc_region` VALUES ('1060', '137', '那大镇', '3', '0');
INSERT INTO `zc_region` VALUES ('1061', '137', '王五镇', '3', '0');
INSERT INTO `zc_region` VALUES ('1062', '137', '雅星镇', '3', '0');
INSERT INTO `zc_region` VALUES ('1063', '137', '大成镇', '3', '0');
INSERT INTO `zc_region` VALUES ('1064', '137', '中和镇', '3', '0');
INSERT INTO `zc_region` VALUES ('1065', '137', '峨蔓镇', '3', '0');
INSERT INTO `zc_region` VALUES ('1066', '137', '南丰镇', '3', '0');
INSERT INTO `zc_region` VALUES ('1067', '137', '白马井镇', '3', '0');
INSERT INTO `zc_region` VALUES ('1068', '137', '兰洋镇', '3', '0');
INSERT INTO `zc_region` VALUES ('1069', '137', '和庆镇', '3', '0');
INSERT INTO `zc_region` VALUES ('1070', '137', '海头镇', '3', '0');
INSERT INTO `zc_region` VALUES ('1071', '137', '排浦镇', '3', '0');
INSERT INTO `zc_region` VALUES ('1072', '137', '东成镇', '3', '0');
INSERT INTO `zc_region` VALUES ('1073', '137', '光村镇', '3', '0');
INSERT INTO `zc_region` VALUES ('1074', '137', '木棠镇', '3', '0');
INSERT INTO `zc_region` VALUES ('1075', '137', '新州镇', '3', '0');
INSERT INTO `zc_region` VALUES ('1076', '137', '三都镇', '3', '0');
INSERT INTO `zc_region` VALUES ('1077', '137', '其他', '3', '0');
INSERT INTO `zc_region` VALUES ('1078', '138', '长安区', '3', '0');
INSERT INTO `zc_region` VALUES ('1079', '138', '桥东区', '3', '0');
INSERT INTO `zc_region` VALUES ('1080', '138', '桥西区', '3', '0');
INSERT INTO `zc_region` VALUES ('1081', '138', '新华区', '3', '0');
INSERT INTO `zc_region` VALUES ('1082', '138', '裕华区', '3', '0');
INSERT INTO `zc_region` VALUES ('1083', '138', '井陉矿区', '3', '0');
INSERT INTO `zc_region` VALUES ('1084', '138', '高新区', '3', '0');
INSERT INTO `zc_region` VALUES ('1085', '138', '辛集市', '3', '0');
INSERT INTO `zc_region` VALUES ('1086', '138', '藁城市', '3', '0');
INSERT INTO `zc_region` VALUES ('1087', '138', '晋州市', '3', '0');
INSERT INTO `zc_region` VALUES ('1088', '138', '新乐市', '3', '0');
INSERT INTO `zc_region` VALUES ('1089', '138', '鹿泉市', '3', '0');
INSERT INTO `zc_region` VALUES ('1090', '138', '井陉县', '3', '0');
INSERT INTO `zc_region` VALUES ('1091', '138', '正定县', '3', '0');
INSERT INTO `zc_region` VALUES ('1092', '138', '栾城县', '3', '0');
INSERT INTO `zc_region` VALUES ('1093', '138', '行唐县', '3', '0');
INSERT INTO `zc_region` VALUES ('1094', '138', '灵寿县', '3', '0');
INSERT INTO `zc_region` VALUES ('1095', '138', '高邑县', '3', '0');
INSERT INTO `zc_region` VALUES ('1096', '138', '深泽县', '3', '0');
INSERT INTO `zc_region` VALUES ('1097', '138', '赞皇县', '3', '0');
INSERT INTO `zc_region` VALUES ('1098', '138', '无极县', '3', '0');
INSERT INTO `zc_region` VALUES ('1099', '138', '平山县', '3', '0');
INSERT INTO `zc_region` VALUES ('1100', '138', '元氏县', '3', '0');
INSERT INTO `zc_region` VALUES ('1101', '138', '赵县', '3', '0');
INSERT INTO `zc_region` VALUES ('1102', '139', '新市区', '3', '0');
INSERT INTO `zc_region` VALUES ('1103', '139', '南市区', '3', '0');
INSERT INTO `zc_region` VALUES ('1104', '139', '北市区', '3', '0');
INSERT INTO `zc_region` VALUES ('1105', '139', '涿州市', '3', '0');
INSERT INTO `zc_region` VALUES ('1106', '139', '定州市', '3', '0');
INSERT INTO `zc_region` VALUES ('1107', '139', '安国市', '3', '0');
INSERT INTO `zc_region` VALUES ('1108', '139', '高碑店市', '3', '0');
INSERT INTO `zc_region` VALUES ('1109', '139', '满城县', '3', '0');
INSERT INTO `zc_region` VALUES ('1110', '139', '清苑县', '3', '0');
INSERT INTO `zc_region` VALUES ('1111', '139', '涞水县', '3', '0');
INSERT INTO `zc_region` VALUES ('1112', '139', '阜平县', '3', '0');
INSERT INTO `zc_region` VALUES ('1113', '139', '徐水县', '3', '0');
INSERT INTO `zc_region` VALUES ('1114', '139', '定兴县', '3', '0');
INSERT INTO `zc_region` VALUES ('1115', '139', '唐县', '3', '0');
INSERT INTO `zc_region` VALUES ('1116', '139', '高阳县', '3', '0');
INSERT INTO `zc_region` VALUES ('1117', '139', '容城县', '3', '0');
INSERT INTO `zc_region` VALUES ('1118', '139', '涞源县', '3', '0');
INSERT INTO `zc_region` VALUES ('1119', '139', '望都县', '3', '0');
INSERT INTO `zc_region` VALUES ('1120', '139', '安新县', '3', '0');
INSERT INTO `zc_region` VALUES ('1121', '139', '易县', '3', '0');
INSERT INTO `zc_region` VALUES ('1122', '139', '曲阳县', '3', '0');
INSERT INTO `zc_region` VALUES ('1123', '139', '蠡县', '3', '0');
INSERT INTO `zc_region` VALUES ('1124', '139', '顺平县', '3', '0');
INSERT INTO `zc_region` VALUES ('1125', '139', '博野县', '3', '0');
INSERT INTO `zc_region` VALUES ('1126', '139', '雄县', '3', '0');
INSERT INTO `zc_region` VALUES ('1127', '140', '运河区', '3', '0');
INSERT INTO `zc_region` VALUES ('1128', '140', '新华区', '3', '0');
INSERT INTO `zc_region` VALUES ('1129', '140', '泊头市', '3', '0');
INSERT INTO `zc_region` VALUES ('1130', '140', '任丘市', '3', '0');
INSERT INTO `zc_region` VALUES ('1131', '140', '黄骅市', '3', '0');
INSERT INTO `zc_region` VALUES ('1132', '140', '河间市', '3', '0');
INSERT INTO `zc_region` VALUES ('1133', '140', '沧县', '3', '0');
INSERT INTO `zc_region` VALUES ('1134', '140', '青县', '3', '0');
INSERT INTO `zc_region` VALUES ('1135', '140', '东光县', '3', '0');
INSERT INTO `zc_region` VALUES ('1136', '140', '海兴县', '3', '0');
INSERT INTO `zc_region` VALUES ('1137', '140', '盐山县', '3', '0');
INSERT INTO `zc_region` VALUES ('1138', '140', '肃宁县', '3', '0');
INSERT INTO `zc_region` VALUES ('1139', '140', '南皮县', '3', '0');
INSERT INTO `zc_region` VALUES ('1140', '140', '吴桥县', '3', '0');
INSERT INTO `zc_region` VALUES ('1141', '140', '献县', '3', '0');
INSERT INTO `zc_region` VALUES ('1142', '140', '孟村', '3', '0');
INSERT INTO `zc_region` VALUES ('1143', '141', '双桥区', '3', '0');
INSERT INTO `zc_region` VALUES ('1144', '141', '双滦区', '3', '0');
INSERT INTO `zc_region` VALUES ('1145', '141', '鹰手营子矿区', '3', '0');
INSERT INTO `zc_region` VALUES ('1146', '141', '承德县', '3', '0');
INSERT INTO `zc_region` VALUES ('1147', '141', '兴隆县', '3', '0');
INSERT INTO `zc_region` VALUES ('1148', '141', '平泉县', '3', '0');
INSERT INTO `zc_region` VALUES ('1149', '141', '滦平县', '3', '0');
INSERT INTO `zc_region` VALUES ('1150', '141', '隆化县', '3', '0');
INSERT INTO `zc_region` VALUES ('1151', '141', '丰宁', '3', '0');
INSERT INTO `zc_region` VALUES ('1152', '141', '宽城', '3', '0');
INSERT INTO `zc_region` VALUES ('1153', '141', '围场', '3', '0');
INSERT INTO `zc_region` VALUES ('1154', '142', '从台区', '3', '0');
INSERT INTO `zc_region` VALUES ('1155', '142', '复兴区', '3', '0');
INSERT INTO `zc_region` VALUES ('1156', '142', '邯山区', '3', '0');
INSERT INTO `zc_region` VALUES ('1157', '142', '峰峰矿区', '3', '0');
INSERT INTO `zc_region` VALUES ('1158', '142', '武安市', '3', '0');
INSERT INTO `zc_region` VALUES ('1159', '142', '邯郸县', '3', '0');
INSERT INTO `zc_region` VALUES ('1160', '142', '临漳县', '3', '0');
INSERT INTO `zc_region` VALUES ('1161', '142', '成安县', '3', '0');
INSERT INTO `zc_region` VALUES ('1162', '142', '大名县', '3', '0');
INSERT INTO `zc_region` VALUES ('1163', '142', '涉县', '3', '0');
INSERT INTO `zc_region` VALUES ('1164', '142', '磁县', '3', '0');
INSERT INTO `zc_region` VALUES ('1165', '142', '肥乡县', '3', '0');
INSERT INTO `zc_region` VALUES ('1166', '142', '永年县', '3', '0');
INSERT INTO `zc_region` VALUES ('1167', '142', '邱县', '3', '0');
INSERT INTO `zc_region` VALUES ('1168', '142', '鸡泽县', '3', '0');
INSERT INTO `zc_region` VALUES ('1169', '142', '广平县', '3', '0');
INSERT INTO `zc_region` VALUES ('1170', '142', '馆陶县', '3', '0');
INSERT INTO `zc_region` VALUES ('1171', '142', '魏县', '3', '0');
INSERT INTO `zc_region` VALUES ('1172', '142', '曲周县', '3', '0');
INSERT INTO `zc_region` VALUES ('1173', '143', '桃城区', '3', '0');
INSERT INTO `zc_region` VALUES ('1174', '143', '冀州市', '3', '0');
INSERT INTO `zc_region` VALUES ('1175', '143', '深州市', '3', '0');
INSERT INTO `zc_region` VALUES ('1176', '143', '枣强县', '3', '0');
INSERT INTO `zc_region` VALUES ('1177', '143', '武邑县', '3', '0');
INSERT INTO `zc_region` VALUES ('1178', '143', '武强县', '3', '0');
INSERT INTO `zc_region` VALUES ('1179', '143', '饶阳县', '3', '0');
INSERT INTO `zc_region` VALUES ('1180', '143', '安平县', '3', '0');
INSERT INTO `zc_region` VALUES ('1181', '143', '故城县', '3', '0');
INSERT INTO `zc_region` VALUES ('1182', '143', '景县', '3', '0');
INSERT INTO `zc_region` VALUES ('1183', '143', '阜城县', '3', '0');
INSERT INTO `zc_region` VALUES ('1184', '144', '安次区', '3', '0');
INSERT INTO `zc_region` VALUES ('1185', '144', '广阳区', '3', '0');
INSERT INTO `zc_region` VALUES ('1186', '144', '霸州市', '3', '0');
INSERT INTO `zc_region` VALUES ('1187', '144', '三河市', '3', '0');
INSERT INTO `zc_region` VALUES ('1188', '144', '固安县', '3', '0');
INSERT INTO `zc_region` VALUES ('1189', '144', '永清县', '3', '0');
INSERT INTO `zc_region` VALUES ('1190', '144', '香河县', '3', '0');
INSERT INTO `zc_region` VALUES ('1191', '144', '大城县', '3', '0');
INSERT INTO `zc_region` VALUES ('1192', '144', '文安县', '3', '0');
INSERT INTO `zc_region` VALUES ('1193', '144', '大厂', '3', '0');
INSERT INTO `zc_region` VALUES ('1194', '145', '海港区', '3', '0');
INSERT INTO `zc_region` VALUES ('1195', '145', '山海关区', '3', '0');
INSERT INTO `zc_region` VALUES ('1196', '145', '北戴河区', '3', '0');
INSERT INTO `zc_region` VALUES ('1197', '145', '昌黎县', '3', '0');
INSERT INTO `zc_region` VALUES ('1198', '145', '抚宁县', '3', '0');
INSERT INTO `zc_region` VALUES ('1199', '145', '卢龙县', '3', '0');
INSERT INTO `zc_region` VALUES ('1200', '145', '青龙', '3', '0');
INSERT INTO `zc_region` VALUES ('1201', '146', '路北区', '3', '0');
INSERT INTO `zc_region` VALUES ('1202', '146', '路南区', '3', '0');
INSERT INTO `zc_region` VALUES ('1203', '146', '古冶区', '3', '0');
INSERT INTO `zc_region` VALUES ('1204', '146', '开平区', '3', '0');
INSERT INTO `zc_region` VALUES ('1205', '146', '丰南区', '3', '0');
INSERT INTO `zc_region` VALUES ('1206', '146', '丰润区', '3', '0');
INSERT INTO `zc_region` VALUES ('1207', '146', '遵化市', '3', '0');
INSERT INTO `zc_region` VALUES ('1208', '146', '迁安市', '3', '0');
INSERT INTO `zc_region` VALUES ('1209', '146', '滦县', '3', '0');
INSERT INTO `zc_region` VALUES ('1210', '146', '滦南县', '3', '0');
INSERT INTO `zc_region` VALUES ('1211', '146', '乐亭县', '3', '0');
INSERT INTO `zc_region` VALUES ('1212', '146', '迁西县', '3', '0');
INSERT INTO `zc_region` VALUES ('1213', '146', '玉田县', '3', '0');
INSERT INTO `zc_region` VALUES ('1214', '146', '唐海县', '3', '0');
INSERT INTO `zc_region` VALUES ('1215', '147', '桥东区', '3', '0');
INSERT INTO `zc_region` VALUES ('1216', '147', '桥西区', '3', '0');
INSERT INTO `zc_region` VALUES ('1217', '147', '南宫市', '3', '0');
INSERT INTO `zc_region` VALUES ('1218', '147', '沙河市', '3', '0');
INSERT INTO `zc_region` VALUES ('1219', '147', '邢台县', '3', '0');
INSERT INTO `zc_region` VALUES ('1220', '147', '临城县', '3', '0');
INSERT INTO `zc_region` VALUES ('1221', '147', '内丘县', '3', '0');
INSERT INTO `zc_region` VALUES ('1222', '147', '柏乡县', '3', '0');
INSERT INTO `zc_region` VALUES ('1223', '147', '隆尧县', '3', '0');
INSERT INTO `zc_region` VALUES ('1224', '147', '任县', '3', '0');
INSERT INTO `zc_region` VALUES ('1225', '147', '南和县', '3', '0');
INSERT INTO `zc_region` VALUES ('1226', '147', '宁晋县', '3', '0');
INSERT INTO `zc_region` VALUES ('1227', '147', '巨鹿县', '3', '0');
INSERT INTO `zc_region` VALUES ('1228', '147', '新河县', '3', '0');
INSERT INTO `zc_region` VALUES ('1229', '147', '广宗县', '3', '0');
INSERT INTO `zc_region` VALUES ('1230', '147', '平乡县', '3', '0');
INSERT INTO `zc_region` VALUES ('1231', '147', '威县', '3', '0');
INSERT INTO `zc_region` VALUES ('1232', '147', '清河县', '3', '0');
INSERT INTO `zc_region` VALUES ('1233', '147', '临西县', '3', '0');
INSERT INTO `zc_region` VALUES ('1234', '148', '桥西区', '3', '0');
INSERT INTO `zc_region` VALUES ('1235', '148', '桥东区', '3', '0');
INSERT INTO `zc_region` VALUES ('1236', '148', '宣化区', '3', '0');
INSERT INTO `zc_region` VALUES ('1237', '148', '下花园区', '3', '0');
INSERT INTO `zc_region` VALUES ('1238', '148', '宣化县', '3', '0');
INSERT INTO `zc_region` VALUES ('1239', '148', '张北县', '3', '0');
INSERT INTO `zc_region` VALUES ('1240', '148', '康保县', '3', '0');
INSERT INTO `zc_region` VALUES ('1241', '148', '沽源县', '3', '0');
INSERT INTO `zc_region` VALUES ('1242', '148', '尚义县', '3', '0');
INSERT INTO `zc_region` VALUES ('1243', '148', '蔚县', '3', '0');
INSERT INTO `zc_region` VALUES ('1244', '148', '阳原县', '3', '0');
INSERT INTO `zc_region` VALUES ('1245', '148', '怀安县', '3', '0');
INSERT INTO `zc_region` VALUES ('1246', '148', '万全县', '3', '0');
INSERT INTO `zc_region` VALUES ('1247', '148', '怀来县', '3', '0');
INSERT INTO `zc_region` VALUES ('1248', '148', '涿鹿县', '3', '0');
INSERT INTO `zc_region` VALUES ('1249', '148', '赤城县', '3', '0');
INSERT INTO `zc_region` VALUES ('1250', '148', '崇礼县', '3', '0');
INSERT INTO `zc_region` VALUES ('1251', '149', '金水区', '3', '0');
INSERT INTO `zc_region` VALUES ('1252', '149', '邙山区', '3', '0');
INSERT INTO `zc_region` VALUES ('1253', '149', '二七区', '3', '0');
INSERT INTO `zc_region` VALUES ('1254', '149', '管城区', '3', '0');
INSERT INTO `zc_region` VALUES ('1255', '149', '中原区', '3', '0');
INSERT INTO `zc_region` VALUES ('1256', '149', '上街区', '3', '0');
INSERT INTO `zc_region` VALUES ('1257', '149', '惠济区', '3', '0');
INSERT INTO `zc_region` VALUES ('1258', '149', '郑东新区', '3', '0');
INSERT INTO `zc_region` VALUES ('1259', '149', '经济技术开发区', '3', '0');
INSERT INTO `zc_region` VALUES ('1260', '149', '高新开发区', '3', '0');
INSERT INTO `zc_region` VALUES ('1261', '149', '出口加工区', '3', '0');
INSERT INTO `zc_region` VALUES ('1262', '149', '巩义市', '3', '0');
INSERT INTO `zc_region` VALUES ('1263', '149', '荥阳市', '3', '0');
INSERT INTO `zc_region` VALUES ('1264', '149', '新密市', '3', '0');
INSERT INTO `zc_region` VALUES ('1265', '149', '新郑市', '3', '0');
INSERT INTO `zc_region` VALUES ('1266', '149', '登封市', '3', '0');
INSERT INTO `zc_region` VALUES ('1267', '149', '中牟县', '3', '0');
INSERT INTO `zc_region` VALUES ('1268', '150', '西工区', '3', '0');
INSERT INTO `zc_region` VALUES ('1269', '150', '老城区', '3', '0');
INSERT INTO `zc_region` VALUES ('1270', '150', '涧西区', '3', '0');
INSERT INTO `zc_region` VALUES ('1271', '150', '瀍河回族区', '3', '0');
INSERT INTO `zc_region` VALUES ('1272', '150', '洛龙区', '3', '0');
INSERT INTO `zc_region` VALUES ('1273', '150', '吉利区', '3', '0');
INSERT INTO `zc_region` VALUES ('1274', '150', '偃师市', '3', '0');
INSERT INTO `zc_region` VALUES ('1275', '150', '孟津县', '3', '0');
INSERT INTO `zc_region` VALUES ('1276', '150', '新安县', '3', '0');
INSERT INTO `zc_region` VALUES ('1277', '150', '栾川县', '3', '0');
INSERT INTO `zc_region` VALUES ('1278', '150', '嵩县', '3', '0');
INSERT INTO `zc_region` VALUES ('1279', '150', '汝阳县', '3', '0');
INSERT INTO `zc_region` VALUES ('1280', '150', '宜阳县', '3', '0');
INSERT INTO `zc_region` VALUES ('1281', '150', '洛宁县', '3', '0');
INSERT INTO `zc_region` VALUES ('1282', '150', '伊川县', '3', '0');
INSERT INTO `zc_region` VALUES ('1283', '151', '鼓楼区', '3', '0');
INSERT INTO `zc_region` VALUES ('1284', '151', '龙亭区', '3', '0');
INSERT INTO `zc_region` VALUES ('1285', '151', '顺河回族区', '3', '0');
INSERT INTO `zc_region` VALUES ('1286', '151', '金明区', '3', '0');
INSERT INTO `zc_region` VALUES ('1287', '151', '禹王台区', '3', '0');
INSERT INTO `zc_region` VALUES ('1288', '151', '杞县', '3', '0');
INSERT INTO `zc_region` VALUES ('1289', '151', '通许县', '3', '0');
INSERT INTO `zc_region` VALUES ('1290', '151', '尉氏县', '3', '0');
INSERT INTO `zc_region` VALUES ('1291', '151', '开封县', '3', '0');
INSERT INTO `zc_region` VALUES ('1292', '151', '兰考县', '3', '0');
INSERT INTO `zc_region` VALUES ('1293', '152', '北关区', '3', '0');
INSERT INTO `zc_region` VALUES ('1294', '152', '文峰区', '3', '0');
INSERT INTO `zc_region` VALUES ('1295', '152', '殷都区', '3', '0');
INSERT INTO `zc_region` VALUES ('1296', '152', '龙安区', '3', '0');
INSERT INTO `zc_region` VALUES ('1297', '152', '林州市', '3', '0');
INSERT INTO `zc_region` VALUES ('1298', '152', '安阳县', '3', '0');
INSERT INTO `zc_region` VALUES ('1299', '152', '汤阴县', '3', '0');
INSERT INTO `zc_region` VALUES ('1300', '152', '滑县', '3', '0');
INSERT INTO `zc_region` VALUES ('1301', '152', '内黄县', '3', '0');
INSERT INTO `zc_region` VALUES ('1302', '153', '淇滨区', '3', '0');
INSERT INTO `zc_region` VALUES ('1303', '153', '山城区', '3', '0');
INSERT INTO `zc_region` VALUES ('1304', '153', '鹤山区', '3', '0');
INSERT INTO `zc_region` VALUES ('1305', '153', '浚县', '3', '0');
INSERT INTO `zc_region` VALUES ('1306', '153', '淇县', '3', '0');
INSERT INTO `zc_region` VALUES ('1307', '154', '济源市', '3', '0');
INSERT INTO `zc_region` VALUES ('1308', '155', '解放区', '3', '0');
INSERT INTO `zc_region` VALUES ('1309', '155', '中站区', '3', '0');
INSERT INTO `zc_region` VALUES ('1310', '155', '马村区', '3', '0');
INSERT INTO `zc_region` VALUES ('1311', '155', '山阳区', '3', '0');
INSERT INTO `zc_region` VALUES ('1312', '155', '沁阳市', '3', '0');
INSERT INTO `zc_region` VALUES ('1313', '155', '孟州市', '3', '0');
INSERT INTO `zc_region` VALUES ('1314', '155', '修武县', '3', '0');
INSERT INTO `zc_region` VALUES ('1315', '155', '博爱县', '3', '0');
INSERT INTO `zc_region` VALUES ('1316', '155', '武陟县', '3', '0');
INSERT INTO `zc_region` VALUES ('1317', '155', '温县', '3', '0');
INSERT INTO `zc_region` VALUES ('1318', '156', '卧龙区', '3', '0');
INSERT INTO `zc_region` VALUES ('1319', '156', '宛城区', '3', '0');
INSERT INTO `zc_region` VALUES ('1320', '156', '邓州市', '3', '0');
INSERT INTO `zc_region` VALUES ('1321', '156', '南召县', '3', '0');
INSERT INTO `zc_region` VALUES ('1322', '156', '方城县', '3', '0');
INSERT INTO `zc_region` VALUES ('1323', '156', '西峡县', '3', '0');
INSERT INTO `zc_region` VALUES ('1324', '156', '镇平县', '3', '0');
INSERT INTO `zc_region` VALUES ('1325', '156', '内乡县', '3', '0');
INSERT INTO `zc_region` VALUES ('1326', '156', '淅川县', '3', '0');
INSERT INTO `zc_region` VALUES ('1327', '156', '社旗县', '3', '0');
INSERT INTO `zc_region` VALUES ('1328', '156', '唐河县', '3', '0');
INSERT INTO `zc_region` VALUES ('1329', '156', '新野县', '3', '0');
INSERT INTO `zc_region` VALUES ('1330', '156', '桐柏县', '3', '0');
INSERT INTO `zc_region` VALUES ('1331', '157', '新华区', '3', '0');
INSERT INTO `zc_region` VALUES ('1332', '157', '卫东区', '3', '0');
INSERT INTO `zc_region` VALUES ('1333', '157', '湛河区', '3', '0');
INSERT INTO `zc_region` VALUES ('1334', '157', '石龙区', '3', '0');
INSERT INTO `zc_region` VALUES ('1335', '157', '舞钢市', '3', '0');
INSERT INTO `zc_region` VALUES ('1336', '157', '汝州市', '3', '0');
INSERT INTO `zc_region` VALUES ('1337', '157', '宝丰县', '3', '0');
INSERT INTO `zc_region` VALUES ('1338', '157', '叶县', '3', '0');
INSERT INTO `zc_region` VALUES ('1339', '157', '鲁山县', '3', '0');
INSERT INTO `zc_region` VALUES ('1340', '157', '郏县', '3', '0');
INSERT INTO `zc_region` VALUES ('1341', '158', '湖滨区', '3', '0');
INSERT INTO `zc_region` VALUES ('1342', '158', '义马市', '3', '0');
INSERT INTO `zc_region` VALUES ('1343', '158', '灵宝市', '3', '0');
INSERT INTO `zc_region` VALUES ('1344', '158', '渑池县', '3', '0');
INSERT INTO `zc_region` VALUES ('1345', '158', '陕县', '3', '0');
INSERT INTO `zc_region` VALUES ('1346', '158', '卢氏县', '3', '0');
INSERT INTO `zc_region` VALUES ('1347', '159', '梁园区', '3', '0');
INSERT INTO `zc_region` VALUES ('1348', '159', '睢阳区', '3', '0');
INSERT INTO `zc_region` VALUES ('1349', '159', '永城市', '3', '0');
INSERT INTO `zc_region` VALUES ('1350', '159', '民权县', '3', '0');
INSERT INTO `zc_region` VALUES ('1351', '159', '睢县', '3', '0');
INSERT INTO `zc_region` VALUES ('1352', '159', '宁陵县', '3', '0');
INSERT INTO `zc_region` VALUES ('1353', '159', '虞城县', '3', '0');
INSERT INTO `zc_region` VALUES ('1354', '159', '柘城县', '3', '0');
INSERT INTO `zc_region` VALUES ('1355', '159', '夏邑县', '3', '0');
INSERT INTO `zc_region` VALUES ('1356', '160', '卫滨区', '3', '0');
INSERT INTO `zc_region` VALUES ('1357', '160', '红旗区', '3', '0');
INSERT INTO `zc_region` VALUES ('1358', '160', '凤泉区', '3', '0');
INSERT INTO `zc_region` VALUES ('1359', '160', '牧野区', '3', '0');
INSERT INTO `zc_region` VALUES ('1360', '160', '卫辉市', '3', '0');
INSERT INTO `zc_region` VALUES ('1361', '160', '辉县市', '3', '0');
INSERT INTO `zc_region` VALUES ('1362', '160', '新乡县', '3', '0');
INSERT INTO `zc_region` VALUES ('1363', '160', '获嘉县', '3', '0');
INSERT INTO `zc_region` VALUES ('1364', '160', '原阳县', '3', '0');
INSERT INTO `zc_region` VALUES ('1365', '160', '延津县', '3', '0');
INSERT INTO `zc_region` VALUES ('1366', '160', '封丘县', '3', '0');
INSERT INTO `zc_region` VALUES ('1367', '160', '长垣县', '3', '0');
INSERT INTO `zc_region` VALUES ('1368', '161', '浉河区', '3', '0');
INSERT INTO `zc_region` VALUES ('1369', '161', '平桥区', '3', '0');
INSERT INTO `zc_region` VALUES ('1370', '161', '罗山县', '3', '0');
INSERT INTO `zc_region` VALUES ('1371', '161', '光山县', '3', '0');
INSERT INTO `zc_region` VALUES ('1372', '161', '新县', '3', '0');
INSERT INTO `zc_region` VALUES ('1373', '161', '商城县', '3', '0');
INSERT INTO `zc_region` VALUES ('1374', '161', '固始县', '3', '0');
INSERT INTO `zc_region` VALUES ('1375', '161', '潢川县', '3', '0');
INSERT INTO `zc_region` VALUES ('1376', '161', '淮滨县', '3', '0');
INSERT INTO `zc_region` VALUES ('1377', '161', '息县', '3', '0');
INSERT INTO `zc_region` VALUES ('1378', '162', '魏都区', '3', '0');
INSERT INTO `zc_region` VALUES ('1379', '162', '禹州市', '3', '0');
INSERT INTO `zc_region` VALUES ('1380', '162', '长葛市', '3', '0');
INSERT INTO `zc_region` VALUES ('1381', '162', '许昌县', '3', '0');
INSERT INTO `zc_region` VALUES ('1382', '162', '鄢陵县', '3', '0');
INSERT INTO `zc_region` VALUES ('1383', '162', '襄城县', '3', '0');
INSERT INTO `zc_region` VALUES ('1384', '163', '川汇区', '3', '0');
INSERT INTO `zc_region` VALUES ('1385', '163', '项城市', '3', '0');
INSERT INTO `zc_region` VALUES ('1386', '163', '扶沟县', '3', '0');
INSERT INTO `zc_region` VALUES ('1387', '163', '西华县', '3', '0');
INSERT INTO `zc_region` VALUES ('1388', '163', '商水县', '3', '0');
INSERT INTO `zc_region` VALUES ('1389', '163', '沈丘县', '3', '0');
INSERT INTO `zc_region` VALUES ('1390', '163', '郸城县', '3', '0');
INSERT INTO `zc_region` VALUES ('1391', '163', '淮阳县', '3', '0');
INSERT INTO `zc_region` VALUES ('1392', '163', '太康县', '3', '0');
INSERT INTO `zc_region` VALUES ('1393', '163', '鹿邑县', '3', '0');
INSERT INTO `zc_region` VALUES ('1394', '164', '驿城区', '3', '0');
INSERT INTO `zc_region` VALUES ('1395', '164', '西平县', '3', '0');
INSERT INTO `zc_region` VALUES ('1396', '164', '上蔡县', '3', '0');
INSERT INTO `zc_region` VALUES ('1397', '164', '平舆县', '3', '0');
INSERT INTO `zc_region` VALUES ('1398', '164', '正阳县', '3', '0');
INSERT INTO `zc_region` VALUES ('1399', '164', '确山县', '3', '0');
INSERT INTO `zc_region` VALUES ('1400', '164', '泌阳县', '3', '0');
INSERT INTO `zc_region` VALUES ('1401', '164', '汝南县', '3', '0');
INSERT INTO `zc_region` VALUES ('1402', '164', '遂平县', '3', '0');
INSERT INTO `zc_region` VALUES ('1403', '164', '新蔡县', '3', '0');
INSERT INTO `zc_region` VALUES ('1404', '165', '郾城区', '3', '0');
INSERT INTO `zc_region` VALUES ('1405', '165', '源汇区', '3', '0');
INSERT INTO `zc_region` VALUES ('1406', '165', '召陵区', '3', '0');
INSERT INTO `zc_region` VALUES ('1407', '165', '舞阳县', '3', '0');
INSERT INTO `zc_region` VALUES ('1408', '165', '临颍县', '3', '0');
INSERT INTO `zc_region` VALUES ('1409', '166', '华龙区', '3', '0');
INSERT INTO `zc_region` VALUES ('1410', '166', '清丰县', '3', '0');
INSERT INTO `zc_region` VALUES ('1411', '166', '南乐县', '3', '0');
INSERT INTO `zc_region` VALUES ('1412', '166', '范县', '3', '0');
INSERT INTO `zc_region` VALUES ('1413', '166', '台前县', '3', '0');
INSERT INTO `zc_region` VALUES ('1414', '166', '濮阳县', '3', '0');
INSERT INTO `zc_region` VALUES ('1415', '167', '道里区', '3', '0');
INSERT INTO `zc_region` VALUES ('1416', '167', '南岗区', '3', '0');
INSERT INTO `zc_region` VALUES ('1417', '167', '动力区', '3', '0');
INSERT INTO `zc_region` VALUES ('1418', '167', '平房区', '3', '0');
INSERT INTO `zc_region` VALUES ('1419', '167', '香坊区', '3', '0');
INSERT INTO `zc_region` VALUES ('1420', '167', '太平区', '3', '0');
INSERT INTO `zc_region` VALUES ('1421', '167', '道外区', '3', '0');
INSERT INTO `zc_region` VALUES ('1422', '167', '阿城区', '3', '0');
INSERT INTO `zc_region` VALUES ('1423', '167', '呼兰区', '3', '0');
INSERT INTO `zc_region` VALUES ('1424', '167', '松北区', '3', '0');
INSERT INTO `zc_region` VALUES ('1425', '167', '尚志市', '3', '0');
INSERT INTO `zc_region` VALUES ('1426', '167', '双城市', '3', '0');
INSERT INTO `zc_region` VALUES ('1427', '167', '五常市', '3', '0');
INSERT INTO `zc_region` VALUES ('1428', '167', '方正县', '3', '0');
INSERT INTO `zc_region` VALUES ('1429', '167', '宾县', '3', '0');
INSERT INTO `zc_region` VALUES ('1430', '167', '依兰县', '3', '0');
INSERT INTO `zc_region` VALUES ('1431', '167', '巴彦县', '3', '0');
INSERT INTO `zc_region` VALUES ('1432', '167', '通河县', '3', '0');
INSERT INTO `zc_region` VALUES ('1433', '167', '木兰县', '3', '0');
INSERT INTO `zc_region` VALUES ('1434', '167', '延寿县', '3', '0');
INSERT INTO `zc_region` VALUES ('1435', '168', '萨尔图区', '3', '0');
INSERT INTO `zc_region` VALUES ('1436', '168', '红岗区', '3', '0');
INSERT INTO `zc_region` VALUES ('1437', '168', '龙凤区', '3', '0');
INSERT INTO `zc_region` VALUES ('1438', '168', '让胡路区', '3', '0');
INSERT INTO `zc_region` VALUES ('1439', '168', '大同区', '3', '0');
INSERT INTO `zc_region` VALUES ('1440', '168', '肇州县', '3', '0');
INSERT INTO `zc_region` VALUES ('1441', '168', '肇源县', '3', '0');
INSERT INTO `zc_region` VALUES ('1442', '168', '林甸县', '3', '0');
INSERT INTO `zc_region` VALUES ('1443', '168', '杜尔伯特', '3', '0');
INSERT INTO `zc_region` VALUES ('1444', '169', '呼玛县', '3', '0');
INSERT INTO `zc_region` VALUES ('1445', '169', '漠河县', '3', '0');
INSERT INTO `zc_region` VALUES ('1446', '169', '塔河县', '3', '0');
INSERT INTO `zc_region` VALUES ('1447', '170', '兴山区', '3', '0');
INSERT INTO `zc_region` VALUES ('1448', '170', '工农区', '3', '0');
INSERT INTO `zc_region` VALUES ('1449', '170', '南山区', '3', '0');
INSERT INTO `zc_region` VALUES ('1450', '170', '兴安区', '3', '0');
INSERT INTO `zc_region` VALUES ('1451', '170', '向阳区', '3', '0');
INSERT INTO `zc_region` VALUES ('1452', '170', '东山区', '3', '0');
INSERT INTO `zc_region` VALUES ('1453', '170', '萝北县', '3', '0');
INSERT INTO `zc_region` VALUES ('1454', '170', '绥滨县', '3', '0');
INSERT INTO `zc_region` VALUES ('1455', '171', '爱辉区', '3', '0');
INSERT INTO `zc_region` VALUES ('1456', '171', '五大连池市', '3', '0');
INSERT INTO `zc_region` VALUES ('1457', '171', '北安市', '3', '0');
INSERT INTO `zc_region` VALUES ('1458', '171', '嫩江县', '3', '0');
INSERT INTO `zc_region` VALUES ('1459', '171', '逊克县', '3', '0');
INSERT INTO `zc_region` VALUES ('1460', '171', '孙吴县', '3', '0');
INSERT INTO `zc_region` VALUES ('1461', '172', '鸡冠区', '3', '0');
INSERT INTO `zc_region` VALUES ('1462', '172', '恒山区', '3', '0');
INSERT INTO `zc_region` VALUES ('1463', '172', '城子河区', '3', '0');
INSERT INTO `zc_region` VALUES ('1464', '172', '滴道区', '3', '0');
INSERT INTO `zc_region` VALUES ('1465', '172', '梨树区', '3', '0');
INSERT INTO `zc_region` VALUES ('1466', '172', '虎林市', '3', '0');
INSERT INTO `zc_region` VALUES ('1467', '172', '密山市', '3', '0');
INSERT INTO `zc_region` VALUES ('1468', '172', '鸡东县', '3', '0');
INSERT INTO `zc_region` VALUES ('1469', '173', '前进区', '3', '0');
INSERT INTO `zc_region` VALUES ('1470', '173', '郊区', '3', '0');
INSERT INTO `zc_region` VALUES ('1471', '173', '向阳区', '3', '0');
INSERT INTO `zc_region` VALUES ('1472', '173', '东风区', '3', '0');
INSERT INTO `zc_region` VALUES ('1473', '173', '同江市', '3', '0');
INSERT INTO `zc_region` VALUES ('1474', '173', '富锦市', '3', '0');
INSERT INTO `zc_region` VALUES ('1475', '173', '桦南县', '3', '0');
INSERT INTO `zc_region` VALUES ('1476', '173', '桦川县', '3', '0');
INSERT INTO `zc_region` VALUES ('1477', '173', '汤原县', '3', '0');
INSERT INTO `zc_region` VALUES ('1478', '173', '抚远县', '3', '0');
INSERT INTO `zc_region` VALUES ('1479', '174', '爱民区', '3', '0');
INSERT INTO `zc_region` VALUES ('1480', '174', '东安区', '3', '0');
INSERT INTO `zc_region` VALUES ('1481', '174', '阳明区', '3', '0');
INSERT INTO `zc_region` VALUES ('1482', '174', '西安区', '3', '0');
INSERT INTO `zc_region` VALUES ('1483', '174', '绥芬河市', '3', '0');
INSERT INTO `zc_region` VALUES ('1484', '174', '海林市', '3', '0');
INSERT INTO `zc_region` VALUES ('1485', '174', '宁安市', '3', '0');
INSERT INTO `zc_region` VALUES ('1486', '174', '穆棱市', '3', '0');
INSERT INTO `zc_region` VALUES ('1487', '174', '东宁县', '3', '0');
INSERT INTO `zc_region` VALUES ('1488', '174', '林口县', '3', '0');
INSERT INTO `zc_region` VALUES ('1489', '175', '桃山区', '3', '0');
INSERT INTO `zc_region` VALUES ('1490', '175', '新兴区', '3', '0');
INSERT INTO `zc_region` VALUES ('1491', '175', '茄子河区', '3', '0');
INSERT INTO `zc_region` VALUES ('1492', '175', '勃利县', '3', '0');
INSERT INTO `zc_region` VALUES ('1493', '176', '龙沙区', '3', '0');
INSERT INTO `zc_region` VALUES ('1494', '176', '昂昂溪区', '3', '0');
INSERT INTO `zc_region` VALUES ('1495', '176', '铁峰区', '3', '0');
INSERT INTO `zc_region` VALUES ('1496', '176', '建华区', '3', '0');
INSERT INTO `zc_region` VALUES ('1497', '176', '富拉尔基区', '3', '0');
INSERT INTO `zc_region` VALUES ('1498', '176', '碾子山区', '3', '0');
INSERT INTO `zc_region` VALUES ('1499', '176', '梅里斯达斡尔区', '3', '0');
INSERT INTO `zc_region` VALUES ('1500', '176', '讷河市', '3', '0');
INSERT INTO `zc_region` VALUES ('1501', '176', '龙江县', '3', '0');
INSERT INTO `zc_region` VALUES ('1502', '176', '依安县', '3', '0');
INSERT INTO `zc_region` VALUES ('1503', '176', '泰来县', '3', '0');
INSERT INTO `zc_region` VALUES ('1504', '176', '甘南县', '3', '0');
INSERT INTO `zc_region` VALUES ('1505', '176', '富裕县', '3', '0');
INSERT INTO `zc_region` VALUES ('1506', '176', '克山县', '3', '0');
INSERT INTO `zc_region` VALUES ('1507', '176', '克东县', '3', '0');
INSERT INTO `zc_region` VALUES ('1508', '176', '拜泉县', '3', '0');
INSERT INTO `zc_region` VALUES ('1509', '177', '尖山区', '3', '0');
INSERT INTO `zc_region` VALUES ('1510', '177', '岭东区', '3', '0');
INSERT INTO `zc_region` VALUES ('1511', '177', '四方台区', '3', '0');
INSERT INTO `zc_region` VALUES ('1512', '177', '宝山区', '3', '0');
INSERT INTO `zc_region` VALUES ('1513', '177', '集贤县', '3', '0');
INSERT INTO `zc_region` VALUES ('1514', '177', '友谊县', '3', '0');
INSERT INTO `zc_region` VALUES ('1515', '177', '宝清县', '3', '0');
INSERT INTO `zc_region` VALUES ('1516', '177', '饶河县', '3', '0');
INSERT INTO `zc_region` VALUES ('1517', '178', '北林区', '3', '0');
INSERT INTO `zc_region` VALUES ('1518', '178', '安达市', '3', '0');
INSERT INTO `zc_region` VALUES ('1519', '178', '肇东市', '3', '0');
INSERT INTO `zc_region` VALUES ('1520', '178', '海伦市', '3', '0');
INSERT INTO `zc_region` VALUES ('1521', '178', '望奎县', '3', '0');
INSERT INTO `zc_region` VALUES ('1522', '178', '兰西县', '3', '0');
INSERT INTO `zc_region` VALUES ('1523', '178', '青冈县', '3', '0');
INSERT INTO `zc_region` VALUES ('1524', '178', '庆安县', '3', '0');
INSERT INTO `zc_region` VALUES ('1525', '178', '明水县', '3', '0');
INSERT INTO `zc_region` VALUES ('1526', '178', '绥棱县', '3', '0');
INSERT INTO `zc_region` VALUES ('1527', '179', '伊春区', '3', '0');
INSERT INTO `zc_region` VALUES ('1528', '179', '带岭区', '3', '0');
INSERT INTO `zc_region` VALUES ('1529', '179', '南岔区', '3', '0');
INSERT INTO `zc_region` VALUES ('1530', '179', '金山屯区', '3', '0');
INSERT INTO `zc_region` VALUES ('1531', '179', '西林区', '3', '0');
INSERT INTO `zc_region` VALUES ('1532', '179', '美溪区', '3', '0');
INSERT INTO `zc_region` VALUES ('1533', '179', '乌马河区', '3', '0');
INSERT INTO `zc_region` VALUES ('1534', '179', '翠峦区', '3', '0');
INSERT INTO `zc_region` VALUES ('1535', '179', '友好区', '3', '0');
INSERT INTO `zc_region` VALUES ('1536', '179', '上甘岭区', '3', '0');
INSERT INTO `zc_region` VALUES ('1537', '179', '五营区', '3', '0');
INSERT INTO `zc_region` VALUES ('1538', '179', '红星区', '3', '0');
INSERT INTO `zc_region` VALUES ('1539', '179', '新青区', '3', '0');
INSERT INTO `zc_region` VALUES ('1540', '179', '汤旺河区', '3', '0');
INSERT INTO `zc_region` VALUES ('1541', '179', '乌伊岭区', '3', '0');
INSERT INTO `zc_region` VALUES ('1542', '179', '铁力市', '3', '0');
INSERT INTO `zc_region` VALUES ('1543', '179', '嘉荫县', '3', '0');
INSERT INTO `zc_region` VALUES ('1544', '180', '江岸区', '3', '0');
INSERT INTO `zc_region` VALUES ('1545', '180', '武昌区', '3', '0');
INSERT INTO `zc_region` VALUES ('1546', '180', '江汉区', '3', '0');
INSERT INTO `zc_region` VALUES ('1547', '180', '硚口区', '3', '0');
INSERT INTO `zc_region` VALUES ('1548', '180', '汉阳区', '3', '0');
INSERT INTO `zc_region` VALUES ('1549', '180', '青山区', '3', '0');
INSERT INTO `zc_region` VALUES ('1550', '180', '洪山区', '3', '0');
INSERT INTO `zc_region` VALUES ('1551', '180', '东西湖区', '3', '0');
INSERT INTO `zc_region` VALUES ('1552', '180', '汉南区', '3', '0');
INSERT INTO `zc_region` VALUES ('1553', '180', '蔡甸区', '3', '0');
INSERT INTO `zc_region` VALUES ('1554', '180', '江夏区', '3', '0');
INSERT INTO `zc_region` VALUES ('1555', '180', '黄陂区', '3', '0');
INSERT INTO `zc_region` VALUES ('1556', '180', '新洲区', '3', '0');
INSERT INTO `zc_region` VALUES ('1557', '180', '经济开发区', '3', '0');
INSERT INTO `zc_region` VALUES ('1558', '181', '仙桃市', '3', '0');
INSERT INTO `zc_region` VALUES ('1559', '182', '鄂城区', '3', '0');
INSERT INTO `zc_region` VALUES ('1560', '182', '华容区', '3', '0');
INSERT INTO `zc_region` VALUES ('1561', '182', '梁子湖区', '3', '0');
INSERT INTO `zc_region` VALUES ('1562', '183', '黄州区', '3', '0');
INSERT INTO `zc_region` VALUES ('1563', '183', '麻城市', '3', '0');
INSERT INTO `zc_region` VALUES ('1564', '183', '武穴市', '3', '0');
INSERT INTO `zc_region` VALUES ('1565', '183', '团风县', '3', '0');
INSERT INTO `zc_region` VALUES ('1566', '183', '红安县', '3', '0');
INSERT INTO `zc_region` VALUES ('1567', '183', '罗田县', '3', '0');
INSERT INTO `zc_region` VALUES ('1568', '183', '英山县', '3', '0');
INSERT INTO `zc_region` VALUES ('1569', '183', '浠水县', '3', '0');
INSERT INTO `zc_region` VALUES ('1570', '183', '蕲春县', '3', '0');
INSERT INTO `zc_region` VALUES ('1571', '183', '黄梅县', '3', '0');
INSERT INTO `zc_region` VALUES ('1572', '184', '黄石港区', '3', '0');
INSERT INTO `zc_region` VALUES ('1573', '184', '西塞山区', '3', '0');
INSERT INTO `zc_region` VALUES ('1574', '184', '下陆区', '3', '0');
INSERT INTO `zc_region` VALUES ('1575', '184', '铁山区', '3', '0');
INSERT INTO `zc_region` VALUES ('1576', '184', '大冶市', '3', '0');
INSERT INTO `zc_region` VALUES ('1577', '184', '阳新县', '3', '0');
INSERT INTO `zc_region` VALUES ('1578', '185', '东宝区', '3', '0');
INSERT INTO `zc_region` VALUES ('1579', '185', '掇刀区', '3', '0');
INSERT INTO `zc_region` VALUES ('1580', '185', '钟祥市', '3', '0');
INSERT INTO `zc_region` VALUES ('1581', '185', '京山县', '3', '0');
INSERT INTO `zc_region` VALUES ('1582', '185', '沙洋县', '3', '0');
INSERT INTO `zc_region` VALUES ('1583', '186', '沙市区', '3', '0');
INSERT INTO `zc_region` VALUES ('1584', '186', '荆州区', '3', '0');
INSERT INTO `zc_region` VALUES ('1585', '186', '石首市', '3', '0');
INSERT INTO `zc_region` VALUES ('1586', '186', '洪湖市', '3', '0');
INSERT INTO `zc_region` VALUES ('1587', '186', '松滋市', '3', '0');
INSERT INTO `zc_region` VALUES ('1588', '186', '公安县', '3', '0');
INSERT INTO `zc_region` VALUES ('1589', '186', '监利县', '3', '0');
INSERT INTO `zc_region` VALUES ('1590', '186', '江陵县', '3', '0');
INSERT INTO `zc_region` VALUES ('1591', '187', '潜江市', '3', '0');
INSERT INTO `zc_region` VALUES ('1592', '188', '神农架林区', '3', '0');
INSERT INTO `zc_region` VALUES ('1593', '189', '张湾区', '3', '0');
INSERT INTO `zc_region` VALUES ('1594', '189', '茅箭区', '3', '0');
INSERT INTO `zc_region` VALUES ('1595', '189', '丹江口市', '3', '0');
INSERT INTO `zc_region` VALUES ('1596', '189', '郧县', '3', '0');
INSERT INTO `zc_region` VALUES ('1597', '189', '郧西县', '3', '0');
INSERT INTO `zc_region` VALUES ('1598', '189', '竹山县', '3', '0');
INSERT INTO `zc_region` VALUES ('1599', '189', '竹溪县', '3', '0');
INSERT INTO `zc_region` VALUES ('1600', '189', '房县', '3', '0');
INSERT INTO `zc_region` VALUES ('1601', '190', '曾都区', '3', '0');
INSERT INTO `zc_region` VALUES ('1602', '190', '广水市', '3', '0');
INSERT INTO `zc_region` VALUES ('1603', '191', '天门市', '3', '0');
INSERT INTO `zc_region` VALUES ('1604', '192', '咸安区', '3', '0');
INSERT INTO `zc_region` VALUES ('1605', '192', '赤壁市', '3', '0');
INSERT INTO `zc_region` VALUES ('1606', '192', '嘉鱼县', '3', '0');
INSERT INTO `zc_region` VALUES ('1607', '192', '通城县', '3', '0');
INSERT INTO `zc_region` VALUES ('1608', '192', '崇阳县', '3', '0');
INSERT INTO `zc_region` VALUES ('1609', '192', '通山县', '3', '0');
INSERT INTO `zc_region` VALUES ('1610', '193', '襄城区', '3', '0');
INSERT INTO `zc_region` VALUES ('1611', '193', '樊城区', '3', '0');
INSERT INTO `zc_region` VALUES ('1612', '193', '襄阳区', '3', '0');
INSERT INTO `zc_region` VALUES ('1613', '193', '老河口市', '3', '0');
INSERT INTO `zc_region` VALUES ('1614', '193', '枣阳市', '3', '0');
INSERT INTO `zc_region` VALUES ('1615', '193', '宜城市', '3', '0');
INSERT INTO `zc_region` VALUES ('1616', '193', '南漳县', '3', '0');
INSERT INTO `zc_region` VALUES ('1617', '193', '谷城县', '3', '0');
INSERT INTO `zc_region` VALUES ('1618', '193', '保康县', '3', '0');
INSERT INTO `zc_region` VALUES ('1619', '194', '孝南区', '3', '0');
INSERT INTO `zc_region` VALUES ('1620', '194', '应城市', '3', '0');
INSERT INTO `zc_region` VALUES ('1621', '194', '安陆市', '3', '0');
INSERT INTO `zc_region` VALUES ('1622', '194', '汉川市', '3', '0');
INSERT INTO `zc_region` VALUES ('1623', '194', '孝昌县', '3', '0');
INSERT INTO `zc_region` VALUES ('1624', '194', '大悟县', '3', '0');
INSERT INTO `zc_region` VALUES ('1625', '194', '云梦县', '3', '0');
INSERT INTO `zc_region` VALUES ('1626', '195', '长阳', '3', '0');
INSERT INTO `zc_region` VALUES ('1627', '195', '五峰', '3', '0');
INSERT INTO `zc_region` VALUES ('1628', '195', '西陵区', '3', '0');
INSERT INTO `zc_region` VALUES ('1629', '195', '伍家岗区', '3', '0');
INSERT INTO `zc_region` VALUES ('1630', '195', '点军区', '3', '0');
INSERT INTO `zc_region` VALUES ('1631', '195', '猇亭区', '3', '0');
INSERT INTO `zc_region` VALUES ('1632', '195', '夷陵区', '3', '0');
INSERT INTO `zc_region` VALUES ('1633', '195', '宜都市', '3', '0');
INSERT INTO `zc_region` VALUES ('1634', '195', '当阳市', '3', '0');
INSERT INTO `zc_region` VALUES ('1635', '195', '枝江市', '3', '0');
INSERT INTO `zc_region` VALUES ('1636', '195', '远安县', '3', '0');
INSERT INTO `zc_region` VALUES ('1637', '195', '兴山县', '3', '0');
INSERT INTO `zc_region` VALUES ('1638', '195', '秭归县', '3', '0');
INSERT INTO `zc_region` VALUES ('1639', '196', '恩施市', '3', '0');
INSERT INTO `zc_region` VALUES ('1640', '196', '利川市', '3', '0');
INSERT INTO `zc_region` VALUES ('1641', '196', '建始县', '3', '0');
INSERT INTO `zc_region` VALUES ('1642', '196', '巴东县', '3', '0');
INSERT INTO `zc_region` VALUES ('1643', '196', '宣恩县', '3', '0');
INSERT INTO `zc_region` VALUES ('1644', '196', '咸丰县', '3', '0');
INSERT INTO `zc_region` VALUES ('1645', '196', '来凤县', '3', '0');
INSERT INTO `zc_region` VALUES ('1646', '196', '鹤峰县', '3', '0');
INSERT INTO `zc_region` VALUES ('1647', '197', '岳麓区', '3', '0');
INSERT INTO `zc_region` VALUES ('1648', '197', '芙蓉区', '3', '0');
INSERT INTO `zc_region` VALUES ('1649', '197', '天心区', '3', '0');
INSERT INTO `zc_region` VALUES ('1650', '197', '开福区', '3', '0');
INSERT INTO `zc_region` VALUES ('1651', '197', '雨花区', '3', '0');
INSERT INTO `zc_region` VALUES ('1652', '197', '开发区', '3', '0');
INSERT INTO `zc_region` VALUES ('1653', '197', '浏阳市', '3', '0');
INSERT INTO `zc_region` VALUES ('1654', '197', '长沙县', '3', '0');
INSERT INTO `zc_region` VALUES ('1655', '197', '望城县', '3', '0');
INSERT INTO `zc_region` VALUES ('1656', '197', '宁乡县', '3', '0');
INSERT INTO `zc_region` VALUES ('1657', '198', '永定区', '3', '0');
INSERT INTO `zc_region` VALUES ('1658', '198', '武陵源区', '3', '0');
INSERT INTO `zc_region` VALUES ('1659', '198', '慈利县', '3', '0');
INSERT INTO `zc_region` VALUES ('1660', '198', '桑植县', '3', '0');
INSERT INTO `zc_region` VALUES ('1661', '199', '武陵区', '3', '0');
INSERT INTO `zc_region` VALUES ('1662', '199', '鼎城区', '3', '0');
INSERT INTO `zc_region` VALUES ('1663', '199', '津市市', '3', '0');
INSERT INTO `zc_region` VALUES ('1664', '199', '安乡县', '3', '0');
INSERT INTO `zc_region` VALUES ('1665', '199', '汉寿县', '3', '0');
INSERT INTO `zc_region` VALUES ('1666', '199', '澧县', '3', '0');
INSERT INTO `zc_region` VALUES ('1667', '199', '临澧县', '3', '0');
INSERT INTO `zc_region` VALUES ('1668', '199', '桃源县', '3', '0');
INSERT INTO `zc_region` VALUES ('1669', '199', '石门县', '3', '0');
INSERT INTO `zc_region` VALUES ('1670', '200', '北湖区', '3', '0');
INSERT INTO `zc_region` VALUES ('1671', '200', '苏仙区', '3', '0');
INSERT INTO `zc_region` VALUES ('1672', '200', '资兴市', '3', '0');
INSERT INTO `zc_region` VALUES ('1673', '200', '桂阳县', '3', '0');
INSERT INTO `zc_region` VALUES ('1674', '200', '宜章县', '3', '0');
INSERT INTO `zc_region` VALUES ('1675', '200', '永兴县', '3', '0');
INSERT INTO `zc_region` VALUES ('1676', '200', '嘉禾县', '3', '0');
INSERT INTO `zc_region` VALUES ('1677', '200', '临武县', '3', '0');
INSERT INTO `zc_region` VALUES ('1678', '200', '汝城县', '3', '0');
INSERT INTO `zc_region` VALUES ('1679', '200', '桂东县', '3', '0');
INSERT INTO `zc_region` VALUES ('1680', '200', '安仁县', '3', '0');
INSERT INTO `zc_region` VALUES ('1681', '201', '雁峰区', '3', '0');
INSERT INTO `zc_region` VALUES ('1682', '201', '珠晖区', '3', '0');
INSERT INTO `zc_region` VALUES ('1683', '201', '石鼓区', '3', '0');
INSERT INTO `zc_region` VALUES ('1684', '201', '蒸湘区', '3', '0');
INSERT INTO `zc_region` VALUES ('1685', '201', '南岳区', '3', '0');
INSERT INTO `zc_region` VALUES ('1686', '201', '耒阳市', '3', '0');
INSERT INTO `zc_region` VALUES ('1687', '201', '常宁市', '3', '0');
INSERT INTO `zc_region` VALUES ('1688', '201', '衡阳县', '3', '0');
INSERT INTO `zc_region` VALUES ('1689', '201', '衡南县', '3', '0');
INSERT INTO `zc_region` VALUES ('1690', '201', '衡山县', '3', '0');
INSERT INTO `zc_region` VALUES ('1691', '201', '衡东县', '3', '0');
INSERT INTO `zc_region` VALUES ('1692', '201', '祁东县', '3', '0');
INSERT INTO `zc_region` VALUES ('1693', '202', '鹤城区', '3', '0');
INSERT INTO `zc_region` VALUES ('1694', '202', '靖州', '3', '0');
INSERT INTO `zc_region` VALUES ('1695', '202', '麻阳', '3', '0');
INSERT INTO `zc_region` VALUES ('1696', '202', '通道', '3', '0');
INSERT INTO `zc_region` VALUES ('1697', '202', '新晃', '3', '0');
INSERT INTO `zc_region` VALUES ('1698', '202', '芷江', '3', '0');
INSERT INTO `zc_region` VALUES ('1699', '202', '沅陵县', '3', '0');
INSERT INTO `zc_region` VALUES ('1700', '202', '辰溪县', '3', '0');
INSERT INTO `zc_region` VALUES ('1701', '202', '溆浦县', '3', '0');
INSERT INTO `zc_region` VALUES ('1702', '202', '中方县', '3', '0');
INSERT INTO `zc_region` VALUES ('1703', '202', '会同县', '3', '0');
INSERT INTO `zc_region` VALUES ('1704', '202', '洪江市', '3', '0');
INSERT INTO `zc_region` VALUES ('1705', '203', '娄星区', '3', '0');
INSERT INTO `zc_region` VALUES ('1706', '203', '冷水江市', '3', '0');
INSERT INTO `zc_region` VALUES ('1707', '203', '涟源市', '3', '0');
INSERT INTO `zc_region` VALUES ('1708', '203', '双峰县', '3', '0');
INSERT INTO `zc_region` VALUES ('1709', '203', '新化县', '3', '0');
INSERT INTO `zc_region` VALUES ('1710', '204', '城步', '3', '0');
INSERT INTO `zc_region` VALUES ('1711', '204', '双清区', '3', '0');
INSERT INTO `zc_region` VALUES ('1712', '204', '大祥区', '3', '0');
INSERT INTO `zc_region` VALUES ('1713', '204', '北塔区', '3', '0');
INSERT INTO `zc_region` VALUES ('1714', '204', '武冈市', '3', '0');
INSERT INTO `zc_region` VALUES ('1715', '204', '邵东县', '3', '0');
INSERT INTO `zc_region` VALUES ('1716', '204', '新邵县', '3', '0');
INSERT INTO `zc_region` VALUES ('1717', '204', '邵阳县', '3', '0');
INSERT INTO `zc_region` VALUES ('1718', '204', '隆回县', '3', '0');
INSERT INTO `zc_region` VALUES ('1719', '204', '洞口县', '3', '0');
INSERT INTO `zc_region` VALUES ('1720', '204', '绥宁县', '3', '0');
INSERT INTO `zc_region` VALUES ('1721', '204', '新宁县', '3', '0');
INSERT INTO `zc_region` VALUES ('1722', '205', '岳塘区', '3', '0');
INSERT INTO `zc_region` VALUES ('1723', '205', '雨湖区', '3', '0');
INSERT INTO `zc_region` VALUES ('1724', '205', '湘乡市', '3', '0');
INSERT INTO `zc_region` VALUES ('1725', '205', '韶山市', '3', '0');
INSERT INTO `zc_region` VALUES ('1726', '205', '湘潭县', '3', '0');
INSERT INTO `zc_region` VALUES ('1727', '206', '吉首市', '3', '0');
INSERT INTO `zc_region` VALUES ('1728', '206', '泸溪县', '3', '0');
INSERT INTO `zc_region` VALUES ('1729', '206', '凤凰县', '3', '0');
INSERT INTO `zc_region` VALUES ('1730', '206', '花垣县', '3', '0');
INSERT INTO `zc_region` VALUES ('1731', '206', '保靖县', '3', '0');
INSERT INTO `zc_region` VALUES ('1732', '206', '古丈县', '3', '0');
INSERT INTO `zc_region` VALUES ('1733', '206', '永顺县', '3', '0');
INSERT INTO `zc_region` VALUES ('1734', '206', '龙山县', '3', '0');
INSERT INTO `zc_region` VALUES ('1735', '207', '赫山区', '3', '0');
INSERT INTO `zc_region` VALUES ('1736', '207', '资阳区', '3', '0');
INSERT INTO `zc_region` VALUES ('1737', '207', '沅江市', '3', '0');
INSERT INTO `zc_region` VALUES ('1738', '207', '南县', '3', '0');
INSERT INTO `zc_region` VALUES ('1739', '207', '桃江县', '3', '0');
INSERT INTO `zc_region` VALUES ('1740', '207', '安化县', '3', '0');
INSERT INTO `zc_region` VALUES ('1741', '208', '江华', '3', '0');
INSERT INTO `zc_region` VALUES ('1742', '208', '冷水滩区', '3', '0');
INSERT INTO `zc_region` VALUES ('1743', '208', '零陵区', '3', '0');
INSERT INTO `zc_region` VALUES ('1744', '208', '祁阳县', '3', '0');
INSERT INTO `zc_region` VALUES ('1745', '208', '东安县', '3', '0');
INSERT INTO `zc_region` VALUES ('1746', '208', '双牌县', '3', '0');
INSERT INTO `zc_region` VALUES ('1747', '208', '道县', '3', '0');
INSERT INTO `zc_region` VALUES ('1748', '208', '江永县', '3', '0');
INSERT INTO `zc_region` VALUES ('1749', '208', '宁远县', '3', '0');
INSERT INTO `zc_region` VALUES ('1750', '208', '蓝山县', '3', '0');
INSERT INTO `zc_region` VALUES ('1751', '208', '新田县', '3', '0');
INSERT INTO `zc_region` VALUES ('1752', '209', '岳阳楼区', '3', '0');
INSERT INTO `zc_region` VALUES ('1753', '209', '君山区', '3', '0');
INSERT INTO `zc_region` VALUES ('1754', '209', '云溪区', '3', '0');
INSERT INTO `zc_region` VALUES ('1755', '209', '汨罗市', '3', '0');
INSERT INTO `zc_region` VALUES ('1756', '209', '临湘市', '3', '0');
INSERT INTO `zc_region` VALUES ('1757', '209', '岳阳县', '3', '0');
INSERT INTO `zc_region` VALUES ('1758', '209', '华容县', '3', '0');
INSERT INTO `zc_region` VALUES ('1759', '209', '湘阴县', '3', '0');
INSERT INTO `zc_region` VALUES ('1760', '209', '平江县', '3', '0');
INSERT INTO `zc_region` VALUES ('1761', '210', '天元区', '3', '0');
INSERT INTO `zc_region` VALUES ('1762', '210', '荷塘区', '3', '0');
INSERT INTO `zc_region` VALUES ('1763', '210', '芦淞区', '3', '0');
INSERT INTO `zc_region` VALUES ('1764', '210', '石峰区', '3', '0');
INSERT INTO `zc_region` VALUES ('1765', '210', '醴陵市', '3', '0');
INSERT INTO `zc_region` VALUES ('1766', '210', '株洲县', '3', '0');
INSERT INTO `zc_region` VALUES ('1767', '210', '攸县', '3', '0');
INSERT INTO `zc_region` VALUES ('1768', '210', '茶陵县', '3', '0');
INSERT INTO `zc_region` VALUES ('1769', '210', '炎陵县', '3', '0');
INSERT INTO `zc_region` VALUES ('1770', '211', '朝阳区', '3', '0');
INSERT INTO `zc_region` VALUES ('1771', '211', '宽城区', '3', '0');
INSERT INTO `zc_region` VALUES ('1772', '211', '二道区', '3', '0');
INSERT INTO `zc_region` VALUES ('1773', '211', '南关区', '3', '0');
INSERT INTO `zc_region` VALUES ('1774', '211', '绿园区', '3', '0');
INSERT INTO `zc_region` VALUES ('1775', '211', '双阳区', '3', '0');
INSERT INTO `zc_region` VALUES ('1776', '211', '净月潭开发区', '3', '0');
INSERT INTO `zc_region` VALUES ('1777', '211', '高新技术开发区', '3', '0');
INSERT INTO `zc_region` VALUES ('1778', '211', '经济技术开发区', '3', '0');
INSERT INTO `zc_region` VALUES ('1779', '211', '汽车产业开发区', '3', '0');
INSERT INTO `zc_region` VALUES ('1780', '211', '德惠市', '3', '0');
INSERT INTO `zc_region` VALUES ('1781', '211', '九台市', '3', '0');
INSERT INTO `zc_region` VALUES ('1782', '211', '榆树市', '3', '0');
INSERT INTO `zc_region` VALUES ('1783', '211', '农安县', '3', '0');
INSERT INTO `zc_region` VALUES ('1784', '212', '船营区', '3', '0');
INSERT INTO `zc_region` VALUES ('1785', '212', '昌邑区', '3', '0');
INSERT INTO `zc_region` VALUES ('1786', '212', '龙潭区', '3', '0');
INSERT INTO `zc_region` VALUES ('1787', '212', '丰满区', '3', '0');
INSERT INTO `zc_region` VALUES ('1788', '212', '蛟河市', '3', '0');
INSERT INTO `zc_region` VALUES ('1789', '212', '桦甸市', '3', '0');
INSERT INTO `zc_region` VALUES ('1790', '212', '舒兰市', '3', '0');
INSERT INTO `zc_region` VALUES ('1791', '212', '磐石市', '3', '0');
INSERT INTO `zc_region` VALUES ('1792', '212', '永吉县', '3', '0');
INSERT INTO `zc_region` VALUES ('1793', '213', '洮北区', '3', '0');
INSERT INTO `zc_region` VALUES ('1794', '213', '洮南市', '3', '0');
INSERT INTO `zc_region` VALUES ('1795', '213', '大安市', '3', '0');
INSERT INTO `zc_region` VALUES ('1796', '213', '镇赉县', '3', '0');
INSERT INTO `zc_region` VALUES ('1797', '213', '通榆县', '3', '0');
INSERT INTO `zc_region` VALUES ('1798', '214', '江源区', '3', '0');
INSERT INTO `zc_region` VALUES ('1799', '214', '八道江区', '3', '0');
INSERT INTO `zc_region` VALUES ('1800', '214', '长白', '3', '0');
INSERT INTO `zc_region` VALUES ('1801', '214', '临江市', '3', '0');
INSERT INTO `zc_region` VALUES ('1802', '214', '抚松县', '3', '0');
INSERT INTO `zc_region` VALUES ('1803', '214', '靖宇县', '3', '0');
INSERT INTO `zc_region` VALUES ('1804', '215', '龙山区', '3', '0');
INSERT INTO `zc_region` VALUES ('1805', '215', '西安区', '3', '0');
INSERT INTO `zc_region` VALUES ('1806', '215', '东丰县', '3', '0');
INSERT INTO `zc_region` VALUES ('1807', '215', '东辽县', '3', '0');
INSERT INTO `zc_region` VALUES ('1808', '216', '铁西区', '3', '0');
INSERT INTO `zc_region` VALUES ('1809', '216', '铁东区', '3', '0');
INSERT INTO `zc_region` VALUES ('1810', '216', '伊通', '3', '0');
INSERT INTO `zc_region` VALUES ('1811', '216', '公主岭市', '3', '0');
INSERT INTO `zc_region` VALUES ('1812', '216', '双辽市', '3', '0');
INSERT INTO `zc_region` VALUES ('1813', '216', '梨树县', '3', '0');
INSERT INTO `zc_region` VALUES ('1814', '217', '前郭尔罗斯', '3', '0');
INSERT INTO `zc_region` VALUES ('1815', '217', '宁江区', '3', '0');
INSERT INTO `zc_region` VALUES ('1816', '217', '长岭县', '3', '0');
INSERT INTO `zc_region` VALUES ('1817', '217', '乾安县', '3', '0');
INSERT INTO `zc_region` VALUES ('1818', '217', '扶余县', '3', '0');
INSERT INTO `zc_region` VALUES ('1819', '218', '东昌区', '3', '0');
INSERT INTO `zc_region` VALUES ('1820', '218', '二道江区', '3', '0');
INSERT INTO `zc_region` VALUES ('1821', '218', '梅河口市', '3', '0');
INSERT INTO `zc_region` VALUES ('1822', '218', '集安市', '3', '0');
INSERT INTO `zc_region` VALUES ('1823', '218', '通化县', '3', '0');
INSERT INTO `zc_region` VALUES ('1824', '218', '辉南县', '3', '0');
INSERT INTO `zc_region` VALUES ('1825', '218', '柳河县', '3', '0');
INSERT INTO `zc_region` VALUES ('1826', '219', '延吉市', '3', '0');
INSERT INTO `zc_region` VALUES ('1827', '219', '图们市', '3', '0');
INSERT INTO `zc_region` VALUES ('1828', '219', '敦化市', '3', '0');
INSERT INTO `zc_region` VALUES ('1829', '219', '珲春市', '3', '0');
INSERT INTO `zc_region` VALUES ('1830', '219', '龙井市', '3', '0');
INSERT INTO `zc_region` VALUES ('1831', '219', '和龙市', '3', '0');
INSERT INTO `zc_region` VALUES ('1832', '219', '安图县', '3', '0');
INSERT INTO `zc_region` VALUES ('1833', '219', '汪清县', '3', '0');
INSERT INTO `zc_region` VALUES ('1834', '220', '玄武区', '3', '0');
INSERT INTO `zc_region` VALUES ('1835', '220', '鼓楼区', '3', '0');
INSERT INTO `zc_region` VALUES ('1836', '220', '白下区', '3', '0');
INSERT INTO `zc_region` VALUES ('1837', '220', '建邺区', '3', '0');
INSERT INTO `zc_region` VALUES ('1838', '220', '秦淮区', '3', '0');
INSERT INTO `zc_region` VALUES ('1839', '220', '雨花台区', '3', '0');
INSERT INTO `zc_region` VALUES ('1840', '220', '下关区', '3', '0');
INSERT INTO `zc_region` VALUES ('1841', '220', '栖霞区', '3', '0');
INSERT INTO `zc_region` VALUES ('1842', '220', '浦口区', '3', '0');
INSERT INTO `zc_region` VALUES ('1843', '220', '江宁区', '3', '0');
INSERT INTO `zc_region` VALUES ('1844', '220', '六合区', '3', '0');
INSERT INTO `zc_region` VALUES ('1845', '220', '溧水县', '3', '0');
INSERT INTO `zc_region` VALUES ('1846', '220', '高淳县', '3', '0');
INSERT INTO `zc_region` VALUES ('1847', '221', '沧浪区', '3', '0');
INSERT INTO `zc_region` VALUES ('1848', '221', '金阊区', '3', '0');
INSERT INTO `zc_region` VALUES ('1849', '221', '平江区', '3', '0');
INSERT INTO `zc_region` VALUES ('1850', '221', '虎丘区', '3', '0');
INSERT INTO `zc_region` VALUES ('1851', '221', '吴中区', '3', '0');
INSERT INTO `zc_region` VALUES ('1852', '221', '相城区', '3', '0');
INSERT INTO `zc_region` VALUES ('1853', '221', '园区', '3', '0');
INSERT INTO `zc_region` VALUES ('1854', '221', '新区', '3', '0');
INSERT INTO `zc_region` VALUES ('1855', '221', '常熟市', '3', '0');
INSERT INTO `zc_region` VALUES ('1856', '221', '张家港市', '3', '0');
INSERT INTO `zc_region` VALUES ('1857', '221', '玉山镇', '3', '0');
INSERT INTO `zc_region` VALUES ('1858', '221', '巴城镇', '3', '0');
INSERT INTO `zc_region` VALUES ('1859', '221', '周市镇', '3', '0');
INSERT INTO `zc_region` VALUES ('1860', '221', '陆家镇', '3', '0');
INSERT INTO `zc_region` VALUES ('1861', '221', '花桥镇', '3', '0');
INSERT INTO `zc_region` VALUES ('1862', '221', '淀山湖镇', '3', '0');
INSERT INTO `zc_region` VALUES ('1863', '221', '张浦镇', '3', '0');
INSERT INTO `zc_region` VALUES ('1864', '221', '周庄镇', '3', '0');
INSERT INTO `zc_region` VALUES ('1865', '221', '千灯镇', '3', '0');
INSERT INTO `zc_region` VALUES ('1866', '221', '锦溪镇', '3', '0');
INSERT INTO `zc_region` VALUES ('1867', '221', '开发区', '3', '0');
INSERT INTO `zc_region` VALUES ('1868', '221', '吴江市', '3', '0');
INSERT INTO `zc_region` VALUES ('1869', '221', '太仓市', '3', '0');
INSERT INTO `zc_region` VALUES ('1870', '222', '崇安区', '3', '0');
INSERT INTO `zc_region` VALUES ('1871', '222', '北塘区', '3', '0');
INSERT INTO `zc_region` VALUES ('1872', '222', '南长区', '3', '0');
INSERT INTO `zc_region` VALUES ('1873', '222', '锡山区', '3', '0');
INSERT INTO `zc_region` VALUES ('1874', '222', '惠山区', '3', '0');
INSERT INTO `zc_region` VALUES ('1875', '222', '滨湖区', '3', '0');
INSERT INTO `zc_region` VALUES ('1876', '222', '新区', '3', '0');
INSERT INTO `zc_region` VALUES ('1877', '222', '江阴市', '3', '0');
INSERT INTO `zc_region` VALUES ('1878', '222', '宜兴市', '3', '0');
INSERT INTO `zc_region` VALUES ('1879', '223', '天宁区', '3', '0');
INSERT INTO `zc_region` VALUES ('1880', '223', '钟楼区', '3', '0');
INSERT INTO `zc_region` VALUES ('1881', '223', '戚墅堰区', '3', '0');
INSERT INTO `zc_region` VALUES ('1882', '223', '郊区', '3', '0');
INSERT INTO `zc_region` VALUES ('1883', '223', '新北区', '3', '0');
INSERT INTO `zc_region` VALUES ('1884', '223', '武进区', '3', '0');
INSERT INTO `zc_region` VALUES ('1885', '223', '溧阳市', '3', '0');
INSERT INTO `zc_region` VALUES ('1886', '223', '金坛市', '3', '0');
INSERT INTO `zc_region` VALUES ('1887', '224', '清河区', '3', '0');
INSERT INTO `zc_region` VALUES ('1888', '224', '清浦区', '3', '0');
INSERT INTO `zc_region` VALUES ('1889', '224', '楚州区', '3', '0');
INSERT INTO `zc_region` VALUES ('1890', '224', '淮阴区', '3', '0');
INSERT INTO `zc_region` VALUES ('1891', '224', '涟水县', '3', '0');
INSERT INTO `zc_region` VALUES ('1892', '224', '洪泽县', '3', '0');
INSERT INTO `zc_region` VALUES ('1893', '224', '盱眙县', '3', '0');
INSERT INTO `zc_region` VALUES ('1894', '224', '金湖县', '3', '0');
INSERT INTO `zc_region` VALUES ('1895', '225', '新浦区', '3', '0');
INSERT INTO `zc_region` VALUES ('1896', '225', '连云区', '3', '0');
INSERT INTO `zc_region` VALUES ('1897', '225', '海州区', '3', '0');
INSERT INTO `zc_region` VALUES ('1898', '225', '赣榆县', '3', '0');
INSERT INTO `zc_region` VALUES ('1899', '225', '东海县', '3', '0');
INSERT INTO `zc_region` VALUES ('1900', '225', '灌云县', '3', '0');
INSERT INTO `zc_region` VALUES ('1901', '225', '灌南县', '3', '0');
INSERT INTO `zc_region` VALUES ('1902', '226', '崇川区', '3', '0');
INSERT INTO `zc_region` VALUES ('1903', '226', '港闸区', '3', '0');
INSERT INTO `zc_region` VALUES ('1904', '226', '经济开发区', '3', '0');
INSERT INTO `zc_region` VALUES ('1905', '226', '启东市', '3', '0');
INSERT INTO `zc_region` VALUES ('1906', '226', '如皋市', '3', '0');
INSERT INTO `zc_region` VALUES ('1907', '226', '通州市', '3', '0');
INSERT INTO `zc_region` VALUES ('1908', '226', '海门市', '3', '0');
INSERT INTO `zc_region` VALUES ('1909', '226', '海安县', '3', '0');
INSERT INTO `zc_region` VALUES ('1910', '226', '如东县', '3', '0');
INSERT INTO `zc_region` VALUES ('1911', '227', '宿城区', '3', '0');
INSERT INTO `zc_region` VALUES ('1912', '227', '宿豫区', '3', '0');
INSERT INTO `zc_region` VALUES ('1913', '227', '宿豫县', '3', '0');
INSERT INTO `zc_region` VALUES ('1914', '227', '沭阳县', '3', '0');
INSERT INTO `zc_region` VALUES ('1915', '227', '泗阳县', '3', '0');
INSERT INTO `zc_region` VALUES ('1916', '227', '泗洪县', '3', '0');
INSERT INTO `zc_region` VALUES ('1917', '228', '海陵区', '3', '0');
INSERT INTO `zc_region` VALUES ('1918', '228', '高港区', '3', '0');
INSERT INTO `zc_region` VALUES ('1919', '228', '兴化市', '3', '0');
INSERT INTO `zc_region` VALUES ('1920', '228', '靖江市', '3', '0');
INSERT INTO `zc_region` VALUES ('1921', '228', '泰兴市', '3', '0');
INSERT INTO `zc_region` VALUES ('1922', '228', '姜堰市', '3', '0');
INSERT INTO `zc_region` VALUES ('1923', '229', '云龙区', '3', '0');
INSERT INTO `zc_region` VALUES ('1924', '229', '鼓楼区', '3', '0');
INSERT INTO `zc_region` VALUES ('1925', '229', '九里区', '3', '0');
INSERT INTO `zc_region` VALUES ('1926', '229', '贾汪区', '3', '0');
INSERT INTO `zc_region` VALUES ('1927', '229', '泉山区', '3', '0');
INSERT INTO `zc_region` VALUES ('1928', '229', '新沂市', '3', '0');
INSERT INTO `zc_region` VALUES ('1929', '229', '邳州市', '3', '0');
INSERT INTO `zc_region` VALUES ('1930', '229', '丰县', '3', '0');
INSERT INTO `zc_region` VALUES ('1931', '229', '沛县', '3', '0');
INSERT INTO `zc_region` VALUES ('1932', '229', '铜山县', '3', '0');
INSERT INTO `zc_region` VALUES ('1933', '229', '睢宁县', '3', '0');
INSERT INTO `zc_region` VALUES ('1934', '230', '城区', '3', '0');
INSERT INTO `zc_region` VALUES ('1935', '230', '亭湖区', '3', '0');
INSERT INTO `zc_region` VALUES ('1936', '230', '盐都区', '3', '0');
INSERT INTO `zc_region` VALUES ('1937', '230', '盐都县', '3', '0');
INSERT INTO `zc_region` VALUES ('1938', '230', '东台市', '3', '0');
INSERT INTO `zc_region` VALUES ('1939', '230', '大丰市', '3', '0');
INSERT INTO `zc_region` VALUES ('1940', '230', '响水县', '3', '0');
INSERT INTO `zc_region` VALUES ('1941', '230', '滨海县', '3', '0');
INSERT INTO `zc_region` VALUES ('1942', '230', '阜宁县', '3', '0');
INSERT INTO `zc_region` VALUES ('1943', '230', '射阳县', '3', '0');
INSERT INTO `zc_region` VALUES ('1944', '230', '建湖县', '3', '0');
INSERT INTO `zc_region` VALUES ('1945', '231', '广陵区', '3', '0');
INSERT INTO `zc_region` VALUES ('1946', '231', '维扬区', '3', '0');
INSERT INTO `zc_region` VALUES ('1947', '231', '邗江区', '3', '0');
INSERT INTO `zc_region` VALUES ('1948', '231', '仪征市', '3', '0');
INSERT INTO `zc_region` VALUES ('1949', '231', '高邮市', '3', '0');
INSERT INTO `zc_region` VALUES ('1950', '231', '江都市', '3', '0');
INSERT INTO `zc_region` VALUES ('1951', '231', '宝应县', '3', '0');
INSERT INTO `zc_region` VALUES ('1952', '232', '京口区', '3', '0');
INSERT INTO `zc_region` VALUES ('1953', '232', '润州区', '3', '0');
INSERT INTO `zc_region` VALUES ('1954', '232', '丹徒区', '3', '0');
INSERT INTO `zc_region` VALUES ('1955', '232', '丹阳市', '3', '0');
INSERT INTO `zc_region` VALUES ('1956', '232', '扬中市', '3', '0');
INSERT INTO `zc_region` VALUES ('1957', '232', '句容市', '3', '0');
INSERT INTO `zc_region` VALUES ('1958', '233', '东湖区', '3', '0');
INSERT INTO `zc_region` VALUES ('1959', '233', '西湖区', '3', '0');
INSERT INTO `zc_region` VALUES ('1960', '233', '青云谱区', '3', '0');
INSERT INTO `zc_region` VALUES ('1961', '233', '湾里区', '3', '0');
INSERT INTO `zc_region` VALUES ('1962', '233', '青山湖区', '3', '0');
INSERT INTO `zc_region` VALUES ('1963', '233', '红谷滩新区', '3', '0');
INSERT INTO `zc_region` VALUES ('1964', '233', '昌北区', '3', '0');
INSERT INTO `zc_region` VALUES ('1965', '233', '高新区', '3', '0');
INSERT INTO `zc_region` VALUES ('1966', '233', '南昌县', '3', '0');
INSERT INTO `zc_region` VALUES ('1967', '233', '新建县', '3', '0');
INSERT INTO `zc_region` VALUES ('1968', '233', '安义县', '3', '0');
INSERT INTO `zc_region` VALUES ('1969', '233', '进贤县', '3', '0');
INSERT INTO `zc_region` VALUES ('1970', '234', '临川区', '3', '0');
INSERT INTO `zc_region` VALUES ('1971', '234', '南城县', '3', '0');
INSERT INTO `zc_region` VALUES ('1972', '234', '黎川县', '3', '0');
INSERT INTO `zc_region` VALUES ('1973', '234', '南丰县', '3', '0');
INSERT INTO `zc_region` VALUES ('1974', '234', '崇仁县', '3', '0');
INSERT INTO `zc_region` VALUES ('1975', '234', '乐安县', '3', '0');
INSERT INTO `zc_region` VALUES ('1976', '234', '宜黄县', '3', '0');
INSERT INTO `zc_region` VALUES ('1977', '234', '金溪县', '3', '0');
INSERT INTO `zc_region` VALUES ('1978', '234', '资溪县', '3', '0');
INSERT INTO `zc_region` VALUES ('1979', '234', '东乡县', '3', '0');
INSERT INTO `zc_region` VALUES ('1980', '234', '广昌县', '3', '0');
INSERT INTO `zc_region` VALUES ('1981', '235', '章贡区', '3', '0');
INSERT INTO `zc_region` VALUES ('1982', '235', '于都县', '3', '0');
INSERT INTO `zc_region` VALUES ('1983', '235', '瑞金市', '3', '0');
INSERT INTO `zc_region` VALUES ('1984', '235', '南康市', '3', '0');
INSERT INTO `zc_region` VALUES ('1985', '235', '赣县', '3', '0');
INSERT INTO `zc_region` VALUES ('1986', '235', '信丰县', '3', '0');
INSERT INTO `zc_region` VALUES ('1987', '235', '大余县', '3', '0');
INSERT INTO `zc_region` VALUES ('1988', '235', '上犹县', '3', '0');
INSERT INTO `zc_region` VALUES ('1989', '235', '崇义县', '3', '0');
INSERT INTO `zc_region` VALUES ('1990', '235', '安远县', '3', '0');
INSERT INTO `zc_region` VALUES ('1991', '235', '龙南县', '3', '0');
INSERT INTO `zc_region` VALUES ('1992', '235', '定南县', '3', '0');
INSERT INTO `zc_region` VALUES ('1993', '235', '全南县', '3', '0');
INSERT INTO `zc_region` VALUES ('1994', '235', '宁都县', '3', '0');
INSERT INTO `zc_region` VALUES ('1995', '235', '兴国县', '3', '0');
INSERT INTO `zc_region` VALUES ('1996', '235', '会昌县', '3', '0');
INSERT INTO `zc_region` VALUES ('1997', '235', '寻乌县', '3', '0');
INSERT INTO `zc_region` VALUES ('1998', '235', '石城县', '3', '0');
INSERT INTO `zc_region` VALUES ('1999', '236', '安福县', '3', '0');
INSERT INTO `zc_region` VALUES ('2000', '236', '吉州区', '3', '0');
INSERT INTO `zc_region` VALUES ('2001', '236', '青原区', '3', '0');
INSERT INTO `zc_region` VALUES ('2002', '236', '井冈山市', '3', '0');
INSERT INTO `zc_region` VALUES ('2003', '236', '吉安县', '3', '0');
INSERT INTO `zc_region` VALUES ('2004', '236', '吉水县', '3', '0');
INSERT INTO `zc_region` VALUES ('2005', '236', '峡江县', '3', '0');
INSERT INTO `zc_region` VALUES ('2006', '236', '新干县', '3', '0');
INSERT INTO `zc_region` VALUES ('2007', '236', '永丰县', '3', '0');
INSERT INTO `zc_region` VALUES ('2008', '236', '泰和县', '3', '0');
INSERT INTO `zc_region` VALUES ('2009', '236', '遂川县', '3', '0');
INSERT INTO `zc_region` VALUES ('2010', '236', '万安县', '3', '0');
INSERT INTO `zc_region` VALUES ('2011', '236', '永新县', '3', '0');
INSERT INTO `zc_region` VALUES ('2012', '237', '珠山区', '3', '0');
INSERT INTO `zc_region` VALUES ('2013', '237', '昌江区', '3', '0');
INSERT INTO `zc_region` VALUES ('2014', '237', '乐平市', '3', '0');
INSERT INTO `zc_region` VALUES ('2015', '237', '浮梁县', '3', '0');
INSERT INTO `zc_region` VALUES ('2016', '238', '浔阳区', '3', '0');
INSERT INTO `zc_region` VALUES ('2017', '238', '庐山区', '3', '0');
INSERT INTO `zc_region` VALUES ('2018', '238', '瑞昌市', '3', '0');
INSERT INTO `zc_region` VALUES ('2019', '238', '九江县', '3', '0');
INSERT INTO `zc_region` VALUES ('2020', '238', '武宁县', '3', '0');
INSERT INTO `zc_region` VALUES ('2021', '238', '修水县', '3', '0');
INSERT INTO `zc_region` VALUES ('2022', '238', '永修县', '3', '0');
INSERT INTO `zc_region` VALUES ('2023', '238', '德安县', '3', '0');
INSERT INTO `zc_region` VALUES ('2024', '238', '星子县', '3', '0');
INSERT INTO `zc_region` VALUES ('2025', '238', '都昌县', '3', '0');
INSERT INTO `zc_region` VALUES ('2026', '238', '湖口县', '3', '0');
INSERT INTO `zc_region` VALUES ('2027', '238', '彭泽县', '3', '0');
INSERT INTO `zc_region` VALUES ('2028', '239', '安源区', '3', '0');
INSERT INTO `zc_region` VALUES ('2029', '239', '湘东区', '3', '0');
INSERT INTO `zc_region` VALUES ('2030', '239', '莲花县', '3', '0');
INSERT INTO `zc_region` VALUES ('2031', '239', '芦溪县', '3', '0');
INSERT INTO `zc_region` VALUES ('2032', '239', '上栗县', '3', '0');
INSERT INTO `zc_region` VALUES ('2033', '240', '信州区', '3', '0');
INSERT INTO `zc_region` VALUES ('2034', '240', '德兴市', '3', '0');
INSERT INTO `zc_region` VALUES ('2035', '240', '上饶县', '3', '0');
INSERT INTO `zc_region` VALUES ('2036', '240', '广丰县', '3', '0');
INSERT INTO `zc_region` VALUES ('2037', '240', '玉山县', '3', '0');
INSERT INTO `zc_region` VALUES ('2038', '240', '铅山县', '3', '0');
INSERT INTO `zc_region` VALUES ('2039', '240', '横峰县', '3', '0');
INSERT INTO `zc_region` VALUES ('2040', '240', '弋阳县', '3', '0');
INSERT INTO `zc_region` VALUES ('2041', '240', '余干县', '3', '0');
INSERT INTO `zc_region` VALUES ('2042', '240', '波阳县', '3', '0');
INSERT INTO `zc_region` VALUES ('2043', '240', '万年县', '3', '0');
INSERT INTO `zc_region` VALUES ('2044', '240', '婺源县', '3', '0');
INSERT INTO `zc_region` VALUES ('2045', '241', '渝水区', '3', '0');
INSERT INTO `zc_region` VALUES ('2046', '241', '分宜县', '3', '0');
INSERT INTO `zc_region` VALUES ('2047', '242', '袁州区', '3', '0');
INSERT INTO `zc_region` VALUES ('2048', '242', '丰城市', '3', '0');
INSERT INTO `zc_region` VALUES ('2049', '242', '樟树市', '3', '0');
INSERT INTO `zc_region` VALUES ('2050', '242', '高安市', '3', '0');
INSERT INTO `zc_region` VALUES ('2051', '242', '奉新县', '3', '0');
INSERT INTO `zc_region` VALUES ('2052', '242', '万载县', '3', '0');
INSERT INTO `zc_region` VALUES ('2053', '242', '上高县', '3', '0');
INSERT INTO `zc_region` VALUES ('2054', '242', '宜丰县', '3', '0');
INSERT INTO `zc_region` VALUES ('2055', '242', '靖安县', '3', '0');
INSERT INTO `zc_region` VALUES ('2056', '242', '铜鼓县', '3', '0');
INSERT INTO `zc_region` VALUES ('2057', '243', '月湖区', '3', '0');
INSERT INTO `zc_region` VALUES ('2058', '243', '贵溪市', '3', '0');
INSERT INTO `zc_region` VALUES ('2059', '243', '余江县', '3', '0');
INSERT INTO `zc_region` VALUES ('2060', '244', '沈河区', '3', '0');
INSERT INTO `zc_region` VALUES ('2061', '244', '皇姑区', '3', '0');
INSERT INTO `zc_region` VALUES ('2062', '244', '和平区', '3', '0');
INSERT INTO `zc_region` VALUES ('2063', '244', '大东区', '3', '0');
INSERT INTO `zc_region` VALUES ('2064', '244', '铁西区', '3', '0');
INSERT INTO `zc_region` VALUES ('2065', '244', '苏家屯区', '3', '0');
INSERT INTO `zc_region` VALUES ('2066', '244', '东陵区', '3', '0');
INSERT INTO `zc_region` VALUES ('2067', '244', '沈北新区', '3', '0');
INSERT INTO `zc_region` VALUES ('2068', '244', '于洪区', '3', '0');
INSERT INTO `zc_region` VALUES ('2069', '244', '浑南新区', '3', '0');
INSERT INTO `zc_region` VALUES ('2070', '244', '新民市', '3', '0');
INSERT INTO `zc_region` VALUES ('2071', '244', '辽中县', '3', '0');
INSERT INTO `zc_region` VALUES ('2072', '244', '康平县', '3', '0');
INSERT INTO `zc_region` VALUES ('2073', '244', '法库县', '3', '0');
INSERT INTO `zc_region` VALUES ('2074', '245', '西岗区', '3', '0');
INSERT INTO `zc_region` VALUES ('2075', '245', '中山区', '3', '0');
INSERT INTO `zc_region` VALUES ('2076', '245', '沙河口区', '3', '0');
INSERT INTO `zc_region` VALUES ('2077', '245', '甘井子区', '3', '0');
INSERT INTO `zc_region` VALUES ('2078', '245', '旅顺口区', '3', '0');
INSERT INTO `zc_region` VALUES ('2079', '245', '金州区', '3', '0');
INSERT INTO `zc_region` VALUES ('2080', '245', '开发区', '3', '0');
INSERT INTO `zc_region` VALUES ('2081', '245', '瓦房店市', '3', '0');
INSERT INTO `zc_region` VALUES ('2082', '245', '普兰店市', '3', '0');
INSERT INTO `zc_region` VALUES ('2083', '245', '庄河市', '3', '0');
INSERT INTO `zc_region` VALUES ('2084', '245', '长海县', '3', '0');
INSERT INTO `zc_region` VALUES ('2085', '246', '铁东区', '3', '0');
INSERT INTO `zc_region` VALUES ('2086', '246', '铁西区', '3', '0');
INSERT INTO `zc_region` VALUES ('2087', '246', '立山区', '3', '0');
INSERT INTO `zc_region` VALUES ('2088', '246', '千山区', '3', '0');
INSERT INTO `zc_region` VALUES ('2089', '246', '岫岩', '3', '0');
INSERT INTO `zc_region` VALUES ('2090', '246', '海城市', '3', '0');
INSERT INTO `zc_region` VALUES ('2091', '246', '台安县', '3', '0');
INSERT INTO `zc_region` VALUES ('2092', '247', '本溪', '3', '0');
INSERT INTO `zc_region` VALUES ('2093', '247', '平山区', '3', '0');
INSERT INTO `zc_region` VALUES ('2094', '247', '明山区', '3', '0');
INSERT INTO `zc_region` VALUES ('2095', '247', '溪湖区', '3', '0');
INSERT INTO `zc_region` VALUES ('2096', '247', '南芬区', '3', '0');
INSERT INTO `zc_region` VALUES ('2097', '247', '桓仁', '3', '0');
INSERT INTO `zc_region` VALUES ('2098', '248', '双塔区', '3', '0');
INSERT INTO `zc_region` VALUES ('2099', '248', '龙城区', '3', '0');
INSERT INTO `zc_region` VALUES ('2100', '248', '喀喇沁左翼蒙古族自治县', '3', '0');
INSERT INTO `zc_region` VALUES ('2101', '248', '北票市', '3', '0');
INSERT INTO `zc_region` VALUES ('2102', '248', '凌源市', '3', '0');
INSERT INTO `zc_region` VALUES ('2103', '248', '朝阳县', '3', '0');
INSERT INTO `zc_region` VALUES ('2104', '248', '建平县', '3', '0');
INSERT INTO `zc_region` VALUES ('2105', '249', '振兴区', '3', '0');
INSERT INTO `zc_region` VALUES ('2106', '249', '元宝区', '3', '0');
INSERT INTO `zc_region` VALUES ('2107', '249', '振安区', '3', '0');
INSERT INTO `zc_region` VALUES ('2108', '249', '宽甸', '3', '0');
INSERT INTO `zc_region` VALUES ('2109', '249', '东港市', '3', '0');
INSERT INTO `zc_region` VALUES ('2110', '249', '凤城市', '3', '0');
INSERT INTO `zc_region` VALUES ('2111', '250', '顺城区', '3', '0');
INSERT INTO `zc_region` VALUES ('2112', '250', '新抚区', '3', '0');
INSERT INTO `zc_region` VALUES ('2113', '250', '东洲区', '3', '0');
INSERT INTO `zc_region` VALUES ('2114', '250', '望花区', '3', '0');
INSERT INTO `zc_region` VALUES ('2115', '250', '清原', '3', '0');
INSERT INTO `zc_region` VALUES ('2116', '250', '新宾', '3', '0');
INSERT INTO `zc_region` VALUES ('2117', '250', '抚顺县', '3', '0');
INSERT INTO `zc_region` VALUES ('2118', '251', '阜新', '3', '0');
INSERT INTO `zc_region` VALUES ('2119', '251', '海州区', '3', '0');
INSERT INTO `zc_region` VALUES ('2120', '251', '新邱区', '3', '0');
INSERT INTO `zc_region` VALUES ('2121', '251', '太平区', '3', '0');
INSERT INTO `zc_region` VALUES ('2122', '251', '清河门区', '3', '0');
INSERT INTO `zc_region` VALUES ('2123', '251', '细河区', '3', '0');
INSERT INTO `zc_region` VALUES ('2124', '251', '彰武县', '3', '0');
INSERT INTO `zc_region` VALUES ('2125', '252', '龙港区', '3', '0');
INSERT INTO `zc_region` VALUES ('2126', '252', '南票区', '3', '0');
INSERT INTO `zc_region` VALUES ('2127', '252', '连山区', '3', '0');
INSERT INTO `zc_region` VALUES ('2128', '252', '兴城市', '3', '0');
INSERT INTO `zc_region` VALUES ('2129', '252', '绥中县', '3', '0');
INSERT INTO `zc_region` VALUES ('2130', '252', '建昌县', '3', '0');
INSERT INTO `zc_region` VALUES ('2131', '253', '太和区', '3', '0');
INSERT INTO `zc_region` VALUES ('2132', '253', '古塔区', '3', '0');
INSERT INTO `zc_region` VALUES ('2133', '253', '凌河区', '3', '0');
INSERT INTO `zc_region` VALUES ('2134', '253', '凌海市', '3', '0');
INSERT INTO `zc_region` VALUES ('2135', '253', '北镇市', '3', '0');
INSERT INTO `zc_region` VALUES ('2136', '253', '黑山县', '3', '0');
INSERT INTO `zc_region` VALUES ('2137', '253', '义县', '3', '0');
INSERT INTO `zc_region` VALUES ('2138', '254', '白塔区', '3', '0');
INSERT INTO `zc_region` VALUES ('2139', '254', '文圣区', '3', '0');
INSERT INTO `zc_region` VALUES ('2140', '254', '宏伟区', '3', '0');
INSERT INTO `zc_region` VALUES ('2141', '254', '太子河区', '3', '0');
INSERT INTO `zc_region` VALUES ('2142', '254', '弓长岭区', '3', '0');
INSERT INTO `zc_region` VALUES ('2143', '254', '灯塔市', '3', '0');
INSERT INTO `zc_region` VALUES ('2144', '254', '辽阳县', '3', '0');
INSERT INTO `zc_region` VALUES ('2145', '255', '双台子区', '3', '0');
INSERT INTO `zc_region` VALUES ('2146', '255', '兴隆台区', '3', '0');
INSERT INTO `zc_region` VALUES ('2147', '255', '大洼县', '3', '0');
INSERT INTO `zc_region` VALUES ('2148', '255', '盘山县', '3', '0');
INSERT INTO `zc_region` VALUES ('2149', '256', '银州区', '3', '0');
INSERT INTO `zc_region` VALUES ('2150', '256', '清河区', '3', '0');
INSERT INTO `zc_region` VALUES ('2151', '256', '调兵山市', '3', '0');
INSERT INTO `zc_region` VALUES ('2152', '256', '开原市', '3', '0');
INSERT INTO `zc_region` VALUES ('2153', '256', '铁岭县', '3', '0');
INSERT INTO `zc_region` VALUES ('2154', '256', '西丰县', '3', '0');
INSERT INTO `zc_region` VALUES ('2155', '256', '昌图县', '3', '0');
INSERT INTO `zc_region` VALUES ('2156', '257', '站前区', '3', '0');
INSERT INTO `zc_region` VALUES ('2157', '257', '西市区', '3', '0');
INSERT INTO `zc_region` VALUES ('2158', '257', '鲅鱼圈区', '3', '0');
INSERT INTO `zc_region` VALUES ('2159', '257', '老边区', '3', '0');
INSERT INTO `zc_region` VALUES ('2160', '257', '盖州市', '3', '0');
INSERT INTO `zc_region` VALUES ('2161', '257', '大石桥市', '3', '0');
INSERT INTO `zc_region` VALUES ('2162', '258', '回民区', '3', '0');
INSERT INTO `zc_region` VALUES ('2163', '258', '玉泉区', '3', '0');
INSERT INTO `zc_region` VALUES ('2164', '258', '新城区', '3', '0');
INSERT INTO `zc_region` VALUES ('2165', '258', '赛罕区', '3', '0');
INSERT INTO `zc_region` VALUES ('2166', '258', '清水河县', '3', '0');
INSERT INTO `zc_region` VALUES ('2167', '258', '土默特左旗', '3', '0');
INSERT INTO `zc_region` VALUES ('2168', '258', '托克托县', '3', '0');
INSERT INTO `zc_region` VALUES ('2169', '258', '和林格尔县', '3', '0');
INSERT INTO `zc_region` VALUES ('2170', '258', '武川县', '3', '0');
INSERT INTO `zc_region` VALUES ('2171', '259', '阿拉善左旗', '3', '0');
INSERT INTO `zc_region` VALUES ('2172', '259', '阿拉善右旗', '3', '0');
INSERT INTO `zc_region` VALUES ('2173', '259', '额济纳旗', '3', '0');
INSERT INTO `zc_region` VALUES ('2174', '260', '临河区', '3', '0');
INSERT INTO `zc_region` VALUES ('2175', '260', '五原县', '3', '0');
INSERT INTO `zc_region` VALUES ('2176', '260', '磴口县', '3', '0');
INSERT INTO `zc_region` VALUES ('2177', '260', '乌拉特前旗', '3', '0');
INSERT INTO `zc_region` VALUES ('2178', '260', '乌拉特中旗', '3', '0');
INSERT INTO `zc_region` VALUES ('2179', '260', '乌拉特后旗', '3', '0');
INSERT INTO `zc_region` VALUES ('2180', '260', '杭锦后旗', '3', '0');
INSERT INTO `zc_region` VALUES ('2181', '261', '昆都仑区', '3', '0');
INSERT INTO `zc_region` VALUES ('2182', '261', '青山区', '3', '0');
INSERT INTO `zc_region` VALUES ('2183', '261', '东河区', '3', '0');
INSERT INTO `zc_region` VALUES ('2184', '261', '九原区', '3', '0');
INSERT INTO `zc_region` VALUES ('2185', '261', '石拐区', '3', '0');
INSERT INTO `zc_region` VALUES ('2186', '261', '白云矿区', '3', '0');
INSERT INTO `zc_region` VALUES ('2187', '261', '土默特右旗', '3', '0');
INSERT INTO `zc_region` VALUES ('2188', '261', '固阳县', '3', '0');
INSERT INTO `zc_region` VALUES ('2189', '261', '达尔罕茂明安联合旗', '3', '0');
INSERT INTO `zc_region` VALUES ('2190', '262', '红山区', '3', '0');
INSERT INTO `zc_region` VALUES ('2191', '262', '元宝山区', '3', '0');
INSERT INTO `zc_region` VALUES ('2192', '262', '松山区', '3', '0');
INSERT INTO `zc_region` VALUES ('2193', '262', '阿鲁科尔沁旗', '3', '0');
INSERT INTO `zc_region` VALUES ('2194', '262', '巴林左旗', '3', '0');
INSERT INTO `zc_region` VALUES ('2195', '262', '巴林右旗', '3', '0');
INSERT INTO `zc_region` VALUES ('2196', '262', '林西县', '3', '0');
INSERT INTO `zc_region` VALUES ('2197', '262', '克什克腾旗', '3', '0');
INSERT INTO `zc_region` VALUES ('2198', '262', '翁牛特旗', '3', '0');
INSERT INTO `zc_region` VALUES ('2199', '262', '喀喇沁旗', '3', '0');
INSERT INTO `zc_region` VALUES ('2200', '262', '宁城县', '3', '0');
INSERT INTO `zc_region` VALUES ('2201', '262', '敖汉旗', '3', '0');
INSERT INTO `zc_region` VALUES ('2202', '263', '东胜区', '3', '0');
INSERT INTO `zc_region` VALUES ('2203', '263', '达拉特旗', '3', '0');
INSERT INTO `zc_region` VALUES ('2204', '263', '准格尔旗', '3', '0');
INSERT INTO `zc_region` VALUES ('2205', '263', '鄂托克前旗', '3', '0');
INSERT INTO `zc_region` VALUES ('2206', '263', '鄂托克旗', '3', '0');
INSERT INTO `zc_region` VALUES ('2207', '263', '杭锦旗', '3', '0');
INSERT INTO `zc_region` VALUES ('2208', '263', '乌审旗', '3', '0');
INSERT INTO `zc_region` VALUES ('2209', '263', '伊金霍洛旗', '3', '0');
INSERT INTO `zc_region` VALUES ('2210', '264', '海拉尔区', '3', '0');
INSERT INTO `zc_region` VALUES ('2211', '264', '莫力达瓦', '3', '0');
INSERT INTO `zc_region` VALUES ('2212', '264', '满洲里市', '3', '0');
INSERT INTO `zc_region` VALUES ('2213', '264', '牙克石市', '3', '0');
INSERT INTO `zc_region` VALUES ('2214', '264', '扎兰屯市', '3', '0');
INSERT INTO `zc_region` VALUES ('2215', '264', '额尔古纳市', '3', '0');
INSERT INTO `zc_region` VALUES ('2216', '264', '根河市', '3', '0');
INSERT INTO `zc_region` VALUES ('2217', '264', '阿荣旗', '3', '0');
INSERT INTO `zc_region` VALUES ('2218', '264', '鄂伦春自治旗', '3', '0');
INSERT INTO `zc_region` VALUES ('2219', '264', '鄂温克族自治旗', '3', '0');
INSERT INTO `zc_region` VALUES ('2220', '264', '陈巴尔虎旗', '3', '0');
INSERT INTO `zc_region` VALUES ('2221', '264', '新巴尔虎左旗', '3', '0');
INSERT INTO `zc_region` VALUES ('2222', '264', '新巴尔虎右旗', '3', '0');
INSERT INTO `zc_region` VALUES ('2223', '265', '科尔沁区', '3', '0');
INSERT INTO `zc_region` VALUES ('2224', '265', '霍林郭勒市', '3', '0');
INSERT INTO `zc_region` VALUES ('2225', '265', '科尔沁左翼中旗', '3', '0');
INSERT INTO `zc_region` VALUES ('2226', '265', '科尔沁左翼后旗', '3', '0');
INSERT INTO `zc_region` VALUES ('2227', '265', '开鲁县', '3', '0');
INSERT INTO `zc_region` VALUES ('2228', '265', '库伦旗', '3', '0');
INSERT INTO `zc_region` VALUES ('2229', '265', '奈曼旗', '3', '0');
INSERT INTO `zc_region` VALUES ('2230', '265', '扎鲁特旗', '3', '0');
INSERT INTO `zc_region` VALUES ('2231', '266', '海勃湾区', '3', '0');
INSERT INTO `zc_region` VALUES ('2232', '266', '乌达区', '3', '0');
INSERT INTO `zc_region` VALUES ('2233', '266', '海南区', '3', '0');
INSERT INTO `zc_region` VALUES ('2234', '267', '化德县', '3', '0');
INSERT INTO `zc_region` VALUES ('2235', '267', '集宁区', '3', '0');
INSERT INTO `zc_region` VALUES ('2236', '267', '丰镇市', '3', '0');
INSERT INTO `zc_region` VALUES ('2237', '267', '卓资县', '3', '0');
INSERT INTO `zc_region` VALUES ('2238', '267', '商都县', '3', '0');
INSERT INTO `zc_region` VALUES ('2239', '267', '兴和县', '3', '0');
INSERT INTO `zc_region` VALUES ('2240', '267', '凉城县', '3', '0');
INSERT INTO `zc_region` VALUES ('2241', '267', '察哈尔右翼前旗', '3', '0');
INSERT INTO `zc_region` VALUES ('2242', '267', '察哈尔右翼中旗', '3', '0');
INSERT INTO `zc_region` VALUES ('2243', '267', '察哈尔右翼后旗', '3', '0');
INSERT INTO `zc_region` VALUES ('2244', '267', '四子王旗', '3', '0');
INSERT INTO `zc_region` VALUES ('2245', '268', '二连浩特市', '3', '0');
INSERT INTO `zc_region` VALUES ('2246', '268', '锡林浩特市', '3', '0');
INSERT INTO `zc_region` VALUES ('2247', '268', '阿巴嘎旗', '3', '0');
INSERT INTO `zc_region` VALUES ('2248', '268', '苏尼特左旗', '3', '0');
INSERT INTO `zc_region` VALUES ('2249', '268', '苏尼特右旗', '3', '0');
INSERT INTO `zc_region` VALUES ('2250', '268', '东乌珠穆沁旗', '3', '0');
INSERT INTO `zc_region` VALUES ('2251', '268', '西乌珠穆沁旗', '3', '0');
INSERT INTO `zc_region` VALUES ('2252', '268', '太仆寺旗', '3', '0');
INSERT INTO `zc_region` VALUES ('2253', '268', '镶黄旗', '3', '0');
INSERT INTO `zc_region` VALUES ('2254', '268', '正镶白旗', '3', '0');
INSERT INTO `zc_region` VALUES ('2255', '268', '正蓝旗', '3', '0');
INSERT INTO `zc_region` VALUES ('2256', '268', '多伦县', '3', '0');
INSERT INTO `zc_region` VALUES ('2257', '269', '乌兰浩特市', '3', '0');
INSERT INTO `zc_region` VALUES ('2258', '269', '阿尔山市', '3', '0');
INSERT INTO `zc_region` VALUES ('2259', '269', '科尔沁右翼前旗', '3', '0');
INSERT INTO `zc_region` VALUES ('2260', '269', '科尔沁右翼中旗', '3', '0');
INSERT INTO `zc_region` VALUES ('2261', '269', '扎赉特旗', '3', '0');
INSERT INTO `zc_region` VALUES ('2262', '269', '突泉县', '3', '0');
INSERT INTO `zc_region` VALUES ('2263', '270', '西夏区', '3', '0');
INSERT INTO `zc_region` VALUES ('2264', '270', '金凤区', '3', '0');
INSERT INTO `zc_region` VALUES ('2265', '270', '兴庆区', '3', '0');
INSERT INTO `zc_region` VALUES ('2266', '270', '灵武市', '3', '0');
INSERT INTO `zc_region` VALUES ('2267', '270', '永宁县', '3', '0');
INSERT INTO `zc_region` VALUES ('2268', '270', '贺兰县', '3', '0');
INSERT INTO `zc_region` VALUES ('2269', '271', '原州区', '3', '0');
INSERT INTO `zc_region` VALUES ('2270', '271', '海原县', '3', '0');
INSERT INTO `zc_region` VALUES ('2271', '271', '西吉县', '3', '0');
INSERT INTO `zc_region` VALUES ('2272', '271', '隆德县', '3', '0');
INSERT INTO `zc_region` VALUES ('2273', '271', '泾源县', '3', '0');
INSERT INTO `zc_region` VALUES ('2274', '271', '彭阳县', '3', '0');
INSERT INTO `zc_region` VALUES ('2275', '272', '惠农县', '3', '0');
INSERT INTO `zc_region` VALUES ('2276', '272', '大武口区', '3', '0');
INSERT INTO `zc_region` VALUES ('2277', '272', '惠农区', '3', '0');
INSERT INTO `zc_region` VALUES ('2278', '272', '陶乐县', '3', '0');
INSERT INTO `zc_region` VALUES ('2279', '272', '平罗县', '3', '0');
INSERT INTO `zc_region` VALUES ('2280', '273', '利通区', '3', '0');
INSERT INTO `zc_region` VALUES ('2281', '273', '中卫县', '3', '0');
INSERT INTO `zc_region` VALUES ('2282', '273', '青铜峡市', '3', '0');
INSERT INTO `zc_region` VALUES ('2283', '273', '中宁县', '3', '0');
INSERT INTO `zc_region` VALUES ('2284', '273', '盐池县', '3', '0');
INSERT INTO `zc_region` VALUES ('2285', '273', '同心县', '3', '0');
INSERT INTO `zc_region` VALUES ('2286', '274', '沙坡头区', '3', '0');
INSERT INTO `zc_region` VALUES ('2287', '274', '海原县', '3', '0');
INSERT INTO `zc_region` VALUES ('2288', '274', '中宁县', '3', '0');
INSERT INTO `zc_region` VALUES ('2289', '275', '城中区', '3', '0');
INSERT INTO `zc_region` VALUES ('2290', '275', '城东区', '3', '0');
INSERT INTO `zc_region` VALUES ('2291', '275', '城西区', '3', '0');
INSERT INTO `zc_region` VALUES ('2292', '275', '城北区', '3', '0');
INSERT INTO `zc_region` VALUES ('2293', '275', '湟中县', '3', '0');
INSERT INTO `zc_region` VALUES ('2294', '275', '湟源县', '3', '0');
INSERT INTO `zc_region` VALUES ('2295', '275', '大通', '3', '0');
INSERT INTO `zc_region` VALUES ('2296', '276', '玛沁县', '3', '0');
INSERT INTO `zc_region` VALUES ('2297', '276', '班玛县', '3', '0');
INSERT INTO `zc_region` VALUES ('2298', '276', '甘德县', '3', '0');
INSERT INTO `zc_region` VALUES ('2299', '276', '达日县', '3', '0');
INSERT INTO `zc_region` VALUES ('2300', '276', '久治县', '3', '0');
INSERT INTO `zc_region` VALUES ('2301', '276', '玛多县', '3', '0');
INSERT INTO `zc_region` VALUES ('2302', '277', '海晏县', '3', '0');
INSERT INTO `zc_region` VALUES ('2303', '277', '祁连县', '3', '0');
INSERT INTO `zc_region` VALUES ('2304', '277', '刚察县', '3', '0');
INSERT INTO `zc_region` VALUES ('2305', '277', '门源', '3', '0');
INSERT INTO `zc_region` VALUES ('2306', '278', '平安县', '3', '0');
INSERT INTO `zc_region` VALUES ('2307', '278', '乐都县', '3', '0');
INSERT INTO `zc_region` VALUES ('2308', '278', '民和', '3', '0');
INSERT INTO `zc_region` VALUES ('2309', '278', '互助', '3', '0');
INSERT INTO `zc_region` VALUES ('2310', '278', '化隆', '3', '0');
INSERT INTO `zc_region` VALUES ('2311', '278', '循化', '3', '0');
INSERT INTO `zc_region` VALUES ('2312', '279', '共和县', '3', '0');
INSERT INTO `zc_region` VALUES ('2313', '279', '同德县', '3', '0');
INSERT INTO `zc_region` VALUES ('2314', '279', '贵德县', '3', '0');
INSERT INTO `zc_region` VALUES ('2315', '279', '兴海县', '3', '0');
INSERT INTO `zc_region` VALUES ('2316', '279', '贵南县', '3', '0');
INSERT INTO `zc_region` VALUES ('2317', '280', '德令哈市', '3', '0');
INSERT INTO `zc_region` VALUES ('2318', '280', '格尔木市', '3', '0');
INSERT INTO `zc_region` VALUES ('2319', '280', '乌兰县', '3', '0');
INSERT INTO `zc_region` VALUES ('2320', '280', '都兰县', '3', '0');
INSERT INTO `zc_region` VALUES ('2321', '280', '天峻县', '3', '0');
INSERT INTO `zc_region` VALUES ('2322', '281', '同仁县', '3', '0');
INSERT INTO `zc_region` VALUES ('2323', '281', '尖扎县', '3', '0');
INSERT INTO `zc_region` VALUES ('2324', '281', '泽库县', '3', '0');
INSERT INTO `zc_region` VALUES ('2325', '281', '河南蒙古族自治县', '3', '0');
INSERT INTO `zc_region` VALUES ('2326', '282', '玉树县', '3', '0');
INSERT INTO `zc_region` VALUES ('2327', '282', '杂多县', '3', '0');
INSERT INTO `zc_region` VALUES ('2328', '282', '称多县', '3', '0');
INSERT INTO `zc_region` VALUES ('2329', '282', '治多县', '3', '0');
INSERT INTO `zc_region` VALUES ('2330', '282', '囊谦县', '3', '0');
INSERT INTO `zc_region` VALUES ('2331', '282', '曲麻莱县', '3', '0');
INSERT INTO `zc_region` VALUES ('2332', '283', '市中区', '3', '0');
INSERT INTO `zc_region` VALUES ('2333', '283', '历下区', '3', '0');
INSERT INTO `zc_region` VALUES ('2334', '283', '天桥区', '3', '0');
INSERT INTO `zc_region` VALUES ('2335', '283', '槐荫区', '3', '0');
INSERT INTO `zc_region` VALUES ('2336', '283', '历城区', '3', '0');
INSERT INTO `zc_region` VALUES ('2337', '283', '长清区', '3', '0');
INSERT INTO `zc_region` VALUES ('2338', '283', '章丘市', '3', '0');
INSERT INTO `zc_region` VALUES ('2339', '283', '平阴县', '3', '0');
INSERT INTO `zc_region` VALUES ('2340', '283', '济阳县', '3', '0');
INSERT INTO `zc_region` VALUES ('2341', '283', '商河县', '3', '0');
INSERT INTO `zc_region` VALUES ('2342', '284', '市南区', '3', '0');
INSERT INTO `zc_region` VALUES ('2343', '284', '市北区', '3', '0');
INSERT INTO `zc_region` VALUES ('2344', '284', '城阳区', '3', '0');
INSERT INTO `zc_region` VALUES ('2345', '284', '四方区', '3', '0');
INSERT INTO `zc_region` VALUES ('2346', '284', '李沧区', '3', '0');
INSERT INTO `zc_region` VALUES ('2347', '284', '黄岛区', '3', '0');
INSERT INTO `zc_region` VALUES ('2348', '284', '崂山区', '3', '0');
INSERT INTO `zc_region` VALUES ('2349', '284', '胶州市', '3', '0');
INSERT INTO `zc_region` VALUES ('2350', '284', '即墨市', '3', '0');
INSERT INTO `zc_region` VALUES ('2351', '284', '平度市', '3', '0');
INSERT INTO `zc_region` VALUES ('2352', '284', '胶南市', '3', '0');
INSERT INTO `zc_region` VALUES ('2353', '284', '莱西市', '3', '0');
INSERT INTO `zc_region` VALUES ('2354', '285', '滨城区', '3', '0');
INSERT INTO `zc_region` VALUES ('2355', '285', '惠民县', '3', '0');
INSERT INTO `zc_region` VALUES ('2356', '285', '阳信县', '3', '0');
INSERT INTO `zc_region` VALUES ('2357', '285', '无棣县', '3', '0');
INSERT INTO `zc_region` VALUES ('2358', '285', '沾化县', '3', '0');
INSERT INTO `zc_region` VALUES ('2359', '285', '博兴县', '3', '0');
INSERT INTO `zc_region` VALUES ('2360', '285', '邹平县', '3', '0');
INSERT INTO `zc_region` VALUES ('2361', '286', '德城区', '3', '0');
INSERT INTO `zc_region` VALUES ('2362', '286', '陵县', '3', '0');
INSERT INTO `zc_region` VALUES ('2363', '286', '乐陵市', '3', '0');
INSERT INTO `zc_region` VALUES ('2364', '286', '禹城市', '3', '0');
INSERT INTO `zc_region` VALUES ('2365', '286', '宁津县', '3', '0');
INSERT INTO `zc_region` VALUES ('2366', '286', '庆云县', '3', '0');
INSERT INTO `zc_region` VALUES ('2367', '286', '临邑县', '3', '0');
INSERT INTO `zc_region` VALUES ('2368', '286', '齐河县', '3', '0');
INSERT INTO `zc_region` VALUES ('2369', '286', '平原县', '3', '0');
INSERT INTO `zc_region` VALUES ('2370', '286', '夏津县', '3', '0');
INSERT INTO `zc_region` VALUES ('2371', '286', '武城县', '3', '0');
INSERT INTO `zc_region` VALUES ('2372', '287', '东营区', '3', '0');
INSERT INTO `zc_region` VALUES ('2373', '287', '河口区', '3', '0');
INSERT INTO `zc_region` VALUES ('2374', '287', '垦利县', '3', '0');
INSERT INTO `zc_region` VALUES ('2375', '287', '利津县', '3', '0');
INSERT INTO `zc_region` VALUES ('2376', '287', '广饶县', '3', '0');
INSERT INTO `zc_region` VALUES ('2377', '288', '牡丹区', '3', '0');
INSERT INTO `zc_region` VALUES ('2378', '288', '曹县', '3', '0');
INSERT INTO `zc_region` VALUES ('2379', '288', '单县', '3', '0');
INSERT INTO `zc_region` VALUES ('2380', '288', '成武县', '3', '0');
INSERT INTO `zc_region` VALUES ('2381', '288', '巨野县', '3', '0');
INSERT INTO `zc_region` VALUES ('2382', '288', '郓城县', '3', '0');
INSERT INTO `zc_region` VALUES ('2383', '288', '鄄城县', '3', '0');
INSERT INTO `zc_region` VALUES ('2384', '288', '定陶县', '3', '0');
INSERT INTO `zc_region` VALUES ('2385', '288', '东明县', '3', '0');
INSERT INTO `zc_region` VALUES ('2386', '289', '市中区', '3', '0');
INSERT INTO `zc_region` VALUES ('2387', '289', '任城区', '3', '0');
INSERT INTO `zc_region` VALUES ('2388', '289', '曲阜市', '3', '0');
INSERT INTO `zc_region` VALUES ('2389', '289', '兖州市', '3', '0');
INSERT INTO `zc_region` VALUES ('2390', '289', '邹城市', '3', '0');
INSERT INTO `zc_region` VALUES ('2391', '289', '微山县', '3', '0');
INSERT INTO `zc_region` VALUES ('2392', '289', '鱼台县', '3', '0');
INSERT INTO `zc_region` VALUES ('2393', '289', '金乡县', '3', '0');
INSERT INTO `zc_region` VALUES ('2394', '289', '嘉祥县', '3', '0');
INSERT INTO `zc_region` VALUES ('2395', '289', '汶上县', '3', '0');
INSERT INTO `zc_region` VALUES ('2396', '289', '泗水县', '3', '0');
INSERT INTO `zc_region` VALUES ('2397', '289', '梁山县', '3', '0');
INSERT INTO `zc_region` VALUES ('2398', '290', '莱城区', '3', '0');
INSERT INTO `zc_region` VALUES ('2399', '290', '钢城区', '3', '0');
INSERT INTO `zc_region` VALUES ('2400', '291', '东昌府区', '3', '0');
INSERT INTO `zc_region` VALUES ('2401', '291', '临清市', '3', '0');
INSERT INTO `zc_region` VALUES ('2402', '291', '阳谷县', '3', '0');
INSERT INTO `zc_region` VALUES ('2403', '291', '莘县', '3', '0');
INSERT INTO `zc_region` VALUES ('2404', '291', '茌平县', '3', '0');
INSERT INTO `zc_region` VALUES ('2405', '291', '东阿县', '3', '0');
INSERT INTO `zc_region` VALUES ('2406', '291', '冠县', '3', '0');
INSERT INTO `zc_region` VALUES ('2407', '291', '高唐县', '3', '0');
INSERT INTO `zc_region` VALUES ('2408', '292', '兰山区', '3', '0');
INSERT INTO `zc_region` VALUES ('2409', '292', '罗庄区', '3', '0');
INSERT INTO `zc_region` VALUES ('2410', '292', '河东区', '3', '0');
INSERT INTO `zc_region` VALUES ('2411', '292', '沂南县', '3', '0');
INSERT INTO `zc_region` VALUES ('2412', '292', '郯城县', '3', '0');
INSERT INTO `zc_region` VALUES ('2413', '292', '沂水县', '3', '0');
INSERT INTO `zc_region` VALUES ('2414', '292', '苍山县', '3', '0');
INSERT INTO `zc_region` VALUES ('2415', '292', '费县', '3', '0');
INSERT INTO `zc_region` VALUES ('2416', '292', '平邑县', '3', '0');
INSERT INTO `zc_region` VALUES ('2417', '292', '莒南县', '3', '0');
INSERT INTO `zc_region` VALUES ('2418', '292', '蒙阴县', '3', '0');
INSERT INTO `zc_region` VALUES ('2419', '292', '临沭县', '3', '0');
INSERT INTO `zc_region` VALUES ('2420', '293', '东港区', '3', '0');
INSERT INTO `zc_region` VALUES ('2421', '293', '岚山区', '3', '0');
INSERT INTO `zc_region` VALUES ('2422', '293', '五莲县', '3', '0');
INSERT INTO `zc_region` VALUES ('2423', '293', '莒县', '3', '0');
INSERT INTO `zc_region` VALUES ('2424', '294', '泰山区', '3', '0');
INSERT INTO `zc_region` VALUES ('2425', '294', '岱岳区', '3', '0');
INSERT INTO `zc_region` VALUES ('2426', '294', '新泰市', '3', '0');
INSERT INTO `zc_region` VALUES ('2427', '294', '肥城市', '3', '0');
INSERT INTO `zc_region` VALUES ('2428', '294', '宁阳县', '3', '0');
INSERT INTO `zc_region` VALUES ('2429', '294', '东平县', '3', '0');
INSERT INTO `zc_region` VALUES ('2430', '295', '荣成市', '3', '0');
INSERT INTO `zc_region` VALUES ('2431', '295', '乳山市', '3', '0');
INSERT INTO `zc_region` VALUES ('2432', '295', '环翠区', '3', '0');
INSERT INTO `zc_region` VALUES ('2433', '295', '文登市', '3', '0');
INSERT INTO `zc_region` VALUES ('2434', '296', '潍城区', '3', '0');
INSERT INTO `zc_region` VALUES ('2435', '296', '寒亭区', '3', '0');
INSERT INTO `zc_region` VALUES ('2436', '296', '坊子区', '3', '0');
INSERT INTO `zc_region` VALUES ('2437', '296', '奎文区', '3', '0');
INSERT INTO `zc_region` VALUES ('2438', '296', '青州市', '3', '0');
INSERT INTO `zc_region` VALUES ('2439', '296', '诸城市', '3', '0');
INSERT INTO `zc_region` VALUES ('2440', '296', '寿光市', '3', '0');
INSERT INTO `zc_region` VALUES ('2441', '296', '安丘市', '3', '0');
INSERT INTO `zc_region` VALUES ('2442', '296', '高密市', '3', '0');
INSERT INTO `zc_region` VALUES ('2443', '296', '昌邑市', '3', '0');
INSERT INTO `zc_region` VALUES ('2444', '296', '临朐县', '3', '0');
INSERT INTO `zc_region` VALUES ('2445', '296', '昌乐县', '3', '0');
INSERT INTO `zc_region` VALUES ('2446', '297', '芝罘区', '3', '0');
INSERT INTO `zc_region` VALUES ('2447', '297', '福山区', '3', '0');
INSERT INTO `zc_region` VALUES ('2448', '297', '牟平区', '3', '0');
INSERT INTO `zc_region` VALUES ('2449', '297', '莱山区', '3', '0');
INSERT INTO `zc_region` VALUES ('2450', '297', '开发区', '3', '0');
INSERT INTO `zc_region` VALUES ('2451', '297', '龙口市', '3', '0');
INSERT INTO `zc_region` VALUES ('2452', '297', '莱阳市', '3', '0');
INSERT INTO `zc_region` VALUES ('2453', '297', '莱州市', '3', '0');
INSERT INTO `zc_region` VALUES ('2454', '297', '蓬莱市', '3', '0');
INSERT INTO `zc_region` VALUES ('2455', '297', '招远市', '3', '0');
INSERT INTO `zc_region` VALUES ('2456', '297', '栖霞市', '3', '0');
INSERT INTO `zc_region` VALUES ('2457', '297', '海阳市', '3', '0');
INSERT INTO `zc_region` VALUES ('2458', '297', '长岛县', '3', '0');
INSERT INTO `zc_region` VALUES ('2459', '298', '市中区', '3', '0');
INSERT INTO `zc_region` VALUES ('2460', '298', '山亭区', '3', '0');
INSERT INTO `zc_region` VALUES ('2461', '298', '峄城区', '3', '0');
INSERT INTO `zc_region` VALUES ('2462', '298', '台儿庄区', '3', '0');
INSERT INTO `zc_region` VALUES ('2463', '298', '薛城区', '3', '0');
INSERT INTO `zc_region` VALUES ('2464', '298', '滕州市', '3', '0');
INSERT INTO `zc_region` VALUES ('2465', '299', '张店区', '3', '0');
INSERT INTO `zc_region` VALUES ('2466', '299', '临淄区', '3', '0');
INSERT INTO `zc_region` VALUES ('2467', '299', '淄川区', '3', '0');
INSERT INTO `zc_region` VALUES ('2468', '299', '博山区', '3', '0');
INSERT INTO `zc_region` VALUES ('2469', '299', '周村区', '3', '0');
INSERT INTO `zc_region` VALUES ('2470', '299', '桓台县', '3', '0');
INSERT INTO `zc_region` VALUES ('2471', '299', '高青县', '3', '0');
INSERT INTO `zc_region` VALUES ('2472', '299', '沂源县', '3', '0');
INSERT INTO `zc_region` VALUES ('2473', '300', '杏花岭区', '3', '0');
INSERT INTO `zc_region` VALUES ('2474', '300', '小店区', '3', '0');
INSERT INTO `zc_region` VALUES ('2475', '300', '迎泽区', '3', '0');
INSERT INTO `zc_region` VALUES ('2476', '300', '尖草坪区', '3', '0');
INSERT INTO `zc_region` VALUES ('2477', '300', '万柏林区', '3', '0');
INSERT INTO `zc_region` VALUES ('2478', '300', '晋源区', '3', '0');
INSERT INTO `zc_region` VALUES ('2479', '300', '高新开发区', '3', '0');
INSERT INTO `zc_region` VALUES ('2480', '300', '民营经济开发区', '3', '0');
INSERT INTO `zc_region` VALUES ('2481', '300', '经济技术开发区', '3', '0');
INSERT INTO `zc_region` VALUES ('2482', '300', '清徐县', '3', '0');
INSERT INTO `zc_region` VALUES ('2483', '300', '阳曲县', '3', '0');
INSERT INTO `zc_region` VALUES ('2484', '300', '娄烦县', '3', '0');
INSERT INTO `zc_region` VALUES ('2485', '300', '古交市', '3', '0');
INSERT INTO `zc_region` VALUES ('2486', '301', '城区', '3', '0');
INSERT INTO `zc_region` VALUES ('2487', '301', '郊区', '3', '0');
INSERT INTO `zc_region` VALUES ('2488', '301', '沁县', '3', '0');
INSERT INTO `zc_region` VALUES ('2489', '301', '潞城市', '3', '0');
INSERT INTO `zc_region` VALUES ('2490', '301', '长治县', '3', '0');
INSERT INTO `zc_region` VALUES ('2491', '301', '襄垣县', '3', '0');
INSERT INTO `zc_region` VALUES ('2492', '301', '屯留县', '3', '0');
INSERT INTO `zc_region` VALUES ('2493', '301', '平顺县', '3', '0');
INSERT INTO `zc_region` VALUES ('2494', '301', '黎城县', '3', '0');
INSERT INTO `zc_region` VALUES ('2495', '301', '壶关县', '3', '0');
INSERT INTO `zc_region` VALUES ('2496', '301', '长子县', '3', '0');
INSERT INTO `zc_region` VALUES ('2497', '301', '武乡县', '3', '0');
INSERT INTO `zc_region` VALUES ('2498', '301', '沁源县', '3', '0');
INSERT INTO `zc_region` VALUES ('2499', '302', '城区', '3', '0');
INSERT INTO `zc_region` VALUES ('2500', '302', '矿区', '3', '0');
INSERT INTO `zc_region` VALUES ('2501', '302', '南郊区', '3', '0');
INSERT INTO `zc_region` VALUES ('2502', '302', '新荣区', '3', '0');
INSERT INTO `zc_region` VALUES ('2503', '302', '阳高县', '3', '0');
INSERT INTO `zc_region` VALUES ('2504', '302', '天镇县', '3', '0');
INSERT INTO `zc_region` VALUES ('2505', '302', '广灵县', '3', '0');
INSERT INTO `zc_region` VALUES ('2506', '302', '灵丘县', '3', '0');
INSERT INTO `zc_region` VALUES ('2507', '302', '浑源县', '3', '0');
INSERT INTO `zc_region` VALUES ('2508', '302', '左云县', '3', '0');
INSERT INTO `zc_region` VALUES ('2509', '302', '大同县', '3', '0');
INSERT INTO `zc_region` VALUES ('2510', '303', '城区', '3', '0');
INSERT INTO `zc_region` VALUES ('2511', '303', '高平市', '3', '0');
INSERT INTO `zc_region` VALUES ('2512', '303', '沁水县', '3', '0');
INSERT INTO `zc_region` VALUES ('2513', '303', '阳城县', '3', '0');
INSERT INTO `zc_region` VALUES ('2514', '303', '陵川县', '3', '0');
INSERT INTO `zc_region` VALUES ('2515', '303', '泽州县', '3', '0');
INSERT INTO `zc_region` VALUES ('2516', '304', '榆次区', '3', '0');
INSERT INTO `zc_region` VALUES ('2517', '304', '介休市', '3', '0');
INSERT INTO `zc_region` VALUES ('2518', '304', '榆社县', '3', '0');
INSERT INTO `zc_region` VALUES ('2519', '304', '左权县', '3', '0');
INSERT INTO `zc_region` VALUES ('2520', '304', '和顺县', '3', '0');
INSERT INTO `zc_region` VALUES ('2521', '304', '昔阳县', '3', '0');
INSERT INTO `zc_region` VALUES ('2522', '304', '寿阳县', '3', '0');
INSERT INTO `zc_region` VALUES ('2523', '304', '太谷县', '3', '0');
INSERT INTO `zc_region` VALUES ('2524', '304', '祁县', '3', '0');
INSERT INTO `zc_region` VALUES ('2525', '304', '平遥县', '3', '0');
INSERT INTO `zc_region` VALUES ('2526', '304', '灵石县', '3', '0');
INSERT INTO `zc_region` VALUES ('2527', '305', '尧都区', '3', '0');
INSERT INTO `zc_region` VALUES ('2528', '305', '侯马市', '3', '0');
INSERT INTO `zc_region` VALUES ('2529', '305', '霍州市', '3', '0');
INSERT INTO `zc_region` VALUES ('2530', '305', '曲沃县', '3', '0');
INSERT INTO `zc_region` VALUES ('2531', '305', '翼城县', '3', '0');
INSERT INTO `zc_region` VALUES ('2532', '305', '襄汾县', '3', '0');
INSERT INTO `zc_region` VALUES ('2533', '305', '洪洞县', '3', '0');
INSERT INTO `zc_region` VALUES ('2534', '305', '吉县', '3', '0');
INSERT INTO `zc_region` VALUES ('2535', '305', '安泽县', '3', '0');
INSERT INTO `zc_region` VALUES ('2536', '305', '浮山县', '3', '0');
INSERT INTO `zc_region` VALUES ('2537', '305', '古县', '3', '0');
INSERT INTO `zc_region` VALUES ('2538', '305', '乡宁县', '3', '0');
INSERT INTO `zc_region` VALUES ('2539', '305', '大宁县', '3', '0');
INSERT INTO `zc_region` VALUES ('2540', '305', '隰县', '3', '0');
INSERT INTO `zc_region` VALUES ('2541', '305', '永和县', '3', '0');
INSERT INTO `zc_region` VALUES ('2542', '305', '蒲县', '3', '0');
INSERT INTO `zc_region` VALUES ('2543', '305', '汾西县', '3', '0');
INSERT INTO `zc_region` VALUES ('2544', '306', '离石市', '3', '0');
INSERT INTO `zc_region` VALUES ('2545', '306', '离石区', '3', '0');
INSERT INTO `zc_region` VALUES ('2546', '306', '孝义市', '3', '0');
INSERT INTO `zc_region` VALUES ('2547', '306', '汾阳市', '3', '0');
INSERT INTO `zc_region` VALUES ('2548', '306', '文水县', '3', '0');
INSERT INTO `zc_region` VALUES ('2549', '306', '交城县', '3', '0');
INSERT INTO `zc_region` VALUES ('2550', '306', '兴县', '3', '0');
INSERT INTO `zc_region` VALUES ('2551', '306', '临县', '3', '0');
INSERT INTO `zc_region` VALUES ('2552', '306', '柳林县', '3', '0');
INSERT INTO `zc_region` VALUES ('2553', '306', '石楼县', '3', '0');
INSERT INTO `zc_region` VALUES ('2554', '306', '岚县', '3', '0');
INSERT INTO `zc_region` VALUES ('2555', '306', '方山县', '3', '0');
INSERT INTO `zc_region` VALUES ('2556', '306', '中阳县', '3', '0');
INSERT INTO `zc_region` VALUES ('2557', '306', '交口县', '3', '0');
INSERT INTO `zc_region` VALUES ('2558', '307', '朔城区', '3', '0');
INSERT INTO `zc_region` VALUES ('2559', '307', '平鲁区', '3', '0');
INSERT INTO `zc_region` VALUES ('2560', '307', '山阴县', '3', '0');
INSERT INTO `zc_region` VALUES ('2561', '307', '应县', '3', '0');
INSERT INTO `zc_region` VALUES ('2562', '307', '右玉县', '3', '0');
INSERT INTO `zc_region` VALUES ('2563', '307', '怀仁县', '3', '0');
INSERT INTO `zc_region` VALUES ('2564', '308', '忻府区', '3', '0');
INSERT INTO `zc_region` VALUES ('2565', '308', '原平市', '3', '0');
INSERT INTO `zc_region` VALUES ('2566', '308', '定襄县', '3', '0');
INSERT INTO `zc_region` VALUES ('2567', '308', '五台县', '3', '0');
INSERT INTO `zc_region` VALUES ('2568', '308', '代县', '3', '0');
INSERT INTO `zc_region` VALUES ('2569', '308', '繁峙县', '3', '0');
INSERT INTO `zc_region` VALUES ('2570', '308', '宁武县', '3', '0');
INSERT INTO `zc_region` VALUES ('2571', '308', '静乐县', '3', '0');
INSERT INTO `zc_region` VALUES ('2572', '308', '神池县', '3', '0');
INSERT INTO `zc_region` VALUES ('2573', '308', '五寨县', '3', '0');
INSERT INTO `zc_region` VALUES ('2574', '308', '岢岚县', '3', '0');
INSERT INTO `zc_region` VALUES ('2575', '308', '河曲县', '3', '0');
INSERT INTO `zc_region` VALUES ('2576', '308', '保德县', '3', '0');
INSERT INTO `zc_region` VALUES ('2577', '308', '偏关县', '3', '0');
INSERT INTO `zc_region` VALUES ('2578', '309', '城区', '3', '0');
INSERT INTO `zc_region` VALUES ('2579', '309', '矿区', '3', '0');
INSERT INTO `zc_region` VALUES ('2580', '309', '郊区', '3', '0');
INSERT INTO `zc_region` VALUES ('2581', '309', '平定县', '3', '0');
INSERT INTO `zc_region` VALUES ('2582', '309', '盂县', '3', '0');
INSERT INTO `zc_region` VALUES ('2583', '310', '盐湖区', '3', '0');
INSERT INTO `zc_region` VALUES ('2584', '310', '永济市', '3', '0');
INSERT INTO `zc_region` VALUES ('2585', '310', '河津市', '3', '0');
INSERT INTO `zc_region` VALUES ('2586', '310', '临猗县', '3', '0');
INSERT INTO `zc_region` VALUES ('2587', '310', '万荣县', '3', '0');
INSERT INTO `zc_region` VALUES ('2588', '310', '闻喜县', '3', '0');
INSERT INTO `zc_region` VALUES ('2589', '310', '稷山县', '3', '0');
INSERT INTO `zc_region` VALUES ('2590', '310', '新绛县', '3', '0');
INSERT INTO `zc_region` VALUES ('2591', '310', '绛县', '3', '0');
INSERT INTO `zc_region` VALUES ('2592', '310', '垣曲县', '3', '0');
INSERT INTO `zc_region` VALUES ('2593', '310', '夏县', '3', '0');
INSERT INTO `zc_region` VALUES ('2594', '310', '平陆县', '3', '0');
INSERT INTO `zc_region` VALUES ('2595', '310', '芮城县', '3', '0');
INSERT INTO `zc_region` VALUES ('2596', '311', '莲湖区', '3', '0');
INSERT INTO `zc_region` VALUES ('2597', '311', '新城区', '3', '0');
INSERT INTO `zc_region` VALUES ('2598', '311', '碑林区', '3', '0');
INSERT INTO `zc_region` VALUES ('2599', '311', '雁塔区', '3', '0');
INSERT INTO `zc_region` VALUES ('2600', '311', '灞桥区', '3', '0');
INSERT INTO `zc_region` VALUES ('2601', '311', '未央区', '3', '0');
INSERT INTO `zc_region` VALUES ('2602', '311', '阎良区', '3', '0');
INSERT INTO `zc_region` VALUES ('2603', '311', '临潼区', '3', '0');
INSERT INTO `zc_region` VALUES ('2604', '311', '长安区', '3', '0');
INSERT INTO `zc_region` VALUES ('2605', '311', '蓝田县', '3', '0');
INSERT INTO `zc_region` VALUES ('2606', '311', '周至县', '3', '0');
INSERT INTO `zc_region` VALUES ('2607', '311', '户县', '3', '0');
INSERT INTO `zc_region` VALUES ('2608', '311', '高陵县', '3', '0');
INSERT INTO `zc_region` VALUES ('2609', '312', '汉滨区', '3', '0');
INSERT INTO `zc_region` VALUES ('2610', '312', '汉阴县', '3', '0');
INSERT INTO `zc_region` VALUES ('2611', '312', '石泉县', '3', '0');
INSERT INTO `zc_region` VALUES ('2612', '312', '宁陕县', '3', '0');
INSERT INTO `zc_region` VALUES ('2613', '312', '紫阳县', '3', '0');
INSERT INTO `zc_region` VALUES ('2614', '312', '岚皋县', '3', '0');
INSERT INTO `zc_region` VALUES ('2615', '312', '平利县', '3', '0');
INSERT INTO `zc_region` VALUES ('2616', '312', '镇坪县', '3', '0');
INSERT INTO `zc_region` VALUES ('2617', '312', '旬阳县', '3', '0');
INSERT INTO `zc_region` VALUES ('2618', '312', '白河县', '3', '0');
INSERT INTO `zc_region` VALUES ('2619', '313', '陈仓区', '3', '0');
INSERT INTO `zc_region` VALUES ('2620', '313', '渭滨区', '3', '0');
INSERT INTO `zc_region` VALUES ('2621', '313', '金台区', '3', '0');
INSERT INTO `zc_region` VALUES ('2622', '313', '凤翔县', '3', '0');
INSERT INTO `zc_region` VALUES ('2623', '313', '岐山县', '3', '0');
INSERT INTO `zc_region` VALUES ('2624', '313', '扶风县', '3', '0');
INSERT INTO `zc_region` VALUES ('2625', '313', '眉县', '3', '0');
INSERT INTO `zc_region` VALUES ('2626', '313', '陇县', '3', '0');
INSERT INTO `zc_region` VALUES ('2627', '313', '千阳县', '3', '0');
INSERT INTO `zc_region` VALUES ('2628', '313', '麟游县', '3', '0');
INSERT INTO `zc_region` VALUES ('2629', '313', '凤县', '3', '0');
INSERT INTO `zc_region` VALUES ('2630', '313', '太白县', '3', '0');
INSERT INTO `zc_region` VALUES ('2631', '314', '汉台区', '3', '0');
INSERT INTO `zc_region` VALUES ('2632', '314', '南郑县', '3', '0');
INSERT INTO `zc_region` VALUES ('2633', '314', '城固县', '3', '0');
INSERT INTO `zc_region` VALUES ('2634', '314', '洋县', '3', '0');
INSERT INTO `zc_region` VALUES ('2635', '314', '西乡县', '3', '0');
INSERT INTO `zc_region` VALUES ('2636', '314', '勉县', '3', '0');
INSERT INTO `zc_region` VALUES ('2637', '314', '宁强县', '3', '0');
INSERT INTO `zc_region` VALUES ('2638', '314', '略阳县', '3', '0');
INSERT INTO `zc_region` VALUES ('2639', '314', '镇巴县', '3', '0');
INSERT INTO `zc_region` VALUES ('2640', '314', '留坝县', '3', '0');
INSERT INTO `zc_region` VALUES ('2641', '314', '佛坪县', '3', '0');
INSERT INTO `zc_region` VALUES ('2642', '315', '商州区', '3', '0');
INSERT INTO `zc_region` VALUES ('2643', '315', '洛南县', '3', '0');
INSERT INTO `zc_region` VALUES ('2644', '315', '丹凤县', '3', '0');
INSERT INTO `zc_region` VALUES ('2645', '315', '商南县', '3', '0');
INSERT INTO `zc_region` VALUES ('2646', '315', '山阳县', '3', '0');
INSERT INTO `zc_region` VALUES ('2647', '315', '镇安县', '3', '0');
INSERT INTO `zc_region` VALUES ('2648', '315', '柞水县', '3', '0');
INSERT INTO `zc_region` VALUES ('2649', '316', '耀州区', '3', '0');
INSERT INTO `zc_region` VALUES ('2650', '316', '王益区', '3', '0');
INSERT INTO `zc_region` VALUES ('2651', '316', '印台区', '3', '0');
INSERT INTO `zc_region` VALUES ('2652', '316', '宜君县', '3', '0');
INSERT INTO `zc_region` VALUES ('2653', '317', '临渭区', '3', '0');
INSERT INTO `zc_region` VALUES ('2654', '317', '韩城市', '3', '0');
INSERT INTO `zc_region` VALUES ('2655', '317', '华阴市', '3', '0');
INSERT INTO `zc_region` VALUES ('2656', '317', '华县', '3', '0');
INSERT INTO `zc_region` VALUES ('2657', '317', '潼关县', '3', '0');
INSERT INTO `zc_region` VALUES ('2658', '317', '大荔县', '3', '0');
INSERT INTO `zc_region` VALUES ('2659', '317', '合阳县', '3', '0');
INSERT INTO `zc_region` VALUES ('2660', '317', '澄城县', '3', '0');
INSERT INTO `zc_region` VALUES ('2661', '317', '蒲城县', '3', '0');
INSERT INTO `zc_region` VALUES ('2662', '317', '白水县', '3', '0');
INSERT INTO `zc_region` VALUES ('2663', '317', '富平县', '3', '0');
INSERT INTO `zc_region` VALUES ('2664', '318', '秦都区', '3', '0');
INSERT INTO `zc_region` VALUES ('2665', '318', '渭城区', '3', '0');
INSERT INTO `zc_region` VALUES ('2666', '318', '杨陵区', '3', '0');
INSERT INTO `zc_region` VALUES ('2667', '318', '兴平市', '3', '0');
INSERT INTO `zc_region` VALUES ('2668', '318', '三原县', '3', '0');
INSERT INTO `zc_region` VALUES ('2669', '318', '泾阳县', '3', '0');
INSERT INTO `zc_region` VALUES ('2670', '318', '乾县', '3', '0');
INSERT INTO `zc_region` VALUES ('2671', '318', '礼泉县', '3', '0');
INSERT INTO `zc_region` VALUES ('2672', '318', '永寿县', '3', '0');
INSERT INTO `zc_region` VALUES ('2673', '318', '彬县', '3', '0');
INSERT INTO `zc_region` VALUES ('2674', '318', '长武县', '3', '0');
INSERT INTO `zc_region` VALUES ('2675', '318', '旬邑县', '3', '0');
INSERT INTO `zc_region` VALUES ('2676', '318', '淳化县', '3', '0');
INSERT INTO `zc_region` VALUES ('2677', '318', '武功县', '3', '0');
INSERT INTO `zc_region` VALUES ('2678', '319', '吴起县', '3', '0');
INSERT INTO `zc_region` VALUES ('2679', '319', '宝塔区', '3', '0');
INSERT INTO `zc_region` VALUES ('2680', '319', '延长县', '3', '0');
INSERT INTO `zc_region` VALUES ('2681', '319', '延川县', '3', '0');
INSERT INTO `zc_region` VALUES ('2682', '319', '子长县', '3', '0');
INSERT INTO `zc_region` VALUES ('2683', '319', '安塞县', '3', '0');
INSERT INTO `zc_region` VALUES ('2684', '319', '志丹县', '3', '0');
INSERT INTO `zc_region` VALUES ('2685', '319', '甘泉县', '3', '0');
INSERT INTO `zc_region` VALUES ('2686', '319', '富县', '3', '0');
INSERT INTO `zc_region` VALUES ('2687', '319', '洛川县', '3', '0');
INSERT INTO `zc_region` VALUES ('2688', '319', '宜川县', '3', '0');
INSERT INTO `zc_region` VALUES ('2689', '319', '黄龙县', '3', '0');
INSERT INTO `zc_region` VALUES ('2690', '319', '黄陵县', '3', '0');
INSERT INTO `zc_region` VALUES ('2691', '320', '榆阳区', '3', '0');
INSERT INTO `zc_region` VALUES ('2692', '320', '神木县', '3', '0');
INSERT INTO `zc_region` VALUES ('2693', '320', '府谷县', '3', '0');
INSERT INTO `zc_region` VALUES ('2694', '320', '横山县', '3', '0');
INSERT INTO `zc_region` VALUES ('2695', '320', '靖边县', '3', '0');
INSERT INTO `zc_region` VALUES ('2696', '320', '定边县', '3', '0');
INSERT INTO `zc_region` VALUES ('2697', '320', '绥德县', '3', '0');
INSERT INTO `zc_region` VALUES ('2698', '320', '米脂县', '3', '0');
INSERT INTO `zc_region` VALUES ('2699', '320', '佳县', '3', '0');
INSERT INTO `zc_region` VALUES ('2700', '320', '吴堡县', '3', '0');
INSERT INTO `zc_region` VALUES ('2701', '320', '清涧县', '3', '0');
INSERT INTO `zc_region` VALUES ('2702', '320', '子洲县', '3', '0');
INSERT INTO `zc_region` VALUES ('2703', '321', '长宁区', '3', '0');
INSERT INTO `zc_region` VALUES ('2704', '321', '闸北区', '3', '0');
INSERT INTO `zc_region` VALUES ('2705', '321', '闵行区', '3', '0');
INSERT INTO `zc_region` VALUES ('2706', '321', '徐汇区', '3', '0');
INSERT INTO `zc_region` VALUES ('2707', '321', '浦东新区', '3', '0');
INSERT INTO `zc_region` VALUES ('2708', '321', '杨浦区', '3', '0');
INSERT INTO `zc_region` VALUES ('2709', '321', '普陀区', '3', '0');
INSERT INTO `zc_region` VALUES ('2710', '321', '静安区', '3', '0');
INSERT INTO `zc_region` VALUES ('2711', '321', '卢湾区', '3', '0');
INSERT INTO `zc_region` VALUES ('2712', '321', '虹口区', '3', '0');
INSERT INTO `zc_region` VALUES ('2713', '321', '黄浦区', '3', '0');
INSERT INTO `zc_region` VALUES ('2714', '321', '南汇区', '3', '0');
INSERT INTO `zc_region` VALUES ('2715', '321', '松江区', '3', '0');
INSERT INTO `zc_region` VALUES ('2716', '321', '嘉定区', '3', '0');
INSERT INTO `zc_region` VALUES ('2717', '321', '宝山区', '3', '0');
INSERT INTO `zc_region` VALUES ('2718', '321', '青浦区', '3', '0');
INSERT INTO `zc_region` VALUES ('2719', '321', '金山区', '3', '0');
INSERT INTO `zc_region` VALUES ('2720', '321', '奉贤区', '3', '0');
INSERT INTO `zc_region` VALUES ('2721', '321', '崇明县', '3', '0');
INSERT INTO `zc_region` VALUES ('2722', '322', '青羊区', '3', '0');
INSERT INTO `zc_region` VALUES ('2723', '322', '锦江区', '3', '0');
INSERT INTO `zc_region` VALUES ('2724', '322', '金牛区', '3', '0');
INSERT INTO `zc_region` VALUES ('2725', '322', '武侯区', '3', '0');
INSERT INTO `zc_region` VALUES ('2726', '322', '成华区', '3', '0');
INSERT INTO `zc_region` VALUES ('2727', '322', '龙泉驿区', '3', '0');
INSERT INTO `zc_region` VALUES ('2728', '322', '青白江区', '3', '0');
INSERT INTO `zc_region` VALUES ('2729', '322', '新都区', '3', '0');
INSERT INTO `zc_region` VALUES ('2730', '322', '温江区', '3', '0');
INSERT INTO `zc_region` VALUES ('2731', '322', '高新区', '3', '0');
INSERT INTO `zc_region` VALUES ('2732', '322', '高新西区', '3', '0');
INSERT INTO `zc_region` VALUES ('2733', '322', '都江堰市', '3', '0');
INSERT INTO `zc_region` VALUES ('2734', '322', '彭州市', '3', '0');
INSERT INTO `zc_region` VALUES ('2735', '322', '邛崃市', '3', '0');
INSERT INTO `zc_region` VALUES ('2736', '322', '崇州市', '3', '0');
INSERT INTO `zc_region` VALUES ('2737', '322', '金堂县', '3', '0');
INSERT INTO `zc_region` VALUES ('2738', '322', '双流县', '3', '0');
INSERT INTO `zc_region` VALUES ('2739', '322', '郫县', '3', '0');
INSERT INTO `zc_region` VALUES ('2740', '322', '大邑县', '3', '0');
INSERT INTO `zc_region` VALUES ('2741', '322', '蒲江县', '3', '0');
INSERT INTO `zc_region` VALUES ('2742', '322', '新津县', '3', '0');
INSERT INTO `zc_region` VALUES ('2743', '322', '都江堰市', '3', '0');
INSERT INTO `zc_region` VALUES ('2744', '322', '彭州市', '3', '0');
INSERT INTO `zc_region` VALUES ('2745', '322', '邛崃市', '3', '0');
INSERT INTO `zc_region` VALUES ('2746', '322', '崇州市', '3', '0');
INSERT INTO `zc_region` VALUES ('2747', '322', '金堂县', '3', '0');
INSERT INTO `zc_region` VALUES ('2748', '322', '双流县', '3', '0');
INSERT INTO `zc_region` VALUES ('2749', '322', '郫县', '3', '0');
INSERT INTO `zc_region` VALUES ('2750', '322', '大邑县', '3', '0');
INSERT INTO `zc_region` VALUES ('2751', '322', '蒲江县', '3', '0');
INSERT INTO `zc_region` VALUES ('2752', '322', '新津县', '3', '0');
INSERT INTO `zc_region` VALUES ('2753', '323', '涪城区', '3', '0');
INSERT INTO `zc_region` VALUES ('2754', '323', '游仙区', '3', '0');
INSERT INTO `zc_region` VALUES ('2755', '323', '江油市', '3', '0');
INSERT INTO `zc_region` VALUES ('2756', '323', '盐亭县', '3', '0');
INSERT INTO `zc_region` VALUES ('2757', '323', '三台县', '3', '0');
INSERT INTO `zc_region` VALUES ('2758', '323', '平武县', '3', '0');
INSERT INTO `zc_region` VALUES ('2759', '323', '安县', '3', '0');
INSERT INTO `zc_region` VALUES ('2760', '323', '梓潼县', '3', '0');
INSERT INTO `zc_region` VALUES ('2761', '323', '北川县', '3', '0');
INSERT INTO `zc_region` VALUES ('2762', '324', '马尔康县', '3', '0');
INSERT INTO `zc_region` VALUES ('2763', '324', '汶川县', '3', '0');
INSERT INTO `zc_region` VALUES ('2764', '324', '理县', '3', '0');
INSERT INTO `zc_region` VALUES ('2765', '324', '茂县', '3', '0');
INSERT INTO `zc_region` VALUES ('2766', '324', '松潘县', '3', '0');
INSERT INTO `zc_region` VALUES ('2767', '324', '九寨沟县', '3', '0');
INSERT INTO `zc_region` VALUES ('2768', '324', '金川县', '3', '0');
INSERT INTO `zc_region` VALUES ('2769', '324', '小金县', '3', '0');
INSERT INTO `zc_region` VALUES ('2770', '324', '黑水县', '3', '0');
INSERT INTO `zc_region` VALUES ('2771', '324', '壤塘县', '3', '0');
INSERT INTO `zc_region` VALUES ('2772', '324', '阿坝县', '3', '0');
INSERT INTO `zc_region` VALUES ('2773', '324', '若尔盖县', '3', '0');
INSERT INTO `zc_region` VALUES ('2774', '324', '红原县', '3', '0');
INSERT INTO `zc_region` VALUES ('2775', '325', '巴州区', '3', '0');
INSERT INTO `zc_region` VALUES ('2776', '325', '通江县', '3', '0');
INSERT INTO `zc_region` VALUES ('2777', '325', '南江县', '3', '0');
INSERT INTO `zc_region` VALUES ('2778', '325', '平昌县', '3', '0');
INSERT INTO `zc_region` VALUES ('2779', '326', '通川区', '3', '0');
INSERT INTO `zc_region` VALUES ('2780', '326', '万源市', '3', '0');
INSERT INTO `zc_region` VALUES ('2781', '326', '达县', '3', '0');
INSERT INTO `zc_region` VALUES ('2782', '326', '宣汉县', '3', '0');
INSERT INTO `zc_region` VALUES ('2783', '326', '开江县', '3', '0');
INSERT INTO `zc_region` VALUES ('2784', '326', '大竹县', '3', '0');
INSERT INTO `zc_region` VALUES ('2785', '326', '渠县', '3', '0');
INSERT INTO `zc_region` VALUES ('2786', '327', '旌阳区', '3', '0');
INSERT INTO `zc_region` VALUES ('2787', '327', '广汉市', '3', '0');
INSERT INTO `zc_region` VALUES ('2788', '327', '什邡市', '3', '0');
INSERT INTO `zc_region` VALUES ('2789', '327', '绵竹市', '3', '0');
INSERT INTO `zc_region` VALUES ('2790', '327', '罗江县', '3', '0');
INSERT INTO `zc_region` VALUES ('2791', '327', '中江县', '3', '0');
INSERT INTO `zc_region` VALUES ('2792', '328', '康定县', '3', '0');
INSERT INTO `zc_region` VALUES ('2793', '328', '丹巴县', '3', '0');
INSERT INTO `zc_region` VALUES ('2794', '328', '泸定县', '3', '0');
INSERT INTO `zc_region` VALUES ('2795', '328', '炉霍县', '3', '0');
INSERT INTO `zc_region` VALUES ('2796', '328', '九龙县', '3', '0');
INSERT INTO `zc_region` VALUES ('2797', '328', '甘孜县', '3', '0');
INSERT INTO `zc_region` VALUES ('2798', '328', '雅江县', '3', '0');
INSERT INTO `zc_region` VALUES ('2799', '328', '新龙县', '3', '0');
INSERT INTO `zc_region` VALUES ('2800', '328', '道孚县', '3', '0');
INSERT INTO `zc_region` VALUES ('2801', '328', '白玉县', '3', '0');
INSERT INTO `zc_region` VALUES ('2802', '328', '理塘县', '3', '0');
INSERT INTO `zc_region` VALUES ('2803', '328', '德格县', '3', '0');
INSERT INTO `zc_region` VALUES ('2804', '328', '乡城县', '3', '0');
INSERT INTO `zc_region` VALUES ('2805', '328', '石渠县', '3', '0');
INSERT INTO `zc_region` VALUES ('2806', '328', '稻城县', '3', '0');
INSERT INTO `zc_region` VALUES ('2807', '328', '色达县', '3', '0');
INSERT INTO `zc_region` VALUES ('2808', '328', '巴塘县', '3', '0');
INSERT INTO `zc_region` VALUES ('2809', '328', '得荣县', '3', '0');
INSERT INTO `zc_region` VALUES ('2810', '329', '广安区', '3', '0');
INSERT INTO `zc_region` VALUES ('2811', '329', '华蓥市', '3', '0');
INSERT INTO `zc_region` VALUES ('2812', '329', '岳池县', '3', '0');
INSERT INTO `zc_region` VALUES ('2813', '329', '武胜县', '3', '0');
INSERT INTO `zc_region` VALUES ('2814', '329', '邻水县', '3', '0');
INSERT INTO `zc_region` VALUES ('2815', '330', '利州区', '3', '0');
INSERT INTO `zc_region` VALUES ('2816', '330', '元坝区', '3', '0');
INSERT INTO `zc_region` VALUES ('2817', '330', '朝天区', '3', '0');
INSERT INTO `zc_region` VALUES ('2818', '330', '旺苍县', '3', '0');
INSERT INTO `zc_region` VALUES ('2819', '330', '青川县', '3', '0');
INSERT INTO `zc_region` VALUES ('2820', '330', '剑阁县', '3', '0');
INSERT INTO `zc_region` VALUES ('2821', '330', '苍溪县', '3', '0');
INSERT INTO `zc_region` VALUES ('2822', '331', '峨眉山市', '3', '0');
INSERT INTO `zc_region` VALUES ('2823', '331', '乐山市', '3', '0');
INSERT INTO `zc_region` VALUES ('2824', '331', '犍为县', '3', '0');
INSERT INTO `zc_region` VALUES ('2825', '331', '井研县', '3', '0');
INSERT INTO `zc_region` VALUES ('2826', '331', '夹江县', '3', '0');
INSERT INTO `zc_region` VALUES ('2827', '331', '沐川县', '3', '0');
INSERT INTO `zc_region` VALUES ('2828', '331', '峨边', '3', '0');
INSERT INTO `zc_region` VALUES ('2829', '331', '马边', '3', '0');
INSERT INTO `zc_region` VALUES ('2830', '332', '西昌市', '3', '0');
INSERT INTO `zc_region` VALUES ('2831', '332', '盐源县', '3', '0');
INSERT INTO `zc_region` VALUES ('2832', '332', '德昌县', '3', '0');
INSERT INTO `zc_region` VALUES ('2833', '332', '会理县', '3', '0');
INSERT INTO `zc_region` VALUES ('2834', '332', '会东县', '3', '0');
INSERT INTO `zc_region` VALUES ('2835', '332', '宁南县', '3', '0');
INSERT INTO `zc_region` VALUES ('2836', '332', '普格县', '3', '0');
INSERT INTO `zc_region` VALUES ('2837', '332', '布拖县', '3', '0');
INSERT INTO `zc_region` VALUES ('2838', '332', '金阳县', '3', '0');
INSERT INTO `zc_region` VALUES ('2839', '332', '昭觉县', '3', '0');
INSERT INTO `zc_region` VALUES ('2840', '332', '喜德县', '3', '0');
INSERT INTO `zc_region` VALUES ('2841', '332', '冕宁县', '3', '0');
INSERT INTO `zc_region` VALUES ('2842', '332', '越西县', '3', '0');
INSERT INTO `zc_region` VALUES ('2843', '332', '甘洛县', '3', '0');
INSERT INTO `zc_region` VALUES ('2844', '332', '美姑县', '3', '0');
INSERT INTO `zc_region` VALUES ('2845', '332', '雷波县', '3', '0');
INSERT INTO `zc_region` VALUES ('2846', '332', '木里', '3', '0');
INSERT INTO `zc_region` VALUES ('2847', '333', '东坡区', '3', '0');
INSERT INTO `zc_region` VALUES ('2848', '333', '仁寿县', '3', '0');
INSERT INTO `zc_region` VALUES ('2849', '333', '彭山县', '3', '0');
INSERT INTO `zc_region` VALUES ('2850', '333', '洪雅县', '3', '0');
INSERT INTO `zc_region` VALUES ('2851', '333', '丹棱县', '3', '0');
INSERT INTO `zc_region` VALUES ('2852', '333', '青神县', '3', '0');
INSERT INTO `zc_region` VALUES ('2853', '334', '阆中市', '3', '0');
INSERT INTO `zc_region` VALUES ('2854', '334', '南部县', '3', '0');
INSERT INTO `zc_region` VALUES ('2855', '334', '营山县', '3', '0');
INSERT INTO `zc_region` VALUES ('2856', '334', '蓬安县', '3', '0');
INSERT INTO `zc_region` VALUES ('2857', '334', '仪陇县', '3', '0');
INSERT INTO `zc_region` VALUES ('2858', '334', '顺庆区', '3', '0');
INSERT INTO `zc_region` VALUES ('2859', '334', '高坪区', '3', '0');
INSERT INTO `zc_region` VALUES ('2860', '334', '嘉陵区', '3', '0');
INSERT INTO `zc_region` VALUES ('2861', '334', '西充县', '3', '0');
INSERT INTO `zc_region` VALUES ('2862', '335', '市中区', '3', '0');
INSERT INTO `zc_region` VALUES ('2863', '335', '东兴区', '3', '0');
INSERT INTO `zc_region` VALUES ('2864', '335', '威远县', '3', '0');
INSERT INTO `zc_region` VALUES ('2865', '335', '资中县', '3', '0');
INSERT INTO `zc_region` VALUES ('2866', '335', '隆昌县', '3', '0');
INSERT INTO `zc_region` VALUES ('2867', '336', '东  区', '3', '0');
INSERT INTO `zc_region` VALUES ('2868', '336', '西  区', '3', '0');
INSERT INTO `zc_region` VALUES ('2869', '336', '仁和区', '3', '0');
INSERT INTO `zc_region` VALUES ('2870', '336', '米易县', '3', '0');
INSERT INTO `zc_region` VALUES ('2871', '336', '盐边县', '3', '0');
INSERT INTO `zc_region` VALUES ('2872', '337', '船山区', '3', '0');
INSERT INTO `zc_region` VALUES ('2873', '337', '安居区', '3', '0');
INSERT INTO `zc_region` VALUES ('2874', '337', '蓬溪县', '3', '0');
INSERT INTO `zc_region` VALUES ('2875', '337', '射洪县', '3', '0');
INSERT INTO `zc_region` VALUES ('2876', '337', '大英县', '3', '0');
INSERT INTO `zc_region` VALUES ('2877', '338', '雨城区', '3', '0');
INSERT INTO `zc_region` VALUES ('2878', '338', '名山县', '3', '0');
INSERT INTO `zc_region` VALUES ('2879', '338', '荥经县', '3', '0');
INSERT INTO `zc_region` VALUES ('2880', '338', '汉源县', '3', '0');
INSERT INTO `zc_region` VALUES ('2881', '338', '石棉县', '3', '0');
INSERT INTO `zc_region` VALUES ('2882', '338', '天全县', '3', '0');
INSERT INTO `zc_region` VALUES ('2883', '338', '芦山县', '3', '0');
INSERT INTO `zc_region` VALUES ('2884', '338', '宝兴县', '3', '0');
INSERT INTO `zc_region` VALUES ('2885', '339', '翠屏区', '3', '0');
INSERT INTO `zc_region` VALUES ('2886', '339', '宜宾县', '3', '0');
INSERT INTO `zc_region` VALUES ('2887', '339', '南溪县', '3', '0');
INSERT INTO `zc_region` VALUES ('2888', '339', '江安县', '3', '0');
INSERT INTO `zc_region` VALUES ('2889', '339', '长宁县', '3', '0');
INSERT INTO `zc_region` VALUES ('2890', '339', '高县', '3', '0');
INSERT INTO `zc_region` VALUES ('2891', '339', '珙县', '3', '0');
INSERT INTO `zc_region` VALUES ('2892', '339', '筠连县', '3', '0');
INSERT INTO `zc_region` VALUES ('2893', '339', '兴文县', '3', '0');
INSERT INTO `zc_region` VALUES ('2894', '339', '屏山县', '3', '0');
INSERT INTO `zc_region` VALUES ('2895', '340', '雁江区', '3', '0');
INSERT INTO `zc_region` VALUES ('2896', '340', '简阳市', '3', '0');
INSERT INTO `zc_region` VALUES ('2897', '340', '安岳县', '3', '0');
INSERT INTO `zc_region` VALUES ('2898', '340', '乐至县', '3', '0');
INSERT INTO `zc_region` VALUES ('2899', '341', '大安区', '3', '0');
INSERT INTO `zc_region` VALUES ('2900', '341', '自流井区', '3', '0');
INSERT INTO `zc_region` VALUES ('2901', '341', '贡井区', '3', '0');
INSERT INTO `zc_region` VALUES ('2902', '341', '沿滩区', '3', '0');
INSERT INTO `zc_region` VALUES ('2903', '341', '荣县', '3', '0');
INSERT INTO `zc_region` VALUES ('2904', '341', '富顺县', '3', '0');
INSERT INTO `zc_region` VALUES ('2905', '342', '江阳区', '3', '0');
INSERT INTO `zc_region` VALUES ('2906', '342', '纳溪区', '3', '0');
INSERT INTO `zc_region` VALUES ('2907', '342', '龙马潭区', '3', '0');
INSERT INTO `zc_region` VALUES ('2908', '342', '泸县', '3', '0');
INSERT INTO `zc_region` VALUES ('2909', '342', '合江县', '3', '0');
INSERT INTO `zc_region` VALUES ('2910', '342', '叙永县', '3', '0');
INSERT INTO `zc_region` VALUES ('2911', '342', '古蔺县', '3', '0');
INSERT INTO `zc_region` VALUES ('2912', '343', '和平区', '3', '0');
INSERT INTO `zc_region` VALUES ('2913', '343', '河西区', '3', '0');
INSERT INTO `zc_region` VALUES ('2914', '343', '南开区', '3', '0');
INSERT INTO `zc_region` VALUES ('2915', '343', '河北区', '3', '0');
INSERT INTO `zc_region` VALUES ('2916', '343', '河东区', '3', '0');
INSERT INTO `zc_region` VALUES ('2917', '343', '红桥区', '3', '0');
INSERT INTO `zc_region` VALUES ('2918', '343', '东丽区', '3', '0');
INSERT INTO `zc_region` VALUES ('2919', '343', '津南区', '3', '0');
INSERT INTO `zc_region` VALUES ('2920', '343', '西青区', '3', '0');
INSERT INTO `zc_region` VALUES ('2921', '343', '北辰区', '3', '0');
INSERT INTO `zc_region` VALUES ('2922', '343', '塘沽区', '3', '0');
INSERT INTO `zc_region` VALUES ('2923', '343', '汉沽区', '3', '0');
INSERT INTO `zc_region` VALUES ('2924', '343', '大港区', '3', '0');
INSERT INTO `zc_region` VALUES ('2925', '343', '武清区', '3', '0');
INSERT INTO `zc_region` VALUES ('2926', '343', '宝坻区', '3', '0');
INSERT INTO `zc_region` VALUES ('2927', '343', '经济开发区', '3', '0');
INSERT INTO `zc_region` VALUES ('2928', '343', '宁河县', '3', '0');
INSERT INTO `zc_region` VALUES ('2929', '343', '静海县', '3', '0');
INSERT INTO `zc_region` VALUES ('2930', '343', '蓟县', '3', '0');
INSERT INTO `zc_region` VALUES ('2931', '344', '城关区', '3', '0');
INSERT INTO `zc_region` VALUES ('2932', '344', '林周县', '3', '0');
INSERT INTO `zc_region` VALUES ('2933', '344', '当雄县', '3', '0');
INSERT INTO `zc_region` VALUES ('2934', '344', '尼木县', '3', '0');
INSERT INTO `zc_region` VALUES ('2935', '344', '曲水县', '3', '0');
INSERT INTO `zc_region` VALUES ('2936', '344', '堆龙德庆县', '3', '0');
INSERT INTO `zc_region` VALUES ('2937', '344', '达孜县', '3', '0');
INSERT INTO `zc_region` VALUES ('2938', '344', '墨竹工卡县', '3', '0');
INSERT INTO `zc_region` VALUES ('2939', '345', '噶尔县', '3', '0');
INSERT INTO `zc_region` VALUES ('2940', '345', '普兰县', '3', '0');
INSERT INTO `zc_region` VALUES ('2941', '345', '札达县', '3', '0');
INSERT INTO `zc_region` VALUES ('2942', '345', '日土县', '3', '0');
INSERT INTO `zc_region` VALUES ('2943', '345', '革吉县', '3', '0');
INSERT INTO `zc_region` VALUES ('2944', '345', '改则县', '3', '0');
INSERT INTO `zc_region` VALUES ('2945', '345', '措勤县', '3', '0');
INSERT INTO `zc_region` VALUES ('2946', '346', '昌都县', '3', '0');
INSERT INTO `zc_region` VALUES ('2947', '346', '江达县', '3', '0');
INSERT INTO `zc_region` VALUES ('2948', '346', '贡觉县', '3', '0');
INSERT INTO `zc_region` VALUES ('2949', '346', '类乌齐县', '3', '0');
INSERT INTO `zc_region` VALUES ('2950', '346', '丁青县', '3', '0');
INSERT INTO `zc_region` VALUES ('2951', '346', '察雅县', '3', '0');
INSERT INTO `zc_region` VALUES ('2952', '346', '八宿县', '3', '0');
INSERT INTO `zc_region` VALUES ('2953', '346', '左贡县', '3', '0');
INSERT INTO `zc_region` VALUES ('2954', '346', '芒康县', '3', '0');
INSERT INTO `zc_region` VALUES ('2955', '346', '洛隆县', '3', '0');
INSERT INTO `zc_region` VALUES ('2956', '346', '边坝县', '3', '0');
INSERT INTO `zc_region` VALUES ('2957', '347', '林芝县', '3', '0');
INSERT INTO `zc_region` VALUES ('2958', '347', '工布江达县', '3', '0');
INSERT INTO `zc_region` VALUES ('2959', '347', '米林县', '3', '0');
INSERT INTO `zc_region` VALUES ('2960', '347', '墨脱县', '3', '0');
INSERT INTO `zc_region` VALUES ('2961', '347', '波密县', '3', '0');
INSERT INTO `zc_region` VALUES ('2962', '347', '察隅县', '3', '0');
INSERT INTO `zc_region` VALUES ('2963', '347', '朗县', '3', '0');
INSERT INTO `zc_region` VALUES ('2964', '348', '那曲县', '3', '0');
INSERT INTO `zc_region` VALUES ('2965', '348', '嘉黎县', '3', '0');
INSERT INTO `zc_region` VALUES ('2966', '348', '比如县', '3', '0');
INSERT INTO `zc_region` VALUES ('2967', '348', '聂荣县', '3', '0');
INSERT INTO `zc_region` VALUES ('2968', '348', '安多县', '3', '0');
INSERT INTO `zc_region` VALUES ('2969', '348', '申扎县', '3', '0');
INSERT INTO `zc_region` VALUES ('2970', '348', '索县', '3', '0');
INSERT INTO `zc_region` VALUES ('2971', '348', '班戈县', '3', '0');
INSERT INTO `zc_region` VALUES ('2972', '348', '巴青县', '3', '0');
INSERT INTO `zc_region` VALUES ('2973', '348', '尼玛县', '3', '0');
INSERT INTO `zc_region` VALUES ('2974', '349', '日喀则市', '3', '0');
INSERT INTO `zc_region` VALUES ('2975', '349', '南木林县', '3', '0');
INSERT INTO `zc_region` VALUES ('2976', '349', '江孜县', '3', '0');
INSERT INTO `zc_region` VALUES ('2977', '349', '定日县', '3', '0');
INSERT INTO `zc_region` VALUES ('2978', '349', '萨迦县', '3', '0');
INSERT INTO `zc_region` VALUES ('2979', '349', '拉孜县', '3', '0');
INSERT INTO `zc_region` VALUES ('2980', '349', '昂仁县', '3', '0');
INSERT INTO `zc_region` VALUES ('2981', '349', '谢通门县', '3', '0');
INSERT INTO `zc_region` VALUES ('2982', '349', '白朗县', '3', '0');
INSERT INTO `zc_region` VALUES ('2983', '349', '仁布县', '3', '0');
INSERT INTO `zc_region` VALUES ('2984', '349', '康马县', '3', '0');
INSERT INTO `zc_region` VALUES ('2985', '349', '定结县', '3', '0');
INSERT INTO `zc_region` VALUES ('2986', '349', '仲巴县', '3', '0');
INSERT INTO `zc_region` VALUES ('2987', '349', '亚东县', '3', '0');
INSERT INTO `zc_region` VALUES ('2988', '349', '吉隆县', '3', '0');
INSERT INTO `zc_region` VALUES ('2989', '349', '聂拉木县', '3', '0');
INSERT INTO `zc_region` VALUES ('2990', '349', '萨嘎县', '3', '0');
INSERT INTO `zc_region` VALUES ('2991', '349', '岗巴县', '3', '0');
INSERT INTO `zc_region` VALUES ('2992', '350', '乃东县', '3', '0');
INSERT INTO `zc_region` VALUES ('2993', '350', '扎囊县', '3', '0');
INSERT INTO `zc_region` VALUES ('2994', '350', '贡嘎县', '3', '0');
INSERT INTO `zc_region` VALUES ('2995', '350', '桑日县', '3', '0');
INSERT INTO `zc_region` VALUES ('2996', '350', '琼结县', '3', '0');
INSERT INTO `zc_region` VALUES ('2997', '350', '曲松县', '3', '0');
INSERT INTO `zc_region` VALUES ('2998', '350', '措美县', '3', '0');
INSERT INTO `zc_region` VALUES ('2999', '350', '洛扎县', '3', '0');
INSERT INTO `zc_region` VALUES ('3000', '350', '加查县', '3', '0');
INSERT INTO `zc_region` VALUES ('3001', '350', '隆子县', '3', '0');
INSERT INTO `zc_region` VALUES ('3002', '350', '错那县', '3', '0');
INSERT INTO `zc_region` VALUES ('3003', '350', '浪卡子县', '3', '0');
INSERT INTO `zc_region` VALUES ('3004', '351', '天山区', '3', '0');
INSERT INTO `zc_region` VALUES ('3005', '351', '沙依巴克区', '3', '0');
INSERT INTO `zc_region` VALUES ('3006', '351', '新市区', '3', '0');
INSERT INTO `zc_region` VALUES ('3007', '351', '水磨沟区', '3', '0');
INSERT INTO `zc_region` VALUES ('3008', '351', '头屯河区', '3', '0');
INSERT INTO `zc_region` VALUES ('3009', '351', '达坂城区', '3', '0');
INSERT INTO `zc_region` VALUES ('3010', '351', '米东区', '3', '0');
INSERT INTO `zc_region` VALUES ('3011', '351', '乌鲁木齐县', '3', '0');
INSERT INTO `zc_region` VALUES ('3012', '352', '阿克苏市', '3', '0');
INSERT INTO `zc_region` VALUES ('3013', '352', '温宿县', '3', '0');
INSERT INTO `zc_region` VALUES ('3014', '352', '库车县', '3', '0');
INSERT INTO `zc_region` VALUES ('3015', '352', '沙雅县', '3', '0');
INSERT INTO `zc_region` VALUES ('3016', '352', '新和县', '3', '0');
INSERT INTO `zc_region` VALUES ('3017', '352', '拜城县', '3', '0');
INSERT INTO `zc_region` VALUES ('3018', '352', '乌什县', '3', '0');
INSERT INTO `zc_region` VALUES ('3019', '352', '阿瓦提县', '3', '0');
INSERT INTO `zc_region` VALUES ('3020', '352', '柯坪县', '3', '0');
INSERT INTO `zc_region` VALUES ('3021', '353', '阿拉尔市', '3', '0');
INSERT INTO `zc_region` VALUES ('3022', '354', '库尔勒市', '3', '0');
INSERT INTO `zc_region` VALUES ('3023', '354', '轮台县', '3', '0');
INSERT INTO `zc_region` VALUES ('3024', '354', '尉犁县', '3', '0');
INSERT INTO `zc_region` VALUES ('3025', '354', '若羌县', '3', '0');
INSERT INTO `zc_region` VALUES ('3026', '354', '且末县', '3', '0');
INSERT INTO `zc_region` VALUES ('3027', '354', '焉耆', '3', '0');
INSERT INTO `zc_region` VALUES ('3028', '354', '和静县', '3', '0');
INSERT INTO `zc_region` VALUES ('3029', '354', '和硕县', '3', '0');
INSERT INTO `zc_region` VALUES ('3030', '354', '博湖县', '3', '0');
INSERT INTO `zc_region` VALUES ('3031', '355', '博乐市', '3', '0');
INSERT INTO `zc_region` VALUES ('3032', '355', '精河县', '3', '0');
INSERT INTO `zc_region` VALUES ('3033', '355', '温泉县', '3', '0');
INSERT INTO `zc_region` VALUES ('3034', '356', '呼图壁县', '3', '0');
INSERT INTO `zc_region` VALUES ('3035', '356', '米泉市', '3', '0');
INSERT INTO `zc_region` VALUES ('3036', '356', '昌吉市', '3', '0');
INSERT INTO `zc_region` VALUES ('3037', '356', '阜康市', '3', '0');
INSERT INTO `zc_region` VALUES ('3038', '356', '玛纳斯县', '3', '0');
INSERT INTO `zc_region` VALUES ('3039', '356', '奇台县', '3', '0');
INSERT INTO `zc_region` VALUES ('3040', '356', '吉木萨尔县', '3', '0');
INSERT INTO `zc_region` VALUES ('3041', '356', '木垒', '3', '0');
INSERT INTO `zc_region` VALUES ('3042', '357', '哈密市', '3', '0');
INSERT INTO `zc_region` VALUES ('3043', '357', '伊吾县', '3', '0');
INSERT INTO `zc_region` VALUES ('3044', '357', '巴里坤', '3', '0');
INSERT INTO `zc_region` VALUES ('3045', '358', '和田市', '3', '0');
INSERT INTO `zc_region` VALUES ('3046', '358', '和田县', '3', '0');
INSERT INTO `zc_region` VALUES ('3047', '358', '墨玉县', '3', '0');
INSERT INTO `zc_region` VALUES ('3048', '358', '皮山县', '3', '0');
INSERT INTO `zc_region` VALUES ('3049', '358', '洛浦县', '3', '0');
INSERT INTO `zc_region` VALUES ('3050', '358', '策勒县', '3', '0');
INSERT INTO `zc_region` VALUES ('3051', '358', '于田县', '3', '0');
INSERT INTO `zc_region` VALUES ('3052', '358', '民丰县', '3', '0');
INSERT INTO `zc_region` VALUES ('3053', '359', '喀什市', '3', '0');
INSERT INTO `zc_region` VALUES ('3054', '359', '疏附县', '3', '0');
INSERT INTO `zc_region` VALUES ('3055', '359', '疏勒县', '3', '0');
INSERT INTO `zc_region` VALUES ('3056', '359', '英吉沙县', '3', '0');
INSERT INTO `zc_region` VALUES ('3057', '359', '泽普县', '3', '0');
INSERT INTO `zc_region` VALUES ('3058', '359', '莎车县', '3', '0');
INSERT INTO `zc_region` VALUES ('3059', '359', '叶城县', '3', '0');
INSERT INTO `zc_region` VALUES ('3060', '359', '麦盖提县', '3', '0');
INSERT INTO `zc_region` VALUES ('3061', '359', '岳普湖县', '3', '0');
INSERT INTO `zc_region` VALUES ('3062', '359', '伽师县', '3', '0');
INSERT INTO `zc_region` VALUES ('3063', '359', '巴楚县', '3', '0');
INSERT INTO `zc_region` VALUES ('3064', '359', '塔什库尔干', '3', '0');
INSERT INTO `zc_region` VALUES ('3065', '360', '克拉玛依市', '3', '0');
INSERT INTO `zc_region` VALUES ('3066', '361', '阿图什市', '3', '0');
INSERT INTO `zc_region` VALUES ('3067', '361', '阿克陶县', '3', '0');
INSERT INTO `zc_region` VALUES ('3068', '361', '阿合奇县', '3', '0');
INSERT INTO `zc_region` VALUES ('3069', '361', '乌恰县', '3', '0');
INSERT INTO `zc_region` VALUES ('3070', '362', '石河子市', '3', '0');
INSERT INTO `zc_region` VALUES ('3071', '363', '图木舒克市', '3', '0');
INSERT INTO `zc_region` VALUES ('3072', '364', '吐鲁番市', '3', '0');
INSERT INTO `zc_region` VALUES ('3073', '364', '鄯善县', '3', '0');
INSERT INTO `zc_region` VALUES ('3074', '364', '托克逊县', '3', '0');
INSERT INTO `zc_region` VALUES ('3075', '365', '五家渠市', '3', '0');
INSERT INTO `zc_region` VALUES ('3076', '366', '阿勒泰市', '3', '0');
INSERT INTO `zc_region` VALUES ('3077', '366', '布克赛尔', '3', '0');
INSERT INTO `zc_region` VALUES ('3078', '366', '伊宁市', '3', '0');
INSERT INTO `zc_region` VALUES ('3079', '366', '布尔津县', '3', '0');
INSERT INTO `zc_region` VALUES ('3080', '366', '奎屯市', '3', '0');
INSERT INTO `zc_region` VALUES ('3081', '366', '乌苏市', '3', '0');
INSERT INTO `zc_region` VALUES ('3082', '366', '额敏县', '3', '0');
INSERT INTO `zc_region` VALUES ('3083', '366', '富蕴县', '3', '0');
INSERT INTO `zc_region` VALUES ('3084', '366', '伊宁县', '3', '0');
INSERT INTO `zc_region` VALUES ('3085', '366', '福海县', '3', '0');
INSERT INTO `zc_region` VALUES ('3086', '366', '霍城县', '3', '0');
INSERT INTO `zc_region` VALUES ('3087', '366', '沙湾县', '3', '0');
INSERT INTO `zc_region` VALUES ('3088', '366', '巩留县', '3', '0');
INSERT INTO `zc_region` VALUES ('3089', '366', '哈巴河县', '3', '0');
INSERT INTO `zc_region` VALUES ('3090', '366', '托里县', '3', '0');
INSERT INTO `zc_region` VALUES ('3091', '366', '青河县', '3', '0');
INSERT INTO `zc_region` VALUES ('3092', '366', '新源县', '3', '0');
INSERT INTO `zc_region` VALUES ('3093', '366', '裕民县', '3', '0');
INSERT INTO `zc_region` VALUES ('3094', '366', '和布克赛尔', '3', '0');
INSERT INTO `zc_region` VALUES ('3095', '366', '吉木乃县', '3', '0');
INSERT INTO `zc_region` VALUES ('3096', '366', '昭苏县', '3', '0');
INSERT INTO `zc_region` VALUES ('3097', '366', '特克斯县', '3', '0');
INSERT INTO `zc_region` VALUES ('3098', '366', '尼勒克县', '3', '0');
INSERT INTO `zc_region` VALUES ('3099', '366', '察布查尔', '3', '0');
INSERT INTO `zc_region` VALUES ('3100', '367', '盘龙区', '3', '0');
INSERT INTO `zc_region` VALUES ('3101', '367', '五华区', '3', '0');
INSERT INTO `zc_region` VALUES ('3102', '367', '官渡区', '3', '0');
INSERT INTO `zc_region` VALUES ('3103', '367', '西山区', '3', '0');
INSERT INTO `zc_region` VALUES ('3104', '367', '东川区', '3', '0');
INSERT INTO `zc_region` VALUES ('3105', '367', '安宁市', '3', '0');
INSERT INTO `zc_region` VALUES ('3106', '367', '呈贡县', '3', '0');
INSERT INTO `zc_region` VALUES ('3107', '367', '晋宁县', '3', '0');
INSERT INTO `zc_region` VALUES ('3108', '367', '富民县', '3', '0');
INSERT INTO `zc_region` VALUES ('3109', '367', '宜良县', '3', '0');
INSERT INTO `zc_region` VALUES ('3110', '367', '嵩明县', '3', '0');
INSERT INTO `zc_region` VALUES ('3111', '367', '石林县', '3', '0');
INSERT INTO `zc_region` VALUES ('3112', '367', '禄劝', '3', '0');
INSERT INTO `zc_region` VALUES ('3113', '367', '寻甸', '3', '0');
INSERT INTO `zc_region` VALUES ('3114', '368', '兰坪', '3', '0');
INSERT INTO `zc_region` VALUES ('3115', '368', '泸水县', '3', '0');
INSERT INTO `zc_region` VALUES ('3116', '368', '福贡县', '3', '0');
INSERT INTO `zc_region` VALUES ('3117', '368', '贡山', '3', '0');
INSERT INTO `zc_region` VALUES ('3118', '369', '宁洱', '3', '0');
INSERT INTO `zc_region` VALUES ('3119', '369', '思茅区', '3', '0');
INSERT INTO `zc_region` VALUES ('3120', '369', '墨江', '3', '0');
INSERT INTO `zc_region` VALUES ('3121', '369', '景东', '3', '0');
INSERT INTO `zc_region` VALUES ('3122', '369', '景谷', '3', '0');
INSERT INTO `zc_region` VALUES ('3123', '369', '镇沅', '3', '0');
INSERT INTO `zc_region` VALUES ('3124', '369', '江城', '3', '0');
INSERT INTO `zc_region` VALUES ('3125', '369', '孟连', '3', '0');
INSERT INTO `zc_region` VALUES ('3126', '369', '澜沧', '3', '0');
INSERT INTO `zc_region` VALUES ('3127', '369', '西盟', '3', '0');
INSERT INTO `zc_region` VALUES ('3128', '370', '古城区', '3', '0');
INSERT INTO `zc_region` VALUES ('3129', '370', '宁蒗', '3', '0');
INSERT INTO `zc_region` VALUES ('3130', '370', '玉龙', '3', '0');
INSERT INTO `zc_region` VALUES ('3131', '370', '永胜县', '3', '0');
INSERT INTO `zc_region` VALUES ('3132', '370', '华坪县', '3', '0');
INSERT INTO `zc_region` VALUES ('3133', '371', '隆阳区', '3', '0');
INSERT INTO `zc_region` VALUES ('3134', '371', '施甸县', '3', '0');
INSERT INTO `zc_region` VALUES ('3135', '371', '腾冲县', '3', '0');
INSERT INTO `zc_region` VALUES ('3136', '371', '龙陵县', '3', '0');
INSERT INTO `zc_region` VALUES ('3137', '371', '昌宁县', '3', '0');
INSERT INTO `zc_region` VALUES ('3138', '372', '楚雄市', '3', '0');
INSERT INTO `zc_region` VALUES ('3139', '372', '双柏县', '3', '0');
INSERT INTO `zc_region` VALUES ('3140', '372', '牟定县', '3', '0');
INSERT INTO `zc_region` VALUES ('3141', '372', '南华县', '3', '0');
INSERT INTO `zc_region` VALUES ('3142', '372', '姚安县', '3', '0');
INSERT INTO `zc_region` VALUES ('3143', '372', '大姚县', '3', '0');
INSERT INTO `zc_region` VALUES ('3144', '372', '永仁县', '3', '0');
INSERT INTO `zc_region` VALUES ('3145', '372', '元谋县', '3', '0');
INSERT INTO `zc_region` VALUES ('3146', '372', '武定县', '3', '0');
INSERT INTO `zc_region` VALUES ('3147', '372', '禄丰县', '3', '0');
INSERT INTO `zc_region` VALUES ('3148', '373', '大理市', '3', '0');
INSERT INTO `zc_region` VALUES ('3149', '373', '祥云县', '3', '0');
INSERT INTO `zc_region` VALUES ('3150', '373', '宾川县', '3', '0');
INSERT INTO `zc_region` VALUES ('3151', '373', '弥渡县', '3', '0');
INSERT INTO `zc_region` VALUES ('3152', '373', '永平县', '3', '0');
INSERT INTO `zc_region` VALUES ('3153', '373', '云龙县', '3', '0');
INSERT INTO `zc_region` VALUES ('3154', '373', '洱源县', '3', '0');
INSERT INTO `zc_region` VALUES ('3155', '373', '剑川县', '3', '0');
INSERT INTO `zc_region` VALUES ('3156', '373', '鹤庆县', '3', '0');
INSERT INTO `zc_region` VALUES ('3157', '373', '漾濞', '3', '0');
INSERT INTO `zc_region` VALUES ('3158', '373', '南涧', '3', '0');
INSERT INTO `zc_region` VALUES ('3159', '373', '巍山', '3', '0');
INSERT INTO `zc_region` VALUES ('3160', '374', '潞西市', '3', '0');
INSERT INTO `zc_region` VALUES ('3161', '374', '瑞丽市', '3', '0');
INSERT INTO `zc_region` VALUES ('3162', '374', '梁河县', '3', '0');
INSERT INTO `zc_region` VALUES ('3163', '374', '盈江县', '3', '0');
INSERT INTO `zc_region` VALUES ('3164', '374', '陇川县', '3', '0');
INSERT INTO `zc_region` VALUES ('3165', '375', '香格里拉县', '3', '0');
INSERT INTO `zc_region` VALUES ('3166', '375', '德钦县', '3', '0');
INSERT INTO `zc_region` VALUES ('3167', '375', '维西', '3', '0');
INSERT INTO `zc_region` VALUES ('3168', '376', '泸西县', '3', '0');
INSERT INTO `zc_region` VALUES ('3169', '376', '蒙自县', '3', '0');
INSERT INTO `zc_region` VALUES ('3170', '376', '个旧市', '3', '0');
INSERT INTO `zc_region` VALUES ('3171', '376', '开远市', '3', '0');
INSERT INTO `zc_region` VALUES ('3172', '376', '绿春县', '3', '0');
INSERT INTO `zc_region` VALUES ('3173', '376', '建水县', '3', '0');
INSERT INTO `zc_region` VALUES ('3174', '376', '石屏县', '3', '0');
INSERT INTO `zc_region` VALUES ('3175', '376', '弥勒县', '3', '0');
INSERT INTO `zc_region` VALUES ('3176', '376', '元阳县', '3', '0');
INSERT INTO `zc_region` VALUES ('3177', '376', '红河县', '3', '0');
INSERT INTO `zc_region` VALUES ('3178', '376', '金平', '3', '0');
INSERT INTO `zc_region` VALUES ('3179', '376', '河口', '3', '0');
INSERT INTO `zc_region` VALUES ('3180', '376', '屏边', '3', '0');
INSERT INTO `zc_region` VALUES ('3181', '377', '临翔区', '3', '0');
INSERT INTO `zc_region` VALUES ('3182', '377', '凤庆县', '3', '0');
INSERT INTO `zc_region` VALUES ('3183', '377', '云县', '3', '0');
INSERT INTO `zc_region` VALUES ('3184', '377', '永德县', '3', '0');
INSERT INTO `zc_region` VALUES ('3185', '377', '镇康县', '3', '0');
INSERT INTO `zc_region` VALUES ('3186', '377', '双江', '3', '0');
INSERT INTO `zc_region` VALUES ('3187', '377', '耿马', '3', '0');
INSERT INTO `zc_region` VALUES ('3188', '377', '沧源', '3', '0');
INSERT INTO `zc_region` VALUES ('3189', '378', '麒麟区', '3', '0');
INSERT INTO `zc_region` VALUES ('3190', '378', '宣威市', '3', '0');
INSERT INTO `zc_region` VALUES ('3191', '378', '马龙县', '3', '0');
INSERT INTO `zc_region` VALUES ('3192', '378', '陆良县', '3', '0');
INSERT INTO `zc_region` VALUES ('3193', '378', '师宗县', '3', '0');
INSERT INTO `zc_region` VALUES ('3194', '378', '罗平县', '3', '0');
INSERT INTO `zc_region` VALUES ('3195', '378', '富源县', '3', '0');
INSERT INTO `zc_region` VALUES ('3196', '378', '会泽县', '3', '0');
INSERT INTO `zc_region` VALUES ('3197', '378', '沾益县', '3', '0');
INSERT INTO `zc_region` VALUES ('3198', '379', '文山县', '3', '0');
INSERT INTO `zc_region` VALUES ('3199', '379', '砚山县', '3', '0');
INSERT INTO `zc_region` VALUES ('3200', '379', '西畴县', '3', '0');
INSERT INTO `zc_region` VALUES ('3201', '379', '麻栗坡县', '3', '0');
INSERT INTO `zc_region` VALUES ('3202', '379', '马关县', '3', '0');
INSERT INTO `zc_region` VALUES ('3203', '379', '丘北县', '3', '0');
INSERT INTO `zc_region` VALUES ('3204', '379', '广南县', '3', '0');
INSERT INTO `zc_region` VALUES ('3205', '379', '富宁县', '3', '0');
INSERT INTO `zc_region` VALUES ('3206', '380', '景洪市', '3', '0');
INSERT INTO `zc_region` VALUES ('3207', '380', '勐海县', '3', '0');
INSERT INTO `zc_region` VALUES ('3208', '380', '勐腊县', '3', '0');
INSERT INTO `zc_region` VALUES ('3209', '381', '红塔区', '3', '0');
INSERT INTO `zc_region` VALUES ('3210', '381', '江川县', '3', '0');
INSERT INTO `zc_region` VALUES ('3211', '381', '澄江县', '3', '0');
INSERT INTO `zc_region` VALUES ('3212', '381', '通海县', '3', '0');
INSERT INTO `zc_region` VALUES ('3213', '381', '华宁县', '3', '0');
INSERT INTO `zc_region` VALUES ('3214', '381', '易门县', '3', '0');
INSERT INTO `zc_region` VALUES ('3215', '381', '峨山', '3', '0');
INSERT INTO `zc_region` VALUES ('3216', '381', '新平', '3', '0');
INSERT INTO `zc_region` VALUES ('3217', '381', '元江', '3', '0');
INSERT INTO `zc_region` VALUES ('3218', '382', '昭阳区', '3', '0');
INSERT INTO `zc_region` VALUES ('3219', '382', '鲁甸县', '3', '0');
INSERT INTO `zc_region` VALUES ('3220', '382', '巧家县', '3', '0');
INSERT INTO `zc_region` VALUES ('3221', '382', '盐津县', '3', '0');
INSERT INTO `zc_region` VALUES ('3222', '382', '大关县', '3', '0');
INSERT INTO `zc_region` VALUES ('3223', '382', '永善县', '3', '0');
INSERT INTO `zc_region` VALUES ('3224', '382', '绥江县', '3', '0');
INSERT INTO `zc_region` VALUES ('3225', '382', '镇雄县', '3', '0');
INSERT INTO `zc_region` VALUES ('3226', '382', '彝良县', '3', '0');
INSERT INTO `zc_region` VALUES ('3227', '382', '威信县', '3', '0');
INSERT INTO `zc_region` VALUES ('3228', '382', '水富县', '3', '0');
INSERT INTO `zc_region` VALUES ('3229', '383', '西湖区', '3', '0');
INSERT INTO `zc_region` VALUES ('3230', '383', '上城区', '3', '0');
INSERT INTO `zc_region` VALUES ('3231', '383', '下城区', '3', '0');
INSERT INTO `zc_region` VALUES ('3232', '383', '拱墅区', '3', '0');
INSERT INTO `zc_region` VALUES ('3233', '383', '滨江区', '3', '0');
INSERT INTO `zc_region` VALUES ('3234', '383', '江干区', '3', '0');
INSERT INTO `zc_region` VALUES ('3235', '383', '萧山区', '3', '0');
INSERT INTO `zc_region` VALUES ('3236', '383', '余杭区', '3', '0');
INSERT INTO `zc_region` VALUES ('3237', '383', '市郊', '3', '0');
INSERT INTO `zc_region` VALUES ('3238', '383', '建德市', '3', '0');
INSERT INTO `zc_region` VALUES ('3239', '383', '富阳市', '3', '0');
INSERT INTO `zc_region` VALUES ('3240', '383', '临安市', '3', '0');
INSERT INTO `zc_region` VALUES ('3241', '383', '桐庐县', '3', '0');
INSERT INTO `zc_region` VALUES ('3242', '383', '淳安县', '3', '0');
INSERT INTO `zc_region` VALUES ('3243', '384', '吴兴区', '3', '0');
INSERT INTO `zc_region` VALUES ('3244', '384', '南浔区', '3', '0');
INSERT INTO `zc_region` VALUES ('3245', '384', '德清县', '3', '0');
INSERT INTO `zc_region` VALUES ('3246', '384', '长兴县', '3', '0');
INSERT INTO `zc_region` VALUES ('3247', '384', '安吉县', '3', '0');
INSERT INTO `zc_region` VALUES ('3248', '385', '南湖区', '3', '0');
INSERT INTO `zc_region` VALUES ('3249', '385', '秀洲区', '3', '0');
INSERT INTO `zc_region` VALUES ('3250', '385', '海宁市', '3', '0');
INSERT INTO `zc_region` VALUES ('3251', '385', '嘉善县', '3', '0');
INSERT INTO `zc_region` VALUES ('3252', '385', '平湖市', '3', '0');
INSERT INTO `zc_region` VALUES ('3253', '385', '桐乡市', '3', '0');
INSERT INTO `zc_region` VALUES ('3254', '385', '海盐县', '3', '0');
INSERT INTO `zc_region` VALUES ('3255', '386', '婺城区', '3', '0');
INSERT INTO `zc_region` VALUES ('3256', '386', '金东区', '3', '0');
INSERT INTO `zc_region` VALUES ('3257', '386', '兰溪市', '3', '0');
INSERT INTO `zc_region` VALUES ('3258', '386', '市区', '3', '0');
INSERT INTO `zc_region` VALUES ('3259', '386', '佛堂镇', '3', '0');
INSERT INTO `zc_region` VALUES ('3260', '386', '上溪镇', '3', '0');
INSERT INTO `zc_region` VALUES ('3261', '386', '义亭镇', '3', '0');
INSERT INTO `zc_region` VALUES ('3262', '386', '大陈镇', '3', '0');
INSERT INTO `zc_region` VALUES ('3263', '386', '苏溪镇', '3', '0');
INSERT INTO `zc_region` VALUES ('3264', '386', '赤岸镇', '3', '0');
INSERT INTO `zc_region` VALUES ('3265', '386', '东阳市', '3', '0');
INSERT INTO `zc_region` VALUES ('3266', '386', '永康市', '3', '0');
INSERT INTO `zc_region` VALUES ('3267', '386', '武义县', '3', '0');
INSERT INTO `zc_region` VALUES ('3268', '386', '浦江县', '3', '0');
INSERT INTO `zc_region` VALUES ('3269', '386', '磐安县', '3', '0');
INSERT INTO `zc_region` VALUES ('3270', '387', '莲都区', '3', '0');
INSERT INTO `zc_region` VALUES ('3271', '387', '龙泉市', '3', '0');
INSERT INTO `zc_region` VALUES ('3272', '387', '青田县', '3', '0');
INSERT INTO `zc_region` VALUES ('3273', '387', '缙云县', '3', '0');
INSERT INTO `zc_region` VALUES ('3274', '387', '遂昌县', '3', '0');
INSERT INTO `zc_region` VALUES ('3275', '387', '松阳县', '3', '0');
INSERT INTO `zc_region` VALUES ('3276', '387', '云和县', '3', '0');
INSERT INTO `zc_region` VALUES ('3277', '387', '庆元县', '3', '0');
INSERT INTO `zc_region` VALUES ('3278', '387', '景宁', '3', '0');
INSERT INTO `zc_region` VALUES ('3279', '388', '海曙区', '3', '0');
INSERT INTO `zc_region` VALUES ('3280', '388', '江东区', '3', '0');
INSERT INTO `zc_region` VALUES ('3281', '388', '江北区', '3', '0');
INSERT INTO `zc_region` VALUES ('3282', '388', '镇海区', '3', '0');
INSERT INTO `zc_region` VALUES ('3283', '388', '北仑区', '3', '0');
INSERT INTO `zc_region` VALUES ('3284', '388', '鄞州区', '3', '0');
INSERT INTO `zc_region` VALUES ('3285', '388', '余姚市', '3', '0');
INSERT INTO `zc_region` VALUES ('3286', '388', '慈溪市', '3', '0');
INSERT INTO `zc_region` VALUES ('3287', '388', '奉化市', '3', '0');
INSERT INTO `zc_region` VALUES ('3288', '388', '象山县', '3', '0');
INSERT INTO `zc_region` VALUES ('3289', '388', '宁海县', '3', '0');
INSERT INTO `zc_region` VALUES ('3290', '389', '越城区', '3', '0');
INSERT INTO `zc_region` VALUES ('3291', '389', '上虞市', '3', '0');
INSERT INTO `zc_region` VALUES ('3292', '389', '嵊州市', '3', '0');
INSERT INTO `zc_region` VALUES ('3293', '389', '绍兴县', '3', '0');
INSERT INTO `zc_region` VALUES ('3294', '389', '新昌县', '3', '0');
INSERT INTO `zc_region` VALUES ('3295', '389', '诸暨市', '3', '0');
INSERT INTO `zc_region` VALUES ('3296', '390', '椒江区', '3', '0');
INSERT INTO `zc_region` VALUES ('3297', '390', '黄岩区', '3', '0');
INSERT INTO `zc_region` VALUES ('3298', '390', '路桥区', '3', '0');
INSERT INTO `zc_region` VALUES ('3299', '390', '温岭市', '3', '0');
INSERT INTO `zc_region` VALUES ('3300', '390', '临海市', '3', '0');
INSERT INTO `zc_region` VALUES ('3301', '390', '玉环县', '3', '0');
INSERT INTO `zc_region` VALUES ('3302', '390', '三门县', '3', '0');
INSERT INTO `zc_region` VALUES ('3303', '390', '天台县', '3', '0');
INSERT INTO `zc_region` VALUES ('3304', '390', '仙居县', '3', '0');
INSERT INTO `zc_region` VALUES ('3305', '391', '鹿城区', '3', '0');
INSERT INTO `zc_region` VALUES ('3306', '391', '龙湾区', '3', '0');
INSERT INTO `zc_region` VALUES ('3307', '391', '瓯海区', '3', '0');
INSERT INTO `zc_region` VALUES ('3308', '391', '瑞安市', '3', '0');
INSERT INTO `zc_region` VALUES ('3309', '391', '乐清市', '3', '0');
INSERT INTO `zc_region` VALUES ('3310', '391', '洞头县', '3', '0');
INSERT INTO `zc_region` VALUES ('3311', '391', '永嘉县', '3', '0');
INSERT INTO `zc_region` VALUES ('3312', '391', '平阳县', '3', '0');
INSERT INTO `zc_region` VALUES ('3313', '391', '苍南县', '3', '0');
INSERT INTO `zc_region` VALUES ('3314', '391', '文成县', '3', '0');
INSERT INTO `zc_region` VALUES ('3315', '391', '泰顺县', '3', '0');
INSERT INTO `zc_region` VALUES ('3316', '392', '定海区', '3', '0');
INSERT INTO `zc_region` VALUES ('3317', '392', '普陀区', '3', '0');
INSERT INTO `zc_region` VALUES ('3318', '392', '岱山县', '3', '0');
INSERT INTO `zc_region` VALUES ('3319', '392', '嵊泗县', '3', '0');
INSERT INTO `zc_region` VALUES ('3320', '393', '衢州市', '3', '0');
INSERT INTO `zc_region` VALUES ('3321', '393', '江山市', '3', '0');
INSERT INTO `zc_region` VALUES ('3322', '393', '常山县', '3', '0');
INSERT INTO `zc_region` VALUES ('3323', '393', '开化县', '3', '0');
INSERT INTO `zc_region` VALUES ('3324', '393', '龙游县', '3', '0');
INSERT INTO `zc_region` VALUES ('3325', '394', '合川区', '3', '0');
INSERT INTO `zc_region` VALUES ('3326', '394', '江津区', '3', '0');
INSERT INTO `zc_region` VALUES ('3327', '394', '南川区', '3', '0');
INSERT INTO `zc_region` VALUES ('3328', '394', '永川区', '3', '0');
INSERT INTO `zc_region` VALUES ('3329', '394', '南岸区', '3', '0');
INSERT INTO `zc_region` VALUES ('3330', '394', '渝北区', '3', '0');
INSERT INTO `zc_region` VALUES ('3331', '394', '万盛区', '3', '0');
INSERT INTO `zc_region` VALUES ('3332', '394', '大渡口区', '3', '0');
INSERT INTO `zc_region` VALUES ('3333', '394', '万州区', '3', '0');
INSERT INTO `zc_region` VALUES ('3334', '394', '北碚区', '3', '0');
INSERT INTO `zc_region` VALUES ('3335', '394', '沙坪坝区', '3', '0');
INSERT INTO `zc_region` VALUES ('3336', '394', '巴南区', '3', '0');
INSERT INTO `zc_region` VALUES ('3337', '394', '涪陵区', '3', '0');
INSERT INTO `zc_region` VALUES ('3338', '394', '江北区', '3', '0');
INSERT INTO `zc_region` VALUES ('3339', '394', '九龙坡区', '3', '0');
INSERT INTO `zc_region` VALUES ('3340', '394', '渝中区', '3', '0');
INSERT INTO `zc_region` VALUES ('3341', '394', '黔江开发区', '3', '0');
INSERT INTO `zc_region` VALUES ('3342', '394', '长寿区', '3', '0');
INSERT INTO `zc_region` VALUES ('3343', '394', '双桥区', '3', '0');
INSERT INTO `zc_region` VALUES ('3344', '394', '綦江县', '3', '0');
INSERT INTO `zc_region` VALUES ('3345', '394', '潼南县', '3', '0');
INSERT INTO `zc_region` VALUES ('3346', '394', '铜梁县', '3', '0');
INSERT INTO `zc_region` VALUES ('3347', '394', '大足县', '3', '0');
INSERT INTO `zc_region` VALUES ('3348', '394', '荣昌县', '3', '0');
INSERT INTO `zc_region` VALUES ('3349', '394', '璧山县', '3', '0');
INSERT INTO `zc_region` VALUES ('3350', '394', '垫江县', '3', '0');
INSERT INTO `zc_region` VALUES ('3351', '394', '武隆县', '3', '0');
INSERT INTO `zc_region` VALUES ('3352', '394', '丰都县', '3', '0');
INSERT INTO `zc_region` VALUES ('3353', '394', '城口县', '3', '0');
INSERT INTO `zc_region` VALUES ('3354', '394', '梁平县', '3', '0');
INSERT INTO `zc_region` VALUES ('3355', '394', '开县', '3', '0');
INSERT INTO `zc_region` VALUES ('3356', '394', '巫溪县', '3', '0');
INSERT INTO `zc_region` VALUES ('3357', '394', '巫山县', '3', '0');
INSERT INTO `zc_region` VALUES ('3358', '394', '奉节县', '3', '0');
INSERT INTO `zc_region` VALUES ('3359', '394', '云阳县', '3', '0');
INSERT INTO `zc_region` VALUES ('3360', '394', '忠县', '3', '0');
INSERT INTO `zc_region` VALUES ('3361', '394', '石柱', '3', '0');
INSERT INTO `zc_region` VALUES ('3362', '394', '彭水', '3', '0');
INSERT INTO `zc_region` VALUES ('3363', '394', '酉阳', '3', '0');
INSERT INTO `zc_region` VALUES ('3364', '394', '秀山', '3', '0');
INSERT INTO `zc_region` VALUES ('3365', '395', '沙田区', '3', '0');
INSERT INTO `zc_region` VALUES ('3366', '395', '东区', '3', '0');
INSERT INTO `zc_region` VALUES ('3367', '395', '观塘区', '3', '0');
INSERT INTO `zc_region` VALUES ('3368', '395', '黄大仙区', '3', '0');
INSERT INTO `zc_region` VALUES ('3369', '395', '九龙城区', '3', '0');
INSERT INTO `zc_region` VALUES ('3370', '395', '屯门区', '3', '0');
INSERT INTO `zc_region` VALUES ('3371', '395', '葵青区', '3', '0');
INSERT INTO `zc_region` VALUES ('3372', '395', '元朗区', '3', '0');
INSERT INTO `zc_region` VALUES ('3373', '395', '深水埗区', '3', '0');
INSERT INTO `zc_region` VALUES ('3374', '395', '西贡区', '3', '0');
INSERT INTO `zc_region` VALUES ('3375', '395', '大埔区', '3', '0');
INSERT INTO `zc_region` VALUES ('3376', '395', '湾仔区', '3', '0');
INSERT INTO `zc_region` VALUES ('3377', '395', '油尖旺区', '3', '0');
INSERT INTO `zc_region` VALUES ('3378', '395', '北区', '3', '0');
INSERT INTO `zc_region` VALUES ('3379', '395', '南区', '3', '0');
INSERT INTO `zc_region` VALUES ('3380', '395', '荃湾区', '3', '0');
INSERT INTO `zc_region` VALUES ('3381', '395', '中西区', '3', '0');
INSERT INTO `zc_region` VALUES ('3382', '395', '离岛区', '3', '0');
INSERT INTO `zc_region` VALUES ('3383', '396', '澳门', '3', '0');
INSERT INTO `zc_region` VALUES ('3384', '397', '台北', '3', '0');
INSERT INTO `zc_region` VALUES ('3385', '397', '高雄', '3', '0');
INSERT INTO `zc_region` VALUES ('3386', '397', '基隆', '3', '0');
INSERT INTO `zc_region` VALUES ('3387', '397', '台中', '3', '0');
INSERT INTO `zc_region` VALUES ('3388', '397', '台南', '3', '0');
INSERT INTO `zc_region` VALUES ('3389', '397', '新竹', '3', '0');
INSERT INTO `zc_region` VALUES ('3390', '397', '嘉义', '3', '0');
INSERT INTO `zc_region` VALUES ('3391', '397', '宜兰县', '3', '0');
INSERT INTO `zc_region` VALUES ('3392', '397', '桃园县', '3', '0');
INSERT INTO `zc_region` VALUES ('3393', '397', '苗栗县', '3', '0');
INSERT INTO `zc_region` VALUES ('3394', '397', '彰化县', '3', '0');
INSERT INTO `zc_region` VALUES ('3395', '397', '南投县', '3', '0');
INSERT INTO `zc_region` VALUES ('3396', '397', '云林县', '3', '0');
INSERT INTO `zc_region` VALUES ('3397', '397', '屏东县', '3', '0');
INSERT INTO `zc_region` VALUES ('3398', '397', '台东县', '3', '0');
INSERT INTO `zc_region` VALUES ('3399', '397', '花莲县', '3', '0');
INSERT INTO `zc_region` VALUES ('3400', '397', '澎湖县', '3', '0');
INSERT INTO `zc_region` VALUES ('3401', '3', '合肥', '2', '0');
INSERT INTO `zc_region` VALUES ('3402', '3401', '庐阳区', '3', '0');
INSERT INTO `zc_region` VALUES ('3403', '3401', '瑶海区', '3', '0');
INSERT INTO `zc_region` VALUES ('3404', '3401', '蜀山区', '3', '0');
INSERT INTO `zc_region` VALUES ('3405', '3401', '包河区', '3', '0');
INSERT INTO `zc_region` VALUES ('3406', '3401', '长丰县', '3', '0');
INSERT INTO `zc_region` VALUES ('3407', '3401', '肥东县', '3', '0');
INSERT INTO `zc_region` VALUES ('3408', '3401', '肥西县', '3', '0');

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
-- Table structure for zc_ucenter_app
-- ----------------------------
DROP TABLE IF EXISTS `zc_ucenter_app`;
CREATE TABLE `zc_ucenter_app` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '应用ID',
  `title` varchar(30) NOT NULL COMMENT '应用名称',
  `url` varchar(100) NOT NULL COMMENT '应用URL',
  `ip` char(15) NOT NULL COMMENT '应用IP',
  `auth_key` varchar(100) NOT NULL COMMENT '加密KEY',
  `sys_login` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '同步登陆',
  `allow_ip` varchar(255) NOT NULL COMMENT '允许访问的IP',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '应用状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='应用表';

-- ----------------------------
-- Records of zc_ucenter_app
-- ----------------------------

-- ----------------------------
-- Table structure for zc_ucenter_member
-- ----------------------------
DROP TABLE IF EXISTS `zc_ucenter_member`;
CREATE TABLE `zc_ucenter_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` char(16) NOT NULL COMMENT '用户名',
  `password` char(32) NOT NULL COMMENT '密码',
  `email` char(32) NOT NULL COMMENT '用户邮箱',
  `mobile` char(15) NOT NULL COMMENT '用户手机',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '用户状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of zc_ucenter_member
-- ----------------------------
INSERT INTO `zc_ucenter_member` VALUES ('1', 'root', '735cee945387378938100d46df1eebca', '939259192@qq.com', '', '1460179284', '2130706433', '1462584819', '2130706433', '1460179284', '1');

-- ----------------------------
-- Table structure for zc_ucenter_setting
-- ----------------------------
DROP TABLE IF EXISTS `zc_ucenter_setting`;
CREATE TABLE `zc_ucenter_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '设置ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型（1-用户配置）',
  `value` text NOT NULL COMMENT '配置数据',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='设置表';

-- ----------------------------
-- Records of zc_ucenter_setting
-- ----------------------------

-- ----------------------------
-- Table structure for zc_userdata
-- ----------------------------
DROP TABLE IF EXISTS `zc_userdata`;
CREATE TABLE `zc_userdata` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `type` tinyint(3) unsigned NOT NULL COMMENT '类型标识',
  `target_id` int(10) unsigned NOT NULL COMMENT '目标id',
  UNIQUE KEY `uid` (`uid`,`type`,`target_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zc_userdata
-- ----------------------------

-- ----------------------------
-- Table structure for zc_users
-- ----------------------------
DROP TABLE IF EXISTS `zc_users`;
CREATE TABLE `zc_users` (
  `user_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(60) NOT NULL DEFAULT '',
  `user_name` varchar(60) NOT NULL DEFAULT '',
  `password` varchar(32) NOT NULL DEFAULT '',
  `question` varchar(255) DEFAULT '',
  `answer` varchar(255) DEFAULT '',
  `sex` tinyint(1) unsigned DEFAULT '0',
  `birthday` date DEFAULT '0000-00-00',
  `user_money` decimal(10,2) DEFAULT '0.00',
  `address_id` mediumint(8) unsigned DEFAULT '0',
  `reg_time` datetime DEFAULT '0000-00-00 00:00:00',
  `last_login` datetime DEFAULT '0000-00-00 00:00:00',
  `last_time` datetime DEFAULT '0000-00-00 00:00:00',
  `last_ip` varchar(15) DEFAULT '',
  `visit_count` smallint(5) unsigned DEFAULT '0',
  `user_rank` tinyint(3) unsigned DEFAULT '0',
  `parent_id` mediumint(9) DEFAULT '0',
  `phone` varchar(20) DEFAULT NULL,
  `is_validated` tinyint(3) unsigned DEFAULT '0',
  `credit_line` decimal(10,2) unsigned DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `province` int(9) DEFAULT NULL,
  `city` int(9) DEFAULT NULL,
  `county` int(9) DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_name` (`user_name`),
  KEY `email` (`email`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of zc_users
-- ----------------------------
INSERT INTO `zc_users` VALUES ('1', 'xinyao@521.com', 'xinyao', 'baa7a52965b99778f38ef37f235e9053', '', '', '1', '0000-00-00', '0.00', '0', '2016-04-23 17:36:56', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0', '0', '0', '18800100830', '0', null, '1', null, null, null, null);
INSERT INTO `zc_users` VALUES ('2', 'mingming@521.con', 'mingming', '7815696ecbf1c96e6894b779456d330e', '', '', '1', '0000-00-00', '0.00', '0', '2016-04-23 17:47:38', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0', '0', '0', '18551652502', '0', null, '1', null, null, null, null);
INSERT INTO `zc_users` VALUES ('3', 'xionghaizi', 'xionghaizi', 'baa7a52965b99778f38ef37f235e9053', '', '', '1', '0000-00-00', '0.00', '0', '2016-04-23 17:50:55', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0', '0', '0', '13270830860', '0', null, '1', null, null, null, null);
INSERT INTO `zc_users` VALUES ('4', 'asasas@qq.com', '', 'baa7a52965b99778f38ef37f235e9053', '', '', '1', '0000-00-00', '0.00', '0', '2016-04-23 18:00:43', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0', '0', '0', '12345678', '0', null, '1', null, null, null, null);
INSERT INTO `zc_users` VALUES ('5', 'users', 'users', '7815696ecbf1c96e6894b779456d330e', '', '', '1', '0000-00-00', '0.00', '0', '2016-04-23 18:16:42', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0', '0', '0', '15951805717', '0', null, '1', null, null, null, null);
INSERT INTO `zc_users` VALUES ('6', 'yaoming@521.com', 'yaoming', '912ec803b2ce49e4a541068d495ab570', '', '', '2', '0000-00-00', '0.00', '0', '2016-04-23 19:48:20', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0', '0', '0', '18800100830', '0', null, '1', null, null, null, null);
INSERT INTO `zc_users` VALUES ('7', 'nannantingyu@hotmai.com', 'nannantingyu', 'e99a18c428cb38d5f260853678922e03', '', '', '1', '0000-00-00', '0.00', '0', '2016-04-23 21:59:09', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0', '0', '0', '13270830860', '0', null, '1', null, null, null, null);
INSERT INTO `zc_users` VALUES ('8', 'hahaha@51.com', 'hahaha', 'e99a18c428cb38d5f260853678922e03', '', '', '1', '0000-00-00', '0.00', '0', '2016-04-23 22:14:32', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0', '0', '0', '123456', '0', null, '1', null, null, null, null);
INSERT INTO `zc_users` VALUES ('9', 'ming@qq.com', 'ming', 'beda37583bc3f80c8b0368e9d6d58fff', '', '', '0', '0000-00-00', '0.00', '0', '2016-05-04 09:02:18', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0', '0', '0', '18551652502', '0', null, '1', '2', '52', '512', '回龙观北京人家小区');

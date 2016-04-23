/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50173
Source Host           : localhost:3306
Source Database       : yao

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2016-04-24 02:39:49
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
  PRIMARY KEY (`goods_id`),
  KEY `cat_id` (`cat_id`),
  KEY `last_update` (`last_update`),
  KEY `brand_id` (`brand_id`),
  KEY `goods_weight` (`goods_weight`),
  KEY `promote_end_date` (`promote_end_date`),
  KEY `promote_start_date` (`promote_start_date`),
  KEY `goods_number` (`goods_number`),
  KEY `sort_order` (`sort_order`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zc_goods
-- ----------------------------
INSERT INTO `zc_goods` VALUES ('1', '3', 'KD876', '7', '8', '', '1', '0.110', '1388.00', '0.00', '0', '0', 'LG 3g 876 支持 双模 2008年04月 灰色 GSM,850,900,1800,1900', '', '<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 很多朋友都已经抢先体验了3G网络的可视通话、高速上网等功能。LG KD876手机<span style=\"font-size: x-large;\"><span style=\"color: rgb(255, 0, 0);\"><strong>支持TD-SCDMA/GSM双模单待</strong></span></span>，便于测试初期GSM网络和TD网络之间的切换和共享。</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LG KD876手机整体采用银色塑料材质，<strong><span style=\"font-size: x-large;\"><span style=\"color: rgb(255, 0, 0);\">特殊的旋转屏设计是本机的亮点</span></span></strong>，而机身背部的300万像素摄像头也是首发的六款TD-SCDMA手机中配置最高的。LG KD876手机屏幕下方设置有外键盘，该键盘由左/右软键、通话/挂机键、返回键、五维摇杆组成，摇杆灵敏度很高，定位准确。KD876的内键盘由标准12个电话键和三个功能键、一个内置摄像头组成。三个功能键分别为视频通话、MP3、和菜单键，所有按键的手感都比较一般，键程适中，当由于按键排列过于紧密，快速发短信时很容易误按，用户在使用时一定要多加注意。LG KD876手机机身周边的接口设计非常简洁，手机的厚度主要来自屏幕旋转轴的长度，如果舍弃旋屏设计的话，估计<span style=\"font-size: x-large;\"><strong><span style=\"color: rgb(255, 0, 0);\">厚度可以做到10mm以下</span></strong></span>。</p>', 'images/200905/thumb_img/1_thumb_G_1240902890710.jpg', '/Uploads/Images/20160410/5709337ec2269.jpg', 'images/200905/source_img/1_G_1240902890895.gif', '1', '', '1', '1', '0', '13', '2016-04-02 10:00:00', '100', '0', '1', '1', '1', '0', '0', '1269589545', '3', '', '-1', '-1', null, null);
INSERT INTO `zc_goods` VALUES ('4', '8', '诺基亚N85原装充电器', '0', '1', '', '17', '0.000', '58.00', '0.00', '0', '0', '', '', '', 'images/200905/thumb_img/4_thumb_G_1241422402467.jpg', 'images/200905/goods_img/4_G_1241422402722.jpg', 'images/200905/source_img/4_G_1241422402919.jpg', '1', '', '0', '0', '0', '0', '2016-04-02 10:00:00', '100', '0', '0', '0', '0', '0', '0', '1242110662', '6', '', '-1', '-1', null, null);
INSERT INTO `zc_goods` VALUES ('3', '8', '诺基亚原装5800耳机', '3', '1', '', '24', '0.000', '68.00', '0.00', '0', '0', '', '', '', 'images/200905/thumb_img/3_thumb_G_1241422082679.jpg', 'images/200905/goods_img/3_G_1241422082168.jpg', 'images/200905/source_img/3_G_1241422082367.jpg', '1', '', '0', '1', '0', '0', '2016-04-02 10:00:00', '100', '0', '0', '0', '0', '0', '0', '1241972255', '6', '', '-1', '-1', null, null);
INSERT INTO `zc_goods` VALUES ('5', '11', '索爱原装M2卡读卡器', '3', '7', '', '8', '0.000', '20.00', '0.00', '0', '0', '', '', '', 'images/200905/thumb_img/5_thumb_G_1241422518886.jpg', 'images/200905/goods_img/5_G_1241422518773.jpg', 'images/200905/source_img/5_G_1241422518470.jpg', '1', '', '0', '1', '0', '0', '2016-04-02 10:00:00', '100', '0', '1', '1', '0', '0', '0', '1241972241', '2', '', '-1', '-1', null, null);
INSERT INTO `zc_goods` VALUES ('6', '11', '胜创KINGMAX内存卡', '0', '0', '', '15', '0.000', '42.00', '0.00', '0', '0', '', '', '', '', '', '', '1', '', '0', '0', '0', '0', '2016-04-02 10:00:00', '100', '0', '0', '0', '0', '0', '0', '1241972238', '6', '', '-1', '-1', null, null);
INSERT INTO `zc_goods` VALUES ('7', '8', '诺基亚N85原装立体声耳机HS-82', '0', '1', '', '20', '0.000', '100.00', '0.00', '0', '0', '', '', '', 'images/200905/thumb_img/7_thumb_G_1241422785492.jpg', 'images/200905/goods_img/7_G_1241422785856.jpg', 'images/200905/source_img/7_G_1241422785657.jpg', '1', '', '0', '1', '0', '1', '2016-04-02 10:00:00', '100', '0', '0', '0', '0', '0', '0', '1241972232', '2', '', '-1', '-1', null, null);
INSERT INTO `zc_goods` VALUES ('8', '4', '飞利浦9@9v', '9', '4', '', '1', '0.075', '399.00', '385.00', '1241366400', '1417276800', '双模 2008年春 黑色 直板 中低档', '', '<p align=\"left\">作为一款性价比极高的入门级<font size=\"3\" color=\"#ff0000\"><strong>商务手机</strong></font>，飞利浦<a href=\"mailto:9@9v\">Xenium&nbsp; 9@9v</a>三围大小为105&times;44&times;15.8mm，机身重量仅为<strong><font size=\"3\" color=\"#ff0000\">75g</font></strong>，装配了一块低规格1.75英寸128&times;160像素65000色CSTN显示屏。身正面采用月银色功能键区与屏幕数字键区相分隔，键盘设计较为<font size=\"3\"><strong><font color=\"#ff0000\">别</font><font color=\"#ff0000\">致</font></strong></font>，中部导航键区采用钛金色的&ldquo;腰带&rdquo;彰显出浓郁的商务气息。</p>\r\n<p align=\"left\">&nbsp;</p>\r\n<p align=\"left\">此款手机采用<strong><font size=\"3\" color=\"#ff0000\">触摸屏</font></strong>设计，搭配精致的手写笔，可支持手写中文和英文两个版本。增强的内置系统还能识别潦草字迹，确保在移动中和匆忙时输入文字的识别率。手写指令功能还支持特定图案的瞬间调用，独特的手写记事本功能，可以在触摸屏上随意绘制个性化的图案并进行<strong><font size=\"3\" color=\"#ff0000\">记事提醒</font></strong>，让商务应用更加随意。</p>\r\n<p align=\"left\">&nbsp;</p>\r\n<p align=\"left\">&nbsp;作为入门级为数不多支持<strong><font size=\"3\" color=\"#ff0000\">双卡功能</font></strong>的手机，可以同时插入两张SIM卡，通过菜单随意切换，只需开启漫游自动切换模式，<a href=\"mailto:9@9V\">9@9V</a>在该模式下能够判断网络情况，自动切换适合的手机号。</p>\r\n<p align=\"left\">&nbsp;</p>\r\n<p align=\"left\">&nbsp;</p>', 'images/200905/thumb_img/8_thumb_G_1241425513488.jpg', 'images/200905/goods_img/8_G_1241425513055.jpg', 'images/200905/source_img/8_G_1241425513518.jpg', '1', '', '0', '1', '0', '3', '2016-04-02 10:00:00', '100', '0', '1', '1', '1', '1', '0', '1269589533', '9', '', '-1', '-1', null, null);
INSERT INTO `zc_goods` VALUES ('9', '4', '诺基亚E66', '20', '1', '', '4', '0.121', '2298.00', '0.00', '0', '0', 'SMS EMS MMS 短消息群发 语音 阅读器 SMS,EMS,MMS,短消息群发语音合成信息阅读器 黑色 白色 滑盖', '', '<p>在机身材质方面，诺基亚E66大量采用金属材质，刨光的金属表面光泽动人，背面的点状效果规则却又不失变化，时尚感总是在不经意间诠释出来，并被人们所感知。E66机身尺寸为<span style=\"color: rgb(255, 0, 0);\"><span style=\"font-size: larger;\"><strong>107.5&times;49.5&times;13.6毫米，重量为121克</strong></span></span>，滑盖的造型竟然比E71还要轻一些。</p>\r\n<p>&nbsp;</p>\r\n<div>诺基亚E66机身正面是<span style=\"color: rgb(255, 0, 0);\"><span style=\"font-size: larger;\"><strong>一块2.4英寸1600万色QVGA分辨率（240&times;320像素）液晶显示屏</strong></span></span>。屏幕上方拥有光线感应元件，能够自适应周 围环境光调节屏幕亮度；屏幕下方是方向功能键区。打开滑盖，可以看到传统的数字键盘，按键的大小、手感、间隔以及键程适中，手感非常舒适。</div>\r\n<div>&nbsp;</div>\r\n<div>诺基亚为E66配备了一颗320万像素自动对焦摄像头，带有LED 闪光灯，支持多种拍照尺寸选择。</div>\r\n<p>&nbsp;</p>', 'images/200905/thumb_img/9_thumb_G_1241511871555.jpg', '/Uploads/images/20160403/5700d9e974edd.jpg', 'images/200905/source_img/9_G_1241511871550.jpg', '1', '', '0', '1', '0', '22', '2016-04-02 10:00:00', '100', '0', '1', '1', '1', '0', '0', '1269589743', '4', '', '-1', '-1', null, null);
INSERT INTO `zc_goods` VALUES ('10', '4', '索爱C702c', '11', '7', '', '7', '0.000', '1328.00', '1250.00', '1243785600', '1277827200', '2008年05月 GSM,850,900,1800,1900 直板', '', '<p>C702可以说是一种在外观上复古的产物，不仅延续T系列早期的直板造型，而且在屏幕和键盘的组合分布上都继承了前辈的精髓。C702的机身尺寸为106&times;48&times;15.5毫米，重量为105克。此外索尼爱立信为C702融入了<font size=\"3\" color=\"#ff0000\"><strong>三防特性，即防尘、防滑和防水溅</strong></font>，这款新的C702搭载了索尼爱立信经典A200平台，界面布局与W908c、K858c一致，典型的特征就是配备左右软键、中央确定键和通话/挂机键。</p>\r\n<p>索尼爱立信C702配备一块<strong><font size=\"3\" color=\"#ff0000\">2.2英寸26万色TFT液晶显示屏</font></strong>，分辨率为240&times;320像素(QVGA)，显示效果属于目前主流水准。C702可以说是索尼爱立信首批<strong><font size=\"3\" color=\"#ff0000\">内置GPS模块</font></strong>的 手机产品之一，C702的搜星、定位一气呵成，十分精准，误差大约在10米之内。基本上定位后可以将有效卫星数量控制在4&mdash;6颗，可以说可以满足我们的需 要了。C702还提供了&ldquo;影像定位&rdquo;功能，配合内置的AGPS全球定位辅助系统，只须启动Geo-Tagging智能影像定位功能，便可将拍摄地点记录在 照片内，方便用户随时查询。</p>\r\n<p>&nbsp;</p>\r\n<p>作为一款Cyber-shot系列影像手机，索尼爱立信C702在拍照功能方面同样有不俗的表现。并且手机内置的<strong><font size=\"3\" color=\"#ff0000\">320万像素摄像头</font></strong>也 同样在拍照功能上也不错的表现。不仅支持自动聚焦和双LED闪光功能，而且还拥有2倍数码变焦、防红眼、Photo fix优画及场景模式等功能。索尼爱立信C702除了配备的是最大光圈为F3.2的4.2毫米镜头之外，该机也如同门中的旗舰C902一样增加了对脸部有 先自动聚焦功能的支持。</p>\r\n<p>&nbsp;</p>', 'images/200905/thumb_img/10_thumb_G_1242973436403.jpg', 'images/200905/goods_img/10_G_1242973436141.jpg', 'images/200905/source_img/10_G_1242973436172.jpg', '1', '', '0', '1', '0', '13', '2016-04-02 10:00:00', '100', '0', '0', '0', '1', '1', '0', '1245290333', '9', '', '-1', '-1', null, null);
INSERT INTO `zc_goods` VALUES ('11', '4', '索爱C702c', '0', '7', '', '1', '0.000', '1300.00', '0.00', '0', '0', '直板', '', '', '', '/Uploads/Images/20160410/57092a52e7434.jpg', '', '1', '', '0', '1', '0', '0', '2016-04-02 10:00:00', '100', '1', '0', '0', '0', '0', '0', '1241966960', '4', '', '-1', '-1', null, null);
INSERT INTO `zc_goods` VALUES ('12', '4', '摩托罗拉A810', '13', '2', '', '8', '0.000', '983.00', '960.00', '1241107200', '1255104000', 'SMS EMS MMS pda 摄像 智能 音乐 SMS,EMS,MMS', '', '<p>全机使用的材质除去电池盖部分采用了金属以外，其它均使用了ABS工程塑料作为主材，这款手机的三围是105&times;51&times;14毫米，有着100克的轻量级重量，拿在手中的感觉还是非常不错的。A810手机作为一款<strong><font size=\"3\" color=\"#ff0000\">PDA手机</font></strong>在设计的时候取消了键盘配置，一切数字键都要依靠手机内提供的虚拟键盘进行操作，在手机的左上侧是一个<strong><font size=\"3\" color=\"#ff0000\">3.5mm的标准耳机插口</font></strong>，这种设计可以让用户使用自己习惯或者喜欢的耳机去欣赏音乐。</p>\r\n<p>&nbsp;</p>\r\n<p>这款摩托罗拉A810手机配置了一块<font size=\"3\" color=\"#ff0000\"><strong>26万色的2.2英寸TFT全触摸屏幕</strong></font>，其分辨率达到了主流的QVGA水平（240&times;320像素），摩托罗拉A810采用了内部核心为2.6.10的<strong><font size=\"3\" color=\"#ff0000\">LINUX操作系统</font></strong>，菜单上依然采用传统的9宫格的显示方式，一般手机的名片式电话本只能支持诸如电话、邮件、传真、公司等一些基本信息，而A810手机的电话本除了这些还支持公司地址，配偶信息、子女姓名、上司名称、助手等等，对于一款手机来说，电话本不可谓不强大。A810的<strong><font size=\"3\" color=\"#ff0000\">手写识别能力相当的惊人</font></strong>，对连笔、草书和倒插笔的识别率都相当的高，同时还为左右手设置了不同的书写习惯选择，并支持手写速度的调节。</p>\r\n<p>这款A810手机<strong><font size=\"3\" color=\"#ff0000\">内置的音乐播放功能</font></strong>可以支持MP3、WAV、AMR、AAC等格式的音乐播放，<font size=\"3\" color=\"#ff0000\"><strong>支持后台播放</strong></font>。视频方面，这款A810支持MP4、3GP、H.263格式的播放，视频播放器同样简约，操作方便，这款摩托罗拉A810还内置了6款游戏，每一款都有很高的耐玩性，而且都是支持触摸屏操作的，同时这款手机还内置了<strong><font size=\"3\" color=\"#ff0000\">FM收音机</font></strong>，支持自动搜索，并提供了20个频道供用户存储，不过收音机并不支持后台播放。</p>\r\n<p>&nbsp;</p>', 'images/200905/thumb_img/12_thumb_G_1241965978410.jpg', '/Uploads/images/20160403/5700da4b63789.jpg', 'images/200905/source_img/12_G_1241965978878.jpg', '1', '', '0', '1', '0', '9', '2016-04-02 10:00:00', '100', '0', '0', '1', '0', '1', '0', '1245297670', '4', '', '-1', '-1', null, null);
INSERT INTO `zc_goods` VALUES ('13', '4', '诺基亚5320 XpressMusic', '13', '1', '', '8', '0.000', '1311.00', '0.00', '0', '0', '摄像 智能 音乐 蓝色 红色 舒适 直板 中档 2008年07月 黑色 GSM,850,900,1800,1900', '', '<p>诺基亚5320XpressMusic音乐手机采用XpressMusic系列常见的黑红、黑蓝配色方案，而材质方便则选用的是经过<strong><font size=\"3\" color=\"#ff0000\">抛光处理</font></strong>的工程塑料；三围/体重为，为108&times;46&times;15mm/<strong><font size=\"3\" color=\"#ff0000\">90g</font></strong>，手感舒适。</p>\r\n<p>&nbsp;</p>\r\n<p>诺基亚5320采用的是一块可视面积为2.0英寸的<font size=\"3\" color=\"#ff0000\"><strong>1600万色</strong></font>屏幕，分辨率是常见的240&times;320像素（QVGA）。虽然屏幕不是特别大，但效果非常精细，色彩还原不错。</p>\r\n<p>&nbsp;</p>\r\n<p>手机背面，诺基亚为5320XM配备一颗<strong><font size=\"3\" color=\"#ff0000\">200W像素</font></strong>的摄像头，并且带有<strong><font size=\"3\" color=\"#ff0000\">两个LED的补光灯</font></strong>，可以实现拍照、摄像功能，并能通过彩信、邮件方式发送给朋友。</p>\r\n<p>&nbsp;</p>', 'images/200905/thumb_img/13_thumb_G_1241968002527.jpg', '/Uploads/images/20160403/5700da7a0b594.jpg', 'images/200905/source_img/13_G_1241968002732.jpg', '1', '', '0', '1', '0', '13', '2016-04-02 10:00:00', '100', '0', '0', '0', '1', '0', '0', '1269589198', '4', '', '-1', '-1', null, null);
INSERT INTO `zc_goods` VALUES ('14', '3', '诺基亚5800XM', '6', '1', '', '1', '0.000', '2625.00', '0.00', '0', '0', 'GSM 64和弦 2009年2月 320万摄像头 GPS 直板 工程塑料 支持 2008年10月 黑色', '', '', 'images/200905/thumb_img/14_thumb_G_1241968492116.jpg', '/Uploads/Images/20160410/57092926e2c9e.jpg', 'images/200905/source_img/14_G_1241968492305.jpg', '1', '', '0', '1', '0', '26', '2016-04-02 10:00:00', '100', '0', '0', '0', '1', '0', '0', '1269589186', '3', '', '-1', '-1', null, null);
INSERT INTO `zc_goods` VALUES ('15', '4', '摩托罗拉A810', '8', '2', '', '3', '0.000', '788.00', '0.00', '0', '0', '600 直板 工程塑料 蓝牙 视频拍摄 音乐 黑色 白色', '', '', 'images/200905/thumb_img/15_thumb_G_1242973362970.jpg', 'images/200905/goods_img/15_G_1242973362318.jpg', 'images/200905/source_img/15_G_1242973362751.jpg', '1', '', '0', '1', '0', '5', '2016-04-02 10:00:00', '100', '1', '0', '1', '1', '0', '0', '1245297631', '9', '', '-1', '-1', null, null);
INSERT INTO `zc_goods` VALUES ('16', '2', '恒基伟业G101', '3', '11', '', '0', '0.000', '823.33', '0.00', '0', '0', '', '', '', 'images/200905/thumb_img/16_thumb_G_1241968949103.jpg', 'images/200905/goods_img/16_G_1241968949002.jpg', 'images/200905/source_img/16_G_1241968949402.jpg', '1', '', '0', '1', '0', '8', '2016-04-02 10:00:00', '100', '0', '0', '0', '0', '0', '0', '1245290562', '2', '', '-1', '-1', null, null);
INSERT INTO `zc_goods` VALUES ('17', '4', '夏新N7', '2', '5', '', '1', '0.000', '2300.00', '0.00', '0', '0', '2008年01月 GSM,900,1800,1900,2100 直板 262144万 240×400 像素 SMS,EMS,MMS,超长信息发送,短消息群发 黑色 CDMA', '', '', 'images/200905/thumb_img/17_thumb_G_1241969394587.jpg', 'images/200905/goods_img/17_G_1241969394677.jpg', 'images/200905/source_img/17_G_1241969394844.jpg', '1', '', '0', '1', '0', '23', '2016-04-02 10:00:00', '100', '0', '1', '0', '1', '0', '0', '1269589169', '9', '', '-1', '-1', null, null);
INSERT INTO `zc_goods` VALUES ('18', '3', '夏新T5', '0', '5', '', '1', '0.000', '2878.00', '0.00', '0', '0', '2008年04月 3G(GSM,900,1800,1900,TD-SCDMA ) 直板 262144万 320×240 像素 是 银色', '', '<p>&nbsp;  TD-SCDMA/GSM两种模式任意切换，中国3G手机先驱，支持大陆特有3G网络，轻松实现可视电话、视频留言、视频会议功能，2.6英寸Q屏，手写、键盘双输入，内置移动证券，支持手机邮箱、手机地图、无驱U盘</p>', '', '', '', '1', '', '0', '1', '0', '28', '2016-04-02 10:00:00', '100', '1', '0', '0', '0', '0', '0', '1241969533', '2', '', '-1', '-1', null, null);
INSERT INTO `zc_goods` VALUES ('19', '4', '三星SGH-F258', '7', '6', '', '12', '0.000', '858.00', '0.00', '0', '0', '滑盖 GSM 258 时尚 蓝牙 黑色 金色 白色', '从整体来看，三星SGH-F258比较时尚可爱，三围尺寸为94×46×17.5mm，重量为96克，曲线柔和具有玲珑美感\r\n', '<p>从整体来看，三星SGH-F258比较<font size=\"3\" color=\"#ff0000\"><strong>时尚</strong></font>可爱，三围尺寸为94&times;46&times;17.5mm，重量为96克，曲线柔和具有玲珑美感。</p>\r\n<p>&nbsp;</p>\r\n<p>三星F258的前面板整体应用<strong><font size=\"3\" color=\"#ff0000\">镜面效果</font></strong>，2.0英寸显示屏幕略显窄小，导航键与功能键在滑盖滑开之前是前面板的全部控制键，没有挂断和接听键，不过，五向键有<font size=\"3\"><strong><font color=\"#ff0000\">音乐操</font><font color=\"#ff0000\">作</font></strong></font>功能，明确显示了F258音乐手机的定位。</p>\r\n<p>&nbsp;</p>\r\n<p>F258的数字键键区采用了极具金属质感的平板式设计，每颗按键的面积足够大，按键与按键之间的间隔明显，操作起来手感舒适。</p>', 'images/200905/thumb_img/19_thumb_G_1241970175208.jpg', 'images/200905/goods_img/19_G_1241970175091.jpg', 'images/200905/source_img/19_G_1241970175549.jpg', '1', '', '0', '1', '0', '8', '2016-04-02 10:00:00', '100', '0', '1', '1', '1', '0', '0', '1269589154', '9', '', '-1', '-1', null, null);
INSERT INTO `zc_goods` VALUES ('20', '4', '三星BC01', '14', '6', '', '12', '0.000', '280.00', '238.00', '1241884800', '1251648000', 'GSM 直板 40和弦 金属材质 2008年07月 黑色 GSM,900,1800,1900,2100', '', '', 'images/200905/thumb_img/20_thumb_G_1242106490058.jpg', '/Uploads/Images/20160410/570927d5332db.jpg', 'images/200905/source_img/20_G_1242106490922.jpg', '1', '', '0', '1', '0', '2', '2016-04-02 10:00:00', '100', '0', '1', '1', '1', '1', '0', '1269589110', '4', '', '-1', '-1', null, null);
INSERT INTO `zc_goods` VALUES ('21', '4', '金立 A30', '4', '1', '', '40', '0.000', '2000.00', '0.00', '0', '0', '2008年03月 GSM,900,1800,1900,2100 直板 1600万 240×400 像素 2007年12月 200万摄像头 黑色', '', '<p>&nbsp;</p>\r\n<p align=\"left\"><span style=\"font-size: medium;\"><font size=\"3\">标准配置: 标准锂电池两块,充电器两个,立体声耳机一个,数据线,说明书送256TF</font></span></p>\r\n<p align=\"left\"><span style=\"font-size: medium;\"><font size=\"3\">通讯功能&nbsp; 输入法 短信功能 话机通讯录 通话记录</font></span></p>\r\n<p align=\"left\"><span style=\"font-size: medium;\"><font size=\"3\">输入法: 中文输入法</font></span></p>\r\n<p align=\"left\"><span style=\"font-size: medium;\"><font size=\"3\">短信功能: 支持短信300条和彩信100条</font></span></p>\r\n<p align=\"left\"><span style=\"font-size: medium;\"><font size=\"3\">话机通讯录: 1000组名片式电话存储 来电防火墙功能&nbsp; 来电大头贴及来电铃声识别</font></span></p>\r\n<p align=\"left\"><span style=\"font-size: medium;\"><font size=\"3\">通话记录：支持电话录音,恢复/静音,双音多频,免提</font></span></p>\r\n<p>&nbsp;</p>\r\n<p><font size=\"3\">高级功能</font></p>\r\n<p align=\"left\"><span style=\"font-size: medium;\"><font size=\"3\">多媒体娱乐: 200万像素，最大支持10240*960，11级数码变焦,多种效果设置,连拍可全屏查看拍摄或下载的图片.支持有声MP4短片拍摄，录像时间根据内存 大小而定，拍摄录像,TV电视可跟朋友家人一起分享。支持网络摄像头功能 支持MPEG4、3GP(H.263)等视频格式 支持MP3等音频格式播放， 支持歌词播放</font></span></p>\r\n<p align=\"left\"><span style=\"font-size: medium;\"><font size=\"3\">内置游戏:智能拼图</font></span></p>\r\n<p align=\"left\"><span style=\"font-size: medium;\"><font size=\"3\">扩展存储功能:支持TF扩展,支持U盘功能,本机内置1M,随机赠送256TF卡</font></span></p>\r\n<p align=\"left\"><span style=\"font-size: medium;\"><font size=\"3\">高级功能:直板/智能PDA手写/键盘输入 超长待机 WAP上网&nbsp; 录音 蓝牙 FM收音机 电子书 Java扩展 TV电视输出 声控语音拨号 免费电视 来电防火墙&nbsp;&nbsp;&nbsp;</font></span></p>\r\n<p align=\"left\"><span style=\"font-size: medium;\"><font size=\"3\">附加功能: 日历 计算器 闹钟 记事本 日程表 秒表 单位换算</font></span></p>\r\n<p><span style=\"font-size: medium;\"><font size=\"3\">提醒 以上性能均为本公司员工试机后所写,产品资料仅供参考,请以收到实物为准</font></span></p>', 'images/200905/thumb_img/21_thumb_G_1242109298150.jpg', '/Uploads/Brand/20160407/5706753ed929b.jpg', 'images/200905/source_img/21_G_1242109298831.jpg', '1', '', '1', '1', '0', '20', '2016-04-02 10:00:00', '100', '0', '0', '0', '0', '0', '0', '1269589102', '3', '', '-1', '-1', null, null);
INSERT INTO `zc_goods` VALUES ('22', '1', '多普达Touch HD', '15', '3', '', '1', '0.000', '5999.00', '0.00', '0', '0', '500万摄像头 蓝牙 手写 GPS 办公应用 语音拨号 2008年12月 黑色 GSM,850,900,1800,1900 直板', '', '<p><img src=\"http://xgone.xgou.com/xgoumanage/upload/20090325/2009032502045081100887.jpg\" alt=\"\" /></p>\r\n<p>&nbsp;</p>\r\n<p><img src=\"http://www.ouku.com/upimg/ouku/Image/002(1).jpg\" alt=\"\" /></p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>', 'images/200905/thumb_img/22_thumb_G_1241971076803.jpg', '/Uploads/images/20160403/5700d6294a051.jpg', 'images/200905/source_img/22_G_1241971076130.jpg', '1', '', '1', '1', '0', '59', '2016-04-02 10:00:00', '100', '0', '1', '1', '0', '0', '0', '1269589090', '3', '', '-1', '-1', null, null);
INSERT INTO `zc_goods` VALUES ('23', '32', '诺基亚N96', '17', '1', '', '8', '0.000', '3700.00', '0.00', '0', '0', '500万摄像头 microSD 工程塑料 蓝牙 数码相机 内置游戏 滑盖 高档 2008年09月 320×240 像素 黑色', '', '<p>诺基亚N96采用了<strong><font size=\"3\" color=\"#ff0000\">双向滑盖</font></strong>设计，机身整体呈灰黑色，沉稳、大气，机身材质采用了高强度的塑料材质，手机背面采用了抛光面板的设计风格。N96三维体积103*55*20mm，重量为125g。屏幕方面，诺基亚N96配备一块<strong><font size=\"3\" color=\"#ff0000\">2.8英寸</font></strong>的屏幕，支持<strong><font size=\"3\" color=\"#ff0000\">1670万色</font></strong>显示，分辨率达到QVGA（320&times;240）水准。</p>\r\n<p><img alt=\"\" src=\"file:///C:/DOCUME~1/user/LOCALS~1/Temp/moz-screenshot.jpg\" /></p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;<img src=\"http://img2.zol.com.cn/product/21/896/ceN6LBMCid3X6.jpg\" alt=\"\" /></p>\r\n<p>诺基亚N96设置有专门的<strong><font size=\"3\" color=\"#ff0000\">音乐播放键</font></strong>和标准的3.5毫米音频插口，支持多格式音乐播放。内置了<strong><font size=\"3\" color=\"#ff0000\">多媒体播放器</font></strong>，支持FM调频收音机等娱乐功能。N96手机支持<strong><font size=\"3\" color=\"#ff0000\">N-Gage游戏平台</font></strong>，内置包括<font size=\"3\" color=\"#ff0000\"><strong>《PinBall》完整版</strong></font>在内的四款N-Gage游戏，除了手机本身内置的游戏，还可以从N-Gage的网站下载或者购买最新的游戏，而且可以在论坛里和其他玩家一起讨论。</p>\r\n<p><img src=\"http://img2.zol.com.cn/product/21/898/cekkw57qJjSI.jpg\" alt=\"\" /></p>\r\n<p>&nbsp;</p>', 'images/200905/thumb_img/23_thumb_G_1241971556399.jpg', '/Uploads/images/20160403/5700da7a0b594.jpg', 'images/200905/source_img/23_G_1241971556256.jpg', '1', '', '1', '1', '0', '37', '2016-04-02 10:00:00', '100', '0', '1', '1', '0', '0', '0', '1269589078', '5', '', '-1', '-1', null, null);
INSERT INTO `zc_goods` VALUES ('24', '1', 'P806', '35', '9', '', '100', '0.000', '2000.00', '1850.00', '1243785600', '1277827200', '旅行充电器 图形菜单 Wap 上网 红外接口 移动 MSN 支持 2008年06月 灰色', '', '<div>\r\n<div>\r\n<div><font size=\"4\">规格参数</font></div>\r\n<p><font size=\"4\"><span>上市时间：</span><span>2008年06月</span></font></p>\r\n<p><font size=\"4\"><span>网络频率：</span><span>GSM/GPRS；900/1800MHz</span></font></p>\r\n<p><font size=\"4\"><span>重　量　：</span><span>未知</span></font></p>\r\n<p><font size=\"4\"><span>尺寸/体积：</span><span>未知</span></font></p>\r\n<p><font size=\"4\"><span>可选颜色：</span><span>银色</span></font></p>\r\n<p><font size=\"4\"><span>屏幕参数：</span><span>26万色TFT彩色屏幕；</span></font></p>\r\n<p><font size=\"4\"><span>WAP上网：</span><span>支持飞笺</span></font></p>\r\n<p><font size=\"4\"><span>基本配置:<em><strong><font size=\"5\" color=\"#ff00ff\">二电(1760毫安) 一充 数据线 耳机 手写笔 512M内存卡</font></strong></em></span></font></p>\r\n<p>&nbsp;</p>\r\n</div>\r\n</div>\r\n<div><font size=\"4\">基本功能</font></div>\r\n<p><font size=\"4\"><span>『时钟』</span><span>『内置振动』</span><span>『录音』</span><span>『可选铃声』</span></font></p>\r\n<p><font size=\"4\"><span>『和弦铃声』</span><span>『MP3铃声』</span><span>『来电铃声识别』</span><span>『来电图片识别』</span></font></p>\r\n<p><font size=\"4\"><span>『情景模式』</span><span>『待机图片』</span><span>『图形菜单』</span><span>『触摸屏』</span></font></p>\r\n<p><span><font size=\"4\">『手写输入』</font></span></p>\r\n<div><font size=\"4\">通信功能</font></div>\r\n<p><font size=\"4\"><span>『双卡双待』</span><span>『内置天线』</span><span>『输入法』</span><span>『中文短信』</span></font></p>\r\n<p><font size=\"4\"><span>『短信群发』</span><span>『多媒体短信』</span><span>『话机通讯录』</span><span>『通话记录』</span></font></p>\r\n<p><font size=\"4\"><span>『免提通话』</span><span>『飞行模式』</span></font></p>\r\n<div><font size=\"4\">多媒体娱乐 :支持3GP、MP4文件播放</font></div>\r\n<p><font size=\"4\"><span>『视频播放』</span><span>『MP3播放器』</span></font></p>\r\n<p><font size=\"4\"><span>多媒体卡扩展：</span><span>支持microSD卡扩展&nbsp;</span></font></p>\r\n<p><font size=\"4\"><span>摄像头：</span><span>内置</span></font></p>\r\n<p><font size=\"4\"><span>摄像头像素：</span><span>30万像素</span></font></p>\r\n<p><font size=\"4\"><span>传感器类型：</span><span>CMOS</span></font></p>\r\n<p><font size=\"4\"><span>变焦模式：</span><span>数码变焦</span></font></p>\r\n<p><font size=\"4\"><span>照片分辨率：</span><span>多种照片分辨率选择</span></font></p>\r\n<p><font size=\"4\"><span>拍摄模式：</span><span>多种拍摄模式选择</span></font></p>\r\n<p><font size=\"4\"><span>照片质量：</span><span>多种照片质量选择</span></font></p>\r\n<p><font size=\"4\"><span>视频拍摄：</span><span>有声视频拍摄</span></font></p>\r\n<div><font size=\"4\">数据传输</font></div>\r\n<p><font size=\"4\"><span>『WAP浏览器』</span><span>『数据线接口』</span></font></p>\r\n<div><font size=\"4\">个人助理</font></div>\r\n<p><font size=\"4\"><span>『闹钟』</span><span>『日历』</span><span>『计算器』</span></font></p>', 'images/200905/thumb_img/24_thumb_G_1241971981429.jpg', '/Uploads/images/20160403/5700d334ccd23.jpg', 'images/200905/source_img/24_G_1241971981107.jpg', '1', '', '1', '1', '0', '20', '2016-04-02 10:00:00', '100', '0', '1', '1', '1', '1', '0', '1269589064', '3', '', '-1', '-1', null, null);
INSERT INTO `zc_goods` VALUES ('25', '35', '小灵通/固话50元充值卡', '0', '1', '', '2', '0.000', '48.00', '0.00', '0', '0', '', '', '', 'images/200905/thumb_img/25_thumb_G_1241972709885.jpg', '/Uploads/images/20160403/57011784572ad.jpg', 'images/200905/source_img/25_G_1241972709750.jpg', '0', 'virtual_card', '1', '1', '0', '0', '2016-04-02 10:00:00', '100', '0', '1', '0', '1', '0', '0', '1245047546', '13', '', '-1', '-1', null, null);
INSERT INTO `zc_goods` VALUES ('26', '35', '小灵通/固话20元充值卡', '0', '1', '', '2', '0.000', '19.00', '0.00', '0', '0', '', '', '', 'images/200905/thumb_img/26_thumb_G_1241972789393.jpg', '/Uploads/images/20160403/5700dc677153e.jpg', 'images/200905/source_img/26_G_1241972789353.jpg', '0', 'virtual_card', '1', '1', '0', '0', '2016-04-02 10:00:00', '100', '0', '0', '0', '1', '0', '0', '1245047540', '1', '', '-1', '-1', null, null);
INSERT INTO `zc_goods` VALUES ('27', '35', '联通100元充值卡', '0', '1', '', '2', '0.000', '95.00', '0.00', '0', '0', '', '', '', 'images/200905/thumb_img/27_thumb_G_1241972894068.jpg', '/Uploads/images/20160403/5700dc3ee04d5.jpg', 'images/200905/source_img/27_G_1241972894069.jpg', '0', 'virtual_card', '1', '1', '0', '0', '2016-04-02 10:00:00', '100', '0', '1', '1', '1', '0', '0', '1245047557', '1', '', '-1', '-1', null, null);
INSERT INTO `zc_goods` VALUES ('28', '35', '联通50元充值卡', '0', '1', '', '0', '0.000', '45.00', '0.00', '0', '0', '', '', '', 'images/200905/thumb_img/28_thumb_G_1241972976986.jpg', '/Uploads/images/20160403/5700dc3ee04d5.jpg', 'images/200905/source_img/28_G_1241972976695.jpg', '0', 'virtual_card', '1', '1', '0', '0', '2016-04-02 10:00:00', '100', '0', '0', '0', '1', '0', '0', '1245047542', '1', '', '-1', '-1', null, null);
INSERT INTO `zc_goods` VALUES ('29', '35', '移动100元充值卡', '0', '1', '', '0', '0.000', '90.00', '0.00', '0', '0', '', '', '', 'images/200905/thumb_img/29_thumb_G_1241973022239.jpg', '/Uploads/images/20160403/5700d334ccd23.jpg', 'images/200905/source_img/29_G_1241973022514.jpg', '0', 'virtual_card', '1', '1', '0', '0', '2016-04-02 10:00:00', '100', '0', '1', '0', '1', '0', '0', '1245047543', '1', '', '-1', '-1', null, null);
INSERT INTO `zc_goods` VALUES ('30', '35', '移动20元充值卡', '1', '1', '', '9', '0.000', '18.00', '0.00', '0', '0', '', '', '', 'images/200905/thumb_img/30_thumb_G_1241973114800.jpg', '/Uploads/images/20160403/5700da4b63789.jpg', 'images/200905/source_img/30_G_1241973114587.jpg', '0', 'virtual_card', '1', '1', '0', '0', '2016-04-02 10:00:00', '100', '0', '1', '0', '1', '0', '0', '1245047549', '1', '', '-1', '-1', null, null);
INSERT INTO `zc_goods` VALUES ('31', '33', '摩托罗拉E8 ', '5', '2', '', '1', '0.000', '1337.00', '0.00', '0', '0', '直板', '', '', 'images/200905/thumb_img/31_thumb_G_1242110412996.jpg', '/Uploads/images/20160403/5700d9e974edd.jpg', 'images/200905/source_img/31_G_1242110412519.jpg', '1', '', '1', '1', '0', '13', '2016-04-02 10:00:00', '100', '0', '0', '0', '0', '0', '0', '1242140652', '2', '', '-1', '-1', null, null);
INSERT INTO `zc_goods` VALUES ('32', '32', '诺基亚N85', '9', '1', '', '4', '0.000', '3010.00', '2750.00', '1243785600', '1417276800', '2008年10月 GSM,850,900,1800,1900 黑色', '', '<p>诺基亚N85参数</p>\r\n<div>&nbsp;</div>\r\n<div>\r\n<table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n    <tbody>\r\n        <tr>\r\n            <td bgcolor=\"#f1f7fc\" colspan=\"2\">\r\n            <p><b>基本参数</b></p>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">手机昵称</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">N85</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">上市日期</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">2008年10月</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">手机类型</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">3G手机；拍照手机；智能手机</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">手机制式</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">GSM</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">支持频段</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">GSM850/900/1800/1900MHz</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">数据传输</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">GPRS、EDGE</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">屏幕材质</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">AMOLED</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">屏幕色彩</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">1600万色</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">主屏尺寸</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">2.6英寸</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">主屏参数</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">QVGA 320&times;240像素</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">铃音描述</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">可选MP3、WAV、AAC或和弦Midi铃声等格式</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">操作系统</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">Symbian OS v9.3操作系统与S60 v3.2平台的组合</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">机身内存</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">74MB 内部动态存储空间<br />\r\n            78MB 内置NAND闪存</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">存储卡</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">支持MicroSD(T-Flash)卡扩展最大至8GB</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">电池规格</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">1200毫安时锂电池</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">标配</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">诺基亚 N85<br />\r\n            诺基亚电池（BL-5K）<br />\r\n            诺基亚旅行充电器（AC-10）<br />\r\n            诺基亚视频数据线（CA-75U）<br />\r\n            诺基亚数据线（CA-101）<br />\r\n            诺基亚音乐耳机（HS-45、AD-54）<br />\r\n            诺基亚 8 GB microSD 卡（MU-43）<br />\r\n            《用户手册》<br />\r\n            《快速入门》</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">理论通话时间</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">6.9 小时</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">理论待机时间</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">363 小时</td>\r\n        </tr>\r\n        <tr>\r\n            <td bgcolor=\"#f1f7fc\" colspan=\"2\">\r\n            <p><b>产品外形</b></p>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">外观设计</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">双向滑盖</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">产品尺寸</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">103&times;50&times;16mm<br />\r\n            体积：76 立方厘米</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">手机重量</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">128克</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">产品天线</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">内置</td>\r\n        </tr>\r\n        <tr>\r\n            <td bgcolor=\"#f1f7fc\" colspan=\"2\">\r\n            <p><b>拍照功能</b></p>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"550\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\" style=\"padding: 8px 0px;\" colspan=\"2\">\r\n            <table cellspacing=\"1\" cellpadding=\"0\" border=\"0\" align=\"left\">\r\n                <tbody>\r\n                    <tr>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">定时器</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">&nbsp;</td>\r\n                    </tr>\r\n                </tbody>\r\n            </table>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">摄像头</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">内置</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">摄像头像素</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">500万像素</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">连拍功能</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">支持</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">LED闪光灯</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">双LED 闪光灯</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">数码变焦</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">20 倍数码变焦</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">拍摄模式</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">静止、连拍、自动定时器、摄像</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">照片特效</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">正常、怀旧、黑白、负片、逼真</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">拍照描述</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">支持最大2592&times;1944分辨率照片拍摄<br />\r\n            支持JPEG、Exif格式<br />\r\n            白平衡模式：自动、阳光、阴天、白炽灯、荧光灯<br />\r\n            感光度模式：高、中、低、自动</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">视频拍摄</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">最高支持640 x 480 像素（VGA）、30 帧/秒</td>\r\n        </tr>\r\n        <tr>\r\n            <td bgcolor=\"#f1f7fc\" colspan=\"2\">\r\n            <p><b>娱乐功能</b></p>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"550\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\" style=\"padding: 8px 0px;\" colspan=\"2\">\r\n            <table cellspacing=\"1\" cellpadding=\"0\" border=\"0\" align=\"left\">\r\n                <tbody>\r\n                    <tr>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">收音机</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">TV-OUT</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">录音功能</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">电子书</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">&nbsp;</td>\r\n                    </tr>\r\n                </tbody>\r\n            </table>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">视频播放</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">内置RealPlayer播放器, 支持MPEG4、H.264/AVC、H.263/3GP、RealVideo等视频格式全屏播放</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">音乐播放</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">内置播放器, 支持mp3、.wma、.aac、eAAC、eAAC+格式</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">游戏</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">内置</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">Java功能</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">支持Java MIDP 2.0 CLDC 1.1</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">Flash功能</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">第3.0版Flash lite播放器</td>\r\n        </tr>\r\n        <tr>\r\n            <td bgcolor=\"#f1f7fc\" colspan=\"2\">\r\n            <p><b>数据功能</b></p>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"550\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\" style=\"padding: 8px 0px;\" colspan=\"2\">\r\n            <table cellspacing=\"1\" cellpadding=\"0\" border=\"0\" align=\"left\">\r\n                <tbody>\r\n                    <tr>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">蓝牙功能</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">&nbsp;</td>\r\n                    </tr>\r\n                </tbody>\r\n            </table>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">数据线接口</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">USB数据线 3.5mm立体声耳机插孔</td>\r\n        </tr>\r\n        <tr>\r\n            <td bgcolor=\"#f1f7fc\" colspan=\"2\">\r\n            <p><b>基本功能</b></p>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"550\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\" style=\"padding: 8px 0px;\" colspan=\"2\">\r\n            <table cellspacing=\"1\" cellpadding=\"0\" border=\"0\" align=\"left\">\r\n                <tbody>\r\n                    <tr>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">短信(SMS)</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">彩信(MMS)</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">免提通话</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">情景模式</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">闹钟功能</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">日历功能</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">&nbsp;</td>\r\n                    </tr>\r\n                </tbody>\r\n            </table>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">输入方式</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">键盘</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">通话记录</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">未接来电+已接来电+已拨电话记录</td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"100\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\">通讯录</td>\r\n            <td width=\"450\" bgcolor=\"#ffffff\">S60标准化名片式通讯录</td>\r\n        </tr>\r\n        <tr>\r\n            <td bgcolor=\"#f1f7fc\" colspan=\"2\">\r\n            <p><b>网络功能</b></p>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"550\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\" style=\"padding: 8px 0px;\" colspan=\"2\">\r\n            <table cellspacing=\"1\" cellpadding=\"0\" border=\"0\" align=\"left\">\r\n                <tbody>\r\n                    <tr>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">电子邮件</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">WWW浏览器</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">WAP浏览器</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">&nbsp;</td>\r\n                    </tr>\r\n                </tbody>\r\n            </table>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td bgcolor=\"#f1f7fc\" colspan=\"2\">\r\n            <p><b>商务功能</b></p>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"550\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\" style=\"padding: 8px 0px;\" colspan=\"2\">\r\n            <table cellspacing=\"1\" cellpadding=\"0\" border=\"0\" align=\"left\">\r\n                <tbody>\r\n                    <tr>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">飞行模式</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">语音拨号</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">备忘录</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">日程表</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">世界时间</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">&nbsp;</td>\r\n                    </tr>\r\n                </tbody>\r\n            </table>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td bgcolor=\"#f1f7fc\" colspan=\"2\">\r\n            <p><b>其他功能</b></p>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td width=\"550\" valign=\"center\" bgcolor=\"#ffffff\" align=\"left\" style=\"padding: 8px 0px;\" colspan=\"2\">\r\n            <table cellspacing=\"1\" cellpadding=\"0\" border=\"0\" align=\"left\">\r\n                <tbody>\r\n                    <tr>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">GPS功能</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">电子词典</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">待机图片</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">计算器</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">来电铃声识别</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">来电图片识别</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">来电防火墙</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">动画屏保</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">图形菜单</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">秒表</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                    </tr>\r\n                    <tr>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\" bgcolor=\"#c5d7ed\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" bgcolor=\"#f1f7fc\" align=\"middle\" style=\"padding: 2px; font-weight: bold;\">单位换算</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                        <td width=\"100\" style=\"padding: 5px 0px 5px 10px;\">\r\n                        <table width=\"100%\" cellspacing=\"1\" cellpadding=\"0\" border=\"0\">\r\n                            <tbody>\r\n                                <tr>\r\n                                    <td width=\"100%\" align=\"middle\" style=\"padding: 2px; float: none;\">&nbsp;</td>\r\n                                </tr>\r\n                            </tbody>\r\n                        </table>\r\n                        </td>\r\n                    </tr>\r\n                </tbody>\r\n            </table>\r\n            </td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n</div>\r\n<p>&nbsp;</p>', 'images/200905/thumb_img/32_thumb_G_1242110760196.jpg', '/Uploads/Images/20160407/5706749270701.jpg', 'images/200905/source_img/32_G_1242110760437.jpg', '1', '', '1', '1', '0', '30', '2016-04-02 10:00:00', '100', '0', '0', '1', '1', '1', '0', '1269589051', '3', '', '-1', '-1', null, null);
INSERT INTO `zc_goods` VALUES ('35', '32', '诺基亚N85', '0', '2', '', '0', '0.000', '301.00', '0.00', '0', '0', '', '', '', '', '/Uploads/images/20160403/5700c5e935318.jpg', '', '1', '', '1', '1', '0', '0', '2016-04-02 10:00:00', '100', '0', '0', '0', '0', '1', '0', '0', '1', '', '-1', '-1', null, null);
INSERT INTO `zc_goods` VALUES ('36', '18', 'Galxy4', '0', '6', '', '0', '0.000', '3200.00', '0.00', '0', '0', '', '', '', '', '/Uploads/images/20160403/5700da7a0b594.jpg', '', '1', '', '1', '1', '0', '0', '2016-04-02 10:55:00', '100', '0', '0', '0', '0', '0', '0', '0', '1', '', '-1', '-1', null, null);

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
INSERT INTO `zc_goods_attribute` VALUES ('13', '2', '中文片名', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('14', '2', '英文片名', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('15', '2', '商品别名', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('16', '2', '介质/格式', '1', '0', 'HDCD\r\nDTS\r\nDVD\r\nDVD9\r\nVCD\r\nCD\r\nTAPE\r\nLP', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('17', '2', '片装数', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('18', '2', '国家地区', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('19', '2', '语种', '1', '0', '中文\r\n英文\r\n法文\r\n西班牙文', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('20', '2', '导演/指挥', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('21', '2', '主唱', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('22', '2', '所属类别', '1', '0', '古典\r\n流行\r\n摇滚\r\n乡村\r\n民谣\r\n爵士\r\n蓝调\r\n电子\r\n舞曲\r\n国乐\r\n民族\r\n怀旧\r\n经典\r\n人声\r\n合唱\r\n发烧\r\n试音\r\n儿童\r\n胎教\r\n轻音乐\r\n世界音乐\r\n庆典音乐\r\n影视音乐\r\n新世纪音乐\r\n大自然音乐', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('23', '2', '长度', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('24', '2', '歌词', '1', '0', '有\r\n无', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('25', '2', '碟片代码', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('26', '2', 'ISRC码', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('27', '2', '发行公司', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('28', '2', '出版', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('29', '2', '出版号', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('30', '2', '引进号', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('31', '2', '版权号', '0', '0', '', '0', '0', '0', '0');
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
INSERT INTO `zc_goods_attribute` VALUES ('56', '4', '网络制式', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('57', '4', '支持频率/网络频率', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('58', '4', '尺寸体积', '1', '0', '   ', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('59', '4', '外观样式/手机类型', '1', '0', '翻盖\r\n滑盖\r\n直板\r\n折叠\r\n手写', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('60', '4', '主屏参数/内屏参数', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('61', '4', '副屏参数/外屏参数', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('62', '4', '清晰度', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('63', '4', '色数/灰度', '1', '0', '   ', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('64', '4', '长度', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('65', '4', '宽度', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('66', '4', '厚度', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('67', '4', '屏幕材质', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('68', '4', '内存容量', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('69', '4', '操作系统', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('70', '4', '通话时间', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('71', '4', '待机时间', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('72', '4', '标准配置', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('73', '4', 'WAP上网', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('74', '4', '数据业务', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('75', '4', '天线位置', '1', '0', '内置\r\n外置', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('76', '4', '随机配件', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('77', '4', '铃声', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('78', '4', '摄像头', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('79', '4', '彩信/彩e', '1', '0', '支持\r\n不支持', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('80', '4', '红外/蓝牙', '0', '0', '', '0', '0', '0', '0');
INSERT INTO `zc_goods_attribute` VALUES ('81', '4', '价格等级', '1', '0', '高价机\r\n中价机\r\n低价机', '0', '0', '0', '0');
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
INSERT INTO `zc_goods_attribute` VALUES ('210', '9', '配件', '1', '2', '线控耳机\r\n蓝牙耳机\r\n数据线', '0', '0', '0', '0');
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
INSERT INTO `zc_goods_type` VALUES ('1', '书', '0', '6');
INSERT INTO `zc_goods_type` VALUES ('2', '音乐', '0', '5');
INSERT INTO `zc_goods_type` VALUES ('3', '电影', '0', '4');
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
INSERT INTO `zc_member` VALUES ('1', 'root', '0', '0000-00-00', '', '60', '19', '0', '1459130284', '2130706433', '1461432746', '1');

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
) ENGINE=MyISAM AUTO_INCREMENT=130 DEFAULT CHARSET=utf8;

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
INSERT INTO `zc_ucenter_member` VALUES ('1', 'root', '735cee945387378938100d46df1eebca', '939259192@qq.com', '', '1460179284', '2130706433', '1461432746', '2130706433', '1460179284', '1');

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
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_name` (`user_name`),
  KEY `email` (`email`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of zc_users
-- ----------------------------
INSERT INTO `zc_users` VALUES ('1', 'xinyao@521.com', 'xinyao', 'baa7a52965b99778f38ef37f235e9053', '', '', '1', '0000-00-00', '0.00', '0', '2016-04-23 17:36:56', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0', '0', '0', '18800100830', '0', null, '1');
INSERT INTO `zc_users` VALUES ('2', 'mingming@521.con', 'mingming', '7815696ecbf1c96e6894b779456d330e', '', '', '1', '0000-00-00', '0.00', '0', '2016-04-23 17:47:38', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0', '0', '0', '18551652502', '0', null, '1');
INSERT INTO `zc_users` VALUES ('3', 'xionghaizi', 'xionghaizi', 'baa7a52965b99778f38ef37f235e9053', '', '', '1', '0000-00-00', '0.00', '0', '2016-04-23 17:50:55', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0', '0', '0', '13270830860', '0', null, '1');
INSERT INTO `zc_users` VALUES ('4', 'asasas@qq.com', '', 'baa7a52965b99778f38ef37f235e9053', '', '', '1', '0000-00-00', '0.00', '0', '2016-04-23 18:00:43', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0', '0', '0', '12345678', '0', null, '1');
INSERT INTO `zc_users` VALUES ('5', 'users', 'users', '7815696ecbf1c96e6894b779456d330e', '', '', '1', '0000-00-00', '0.00', '0', '2016-04-23 18:16:42', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0', '0', '0', '15951805717', '0', null, '1');
INSERT INTO `zc_users` VALUES ('6', 'yaoming@521.com', 'yaoming', '912ec803b2ce49e4a541068d495ab570', '', '', '2', '0000-00-00', '0.00', '0', '2016-04-23 19:48:20', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0', '0', '0', '18800100830', '0', null, '1');
INSERT INTO `zc_users` VALUES ('7', 'nannantingyu@hotmai.com', 'nannantingyu', 'e99a18c428cb38d5f260853678922e03', '', '', '1', '0000-00-00', '0.00', '0', '2016-04-23 21:59:09', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0', '0', '0', '13270830860', '0', null, '1');
INSERT INTO `zc_users` VALUES ('8', 'hahaha@51.com', 'hahaha', 'e99a18c428cb38d5f260853678922e03', '', '', '1', '0000-00-00', '0.00', '0', '2016-04-23 22:14:32', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0', '0', '0', '123456', '0', null, '1');

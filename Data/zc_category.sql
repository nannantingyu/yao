/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : ecshop

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2016-04-02 18:35:46
*/

SET FOREIGN_KEY_CHECKS=0;

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
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zc_category
-- ----------------------------
INSERT INTO `zc_category` VALUES ('1', '手机类型', '', '', '0', '50', '', '', '0', '', '1', '5', '172,185,178');
INSERT INTO `zc_category` VALUES ('2', 'CDMA手机', '', '', '1', '50', '', '', '0', '', '1', '0', '6');
INSERT INTO `zc_category` VALUES ('3', 'GSM手机', '', '', '1', '50', '', '台', '1', '', '1', '4', '185,189,173,178');
INSERT INTO `zc_category` VALUES ('4', '3G手机', '', '', '1', '50', '', '', '1', '', '1', '0', '28');
INSERT INTO `zc_category` VALUES ('5', '双模手机', '', '', '1', '50', '', '', '0', '', '1', '5', '18');
INSERT INTO `zc_category` VALUES ('6', '手机配件', '', '', '0', '50', '', '', '1', '', '1', '0', '0');
INSERT INTO `zc_category` VALUES ('7', '充电器', '', '', '6', '50', '', '', '0', '', '1', '0', '0');
INSERT INTO `zc_category` VALUES ('8', '耳机', '', '', '6', '50', '', '', '0', '', '1', '0', '0');
INSERT INTO `zc_category` VALUES ('9', '电池', '', '', '6', '50', '', '', '0', '', '1', '0', '0');
INSERT INTO `zc_category` VALUES ('11', '读卡器和内存卡', '', '', '6', '50', '', '', '0', '', '1', '0', '0');
INSERT INTO `zc_category` VALUES ('12', '充值卡', '', '', '0', '50', '', '', '0', '', '1', '0', '0');
INSERT INTO `zc_category` VALUES ('13', '小灵通/固话充值卡', '', '', '12', '50', '', '', '0', '', '1', '0', '0');
INSERT INTO `zc_category` VALUES ('14', '移动手机充值卡', '', '', '12', '50', '', '', '0', '', '1', '0', '0');
INSERT INTO `zc_category` VALUES ('15', '联通手机充值卡', '', '', '12', '50', '', '', '0', '', '1', '0', '0');

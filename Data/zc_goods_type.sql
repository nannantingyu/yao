/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : ecshop

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2016-03-30 10:23:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `zc_goods_type`
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
INSERT INTO `zc_goods_type` VALUES ('1', '书', '1', '');
INSERT INTO `zc_goods_type` VALUES ('2', '音乐', '1', '');
INSERT INTO `zc_goods_type` VALUES ('3', '电影', '1', '');
INSERT INTO `zc_goods_type` VALUES ('4', '手机', '1', '');
INSERT INTO `zc_goods_type` VALUES ('5', '笔记本电脑', '1', '');
INSERT INTO `zc_goods_type` VALUES ('6', '数码相机', '1', '');
INSERT INTO `zc_goods_type` VALUES ('7', '数码摄像机', '1', '');
INSERT INTO `zc_goods_type` VALUES ('8', '化妆品', '1', '');
INSERT INTO `zc_goods_type` VALUES ('9', '精品手机', '1', '');

/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : ecshop

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2016-03-30 10:24:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `ecs_link_goods`
-- ----------------------------
DROP TABLE IF EXISTS `ecs_link_goods`;
CREATE TABLE `ecs_link_goods` (
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `link_goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `is_double` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `admin_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`goods_id`,`link_goods_id`,`admin_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecs_link_goods
-- ----------------------------
INSERT INTO `ecs_link_goods` VALUES ('12', '9', '0', '1');
INSERT INTO `ecs_link_goods` VALUES ('12', '10', '0', '1');
INSERT INTO `ecs_link_goods` VALUES ('12', '11', '0', '1');
INSERT INTO `ecs_link_goods` VALUES ('9', '13', '1', '1');
INSERT INTO `ecs_link_goods` VALUES ('13', '9', '1', '1');
INSERT INTO `ecs_link_goods` VALUES ('14', '9', '0', '1');
INSERT INTO `ecs_link_goods` VALUES ('14', '13', '0', '1');
INSERT INTO `ecs_link_goods` VALUES ('23', '9', '0', '1');
INSERT INTO `ecs_link_goods` VALUES ('13', '23', '1', '1');
INSERT INTO `ecs_link_goods` VALUES ('23', '13', '1', '1');

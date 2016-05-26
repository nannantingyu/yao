/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : yao

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2016-05-26 14:08:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `zc_visit`
-- ----------------------------
DROP TABLE IF EXISTS `zc_visit`;
CREATE TABLE `zc_visit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` datetime NOT NULL,
  `ip` varchar(16) DEFAULT NULL,
  `page` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zc_visit
-- ----------------------------
INSERT INTO `zc_visit` VALUES ('1', '2016-05-26 13:19:27', '111.202.180.2', 'http://yao.com/');
INSERT INTO `zc_visit` VALUES ('2', '2016-05-26 13:19:31', '111.202.180.2', 'http://yao.com/');

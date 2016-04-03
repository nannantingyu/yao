/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : ecshop

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2016-03-30 10:22:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `zc_goods_attr`
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
) ENGINE=MyISAM AUTO_INCREMENT=241 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zc_goods_attr
-- ----------------------------
INSERT INTO `zc_goods_attr` VALUES ('238', '1', '173', 'GSM,850,900,1800,1900', '0');
INSERT INTO `zc_goods_attr` VALUES ('237', '1', '185', '灰色', '');
INSERT INTO `zc_goods_attr` VALUES ('236', '1', '191', '支持', '0');
INSERT INTO `zc_goods_attr` VALUES ('235', '1', '190', '支持', '0');
INSERT INTO `zc_goods_attr` VALUES ('234', '1', '189', '2.4英寸', '0');
INSERT INTO `zc_goods_attr` VALUES ('233', '1', '172', '2008年04月', '0');
INSERT INTO `zc_goods_attr` VALUES ('228', '9', '178', '滑盖', '0');
INSERT INTO `zc_goods_attr` VALUES ('227', '9', '185', '白色', '0');
INSERT INTO `zc_goods_attr` VALUES ('226', '9', '185', '黑色', '10');
INSERT INTO `zc_goods_attr` VALUES ('232', '8', '178', '直板', '0');
INSERT INTO `zc_goods_attr` VALUES ('231', '8', '185', '黑色', '');
INSERT INTO `zc_goods_attr` VALUES ('230', '8', '190', '支持', '0');
INSERT INTO `zc_goods_attr` VALUES ('229', '8', '189', '1.75英寸', '0');
INSERT INTO `zc_goods_attr` VALUES ('217', '13', '185', '黑色', '');
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
INSERT INTO `zc_goods_attr` VALUES ('201', '17', '185', '黑色', '');
INSERT INTO `zc_goods_attr` VALUES ('202', '17', '173', 'CDMA', '0');
INSERT INTO `zc_goods_attr` VALUES ('203', '17', '174', '8小时', '0');
INSERT INTO `zc_goods_attr` VALUES ('204', '17', '175', '300小时', '0');
INSERT INTO `zc_goods_attr` VALUES ('205', '17', '178', '直板', '0');
INSERT INTO `zc_goods_attr` VALUES ('206', '15', '189', '2.2英寸', '0');
INSERT INTO `zc_goods_attr` VALUES ('207', '15', '185', '黑色', '');
INSERT INTO `zc_goods_attr` VALUES ('208', '15', '185', '白色', '20');
INSERT INTO `zc_goods_attr` VALUES ('209', '15', '210', '数据线', '20');
INSERT INTO `zc_goods_attr` VALUES ('196', '19', '185', '黑色', '');
INSERT INTO `zc_goods_attr` VALUES ('197', '19', '185', '金色', '10');
INSERT INTO `zc_goods_attr` VALUES ('198', '19', '185', '白色', '20');
INSERT INTO `zc_goods_attr` VALUES ('199', '19', '178', '滑盖', '0');
INSERT INTO `zc_goods_attr` VALUES ('195', '20', '173', 'GSM,900,1800,1900,2100', '0');
INSERT INTO `zc_goods_attr` VALUES ('193', '20', '172', '2008年07月', '0');
INSERT INTO `zc_goods_attr` VALUES ('194', '20', '185', '黑色', '');
INSERT INTO `zc_goods_attr` VALUES ('187', '21', '180', 'T-Flash', '0');
INSERT INTO `zc_goods_attr` VALUES ('189', '21', '210', '线控耳机', '50');
INSERT INTO `zc_goods_attr` VALUES ('188', '21', '185', '黑色', '');
INSERT INTO `zc_goods_attr` VALUES ('186', '22', '178', '直板', '0');
INSERT INTO `zc_goods_attr` VALUES ('182', '22', '185', '黑色', '');
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
INSERT INTO `zc_goods_attr` VALUES ('175', '23', '185', '黑色', '');
INSERT INTO `zc_goods_attr` VALUES ('172', '23', '182', 'Symbian OS 9.3操作系统', '0');
INSERT INTO `zc_goods_attr` VALUES ('171', '23', '181', '256MB', '0');
INSERT INTO `zc_goods_attr` VALUES ('170', '23', '172', '2008年09月', '0');
INSERT INTO `zc_goods_attr` VALUES ('169', '24', '179', 'SMS', '0');
INSERT INTO `zc_goods_attr` VALUES ('166', '24', '190', '支持', '0');
INSERT INTO `zc_goods_attr` VALUES ('167', '24', '185', '灰色', '');
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
INSERT INTO `zc_goods_attr` VALUES ('163', '32', '185', '黑色', '');
INSERT INTO `zc_goods_attr` VALUES ('239', '10', '185', '黑色', '');
INSERT INTO `zc_goods_attr` VALUES ('240', '10', '185', '白色', '');

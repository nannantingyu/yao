/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : ecshop

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2016-04-02 18:56:00
*/

SET FOREIGN_KEY_CHECKS=0;

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
INSERT INTO `zc_brand` VALUES ('1', '诺基亚', '1240803062307572427.gif', '公司网站：http://www.nokia.com.cn/\n\n客服电话：400-880-0123', 'http://www.nokia.com.cn/', '50', '1');
INSERT INTO `zc_brand` VALUES ('2', '摩托罗拉', '1240802922410634065.gif', '官方咨询电话：4008105050\n售后网点：http://www.motorola.com.cn/service/carecenter/search.asp ', 'http://www.motorola.com.cn', '50', '1');
INSERT INTO `zc_brand` VALUES ('3', '多普达', '1240803144788047486.gif', '官方咨询电话：4008201668\n售后网点：http://www.dopod.com/pc/service/searchresult2.php ', 'http://www.dopod.com ', '50', '1');
INSERT INTO `zc_brand` VALUES ('4', '飞利浦', '1240803247838195732.gif', '官方咨询电话：4008800008\n售后网点：http://www.philips.com.cn/service/mustservice/index.page ', 'http://www.philips.com.cn ', '50', '1');
INSERT INTO `zc_brand` VALUES ('5', '夏新', '1240803352280856940.gif', '官方咨询电话：4008875777\n售后网点：http://www.amobile.com.cn/service_fwyzc.asp ', 'http://www.amobile.com.cn', '50', '1');
INSERT INTO `zc_brand` VALUES ('6', '三星', '1240803412367015368.gif', '官方咨询电话：8008105858\n售后网点：http://cn.samsungmobile.com/cn/support/search_area_o.jsp ', 'http://cn.samsungmobile.com', '50', '1');
INSERT INTO `zc_brand` VALUES ('7', '索爱', '1240803482283160654.gif', '官方咨询电话：4008100000\n售后网点：http://www.sonyericsson.com/cws/common/contact?cc=cn&lc=zh ', 'http://www.sonyericsson.com.cn/', '50', '1');
INSERT INTO `zc_brand` VALUES ('8', 'LG', '1240803526904622792.gif', '官方咨询电话：4008199999\n售后网点：http://www.lg.com.cn/front.support.svccenter.retrieveCenter.laf?hrefId=9 ', 'http://cn.wowlg.com', '50', '1');
INSERT INTO `zc_brand` VALUES ('9', '联想', '1240803578417877983.gif', '官方咨询电话：4008188818\n售后网点：http://www.lenovomobile.com/service/kf-wanglou.asp', 'http://www.lenovomobile.com/', '50', '1');
INSERT INTO `zc_brand` VALUES ('10', '金立', '', '官方咨询电话：4007796666\n售后网点：http://www.gionee.net/service.asp ', 'http://www.gionee.net', '50', '1');
INSERT INTO `zc_brand` VALUES ('11', '  恒基伟业', '1240803736391383580.gif', '官方咨询电话：4008899126\n售后网点：http://www.htwchina.com/htwt/wexiu.shtml ', 'http://www.htwchina.com', '50', '1');

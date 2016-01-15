/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50511
Source Host           : localhost:3306
Source Database       : uupdatedb

Target Server Type    : MYSQL
Target Server Version : 50511
File Encoding         : 65001

Date: 2016-01-05 17:38:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `uadmin`
-- ----------------------------
DROP TABLE IF EXISTS `uadmin`;
CREATE TABLE `uadmin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(255) DEFAULT NULL,
  `permission` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uadmin
-- ----------------------------
INSERT INTO `uadmin` VALUES ('1', '9de19d2e9955fd77a752f0e4893ebe8b', '1', '2848004717@qq.com');

-- ----------------------------
-- Table structure for `uupdatelog`
-- ----------------------------
DROP TABLE IF EXISTS `uupdatelog`;
CREATE TABLE `uupdatelog` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fileName` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `userID` int(11) DEFAULT NULL,
  `userName` varchar(255) DEFAULT NULL,
  `ipAddr` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uupdatelog
-- ----------------------------
INSERT INTO `uupdatelog` VALUES ('1', 'scripts_20160104194131.zip', 'scripts', '2016-01-05 15:53:00', '3', '测试用户', null);
INSERT INTO `uupdatelog` VALUES ('2', 'scripts_20160104194131.zip', 'scripts', '2016-01-05 15:54:01', '3', '测试用户', null);
INSERT INTO `uupdatelog` VALUES ('3', 'scripts_20160104194131.zip', 'scripts', '2016-01-05 15:55:20', '3', '测试用户', null);
INSERT INTO `uupdatelog` VALUES ('4', 'scripts_20160104194131.zip', 'scripts', '2016-01-05 15:56:56', '3', '测试用户', null);
INSERT INTO `uupdatelog` VALUES ('5', 'scripts_20160104194131.zip', 'scripts', '2016-01-05 16:03:42', '3', '测试用户', null);
INSERT INTO `uupdatelog` VALUES ('6', 'scripts_20160104194131.zip', 'scripts', '2016-01-05 16:03:58', '3', '测试用户', null);
INSERT INTO `uupdatelog` VALUES ('7', 'scripts_20160104194131.zip', 'scripts', '2016-01-05 16:04:14', '3', '测试用户', null);
INSERT INTO `uupdatelog` VALUES ('8', 'scripts_20160104194131.zip', 'scripts', '2016-01-05 16:04:49', '3', '测试用户', null);
INSERT INTO `uupdatelog` VALUES ('9', 'scripts_20160104194131.zip', 'scripts', '2016-01-05 16:10:38', '3', '测试用户', null);
INSERT INTO `uupdatelog` VALUES ('10', 'scripts_20160104194131.zip', 'scripts', '2016-01-05 16:11:07', '3', '测试用户', null);
INSERT INTO `uupdatelog` VALUES ('11', 'scripts_20160104194131.zip', 'scripts', '2016-01-05 16:11:49', '3', '测试用户', null);
INSERT INTO `uupdatelog` VALUES ('12', 'scripts_20160104194131.zip', 'scripts', '2016-01-05 16:12:21', '3', '测试用户', null);
INSERT INTO `uupdatelog` VALUES ('13', 'scripts_20160104194131.zip', 'scripts', '2016-01-05 16:12:31', '3', '测试用户', null);
INSERT INTO `uupdatelog` VALUES ('14', 'scripts_20160104194131.zip', 'scripts', '2016-01-05 16:12:37', '3', '测试用户', null);
INSERT INTO `uupdatelog` VALUES ('15', 'scripts_20160104194131.zip', 'scripts', '2016-01-05 16:14:09', '3', '测试用户', null);
INSERT INTO `uupdatelog` VALUES ('16', 'scripts_20160104194131.zip', 'scripts', '2016-01-05 16:14:28', '3', '测试用户', null);
INSERT INTO `uupdatelog` VALUES ('17', 'scripts_20160104194131.zip', 'scripts', '2016-01-05 16:15:15', '3', '测试用户', null);
INSERT INTO `uupdatelog` VALUES ('18', 'tools_20160104194131.zip', 'tools', '2016-01-05 16:15:44', '3', '测试用户', null);
INSERT INTO `uupdatelog` VALUES ('19', 'andgame_20160104194148.zip', 'andgame', '2016-01-05 16:16:15', '3', '测试用户', null);
INSERT INTO `uupdatelog` VALUES ('20', 'anfeng_20160104194151.zip', 'anfeng', '2016-01-05 16:16:18', '3', '测试用户', null);
INSERT INTO `uupdatelog` VALUES ('21', 'anzhi_20160104194204.zip', 'anzhi', '2016-01-05 16:16:22', '3', '测试用户', null);
INSERT INTO `uupdatelog` VALUES ('22', 'anzhi_20160104194204.zip', 'anzhi', '2016-01-05 16:17:58', '3', '测试用户', null);
INSERT INTO `uupdatelog` VALUES ('23', 'andgame_20160104194148.zip', 'andgame', '2016-01-05 16:18:58', '3', '测试用户', null);
INSERT INTO `uupdatelog` VALUES ('24', 'scripts_20160104194131.zip', 'scripts', '2016-01-05 17:27:30', '3', '测试用户', '192.168.18.9');
INSERT INTO `uupdatelog` VALUES ('25', 'tools_20160104194131.zip', 'tools', '2016-01-05 17:28:49', '3', '测试用户', '192.168.18.9');

-- ----------------------------
-- Table structure for `uuser`
-- ----------------------------
DROP TABLE IF EXISTS `uuser`;
CREATE TABLE `uuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdTime` datetime DEFAULT NULL,
  `keyCreateTime` datetime DEFAULT NULL,
  `keyValidDay` int(11) DEFAULT NULL,
  `lastTime` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `updateDesc` varchar(255) DEFAULT NULL,
  `updateKey` varchar(255) DEFAULT NULL,
  `updateValid` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uuser
-- ----------------------------
INSERT INTO `uuser` VALUES ('3', '2016-01-05 13:41:00', '2016-01-05 13:41:00', '365', null, '测试用户', '宁波', '6b56ec8f0ef16c5d8530b93f10b96494', '1');
INSERT INTO `uuser` VALUES ('4', '2016-01-05 17:26:04', '2016-01-05 17:26:04', '365', null, '测试用户2', '测试', 'b9a5545256ad81ef040b8648cb5776c3', '1');

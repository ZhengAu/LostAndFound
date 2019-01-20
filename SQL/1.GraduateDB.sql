/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : graduatedb

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2019-01-11 11:54:49
*/

CREATE DATABASE `GraduateDB`;

use `GraduateDB`;

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `aid` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `gender` int(10) DEFAULT NULL,
  `cellphone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'root', 'root', '0', '12312312312', '12312312312@qq.com');
INSERT INTO `admin` VALUES ('2', 'admin', 'admin', '1', '12345678912', '12345678912@163.com');

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `aid` varchar(255) NOT NULL,
  `aname` varchar(255) NOT NULL,
  `datetime` date DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `findFlag` int(10) DEFAULT NULL,
  `checkFlag` int(10) DEFAULT NULL,
  `invalidFlag` int(10) DEFAULT NULL,
  `foundFlag` int(10) DEFAULT NULL,
  `info` varchar(255) DEFAULT NULL,
  `cid` varchar(255) NOT NULL,
  PRIMARY KEY (`aid`),
  KEY `fk_0001` (`cid`),
  CONSTRAINT `fk_0001` FOREIGN KEY (`cid`) REFERENCES `category` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article
-- ----------------------------

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `cid` varchar(255) NOT NULL,
  `cname` varchar(255) NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('00001', '证件');
INSERT INTO `category` VALUES ('00002', '钥匙');
INSERT INTO `category` VALUES ('00003', '卡片');
INSERT INTO `category` VALUES ('00004', '数码电子');
INSERT INTO `category` VALUES ('00005', '箱包');
INSERT INTO `category` VALUES ('00006', '日常用品');
INSERT INTO `category` VALUES ('00007', '其他');

-- ----------------------------
-- Table structure for foundarticle
-- ----------------------------
DROP TABLE IF EXISTS `foundarticle`;
CREATE TABLE `foundarticle` (
  `fid` varchar(255) NOT NULL,
  `uid` varchar(255) NOT NULL,
  `aid` varchar(255) DEFAULT NULL,
  `datetime` time DEFAULT NULL,
  `foundinfo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`fid`),
  KEY `fk_0002` (`aid`),
  KEY `fk_0003` (`uid`),
  CONSTRAINT `fk_0002` FOREIGN KEY (`aid`) REFERENCES `article` (`aid`),
  CONSTRAINT `fk_0003` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of foundarticle
-- ----------------------------

-- ----------------------------
-- Table structure for invalidarticle
-- ----------------------------
DROP TABLE IF EXISTS `invalidarticle`;
CREATE TABLE `invalidarticle` (
  `inid` varchar(255) NOT NULL,
  `aid` varchar(255) NOT NULL,
  `invalidinfo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`inid`),
  KEY `fk_0004` (`aid`),
  CONSTRAINT `fk_0004` FOREIGN KEY (`aid`) REFERENCES `article` (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of invalidarticle
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `gender` int(10) DEFAULT NULL,
  `cellphone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('2015001', '张三', '2015001', '0', '123456', '123456@qq.com');
INSERT INTO `user` VALUES ('2015002', '李四', '2015002', '0', '123789', '123789@163.com');
INSERT INTO `user` VALUES ('2015003', '思恩', '2015003', '1', '456456', '456456@qq.com');
INSERT INTO `user` VALUES ('2015004', '夏鸥', '2015004', '1', '15919159678', '1564589@qq.com');
INSERT INTO `user` VALUES ('2015005', '柳杉', '2015004', '0', '234789723', '273894798@163.com');

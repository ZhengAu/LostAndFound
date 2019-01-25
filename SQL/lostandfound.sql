/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : lostandfound

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2019-01-24 10:57:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `aid` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `detailinfo` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `checkflag` int(5) DEFAULT NULL,
  `whatflag` int(5) DEFAULT NULL,
  `foundflag` int(5) DEFAULT NULL,
  `invalidflag` int(5) DEFAULT NULL,
  `cid` int(20) DEFAULT NULL,
  `uid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`aid`),
  KEY `fk_0001` (`cid`),
  KEY `fk_0002` (`uid`),
  CONSTRAINT `fk_0001` FOREIGN KEY (`cid`) REFERENCES `category` (`cid`),
  CONSTRAINT `fk_0002` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `cid` int(20) NOT NULL AUTO_INCREMENT,
  `cname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for foundarticle
-- ----------------------------
DROP TABLE IF EXISTS `foundarticle`;
CREATE TABLE `foundarticle` (
  `foundid` int(20) NOT NULL AUTO_INCREMENT,
  `aid` varchar(255) DEFAULT NULL,
  `uid` varchar(255) DEFAULT NULL,
  `foundtime` varchar(255) DEFAULT NULL,
  `foundinfo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`foundid`),
  KEY `fk_0003` (`aid`),
  KEY `fk_0004` (`uid`),
  CONSTRAINT `fk_0003` FOREIGN KEY (`aid`) REFERENCES `article` (`aid`),
  CONSTRAINT `fk_0004` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for info
-- ----------------------------
DROP TABLE IF EXISTS `info`;
CREATE TABLE `info` (
  `infoid` int(20) NOT NULL,
  `infomation` varchar(255) NOT NULL,
  `datetime` varchar(255) DEFAULT NULL,
  `rid` int(20) DEFAULT NULL,
  PRIMARY KEY (`infoid`),
  KEY `fk_0005` (`rid`),
  CONSTRAINT `fk_0005` FOREIGN KEY (`rid`) REFERENCES `root` (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for invalidarticle
-- ----------------------------
DROP TABLE IF EXISTS `invalidarticle`;
CREATE TABLE `invalidarticle` (
  `invalidid` int(20) NOT NULL AUTO_INCREMENT,
  `aid` varchar(255) DEFAULT NULL,
  `operateflag` int(5) DEFAULT NULL,
  `operateresult` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`invalidid`),
  KEY `fk_0006` (`aid`),
  CONSTRAINT `fk_0006` FOREIGN KEY (`aid`) REFERENCES `article` (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for refusion
-- ----------------------------
DROP TABLE IF EXISTS `refusion`;
CREATE TABLE `refusion` (
  `refuseid` int(20) NOT NULL AUTO_INCREMENT,
  `aid` varchar(255) DEFAULT NULL,
  `refusetime` varchar(255) DEFAULT NULL,
  `resion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`refuseid`),
  KEY `fk_0007` (`aid`),
  CONSTRAINT `fk_0007` FOREIGN KEY (`aid`) REFERENCES `article` (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for root
-- ----------------------------
DROP TABLE IF EXISTS `root`;
CREATE TABLE `root` (
  `rid` int(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `gender` int(5) DEFAULT NULL,
  `cellphone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `realname` varchar(255) DEFAULT NULL,
  `limit` int(5) DEFAULT NULL,
  `resume` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` varchar(255) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `gender` int(5) DEFAULT NULL,
  `cellphone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `realname` varchar(255) DEFAULT NULL,
  `resume` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

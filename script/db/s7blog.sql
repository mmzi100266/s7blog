/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50529
Source Host           : localhost:3306
Source Database       : s7blog

Target Server Type    : MYSQL
Target Server Version : 50529
File Encoding         : 65001

Date: 2012-12-28 11:27:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `s7_blog`
-- ----------------------------
DROP TABLE IF EXISTS `s7_blog`;
CREATE TABLE `s7_blog` (
  `blogId` int(16) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `body` longtext NOT NULL,
  `shortBody` varchar(255) NOT NULL,
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT NULL,
  `createUser` int(16) NOT NULL,
  PRIMARY KEY (`blogId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of s7_blog
-- ----------------------------

-- ----------------------------
-- Table structure for `s7_blog_category_relation`
-- ----------------------------
DROP TABLE IF EXISTS `s7_blog_category_relation`;
CREATE TABLE `s7_blog_category_relation` (
  `blogCategoryRelationId` int(16) NOT NULL AUTO_INCREMENT,
  `ctId` int(16) NOT NULL,
  `blogId` int(16) NOT NULL,
  PRIMARY KEY (`blogCategoryRelationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of s7_blog_category_relation
-- ----------------------------

-- ----------------------------
-- Table structure for `s7_blog_params`
-- ----------------------------
DROP TABLE IF EXISTS `s7_blog_params`;
CREATE TABLE `s7_blog_params` (
  `blogParamId` int(16) NOT NULL AUTO_INCREMENT,
  `postIp` varchar(20) NOT NULL,
  `commentCount` int(16) NOT NULL,
  `blogId` int(16) NOT NULL,
  PRIMARY KEY (`blogParamId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of s7_blog_params
-- ----------------------------

-- ----------------------------
-- Table structure for `s7_category`
-- ----------------------------
DROP TABLE IF EXISTS `s7_category`;
CREATE TABLE `s7_category` (
  `ctId` int(16) NOT NULL AUTO_INCREMENT,
  `ctName` varchar(20) NOT NULL,
  PRIMARY KEY (`ctId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of s7_category
-- ----------------------------

-- ----------------------------
-- Table structure for `s7_comment`
-- ----------------------------
DROP TABLE IF EXISTS `s7_comment`;
CREATE TABLE `s7_comment` (
  `cid` int(16) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL,
  `body` varchar(100) NOT NULL,
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `belongTo` int(16) NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of s7_comment
-- ----------------------------

-- ----------------------------
-- Table structure for `s7_user`
-- ----------------------------
DROP TABLE IF EXISTS `s7_user`;
CREATE TABLE `s7_user` (
  `uid` int(16) NOT NULL AUTO_INCREMENT,
  `loginName` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL,
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of s7_user
-- ----------------------------
INSERT INTO `s7_user` VALUES ('1', 'sjc', 'sjc', '2012-12-28 10:24:55');

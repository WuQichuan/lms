/*
 Navicat Premium Data Transfer

 Source Server         : llocalhost
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : localhost
 Source Database       : lms

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : utf-8

 Date: 04/04/2019 22:00:48 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `tb_author`
-- ----------------------------
DROP TABLE IF EXISTS `tb_author`;
CREATE TABLE `tb_author` (
  `authorId` int(100) NOT NULL AUTO_INCREMENT COMMENT '作者ID',
  `authorName` varchar(255) DEFAULT NULL COMMENT '作者名称',
  `anthorSynopsis` varchar(255) DEFAULT NULL COMMENT 'authorCreateTime',
  `authorCreateTime` datetime DEFAULT NULL COMMENT '作者创建时间',
  PRIMARY KEY (`authorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='作者表';

-- ----------------------------
--  Table structure for `tb_literature`
-- ----------------------------
DROP TABLE IF EXISTS `tb_literature`;
CREATE TABLE `tb_literature` (
  `literatureId` int(100) NOT NULL AUTO_INCREMENT COMMENT '文献ID',
  `literatureTitle` varchar(200) DEFAULT NULL COMMENT '文献标题',
  `literatureTypeId` int(100) DEFAULT NULL COMMENT '文献类目id',
  `literatureAuthorId` int(100) DEFAULT NULL COMMENT '文献作者ID',
  `literatureContent` text COMMENT '文献内容',
  `literatureCreateTime` datetime DEFAULT NULL COMMENT '文献创建时间',
  `literatureStatus` int(100) DEFAULT NULL COMMENT '文献状态',
  PRIMARY KEY (`literatureId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文献表';

-- ----------------------------
--  Table structure for `tb_literatureType`
-- ----------------------------
DROP TABLE IF EXISTS `tb_literatureType`;
CREATE TABLE `tb_literatureType` (
  `typeId` int(100) NOT NULL AUTO_INCREMENT COMMENT '文献类目ID',
  `typeName` varchar(255) DEFAULT NULL COMMENT '文献类目名称',
  `typeCreateTime` datetime DEFAULT NULL COMMENT '文献类目创建时间',
  PRIMARY KEY (`typeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文献类目表';

SET FOREIGN_KEY_CHECKS = 1;

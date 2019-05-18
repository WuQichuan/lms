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

 Date: 05/18/2019 16:13:42 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `QRTZ_BLOB_TRIGGERS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
CREATE TABLE `QRTZ_BLOB_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `blob_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `QRTZ_CALENDARS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
CREATE TABLE `QRTZ_CALENDARS` (
  `sched_name` varchar(120) NOT NULL,
  `calendar_name` varchar(200) NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`,`calendar_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `QRTZ_CRON_TRIGGERS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
CREATE TABLE `QRTZ_CRON_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `cron_expression` varchar(200) NOT NULL,
  `time_zone_id` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `QRTZ_CRON_TRIGGERS`
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_CRON_TRIGGERS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai'), ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');
COMMIT;

-- ----------------------------
--  Table structure for `QRTZ_FIRED_TRIGGERS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
CREATE TABLE `QRTZ_FIRED_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL,
  `entry_id` varchar(95) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `instance_name` varchar(200) NOT NULL,
  `fired_time` bigint(13) NOT NULL,
  `sched_time` bigint(13) NOT NULL,
  `priority` int(11) NOT NULL,
  `state` varchar(16) NOT NULL,
  `job_name` varchar(200) DEFAULT NULL,
  `job_group` varchar(200) DEFAULT NULL,
  `is_nonconcurrent` varchar(1) DEFAULT NULL,
  `requests_recovery` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `QRTZ_JOB_DETAILS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
CREATE TABLE `QRTZ_JOB_DETAILS` (
  `sched_name` varchar(120) NOT NULL,
  `job_name` varchar(200) NOT NULL,
  `job_group` varchar(200) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `job_class_name` varchar(250) NOT NULL,
  `is_durable` varchar(1) NOT NULL,
  `is_nonconcurrent` varchar(1) NOT NULL,
  `is_update_data` varchar(1) NOT NULL,
  `requests_recovery` varchar(1) NOT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `QRTZ_JOB_DETAILS`
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_JOB_DETAILS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', null, 'com.ruoyi.project.monitor.job.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787001737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000c7708000000100000000174000f5441534b5f50524f5045525449455373720028636f6d2e72756f79692e70726f6a6563742e6d6f6e69746f722e6a6f622e646f6d61696e2e4a6f6200000000000000010200094c000a636f6e63757272656e747400124c6a6176612f6c616e672f537472696e673b4c000e63726f6e45787072657373696f6e71007e00094c00086a6f6247726f757071007e00094c00056a6f6249647400104c6a6176612f6c616e672f4c6f6e673b4c00076a6f624e616d6571007e00094c000a6d6574686f644e616d6571007e00094c000c6d6574686f64506172616d7371007e00094c000d6d697366697265506f6c69637971007e00094c000673746174757371007e000978720029636f6d2e72756f79692e6672616d65776f726b2e7765622e646f6d61696e2e42617365456e7469747900000000000000010200074c0008637265617465427971007e00094c000a63726561746554696d657400104c6a6176612f7574696c2f446174653b4c0006706172616d7371007e00034c000672656d61726b71007e00094c000b73656172636856616c756571007e00094c0008757064617465427971007e00094c000a75706461746554696d6571007e000c787074000561646d696e7372000e6a6176612e7574696c2e44617465686a81014b59741903000078707708000001622cde29e078707400007070707400013174000e302f3130202a202a202a202a203f740018e7b3bbe7bb9fe9bb98e8aea4efbc88e697a0e58f82efbc897372000e6a6176612e6c616e672e4c6f6e673b8be490cc8f23df0200014a000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b0200007870000000000000000174000672795461736b74000a72794e6f506172616d7374000074000133740001317800), ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', null, 'com.ruoyi.project.monitor.job.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787001737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000c7708000000100000000174000f5441534b5f50524f5045525449455373720028636f6d2e72756f79692e70726f6a6563742e6d6f6e69746f722e6a6f622e646f6d61696e2e4a6f6200000000000000010200094c000a636f6e63757272656e747400124c6a6176612f6c616e672f537472696e673b4c000e63726f6e45787072657373696f6e71007e00094c00086a6f6247726f757071007e00094c00056a6f6249647400104c6a6176612f6c616e672f4c6f6e673b4c00076a6f624e616d6571007e00094c000a6d6574686f644e616d6571007e00094c000c6d6574686f64506172616d7371007e00094c000d6d697366697265506f6c69637971007e00094c000673746174757371007e000978720029636f6d2e72756f79692e6672616d65776f726b2e7765622e646f6d61696e2e42617365456e7469747900000000000000010200074c0008637265617465427971007e00094c000a63726561746554696d657400104c6a6176612f7574696c2f446174653b4c0006706172616d7371007e00034c000672656d61726b71007e00094c000b73656172636856616c756571007e00094c0008757064617465427971007e00094c000a75706461746554696d6571007e000c787074000561646d696e7372000e6a6176612e7574696c2e44617465686a81014b59741903000078707708000001622cde29e078707400007070707400013174000e302f3230202a202a202a202a203f740018e7b3bbe7bb9fe9bb98e8aea4efbc88e69c89e58f82efbc897372000e6a6176612e6c616e672e4c6f6e673b8be490cc8f23df0200014a000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b0200007870000000000000000274000672795461736b7400087279506172616d73740002727974000133740001317800);
COMMIT;

-- ----------------------------
--  Table structure for `QRTZ_LOCKS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_LOCKS`;
CREATE TABLE `QRTZ_LOCKS` (
  `sched_name` varchar(120) NOT NULL,
  `lock_name` varchar(40) NOT NULL,
  PRIMARY KEY (`sched_name`,`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `QRTZ_LOCKS`
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_LOCKS` VALUES ('RuoyiScheduler', 'STATE_ACCESS'), ('RuoyiScheduler', 'TRIGGER_ACCESS');
COMMIT;

-- ----------------------------
--  Table structure for `QRTZ_PAUSED_TRIGGER_GRPS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `QRTZ_SCHEDULER_STATE`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
CREATE TABLE `QRTZ_SCHEDULER_STATE` (
  `sched_name` varchar(120) NOT NULL,
  `instance_name` varchar(200) NOT NULL,
  `last_checkin_time` bigint(13) NOT NULL,
  `checkin_interval` bigint(13) NOT NULL,
  PRIMARY KEY (`sched_name`,`instance_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `QRTZ_SCHEDULER_STATE`
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_SCHEDULER_STATE` VALUES ('RuoyiScheduler', 'wuqichuandeMBP1558164122689', '1558167216584', '15000');
COMMIT;

-- ----------------------------
--  Table structure for `QRTZ_SIMPLE_TRIGGERS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `repeat_count` bigint(7) NOT NULL,
  `repeat_interval` bigint(12) NOT NULL,
  `times_triggered` bigint(10) NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `QRTZ_SIMPROP_TRIGGERS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `str_prop_1` varchar(512) DEFAULT NULL,
  `str_prop_2` varchar(512) DEFAULT NULL,
  `str_prop_3` varchar(512) DEFAULT NULL,
  `int_prop_1` int(11) DEFAULT NULL,
  `int_prop_2` int(11) DEFAULT NULL,
  `long_prop_1` bigint(20) DEFAULT NULL,
  `long_prop_2` bigint(20) DEFAULT NULL,
  `dec_prop_1` decimal(13,4) DEFAULT NULL,
  `dec_prop_2` decimal(13,4) DEFAULT NULL,
  `bool_prop_1` varchar(1) DEFAULT NULL,
  `bool_prop_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `QRTZ_TRIGGERS`
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
CREATE TABLE `QRTZ_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `job_name` varchar(200) NOT NULL,
  `job_group` varchar(200) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `next_fire_time` bigint(13) DEFAULT NULL,
  `prev_fire_time` bigint(13) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `trigger_state` varchar(16) NOT NULL,
  `trigger_type` varchar(8) NOT NULL,
  `start_time` bigint(13) NOT NULL,
  `end_time` bigint(13) DEFAULT NULL,
  `calendar_name` varchar(200) DEFAULT NULL,
  `misfire_instr` smallint(2) DEFAULT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `QRTZ_JOB_DETAILS` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `QRTZ_TRIGGERS`
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_TRIGGERS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', null, '1558164130000', '-1', '5', 'PAUSED', 'CRON', '1558164122000', '0', null, '2', ''), ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', null, '1558164140000', '-1', '5', 'PAUSED', 'CRON', '1558164122000', '0', null, '2', '');
COMMIT;

-- ----------------------------
--  Table structure for `sys_config`
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(100) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='参数配置表';

-- ----------------------------
--  Records of `sys_config`
-- ----------------------------
BEGIN;
INSERT INTO `sys_config` VALUES ('1', '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'), ('2', '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '初始化密码 123456');
COMMIT;

-- ----------------------------
--  Table structure for `sys_dept`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 COMMENT='部门表';

-- ----------------------------
--  Records of `sys_dept`
-- ----------------------------
BEGIN;
INSERT INTO `sys_dept` VALUES ('100', '0', '0', '若依科技', '0', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00'), ('101', '100', '0,100', '深圳总公司', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00'), ('102', '100', '0,100', '长沙分公司', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00'), ('103', '101', '0,100,101', '研发部门', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00'), ('104', '101', '0,100,101', '市场部门', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00'), ('105', '101', '0,100,101', '测试部门', '3', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00'), ('106', '101', '0,100,101', '财务部门', '4', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00'), ('107', '101', '0,100,101', '运维部门', '5', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00'), ('108', '102', '0,100,102', '市场部门', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00'), ('109', '102', '0,100,102', '财务部门', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
COMMIT;

-- ----------------------------
--  Table structure for `sys_dict_data`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='字典数据表';

-- ----------------------------
--  Records of `sys_dict_data`
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict_data` VALUES ('1', '1', '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别男'), ('2', '2', '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别女'), ('3', '3', '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别未知'), ('4', '1', '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '显示菜单'), ('5', '2', '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '隐藏菜单'), ('6', '1', '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态'), ('7', '2', '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态'), ('8', '1', '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态'), ('9', '2', '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态'), ('10', '1', '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认是'), ('11', '2', '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认否'), ('12', '1', '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知'), ('13', '2', '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '公告'), ('14', '1', '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态'), ('15', '2', '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '关闭状态'), ('16', '1', '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '新增操作'), ('17', '2', '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '修改操作'), ('18', '3', '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '删除操作'), ('19', '4', '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '授权操作'), ('20', '5', '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导出操作'), ('21', '6', '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导入操作'), ('22', '7', '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '强退操作'), ('23', '8', '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '生成操作'), ('24', '8', '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '清空操作'), ('25', '1', '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态'), ('26', '2', '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
COMMIT;

-- ----------------------------
--  Table structure for `sys_dict_type`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='字典类型表';

-- ----------------------------
--  Records of `sys_dict_type`
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict_type` VALUES ('1', '用户性别', 'sys_user_sex', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户性别列表'), ('2', '菜单状态', 'sys_show_hide', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单状态列表'), ('3', '系统开关', 'sys_normal_disable', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统开关列表'), ('4', '任务状态', 'sys_job_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '任务状态列表'), ('5', '系统是否', 'sys_yes_no', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统是否列表'), ('6', '通知类型', 'sys_notice_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知类型列表'), ('7', '通知状态', 'sys_notice_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知状态列表'), ('8', '操作类型', 'sys_oper_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作类型列表'), ('9', '系统状态', 'sys_common_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录状态列表');
COMMIT;

-- ----------------------------
--  Table structure for `sys_job`
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT '' COMMENT '任务组名',
  `method_name` varchar(500) DEFAULT '' COMMENT '任务方法',
  `method_params` varchar(50) DEFAULT NULL COMMENT '方法参数',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='定时任务调度表';

-- ----------------------------
--  Records of `sys_job`
-- ----------------------------
BEGIN;
INSERT INTO `sys_job` VALUES ('1', 'ryTask', '系统默认（无参）', 'ryNoParams', '', '0/10 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('2', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', '0/20 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
COMMIT;

-- ----------------------------
--  Table structure for `sys_job_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `method_name` varchar(500) DEFAULT NULL COMMENT '任务方法',
  `method_params` varchar(50) DEFAULT NULL COMMENT '方法参数',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定时任务调度日志表';

-- ----------------------------
--  Table structure for `sys_logininfor`
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(50) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=188 DEFAULT CHARSET=utf8 COMMENT='系统访问记录';

-- ----------------------------
--  Records of `sys_logininfor`
-- ----------------------------
BEGIN;
INSERT INTO `sys_logininfor` VALUES ('100', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-04-04 21:24:29'), ('101', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-04-04 22:03:47'), ('102', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '1', '验证码错误', '2019-04-04 22:17:13'), ('103', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-04-04 22:17:16'), ('104', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-04-04 22:43:42'), ('105', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-04-04 23:07:09'), ('106', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-04-04 23:19:19'), ('107', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-04-04 23:21:40'), ('108', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-04-04 23:23:35'), ('109', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-04-04 23:30:03'), ('110', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-04-04 23:58:11'), ('111', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-04-05 00:04:33'), ('112', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-04-05 00:08:10'), ('113', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-04-05 01:12:53'), ('114', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-04-05 01:20:26'), ('115', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-04-05 14:01:21'), ('116', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '1', '验证码错误', '2019-04-05 14:05:13'), ('117', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '1', '验证码错误', '2019-04-05 14:05:17'), ('118', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '1', '验证码错误', '2019-04-05 14:05:22'), ('119', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-04-05 14:05:25'), ('120', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-04-05 14:20:03'), ('121', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '1', '验证码错误', '2019-04-05 14:23:01'), ('122', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-04-05 14:23:03'), ('123', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-05-01 21:49:57'), ('124', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-05-05 17:07:09'), ('125', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-05-11 12:19:32'), ('126', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-05-11 12:23:23'), ('127', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-05-11 12:31:25'), ('128', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-05-11 12:53:16'), ('129', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-05-11 12:54:51'), ('130', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '退出成功', '2019-05-11 13:01:55'), ('131', 'wuqichuan', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '1', '密码输入错误1次', '2019-05-11 13:02:06'), ('132', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-05-11 13:02:11'), ('133', 'wuqichuan', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-05-11 13:03:40'), ('134', 'wuqichuan', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '退出成功', '2019-05-11 13:03:49'), ('135', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-05-11 13:03:57'), ('136', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '退出成功', '2019-05-11 13:04:41'), ('137', 'wuqichuan', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-05-11 13:04:46'), ('138', 'wuqichuan', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '退出成功', '2019-05-11 13:05:00'), ('139', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-05-11 13:05:13'), ('140', 'wuqichuan', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-05-11 13:10:47'), ('141', 'wuqichuan', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '退出成功', '2019-05-11 13:10:56'), ('142', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-05-11 13:11:07'), ('143', 'wuqichuan', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-05-11 13:15:55'), ('144', 'wuqichuan', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '退出成功', '2019-05-11 13:16:19'), ('145', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-05-11 13:16:30'), ('146', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '退出成功', '2019-05-11 13:22:35'), ('147', 'ry', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-05-11 13:22:46'), ('148', 'wuqichuan', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-05-11 13:26:43'), ('149', 'wuqichuan', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '退出成功', '2019-05-11 13:27:06'), ('150', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-05-11 13:27:18'), ('151', 'wuqichuan', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-05-11 13:31:54'), ('152', 'wuqichuan', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-05-11 13:35:19'), ('153', 'wuqichuan', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-05-11 14:13:40'), ('154', 'wuqichuan', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-05-11 14:18:20'), ('155', 'wuqichuan', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-05-11 14:20:41'), ('156', 'wuqichuan', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-05-13 19:54:55'), ('157', 'wuqichuan', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-05-14 13:32:56'), ('158', 'wuqichuan', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-05-15 12:57:48'), ('159', 'wuqichuan', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '退出成功', '2019-05-15 12:57:52'), ('160', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-05-15 12:58:00'), ('161', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '退出成功', '2019-05-15 12:58:32'), ('162', 'wuqichuan', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-05-15 12:58:37'), ('163', 'wuqichuan', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-05-15 13:05:45'), ('164', 'wuqichuan', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '退出成功', '2019-05-15 13:07:32'), ('165', 'wuqichuan', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-05-15 13:07:35'), ('166', 'wuqichuan', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '退出成功', '2019-05-15 13:07:38'), ('167', 'test', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '1', '用户不存在/密码错误', '2019-05-15 13:07:48'), ('168', 'test', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '1', '用户已封禁，请联系管理员', '2019-05-15 13:07:56'), ('169', 'wuqichuan', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-05-15 13:11:44'), ('170', 'wuqichuan', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '退出成功', '2019-05-15 13:12:27'), ('171', 'demo', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '1', '验证码错误', '2019-05-15 13:12:36'), ('172', 'demo', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '1', '验证码错误', '2019-05-15 13:12:43'), ('173', 'demo', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-05-15 13:12:46'), ('174', 'wuqichuan', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-05-15 13:20:23'), ('175', 'wuqichuan', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '退出成功', '2019-05-15 13:20:56'), ('176', 'wuqichuan2', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '1', '验证码错误', '2019-05-15 13:21:05'), ('177', 'wuqichuan2', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '1', '密码输入错误1次', '2019-05-15 13:21:08'), ('178', 'wuqichuan2', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-05-15 13:21:19'), ('179', 'wuqichuan', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-05-15 13:28:35'), ('180', 'wuqichuan', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '退出成功', '2019-05-15 13:29:18'), ('181', 'wuqichuan2', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-05-15 13:29:24'), ('182', 'wuqichuan', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '1', '验证码错误', '2019-05-18 15:10:54'), ('183', 'wuqichuan', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-05-18 15:10:57'), ('184', 'wuqichuan', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-05-18 15:14:21'), ('185', 'wuqichuan', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '退出成功', '2019-05-18 15:19:33'), ('186', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-05-18 15:19:43'), ('187', 'wuqichuan', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-05-18 15:22:18');
COMMIT;

-- ----------------------------
--  Table structure for `sys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `url` varchar(200) DEFAULT '#' COMMENT '请求地址',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2005 DEFAULT CHARSET=utf8 COMMENT='菜单权限表';

-- ----------------------------
--  Records of `sys_menu`
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` VALUES ('1', '系统管理', '0', '1', '#', 'M', '0', '', 'fa fa-gear', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统管理目录'), ('2', '系统监控', '0', '2', '#', 'M', '1', '', 'fa fa-video-camera', 'admin', '2018-03-16 11:33:00', 'admin', '2019-05-11 12:57:50', '系统监控目录'), ('3', '系统工具', '0', '3', '#', 'M', '1', '', 'fa fa-bars', 'admin', '2018-03-16 11:33:00', 'admin', '2019-05-11 12:58:30', '系统工具目录'), ('100', '用户管理', '1', '1', '/system/user', 'C', '0', 'system:user:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户管理菜单'), ('101', '角色管理', '1', '2', '/system/role', 'C', '0', 'system:role:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '角色管理菜单'), ('102', '菜单管理', '1', '3', '/system/menu', 'C', '0', 'system:menu:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单管理菜单'), ('103', '部门管理', '1', '4', '/system/dept', 'C', '0', 'system:dept:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2019-05-11 13:16:43', '部门管理菜单'), ('104', '岗位管理', '1', '5', '/system/post', 'C', '1', 'system:post:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2019-05-11 12:59:42', '岗位管理菜单'), ('105', '字典管理', '1', '6', '/system/dict', 'C', '1', 'system:dict:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2019-05-11 12:59:52', '字典管理菜单'), ('106', '参数设置', '1', '7', '/system/config', 'C', '1', 'system:config:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2019-05-11 13:00:00', '参数设置菜单'), ('107', '通知公告', '1', '8', '/system/notice', 'C', '1', 'system:notice:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2019-05-11 13:00:18', '通知公告菜单'), ('108', '日志管理', '1', '9', '#', 'M', '1', '', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2019-05-11 13:00:32', '日志管理菜单'), ('109', '在线用户', '2', '1', '/monitor/online', 'C', '0', 'monitor:online:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '在线用户菜单'), ('110', '定时任务', '2', '2', '/monitor/job', 'C', '0', 'monitor:job:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '定时任务菜单'), ('111', '数据监控', '2', '3', '/monitor/data', 'C', '0', 'monitor:data:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '数据监控菜单'), ('112', '服务监控', '2', '3', '/monitor/server', 'C', '0', 'monitor:server:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '服务监控菜单'), ('113', '表单构建', '3', '1', '/tool/build', 'C', '0', 'tool:build:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '表单构建菜单'), ('114', '代码生成', '3', '2', '/tool/gen', 'C', '0', 'tool:gen:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '代码生成菜单'), ('115', '系统接口', '3', '3', '/tool/swagger', 'C', '0', 'tool:swagger:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统接口菜单'), ('500', '操作日志', '108', '1', '/monitor/operlog', 'C', '0', 'monitor:operlog:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作日志菜单'), ('501', '登录日志', '108', '2', '/monitor/logininfor', 'C', '0', 'monitor:logininfor:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录日志菜单'), ('1000', '用户查询', '100', '1', '#', 'F', '0', 'system:user:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1001', '用户新增', '100', '2', '#', 'F', '0', 'system:user:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1002', '用户修改', '100', '3', '#', 'F', '0', 'system:user:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1003', '用户删除', '100', '4', '#', 'F', '0', 'system:user:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1004', '用户导出', '100', '5', '#', 'F', '0', 'system:user:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1005', '用户导入', '100', '6', '#', 'F', '0', 'system:user:import', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1006', '重置密码', '100', '7', '#', 'F', '0', 'system:user:resetPwd', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1007', '角色查询', '101', '1', '#', 'F', '0', 'system:role:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1008', '角色新增', '101', '2', '#', 'F', '0', 'system:role:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1009', '角色修改', '101', '3', '#', 'F', '0', 'system:role:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1010', '角色删除', '101', '4', '#', 'F', '0', 'system:role:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1011', '角色导出', '101', '5', '#', 'F', '0', 'system:role:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1012', '菜单查询', '102', '1', '#', 'F', '0', 'system:menu:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1013', '菜单新增', '102', '2', '#', 'F', '0', 'system:menu:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1014', '菜单修改', '102', '3', '#', 'F', '0', 'system:menu:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1015', '菜单删除', '102', '4', '#', 'F', '0', 'system:menu:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1016', '部门查询', '103', '1', '#', 'F', '0', 'system:dept:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1017', '部门新增', '103', '2', '#', 'F', '0', 'system:dept:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1018', '部门修改', '103', '3', '#', 'F', '0', 'system:dept:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1019', '部门删除', '103', '4', '#', 'F', '0', 'system:dept:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1020', '岗位查询', '104', '1', '#', 'F', '0', 'system:post:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1021', '岗位新增', '104', '2', '#', 'F', '0', 'system:post:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1022', '岗位修改', '104', '3', '#', 'F', '0', 'system:post:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1023', '岗位删除', '104', '4', '#', 'F', '0', 'system:post:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1024', '岗位导出', '104', '5', '#', 'F', '0', 'system:post:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1025', '字典查询', '105', '1', '#', 'F', '0', 'system:dict:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1026', '字典新增', '105', '2', '#', 'F', '0', 'system:dict:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1027', '字典修改', '105', '3', '#', 'F', '0', 'system:dict:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1028', '字典删除', '105', '4', '#', 'F', '0', 'system:dict:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1029', '字典导出', '105', '5', '#', 'F', '0', 'system:dict:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1030', '参数查询', '106', '1', '#', 'F', '0', 'system:config:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1031', '参数新增', '106', '2', '#', 'F', '0', 'system:config:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1032', '参数修改', '106', '3', '#', 'F', '0', 'system:config:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1033', '参数删除', '106', '4', '#', 'F', '0', 'system:config:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1034', '参数导出', '106', '5', '#', 'F', '0', 'system:config:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1035', '公告查询', '107', '1', '#', 'F', '0', 'system:notice:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1036', '公告新增', '107', '2', '#', 'F', '0', 'system:notice:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1037', '公告修改', '107', '3', '#', 'F', '0', 'system:notice:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1038', '公告删除', '107', '4', '#', 'F', '0', 'system:notice:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1039', '操作查询', '500', '1', '#', 'F', '0', 'monitor:operlog:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1040', '操作删除', '500', '2', '#', 'F', '0', 'monitor:operlog:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1041', '详细信息', '500', '3', '#', 'F', '0', 'monitor:operlog:detail', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1042', '日志导出', '500', '4', '#', 'F', '0', 'monitor:operlog:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1043', '登录查询', '501', '1', '#', 'F', '0', 'monitor:logininfor:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1044', '登录删除', '501', '2', '#', 'F', '0', 'monitor:logininfor:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1045', '日志导出', '501', '3', '#', 'F', '0', 'monitor:logininfor:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1046', '在线查询', '109', '1', '#', 'F', '0', 'monitor:online:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1047', '批量强退', '109', '2', '#', 'F', '0', 'monitor:online:batchForceLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1048', '单条强退', '109', '3', '#', 'F', '0', 'monitor:online:forceLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1049', '任务查询', '110', '1', '#', 'F', '0', 'monitor:job:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1050', '任务新增', '110', '2', '#', 'F', '0', 'monitor:job:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1051', '任务修改', '110', '3', '#', 'F', '0', 'monitor:job:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1052', '任务删除', '110', '4', '#', 'F', '0', 'monitor:job:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1053', '状态修改', '110', '5', '#', 'F', '0', 'monitor:job:changeStatus', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1054', '任务详细', '110', '6', '#', 'F', '0', 'monitor:job:detail', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1055', '任务导出', '110', '7', '#', 'F', '0', 'monitor:job:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1056', '生成查询', '114', '1', '#', 'F', '0', 'tool:gen:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1057', '生成代码', '114', '2', '#', 'F', '0', 'tool:gen:code', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('2000', '文献管理系统', '0', '0', '#', 'M', '0', null, 'fa fa-sticky-note', 'admin', '2019-04-04 22:38:53', '', null, ''), ('2001', '文献管理', '2000', '0', '/lms/literature', 'C', '0', 'lms:literature:view', '#', 'admin', '2019-04-04 22:52:14', 'admin', '2019-04-04 23:10:58', ''), ('2003', '文献类目管理', '2000', '1', '/lms/literaturetype', 'C', '0', 'lms:literaturetype:view', '#', 'admin', '2019-04-04 23:34:18', '', null, ''), ('2004', '文献作者管理', '2000', '2', '/lms/author', 'C', '0', 'lms:author:view', '#', 'admin', '2019-04-04 23:35:02', '', null, '');
COMMIT;

-- ----------------------------
--  Table structure for `sys_notice`
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(2000) DEFAULT NULL COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='通知公告表';

-- ----------------------------
--  Records of `sys_notice`
-- ----------------------------
BEGIN;
INSERT INTO `sys_notice` VALUES ('1', '温馨提醒：2018-07-01 若依新版本发布啦', '2', '新版本内容', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');
COMMIT;

-- ----------------------------
--  Table structure for `sys_oper_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `operator_type` int(1) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `status` int(1) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=218 DEFAULT CHARSET=utf8 COMMENT='操作日志记录';

-- ----------------------------
--  Records of `sys_oper_log`
-- ----------------------------
BEGIN;
INSERT INTO `sys_oper_log` VALUES ('100', '代码生成', '8', 'com.ruoyi.project.tool.gen.controller.GenController.batchGenCode()', '1', 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"tb_author,tb_literatureType,tb_literature\"]}', '0', null, '2019-04-04 22:04:01'), ('101', '代码生成', '8', 'com.ruoyi.project.tool.gen.controller.GenController.batchGenCode()', '1', 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"tb_author,tb_literatureType,tb_literature\"]}', '0', null, '2019-04-04 22:33:39'), ('102', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"文献管理系统\"],\"url\":[\"\"],\"perms\":[\"\"],\"orderNum\":[\"0\"],\"icon\":[\"fa fa-sticky-note\"],\"visible\":[\"0\"]}', '0', null, '2019-04-04 22:38:53'), ('103', '代码生成', '8', 'com.ruoyi.project.tool.gen.controller.GenController.batchGenCode()', '1', 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"tb_author,tb_literatureType,tb_literature\"]}', '0', null, '2019-04-04 22:43:52'), ('104', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"文献管理\"],\"url\":[\"/lms/literature\"],\"perms\":[\"\"],\"orderNum\":[\"0\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-04-04 22:52:14'), ('105', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2001\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"文献管理\"],\"url\":[\"/lms/literature\"],\"perms\":[\"lms:literature:view\"],\"orderNum\":[\"0\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-04-04 22:53:48'), ('106', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2001\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"文献管理\"],\"url\":[\"/lms/literature\"],\"perms\":[\"lms:literature:view\"],\"orderNum\":[\"0\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-04-04 23:10:58'), ('107', '角色管理', '2', 'com.ruoyi.project.system.role.controller.RoleController.authDataScopeSave()', '1', 'admin', '研发部门', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\"roleId\":[\"1\"],\"roleName\":[\"管理员\"],\"roleKey\":[\"admin\"],\"dataScope\":[\"1\"],\"deptIds\":[\"\"]}', '0', null, '2019-04-04 23:13:36'), ('108', '文献', '1', 'com.ruoyi.project.system.literature.controller.LiteratureController.addSave()', '1', 'admin', '研发部门', '/lms/literature/add', '127.0.0.1', '内网IP', '{\"literatureTitle\":[\"测试文献\"],\"literatureTypeId\":[\"2\"],\"literatureAuthorId\":[\"1\"],\"literatureContent\":[\"我爱你我爱你我爱你\"],\"literatureCreateTime\":[\"\"],\"literatureStatus\":[\"1\"]}', '0', null, '2019-04-04 23:30:38'), ('109', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"文献类目管理\"],\"url\":[\"/lms/literaturetype\"],\"perms\":[\"lms:literaturetype:view\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-04-04 23:33:24'), ('110', '菜单管理', '3', 'com.ruoyi.project.system.menu.controller.MenuController.remove()', '1', 'admin', '研发部门', '/system/menu/remove/2002', '127.0.0.1', '内网IP', '{}', '0', null, '2019-04-04 23:33:49'), ('111', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"文献类目管理\"],\"url\":[\"/lms/literaturetype\"],\"perms\":[\"lms:literaturetype:view\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-04-04 23:34:18'), ('112', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"文献作者管理\"],\"url\":[\"/lms/author\"],\"perms\":[\"lms:author:view\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-04-04 23:35:02'), ('113', '文献', '1', 'com.ruoyi.project.system.literature.controller.LiteratureController.addSave()', '1', 'admin', '研发部门', '/lms/literature/add', '127.0.0.1', '内网IP', '{\"literatureTitle\":[\"测试文献2\"],\"literatureTypeId\":[\"1\"],\"literatureAuthorId\":[\"1\"],\"literatureContent\":[\"测试文献2\"],\"literatureCreateTime\":[\"2019-04-03\"],\"literatureStatus\":[\"1\"]}', '0', null, '2019-04-05 14:02:09'), ('114', '作者', '1', 'com.ruoyi.project.system.author.controller.AuthorController.addSave()', '1', 'admin', '研发部门', '/lms/author/add', '127.0.0.1', '内网IP', '{\"authorName\":[\"张三\"],\"anthorSynopsis\":[\"测试\"],\"authorCreateTime\":[\"\"]}', '0', null, '2019-04-05 14:07:26'), ('115', '作者', '1', 'com.ruoyi.project.system.author.controller.AuthorController.addSave()', '1', 'admin', '研发部门', '/lms/author/add', '127.0.0.1', '内网IP', '{\"authorName\":[\"李四\"],\"anthorSynopsis\":[\"测试\"],\"authorCreateTime\":[\"\"]}', '0', null, '2019-04-05 14:07:37'), ('116', '文献', '1', 'com.ruoyi.project.system.literature.controller.LiteratureController.addSave()', '1', 'admin', '研发部门', '/lms/literature/add', '127.0.0.1', '内网IP', '{\"literatureTitle\":[\"计算机测试\"],\"literatureTypeId\":[\"2\"],\"literatureAuthorId\":[\"2\"],\"literatureContent\":[\"测试测试\"],\"literatureCreateTime\":[\"2019-04-05\"],\"literatureStatus\":[\"2\"]}', '0', null, '2019-04-05 14:23:33'), ('117', '文献类目', '3', 'com.ruoyi.project.system.literaturetype.controller.LiteraturetypeController.remove()', '1', 'admin', '研发部门', '/lms/literaturetype/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"2\"]}', '0', null, '2019-05-11 12:19:43'), ('118', '文献', '1', 'com.ruoyi.project.system.literature.controller.LiteratureController.addSave()', '1', 'admin', '研发部门', '/lms/literature/add', '127.0.0.1', '内网IP', '{\"literatureTitle\":[\"111111\"],\"literatureTypeId\":[\"3\"],\"literatureAuthorId\":[\"1\"],\"literatureContent\":[\"11111\"],\"literatureCreateTime\":[\"2019-05-11\"],\"literatureStatus\":[\"111\"]}', '0', null, '2019-05-11 12:23:51'), ('119', '文献', '2', 'com.ruoyi.project.system.literature.controller.LiteratureController.editSave()', '1', 'admin', '研发部门', '/lms/literature/edit', '127.0.0.1', '内网IP', '{\"literatureId\":[\"4\"],\"literatureTitle\":[\"111111\"],\"literatureContent\":[\"222222\"],\"literatureCreateTime\":[\"Sat May 11 00:00:00 CST 2019\"],\"literatureStatus\":[\"111\"]}', '0', null, '2019-05-11 12:23:57'), ('120', '文献', '2', 'com.ruoyi.project.system.literature.controller.LiteratureController.editSave()', '1', 'admin', '研发部门', '/lms/literature/edit', '127.0.0.1', '内网IP', '{\"literatureId\":[\"1\"],\"literatureTitle\":[\"测试文献\"],\"literatureContent\":[\"我爱你我爱你我爱你11111\"],\"literatureCreateTime\":[\"Thu Apr 04 23:43:13 CST 2019\"],\"literatureStatus\":[\"1\"]}', '0', null, '2019-05-11 12:31:45'), ('121', '文献类目', '3', 'com.ruoyi.project.system.literaturetype.controller.LiteraturetypeController.remove()', '1', 'admin', '研发部门', '/lms/literaturetype/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"7\"]}', '0', null, '2019-05-11 12:32:04'), ('122', '文献类目', '3', 'com.ruoyi.project.system.literaturetype.controller.LiteraturetypeController.remove()', '1', 'admin', '研发部门', '/lms/literaturetype/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"2\"]}', '0', null, '2019-05-11 12:32:06'), ('123', '文献类目', '3', 'com.ruoyi.project.system.literaturetype.controller.LiteraturetypeController.remove()', '1', 'admin', '研发部门', '/lms/literaturetype/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"2\"]}', '0', null, '2019-05-11 12:32:10'), ('124', '作者', '3', 'com.ruoyi.project.system.author.controller.AuthorController.remove()', '1', 'admin', '研发部门', '/lms/author/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"1\"]}', '0', null, '2019-05-11 12:53:24'), ('125', '作者', '3', 'com.ruoyi.project.system.author.controller.AuthorController.remove()', '1', 'admin', '研发部门', '/lms/author/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"3\"]}', '0', null, '2019-05-11 12:53:26'), ('126', '作者', '2', 'com.ruoyi.project.system.author.controller.AuthorController.editSave()', '1', 'admin', '研发部门', '/lms/author/edit', '127.0.0.1', '内网IP', '{\"authorId\":[\"1\"],\"authorName\":[\"武琦川\"],\"anthorSynopsis\":[\"15级软件三班11\"],\"authorCreateTime\":[\"Thu Apr 04 23:41:28 CST 2019\"]}', '0', null, '2019-05-11 12:55:00'), ('127', '作者', '2', 'com.ruoyi.project.system.author.controller.AuthorController.editSave()', '1', 'admin', '研发部门', '/lms/author/edit', '127.0.0.1', '内网IP', '{\"authorId\":[\"2\"],\"authorName\":[\"张三\"],\"anthorSynopsis\":[\"测试\"],\"authorCreateTime\":[\"2019-05-11\"]}', '0', null, '2019-05-11 12:55:05'), ('128', '用户管理', '1', 'com.ruoyi.project.system.user.controller.UserController.addSave()', '1', 'admin', '研发部门', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"103\"],\"userName\":[\"武琦川\"],\"deptName\":[\"研发部门\"],\"phonenumber\":[\"15663583031\"],\"email\":[\"1062112233@qq.com\"],\"loginName\":[\"wuqichuan\"],\"password\":[\"wuqichuan\"],\"sex\":[\"0\"],\"role\":[\"2\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"\"]}', '0', null, '2019-05-11 12:56:18'), ('129', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"系统监控\"],\"url\":[\"#\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"fa fa-video-camera\"],\"visible\":[\"1\"]}', '0', null, '2019-05-11 12:57:50'), ('130', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"3\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"系统工具\"],\"url\":[\"#\"],\"perms\":[\"\"],\"orderNum\":[\"3\"],\"icon\":[\"fa fa-bars\"],\"visible\":[\"1\"]}', '0', null, '2019-05-11 12:58:30'), ('131', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"103\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"部门管理\"],\"url\":[\"/system/dept\"],\"perms\":[\"system:dept:view\"],\"orderNum\":[\"4\"],\"icon\":[\"#\"],\"visible\":[\"1\"]}', '0', null, '2019-05-11 12:59:31'), ('132', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"104\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"岗位管理\"],\"url\":[\"/system/post\"],\"perms\":[\"system:post:view\"],\"orderNum\":[\"5\"],\"icon\":[\"#\"],\"visible\":[\"1\"]}', '0', null, '2019-05-11 12:59:42'), ('133', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"105\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"字典管理\"],\"url\":[\"/system/dict\"],\"perms\":[\"system:dict:view\"],\"orderNum\":[\"6\"],\"icon\":[\"#\"],\"visible\":[\"1\"]}', '0', null, '2019-05-11 12:59:52'), ('134', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"106\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"参数设置\"],\"url\":[\"/system/config\"],\"perms\":[\"system:config:view\"],\"orderNum\":[\"7\"],\"icon\":[\"#\"],\"visible\":[\"1\"]}', '0', null, '2019-05-11 13:00:00'), ('135', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"107\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"通知公告\"],\"url\":[\"/system/notice\"],\"perms\":[\"system:notice:view\"],\"orderNum\":[\"8\"],\"icon\":[\"#\"],\"visible\":[\"1\"]}', '0', null, '2019-05-11 13:00:18'), ('136', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"108\"],\"parentId\":[\"1\"],\"menuType\":[\"M\"],\"menuName\":[\"日志管理\"],\"url\":[\"#\"],\"perms\":[\"\"],\"orderNum\":[\"9\"],\"icon\":[\"#\"],\"visible\":[\"1\"]}', '0', null, '2019-05-11 13:00:32'), ('137', '角色管理', '2', 'com.ruoyi.project.system.role.controller.RoleController.editSave()', '1', 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通角色\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"2000,2001,2003,2004\"]}', '0', null, '2019-05-11 13:01:51'), ('138', '重置密码', '2', 'com.ruoyi.project.system.user.controller.UserController.resetPwd()', '1', 'admin', '研发部门', '/system/user/resetPwd/3', '127.0.0.1', '内网IP', '{}', '0', null, '2019-05-11 13:02:35'), ('139', '重置密码', '2', 'com.ruoyi.project.system.user.controller.UserController.resetPwd()', '1', 'admin', '研发部门', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"userId\":[\"3\"],\"loginName\":[\"wuqichuan\"],\"password\":[\"wuqichuan\"]}', '0', null, '2019-05-11 13:02:42'), ('140', '角色管理', '2', 'com.ruoyi.project.system.role.controller.RoleController.authDataScopeSave()', '1', 'admin', '研发部门', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通角色\"],\"roleKey\":[\"common\"],\"dataScope\":[\"2\"],\"deptIds\":[\"100,101,103,104,105,106,107,102,108,109\"]}', '0', null, '2019-05-11 13:04:12'), ('141', '角色管理', '2', 'com.ruoyi.project.system.role.controller.RoleController.editSave()', '1', 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通角色\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"2000,2001,2003,2004\"]}', '0', null, '2019-05-11 13:04:27'), ('142', '角色管理', '2', 'com.ruoyi.project.system.role.controller.RoleController.authDataScopeSave()', '1', 'admin', '研发部门', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通角色\"],\"roleKey\":[\"common\"],\"dataScope\":[\"1\"],\"deptIds\":[\"\"]}', '0', null, '2019-05-11 13:04:39'), ('143', '角色管理', '2', 'com.ruoyi.project.system.role.controller.RoleController.authDataScopeSave()', '1', 'admin', '研发部门', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通角色\"],\"roleKey\":[\"common\"],\"dataScope\":[\"1\"],\"deptIds\":[\"\"]}', '0', null, '2019-05-11 13:05:21'), ('144', '角色管理', '2', 'com.ruoyi.project.system.role.controller.RoleController.authDataScopeSave()', '1', 'admin', '研发部门', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通角色\"],\"roleKey\":[\"common\"],\"dataScope\":[\"1\"],\"deptIds\":[\"\"]}', '0', null, '2019-05-11 13:11:22'), ('145', '角色管理', '2', 'com.ruoyi.project.system.role.controller.RoleController.authDataScopeSave()', '1', 'admin', '研发部门', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\"roleId\":[\"1\"],\"roleName\":[\"管理员\"],\"roleKey\":[\"admin\"],\"dataScope\":[\"1\"],\"deptIds\":[\"\"]}', '0', null, '2019-05-11 13:11:27'), ('146', '用户管理', '2', 'com.ruoyi.project.system.user.controller.UserController.editSave()', '1', 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"3\"],\"deptId\":[\"103\"],\"userName\":[\"武琦川\"],\"dept.deptName\":[\"研发部门\"],\"phonenumber\":[\"15663583031\"],\"email\":[\"1062112233@qq.com\"],\"loginName\":[\"wuqichuan\"],\"sex\":[\"0\"],\"role\":[\"2\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"\"]}', '0', null, '2019-05-11 13:11:43'), ('147', '文献', '2', 'com.ruoyi.project.system.literature.controller.LiteratureController.editSave()', '1', 'admin', '研发部门', '/lms/literature/edit', '127.0.0.1', '内网IP', '{\"literatureId\":[\"1\"],\"literatureTitle\":[\"测试文献\"],\"literatureContent\":[\"我爱你我爱你我爱你11111\"],\"literatureCreateTime\":[\"Thu Apr 04 23:43:13 CST 2019\"],\"literatureStatus\":[\"1\"]}', '0', null, '2019-05-11 13:11:58'), ('148', '文献', '2', 'com.ruoyi.project.system.literature.controller.LiteratureController.editSave()', '1', 'admin', '研发部门', '/lms/literature/edit', '127.0.0.1', '内网IP', '{\"literatureId\":[\"1\"],\"literatureTitle\":[\"测试文献\"],\"literatureContent\":[\"我爱你我爱你我爱你11111\"],\"literatureCreateTime\":[\"Thu Apr 04 23:43:13 CST 2019\"],\"literatureStatus\":[\"1\"]}', '0', null, '2019-05-11 13:12:03'), ('149', '文献', '2', 'com.ruoyi.project.system.literature.controller.LiteratureController.editSave()', '1', 'admin', '研发部门', '/lms/literature/edit', '127.0.0.1', '内网IP', '{\"literatureId\":[\"1\"],\"literatureTitle\":[\"测试文献\"],\"literatureContent\":[\"\"],\"literatureCreateTime\":[\"Thu Apr 04 23:43:13 CST 2019\"],\"literatureStatus\":[\"1\"]}', '0', null, '2019-05-11 13:12:13'), ('150', '文献', '1', 'com.ruoyi.project.system.literature.controller.LiteratureController.addSave()', '1', 'admin', '研发部门', '/lms/literature/add', '127.0.0.1', '内网IP', '{\"literatureTitle\":[\"\"],\"literatureContent\":[\"\"],\"literatureCreateTime\":[\"\"],\"literatureStatus\":[\"\"]}', '0', null, '2019-05-11 13:12:27'), ('151', '文献', '1', 'com.ruoyi.project.system.literature.controller.LiteratureController.addSave()', '1', 'admin', '研发部门', '/lms/literature/add', '127.0.0.1', '内网IP', '{\"literatureTitle\":[\"\"],\"literatureContent\":[\"\"],\"literatureCreateTime\":[\"\"],\"literatureStatus\":[\"\"]}', '0', null, '2019-05-11 13:12:30'), ('152', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"103\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"部门管理\"],\"url\":[\"/system/dept\"],\"perms\":[\"system:dept:view\"],\"orderNum\":[\"4\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-05-11 13:16:43'), ('153', '文献', '2', 'com.ruoyi.project.system.literature.controller.LiteratureController.editSave()', '1', 'admin', '研发部门', '/lms/literature/edit', '127.0.0.1', '内网IP', '{\"literatureId\":[\"1\"],\"literatureTitle\":[\"测试文献\"],\"literatureContent\":[\"我爱你我爱你我爱你11111\"],\"literatureCreateTime\":[\"Thu Apr 04 23:43:13 CST 2019\"],\"literatureStatus\":[\"1\"]}', '0', null, '2019-05-11 13:17:28'), ('154', '角色管理', '2', 'com.ruoyi.project.system.role.controller.RoleController.editSave()', '1', 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"1\"],\"roleName\":[\"管理员\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"管理员\"],\"menuIds\":[\"2000,2001,2003,2004,1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,1055,111,112,3,113,114,1056,1057,115\"]}', '0', null, '2019-05-11 13:18:59'), ('155', '角色管理', '2', 'com.ruoyi.project.system.role.controller.RoleController.editSave()', '1', 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通角色\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"2000,2001,2003,2004\"]}', '0', null, '2019-05-11 13:19:08'), ('156', '重置密码', '2', 'com.ruoyi.project.system.user.controller.UserController.resetPwd()', '1', 'admin', '研发部门', '/system/user/resetPwd/2', '127.0.0.1', '内网IP', '{}', '0', null, '2019-05-11 13:22:13'), ('157', '重置密码', '2', 'com.ruoyi.project.system.user.controller.UserController.resetPwd()', '1', 'admin', '研发部门', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"userId\":[\"2\"],\"loginName\":[\"ry\"],\"password\":[\"12345\"]}', '0', null, '2019-05-11 13:22:23'), ('158', '用户管理', '2', 'com.ruoyi.project.system.user.controller.UserController.editSave()', '1', 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"2\"],\"deptId\":[\"105\"],\"userName\":[\"若依\"],\"dept.deptName\":[\"测试部门\"],\"phonenumber\":[\"15666666666\"],\"email\":[\"ry@qq.com\"],\"loginName\":[\"ry\"],\"sex\":[\"1\"],\"role\":[\"2\"],\"remark\":[\"测试员\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"2\"]}', '0', null, '2019-05-11 13:22:29'), ('159', '文献', '1', 'com.ruoyi.project.system.literature.controller.LiteratureController.addSave()', '1', 'wuqichuan', '研发部门', '/lms/literature/add', '127.0.0.1', '内网IP', '{\"literatureTitle\":[\"222\"],\"literatureTypeId\":[\"1\"],\"literatureAuthorId\":[\"1\"],\"literatureContent\":[\"222\"],\"literatureCreateTime\":[\"2019-05-11\"],\"literatureStatus\":[\"222\"]}', '0', null, '2019-05-11 13:35:34'), ('160', '文献', '2', 'com.ruoyi.project.system.literature.controller.LiteratureController.editSave()', '1', 'wuqichuan', '研发部门', '/lms/literature/edit', '127.0.0.1', '内网IP', '{\"literatureId\":[\"5\"],\"literatureTitle\":[\"222\"],\"literatureContent\":[\"111\"],\"literatureCreateTime\":[\"Sat May 11 00:00:00 CST 2019\"],\"literatureStatus\":[\"222\"]}', '0', null, '2019-05-11 13:35:39'), ('161', '文献', '2', 'com.ruoyi.project.system.literature.controller.LiteratureController.editSave()', '1', 'wuqichuan', '研发部门', '/lms/literature/edit', '127.0.0.1', '内网IP', '{\"literatureId\":[\"5\"],\"literatureTitle\":[\"222\"],\"literatureTypeId\":[\"5\"],\"literatureAuthorId\":[\"2\"],\"literatureContent\":[\"111\"],\"literatureCreateTime\":[\"Sat May 11 00:00:00 CST 2019\"],\"literatureStatus\":[\"222\"]}', '0', null, '2019-05-11 13:35:42'), ('162', '文献', '2', 'com.ruoyi.project.system.literature.controller.LiteratureController.editSave()', '1', 'wuqichuan', '研发部门', '/lms/literature/edit', '127.0.0.1', '内网IP', '{\"literatureId\":[\"5\"],\"literatureTitle\":[\"222\"],\"literatureTypeId\":[\"5\"],\"literatureAuthorId\":[\"2\"],\"literatureContent\":[\"111\"],\"literatureCreateTime\":[\"2019-05-11\"],\"literatureStatus\":[\"222\"]}', '0', null, '2019-05-11 13:35:52'), ('163', '文献', '2', 'com.ruoyi.project.system.literature.controller.LiteratureController.editSave()', '1', 'wuqichuan', '研发部门', '/lms/literature/edit', '127.0.0.1', '内网IP', '{\"literatureId\":[\"5\"],\"literatureTitle\":[\"222\"],\"literatureContent\":[\"111\"],\"literatureCreateTime\":[\"Sat May 11 00:00:00 CST 2019\"],\"literatureStatus\":[\"222\"]}', '0', null, '2019-05-11 13:35:59'), ('164', '文献', '2', 'com.ruoyi.project.system.literature.controller.LiteratureController.editSave()', '1', 'wuqichuan', '研发部门', '/lms/literature/edit', '127.0.0.1', '内网IP', '{\"literatureId\":[\"5\"],\"literatureTitle\":[\"222\"],\"literatureTypeId\":[\"2\"],\"literatureAuthorId\":[\"2\"],\"literatureContent\":[\"111\"],\"literatureCreateTime\":[\"Sat May 11 00:00:00 CST 2019\"],\"literatureStatus\":[\"222\"]}', '0', null, '2019-05-11 13:36:02'), ('165', '文献', '2', 'com.ruoyi.project.system.literature.controller.LiteratureController.editSave()', '1', 'wuqichuan', '研发部门', '/lms/literature/edit', '127.0.0.1', '内网IP', '{\"literatureId\":[\"5\"],\"literatureTitle\":[\"222\"],\"literatureTypeId\":[\"2\"],\"literatureAuthorId\":[\"2\"],\"literatureContent\":[\"111\"],\"literatureCreateTime\":[\"2019-05-31\"],\"literatureStatus\":[\"222\"]}', '0', null, '2019-05-11 13:36:07'), ('166', '文献类目', '3', 'com.ruoyi.project.system.literaturetype.controller.LiteraturetypeController.remove()', '1', 'wuqichuan', '研发部门', '/lms/literaturetype/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"1\"]}', '0', null, '2019-05-11 13:36:19'), ('167', '文献', '2', 'com.ruoyi.project.system.literature.controller.LiteratureController.editSave()', '1', 'wuqichuan', '研发部门', '/lms/literature/edit', '127.0.0.1', '内网IP', '{\"literatureId\":[\"1\"],\"literatureTitle\":[\"测试文献\"],\"literatureContent\":[\"我爱你我爱你我爱你11111\"],\"literatureCreateTime\":[\"Thu Apr 04 23:43:13 CST 2019\"],\"literatureStatus\":[\"1\"]}', '0', null, '2019-05-11 14:18:25'), ('168', '文献', '2', 'com.ruoyi.project.system.literature.controller.LiteratureController.editSave()', '1', 'wuqichuan', '研发部门', '/lms/literature/edit', '127.0.0.1', '内网IP', '{\"literatureId\":[\"1\"],\"literatureTitle\":[\"测试文献\"],\"literatureTypeId\":[\"2\"],\"literatureAuthorId\":[\"2\"],\"literatureContent\":[\"我爱你我爱你我爱你11111\"],\"literatureCreateTime\":[\"2019-05-11\"],\"literatureStatus\":[\"1\"]}', '0', null, '2019-05-11 14:18:33'), ('169', '文献', '2', 'com.ruoyi.project.system.literature.controller.LiteratureController.editSave()', '1', 'wuqichuan', '研发部门', '/lms/literature/edit', '127.0.0.1', '内网IP', '{\"literatureId\":[\"1\"],\"literatureTitle\":[\"测试文献\"],\"literatureTypeId\":[\"4\"],\"literatureAuthorId\":[\"2\"],\"literatureContent\":[\"我爱你我爱你我爱你11111222\"],\"literatureCreateTime\":[\"2019-05-11\"],\"literatureStatus\":[\"1\"]}', '0', null, '2019-05-11 14:18:40'), ('170', '文献', '2', 'com.ruoyi.project.system.literature.controller.LiteratureController.editSave()', '1', 'wuqichuan', '研发部门', '/lms/literature/edit', '127.0.0.1', '内网IP', '{\"literatureId\":[\"1\"],\"literatureTitle\":[\"测试文献\"],\"literatureTypeId\":[\"2\"],\"literatureAuthorId\":[\"2\"],\"literatureContent\":[\"我爱你我爱你我爱你1111122244444\"],\"literatureCreateTime\":[\"2019-05-11\"],\"literatureStatus\":[\"1\"]}', '0', null, '2019-05-11 14:21:17'), ('171', '文献类目', '3', 'com.ruoyi.project.system.literaturetype.controller.LiteraturetypeController.remove()', '1', 'wuqichuan', '研发部门', '/lms/literaturetype/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"1\"]}', '0', null, '2019-05-11 14:21:37'), ('172', '文献', '2', 'com.ruoyi.project.system.literature.controller.LiteratureController.editSave()', '1', 'wuqichuan', '研发部门', '/lms/literature/edit', '127.0.0.1', '内网IP', '{\"literatureId\":[\"1\"],\"literatureTitle\":[\"测试文献\"],\"literatureContent\":[\"我爱你我爱你我爱你1111122244444\"],\"literatureCreateTime\":[\"Sat May 11 00:00:00 CST 2019\"],\"literatureStatus\":[\"1\"]}', '0', null, '2019-05-13 20:04:56'), ('173', '文献类目', '3', 'com.ruoyi.project.system.literaturetype.controller.LiteraturetypeController.remove()', '1', 'wuqichuan', '研发部门', '/lms/literaturetype/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"1\"]}', '0', null, '2019-05-14 13:34:44'), ('174', '角色管理', '2', 'com.ruoyi.project.system.role.controller.RoleController.editSave()', '1', 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通角色\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"2000,2001,2003,2004,1,100,1000,1001,1002,1003,1004,1005,1006\"]}', '0', null, '2019-05-15 12:58:30'), ('175', '用户管理', '1', 'com.ruoyi.project.system.user.controller.UserController.addSave()', '1', 'wuqichuan', '研发部门', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"\"],\"userName\":[\"222\"],\"phonenumber\":[\"13846881234\"],\"email\":[\"1234z2@qq.com\"],\"loginName\":[\"test\"],\"password\":[\"12345\"],\"sex\":[\"0\"],\"status\":[\"1\"],\"roleIds\":[\"\"],\"postIds\":[\"\"]}', '0', null, '2019-05-15 13:07:21'), ('176', '用户管理', '2', 'com.ruoyi.project.system.user.controller.UserController.editSave()', '1', 'wuqichuan', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"4\"],\"deptId\":[\"\"],\"userName\":[\"222\"],\"phonenumber\":[\"13846881234\"],\"email\":[\"1234z2@qq.com\"],\"loginName\":[\"test\"],\"sex\":[\"0\"],\"status\":[\"1\"],\"roleIds\":[\"\"],\"postIds\":[\"\"]}', '0', null, '2019-05-15 13:07:26'), ('177', '重置密码', '2', 'com.ruoyi.project.system.user.controller.UserController.resetPwd()', '1', 'wuqichuan', '研发部门', '/system/user/resetPwd/4', '127.0.0.1', '内网IP', '{}', '0', null, '2019-05-15 13:07:27'), ('178', '用户管理', '3', 'com.ruoyi.project.system.user.controller.UserController.remove()', '1', 'wuqichuan', '研发部门', '/system/user/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"4\"]}', '0', null, '2019-05-15 13:11:52'), ('179', '用户管理', '1', 'com.ruoyi.project.system.user.controller.UserController.addSave()', '1', 'wuqichuan', '研发部门', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"\"],\"userName\":[\"demo\"],\"phonenumber\":[\"13812341234\"],\"email\":[\"1062@qq.com\"],\"loginName\":[\"demo\"],\"password\":[\"12345\"],\"sex\":[\"0\"],\"status\":[\"1\"],\"roleIds\":[\"\"],\"postIds\":[\"\"]}', '0', null, '2019-05-15 13:12:25'), ('180', '用户管理', '3', 'com.ruoyi.project.system.user.controller.UserController.remove()', '1', 'wuqichuan', '研发部门', '/system/user/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"5\"]}', '0', null, '2019-05-15 13:20:29'), ('181', '用户管理', '1', 'com.ruoyi.project.system.user.controller.UserController.addSave()', '1', 'wuqichuan', '研发部门', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"\"],\"userName\":[\"wuqichuan2\"],\"phonenumber\":[\"13811111111\"],\"email\":[\"1@qq.com\"],\"loginName\":[\"wuqichuan2\"],\"password\":[\"12345\"],\"sex\":[\"0\"],\"status\":[\"1\"],\"roleIds\":[\"\"],\"postIds\":[\"\"]}', '0', null, '2019-05-15 13:20:54'), ('182', '用户管理', '1', 'com.ruoyi.project.system.user.controller.UserController.addSave()', '1', 'wuqichuan', '研发部门', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"\"],\"userName\":[\"wuqichuan2\"],\"phonenumber\":[\"13811111111\"],\"email\":[\"1@qq.com\"],\"loginName\":[\"wuqichuan2\"],\"password\":[\"12345\"],\"sex\":[\"0\"],\"status\":[\"1\"],\"roleIds\":[\"\"],\"postIds\":[\"\"]}', '0', null, '2019-05-15 13:29:16'), ('183', '文献', '1', 'com.ruoyi.project.system.literature.controller.LiteratureController.addSave()', '1', 'wuqichuan', '研发部门', '/lms/literature/add', '127.0.0.1', '内网IP', '{\"literatureTitle\":[\"从人类文明的结晶中，找到解决世界问题的钥匙\"],\"literatureTypeId\":[\"1\"],\"literatureAuthorId\":[\"1\"],\"literatureContent\":[\"——任正非在公共关系战略纲要汇报会上的讲话 2018年9月29日\\r\\n\\r\\n一、我们要解决在西方遇到的问题，首先要充分认识西方的价值观，站在他们的立场去理解他们。\\r\\n 公共关系纲要主要是要解决与西方的沟通问题。亚非拉发展中国家很容易接受我们的观点，日韩也还好一点，欧美很难。如果我们和西方价值观不一 样，怎么进得去西方？那他们就会认为我们是在进攻。他们一定会把墙越筑越厚、越筑越高，我们的困难就越来越大。实事求是讲他们几千年形成的文 明，不是我们小小的公司改造得了的，蚍蜉撼树谈何易。 \\r\\n我们这些年，都是采取中国的思维方式去理解世界的格局、去揣测西方的意图。要对世界有充分的了解，必须站在西方的观念上理解西方。电视片《大 国崛起》讲了一些道理，我们研究各国强盛的原因，要站在西方角度，去解释文明的兴衰。\\r\\n\\r\\n\\r\\n几百年前，英国人把世界各地很多艺术品、杜鹃花运回国，站在我们的角度，这是掠夺。但如果站在英国人角度上，他们不这样认为。他们不惜飘洋过海，冒着生死风浪，把一些艺术品甚至整个 神庙，用木船运到英国，好好保存下来。例如，津巴布韦维多利亚大瀑布，是戴维利文斯敦发现的，他把它献给英国女王，并坚守在那儿几十年， \"],\"literatureCreateTime\":[\"2019-05-18\"],\"literatureStatus\":[\"2\"]}', '0', null, '2019-05-18 15:11:29'), ('184', '文献', '3', 'com.ruoyi.project.system.literature.controller.LiteratureController.remove()', '1', 'wuqichuan', '研发部门', '/lms/literature/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"计算机测试\"]}', '0', null, '2019-05-18 15:11:42'), ('185', '文献', '3', 'com.ruoyi.project.system.literature.controller.LiteratureController.remove()', '1', 'wuqichuan', '研发部门', '/lms/literature/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"13\"]}', '0', null, '2019-05-18 15:11:51'), ('186', '文献', '3', 'com.ruoyi.project.system.literature.controller.LiteratureController.remove()', '1', 'wuqichuan', '研发部门', '/lms/literature/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"计算机测试\"]}', '0', null, '2019-05-18 15:11:56'), ('187', '文献', '3', 'com.ruoyi.project.system.literature.controller.LiteratureController.remove()', '1', 'wuqichuan', '研发部门', '/lms/literature/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"12\"]}', '0', null, '2019-05-18 15:12:00'), ('188', '文献', '3', 'com.ruoyi.project.system.literature.controller.LiteratureController.remove()', '1', 'wuqichuan', '研发部门', '/lms/literature/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"11\"]}', '0', null, '2019-05-18 15:12:04'), ('189', '文献', '3', 'com.ruoyi.project.system.literature.controller.LiteratureController.remove()', '1', 'wuqichuan', '研发部门', '/lms/literature/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"10\"]}', '0', null, '2019-05-18 15:12:09'), ('190', '文献', '3', 'com.ruoyi.project.system.literature.controller.LiteratureController.remove()', '1', 'wuqichuan', '研发部门', '/lms/literature/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"9\"]}', '0', null, '2019-05-18 15:12:18'), ('191', '文献', '3', 'com.ruoyi.project.system.literature.controller.LiteratureController.remove()', '1', 'wuqichuan', '研发部门', '/lms/literature/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"8\"]}', '0', null, '2019-05-18 15:12:21'), ('192', '文献', '3', 'com.ruoyi.project.system.literature.controller.LiteratureController.remove()', '1', 'wuqichuan', '研发部门', '/lms/literature/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"7\"]}', '0', null, '2019-05-18 15:12:23'), ('193', '文献', '3', 'com.ruoyi.project.system.literature.controller.LiteratureController.remove()', '1', 'wuqichuan', '研发部门', '/lms/literature/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"6\"]}', '0', null, '2019-05-18 15:12:26'), ('194', '文献', '3', 'com.ruoyi.project.system.literature.controller.LiteratureController.remove()', '1', 'wuqichuan', '研发部门', '/lms/literature/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"5\"]}', '0', null, '2019-05-18 15:12:28'), ('195', '文献', '3', 'com.ruoyi.project.system.literature.controller.LiteratureController.remove()', '1', 'wuqichuan', '研发部门', '/lms/literature/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"4\"]}', '0', null, '2019-05-18 15:12:30'), ('196', '文献', '3', 'com.ruoyi.project.system.literature.controller.LiteratureController.remove()', '1', 'wuqichuan', '研发部门', '/lms/literature/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"3\"]}', '0', null, '2019-05-18 15:12:31'), ('197', '文献', '3', 'com.ruoyi.project.system.literature.controller.LiteratureController.remove()', '1', 'wuqichuan', '研发部门', '/lms/literature/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"2\"]}', '0', null, '2019-05-18 15:12:33'), ('198', '文献', '3', 'com.ruoyi.project.system.literature.controller.LiteratureController.remove()', '1', 'wuqichuan', '研发部门', '/lms/literature/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"1\"]}', '0', null, '2019-05-18 15:12:35'), ('199', '作者', '1', 'com.ruoyi.project.system.author.controller.AuthorController.addSave()', '1', 'wuqichuan', '研发部门', '/lms/author/add', '127.0.0.1', '内网IP', '{\"authorName\":[\"任正非\"],\"anthorSynopsis\":[\"华为CEO\"],\"authorCreateTime\":[\"2019-05-18\"]}', '0', null, '2019-05-18 15:15:12'), ('200', '作者', '1', 'com.ruoyi.project.system.author.controller.AuthorController.addSave()', '1', 'wuqichuan', '研发部门', '/lms/author/add', '127.0.0.1', '内网IP', '{\"authorName\":[\"网络作者\"],\"anthorSynopsis\":[\"网络上不知名作者\"],\"authorCreateTime\":[\"2019-05-18\"]}', '0', null, '2019-05-18 15:15:30'), ('201', '作者', '2', 'com.ruoyi.project.system.author.controller.AuthorController.editSave()', '1', 'wuqichuan', '研发部门', '/lms/author/edit', '127.0.0.1', '内网IP', '{\"authorId\":[\"1\"],\"authorName\":[\"武琦川\"],\"anthorSynopsis\":[\"15级软件三班\"],\"authorCreateTime\":[\"2019-05-18\"]}', '0', null, '2019-05-18 15:15:38'), ('202', '文献', '1', 'com.ruoyi.project.system.literature.controller.LiteratureController.addSave()', '1', 'wuqichuan', '研发部门', '/lms/literature/add', '127.0.0.1', '内网IP', '{\"literatureTitle\":[\"未来五年人工智能将实现五大突破\"],\"literatureTypeId\":[\"2\"],\"literatureAuthorId\":[\"4\"],\"literatureContent\":[\"那么，未来的人工智能又有着怎样的发展趋势，对医疗、能源、制造、网络安全等行业，以及我们的工作、生活、生命健康又将产生怎样的影响？近期，奇点大学人工智能和机器人学项目负责人Neil Jacobstein提出了自己的预测。他认为，在未来五年（2019-2024），人工智能将实现五大突破。 \\r\\n\\r\\n　　这些突破包括：人工智能将完全改变我们对传统识别模式的认识；医生会越来越离不开机器学习；量子计算将大大提升药物的研发效率；人工智能设计系统将帮助我们实现原子精确制造。当然，网络攻击也会与人工智能的发展相伴相随，但又从另一个方面带来更多的商业机会。 \\r\\n\\r\\n　　1.人工智能引发新的非人类模式识别和智能成果 \\r\\n\\r\\n　　AlphaGo Zero是一个机器学习程序，被用来训练玩复杂的围棋游戏。在2017年，它以100比0击败其上一代程序AlphaGo。而就在此前不久，AlphaGo刚刚因为在2016年击败人类围棋世界冠军，受到全球瞩目。 \\r\\n\\r\\n　　有趣的是，AlphaGo Zero不是从人类游戏中学习，而是通过与自身的对抗，或者说“自学”方式来进行训练，这是一种被称为强化学习的方法。 \\r\\n\\r\\n　　从头开始构建自己的知识\"],\"literatureCreateTime\":[\"2019-05-18\"],\"literatureStatus\":[\"来源网络\"]}', '0', null, '2019-05-18 15:22:54'), ('203', '文献', '2', 'com.ruoyi.project.system.literature.controller.LiteratureController.editSave()', '1', 'wuqichuan', '研发部门', '/lms/literature/edit', '127.0.0.1', '内网IP', '{\"literatureId\":[\"14\"],\"literatureTitle\":[\"从人类文明的结晶中，找到解决世界问题的钥匙\"],\"literatureTypeId\":[\"2\"],\"literatureAuthorId\":[\"3\"],\"literatureContent\":[\"——任正非在公共关系战略纲要汇报会上的讲话 2018年9月29日\\r\\n\\r\\n一、我们要解决在西方遇到的问题，首先要充分认识西方的价值观，站在他们的立场去理解他们。\\r\\n 公共关系纲要主要是要解决与西方的沟通问题。亚非拉发展中国家很容易接受我们的观点，日韩也还好一点，欧美很难。如果我们和西方价值观不一 样，怎么进得去西方？那他们就会认为我们是在进攻。他们一定会把墙越筑越厚、越筑越高，我们的困难就越来越大。实事求是讲他们几千年形成的文 明，不是我们小小的公司改造得了的，蚍蜉撼树谈何易。 \\r\\n我们这些年，都是采取中国的思维方式去理解世界的格局、去揣测西方的意图。要对世界有充分的了解，必须站在西方的观念上理解西方。电视片《大 国崛起》讲了一些道理，我们研究各国强盛的原因，要站在西方角度，去解释文明的兴衰。\\r\\n\\r\\n\\r\\n几百年前，英国人把世界各地很多艺术品、杜鹃花运回国，站在我们的角度，这是掠夺。但如果站在英国人角度上，他们不这样认为。他们不惜飘洋过海，冒着生死风浪，把一些艺术品甚至整个 神庙，用木船运到英国，好好保存下来。例如，津巴布韦维多利亚大瀑布，是戴维利文斯敦发现的，他把它献给英国女王，并坚守在那儿几十年， \"],\"literatureCreateTime\":[\"Sat May 18 00:00:00 CST 2019\"],\"literatureStatus\":[\"网络录入\"]}', '0', null, '2019-05-18 15:23:09'), ('204', '文献', '2', 'com.ruoyi.project.system.literature.controller.LiteratureController.editSave()', '1', 'wuqichuan', '研发部门', '/lms/literature/edit', '127.0.0.1', '内网IP', '{\"literatureId\":[\"14\"],\"literatureTitle\":[\"从人类文明的结晶中，找到解决世界问题的钥匙\"],\"literatureTypeId\":[\"2\"],\"literatureAuthorId\":[\"3\"],\"literatureContent\":[\"——任正非在公共关系战略纲要汇报会上的讲话 2018年9月29日\\r\\n\\r\\n一、我们要解决在西方遇到的问题，首先要充分认识西方的价值观，站在他们的立场去理解他们。\\r\\n 公共关系纲要主要是要解决与西方的沟通问题。亚非拉发展中国家很容易接受我们的观点，日韩也还好一点，欧美很难。如果我们和西方价值观不一 样，怎么进得去西方？那他们就会认为我们是在进攻。他们一定会把墙越筑越厚、越筑越高，我们的困难就越来越大。实事求是讲他们几千年形成的文 明，不是我们小小的公司改造得了的，蚍蜉撼树谈何易。 \\r\\n我们这些年，都是采取中国的思维方式去理解世界的格局、去揣测西方的意图。要对世界有充分的了解，必须站在西方的观念上理解西方。电视片《大 国崛起》讲了一些道理，我们研究各国强盛的原因，要站在西方角度，去解释文明的兴衰。\\r\\n\\r\\n\\r\\n几百年前，英国人把世界各地很多艺术品、杜鹃花运回国，站在我们的角度，这是掠夺。但如果站在英国人角度上，他们不这样认为。他们不惜飘洋过海，冒着生死风浪，把一些艺术品甚至整个 神庙，用木船运到英国，好好保存下来。例如，津巴布韦维多利亚大瀑布，是戴维利文斯敦发现的，他把它献给英国女王，并坚守在那儿几十年， \"],\"literatureCreateTime\":[\"2019-05-18\"],\"literatureStatus\":[\"网络录入\"]}', '0', null, '2019-05-18 15:23:12'), ('205', '文献', '1', 'com.ruoyi.project.system.literature.controller.LiteratureController.addSave()', '1', 'wuqichuan', '研发部门', '/lms/literature/add', '127.0.0.1', '内网IP', '{\"literatureTitle\":[\"寻“四代恩师”冯报本老前辈\"],\"literatureTypeId\":[\"1\"],\"literatureAuthorId\":[\"2\"],\"literatureContent\":[\"上世纪50-60年代动手玩业余无线电、装矿石收音机的青少年，无人不晓大名鼎鼎的业余无线电科普作家冯报本老前辈，他在1950年就发表了第一篇矿石收音机科普文章，直到1982年封笔，前后发表过几十篇杂志文章，十多本书。（编者注：冯老的著作清单见本期同时推送的另一篇文章《人物｜无线电宗师冯报本先生》）\"],\"literatureCreateTime\":[\"2019-05-18\"],\"literatureStatus\":[\"网络录入\"]}', '0', null, '2019-05-18 15:23:50'), ('206', '作者', '1', 'com.ruoyi.project.system.author.controller.AuthorController.addSave()', '1', 'wuqichuan', '研发部门', '/lms/author/add', '127.0.0.1', '内网IP', '{\"authorName\":[\"第三方作者\"],\"anthorSynopsis\":[\"非本系统签约的第三方作者\"],\"authorCreateTime\":[\"2019-05-18\"]}', '0', null, '2019-05-18 15:24:11'), ('207', '文献', '1', 'com.ruoyi.project.system.literature.controller.LiteratureController.addSave()', '1', 'wuqichuan', '研发部门', '/lms/literature/add', '127.0.0.1', '内网IP', '{\"literatureTitle\":[\"互联网和90后崛起，传统行业的营销渠道和策略走到头了\"],\"literatureTypeId\":[\"2\"],\"literatureAuthorId\":[\"5\"],\"literatureContent\":[\"我为什么讲这个例子，就是告诉大家宏观是极其重要的。\\r\\n\\r\\n宏观一小点点的波动，其实对于微观，对于我们每个生存的实体，我们的人类，我们的企业都是致命的打击，致命的伤害。所以我们这家企业是极度关注宏观的一家企业。\\r\\n\\r\\n所以，最近一段时间，整个宏观在发生非常大的变化，发生极其大的变化。\\r\\n\\r\\n比如川普上台这件事情，川普这个人我个人认为是没有什么太大的问题。虽然看起来那么古怪的一个人，但是这个人我觉得问题不大。但是这个事情所标志的意义就大了，川普应该是美国历史上的一个特殊存在。\\r\\n\\r\\n美国这个国家，长期以来从二战以后基本上就是全球的价值观标杆，道德楷模，倡导平等、自由、包容这些理念，倡导民主、科学。但是川普上台之后，美国在这些他们被认为做的非常好的普世价值观践行上产生了巨大的撕裂。\\r\\n\\r\\n我讲几个例子你们就知道了，一个是科技业有个大佬叫彼得.泰尔，英文名叫Peter Thiel。\\r\\n\\r\\n这个人他是非常牛逼的，是PayPal的创始人。PayPal就是美国的支付宝，是Facebook的天使投资人。Facebook非常非常小的时候，投了Facebook50万美元。\\r\\n\\r\\n所以，也是在Facebook董事会上，在去年出了一本书\"],\"literatureCreateTime\":[\"2019-05-18\"],\"literatureStatus\":[\"演讲内容\"]}', '0', null, '2019-05-18 15:24:45'), ('208', '文献', '1', 'com.ruoyi.project.system.literature.controller.LiteratureController.addSave()', '1', 'wuqichuan', '研发部门', '/lms/literature/add', '127.0.0.1', '内网IP', '{\"literatureTitle\":[\"全新耳道式耳機有創新發現\"],\"literatureTypeId\":[\"2\"],\"literatureAuthorId\":[\"5\"],\"literatureContent\":[\"Tecsun德生總裁梁偉近年每次音響展都親自來台介紹自家產品，這次音響展結束之後則還有另一件大事，就是參加本刊2019年度的風雲器材頒獎典禮，因為他們又再一次得獎，這次得獎的產品是定價只有15,000元的PM-80綜合擴大機。\\r\\n\\r\\n三款新品即將推出\\r\\n\\r\\n在去年12月的音響展中，我採訪了梁總，原本以為只是閒聊，沒想到梁總這次又向我透露了兩款新產品計畫，其中一款是梁總曾經跟我提過的CD唱盤，另一款則是原本完全不在德生計畫中的耳道式耳機。外加即將推出的隨身音樂播放器，等於即將有三款新品問世。\\r\\n\\r\\n奇怪，梁總之前不是多次告訴我，德生的兩聲道音響產品已經齊備，從訊源，擴大機，喇叭到耳機全部到齊，短時間內不會再推出新產品了嗎？怎麼這回又冒出三款新品？我想唯一的解釋，只能說德生的研發能力實在太旺盛了，才有辦法持續有推出新品，厲害的是，每款產品一定都經過反覆測試修正，絕非急就章的草率之作。\"],\"literatureCreateTime\":[\"2019-05-18\"],\"literatureStatus\":[\"网络资料\"]}', '0', null, '2019-05-18 15:26:00'), ('209', '文献', '1', 'com.ruoyi.project.system.literature.controller.LiteratureController.addSave()', '1', 'wuqichuan', '研发部门', '/lms/literature/add', '127.0.0.1', '内网IP', '{\"literatureTitle\":[\"坚果」宣布获阿里领投6亿元D轮融资\"],\"literatureTypeId\":[\"2\"],\"literatureAuthorId\":[\"5\"],\"literatureContent\":[\"36氪获悉，坚果宣布完成6亿元D轮融资，由阿里领投，36氪基金、广发信德、磐石资本、君盛投资、三泽投资、北京东资等跟投。\\r\\n \\r\\n根据此前官方的消息，深圳火乐科技有限公司曾于2013年8月获得湖南省华曙投资有限责任公司等千万元天使投资；于2014年11月获得达晨创投、IDG、Star VC联合投资，金额为6000万元；2015年5月，获得松禾资本、天奇阿米巴、时代伯乐投资，金额为2亿元人民币；2016年3月，获金砖资本、前海中金等C轮6亿投资。\\r\\n \\r\\n董事长胡震宇告诉36氪，本轮融资将持续用于激光电视的研发及拓展内容及渠道优势。此外，坚果此次在获得阿里的投资后，双方也将在技术及产品方面合作。据悉，后续阿里将与坚果进行AI技术上的深度合作，通过与天猫精灵智能音箱的互联，实现以语音控制实现更大范围的家居智能化。\"],\"literatureCreateTime\":[\"\"],\"literatureStatus\":[\"新闻\"]}', '0', null, '2019-05-18 15:26:35'), ('210', '文献', '1', 'com.ruoyi.project.system.literature.controller.LiteratureController.addSave()', '1', 'wuqichuan', '研发部门', '/lms/literature/add', '127.0.0.1', '内网IP', '{\"literatureTitle\":[\"坚果」宣布获阿里领投6亿元D轮融资\"],\"literatureTypeId\":[\"2\"],\"literatureAuthorId\":[\"5\"],\"literatureContent\":[\"36氪获悉，坚果宣布完成6亿元D轮融资，由阿里领投，36氪基金、广发信德、磐石资本、君盛投资、三泽投资、北京东资等跟投。\\r\\n \\r\\n根据此前官方的消息，深圳火乐科技有限公司曾于2013年8月获得湖南省华曙投资有限责任公司等千万元天使投资；于2014年11月获得达晨创投、IDG、Star VC联合投资，金额为6000万元；2015年5月，获得松禾资本、天奇阿米巴、时代伯乐投资，金额为2亿元人民币；2016年3月，获金砖资本、前海中金等C轮6亿投资。\\r\\n \\r\\n董事长胡震宇告诉36氪，本轮融资将持续用于激光电视的研发及拓展内容及渠道优势。此外，坚果此次在获得阿里的投资后，双方也将在技术及产品方面合作。据悉，后续阿里将与坚果进行AI技术上的深度合作，通过与天猫精灵智能音箱的互联，实现以语音控制实现更大范围的家居智能化。\"],\"literatureCreateTime\":[\"2019-05-18\"],\"literatureStatus\":[\"新闻\"]}', '0', null, '2019-05-18 15:26:39'), ('211', '文献', '2', 'com.ruoyi.project.system.literature.controller.LiteratureController.editSave()', '1', 'wuqichuan', '研发部门', '/lms/literature/edit', '127.0.0.1', '内网IP', '{\"literatureId\":[\"19\"],\"literatureTitle\":[\"坚果」宣布获阿里领投6亿元D轮融资\"],\"literatureTypeId\":[\"2\"],\"literatureAuthorId\":[\"4\"],\"literatureContent\":[\"36氪获悉，坚果宣布完成6亿元D轮融资，由阿里领投，36氪基金、广发信德、磐石资本、君盛投资、三泽投资、北京东资等跟投。\\r\\n \\r\\n根据此前官方的消息，深圳火乐科技有限公司曾于2013年8月获得湖南省华曙投资有限责任公司等千万元天使投资；于2014年11月获得达晨创投、IDG、Star VC联合投资，金额为6000万元；2015年5月，获得松禾资本、天奇阿米巴、时代伯乐投资，金额为2亿元人民币；2016年3月，获金砖资本、前海中金等C轮6亿投资。\\r\\n \\r\\n董事长胡震宇告诉36氪，本轮融资将持续用于激光电视的研发及拓展内容及渠道优势。此外，坚果此次在获得阿里的投资后，双方也将在技术及产品方面合作。据悉，后续阿里将与坚果进行AI技术上的深度合作，通过与天猫精灵智能音箱的互联，实现以语音控制实现更大范围的家居智能化。\"],\"literatureCreateTime\":[\"2019-05-18\"],\"literatureStatus\":[\"新闻\"]}', '0', null, '2019-05-18 15:27:02'), ('212', '文献', '1', 'com.ruoyi.project.system.literature.controller.LiteratureController.addSave()', '1', 'wuqichuan', '研发部门', '/lms/literature/add', '127.0.0.1', '内网IP', '{\"literatureTitle\":[\"基于状态检修模式下探析变电检修技术的研究\"],\"literatureTypeId\":[\"3\"],\"literatureAuthorId\":[\"5\"],\"literatureContent\":[\"摘要：随着时代的进步和发展，传统的变电检修模式在实践过程中逐渐暴露出来了一系列的问题和不足，严重影响到供电企业效益的提升和社会的和谐发展。针对这种情况，可以应用状态检修技术，结合电力设备的运行状况，开展检修工作，降低设备的运行管理成本，使电网能够更加安全、可靠地运行。本文对基于状态检修模式下探析变电检修技术进行研究。\\r\\n        关键词：状态检修模式；变电检修技术\\r\\n        随着我国经济水平的不断发展，各行各业的用电需求日趋增长的情况下。状态检修模式在变电检修技术中的应用取得了很好的实践效果。因此，变电检修工作人员，必须充分掌握状态检修的原理和技术，并加强检修过程中的要点控制，确保状态检修发挥出最佳的效果，最终促进电力企业的快速发展，确保电力系统的安全稳定运行。\\r\\n        1变电检修技术的发展现状\\r\\n        1.1变电检修技术的发展历程\\r\\n        变电检修技术的发展历程主要有预防检修和时候检修模式两个阶段。事后检修模式主要是变电技术设备运行过程中出现了各种功能性故障，造成变电设备的正常运行受到阻碍，继而对对检修工作做出相应的安排。在大量的实践中证明，事后检修\"],\"literatureCreateTime\":[\"2019-05-18\"],\"literatureStatus\":[\"期刊\"]}', '0', null, '2019-05-18 15:32:20'), ('213', '文献', '1', 'com.ruoyi.project.system.literature.controller.LiteratureController.addSave()', '1', 'wuqichuan', '研发部门', '/lms/literature/add', '127.0.0.1', '内网IP', '{\"literatureTitle\":[\"变电运行中倒闸危险点预控技术\"],\"literatureTypeId\":[\"3\"],\"literatureAuthorId\":[\"5\"],\"literatureContent\":[\" 摘要：变电运行倒闸操作是指电气设备由一种状态转换为另一种状态，或由一种运行方式转变为另一种运行方式的一系列有序的操作。正确地进行倒闸操作直接关系到电网、设备和人身安全，影响到供电的可靠性，影响到国民经济的发展与社会稳定。因此，分析倒闸操作中的主要危险点，完善其控制措施，已成为防范误操作事故和人身伤害、设备损坏事故，保证电网安全、稳定运行的重要举措。因此，本文对变电运行中倒闸危险点预控技术进行分析。\\r\\n        关键词：变电运行；倒闸；危险点；预控技术\\r\\n        在电力企业的生产经营中，安全是一切的基础与重中之重，这就要求电力管理与操作人员更加注重危险点预控工作，工作人员对于设备操作的环境、性能、操作等方面，都存在着一定的危险点。作为电气运行工作人员，应当强化危险点预控，提高安全生产系数，其中预控倒闸操作中的危险点是重要的方面。\\r\\n        1倒闸操作危险点控制的重要性\\r\\n        变电站的倒闸操作是在电网运行中不可缺少的重要技术措施，其操作的优劣将直接影响电网的运行安全。电网输变电设施的维护与电网运行方式的改变都需要利用倒闸来实现。实践中，倒闸的过程中在对不同的设备\"],\"literatureCreateTime\":[\"2019-05-18\"],\"literatureStatus\":[\"期刊来源\"]}', '0', null, '2019-05-18 15:35:10'), ('214', '文献', '1', 'com.ruoyi.project.system.literature.controller.LiteratureController.addSave()', '1', 'wuqichuan', '研发部门', '/lms/literature/add', '127.0.0.1', '内网IP', '{\"literatureTitle\":[\"智能电网继电保护技术分析 \"],\"literatureTypeId\":[\"3\"],\"literatureAuthorId\":[\"4\"],\"literatureContent\":[\"摘要：智能电网将极大地改变传统电力系统的形态，各种新技术的应用对继电保护技术提出的新的要求，继电保护技术面临革命性的变化，运行方式的灵活和设备特性的变化都是对继电保护带来新的挑战。智能化电网是电力系统未来发展的必然趋势，必须积极关注、研究和推广继电保护技术，以更好地发挥“坚强智能电网”的作用。本文对智能电网继电保护技术进行分析。\\r\\n        关键词：智能电网；继电保护技术；分析\\r\\n        对于智能电网来说，继电保护装置是维护其安全稳定运行的基础和关键，继电保护装置起着将电网故障与电力控制系统隔离、防止事故扩大的作用。因此，对智能电网时代的继电保护技术进行探讨和分析，可以为我国智能电网的安全运行和建设提供基础和保障，使得我国继电保护管理水平的总体工作目标得到进一步提升，为我国智能电网的建设和铺垫工作提供基础和保障。\\r\\n        1概述\\r\\n        1.1智能电网的含义\\r\\n        智能电网又被称之为“电网2.0”，指的是电网的智能化。智能电网的建立前提是通信网络实现了双向的集成与高速，且得到了较为先进的各方面技术（如，先进的设备技术、控制方法、决策支持系统以及传感与\"],\"literatureCreateTime\":[\"\"],\"literatureStatus\":[\"期刊网来源\"]}', '0', null, '2019-05-18 15:35:43'), ('215', '文献', '1', 'com.ruoyi.project.system.literature.controller.LiteratureController.addSave()', '1', 'wuqichuan', '研发部门', '/lms/literature/add', '127.0.0.1', '内网IP', '{\"literatureTitle\":[\"智能电网继电保护技术分析 \"],\"literatureTypeId\":[\"3\"],\"literatureAuthorId\":[\"4\"],\"literatureContent\":[\"摘要：智能电网将极大地改变传统电力系统的形态，各种新技术的应用对继电保护技术提出的新的要求，继电保护技术面临革命性的变化，运行方式的灵活和设备特性的变化都是对继电保护带来新的挑战。智能化电网是电力系统未来发展的必然趋势，必须积极关注、研究和推广继电保护技术，以更好地发挥“坚强智能电网”的作用。本文对智能电网继电保护技术进行分析。\\r\\n        关键词：智能电网；继电保护技术；分析\\r\\n        对于智能电网来说，继电保护装置是维护其安全稳定运行的基础和关键，继电保护装置起着将电网故障与电力控制系统隔离、防止事故扩大的作用。因此，对智能电网时代的继电保护技术进行探讨和分析，可以为我国智能电网的安全运行和建设提供基础和保障，使得我国继电保护管理水平的总体工作目标得到进一步提升，为我国智能电网的建设和铺垫工作提供基础和保障。\\r\\n        1概述\\r\\n        1.1智能电网的含义\\r\\n        智能电网又被称之为“电网2.0”，指的是电网的智能化。智能电网的建立前提是通信网络实现了双向的集成与高速，且得到了较为先进的各方面技术（如，先进的设备技术、控制方法、决策支持系统以及传感与\"],\"literatureCreateTime\":[\"2019-05-18\"],\"literatureStatus\":[\"期刊网来源\"]}', '0', null, '2019-05-18 15:35:47'), ('216', '文献', '1', 'com.ruoyi.project.system.literature.controller.LiteratureController.addSave()', '1', 'wuqichuan', '研发部门', '/lms/literature/add', '127.0.0.1', '内网IP', '{\"literatureTitle\":[\"配网生产抢修指挥支撑技术的应用探析\"],\"literatureTypeId\":[\"3\"],\"literatureAuthorId\":[\"5\"],\"literatureContent\":[\"摘要：随着电网信息化建设的持续投入，电网公司的电力生产能力和应用范围不断扩大，电力业务系统也转向了以计算机，自动控制和现代通信技术为基础的计算机网络和自动化，为电力作业、管理、维护提供了数据支持。并且配网自动化进程的不断深化，也是实时监控配电网状态，建立配网生产抢修指挥平台的基础，对于提升供电可靠性和服务水平具有重要意义。因此，本文对配网生产抢修指挥支撑技术的应用进行分析探讨。\\r\\n        关键词：配网生产；抢修指挥支撑技术；应用\\r\\n        “配网”即配电网的简称，在整个电力网络中起到分配电能的作用，将电流与相关用户连接起来，在供电过程中起到至关重要的作用。配网在其工作运行中会受到周遭因素的影响，导致产生故障而不能正常供电，最终导致用户用电体验大打折扣，并且严重情况下还会给电力供应企业带来严重的经济损失。由此可见，及时发现配网中的故障因素，并采取相关措施予以排除，不仅能减少供电企业的经济损失，还能为用电者谋取福利，提供更优化的用电体验。\\r\\n        1配网生产抢修指挥支撑技术平台的必要性\\r\\n        当前，我国电力系统正处于高速发展中，建立完善的配网生产抢修指挥平台，\"],\"literatureCreateTime\":[\"2019-05-18\"],\"literatureStatus\":[\"网络\"]}', '0', null, '2019-05-18 15:41:44'), ('217', '文献', '1', 'com.ruoyi.project.system.literature.controller.LiteratureController.addSave()', '1', 'wuqichuan', '研发部门', '/lms/literature/add', '127.0.0.1', '内网IP', '{\"literatureTitle\":[\"电力系统变电运行技术问题及解决对策\"],\"literatureTypeId\":[\"3\"],\"literatureAuthorId\":[\"5\"],\"literatureContent\":[\" 摘要：随着我国电力系统技术的不断发展，变电运行技术也应不断的革新发展，才能保证变电运行技术的安全，减少故障发生的可能性。当然，在变电运行技术当中还是会经常遇见各种各样的问题，这种时候就需要对所发生的问题进行科学性的分析，从而找到解决的方法。本文对电力系统变电运行技术问题及解决对策进行分析。\\r\\n        关键词：电力系统；变电运行技术；问题；解决对策\\r\\n        随着科学技术的发展和自动化水平的提升，设备的运行效率不断提高，社会生产生活对电能的需求量也逐渐增加。电力系统变电运行技术作为电能供应系统的重要组成部分，为了满足不断增长的电能需求，需要对其进行深入的研究。本文主要阐述了变电运行技术实施过程中存在的问题，并针对这些问题提出相应的解决办法。\\r\\n        1变电运行技术概述\\r\\n        就目前而言，由于我国经济的持续发展，人们的生产以及生活对于电力资源的需求也日益增长，促进了电力工程的建设。为了确保电力系统系统的安全运行，变电运行技术得到了广泛的应用。电力系统当中的变电运行技术主要指的是在上级主管单位部门的指令之下，加强对各个电力站点内部设备运行的管理，并通过指令使得\"],\"literatureCreateTime\":[\"2019-05-18\"],\"literatureStatus\":[\"网络录入\"]}', '0', null, '2019-05-18 15:59:21');
COMMIT;

-- ----------------------------
--  Table structure for `sys_post`
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='岗位信息表';

-- ----------------------------
--  Records of `sys_post`
-- ----------------------------
BEGIN;
INSERT INTO `sys_post` VALUES ('1', 'ceo', '董事长', '1', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('2', 'se', '项目经理', '2', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('3', 'hr', '人力资源', '3', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('4', 'user', '普通员工', '4', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
COMMIT;

-- ----------------------------
--  Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限）',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='角色信息表';

-- ----------------------------
--  Records of `sys_role`
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` VALUES ('1', '管理员', 'admin', '1', '1', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2019-05-11 13:18:59', '管理员'), ('2', '普通角色', 'common', '2', '1', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2019-05-15 12:58:30', '普通角色');
COMMIT;

-- ----------------------------
--  Table structure for `sys_role_dept`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和部门关联表';

-- ----------------------------
--  Table structure for `sys_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和菜单关联表';

-- ----------------------------
--  Records of `sys_role_menu`
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_menu` VALUES ('1', '1'), ('1', '2'), ('1', '3'), ('1', '100'), ('1', '101'), ('1', '102'), ('1', '103'), ('1', '104'), ('1', '105'), ('1', '106'), ('1', '107'), ('1', '108'), ('1', '109'), ('1', '110'), ('1', '111'), ('1', '112'), ('1', '113'), ('1', '114'), ('1', '115'), ('1', '500'), ('1', '501'), ('1', '1000'), ('1', '1001'), ('1', '1002'), ('1', '1003'), ('1', '1004'), ('1', '1005'), ('1', '1006'), ('1', '1007'), ('1', '1008'), ('1', '1009'), ('1', '1010'), ('1', '1011'), ('1', '1012'), ('1', '1013'), ('1', '1014'), ('1', '1015'), ('1', '1016'), ('1', '1017'), ('1', '1018'), ('1', '1019'), ('1', '1020'), ('1', '1021'), ('1', '1022'), ('1', '1023'), ('1', '1024'), ('1', '1025'), ('1', '1026'), ('1', '1027'), ('1', '1028'), ('1', '1029'), ('1', '1030'), ('1', '1031'), ('1', '1032'), ('1', '1033'), ('1', '1034'), ('1', '1035'), ('1', '1036'), ('1', '1037'), ('1', '1038'), ('1', '1039'), ('1', '1040'), ('1', '1041'), ('1', '1042'), ('1', '1043'), ('1', '1044'), ('1', '1045'), ('1', '1046'), ('1', '1047'), ('1', '1048'), ('1', '1049'), ('1', '1050'), ('1', '1051'), ('1', '1052'), ('1', '1053'), ('1', '1054'), ('1', '1055'), ('1', '1056'), ('1', '1057'), ('1', '2000'), ('1', '2001'), ('1', '2003'), ('1', '2004'), ('2', '1'), ('2', '100'), ('2', '1000'), ('2', '1001'), ('2', '1002'), ('2', '1003'), ('2', '1004'), ('2', '1005'), ('2', '1006'), ('2', '2000'), ('2', '2001'), ('2', '2003'), ('2', '2004');
COMMIT;

-- ----------------------------
--  Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) DEFAULT '103' COMMENT '部门ID',
  `login_name` varchar(30) NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) DEFAULT '' COMMENT '密码',
  `salt` varchar(20) DEFAULT '' COMMENT '盐加密',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(50) DEFAULT '' COMMENT '最后登陆IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
--  Records of `sys_user`
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES ('1', '103', 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '29c67a30398638269fe600f73a054934', '111111', '0', '0', '127.0.0.1', '2019-05-18 15:19:44', 'admin', '2018-03-16 11:33:00', 'ry', '2019-05-18 15:19:43', '管理员'), ('2', '105', 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '7fd3dc1c00159c7d9529339253415b7b', '8eb6e1', '0', '0', '127.0.0.1', '2019-05-11 13:22:46', 'admin', '2018-03-16 11:33:00', 'admin', '2019-05-11 13:22:46', '测试员'), ('3', '103', 'wuqichuan', '武琦川', '00', '1062112233@qq.com', '15663583031', '0', '', '139345b4cf29d35e212bc63b010a0d6e', 'cba4f8', '0', '0', '127.0.0.1', '2019-05-18 15:22:18', 'admin', '2019-05-11 12:56:18', 'admin', '2019-05-18 15:22:18', ''), ('7', '103', 'wuqichuan2', 'wuqichuan2', '00', '1@qq.com', '13811111111', '0', '', '572b03badafbab0a6f5bb88e0fa06487', '1ae253', '0', '0', '127.0.0.1', '2019-05-15 13:29:24', 'wuqichuan', '2019-05-15 13:29:16', '', '2019-05-15 13:29:24', '');
COMMIT;

-- ----------------------------
--  Table structure for `sys_user_online`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online` (
  `sessionId` varchar(50) NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(50) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int(5) DEFAULT '0' COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='在线用户记录';

-- ----------------------------
--  Records of `sys_user_online`
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_online` VALUES ('51dddd4e-eeee-4a6c-b95c-0fc101efc816', 'wuqichuan', '研发部门', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', 'on_line', '2019-05-18 15:22:13', '2019-05-18 15:58:55', '1800000');
COMMIT;

-- ----------------------------
--  Table structure for `sys_user_post`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与岗位关联表';

-- ----------------------------
--  Records of `sys_user_post`
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_post` VALUES ('1', '1'), ('2', '2');
COMMIT;

-- ----------------------------
--  Table structure for `sys_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户和角色关联表';

-- ----------------------------
--  Records of `sys_user_role`
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` VALUES ('1', '1'), ('2', '2'), ('3', '2'), ('7', '2');
COMMIT;

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='作者表';

-- ----------------------------
--  Records of `tb_author`
-- ----------------------------
BEGIN;
INSERT INTO `tb_author` VALUES ('1', '武琦川', '15级软件三班', '2019-05-18 00:00:00'), ('2', '张三', '测试', '2019-05-11 00:00:00'), ('3', '任正非', '华为CEO', '2019-05-18 00:00:00'), ('4', '网络作者', '网络上不知名作者', '2019-05-18 00:00:00'), ('5', '第三方作者', '非本系统签约的第三方作者', '2019-05-18 00:00:00');
COMMIT;

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
  `literatureStatus` varchar(100) DEFAULT NULL COMMENT '文献状态备注',
  PRIMARY KEY (`literatureId`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='文献表';

-- ----------------------------
--  Records of `tb_literature`
-- ----------------------------
BEGIN;
INSERT INTO `tb_literature` VALUES ('14', '从人类文明的结晶中，找到解决世界问题的钥匙', '2', '3', '——任正非在公共关系战略纲要汇报会上的讲话 2018年9月29日\r\n\r\n一、我们要解决在西方遇到的问题，首先要充分认识西方的价值观，站在他们的立场去理解他们。\r\n 公共关系纲要主要是要解决与西方的沟通问题。亚非拉发展中国家很容易接受我们的观点，日韩也还好一点，欧美很难。如果我们和西方价值观不一 样，怎么进得去西方？那他们就会认为我们是在进攻。他们一定会把墙越筑越厚、越筑越高，我们的困难就越来越大。实事求是讲他们几千年形成的文 明，不是我们小小的公司改造得了的，蚍蜉撼树谈何易。 \r\n我们这些年，都是采取中国的思维方式去理解世界的格局、去揣测西方的意图。要对世界有充分的了解，必须站在西方的观念上理解西方。电视片《大 国崛起》讲了一些道理，我们研究各国强盛的原因，要站在西方角度，去解释文明的兴衰。\r\n\r\n\r\n几百年前，英国人把世界各地很多艺术品、杜鹃花运回国，站在我们的角度，这是掠夺。但如果站在英国人角度上，他们不这样认为。他们不惜飘洋过海，冒着生死风浪，把一些艺术品甚至整个 神庙，用木船运到英国，好好保存下来。例如，津巴布韦维多利亚大瀑布，是戴维利文斯敦发现的，他把它献给英国女王，并坚守在那儿几十年， ', '2019-05-18 00:00:00', '网络录入'), ('15', '未来五年人工智能将实现五大突破', '2', '4', '那么，未来的人工智能又有着怎样的发展趋势，对医疗、能源、制造、网络安全等行业，以及我们的工作、生活、生命健康又将产生怎样的影响？近期，奇点大学人工智能和机器人学项目负责人Neil Jacobstein提出了自己的预测。他认为，在未来五年（2019-2024），人工智能将实现五大突破。 \r\n\r\n　　这些突破包括：人工智能将完全改变我们对传统识别模式的认识；医生会越来越离不开机器学习；量子计算将大大提升药物的研发效率；人工智能设计系统将帮助我们实现原子精确制造。当然，网络攻击也会与人工智能的发展相伴相随，但又从另一个方面带来更多的商业机会。 \r\n\r\n　　1.人工智能引发新的非人类模式识别和智能成果 \r\n\r\n　　AlphaGo Zero是一个机器学习程序，被用来训练玩复杂的围棋游戏。在2017年，它以100比0击败其上一代程序AlphaGo。而就在此前不久，AlphaGo刚刚因为在2016年击败人类围棋世界冠军，受到全球瞩目。 \r\n\r\n　　有趣的是，AlphaGo Zero不是从人类游戏中学习，而是通过与自身的对抗，或者说“自学”方式来进行训练，这是一种被称为强化学习的方法。 \r\n\r\n　　从头开始构建自己的知识', '2019-05-18 00:00:00', '来源网络'), ('16', '寻“四代恩师”冯报本老前辈', '1', '2', '上世纪50-60年代动手玩业余无线电、装矿石收音机的青少年，无人不晓大名鼎鼎的业余无线电科普作家冯报本老前辈，他在1950年就发表了第一篇矿石收音机科普文章，直到1982年封笔，前后发表过几十篇杂志文章，十多本书。（编者注：冯老的著作清单见本期同时推送的另一篇文章《人物｜无线电宗师冯报本先生》）', '2019-05-18 00:00:00', '网络录入'), ('17', '互联网和90后崛起，传统行业的营销渠道和策略走到头了', '2', '5', '我为什么讲这个例子，就是告诉大家宏观是极其重要的。\r\n\r\n宏观一小点点的波动，其实对于微观，对于我们每个生存的实体，我们的人类，我们的企业都是致命的打击，致命的伤害。所以我们这家企业是极度关注宏观的一家企业。\r\n\r\n所以，最近一段时间，整个宏观在发生非常大的变化，发生极其大的变化。\r\n\r\n比如川普上台这件事情，川普这个人我个人认为是没有什么太大的问题。虽然看起来那么古怪的一个人，但是这个人我觉得问题不大。但是这个事情所标志的意义就大了，川普应该是美国历史上的一个特殊存在。\r\n\r\n美国这个国家，长期以来从二战以后基本上就是全球的价值观标杆，道德楷模，倡导平等、自由、包容这些理念，倡导民主、科学。但是川普上台之后，美国在这些他们被认为做的非常好的普世价值观践行上产生了巨大的撕裂。\r\n\r\n我讲几个例子你们就知道了，一个是科技业有个大佬叫彼得.泰尔，英文名叫Peter Thiel。\r\n\r\n这个人他是非常牛逼的，是PayPal的创始人。PayPal就是美国的支付宝，是Facebook的天使投资人。Facebook非常非常小的时候，投了Facebook50万美元。\r\n\r\n所以，也是在Facebook董事会上，在去年出了一本书', '2019-05-18 00:00:00', '演讲内容'), ('18', '全新耳道式耳機有創新發現', '2', '5', 'Tecsun德生總裁梁偉近年每次音響展都親自來台介紹自家產品，這次音響展結束之後則還有另一件大事，就是參加本刊2019年度的風雲器材頒獎典禮，因為他們又再一次得獎，這次得獎的產品是定價只有15,000元的PM-80綜合擴大機。\r\n\r\n三款新品即將推出\r\n\r\n在去年12月的音響展中，我採訪了梁總，原本以為只是閒聊，沒想到梁總這次又向我透露了兩款新產品計畫，其中一款是梁總曾經跟我提過的CD唱盤，另一款則是原本完全不在德生計畫中的耳道式耳機。外加即將推出的隨身音樂播放器，等於即將有三款新品問世。\r\n\r\n奇怪，梁總之前不是多次告訴我，德生的兩聲道音響產品已經齊備，從訊源，擴大機，喇叭到耳機全部到齊，短時間內不會再推出新產品了嗎？怎麼這回又冒出三款新品？我想唯一的解釋，只能說德生的研發能力實在太旺盛了，才有辦法持續有推出新品，厲害的是，每款產品一定都經過反覆測試修正，絕非急就章的草率之作。', '2019-05-18 00:00:00', '网络资料'), ('19', '坚果」宣布获阿里领投6亿元D轮融资', '2', '4', '36氪获悉，坚果宣布完成6亿元D轮融资，由阿里领投，36氪基金、广发信德、磐石资本、君盛投资、三泽投资、北京东资等跟投。\r\n \r\n根据此前官方的消息，深圳火乐科技有限公司曾于2013年8月获得湖南省华曙投资有限责任公司等千万元天使投资；于2014年11月获得达晨创投、IDG、Star VC联合投资，金额为6000万元；2015年5月，获得松禾资本、天奇阿米巴、时代伯乐投资，金额为2亿元人民币；2016年3月，获金砖资本、前海中金等C轮6亿投资。\r\n \r\n董事长胡震宇告诉36氪，本轮融资将持续用于激光电视的研发及拓展内容及渠道优势。此外，坚果此次在获得阿里的投资后，双方也将在技术及产品方面合作。据悉，后续阿里将与坚果进行AI技术上的深度合作，通过与天猫精灵智能音箱的互联，实现以语音控制实现更大范围的家居智能化。', '2019-05-18 00:00:00', '新闻'), ('20', '基于状态检修模式下探析变电检修技术的研究', '3', '5', '摘要：随着时代的进步和发展，传统的变电检修模式在实践过程中逐渐暴露出来了一系列的问题和不足，严重影响到供电企业效益的提升和社会的和谐发展。针对这种情况，可以应用状态检修技术，结合电力设备的运行状况，开展检修工作，降低设备的运行管理成本，使电网能够更加安全、可靠地运行。本文对基于状态检修模式下探析变电检修技术进行研究。\r\n        关键词：状态检修模式；变电检修技术\r\n        随着我国经济水平的不断发展，各行各业的用电需求日趋增长的情况下。状态检修模式在变电检修技术中的应用取得了很好的实践效果。因此，变电检修工作人员，必须充分掌握状态检修的原理和技术，并加强检修过程中的要点控制，确保状态检修发挥出最佳的效果，最终促进电力企业的快速发展，确保电力系统的安全稳定运行。\r\n        1变电检修技术的发展现状\r\n        1.1变电检修技术的发展历程\r\n        变电检修技术的发展历程主要有预防检修和时候检修模式两个阶段。事后检修模式主要是变电技术设备运行过程中出现了各种功能性故障，造成变电设备的正常运行受到阻碍，继而对对检修工作做出相应的安排。在大量的实践中证明，事后检修', '2019-05-18 00:00:00', '期刊'), ('21', '变电运行中倒闸危险点预控技术', '3', '5', ' 摘要：变电运行倒闸操作是指电气设备由一种状态转换为另一种状态，或由一种运行方式转变为另一种运行方式的一系列有序的操作。正确地进行倒闸操作直接关系到电网、设备和人身安全，影响到供电的可靠性，影响到国民经济的发展与社会稳定。因此，分析倒闸操作中的主要危险点，完善其控制措施，已成为防范误操作事故和人身伤害、设备损坏事故，保证电网安全、稳定运行的重要举措。因此，本文对变电运行中倒闸危险点预控技术进行分析。\r\n        关键词：变电运行；倒闸；危险点；预控技术\r\n        在电力企业的生产经营中，安全是一切的基础与重中之重，这就要求电力管理与操作人员更加注重危险点预控工作，工作人员对于设备操作的环境、性能、操作等方面，都存在着一定的危险点。作为电气运行工作人员，应当强化危险点预控，提高安全生产系数，其中预控倒闸操作中的危险点是重要的方面。\r\n        1倒闸操作危险点控制的重要性\r\n        变电站的倒闸操作是在电网运行中不可缺少的重要技术措施，其操作的优劣将直接影响电网的运行安全。电网输变电设施的维护与电网运行方式的改变都需要利用倒闸来实现。实践中，倒闸的过程中在对不同的设备', '2019-05-18 00:00:00', '期刊来源'), ('22', '智能电网继电保护技术分析 ', '3', '4', '摘要：智能电网将极大地改变传统电力系统的形态，各种新技术的应用对继电保护技术提出的新的要求，继电保护技术面临革命性的变化，运行方式的灵活和设备特性的变化都是对继电保护带来新的挑战。智能化电网是电力系统未来发展的必然趋势，必须积极关注、研究和推广继电保护技术，以更好地发挥“坚强智能电网”的作用。本文对智能电网继电保护技术进行分析。\r\n        关键词：智能电网；继电保护技术；分析\r\n        对于智能电网来说，继电保护装置是维护其安全稳定运行的基础和关键，继电保护装置起着将电网故障与电力控制系统隔离、防止事故扩大的作用。因此，对智能电网时代的继电保护技术进行探讨和分析，可以为我国智能电网的安全运行和建设提供基础和保障，使得我国继电保护管理水平的总体工作目标得到进一步提升，为我国智能电网的建设和铺垫工作提供基础和保障。\r\n        1概述\r\n        1.1智能电网的含义\r\n        智能电网又被称之为“电网2.0”，指的是电网的智能化。智能电网的建立前提是通信网络实现了双向的集成与高速，且得到了较为先进的各方面技术（如，先进的设备技术、控制方法、决策支持系统以及传感与', '2019-05-18 00:00:00', '期刊网来源'), ('23', '配网生产抢修指挥支撑技术的应用探析', '3', '5', '摘要：随着电网信息化建设的持续投入，电网公司的电力生产能力和应用范围不断扩大，电力业务系统也转向了以计算机，自动控制和现代通信技术为基础的计算机网络和自动化，为电力作业、管理、维护提供了数据支持。并且配网自动化进程的不断深化，也是实时监控配电网状态，建立配网生产抢修指挥平台的基础，对于提升供电可靠性和服务水平具有重要意义。因此，本文对配网生产抢修指挥支撑技术的应用进行分析探讨。\r\n        关键词：配网生产；抢修指挥支撑技术；应用\r\n        “配网”即配电网的简称，在整个电力网络中起到分配电能的作用，将电流与相关用户连接起来，在供电过程中起到至关重要的作用。配网在其工作运行中会受到周遭因素的影响，导致产生故障而不能正常供电，最终导致用户用电体验大打折扣，并且严重情况下还会给电力供应企业带来严重的经济损失。由此可见，及时发现配网中的故障因素，并采取相关措施予以排除，不仅能减少供电企业的经济损失，还能为用电者谋取福利，提供更优化的用电体验。\r\n        1配网生产抢修指挥支撑技术平台的必要性\r\n        当前，我国电力系统正处于高速发展中，建立完善的配网生产抢修指挥平台，', '2019-05-18 00:00:00', '网络'), ('24', '电力系统变电运行技术问题及解决对策', '3', '5', ' 摘要：随着我国电力系统技术的不断发展，变电运行技术也应不断的革新发展，才能保证变电运行技术的安全，减少故障发生的可能性。当然，在变电运行技术当中还是会经常遇见各种各样的问题，这种时候就需要对所发生的问题进行科学性的分析，从而找到解决的方法。本文对电力系统变电运行技术问题及解决对策进行分析。\r\n        关键词：电力系统；变电运行技术；问题；解决对策\r\n        随着科学技术的发展和自动化水平的提升，设备的运行效率不断提高，社会生产生活对电能的需求量也逐渐增加。电力系统变电运行技术作为电能供应系统的重要组成部分，为了满足不断增长的电能需求，需要对其进行深入的研究。本文主要阐述了变电运行技术实施过程中存在的问题，并针对这些问题提出相应的解决办法。\r\n        1变电运行技术概述\r\n        就目前而言，由于我国经济的持续发展，人们的生产以及生活对于电力资源的需求也日益增长，促进了电力工程的建设。为了确保电力系统系统的安全运行，变电运行技术得到了广泛的应用。电力系统当中的变电运行技术主要指的是在上级主管单位部门的指令之下，加强对各个电力站点内部设备运行的管理，并通过指令使得', '2019-05-18 00:00:00', '网络录入');
COMMIT;

-- ----------------------------
--  Table structure for `tb_literatureType`
-- ----------------------------
DROP TABLE IF EXISTS `tb_literatureType`;
CREATE TABLE `tb_literatureType` (
  `typeId` int(100) NOT NULL AUTO_INCREMENT COMMENT '文献类目ID',
  `typeName` varchar(255) DEFAULT NULL COMMENT '文献类目名称',
  `typeCreateTime` datetime DEFAULT NULL COMMENT '文献类目创建时间',
  PRIMARY KEY (`typeId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='文献类目表';

-- ----------------------------
--  Records of `tb_literatureType`
-- ----------------------------
BEGIN;
INSERT INTO `tb_literatureType` VALUES ('1', '文学', '2019-04-04 23:41:53'), ('2', '计算机', '2019-04-04 23:42:02'), ('3', '物理', '2019-04-04 23:42:14'), ('4', '生物', '2019-04-04 23:42:23'), ('5', '化学', '2019-04-04 23:42:35'), ('6', '医学', '2019-04-04 23:42:42');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;

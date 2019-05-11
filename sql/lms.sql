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

 Date: 05/11/2019 12:52:09 PM
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
INSERT INTO `QRTZ_SCHEDULER_STATE` VALUES ('RuoyiScheduler', 'localhost1557549069726', '1557550317822', '15000');
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
INSERT INTO `QRTZ_TRIGGERS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', null, '1557549070000', '-1', '5', 'PAUSED', 'CRON', '1557549069000', '0', null, '2', ''), ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', null, '1557549080000', '-1', '5', 'PAUSED', 'CRON', '1557549069000', '0', null, '2', '');
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
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8 COMMENT='系统访问记录';

-- ----------------------------
--  Records of `sys_logininfor`
-- ----------------------------
BEGIN;
INSERT INTO `sys_logininfor` VALUES ('100', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-04-04 21:24:29'), ('101', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-04-04 22:03:47'), ('102', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '1', '验证码错误', '2019-04-04 22:17:13'), ('103', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-04-04 22:17:16'), ('104', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-04-04 22:43:42'), ('105', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-04-04 23:07:09'), ('106', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-04-04 23:19:19'), ('107', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-04-04 23:21:40'), ('108', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-04-04 23:23:35'), ('109', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-04-04 23:30:03'), ('110', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-04-04 23:58:11'), ('111', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-04-05 00:04:33'), ('112', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-04-05 00:08:10'), ('113', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-04-05 01:12:53'), ('114', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-04-05 01:20:26'), ('115', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-04-05 14:01:21'), ('116', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '1', '验证码错误', '2019-04-05 14:05:13'), ('117', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '1', '验证码错误', '2019-04-05 14:05:17'), ('118', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '1', '验证码错误', '2019-04-05 14:05:22'), ('119', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-04-05 14:05:25'), ('120', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-04-05 14:20:03'), ('121', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '1', '验证码错误', '2019-04-05 14:23:01'), ('122', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-04-05 14:23:03'), ('123', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-05-01 21:49:57'), ('124', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-05-05 17:07:09'), ('125', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-05-11 12:19:32'), ('126', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-05-11 12:23:23'), ('127', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', '0', '登录成功', '2019-05-11 12:31:25');
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
INSERT INTO `sys_menu` VALUES ('1', '系统管理', '0', '1', '#', 'M', '0', '', 'fa fa-gear', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统管理目录'), ('2', '系统监控', '0', '2', '#', 'M', '0', '', 'fa fa-video-camera', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统监控目录'), ('3', '系统工具', '0', '3', '#', 'M', '0', '', 'fa fa-bars', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统工具目录'), ('100', '用户管理', '1', '1', '/system/user', 'C', '0', 'system:user:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户管理菜单'), ('101', '角色管理', '1', '2', '/system/role', 'C', '0', 'system:role:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '角色管理菜单'), ('102', '菜单管理', '1', '3', '/system/menu', 'C', '0', 'system:menu:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单管理菜单'), ('103', '部门管理', '1', '4', '/system/dept', 'C', '0', 'system:dept:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '部门管理菜单'), ('104', '岗位管理', '1', '5', '/system/post', 'C', '0', 'system:post:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '岗位管理菜单'), ('105', '字典管理', '1', '6', '/system/dict', 'C', '0', 'system:dict:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '字典管理菜单'), ('106', '参数设置', '1', '7', '/system/config', 'C', '0', 'system:config:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '参数设置菜单'), ('107', '通知公告', '1', '8', '/system/notice', 'C', '0', 'system:notice:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知公告菜单'), ('108', '日志管理', '1', '9', '#', 'M', '0', '', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '日志管理菜单'), ('109', '在线用户', '2', '1', '/monitor/online', 'C', '0', 'monitor:online:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '在线用户菜单'), ('110', '定时任务', '2', '2', '/monitor/job', 'C', '0', 'monitor:job:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '定时任务菜单'), ('111', '数据监控', '2', '3', '/monitor/data', 'C', '0', 'monitor:data:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '数据监控菜单'), ('112', '服务监控', '2', '3', '/monitor/server', 'C', '0', 'monitor:server:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '服务监控菜单'), ('113', '表单构建', '3', '1', '/tool/build', 'C', '0', 'tool:build:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '表单构建菜单'), ('114', '代码生成', '3', '2', '/tool/gen', 'C', '0', 'tool:gen:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '代码生成菜单'), ('115', '系统接口', '3', '3', '/tool/swagger', 'C', '0', 'tool:swagger:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统接口菜单'), ('500', '操作日志', '108', '1', '/monitor/operlog', 'C', '0', 'monitor:operlog:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作日志菜单'), ('501', '登录日志', '108', '2', '/monitor/logininfor', 'C', '0', 'monitor:logininfor:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录日志菜单'), ('1000', '用户查询', '100', '1', '#', 'F', '0', 'system:user:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1001', '用户新增', '100', '2', '#', 'F', '0', 'system:user:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1002', '用户修改', '100', '3', '#', 'F', '0', 'system:user:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1003', '用户删除', '100', '4', '#', 'F', '0', 'system:user:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1004', '用户导出', '100', '5', '#', 'F', '0', 'system:user:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1005', '用户导入', '100', '6', '#', 'F', '0', 'system:user:import', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1006', '重置密码', '100', '7', '#', 'F', '0', 'system:user:resetPwd', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1007', '角色查询', '101', '1', '#', 'F', '0', 'system:role:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1008', '角色新增', '101', '2', '#', 'F', '0', 'system:role:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1009', '角色修改', '101', '3', '#', 'F', '0', 'system:role:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1010', '角色删除', '101', '4', '#', 'F', '0', 'system:role:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1011', '角色导出', '101', '5', '#', 'F', '0', 'system:role:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1012', '菜单查询', '102', '1', '#', 'F', '0', 'system:menu:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1013', '菜单新增', '102', '2', '#', 'F', '0', 'system:menu:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1014', '菜单修改', '102', '3', '#', 'F', '0', 'system:menu:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1015', '菜单删除', '102', '4', '#', 'F', '0', 'system:menu:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1016', '部门查询', '103', '1', '#', 'F', '0', 'system:dept:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1017', '部门新增', '103', '2', '#', 'F', '0', 'system:dept:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1018', '部门修改', '103', '3', '#', 'F', '0', 'system:dept:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1019', '部门删除', '103', '4', '#', 'F', '0', 'system:dept:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1020', '岗位查询', '104', '1', '#', 'F', '0', 'system:post:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1021', '岗位新增', '104', '2', '#', 'F', '0', 'system:post:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1022', '岗位修改', '104', '3', '#', 'F', '0', 'system:post:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1023', '岗位删除', '104', '4', '#', 'F', '0', 'system:post:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1024', '岗位导出', '104', '5', '#', 'F', '0', 'system:post:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1025', '字典查询', '105', '1', '#', 'F', '0', 'system:dict:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1026', '字典新增', '105', '2', '#', 'F', '0', 'system:dict:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1027', '字典修改', '105', '3', '#', 'F', '0', 'system:dict:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1028', '字典删除', '105', '4', '#', 'F', '0', 'system:dict:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1029', '字典导出', '105', '5', '#', 'F', '0', 'system:dict:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1030', '参数查询', '106', '1', '#', 'F', '0', 'system:config:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1031', '参数新增', '106', '2', '#', 'F', '0', 'system:config:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1032', '参数修改', '106', '3', '#', 'F', '0', 'system:config:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1033', '参数删除', '106', '4', '#', 'F', '0', 'system:config:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1034', '参数导出', '106', '5', '#', 'F', '0', 'system:config:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1035', '公告查询', '107', '1', '#', 'F', '0', 'system:notice:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1036', '公告新增', '107', '2', '#', 'F', '0', 'system:notice:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1037', '公告修改', '107', '3', '#', 'F', '0', 'system:notice:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1038', '公告删除', '107', '4', '#', 'F', '0', 'system:notice:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1039', '操作查询', '500', '1', '#', 'F', '0', 'monitor:operlog:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1040', '操作删除', '500', '2', '#', 'F', '0', 'monitor:operlog:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1041', '详细信息', '500', '3', '#', 'F', '0', 'monitor:operlog:detail', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1042', '日志导出', '500', '4', '#', 'F', '0', 'monitor:operlog:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1043', '登录查询', '501', '1', '#', 'F', '0', 'monitor:logininfor:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1044', '登录删除', '501', '2', '#', 'F', '0', 'monitor:logininfor:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1045', '日志导出', '501', '3', '#', 'F', '0', 'monitor:logininfor:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1046', '在线查询', '109', '1', '#', 'F', '0', 'monitor:online:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1047', '批量强退', '109', '2', '#', 'F', '0', 'monitor:online:batchForceLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1048', '单条强退', '109', '3', '#', 'F', '0', 'monitor:online:forceLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1049', '任务查询', '110', '1', '#', 'F', '0', 'monitor:job:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1050', '任务新增', '110', '2', '#', 'F', '0', 'monitor:job:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1051', '任务修改', '110', '3', '#', 'F', '0', 'monitor:job:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1052', '任务删除', '110', '4', '#', 'F', '0', 'monitor:job:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1053', '状态修改', '110', '5', '#', 'F', '0', 'monitor:job:changeStatus', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1054', '任务详细', '110', '6', '#', 'F', '0', 'monitor:job:detail', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1055', '任务导出', '110', '7', '#', 'F', '0', 'monitor:job:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1056', '生成查询', '114', '1', '#', 'F', '0', 'tool:gen:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('1057', '生成代码', '114', '2', '#', 'F', '0', 'tool:gen:code', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''), ('2000', '文献管理系统', '0', '0', '#', 'M', '0', null, 'fa fa-sticky-note', 'admin', '2019-04-04 22:38:53', '', null, ''), ('2001', '文献管理', '2000', '0', '/lms/literature', 'C', '0', 'lms:literature:view', '#', 'admin', '2019-04-04 22:52:14', 'admin', '2019-04-04 23:10:58', ''), ('2003', '文献类目管理', '2000', '1', '/lms/literaturetype', 'C', '0', 'lms:literaturetype:view', '#', 'admin', '2019-04-04 23:34:18', '', null, ''), ('2004', '文献作者管理', '2000', '2', '/lms/author', 'C', '0', 'lms:author:view', '#', 'admin', '2019-04-04 23:35:02', '', null, '');
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
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8 COMMENT='操作日志记录';

-- ----------------------------
--  Records of `sys_oper_log`
-- ----------------------------
BEGIN;
INSERT INTO `sys_oper_log` VALUES ('100', '代码生成', '8', 'com.ruoyi.project.tool.gen.controller.GenController.batchGenCode()', '1', 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"tb_author,tb_literatureType,tb_literature\"]}', '0', null, '2019-04-04 22:04:01'), ('101', '代码生成', '8', 'com.ruoyi.project.tool.gen.controller.GenController.batchGenCode()', '1', 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"tb_author,tb_literatureType,tb_literature\"]}', '0', null, '2019-04-04 22:33:39'), ('102', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"文献管理系统\"],\"url\":[\"\"],\"perms\":[\"\"],\"orderNum\":[\"0\"],\"icon\":[\"fa fa-sticky-note\"],\"visible\":[\"0\"]}', '0', null, '2019-04-04 22:38:53'), ('103', '代码生成', '8', 'com.ruoyi.project.tool.gen.controller.GenController.batchGenCode()', '1', 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"tb_author,tb_literatureType,tb_literature\"]}', '0', null, '2019-04-04 22:43:52'), ('104', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"文献管理\"],\"url\":[\"/lms/literature\"],\"perms\":[\"\"],\"orderNum\":[\"0\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-04-04 22:52:14'), ('105', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2001\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"文献管理\"],\"url\":[\"/lms/literature\"],\"perms\":[\"lms:literature:view\"],\"orderNum\":[\"0\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-04-04 22:53:48'), ('106', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2001\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"文献管理\"],\"url\":[\"/lms/literature\"],\"perms\":[\"lms:literature:view\"],\"orderNum\":[\"0\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-04-04 23:10:58'), ('107', '角色管理', '2', 'com.ruoyi.project.system.role.controller.RoleController.authDataScopeSave()', '1', 'admin', '研发部门', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\"roleId\":[\"1\"],\"roleName\":[\"管理员\"],\"roleKey\":[\"admin\"],\"dataScope\":[\"1\"],\"deptIds\":[\"\"]}', '0', null, '2019-04-04 23:13:36'), ('108', '文献', '1', 'com.ruoyi.project.system.literature.controller.LiteratureController.addSave()', '1', 'admin', '研发部门', '/lms/literature/add', '127.0.0.1', '内网IP', '{\"literatureTitle\":[\"测试文献\"],\"literatureTypeId\":[\"2\"],\"literatureAuthorId\":[\"1\"],\"literatureContent\":[\"我爱你我爱你我爱你\"],\"literatureCreateTime\":[\"\"],\"literatureStatus\":[\"1\"]}', '0', null, '2019-04-04 23:30:38'), ('109', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"文献类目管理\"],\"url\":[\"/lms/literaturetype\"],\"perms\":[\"lms:literaturetype:view\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-04-04 23:33:24'), ('110', '菜单管理', '3', 'com.ruoyi.project.system.menu.controller.MenuController.remove()', '1', 'admin', '研发部门', '/system/menu/remove/2002', '127.0.0.1', '内网IP', '{}', '0', null, '2019-04-04 23:33:49'), ('111', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"文献类目管理\"],\"url\":[\"/lms/literaturetype\"],\"perms\":[\"lms:literaturetype:view\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-04-04 23:34:18'), ('112', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"文献作者管理\"],\"url\":[\"/lms/author\"],\"perms\":[\"lms:author:view\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2019-04-04 23:35:02'), ('113', '文献', '1', 'com.ruoyi.project.system.literature.controller.LiteratureController.addSave()', '1', 'admin', '研发部门', '/lms/literature/add', '127.0.0.1', '内网IP', '{\"literatureTitle\":[\"测试文献2\"],\"literatureTypeId\":[\"1\"],\"literatureAuthorId\":[\"1\"],\"literatureContent\":[\"测试文献2\"],\"literatureCreateTime\":[\"2019-04-03\"],\"literatureStatus\":[\"1\"]}', '0', null, '2019-04-05 14:02:09'), ('114', '作者', '1', 'com.ruoyi.project.system.author.controller.AuthorController.addSave()', '1', 'admin', '研发部门', '/lms/author/add', '127.0.0.1', '内网IP', '{\"authorName\":[\"张三\"],\"anthorSynopsis\":[\"测试\"],\"authorCreateTime\":[\"\"]}', '0', null, '2019-04-05 14:07:26'), ('115', '作者', '1', 'com.ruoyi.project.system.author.controller.AuthorController.addSave()', '1', 'admin', '研发部门', '/lms/author/add', '127.0.0.1', '内网IP', '{\"authorName\":[\"李四\"],\"anthorSynopsis\":[\"测试\"],\"authorCreateTime\":[\"\"]}', '0', null, '2019-04-05 14:07:37'), ('116', '文献', '1', 'com.ruoyi.project.system.literature.controller.LiteratureController.addSave()', '1', 'admin', '研发部门', '/lms/literature/add', '127.0.0.1', '内网IP', '{\"literatureTitle\":[\"计算机测试\"],\"literatureTypeId\":[\"2\"],\"literatureAuthorId\":[\"2\"],\"literatureContent\":[\"测试测试\"],\"literatureCreateTime\":[\"2019-04-05\"],\"literatureStatus\":[\"2\"]}', '0', null, '2019-04-05 14:23:33'), ('117', '文献类目', '3', 'com.ruoyi.project.system.literaturetype.controller.LiteraturetypeController.remove()', '1', 'admin', '研发部门', '/lms/literaturetype/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"2\"]}', '0', null, '2019-05-11 12:19:43'), ('118', '文献', '1', 'com.ruoyi.project.system.literature.controller.LiteratureController.addSave()', '1', 'admin', '研发部门', '/lms/literature/add', '127.0.0.1', '内网IP', '{\"literatureTitle\":[\"111111\"],\"literatureTypeId\":[\"3\"],\"literatureAuthorId\":[\"1\"],\"literatureContent\":[\"11111\"],\"literatureCreateTime\":[\"2019-05-11\"],\"literatureStatus\":[\"111\"]}', '0', null, '2019-05-11 12:23:51'), ('119', '文献', '2', 'com.ruoyi.project.system.literature.controller.LiteratureController.editSave()', '1', 'admin', '研发部门', '/lms/literature/edit', '127.0.0.1', '内网IP', '{\"literatureId\":[\"4\"],\"literatureTitle\":[\"111111\"],\"literatureContent\":[\"222222\"],\"literatureCreateTime\":[\"Sat May 11 00:00:00 CST 2019\"],\"literatureStatus\":[\"111\"]}', '0', null, '2019-05-11 12:23:57'), ('120', '文献', '2', 'com.ruoyi.project.system.literature.controller.LiteratureController.editSave()', '1', 'admin', '研发部门', '/lms/literature/edit', '127.0.0.1', '内网IP', '{\"literatureId\":[\"1\"],\"literatureTitle\":[\"测试文献\"],\"literatureContent\":[\"我爱你我爱你我爱你11111\"],\"literatureCreateTime\":[\"Thu Apr 04 23:43:13 CST 2019\"],\"literatureStatus\":[\"1\"]}', '0', null, '2019-05-11 12:31:45'), ('121', '文献类目', '3', 'com.ruoyi.project.system.literaturetype.controller.LiteraturetypeController.remove()', '1', 'admin', '研发部门', '/lms/literaturetype/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"7\"]}', '0', null, '2019-05-11 12:32:04'), ('122', '文献类目', '3', 'com.ruoyi.project.system.literaturetype.controller.LiteraturetypeController.remove()', '1', 'admin', '研发部门', '/lms/literaturetype/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"2\"]}', '0', null, '2019-05-11 12:32:06'), ('123', '文献类目', '3', 'com.ruoyi.project.system.literaturetype.controller.LiteraturetypeController.remove()', '1', 'admin', '研发部门', '/lms/literaturetype/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"2\"]}', '0', null, '2019-05-11 12:32:10');
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
INSERT INTO `sys_role` VALUES ('1', '管理员', 'admin', '1', '1', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2019-04-04 23:13:36', '管理员'), ('2', '普通角色', 'common', '2', '2', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '普通角色');
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
--  Records of `sys_role_dept`
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_dept` VALUES ('2', '100'), ('2', '101'), ('2', '105');
COMMIT;

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
INSERT INTO `sys_role_menu` VALUES ('2', '1'), ('2', '2'), ('2', '3'), ('2', '100'), ('2', '101'), ('2', '102'), ('2', '103'), ('2', '104'), ('2', '105'), ('2', '106'), ('2', '107'), ('2', '108'), ('2', '109'), ('2', '110'), ('2', '111'), ('2', '112'), ('2', '113'), ('2', '114'), ('2', '115'), ('2', '500'), ('2', '501'), ('2', '1000'), ('2', '1001'), ('2', '1002'), ('2', '1003'), ('2', '1004'), ('2', '1005'), ('2', '1006'), ('2', '1007'), ('2', '1008'), ('2', '1009'), ('2', '1010'), ('2', '1011'), ('2', '1012'), ('2', '1013'), ('2', '1014'), ('2', '1015'), ('2', '1016'), ('2', '1017'), ('2', '1018'), ('2', '1019'), ('2', '1020'), ('2', '1021'), ('2', '1022'), ('2', '1023'), ('2', '1024'), ('2', '1025'), ('2', '1026'), ('2', '1027'), ('2', '1028'), ('2', '1029'), ('2', '1030'), ('2', '1031'), ('2', '1032'), ('2', '1033'), ('2', '1034'), ('2', '1035'), ('2', '1036'), ('2', '1037'), ('2', '1038'), ('2', '1039'), ('2', '1040'), ('2', '1041'), ('2', '1042'), ('2', '1043'), ('2', '1044'), ('2', '1045'), ('2', '1046'), ('2', '1047'), ('2', '1048'), ('2', '1049'), ('2', '1050'), ('2', '1051'), ('2', '1052'), ('2', '1053'), ('2', '1054'), ('2', '1055'), ('2', '1056'), ('2', '1057');
COMMIT;

-- ----------------------------
--  Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
--  Records of `sys_user`
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES ('1', '103', 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '29c67a30398638269fe600f73a054934', '111111', '0', '0', '127.0.0.1', '2019-05-11 12:31:26', 'admin', '2018-03-16 11:33:00', 'ry', '2019-05-11 12:31:25', '管理员'), ('2', '105', 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '8e6d98b90472783cc73c17047ddccf36', '222222', '0', '0', '127.0.0.1', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '测试员');
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
INSERT INTO `sys_user_online` VALUES ('81d348d7-8d96-40f1-895b-0e8b77bec162', 'admin', '研发部门', '127.0.0.1', '内网IP', 'Chrome', 'Mac OS X', 'on_line', '2019-05-11 12:31:20', '2019-05-11 12:31:26', '1800000');
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
INSERT INTO `sys_user_role` VALUES ('1', '1'), ('2', '2');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='作者表';

-- ----------------------------
--  Records of `tb_author`
-- ----------------------------
BEGIN;
INSERT INTO `tb_author` VALUES ('1', '武琦川', '15级软件三班', '2019-04-04 23:41:28'), ('2', '张三', '测试', null), ('3', '李四', '测试', null);
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
  `literatureStatus` int(100) DEFAULT NULL COMMENT '文献状态',
  PRIMARY KEY (`literatureId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='文献表';

-- ----------------------------
--  Records of `tb_literature`
-- ----------------------------
BEGIN;
INSERT INTO `tb_literature` VALUES ('1', '测试文献', '1', '1', '我爱你我爱你我爱你11111', '2019-04-04 23:43:13', '1'), ('2', '测试文献2', '1', '1', '测试文献2', '2019-04-03 00:00:00', '1'), ('3', '计算机测试', '2', '2', '测试测试', '2019-04-05 00:00:00', '2'), ('4', '111111', '3', '1', '222222', '2019-05-11 00:00:00', '111');
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='文献类目表';

-- ----------------------------
--  Records of `tb_literatureType`
-- ----------------------------
BEGIN;
INSERT INTO `tb_literatureType` VALUES ('1', '文学', '2019-04-04 23:41:53'), ('2', '计算机', '2019-04-04 23:42:02'), ('3', '物理', '2019-04-04 23:42:14'), ('4', '生物', '2019-04-04 23:42:23'), ('5', '化学', '2019-04-04 23:42:35'), ('6', '医学', '2019-04-04 23:42:42');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;

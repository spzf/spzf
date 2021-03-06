/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.6.28 : Database - spzf
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`spzf` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `spzf`;

/*Table structure for table `tbl_privilege_acl` */

DROP TABLE IF EXISTS `tbl_privilege_acl`;

CREATE TABLE `tbl_privilege_acl` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL,
  `release_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '来源id',
  `release_sn` varchar(10) COLLATE utf8_bin DEFAULT 'role' COMMENT '来源标示role标示角色user 标示用户',
  `system_sn` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '系统标示',
  `module_id` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '模块id',
  `module_sn` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '模块标示',
  `acl_state` int(32) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `creator` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `updator` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '更新人',
  `del_flag` int(1) DEFAULT '1' COMMENT '删除标识：0：删除 1：存在',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `tbl_privilege_department` */

DROP TABLE IF EXISTS `tbl_privilege_department`;

CREATE TABLE `tbl_privilege_department` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL,
  `name` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
  `note` varchar(80) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `pid` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '父id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `creator` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `updator` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '更新人',
  `del_flag` int(1) DEFAULT '1' COMMENT '删除标识0表示删除1表示存在',
  `leader` int(1) DEFAULT '0' COMMENT '是否是leader1:是 0：不是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `tbl_privilege_dictionary` */

DROP TABLE IF EXISTS `tbl_privilege_dictionary`;

CREATE TABLE `tbl_privilege_dictionary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '编码',
  `name` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
  `pcode` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '父编码',
  `system_sn` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '系统标识',
  `sn` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '标识',
  `order_no` int(11) DEFAULT NULL COMMENT '排序号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `tbl_privilege_icsystem` */

DROP TABLE IF EXISTS `tbl_privilege_icsystem`;

CREATE TABLE `tbl_privilege_icsystem` (
  `id` varchar(40) COLLATE utf8_bin NOT NULL,
  `name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
  `sn` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '系统标示',
  `url` varchar(60) COLLATE utf8_bin DEFAULT NULL COMMENT '系统url前缀',
  `image` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '系统的图标',
  `note` varchar(80) COLLATE utf8_bin DEFAULT NULL COMMENT '系统备注',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `creator` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `updator` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '更新人',
  `del_flag` int(1) DEFAULT '1' COMMENT '删除标识0：删除1：存在',
  `order_no` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sn_unique_index` (`sn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `tbl_privilege_login_log` */

DROP TABLE IF EXISTS `tbl_privilege_login_log`;

CREATE TABLE `tbl_privilege_login_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '访问ip',
  `operation_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '操作人id',
  `operation_username` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '操作人的姓名',
  `operation_person` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '操作人姓名',
  `operation_content` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '操作内容',
  `operation_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=230 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `tbl_privilege_module` */

DROP TABLE IF EXISTS `tbl_privilege_module`;

CREATE TABLE `tbl_privilege_module` (
  `id` varchar(40) COLLATE utf8_bin NOT NULL,
  `name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
  `url` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '链接',
  `sn` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '标识',
  `state` int(10) DEFAULT NULL COMMENT '存放该模块有哪些权限值可选',
  `image` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '图片路径',
  `order_no` int(5) DEFAULT NULL COMMENT '模块的排序号',
  `pid` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '父模块id',
  `system_id` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '系统id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `creator` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `updator` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '更新人',
  `del_flag` int(1) DEFAULT '1' COMMENT '删除标识0:删除1：存在',
  PRIMARY KEY (`id`),
  UNIQUE KEY `system_module_sn_index` (`sn`,`system_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `tbl_privilege_pvalue` */

DROP TABLE IF EXISTS `tbl_privilege_pvalue`;

CREATE TABLE `tbl_privilege_pvalue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `system_id` varchar(40) DEFAULT NULL COMMENT '系统id',
  `position` int(3) DEFAULT NULL COMMENT '整型的位',
  `name` varchar(32) DEFAULT NULL COMMENT '名称',
  `order_no` int(11) DEFAULT NULL COMMENT '排序号',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` varchar(32) DEFAULT NULL,
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updator` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=211 DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_privilege_role` */

DROP TABLE IF EXISTS `tbl_privilege_role`;

CREATE TABLE `tbl_privilege_role` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL,
  `name` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
  `sn` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '标识',
  `note` varchar(80) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `creator` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `updator` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '更新人',
  `del_flag` int(1) DEFAULT '1' COMMENT '删除标识0：删除 1：存在',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `tbl_privilege_session_data` */

DROP TABLE IF EXISTS `tbl_privilege_session_data`;

CREATE TABLE `tbl_privilege_session_data` (
  `session_id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT 'sessionId',
  `user_info` text COLLATE utf8_bin COMMENT '用户信息',
  `acls_info` text COLLATE utf8_bin COMMENT '权限列表',
  `other_info` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '其他的信息',
  `creation_time` bigint(20) DEFAULT NULL COMMENT 'session时间戳',
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `tbl_privilege_shortcut_menu` */

DROP TABLE IF EXISTS `tbl_privilege_shortcut_menu`;

CREATE TABLE `tbl_privilege_shortcut_menu` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL,
  `icon` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '图标',
  `url` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'url',
  `ic_system_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '系统id',
  `module_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '模块id',
  `order_no` int(11) DEFAULT NULL COMMENT '排序号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `tbl_privilege_system_config` */

DROP TABLE IF EXISTS `tbl_privilege_system_config`;

CREATE TABLE `tbl_privilege_system_config` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL,
  `config_name` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '配置名称',
  `config_sn` varchar(60) COLLATE utf8_bin DEFAULT NULL COMMENT '配置标示',
  `config_key` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '配置key',
  `config_value` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '配置key的value值',
  `remark` varchar(80) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `creator` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `updator` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '更新人',
  `del_flag` int(1) DEFAULT '1' COMMENT '删除标识0：删除1：存在',
  `config_order` int(2) DEFAULT NULL COMMENT '排序号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `config_key_unique` (`config_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `tbl_privilege_user` */

DROP TABLE IF EXISTS `tbl_privilege_user`;

CREATE TABLE `tbl_privilege_user` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL,
  `real_name` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '真实姓名',
  `username` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '用户名',
  `password` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '密码',
  `tel` varchar(15) COLLATE utf8_bin DEFAULT NULL COMMENT '电话',
  `phone` varchar(15) COLLATE utf8_bin DEFAULT NULL COMMENT '座机',
  `mobile` varchar(15) COLLATE utf8_bin DEFAULT NULL COMMENT '手机',
  `email` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '邮箱',
  `image` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '头像',
  `department_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '部门id',
  `sex` int(1) DEFAULT '0' COMMENT '性别 0标示男 1标示女  2',
  `address` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '地址',
  `fax` varchar(15) COLLATE utf8_bin DEFAULT NULL COMMENT '传真',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `creator` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `updator` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '更新人',
  `del_flag` int(1) DEFAULT '1' COMMENT '删除标识  0标识已删除   1标识未删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_index` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `tbl_privilege_user_role` */

DROP TABLE IF EXISTS `tbl_privilege_user_role`;

CREATE TABLE `tbl_privilege_user_role` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL,
  `user_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '用户id',
  `role_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '角色id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `creator` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `updator` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '更新人',
  `del_flag` int(1) DEFAULT '1' COMMENT '删除标识0：删除1：存在',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `tbl_privilege_user_system` */

DROP TABLE IF EXISTS `tbl_privilege_user_system`;

CREATE TABLE `tbl_privilege_user_system` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL,
  `user_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '用户id',
  `system_id` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '系统id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `creator` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `updator` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '更新人',
  `del_flag` int(1) DEFAULT '1' COMMENT '删除标识0:删除1：存在',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

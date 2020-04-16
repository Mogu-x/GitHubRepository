/*
Navicat MySQL Data Transfer

Source Server         : 123@xu
Source Server Version : 50515
Source Host           : localhost:3306
Source Database       : minuteclinic

Target Server Type    : MYSQL
Target Server Version : 50515
File Encoding         : 65001

Date: 2020-04-16 13:29:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_consultation`
-- ----------------------------
DROP TABLE IF EXISTS `t_consultation`;
CREATE TABLE `t_consultation` (
  `consultationid` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `reply` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`consultationid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_consultation
-- ----------------------------
INSERT INTO `t_consultation` VALUES ('1', '头痛，咳嗽，犯困', '1', '吃感冒药');
INSERT INTO `t_consultation` VALUES ('2', 'asd', '4', '吃药，看医生');
INSERT INTO `t_consultation` VALUES ('3', '犯困', '5', '睡觉');
INSERT INTO `t_consultation` VALUES ('4', null, '6', null);
INSERT INTO `t_consultation` VALUES ('5', null, '7', null);

-- ----------------------------
-- Table structure for `t_dept`
-- ----------------------------
DROP TABLE IF EXISTS `t_dept`;
CREATE TABLE `t_dept` (
  `deptid` int(11) NOT NULL AUTO_INCREMENT,
  `deptname` varchar(255) DEFAULT NULL,
  `deptcontent` varchar(255) NOT NULL,
  `userid` int(11) NOT NULL,
  `hospital` int(11) NOT NULL,
  PRIMARY KEY (`deptid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_dept
-- ----------------------------
INSERT INTO `t_dept` VALUES ('1', '手术部', '做手术', '2', '1');

-- ----------------------------
-- Table structure for `t_hospital`
-- ----------------------------
DROP TABLE IF EXISTS `t_hospital`;
CREATE TABLE `t_hospital` (
  `hospitalid` int(11) NOT NULL,
  `hospitalname` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `locacontent` varchar(255) NOT NULL,
  PRIMARY KEY (`hospitalid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_hospital
-- ----------------------------
INSERT INTO `t_hospital` VALUES ('1', '中医院', '安徽省芜湖市', '医院介绍');

-- ----------------------------
-- Table structure for `t_permission`
-- ----------------------------
DROP TABLE IF EXISTS `t_permission`;
CREATE TABLE `t_permission` (
  `permissionid` int(11) NOT NULL AUTO_INCREMENT,
  `permissionname` varchar(255) DEFAULT NULL,
  `permissioncode` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`permissionid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_permission
-- ----------------------------
INSERT INTO `t_permission` VALUES ('1', '用户查询', 'user:query');
INSERT INTO `t_permission` VALUES ('2', '用户询诊', 'user:consultation');
INSERT INTO `t_permission` VALUES ('3', '用户修改', 'user:update');
INSERT INTO `t_permission` VALUES ('4', '用户删除', 'user:delete');
INSERT INTO `t_permission` VALUES ('5', '导出用户', 'user:export');
INSERT INTO `t_permission` VALUES ('6', '医生回复', 'doctor:reply');

-- ----------------------------
-- Table structure for `t_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `roleid` int(11) NOT NULL AUTO_INCREMENT,
  `rolename` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`roleid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', '管理员');
INSERT INTO `t_role` VALUES ('2', '医生');
INSERT INTO `t_role` VALUES ('3', '普通用户');

-- ----------------------------
-- Table structure for `t_role_permission`
-- ----------------------------
DROP TABLE IF EXISTS `t_role_permission`;
CREATE TABLE `t_role_permission` (
  `roleid` int(11) NOT NULL,
  `permissionid` int(11) NOT NULL,
  PRIMARY KEY (`roleid`,`permissionid`),
  KEY `FK3mooe750wyp5w6pp7u40c9txa` (`permissionid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_role_permission
-- ----------------------------
INSERT INTO `t_role_permission` VALUES ('1', '1');
INSERT INTO `t_role_permission` VALUES ('1', '2');
INSERT INTO `t_role_permission` VALUES ('1', '3');
INSERT INTO `t_role_permission` VALUES ('1', '4');
INSERT INTO `t_role_permission` VALUES ('1', '5');
INSERT INTO `t_role_permission` VALUES ('1', '6');
INSERT INTO `t_role_permission` VALUES ('2', '1');
INSERT INTO `t_role_permission` VALUES ('2', '2');
INSERT INTO `t_role_permission` VALUES ('2', '3');
INSERT INTO `t_role_permission` VALUES ('2', '5');
INSERT INTO `t_role_permission` VALUES ('2', '6');
INSERT INTO `t_role_permission` VALUES ('3', '1');
INSERT INTO `t_role_permission` VALUES ('3', '2');
INSERT INTO `t_role_permission` VALUES ('3', '3');

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `sex` varchar(255) NOT NULL,
  `age` int(3) DEFAULT NULL,
  `tel` varchar(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'patient1', '男', '18', '12345678910', 'greatjsx@163.com', '123', null);
INSERT INTO `t_user` VALUES ('2', '张医生', '男', '38', '12345678910', 'greatjsx@163.com', '123', null);
INSERT INTO `t_user` VALUES ('3', 'admin', '男', '28', '12345678910', 'greatjsx@163.com', '123', null);
INSERT INTO `t_user` VALUES ('4', 'patient2', '男', '18', '12433478', '2902175021@qq.com', '123', null);
INSERT INTO `t_user` VALUES ('5', 'patient3', '男', '38', '12345678910', 'greatjsx@163.com', '123', null);
INSERT INTO `t_user` VALUES ('6', 'p1', '女', '26', '12345678910', 'greatjsx@163.com', '123', null);
INSERT INTO `t_user` VALUES ('7', 'p11', '女', '30', '12345678910', 'greatjsx@163.com', '123', null);

-- ----------------------------
-- Table structure for `t_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role` (
  `userid` int(11) NOT NULL,
  `roleid` int(11) NOT NULL,
  PRIMARY KEY (`userid`,`roleid`),
  KEY `FK95nk6wg85uw7guf9g92ya8fuq` (`roleid`),
  CONSTRAINT `t_user_role_ibfk_1` FOREIGN KEY (`roleid`) REFERENCES `t_role` (`roleid`),
  CONSTRAINT `t_user_role_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `t_user` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES ('3', '1');
INSERT INTO `t_user_role` VALUES ('2', '2');
INSERT INTO `t_user_role` VALUES ('1', '3');
INSERT INTO `t_user_role` VALUES ('4', '3');
INSERT INTO `t_user_role` VALUES ('5', '3');
INSERT INTO `t_user_role` VALUES ('6', '3');
INSERT INTO `t_user_role` VALUES ('7', '3');

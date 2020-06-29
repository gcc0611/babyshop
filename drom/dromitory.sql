/*
Navicat MySQL Data Transfer

Source Server         : gc
Source Server Version : 80014
Source Host           : localhost:3306
Source Database       : dromitory

Target Server Type    : MYSQL
Target Server Version : 80014
File Encoding         : 65001

Date: 2019-06-24 14:52:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `admin_id` varchar(255) NOT NULL COMMENT '管理员id',
  `admin_name` varchar(255) NOT NULL,
  `admin_pwd` varchar(255) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('admin', 'admin', '123');

-- ----------------------------
-- Table structure for `billinfo`
-- ----------------------------
DROP TABLE IF EXISTS `billinfo`;
CREATE TABLE `billinfo` (
  `id` varchar(255) NOT NULL,
  `water` varchar(255) DEFAULT NULL,
  `elect` varchar(255) DEFAULT NULL,
  `money` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FKe5v7qmxpev6blbo0w209m4ctd` FOREIGN KEY (`id`) REFERENCES `drom` (`drom_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of billinfo
-- ----------------------------
INSERT INTO `billinfo` VALUES ('1', '25', '50', '140');
INSERT INTO `billinfo` VALUES ('2', '40', '80', '170');
INSERT INTO `billinfo` VALUES ('3', '30', '60', '120');

-- ----------------------------
-- Table structure for `class`
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class` (
  `class_id` varchar(11) NOT NULL,
  `class_name` varchar(255) DEFAULT NULL,
  `p_id` varchar(11) NOT NULL,
  PRIMARY KEY (`class_id`),
  KEY `FKd77bjg80u4qo3oblyonkff7xm` (`p_id`),
  CONSTRAINT `FKd77bjg80u4qo3oblyonkff7xm` FOREIGN KEY (`p_id`) REFERENCES `profession` (`p_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO `class` VALUES ('1', '网软1班', '1');
INSERT INTO `class` VALUES ('2', '网软2班', '1');
INSERT INTO `class` VALUES ('3', '网工1班', '2');
INSERT INTO `class` VALUES ('4', '网工2班', '1');

-- ----------------------------
-- Table structure for `college`
-- ----------------------------
DROP TABLE IF EXISTS `college`;
CREATE TABLE `college` (
  `college_id` varchar(11) NOT NULL,
  `college_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`college_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of college
-- ----------------------------
INSERT INTO `college` VALUES ('1', '信息工程学院');
INSERT INTO `college` VALUES ('2', '农学院');
INSERT INTO `college` VALUES ('3', '茶学院');
INSERT INTO `college` VALUES ('4', '外国语学院');

-- ----------------------------
-- Table structure for `drom`
-- ----------------------------
DROP TABLE IF EXISTS `drom`;
CREATE TABLE `drom` (
  `drom_id` varchar(11) NOT NULL,
  `drom_hao` varchar(255) NOT NULL,
  `drom_sex` varchar(255) NOT NULL,
  `drom_count` varchar(255) NOT NULL,
  PRIMARY KEY (`drom_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of drom
-- ----------------------------
INSERT INTO `drom` VALUES ('1', '3#617', '男', '6');
INSERT INTO `drom` VALUES ('2', '3#616', '男', '6');
INSERT INTO `drom` VALUES ('3', '2#502', '男', '6');
INSERT INTO `drom` VALUES ('4', '2#215', '男', '5');
INSERT INTO `drom` VALUES ('5', '4#111', '男', '5');

-- ----------------------------
-- Table structure for `message`
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `m_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `stu_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `m_title` varchar(255) NOT NULL,
  `create_time` timestamp NULL DEFAULT '2016-08-15 00:00:00',
  `content` varchar(255) NOT NULL,
  `reply` varchar(255) DEFAULT NULL,
  `rename` varchar(255) DEFAULT NULL,
  `retime` timestamp NULL DEFAULT '2018-08-08 00:00:00',
  PRIMARY KEY (`m_id`),
  KEY `FKg5qymkecfd8a9grbi7oxwfrkc` (`stu_id`),
  CONSTRAINT `FKg5qymkecfd8a9grbi7oxwfrkc` FOREIGN KEY (`stu_id`) REFERENCES `student` (`stu_id`),
  CONSTRAINT `stu_id` FOREIGN KEY (`stu_id`) REFERENCES `student` (`stu_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('2', '16141541136', '今晚有暴雨吗？', '2016-08-15 00:00:00', '天气阴了好几天了，快下雨了吧', '应该是的', 'admin', '2019-06-08 00:00:00');

-- ----------------------------
-- Table structure for `news`
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `news_id` varchar(255) NOT NULL,
  `news_title` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`news_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('1', '今天有暴雨！！', '2019-06-23 03:04:32');
INSERT INTO `news` VALUES ('2', '今天天气超级好，可以晒被子！！', '2019-06-23 03:03:52');
INSERT INTO `news` VALUES ('3', '今晚可能会停水停电，请提前做好准备', '2019-06-23 02:47:41');

-- ----------------------------
-- Table structure for `profession`
-- ----------------------------
DROP TABLE IF EXISTS `profession`;
CREATE TABLE `profession` (
  `p_id` varchar(11) NOT NULL,
  `p_name` varchar(255) DEFAULT NULL,
  `c_id` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`p_id`),
  KEY `FKn0p79l8b0s8j6mjde57si1tk3` (`c_id`),
  CONSTRAINT `FKn0p79l8b0s8j6mjde57si1tk3` FOREIGN KEY (`c_id`) REFERENCES `college` (`college_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of profession
-- ----------------------------
INSERT INTO `profession` VALUES ('1', '网络工程（软件开发）', '1');
INSERT INTO `profession` VALUES ('2', '网络工程', '1');

-- ----------------------------
-- Table structure for `repair`
-- ----------------------------
DROP TABLE IF EXISTS `repair`;
CREATE TABLE `repair` (
  `re_id` varchar(255) NOT NULL,
  `re_content` varchar(255) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `stu_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`re_id`),
  KEY `FKiadtogm7lbajk6k0ih70a0e3a` (`stu_id`),
  CONSTRAINT `FKiadtogm7lbajk6k0ih70a0e3a` FOREIGN KEY (`stu_id`) REFERENCES `student` (`stu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of repair
-- ----------------------------
INSERT INTO `repair` VALUES ('1', '床板坏了', '2019-06-20 05:41:47', '1', '16141541136');
INSERT INTO `repair` VALUES ('2', '厕所堵了', '2019-06-23 03:06:17', '0', '16141541136');
INSERT INTO `repair` VALUES ('3', '门锁坏了', '2019-06-11 19:14:12', '0', '16141541112');
INSERT INTO `repair` VALUES ('4', '门坏了', '2019-06-20 05:27:33', '0', '16141541112');

-- ----------------------------
-- Table structure for `student`
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `stu_id` varchar(255) NOT NULL,
  `stu_name` varchar(255) NOT NULL,
  `stu_pwd` varchar(255) NOT NULL,
  `stu_sex` int(1) DEFAULT '0',
  `class_id` varchar(11) NOT NULL,
  `drom_id` varchar(11) NOT NULL,
  PRIMARY KEY (`stu_id`),
  KEY `FKdwhkib64u47wc4yo4hk0cub90` (`class_id`),
  KEY `FKet7xati5yxj6u60am3ujfcmjy` (`drom_id`),
  CONSTRAINT `FKdwhkib64u47wc4yo4hk0cub90` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`),
  CONSTRAINT `FKet7xati5yxj6u60am3ujfcmjy` FOREIGN KEY (`drom_id`) REFERENCES `drom` (`drom_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1', '如花', '123', '1', '1', '1');
INSERT INTO `student` VALUES ('16141541112', '杨浩', '123', '0', '1', '1');
INSERT INTO `student` VALUES ('16141541135', '任华栋', '123', '1', '1', '1');
INSERT INTO `student` VALUES ('16141541136', '郭冲', '123', '1', '1', '2');
INSERT INTO `student` VALUES ('16141541137', '李双辉', '123', '0', '1', '1');
INSERT INTO `student` VALUES ('16141541138', '任世昌', '123', '1', '1', '1');
INSERT INTO `student` VALUES ('16141541142', '张占恒', '123', '0', '1', '1');
INSERT INTO `student` VALUES ('2', '隔壁老王', '1234', '1', '2', '2');
INSERT INTO `student` VALUES ('3', '小翠', '123', '0', '1', '1');

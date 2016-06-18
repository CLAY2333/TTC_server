/*
Navicat MySQL Data Transfer

Source Server         : LocalhostDB
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : taotaochi

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2016-05-20 18:32:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `passwd` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('17', '123123123', 'eqwe', '/static/mobile/icon/14617404462205_917280c08280fec5b4728836c72727e0.png');
INSERT INTO `account` VALUES ('18', 'bilibili', '2132132131', 'localhost/static/mobile/icon/14626095470174_55205bc2bd617fb0c83464b664fef0b9.png');
INSERT INTO `account` VALUES ('19', 'qqqqq你是奶等哈说开端是大神的', 'abdasndaskduasjndasd', 'localhost/static/mobile/icon/14626096906748_9b4d347ae1fab8232e825342ecc03b54.png');
INSERT INTO `account` VALUES ('20', '945641', '1561', 'localhost/static/mobile/icon/14626097411075_767572338ba94e03f168c55739fe4ba7.png');
INSERT INTO `account` VALUES ('21', '4515641561', '512654156', 'localhost/static/mobile/icon/14626097686422_05c232922d579dcf462507736a18f03d.png');
INSERT INTO `account` VALUES ('22', '12123123气温气温', '213123123', 'localhost/static/mobile/icon/14626097868604_37598c40608a5689a681df8b9a737be3.png');
INSERT INTO `account` VALUES ('23', '5555', '555555', 'localhost/static/mobile/icon/14626101830077_cfdb5368e3144eaf329f2b1fbb98ff9d.png');
INSERT INTO `account` VALUES ('24', '4恶趣味全文从', '2313213', 'localhost/static/mobile/icon/14626102952577_302d05f320c82a54aeb0d29e12b20dfb.png');
INSERT INTO `account` VALUES ('25', 'sadasdasdasdasd', '123123123', 'localhost/static/mobile/icon/14626103155522_6543c48105634bd98dfb7f952675cdd6.png');
INSERT INTO `account` VALUES ('26', 'qqqqq213213123123213', '123123123', 'localhost/static/mobile/icon/14626107873980_060345b402d737c6bed8b155bfb8376a.png');
INSERT INTO `account` VALUES ('27', 'qwer', 'qwer', 'localhost/static/mobile/icon/14626246894703_11650f1c01914045a9d4da77924f14cc.png');

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `userid` bigint(20) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `number` bigint(20) NOT NULL,
  `address` varchar(255) NOT NULL,
  `postcode` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES ('3', '3', '123', '123', '123', '123');
INSERT INTO `address` VALUES ('0', '21', '', '0', '', '0');
INSERT INTO `address` VALUES ('6', '32', 'yingrui', '123479', 'sichuan', '98654654');
INSERT INTO `address` VALUES ('6', '33', 'mary', '4588888769', 'newyork', '987464');
INSERT INTO `address` VALUES ('6', '34', 'mary', '4588888769', 'newyork', '987464');
INSERT INTO `address` VALUES ('6', '35', 'Tom', '1248655489', 'Boston', '156462');
INSERT INTO `address` VALUES ('6', '36', 'Tom', '1248655489', 'Boston', '156462');
INSERT INTO `address` VALUES ('6', '37', 'Tom', '1248655489', 'Boston', '156462');
INSERT INTO `address` VALUES ('6', '38', 'Tom', '1248655489', 'Boston', '156462');
INSERT INTO `address` VALUES ('0', '39', '', '0', '', '0');
INSERT INTO `address` VALUES ('0', '40', '', '0', '', '0');
INSERT INTO `address` VALUES ('0', '41', '', '0', '', '0');
INSERT INTO `address` VALUES ('8', '42', 'James', '956378266', 'Canada', '156248');
INSERT INTO `address` VALUES ('9', '52', 'James', '956378266', 'Canada', '156248');
INSERT INTO `address` VALUES ('9', '53', 'James', '956378266', 'Canada', '156248');
INSERT INTO `address` VALUES ('11', '54', 'gfdg', '657657', 'gfhgf4', '654765');
INSERT INTO `address` VALUES ('10', '55', 'LIN', '65945305', 'hfghj67', '6765786');
INSERT INTO `address` VALUES ('10', '56', 'LIN', '65945305', 'hfghj67', '6765786');
INSERT INTO `address` VALUES ('10', '71', 'LIN', '65945305', 'hfghj67', '6765786');
INSERT INTO `address` VALUES ('10', '72', 'LIN', '65945305', 'hfghj67', '6765786');
INSERT INTO `address` VALUES ('9', '73', 'Mac', '156456', 'yjhjgk', '678768');
INSERT INTO `address` VALUES ('9', '74', 'Mac', '156456', 'yjhjgk', '678768');
INSERT INTO `address` VALUES ('9', '75', 'Mac', '156456', 'yjhjgk', '678768');
INSERT INTO `address` VALUES ('13', '76', 'Jack', '6913257325', 'Sydny', '657432');
INSERT INTO `address` VALUES ('2', '77', 'yu', '123', 'qwe', '123');
INSERT INTO `address` VALUES ('2', '78', 'yu', '123', 'qwe', '123');
INSERT INTO `address` VALUES ('3', '79', 'liu', '1', 'lll', '1');
INSERT INTO `address` VALUES ('0', '80', 'liu', '1', 'lll', '1');
INSERT INTO `address` VALUES ('3', '81', 'asdasd', '213', 'sdjaodj', '213');
INSERT INTO `address` VALUES ('3', '82', 'asdasd', '213', 'sdjaodj', '213');
INSERT INTO `address` VALUES ('3', '83', 'eqwe', '123213', 'qewqweqw', '21321313');
INSERT INTO `address` VALUES ('3', '84', 'eqwe', '123213', 'qewqweqw', '21321313');
INSERT INTO `address` VALUES ('33', '85', 'Susan', '78794535893', 'Anhui', '8789545');

-- ----------------------------
-- Table structure for admanage
-- ----------------------------
DROP TABLE IF EXISTS `admanage`;
CREATE TABLE `admanage` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `pic` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of admanage
-- ----------------------------
INSERT INTO `admanage` VALUES ('33', '1312312', 'localhost/static/mobile/icon/14624566506842_7101ef9765a6096c8bf11fc459623b6e.png');
INSERT INTO `admanage` VALUES ('34', '213123812391283612903761283', 'localhost/static/mobile/icon/14625230855612_da282337fa7a819d4abf758e0ec483f7.png');
INSERT INTO `admanage` VALUES ('35', '123213123', 'localhost/static/mobile/icon/14626094431753_1bfc091ecbe6f3160d794dd82e9e975b.png');

-- ----------------------------
-- Table structure for goods_manage
-- ----------------------------
DROP TABLE IF EXISTS `goods_manage`;
CREATE TABLE `goods_manage` (
  `type` int(20) NOT NULL,
  `goods_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `goods_pic` varchar(255) NOT NULL,
  `goods_name` varchar(255) NOT NULL,
  `speci_number` int(20) NOT NULL,
  `speci_name1` varchar(255) NOT NULL,
  `goods_price1` float(20,2) NOT NULL,
  `speci_name2` varchar(255) DEFAULT NULL,
  `goods_price2` float(20,2) DEFAULT NULL,
  `goods_content` int(20) NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `goods_state` int(20) NOT NULL,
  PRIMARY KEY (`goods_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_manage
-- ----------------------------
INSERT INTO `goods_manage` VALUES ('1', '1', '2', '3', '4', '5', '6.00', '7', '8.00', '9', '10', '11');
INSERT INTO `goods_manage` VALUES ('1', '2', '2', '4', '4', '5', '6.00', '7', '9.00', '9', '10', '11');
INSERT INTO `goods_manage` VALUES ('1', '3', '2', '辉', '4', '5', '6.49', '7', '8.40', '9', '10', '11');
INSERT INTO `goods_manage` VALUES ('6', '4', '7', '笨', '2', '蛋', '1.00', '饭', '1.00', '2', '3', '4');

-- ----------------------------
-- Table structure for manager
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `passwd` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of manager
-- ----------------------------
INSERT INTO `manager` VALUES ('1', 'zhang', '123');

-- ----------------------------
-- Table structure for shop_inf
-- ----------------------------
DROP TABLE IF EXISTS `shop_inf`;
CREATE TABLE `shop_inf` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `accountid` bigint(20) NOT NULL,
  `city` varchar(255) NOT NULL,
  `local` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `shop_name` varchar(255) NOT NULL,
  `shop_type` int(20) NOT NULL,
  `manage_range` int(20) NOT NULL,
  `host_name` varchar(255) NOT NULL,
  `phone_number` int(20) NOT NULL,
  `deliver_type` int(20) NOT NULL,
  `account` int(20) NOT NULL,
  `rate` float(20,0) NOT NULL,
  `bank` bigint(20) DEFAULT NULL,
  `checked` int(20) NOT NULL,
  `longitude` bigint(20) DEFAULT NULL,
  `Latitude` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of shop_inf
-- ----------------------------
INSERT INTO `shop_inf` VALUES ('1', '0', 'hfut', 'adsad', 'asdasd', 'CLAY', '151', '1616', 'ninede', '1888888888', '3', '623035151', '11', null, '0', null, null);
INSERT INTO `shop_inf` VALUES ('2', '0', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', null, '0', null, null);
INSERT INTO `shop_inf` VALUES ('6', '0', 'shanghai', 'guangchang', 'lukou', 'jichang', '0', '1', '??', '2147483647', '3', '65554513', '13', '655224565', '-1', null, null);

-- ----------------------------
-- Table structure for shop_pic
-- ----------------------------
DROP TABLE IF EXISTS `shop_pic`;
CREATE TABLE `shop_pic` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `outdoor` varchar(255) NOT NULL,
  `indoor` varchar(255) NOT NULL,
  `business_licence` varchar(255) NOT NULL,
  `server_licence` varchar(255) NOT NULL,
  `other_licence` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of shop_pic
-- ----------------------------
INSERT INTO `shop_pic` VALUES ('1', '12', '13', '14', '15', '16');
INSERT INTO `shop_pic` VALUES ('2', '13', '14', '15', '16', '17');
INSERT INTO `shop_pic` VALUES ('6', '1', '2', '3', '4', '5');

-- ----------------------------
-- Procedure structure for Insert_admanage
-- ----------------------------
DROP PROCEDURE IF EXISTS `Insert_admanage`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insert_admanage`(IN `url` varchar(255),IN `pic` varchar(255))
BEGIN
DECLARE res INT;
DECLARE id BIGINT;
START TRANSACTION;
				 INSERT INTO admanage (`url`, `pic`)VALUES(`url`, `pic`);
         SET res = 0;
				 SET id = LAST_INSERT_ID();
COMMIT;
   SELECT res,id;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for Prgs_account_login
-- ----------------------------
DROP PROCEDURE IF EXISTS `Prgs_account_login`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Prgs_account_login`(IN `username` varchar(255),IN `passwd` varchar(255))
BEGIN
	DECLARE res INT;
  DECLARE id INT;
	START TRANSACTION;
	SELECT account.id INTO id FROM account WHERE account.`username` = `username` AND account.`passwd` = `passwd`;
	IF id IS NULL THEN
			SET res = -1;
	ELSE
			SET res = 0;
END IF;
	#IF EXISTS (SELECT * FROM account WHERE account.`name`=`username` AND account.`passwd`=`passwd`) THEN
			#SET res = 2;
	#ELSEIF EXISTS (SELECT * FROM account WHERE account.`name`=`username` AND account.`passwd`!=`passwd`)THEN
			#SET res = 1;
	#ELSE
			#SET res = 0;
#END IF;
COMMIT;
	SELECT res,id;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for Prgs_account_register
-- ----------------------------
DROP PROCEDURE IF EXISTS `Prgs_account_register`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Prgs_account_register`(IN `username` varchar(255), IN `passwd` varchar(255), IN `icon` varchar(255))
BEGIN
DECLARE res INT;
DECLARE id BIGINT;
START TRANSACTION;
     IF EXISTS (SELECT account.`id` FROM account WHERE account.`username` = `username`) THEN
         SET res = -1;
     ELSE
				 INSERT INTO account(`username`, `passwd`, `icon`) VALUES(`username`, `passwd`, `icon`);
         SET res = 0;
				 SET id = LAST_INSERT_ID();
		 END IF;
COMMIT;
   SELECT res, id;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for Prgs_account_update_info
-- ----------------------------
DROP PROCEDURE IF EXISTS `Prgs_account_update_info`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Prgs_account_update_info`(IN `id` bigint,IN `icon` varchar(255))
BEGIN
	
	DECLARE res INT;
START TRANSACTION;
	UPDATE account SET account.icon = `icon` WHERE account.id = `id`;
	SET res = 0;
COMMIT;
	SELECT res;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for Prgs_add_address
-- ----------------------------
DROP PROCEDURE IF EXISTS `Prgs_add_address`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Prgs_add_address`(IN `userid` bigint(20),IN `name` varchar(255),IN `number` bigint(20),IN `address` varchar(255),IN `postcode` bigint(20))
BEGIN
	#Routine body goes here...
	DECLARE res INT;
	DECLARE id BIGINT;
	#DECLARE userid INT;
	START TRANSACTION;
	INSERT INTO address(userid,name,number,address,postcode) VALUES (`userid`,`name`,`number`,`address`,`postcode`);
	IF (ROW_COUNT())THEN
	SET res = 0;
	SET id = LAST_INSERT_ID();
ELSE SET res= 1;
END IF;
	COMMIT;
	SELECT res,id;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for Prgs_adv_get
-- ----------------------------
DROP PROCEDURE IF EXISTS `Prgs_adv_get`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Prgs_adv_get`()
BEGIN
	#Routine body goes here...
	SELECT adv.adv_res, adv.adv_url FROM adv WHERE adv.id = 1;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for Prgs_adv_set
-- ----------------------------
DROP PROCEDURE IF EXISTS `Prgs_adv_set`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Prgs_adv_set`(IN `adv_res` varchar(255), IN `adv_url` varchar(255))
BEGIN
	#Routine body goes here...
	DECLARE res INT;
	SET res = 0;
	START TRANSACTION;
		UPDATE adv SET adv.adv_res=`adv_res` , adv.adv_url=`adv_url` WHERE adv.id=1;
	COMMIT;
	SELECT res;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for Prgs_business_examine
-- ----------------------------
DROP PROCEDURE IF EXISTS `Prgs_business_examine`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Prgs_business_examine`()
BEGIN
DECLARE res INT;

START TRANSACTION;
 SELECT * FROM shop_inf WHERE id=`id`;
	 SELECT * FROM shop_pic WHERE id=`id`;
#SELECT (SELECT * FROM shop_inf)+(SELECT * FROM shop_pic);
SET res=0;
COMMIT;
   SELECT res;
	
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for Prgs_delete_address
-- ----------------------------
DROP PROCEDURE IF EXISTS `Prgs_delete_address`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Prgs_delete_address`(IN `id` bigint)
BEGIN
   DECLARE res INT;
 START TRANSACTION;
    DELETE FROM address WHERE address.id=`id`;
    IF (ROW_COUNT()) THEN
		  SET res = 0 ;
    ELSE 
      SET res = -1;
    END IF ;
		SELECT res;
COMMIT;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for Prgs_email_login
-- ----------------------------
DROP PROCEDURE IF EXISTS `Prgs_email_login`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Prgs_email_login`(IN `emailaddr` varchar(255), IN `verifycode` varchar(255))
BEGIN
	declare res int;
	declare id bigint;
	declare weixin varchar(255);
	declare facebook varchar(255);
	declare email varchar(255);
  declare nickname varchar(255);
  declare point int;
start transaction;
	select account.id, account.weixin, account.facebook, account.email, account.nickname, account.point into id, weixin, facebook, email, nickname, point from account where account.email = `emailaddr`;
	if id is null then
		insert into account(weixin, facebook, email, nickname, point) values("", "", `emailaddr`, `verifycode`, 0);
		set id = LAST_INSERT_ID();
		set weixin = "";
		set facebook = "";
		set email = `emailaddr`;
		set nickname = `verifycode`;
		set point = 0;
	END IF;
	set res = 0;
COMMIT;
	SELECT res, id, weixin, facebook, email, nickname, point;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for Prgs_goods_manage
-- ----------------------------
DROP PROCEDURE IF EXISTS `Prgs_goods_manage`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Prgs_goods_manage`(IN `type`int,IN `goods_pic`varchar(255),IN `goods_name` varchar(255),IN `speci_number` int,IN `speci_name1`varchar(255),IN `goods_price1` float,IN `speci_name2` varchar(255),IN `goods_price2` float,IN `goods_content` int,IN `note` varchar(255),IN `goods_state` int)
BEGIN
	#Routine body goes here...
	DECLARE res INT;
	DECLARE id BIGINT;
START TRANSACTION;
IF EXISTS(SELECT goods_name FROM goods_manage WHERE goods_manage.goods_name = `goods_name`) THEN
	SET res = -1;
ELSE
	INSERT INTO goods_manage(type,goods_pic,goods_name,speci_number,speci_name1,goods_price1,speci_name2,goods_price2,goods_content,note,goods_state) VALUES (`type`,`goods_pic`,`goods_name`,`speci_number`,`speci_name1`,`goods_price1`,`speci_name2`,`goods_price2`,`goods_content`,`note`,`goods_state`);
		SET id = LAST_INSERT_ID();
		SET res = 0;
END IF;
SELECT res,id;
COMMIT;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for Prgs_login_account
-- ----------------------------
DROP PROCEDURE IF EXISTS `Prgs_login_account`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Prgs_login_account`(IN `username` varchar(255),IN `passwd` varchar(255))
BEGIN
DECLARE res INT;
START TRANSACTION;
     #IF EXISTS (SELECT * FROM account WHERE account.`name` = `username` and account.`password` = `passwd`) THEN
        #SET res = 1;
		# ELSEIF EXISTS (SELECT * FROM account WHERE account.`name` != `username`) THEN
				#	SET res = 2;
		# ELSEIF EXISTS (SELECT * FROM account WHERE account.`password` != `passwd` and  account.`name` = `username`) THEN
				#	SET res = 3;	
	IF  EXISTS(SELECT * FROM account WHERE account.`username`=`username`and account.`passwd` = `passwd`) THEN
	SET res=0;
	ELSE
	SET res=1;
	END IF;
	
#END IF;
COMMIT;
   SELECT res;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for Prgs_modify_address
-- ----------------------------
DROP PROCEDURE IF EXISTS `Prgs_modify_address`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Prgs_modify_address`(IN `name`varchar(255),IN `address`varchar(255),IN `number`bigint(20),IN `postcode`bigint(20), IN `id` bigint(20))
BEGIN
DECLARE res INT;
START TRANSACTION;
				 update address set name=`name`,address.number=`number`,address.address=`address`,address.postcode=`postcode` where address.id=`id`;
       IF (ROW_COUNT()) THEN
				 SET res = 0 ;
		   ELSE 
			  SET res = -1;
			 END IF ;
COMMIT;
   SELECT res;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for Prgs_shop_inf
-- ----------------------------
DROP PROCEDURE IF EXISTS `Prgs_shop_inf`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Prgs_shop_inf`(IN `accountid` bigint,IN `city` varchar(255),IN `local` varchar(255),IN `address` varchar(255),IN `shop_name` varchar(255),IN `shop_type` int,IN `manage_range` int,IN `host_name` varchar(255),IN `phone_number` bigint,IN `delivery_type` int,IN `account` bigint,IN `rate` float,IN `bank` bigint,IN `checked` int,IN `outdoor` varchar(255),IN `indoor` varchar(255),IN `business_licence` varchar(255),IN `server_licence` varchar(255),IN `other_licence` varchar(255))
BEGIN
	#Routine body goes here...
	DECLARE res INT;
	DECLARE id BIGINT;
START TRANSACTION;
	IF EXISTS(SELECT shop_inf.host_name FROM shop_inf WHERE shop_inf.shop_name = `shop_name`)THEN
	SET res = -1;
	ELSE
	INSERT INTO shop_inf (accountid,city,local,address,shop_name,shop_type,manage_range,host_name,phone_number,deliver_type,account,rate,bank,checked) VALUES (`accountid`,`city`,`local`,`address`,`shop_name`,`shop_type`,`manage_range`,`host_name`,`phone_number`,`delivery_type`,`account`,`rate`,`bank`,`checked`);
	INSERT INTO shop_pic (outdoor,indoor,business_licence,server_licence,other_licence) VALUES (`outdoor`,`indoor`,`business_licence`,`server_licence`,`other_licence`);
	SET id = LAST_INSERT_ID();
	SELECT shop_inf.accountid FROM shop_inf WHERE shop_inf.accountid = id +20160000;
	SET res = 0;
END IF;
	SELECT res,id;
COMMIT;
END
;;
DELIMITER ;

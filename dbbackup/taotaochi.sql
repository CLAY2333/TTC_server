/*
Navicat MySQL Data Transfer

Source Server         : kakasky
Source Server Version : 50528
Source Host           : kakasky.org:3306
Source Database       : taotaochi

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2016-05-17 14:44:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `weixin` varchar(255) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `point` int(20) unsigned zerofill NOT NULL,
  PRIMARY KEY (`id`),
  KEY `_facebook` (`facebook`),
  KEY `_weixin` (`weixin`),
  KEY `_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for adv
-- ----------------------------
DROP TABLE IF EXISTS `adv`;
CREATE TABLE `adv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adv_res` varchar(255) NOT NULL,
  `adv_url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Procedure structure for Prgs_account_register
-- ----------------------------
DROP PROCEDURE IF EXISTS `Prgs_account_register`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Prgs_account_register`(IN `username` varchar(255),IN `passwd` varchar(255),IN `icon` varchar(255))
BEGIN
	
	DECLARE res INT;
	DECLARE id BIGINT;
START TRANSACTION;
	IF EXISTS(select account.username FROM account WHERE account.username = `username`) THEN
		SET res = -1;
	ELSE
		INSERT INTO account(username, passwd, icon) VALUES(`username`, `passwd`, `icon`);
		SET id = LAST_INSERT_ID();
		SET res = 0;
	END IF;
		SELECT res, id;
COMMIT;
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

/*
Navicat MySQL Data Transfer

Source Server         : centos
Source Server Version : 50173
Source Host           : 172.18.220.8:3306
Source Database       : taotaochi

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2016-05-29 16:53:09
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
-- Table structure for geohash
-- ----------------------------
DROP TABLE IF EXISTS `geohash`;
CREATE TABLE `geohash` (
  `latitude` float(20,7) NOT NULL,
  `longitude` float(20,7) NOT NULL,
  `geohash` varchar(255) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for Geohash
-- ----------------------------
DROP TABLE IF EXISTS `Geohash`;
CREATE TABLE `Geohash` (
  `latitude` float(20,7) NOT NULL,
  `longitude` float(20,7) NOT NULL,
  `geohash` varchar(255) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
-- Table structure for goods_orders
-- ----------------------------
DROP TABLE IF EXISTS `goods_orders`;
CREATE TABLE `goods_orders` (
  `userid` int(20) NOT NULL,
  `order_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_money` float(20,2) NOT NULL,
  `date` datetime NOT NULL,
  `checked` int(20) NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

-- ----------------------------
-- Table structure for income
-- ----------------------------
DROP TABLE IF EXISTS `income`;
CREATE TABLE `income` (
  `order_number` bigint(20) NOT NULL,
  `money` float(20,2) NOT NULL,
  `user_id` int(20) NOT NULL,
  `order_number_no` bigint(20) NOT NULL,
  `date` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
-- Table structure for search_record
-- ----------------------------
DROP TABLE IF EXISTS `search_record`;
CREATE TABLE `search_record` (
  `userid` bigint(20) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  `longitude` int(20) DEFAULT NULL,
  `latitude` int(20) DEFAULT NULL,
  `type` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for shop_info
-- ----------------------------
DROP TABLE IF EXISTS `shop_info`;
CREATE TABLE `shop_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `accountid` bigint(20) NOT NULL,
  `city` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `longitude` float(20,7) NOT NULL,
  `latitude` float(20,7) NOT NULL,
  `geohash` varchar(20) NOT NULL,
  `shop_name` varchar(255) NOT NULL,
  `shop_type` int(20) NOT NULL,
  `manage_range` int(10) NOT NULL,
  `host_name` varchar(255) NOT NULL,
  `phone_number` bigint(20) NOT NULL,
  `delivery_type` int(10) NOT NULL,
  `account` varchar(100) NOT NULL,
  `checked` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Procedure structure for goods_search
-- ----------------------------
DROP PROCEDURE IF EXISTS `goods_search`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `goods_search`(IN `userid` bigint,IN `keyword` varchar(255),IN `longitude` float,IN `latitude`float,IN `type`int)
BEGIN
	#Routine body goes here...
START TRANSACTION;
    INSERT INTO search_record(userid, keyword, longitude, latitude, type) VALUES(`userid`, `keyword`, longitude, latitude, type);
  
COMMIT;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for goods_search_delete
-- ----------------------------
DROP PROCEDURE IF EXISTS `goods_search_delete`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `goods_search_delete`(IN `userid` bigint)
BEGIN
	#Routine body goes here...
  DECLARE res INT;
  DELETE FROM search_record WHERE search_record.userid=`userid`;
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
-- Procedure structure for Prgs_geohash
-- ----------------------------
DROP PROCEDURE IF EXISTS `Prgs_geohash`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Prgs_geohash`(IN `geohash` varchar(255),IN `userid` bigint)
BEGIN
DECLARE res INT;
START TRANSACTION;
IF EXISTS (SELECT shop_inf.id FROM shop_inf WHERE shop_inf.id = `userid`) THEN
	UPDATE shop_inf SET shop_inf.geohash = `geohash` WHERE shop_inf.id = `userid`;
	SET res = 0;
ELSE
	SET res = -1;
END IF;
COMMIT;
SELECT res;
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
-- Procedure structure for Prgs_goods_orders
-- ----------------------------
DROP PROCEDURE IF EXISTS `Prgs_goods_orders`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Prgs_goods_orders`(IN `userid` int,IN `order_money` float,IN `checked` int)
BEGIN
	#Routine body goes here...
	DECLARE res INT;
	DECLARE id BIGINT;
	DECLARE mon FLOAT;
	DECLARE aaa FLOAT;
	DECLARE num BIGINT;
#	DECLARE _date	date;
START TRANSACTION;
	IF EXISTS	(SELECT shop_inf.id FROM shop_inf WHERE shop_inf.id = `userid`) THEN
	INSERT INTO goods_orders (userid,order_money,checked,date) VALUES (`userid` ,`order_money` ,`checked`,NOW());
	SET id = LAST_INSERT_ID();
		IF EXISTS (SELECT income.date FROM income WHERE income.user_id = `userid` AND income.date = CURDATE())THEN
			IF EXISTS (SELECT goods_orders.checked FROM goods_orders WHERE goods_orders.checked = 0 AND goods_orders.order_id = id) THEN
				SET aaa = (SELECT goods_orders.order_money FROM goods_orders WHERE goods_orders.order_id = id);
				SET num = (SELECT income.order_number FROM income WHERE income.user_id = `userid` AND income.date = CURDATE());
				SET mon = (SELECT income.money FROM income WHERE income.user_id = `userid` AND income.date = CURDATE());
				UPDATE income SET income.money = (mon + aaa) WHERE income.user_id = `userid` AND income.date = CURDATE();
				UPDATE income SET income.order_number = (num + 1) WHERE income.user_id = `userid` AND income.date = CURDATE();
				SET res = 0;
			ELSE
				SET num = (SELECT income.order_number_no FROM income WHERE income.user_id = `userid` AND income.date = CURDATE());
				UPDATE income SET income.order_number_no = (num + 1) WHERE income.user_id = `userid` AND income.date = CURDATE();
				SET res = 1;
			END IF;
		ELSE
		INSERT INTO income(order_number,money,user_id,order_number_no,date) VALUES (0,0,`userid`,0,CURDATE());
			IF EXISTS (SELECT goods_orders.checked FROM goods_orders WHERE goods_orders.checked = 0 AND goods_orders.order_id = id) THEN
				SET aaa = (SELECT goods_orders.order_money FROM goods_orders WHERE goods_orders.order_id = id);
				SET num = (SELECT income.order_number FROM income WHERE income.user_id = `userid` AND income.date = CURDATE());
				SET mon = (SELECT income.money FROM income WHERE income.user_id = `userid` AND income.date = CURDATE());
				UPDATE income SET income.money = (mon + aaa) WHERE income.user_id = `userid` AND income.date = CURDATE();
				UPDATE income SET income.order_number = (num + 1) WHERE income.user_id = `userid` AND income.date = CURDATE();
				SET res = 2;
			ELSE
				SET num = (SELECT income.order_number_no FROM income WHERE income.user_id = `userid` AND income.date = CURDATE());
				UPDATE income SET income.order_number_no = (num + 1) WHERE income.user_id = `userid` AND income.date = CURDATE();
				SET res = 3;
			END IF;
		END IF;
	ELSE
	SET res = -1;
	END IF;
COMMIT;
SELECT res;
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
-- Procedure structure for Prgs_new_order_numbers
-- ----------------------------
DROP PROCEDURE IF EXISTS `Prgs_new_order_numbers`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Prgs_new_order_numbers`(IN `userid`int)
BEGIN
DECLARE res INT;
DECLARE num BIGINT;
START TRANSACTION;
	IF EXISTS(SELECT goods_orders.userid FROM goods_orders WHERE goods_orders.userid = `userid`) THEN
	SET num = (SELECT income.order_number_no FROM income WHERE income.user_id = `userid` AND income.date = CURDATE());
	SET res = 0;
	ELSE
	SET res = -1;
END IF;
COMMIT;
SELECT res,num;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for Prgs_shop_info
-- ----------------------------
DROP PROCEDURE IF EXISTS `Prgs_shop_info`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Prgs_shop_info`(IN `accountid` int(10),IN `city` varchar(255),IN `location` varchar(255),IN `address` varchar(255),IN `longitude` float(10),IN `latitude` float(10),IN `geohash` varchar(20) ,IN `shop_name` varchar(255),IN `shop_type` int(10),IN `manage_range` int(10),IN `host_name` varchar(255),IN `phone_number` bigint(20),IN `delivery_type` int(10),IN `account` int(10),IN `outdoor` varchar(255),IN `indoor` varchar(255),IN `business_licence` varchar(255),IN `server_licence` varchar(255),IN `other_licence` varchar(255),IN `checked` int(10))
BEGIN
	#Routine body goes here...
  DECLARE res INT;
	DECLARE id BIGINT;
  START TRANSACTION;
	IF EXISTS(SELECT shop_info.shop_name FROM shop_info WHERE shop_info.shop_name = `shop_name`)THEN
	SET res = 1;
	ELSE
	INSERT INTO shop_info (accountid,city,location,address,longitude,latitude,geohash,shop_name,shop_type,manage_range,host_name,phone_number,delivery_type,account,checked) VALUES (`accountid`,`city`,`location`,`address`,`longitude`,`latitude`,`geohash`,`shop_name`,`shop_type`,`manage_range`,`host_name`,`phone_number`,`delivery_type`,`account`,`checked`);
	INSERT INTO shop_pic (outdoor,indoor,business_licence,server_licence,other_licence) VALUES (`outdoor`,`indoor`,`business_licence`,`server_licence`,`other_licence`);
	#IF (ROW_COUNT())THEN
	SET id = LAST_INSERT_ID();
	SET res = 0;
#END IF;
END IF;
COMMIT;
SELECT res,id;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for Prgs_today_money_number
-- ----------------------------
DROP PROCEDURE IF EXISTS `Prgs_today_money_number`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Prgs_today_money_number`(IN `userid` int)
BEGIN
DECLARE res INT;
DECLARE num BIGINT;
DECLARE money FLOAT;
START TRANSACTION;
IF EXISTS(SELECT income.user_id FROM income WHERE income.user_id = `userid`) THEN
	SET num = (SELECT income.order_number FROM income WHERE income.date = CURDATE() AND income.user_id = `userid`);
	SET money = (SELECT income.money FROM income WHERE income.date = CURDATE() AND income.user_id = `userid`);
	SET res = 0;
	ELSE
	SET res = -1;
END IF;
COMMIT;
   SELECT res,num,money;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for Prgs_yesterday_money_number
-- ----------------------------
DROP PROCEDURE IF EXISTS `Prgs_yesterday_money_number`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Prgs_yesterday_money_number`(IN `userid` int)
BEGIN
DECLARE res INT;
DECLARE num BIGINT;
DECLARE money FLOAT;
START TRANSACTION;
IF EXISTS(SELECT income.user_id FROM income WHERE income.user_id = `userid`) THEN
	SET num = (SELECT income.order_number FROM income WHERE income.date = DATE_SUB(CURDATE(),INTERVAL 1 DAY));
	SET money = (SELECT income.money FROM income WHERE income.date = DATE_SUB(CURDATE(),INTERVAL 1 DAY));
	SET res = 0;
	ELSE
	SET res = -1;
END IF;
COMMIT;
   SELECT res,num,money;
END
;;
DELIMITER ;

# Host: 127.0.0.1  (Version: 5.1.70-community)
# Date: 2015-01-06 00:07:35
# Generator: MySQL-Front 5.3  (Build 2.42)

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE */;
/*!40101 SET SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES */;
/*!40103 SET SQL_NOTES='ON' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;

DROP DATABASE IF EXISTS `copydp`;
CREATE DATABASE `copydp` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `copydp`;

#
# Source for table "t_activity"
#

DROP TABLE IF EXISTS `t_activity`;
CREATE TABLE `t_activity` (
  `activity_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `dscr` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `info` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT '进行中',
  `city_id` varchar(255) DEFAULT NULL,
  `datelimit` varchar(255) DEFAULT NULL,
  `memberlimit` varchar(255) DEFAULT NULL,
  `imgsrc` varchar(255) DEFAULT NULL,
  `point` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "t_activity"
#


#
# Source for table "t_activity_order"
#

DROP TABLE IF EXISTS `t_activity_order`;
CREATE TABLE `t_activity_order` (
  `activity_order_id` varchar(255) NOT NULL DEFAULT '',
  `activity_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `activity_title` varchar(255) DEFAULT NULL,
  `acitivity_disc` varchar(255) DEFAULT NULL,
  `imgsrc` varchar(255) DEFAULT NULL,
  `memberlimit` int(11) DEFAULT NULL,
  `datelimit` date DEFAULT NULL,
  `datetime` date DEFAULT NULL,
  `status` varchar(255) DEFAULT '已报名',
  PRIMARY KEY (`activity_order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "t_activity_order"
#


#
# Source for table "t_city"
#

DROP TABLE IF EXISTS `t_city`;
CREATE TABLE `t_city` (
  `city_id` int(11) NOT NULL AUTO_INCREMENT,
  `city` varchar(255) DEFAULT NULL,
  `x` varchar(255) DEFAULT NULL,
  `y` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

#
# Data for table "t_city"
#

INSERT INTO `t_city` VALUES (1,'广州','113.270855','23.136533'),(2,'深圳','123','123'),(3,'上海','1','2'),(8,'shenzhen','12313','13453');

#
# Source for table "t_city_zone"
#

DROP TABLE IF EXISTS `t_city_zone`;
CREATE TABLE `t_city_zone` (
  `zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `zone_name` varchar(255) DEFAULT NULL,
  `city_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`zone_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

#
# Data for table "t_city_zone"
#

INSERT INTO `t_city_zone` VALUES (1,'福田区','2'),(2,'宝安区','2'),(3,'南山区','2'),(4,'荔湾区','1'),(5,'越秀区','1'),(15,'龙华区','8');

#
# Source for table "t_collect"
#

DROP TABLE IF EXISTS `t_collect`;
CREATE TABLE `t_collect` (
  `collect_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`collect_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "t_collect"
#


#
# Source for table "t_community"
#

DROP TABLE IF EXISTS `t_community`;
CREATE TABLE `t_community` (
  `community_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `community_type` varchar(255) DEFAULT NULL,
  `context` varchar(255) DEFAULT NULL,
  `datetime` date DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`community_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

#
# Data for table "t_community"
#

INSERT INTO `t_community` VALUES (30,'新帖','房介信息','<p>第三方商店收到撒啊阿斯顿撒旦撒旦</p><p><img src=http://localhost:7000/copydp/Public/ueditor/php/upload/20141222/1419238766359.png _src=http://localhost:7000/copydp/Public/ueditor/php/upload/20141222/1419238766359.png/></p><p>\r\n\t\t\t\t\t\t\t\t\t\t\t\t</p>','2014-12-22',81),(31,'XITEIE ','房介信息','势力扩大解放阿斯利康大家；啊上来就啊；斯柯达就；啊路上看见阿里；开始<p>\r\n\t\t\t\t\t\t\t\t\t\t\t\t</p>','2014-12-22',81),(32,'但是','应聘信息','<p style=margin-top: 0px; margin-bottom: 0px; color: rgb(153, 153, 153); font-family: Tahoma, sans-serif; font-size: 14px; line-height: 22.3999996185303px; white-space: normal; background-color: rgb(250, 250, 250);>加入笑谣林（商家篇）</p><p style=margin-top: 0px; ','2014-12-22',81);

#
# Source for table "t_community_discuss"
#

DROP TABLE IF EXISTS `t_community_discuss`;
CREATE TABLE `t_community_discuss` (
  `community_discuss_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `community_id` int(11) DEFAULT NULL,
  `datetime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`community_discuss_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "t_community_discuss"
#


#
# Source for table "t_customer"
#

DROP TABLE IF EXISTS `t_customer`;
CREATE TABLE `t_customer` (
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `grade` varchar(255) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `cellphone` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `car_id` varchar(50) DEFAULT NULL,
  `recommender_id` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT '待审批',
  `request` varchar(255) DEFAULT 'null',
  `login_date` date DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "t_customer"
#

INSERT INTO `t_customer` VALUES (81,'VIP',17,'','','',NULL,'正常','null','2014-12-22'),(82,'VIP',3,'','','',NULL,'正常','null',NULL),(83,'VIP',5,'','','',NULL,'正常','null',NULL),(84,'VIP',6,'','','',NULL,'正常','null',NULL);

#
# Source for table "t_news"
#

DROP TABLE IF EXISTS `t_news`;
CREATE TABLE `t_news` (
  `news_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` varchar(5000) DEFAULT NULL,
  `datetime` date DEFAULT NULL,
  PRIMARY KEY (`news_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "t_news"
#


#
# Source for table "t_order"
#

DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `order_id` varchar(255) NOT NULL DEFAULT '',
  `order_name` varchar(255) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_description` varchar(255) DEFAULT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `order_time` datetime DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `order_price` float DEFAULT NULL,
  `order_original_price` float DEFAULT NULL,
  `order_status` varchar(255) DEFAULT '已下单',
  `note` varchar(255) DEFAULT NULL,
  `imgsrc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "t_order"
#

INSERT INTO `t_order` VALUES ('20811418693219','产品1¥2.00×2',81,20,'产品1','点点滴滴',85,'2014-12-16 09:26:59',2,2,7,'已下单',NULL,'548eb85408476.png'),('20811418693417','产品1¥2.00×3',81,20,'产品1','点点滴滴',85,'2014-12-16 09:30:17',3,6,21,'已下单',NULL,'548eb85408476.png'),('20811418694919','产品1¥2.00×3',81,20,'产品1','点点滴滴',85,'2014-12-16 09:55:19',3,6,21,'已下单',NULL,'548eb85408476.png');

#
# Source for table "t_poll_code"
#

DROP TABLE IF EXISTS `t_poll_code`;
CREATE TABLE `t_poll_code` (
  `code` varchar(11) NOT NULL DEFAULT '',
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "t_poll_code"
#

INSERT INTO `t_poll_code` VALUES ('el2MArEFho','未使用'),('EoZeZFUTBn','未使用'),('KRIWYQzoLO','未使用'),('lejSWiI910','未使用'),('lh3xsXnhqT','未使用'),('nyEcfz7zyI','未使用'),('oNviJVSJP3','未使用'),('zMz3L7Cz6a','未使用');

#
# Source for table "t_privilege"
#

DROP TABLE IF EXISTS `t_privilege`;
CREATE TABLE `t_privilege` (
  `privilege_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) DEFAULT NULL,
  `function` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`privilege_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

#
# Data for table "t_privilege"
#

INSERT INTO `t_privilege` VALUES (1,'0','SELLER'),(2,'0','ACTIVITY'),(3,'0','COMMUNITY'),(4,'0','SYSTEM'),(5,'0','ORDER'),(12,'25','SELLER'),(13,'0','MEMBER'),(14,'77','MEMBER'),(15,'77','SELLER');

#
# Source for table "t_product"
#

DROP TABLE IF EXISTS `t_product`;
CREATE TABLE `t_product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `end_date_time` datetime DEFAULT NULL,
  `price` float(5,2) DEFAULT NULL,
  `original_price` float(5,2) DEFAULT NULL,
  `describe` varchar(255) DEFAULT NULL,
  `basic_infor` varchar(2000) DEFAULT NULL,
  `svip_privilege` varchar(255) DEFAULT NULL,
  `imgsrc` varchar(255) DEFAULT NULL,
  `imglist` varchar(255) DEFAULT NULL,
  `product_status` varchar(255) NOT NULL DEFAULT '待审核',
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

#
# Data for table "t_product"
#

INSERT INTO `t_product` VALUES (20,'产品1',1,85,'2014-12-15 00:00:00','2015-04-15 00:00:00',2.00,7.00,'点点滴滴','<p><img src=http://localhost:7000/copydp/Public/ueditor/php/upload/20141215/14186394419704.png _src=http://localhost:7000/copydp/Public/ueditor/php/upload/20141215/14186394419704.png/>\r\n\t\t\t</p>','普通','548eb85408476.png',NULL,'正常'),(21,'D ',3,85,'2014-12-15 00:00:00','2015-04-15 00:00:00',22.00,234.00,'SDF ','','普通','548eef7d3adbe.png',NULL,'正常'),(22,'积分商品',1000,85,'2014-12-15 00:00:00','2015-04-15 00:00:00',123.00,999.99,'顶顶顶','','普通','548efa96aa146.png',NULL,'正常');

#
# Source for table "t_product_evaluation"
#

DROP TABLE IF EXISTS `t_product_evaluation`;
CREATE TABLE `t_product_evaluation` (
  `product_eva_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `score_product` int(11) DEFAULT NULL,
  `eva_content` varchar(255) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`product_eva_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "t_product_evaluation"
#


#
# Source for table "t_product_notice"
#

DROP TABLE IF EXISTS `t_product_notice`;
CREATE TABLE `t_product_notice` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `orderinfo` varchar(255) DEFAULT NULL,
  `rule` varchar(255) DEFAULT NULL,
  `warning` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "t_product_notice"
#


#
# Source for table "t_product_type"
#

DROP TABLE IF EXISTS `t_product_type`;
CREATE TABLE `t_product_type` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) DEFAULT NULL,
  `father_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1002 DEFAULT CHARSET=utf8;

#
# Data for table "t_product_type"
#

INSERT INTO `t_product_type` VALUES (1,'餐饮美食',0),(2,'休闲娱乐',0),(3,'汽车服务',0),(4,'酒店旅游',0),(5,'摄影写真',0),(6,'都市丽人',0),(7,'教育培训',0),(8,'生活服务',0),(10,'火锅海鲜',1),(11,'自助餐',1),(12,'日韩料理',1),(13,'甜品糕点',1),(14,'中西美食',1),(15,'家常小炒',1),(16,'酒吧KTV',2),(17,'保健按摩',2),(18,'足道浴场',2),(19,'影音欣赏',2),(20,'茶式咖啡馆',2),(21,'运动户外',2),(22,'洗车行',3),(23,'装饰美容',3),(24,'维护保养',3),(25,'二手车行',3),(26,'驾校培训',3),(27,'品牌4S店',3),(28,'景点景区',4),(29,'旅游住宿',4),(30,'摄影影楼',5),(31,'儿童摄影',5),(32,'美容会所',6),(33,'美发美甲',6),(34,'减肥降脂',6),(35,'化妆护肤',6),(36,'儿童培训',7),(37,'成人培训',7),(38,'电子数码',8),(39,'宠物天地',8),(40,'生活日用',8),(41,'建材家装',8),(42,'婚庆采购',8),(1000,'积分商品',999),(1001,'全部',999);

#
# Source for table "t_recommend_product"
#

DROP TABLE IF EXISTS `t_recommend_product`;
CREATE TABLE `t_recommend_product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

#
# Data for table "t_recommend_product"
#

INSERT INTO `t_recommend_product` VALUES (20);

#
# Source for table "t_seller"
#

DROP TABLE IF EXISTS `t_seller`;
CREATE TABLE `t_seller` (
  `user_id` int(11) NOT NULL DEFAULT '0',
  `city_id` varchar(255) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `zone_id` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `info` varchar(2000) DEFAULT NULL,
  `status` varchar(255) DEFAULT '正常',
  PRIMARY KEY (`user_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `t_seller_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `t_product_type` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "t_seller"
#

INSERT INTO `t_seller` VALUES (85,'8',11,'自助餐','0.064391,0.005788','15','548eb804ce17d.png','<p><img src=\\\"http://localhost:7000/copydp/Public/ueditor/php/upload/20141215/14186393621089.png\\\" _src=\\\"http://localhost:7000/copydp/Public/ueditor/php/upload/20141215/14186393621089.png\\\"/></p>','正常');

#
# Source for table "t_seller_evaluation"
#

DROP TABLE IF EXISTS `t_seller_evaluation`;
CREATE TABLE `t_seller_evaluation` (
  `seller_eva_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `score_environment` int(11) DEFAULT NULL,
  `score_service` int(11) DEFAULT NULL,
  `eva_content` varchar(255) DEFAULT NULL,
  `seller_id` varchar(255) DEFAULT NULL,
  `order_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`seller_eva_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

#
# Data for table "t_seller_evaluation"
#


#
# Source for table "t_site_config"
#

DROP TABLE IF EXISTS `t_site_config`;
CREATE TABLE `t_site_config` (
  `name` varchar(11) NOT NULL DEFAULT '',
  `content` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "t_site_config"
#

INSERT INTO `t_site_config` VALUES ('email','email id'),('help1','dddddd'),('help2','帮助信息'),('help3','帮助信息'),('help4','帮助信息'),('helpC1','<p>1AF ASD AS &nbsp;ASD 阿斯顿阿斯顿都是</p><p><img src=http://localhost:7000/copydp/Public/ueditor/php/upload/20141216/141869718616.png _src=http://localhost:7000/copydp/Public/ueditor/php/upload/20141216/141869718616.png/></p>'),('helpC2','2'),('helpC3','3'),('helpC4','4'),('link1','www.fuego.cn'),('link2','www.baidu.com'),('link3','24'),('link4',''),('linkname1','孚思科技'),('linkname2','百度'),('linkname3','23'),('linkname4',''),('tel','www.fuego.cn'),('time','time');

#
# Source for table "t_sys_config"
#

DROP TABLE IF EXISTS `t_sys_config`;
CREATE TABLE `t_sys_config` (
  `key` varchar(255) NOT NULL DEFAULT '',
  `value` int(11) DEFAULT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "t_sys_config"
#

INSERT INTO `t_sys_config` VALUES ('login_score',3),('order_score',4);

#
# Source for table "t_user"
#

DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(255) NOT NULL DEFAULT '123456',
  `username` varchar(255) NOT NULL DEFAULT '',
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8;

#
# Data for table "t_user"
#

INSERT INTO `t_user` VALUES (0,'123456','admin','ADMIN'),(81,'123123','user1','CUSTOMER'),(82,'123456','user2','CUSTOMER'),(83,'123456','user3','CUSTOMER'),(84,'123456','user4','CUSTOMER'),(85,'123456','seller1','SELLER');

#
# Source for view "t_view_activity"
#

DROP VIEW IF EXISTS `t_view_activity`;
CREATE VIEW `t_view_activity` AS 
  select `t_activity`.`status` AS `status`,`t_activity`.`activity_id` AS `activity_id`,`t_activity`.`title` AS `title`,`t_city`.`city` AS `city`,`t_activity`.`dscr` AS `dscr`,`t_activity`.`imgsrc` AS `imgsrc`,`t_activity`.`point` AS `point`,`t_activity`.`datelimit` AS `datelimit`,`t_activity`.`memberlimit` AS `memberlimit`,`t_activity`.`address` AS `address`,`t_activity`.`info` AS `info`,`t_activity`.`datetime` AS `datetime`,`t_activity`.`note` AS `note` from (`t_activity` join `t_city` on((`t_city`.`city_id` = `t_activity`.`city_id`)));

#
# Source for view "t_view_activity_order"
#

DROP VIEW IF EXISTS `t_view_activity_order`;
CREATE VIEW `t_view_activity_order` AS 
  select `t_activity_order`.`activity_order_id` AS `activity_order_id`,`t_activity_order`.`activity_id` AS `activity_id`,`t_activity_order`.`customer_id` AS `customer_id`,`t_activity_order`.`activity_title` AS `activity_title`,`t_activity_order`.`acitivity_disc` AS `activity_disc`,`t_activity_order`.`imgsrc` AS `imgsrc`,`t_activity_order`.`memberlimit` AS `memberlimit`,`t_activity_order`.`datelimit` AS `datelimit`,`t_activity_order`.`status` AS `status`,`t_activity_order`.`datetime` AS `datetime`,`t_activity`.`status` AS `activity_status`,`t_user`.`username` AS `username`,`t_customer`.`grade` AS `grade`,`t_customer`.`cellphone` AS `cellphone`,`t_customer`.`email` AS `email` from (((`t_activity_order` join `t_customer` on((`t_customer`.`user_id` = `t_activity_order`.`customer_id`))) join `t_activity` on((`t_activity`.`activity_id` = `t_activity_order`.`activity_id`))) join `t_user` on((`t_user`.`user_id` = `t_activity_order`.`customer_id`)));

#
# Source for view "t_view_community_customer"
#

DROP VIEW IF EXISTS `t_view_community_customer`;
CREATE VIEW `t_view_community_customer` AS 
  select `t_community`.`community_id` AS `community_id`,`t_community`.`title` AS `title`,`t_community`.`community_type` AS `community_type`,`t_community`.`datetime` AS `datetime`,`t_community`.`customer_id` AS `customer_id`,count(`t_community`.`customer_id`) AS `customer_number`,`t_user`.`username` AS `username` from (`t_community` join `t_user` on((`t_user`.`user_id` = `t_community`.`customer_id`))) group by `t_community`.`customer_id` order by 'num';

#
# Source for view "t_view_community_discuss"
#

DROP VIEW IF EXISTS `t_view_community_discuss`;
CREATE VIEW `t_view_community_discuss` AS 
  select `t_community_discuss`.`community_discuss_id` AS `community_discuss_id`,`t_community_discuss`.`community_id` AS `community_id`,`t_community_discuss`.`datetime` AS `datetime`,`t_user`.`user_id` AS `user_id`,`t_user`.`username` AS `username`,`t_community_discuss`.`content` AS `content` from (`t_community_discuss` join `t_user` on((`t_user`.`user_id` = `t_community_discuss`.`user_id`)));

#
# Source for view "t_view_community_discuss_sum"
#

DROP VIEW IF EXISTS `t_view_community_discuss_sum`;
CREATE VIEW `t_view_community_discuss_sum` AS 
  select `t_community_discuss`.`community_id` AS `community_id`,`t_community`.`title` AS `title`,count(`t_community_discuss`.`community_discuss_id`) AS `discuss_num` from (`t_community_discuss` join `t_community` on((`t_community`.`community_id` = `t_community_discuss`.`community_id`))) group by `t_community_discuss`.`community_id`;

#
# Source for view "t_view_customer"
#

DROP VIEW IF EXISTS `t_view_customer`;
CREATE VIEW `t_view_customer` AS 
  select `t_customer`.`user_id` AS `user_id`,`t_customer`.`grade` AS `grade`,`t_customer`.`score` AS `score`,`t_customer`.`cellphone` AS `cellphone`,`t_customer`.`email` AS `email`,`t_customer`.`car_id` AS `car_id`,`t_customer`.`recommender_id` AS `recommender_id`,`t_customer`.`status` AS `status`,`t_customer`.`request` AS `request`,`t_user`.`password` AS `password`,`t_user`.`username` AS `username`,`t_user`.`role` AS `role` from (`t_customer` left join `t_user` on((`t_customer`.`user_id` = `t_user`.`user_id`))) where (`t_user`.`role` = 'CUSTOMER');

#
# Source for view "t_view_order"
#

DROP VIEW IF EXISTS `t_view_order`;
CREATE VIEW `t_view_order` AS 
  select `t_order`.`order_id` AS `order_id`,`t_order`.`order_name` AS `order_name`,`t_order`.`customer_id` AS `customer_id`,`t_order`.`product_id` AS `product_id`,`t_order`.`product_name` AS `product_name`,`t_order`.`order_time` AS `order_time`,`t_order`.`quantity` AS `quantity`,`t_order`.`order_price` AS `order_price`,`t_order`.`order_status` AS `order_status`,`t_user`.`username` AS `username`,`t_order`.`seller_id` AS `seller_id`,`t_order`.`imgsrc` AS `imgsrc`,`t_order`.`product_description` AS `product_description`,`t_order`.`order_original_price` AS `order_original_price`,`t_order`.`note` AS `note`,`t_product`.`type_id` AS `type_id`,`t_product_type`.`type_name` AS `type_name`,`t_product`.`end_date_time` AS `end_date_time`,`t_view_customer`.`cellphone` AS `cellphone`,`t_view_customer`.`grade` AS `grade` from ((((`t_order` join `t_product` on((`t_product`.`product_id` = `t_order`.`product_id`))) join `t_user` on((`t_user`.`user_id` = `t_order`.`customer_id`))) join `t_view_customer` on((`t_view_customer`.`user_id` = `t_order`.`customer_id`))) join `t_product_type` on((`t_product_type`.`type_id` = `t_product`.`type_id`)));

#
# Source for view "t_view_product"
#

DROP VIEW IF EXISTS `t_view_product`;
CREATE VIEW `t_view_product` AS 
  select `copydp`.`t_product`.`product_id` AS `product_id`,`copydp`.`t_product`.`name` AS `name`,`copydp`.`t_product`.`type_id` AS `type_id`,`copydp`.`t_product`.`seller_id` AS `seller_id`,`copydp`.`t_product`.`update_date` AS `update_date`,`copydp`.`t_product`.`end_date_time` AS `end_date_time`,`copydp`.`t_product`.`price` AS `price`,`copydp`.`t_product`.`original_price` AS `original_price`,`copydp`.`t_product`.`describe` AS `dscr`,`copydp`.`t_product`.`basic_infor` AS `basic_infor`,`copydp`.`t_product`.`svip_privilege` AS `svip_privilege`,`copydp`.`t_product`.`imgsrc` AS `imgsrc`,`copydp`.`t_product`.`imglist` AS `imglist`,`copydp`.`t_product`.`product_status` AS `product_status`,`t_view_seller`.`username` AS `username`,`t_view_seller`.`zone_id` AS `zone_id`,`t_view_seller`.`zone_name` AS `zone_name`,`t_view_seller`.`city` AS `city`,`t_view_seller`.`city_id` AS `city_id` from (`copydp`.`t_product` join `copydp`.`t_view_seller` on((`copydp`.`t_product`.`seller_id` = `t_view_seller`.`user_id`))) order by `copydp`.`t_product`.`update_date` desc;

#
# Source for view "t_view_product_eva"
#

DROP VIEW IF EXISTS `t_view_product_eva`;
CREATE VIEW `t_view_product_eva` AS 
  select `t_product_evaluation`.`product_eva_id` AS `product_eva_id`,`t_product_evaluation`.`product_id` AS `product_id`,`t_product_evaluation`.`customer_id` AS `customer_id`,`t_product_evaluation`.`order_id` AS `order_id`,`t_product_evaluation`.`score_product` AS `score_product`,`t_product_evaluation`.`eva_content` AS `eva_content`,`t_product_evaluation`.`datetime` AS `datetime`,`t_user`.`username` AS `user_name` from (`t_product_evaluation` join `t_user` on((`t_user`.`user_id` = `t_product_evaluation`.`customer_id`)));

#
# Source for view "t_view_recommernd"
#

DROP VIEW IF EXISTS `t_view_recommernd`;
CREATE VIEW `t_view_recommernd` AS 
  select `t_recommend_product`.`product_id` AS `product_id`,`t_product`.`name` AS `name`,`t_product`.`imgsrc` AS `imgsrc`,`t_product`.`describe` AS `dscr`,`t_product`.`price` AS `price`,`t_product`.`product_status` AS `product_status`,`t_city`.`city` AS `city` from (((`t_recommend_product` join `t_product` on((`t_recommend_product`.`product_id` = `t_product`.`product_id`))) join `t_seller` on((`t_product`.`seller_id` = `t_seller`.`user_id`))) join `t_city` on((`t_seller`.`city_id` = `t_city`.`city_id`)));

#
# Source for view "t_view_seller"
#

DROP VIEW IF EXISTS `t_view_seller`;
CREATE VIEW `t_view_seller` AS 
  select `copydp`.`t_seller`.`user_id` AS `user_id`,`copydp`.`t_seller`.`city_id` AS `city_id`,`copydp`.`t_seller`.`zone_id` AS `zone_id`,`copydp`.`t_seller`.`type_id` AS `type_id`,`copydp`.`t_seller`.`description` AS `description`,`copydp`.`t_seller`.`position` AS `position`,`copydp`.`t_seller`.`img` AS `img`,`copydp`.`t_seller`.`info` AS `info`,`copydp`.`t_seller`.`status` AS `status`,`copydp`.`t_product_type`.`type_name` AS `type_name`,`copydp`.`t_product_type`.`father_id` AS `father_id`,`copydp`.`t_city`.`city` AS `city`,`copydp`.`t_city_zone`.`zone_name` AS `zone_name`,`copydp`.`t_user`.`password` AS `password`,`copydp`.`t_user`.`username` AS `username`,`copydp`.`t_user`.`role` AS `role` from ((((`copydp`.`t_seller` left join `copydp`.`t_product_type` on((`copydp`.`t_seller`.`type_id` = `copydp`.`t_product_type`.`type_id`))) left join `copydp`.`t_city` on((`copydp`.`t_seller`.`city_id` = `copydp`.`t_city`.`city_id`))) left join `copydp`.`t_city_zone` on(((`copydp`.`t_seller`.`city_id` = `copydp`.`t_city_zone`.`city_id`) and (`copydp`.`t_seller`.`zone_id` = `copydp`.`t_city_zone`.`zone_id`)))) left join `copydp`.`t_user` on((`copydp`.`t_seller`.`user_id` = `copydp`.`t_user`.`user_id`))) where (`copydp`.`t_user`.`role` = 'SELLER');

#
# Source for view "t_view_zone"
#

DROP VIEW IF EXISTS `t_view_zone`;
CREATE VIEW `t_view_zone` AS 
  select `t_city_zone`.`zone_id` AS `zone_id`,`t_city`.`city_id` AS `city_id`,`t_city`.`city` AS `city`,`t_city_zone`.`zone_name` AS `zone_name` from (`t_city_zone` join `t_city` on((`t_city`.`city_id` = `t_city_zone`.`city_id`)));

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

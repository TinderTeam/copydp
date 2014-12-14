# Host: 127.0.0.1  (Version: 5.1.70-community)
# Date: 2014-12-14 16:42:49
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

#
# Data for table "t_activity"
#

INSERT INTO `t_activity` VALUES (6,'活动1','2014-12-10 16:41:18','测试活动','深圳龙华区工业路192号','',NULL,'进行中','8','2015-05-02','12','54754a48ba6a7.png','1');

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

INSERT INTO `t_city_zone` VALUES (1,'福田区','2'),(2,'宝安区','2'),(3,'南山区','2'),(4,'荔湾区','1'),(5,'越秀区','1'),(6,'测试区1','7'),(7,'测试区2','7'),(8,'CE','7'),(9,'dd','7'),(10,'dd','7'),(11,'dd','7'),(12,'WW','7'),(13,'1','7'),(14,'12','7'),(15,'龙华区','8');

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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

#
# Data for table "t_community"
#

INSERT INTO `t_community` VALUES (26,'测试帖1','房介信息','最新你测试帖里的计算机<p>\r\n\t\t\t\t\t\t\t\t\t\t\t\t</p>','2014-11-27',59),(27,'测试帖2','应聘信息','士大夫似的方式<p>\r\n\t\t\t\t\t\t\t\t\t\t\t\t</p>','2014-11-27',61),(28,'测试帖3','应聘信息','收到是对方<p>\r\n\t\t\t\t\t\t\t\t\t\t\t\t</p>','2014-11-27',61),(29,'ceshi','123','sdjflskdjf;sl','2014-11-27',59);

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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

#
# Data for table "t_community_discuss"
#

INSERT INTO `t_community_discuss` VALUES (14,61,'SDF SDF S',26,'2014-11-27 17:30:00'),(15,61,'S SD S D',26,'2014-11-27 17:30:16'),(16,61,'S SD S D',26,'2014-11-27 17:30:16'),(17,61,'',26,'2014-11-27 17:30:20'),(18,61,'士大夫  但是是',27,'2014-11-27 17:42:37'),(19,61,'士大夫 收到',27,'2014-11-27 17:42:50'),(20,61,'收到是',27,'2014-11-27 17:43:02'),(21,61,'收到收到',27,'2014-11-27 17:43:07'),(22,61,'士大夫似的',27,'2014-11-27 17:43:15'),(23,59,'sdjflskdjf',27,'2014-11-27 22:31:52');

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

INSERT INTO `t_customer` VALUES (59,'VIP',14,'','123@11.com','',NULL,'正常','null','2014-12-14'),(60,'VIP',2,NULL,'111@qq.com',NULL,NULL,'正常','null','2014-11-27'),(62,'VIP',0,NULL,NULL,NULL,NULL,'待审批','审批',NULL),(63,'VIP',2,NULL,NULL,NULL,NULL,'正常','null','2014-11-27'),(67,'VIP',4,NULL,NULL,NULL,NULL,'正常','null','2014-12-08');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

#
# Data for table "t_news"
#

INSERT INTO `t_news` VALUES (3,'咨询1','最新资讯<p>\r\n\t\t\t\t\t\t\t\t\t\t\t\t</p>','2014-11-26'),(4,'资讯2','最最最新自诩你<p>\r\n\t\t\t\t\t\t\t\t\t\t\t\t</p>','2014-11-26');

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

INSERT INTO `t_order` VALUES ('1301417763256','产品1¥8.00×1',0,13,'产品1','测试产品',61,'2014-12-05 15:07:36',1,8,123,'已下单',NULL,'5475e15e969b4.png'),('13591417061942','产品1¥8.00×1',59,13,'产品1','测试产品',61,'2014-11-27 12:19:02',1,8,123,'已下单',NULL,'5475e15e969b4.png'),('13591418055714','¥×1',59,13,NULL,NULL,NULL,'2014-12-09 00:21:54',1,NULL,NULL,'已下单',NULL,NULL),('13591418541668','产品1¥8.00×1',59,13,'产品1','测试产品',61,'2014-12-14 15:21:08',1,8,123,'已下单',NULL,'5475e15e969b4.png'),('13671417764624','产品1¥8.00×1',67,13,'产品1','测试产品',61,'2014-12-05 15:30:24',1,8,123,'已下单',NULL,'5475e15e969b4.png'),('14601417057133','产品2¥6.00×1',60,14,'产品2','测试产品',61,'2014-11-27 10:58:53',1,6,234,'已下单',NULL,'5475e1814d8f0.png'),('14671417764638','产品2¥6.00×1',67,14,'产品2','测试产品',61,'2014-12-05 15:30:38',1,6,234,'已下单',NULL,'5475e1814d8f0.png'),('17591418541379','最新上架¥2.00×1',59,17,'最新上架','为为我 ',72,'2014-12-14 15:16:19',1,2,7,'已下单',NULL,'548d2a9997b6b.png');

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

INSERT INTO `t_poll_code` VALUES ('bl37fJ7Bl2','已使用'),('d5VmKoGW9N','已使用'),('EiRxnbrSGx','未使用'),('HBJ6IbzQeU','未使用'),('igm7hjigtW','未使用'),('jqTfqKIxxJ','未使用'),('LsC9yxUfCZ','未使用'),('RL0D0iJGZK','未使用'),('s2eMZiTrVG','未使用'),('TudQgbwDGd','未使用');

#
# Source for table "t_privilege"
#

DROP TABLE IF EXISTS `t_privilege`;
CREATE TABLE `t_privilege` (
  `privilege_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) DEFAULT NULL,
  `function` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`privilege_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

#
# Data for table "t_privilege"
#

INSERT INTO `t_privilege` VALUES (1,'0','SELLER'),(2,'0','ACTIVITY'),(3,'0','COMMUNITY'),(4,'0','SYSTEM'),(5,'0','ORDER'),(12,'25','SELLER'),(13,'0','MEMBER');

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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

#
# Data for table "t_product"
#

INSERT INTO `t_product` VALUES (13,'产品1',1,61,'2014-12-10 00:00:00','2015-09-01 00:00:00',8.00,123.00,'测试产品','<p>\t\t</p><p>产品详细描述：</p><p><img src=http://localhost:7000/copydp/Public/ueditor/php/upload/20141208/14180015743643.png _src=http://localhost:7000/copydp/Public/ueditor/php/upload/20141208/14180015743643.png style=//></p><p><img src=http://localhost:7000/copydp/Public/ueditor/php/upload/20141208/14180015793458.png _src=http://localhost:7000/copydp/Public/ueditor/php/upload/20141208/14180015793458.png style=//></p><p>\r\n\t\t\t\t\t\t\t\t\t\t\t\t</p><p>\t</p>','普通','5475e15e969b4.png',NULL,'正常'),(14,'产品2',1,61,'2014-12-10 00:00:00','2015-04-15 00:00:00',6.00,234.00,'测试产品','<p>\r\n\t\tsdfs&nbsp;</p><p>\r\n\t\t\t\t\t\t\t\t\t\t\t\t</p><p>\t</p>','普通','5475e1814d8f0.png',NULL,'正常'),(17,'最新上架',1,72,'2014-12-14 00:00:00','2015-04-15 00:00:00',2.00,7.00,'为为我 ','<p>df s&nbsp;</p><p><img src=http://localhost:7000/copydp/Public/ueditor/php/upload/20141214/14185376231348.png _src=http://localhost:7000/copydp/Public/ueditor/php/upload/20141214/14185376231348.png/></p><p>\r\n\t\t\t</p>','普通','548d2a9997b6b.png',NULL,'正常');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

#
# Data for table "t_recommend_product"
#

INSERT INTO `t_recommend_product` VALUES (13),(15);

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

INSERT INTO `t_seller` VALUES (61,'1',10,'概述士大夫收到收到','113.146673,23.207765','4','54866f63bfcab.png','<p>详细描述:</p><p><img src=\\\"http://localhost:7000/copydp/Public/ueditor/php/upload/20141209/14180964816367.png\\\" _src=\\\"http://localhost:7000/copydp/Public/ueditor/php/upload/20141209/14180964816367.png\\\"/></p>','正常'),(64,'1',11,'sdf sdf sd fs自那些都是是','113.165071,23.170559','4','5487fcd330070.png','<p><img src=\\\"http://localhost:7000/copydp/Public/ueditor/php/upload/20141210/14181982249410.png\\\" _src=\\\"http://localhost:7000/copydp/Public/ueditor/php/upload/20141210/14181982249410.png\\\"/></p>','正常'),(65,'8',1,'sdf sd ','','5','547d30ceacab2.jpg','齐威王<p>\r\n\t\t\t\t\t\t\t\t\t\t\t\t</p>','正常'),(66,'2',3,'是大幅度','','1','547eb3b7c7ccf.png','<p>啊手动阀</p>','正常'),(68,'1',10,'概述11111','','4',NULL,'<p>是 收到收到收到收到</p><p><img src=\\\"http://localhost:7000/copydp/Public/ueditor/php/upload/20141208/14180206498399.png\\\" _src=\\\"http://localhost:7000/copydp/Public/ueditor/php/upload/20141208/14180206498399.png\\\"/></p>','正常'),(69,'1',42,'GAISHU','','5','548549b9d19fd.png','<p>详细描述21112212</p><p><img src=\\\"http://localhost:7000/copydp/Public/ueditor/php/upload/20141208/14180213038312.png\\\" _src=\\\"http://localhost:7000/copydp/Public/ueditor/php/upload/20141208/14180213038312.png\\\"/></p>',NULL),(70,'6',10,'概述','','','54854f96d502f.png','<p>详细描述：</p><p><img src=\\\"http://localhost:7000/copydp/Public/ueditor/php/upload/20141208/14180228048276.png\\\" _src=\\\"http://localhost:7000/copydp/Public/ueditor/php/upload/20141208/14180228048276.png\\\"/></p>',NULL),(71,'1',10,'改改改改树','','4','548550812191c.png','<p><img src=\\\"http://localhost:7000/copydp/Public/ueditor/php/upload/20141208/14180230893201.png\\\" _src=\\\"http://localhost:7000/copydp/Public/ueditor/php/upload/20141208/14180230893201.png\\\"/></p>',NULL),(72,'8',10,'是发','','15','548d2a3106bb5.png','<p>的是</p><p><img src=\\\"http://localhost:7000/copydp/Public/ueditor/php/upload/20141214/14185375144296.png\\\" _src=\\\"http://localhost:7000/copydp/Public/ueditor/php/upload/20141214/14185375144296.png\\\"/></p>','正常');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

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

INSERT INTO `t_site_config` VALUES ('email','email'),('help1','帮助信息2'),('help2','帮助信息'),('help3','帮助信息'),('help4','帮助信息'),('helplink1','1'),('helplink2','2'),('helplink3','3'),('helplink4','4'),('link1','www.fuego.cn'),('link2','www.baidu.com'),('link3','24'),('link4',''),('linkname1','孚思科技'),('linkname2','百度'),('linkname3','23'),('linkname4',''),('tel','www.fuego.cn'),('time','time');

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

INSERT INTO `t_sys_config` VALUES ('login_score',2),('order_score',2);

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
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;

#
# Data for table "t_user"
#

INSERT INTO `t_user` VALUES (0,'123456','admin','ADMIN'),(59,'123456','user1','CUSTOMER'),(60,'123123','user2','CUSTOMER'),(61,'123456','seller1','SELLER'),(63,'e10adc3949ba59abbe56e057f20f883e','test','CUSTOMER'),(64,'123456','seller3','SELLER'),(65,'123456','seller2','SELLER'),(66,'123456','新商户1','SELLER'),(67,'123456','test1','CUSTOMER'),(68,'123456','测试商户1','SELLER'),(69,'123456','CECESHI','SELLER'),(70,'123456','111','SELLER'),(71,'123456','商户11111','SELLER'),(72,'123456','测试商家','SELLER');

#
# Source for view "t_view_activity"
#

DROP VIEW IF EXISTS `t_view_activity`;
CREATE VIEW `t_view_activity` AS 
  select `copydp`.`t_activity`.`status` AS `status`,`copydp`.`t_activity`.`activity_id` AS `activity_id`,`copydp`.`t_activity`.`title` AS `title`,`copydp`.`t_city`.`city` AS `city`,`copydp`.`t_activity`.`dscr` AS `dscr`,`copydp`.`t_activity`.`imgsrc` AS `imgsrc`,`copydp`.`t_activity`.`point` AS `point`,`copydp`.`t_activity`.`datelimit` AS `datelimit`,`copydp`.`t_activity`.`memberlimit` AS `memberlimit`,`copydp`.`t_activity`.`address` AS `address`,`copydp`.`t_activity`.`info` AS `info`,`copydp`.`t_activity`.`datetime` AS `datetime`,`copydp`.`t_activity`.`note` AS `note` from (`copydp`.`t_activity` join `copydp`.`t_city` on((`copydp`.`t_city`.`city_id` = `copydp`.`t_activity`.`city_id`)));

#
# Source for view "t_view_activity_order"
#

DROP VIEW IF EXISTS `t_view_activity_order`;
CREATE VIEW `t_view_activity_order` AS 
  select `copydp`.`t_activity_order`.`activity_order_id` AS `activity_order_id`,`copydp`.`t_activity_order`.`activity_id` AS `activity_id`,`copydp`.`t_activity_order`.`customer_id` AS `customer_id`,`copydp`.`t_activity_order`.`activity_title` AS `activity_title`,`copydp`.`t_activity_order`.`acitivity_disc` AS `activity_disc`,`copydp`.`t_activity_order`.`imgsrc` AS `imgsrc`,`copydp`.`t_activity_order`.`memberlimit` AS `memberlimit`,`copydp`.`t_activity_order`.`datelimit` AS `datelimit`,`copydp`.`t_activity_order`.`status` AS `status`,`copydp`.`t_activity_order`.`datetime` AS `datetime`,`copydp`.`t_activity`.`status` AS `activity_status`,`copydp`.`t_user`.`username` AS `username`,`copydp`.`t_customer`.`grade` AS `grade`,`copydp`.`t_customer`.`cellphone` AS `cellphone`,`copydp`.`t_customer`.`email` AS `email` from (((`copydp`.`t_activity_order` join `copydp`.`t_customer` on((`copydp`.`t_customer`.`user_id` = `copydp`.`t_activity_order`.`customer_id`))) join `copydp`.`t_activity` on((`copydp`.`t_activity`.`activity_id` = `copydp`.`t_activity_order`.`activity_id`))) join `copydp`.`t_user` on((`copydp`.`t_user`.`user_id` = `copydp`.`t_activity_order`.`customer_id`)));

#
# Source for view "t_view_community_customer"
#

DROP VIEW IF EXISTS `t_view_community_customer`;
CREATE VIEW `t_view_community_customer` AS 
  select `copydp`.`t_community`.`community_id` AS `community_id`,`copydp`.`t_community`.`title` AS `title`,`copydp`.`t_community`.`community_type` AS `community_type`,`copydp`.`t_community`.`datetime` AS `datetime`,`copydp`.`t_community`.`customer_id` AS `customer_id`,count(`copydp`.`t_community`.`customer_id`) AS `customer_number`,`copydp`.`t_user`.`username` AS `username` from (`copydp`.`t_community` join `copydp`.`t_user` on((`copydp`.`t_user`.`user_id` = `copydp`.`t_community`.`customer_id`))) group by `copydp`.`t_community`.`customer_id` order by 'num';

#
# Source for view "t_view_community_discuss"
#

DROP VIEW IF EXISTS `t_view_community_discuss`;
CREATE VIEW `t_view_community_discuss` AS 
  select `copydp`.`t_community_discuss`.`community_discuss_id` AS `community_discuss_id`,`copydp`.`t_community_discuss`.`community_id` AS `community_id`,`copydp`.`t_community_discuss`.`datetime` AS `datetime`,`copydp`.`t_user`.`user_id` AS `user_id`,`copydp`.`t_user`.`username` AS `username`,`copydp`.`t_community_discuss`.`content` AS `content` from (`copydp`.`t_community_discuss` join `copydp`.`t_user` on((`copydp`.`t_user`.`user_id` = `copydp`.`t_community_discuss`.`user_id`)));

#
# Source for view "t_view_community_discuss_sum"
#

DROP VIEW IF EXISTS `t_view_community_discuss_sum`;
CREATE VIEW `t_view_community_discuss_sum` AS 
  select `copydp`.`t_community_discuss`.`community_id` AS `community_id`,`copydp`.`t_community`.`title` AS `title`,count(`copydp`.`t_community_discuss`.`community_discuss_id`) AS `discuss_num` from (`copydp`.`t_community_discuss` join `copydp`.`t_community` on((`copydp`.`t_community`.`community_id` = `copydp`.`t_community_discuss`.`community_id`))) group by `copydp`.`t_community_discuss`.`community_id`;

#
# Source for view "t_view_customer"
#

DROP VIEW IF EXISTS `t_view_customer`;
CREATE VIEW `t_view_customer` AS 
  select `copydp`.`t_customer`.`user_id` AS `user_id`,`copydp`.`t_customer`.`grade` AS `grade`,`copydp`.`t_customer`.`score` AS `score`,`copydp`.`t_customer`.`cellphone` AS `cellphone`,`copydp`.`t_customer`.`email` AS `email`,`copydp`.`t_customer`.`car_id` AS `car_id`,`copydp`.`t_customer`.`recommender_id` AS `recommender_id`,`copydp`.`t_customer`.`status` AS `status`,`copydp`.`t_customer`.`request` AS `request`,`copydp`.`t_user`.`password` AS `password`,`copydp`.`t_user`.`username` AS `username`,`copydp`.`t_user`.`role` AS `role` from (`copydp`.`t_customer` left join `copydp`.`t_user` on((`copydp`.`t_customer`.`user_id` = `copydp`.`t_user`.`user_id`))) where (`copydp`.`t_user`.`role` = 'CUSTOMER');

#
# Source for view "t_view_order"
#

DROP VIEW IF EXISTS `t_view_order`;
CREATE VIEW `t_view_order` AS 
  select `copydp`.`t_order`.`order_id` AS `order_id`,`copydp`.`t_order`.`order_name` AS `order_name`,`copydp`.`t_order`.`customer_id` AS `customer_id`,`copydp`.`t_order`.`product_id` AS `product_id`,`copydp`.`t_order`.`product_name` AS `product_name`,`copydp`.`t_order`.`product_description` AS `product_description`,`copydp`.`t_order`.`seller_id` AS `seller_id`,`copydp`.`t_order`.`order_time` AS `order_time`,`copydp`.`t_order`.`quantity` AS `quantity`,`copydp`.`t_order`.`order_price` AS `order_price`,`copydp`.`t_order`.`order_original_price` AS `order_original_price`,`copydp`.`t_order`.`order_status` AS `order_status`,`copydp`.`t_order`.`imgsrc` AS `imgsrc`,`copydp`.`t_order`.`note` AS `note`,`copydp`.`t_user`.`username` AS `username`,`copydp`.`t_product`.`end_date_time` AS `end_date_time` from ((`copydp`.`t_order` join `copydp`.`t_product` on((`copydp`.`t_product`.`product_id` = `copydp`.`t_order`.`product_id`))) join `copydp`.`t_user` on((`copydp`.`t_user`.`user_id` = `copydp`.`t_order`.`customer_id`)));

#
# Source for view "t_view_product"
#

DROP VIEW IF EXISTS `t_view_product`;
CREATE VIEW `t_view_product` AS 
  select `copydp`.`t_product`.`product_id` AS `product_id`,`copydp`.`t_product`.`name` AS `name`,`copydp`.`t_product`.`type_id` AS `type_id`,`copydp`.`t_product`.`seller_id` AS `seller_id`,`copydp`.`t_product`.`update_date` AS `update_date`,`copydp`.`t_product`.`end_date_time` AS `end_date_time`,`copydp`.`t_product`.`price` AS `price`,`copydp`.`t_product`.`original_price` AS `original_price`,`copydp`.`t_product`.`describe` AS `dscr`,`copydp`.`t_product`.`basic_infor` AS `basic_infor`,`copydp`.`t_product`.`svip_privilege` AS `svip_privilege`,`copydp`.`t_product`.`imgsrc` AS `imgsrc`,`copydp`.`t_product`.`imglist` AS `imglist`,`copydp`.`t_product`.`product_status` AS `product_status`,`t_view_zone`.`zone_id` AS `zone_id`,`t_view_zone`.`zone_name` AS `zone_name`,`t_view_zone`.`city` AS `city`,`t_view_zone`.`city_id` AS `city_id` from ((`copydp`.`t_product` join `copydp`.`t_seller` on((`copydp`.`t_product`.`seller_id` = `copydp`.`t_seller`.`user_id`))) join `copydp`.`t_view_zone` on((`copydp`.`t_seller`.`city_id` = `t_view_zone`.`city_id`))) order by `copydp`.`t_product`.`update_date` desc;

#
# Source for view "t_view_product_eva"
#

DROP VIEW IF EXISTS `t_view_product_eva`;
CREATE VIEW `t_view_product_eva` AS 
  select `copydp`.`t_product_evaluation`.`product_eva_id` AS `product_eva_id`,`copydp`.`t_user`.`username` AS `user_name`,`copydp`.`t_product_evaluation`.`score_product` AS `score_product`,`copydp`.`t_product_evaluation`.`eva_content` AS `eva_content`,`copydp`.`t_product_evaluation`.`datetime` AS `datetime` from (`copydp`.`t_product_evaluation` join `copydp`.`t_user` on((`copydp`.`t_user`.`user_id` = `copydp`.`t_product_evaluation`.`customer_id`)));

#
# Source for view "t_view_recommernd"
#

DROP VIEW IF EXISTS `t_view_recommernd`;
CREATE VIEW `t_view_recommernd` AS 
  select `copydp`.`t_recommend_product`.`product_id` AS `product_id`,`copydp`.`t_product`.`name` AS `name`,`copydp`.`t_product`.`imgsrc` AS `imgsrc`,`copydp`.`t_product`.`describe` AS `dscr`,`copydp`.`t_product`.`price` AS `price`,`copydp`.`t_product`.`product_status` AS `product_status`,`copydp`.`t_city`.`city` AS `city` from (((`copydp`.`t_recommend_product` join `copydp`.`t_product` on((`copydp`.`t_recommend_product`.`product_id` = `copydp`.`t_product`.`product_id`))) join `copydp`.`t_seller` on((`copydp`.`t_product`.`seller_id` = `copydp`.`t_seller`.`user_id`))) join `copydp`.`t_city` on((`copydp`.`t_seller`.`city_id` = `copydp`.`t_city`.`city_id`)));

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
  select `copydp`.`t_city_zone`.`zone_id` AS `zone_id`,`copydp`.`t_city`.`city_id` AS `city_id`,`copydp`.`t_city`.`city` AS `city`,`copydp`.`t_city_zone`.`zone_name` AS `zone_name` from (`copydp`.`t_city_zone` join `copydp`.`t_city` on((`copydp`.`t_city`.`city_id` = `copydp`.`t_city_zone`.`city_id`)));

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

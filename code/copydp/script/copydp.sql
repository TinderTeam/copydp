# Host: 127.0.0.1  (Version: 5.1.67-community)
# Date: 2014-09-18 18:48:35
# Generator: MySQL-Front 5.3  (Build 4.155)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "t_activity"
#

DROP TABLE IF EXISTS `t_activity`;
CREATE TABLE `t_activity` (
  `activity_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `dscr` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `infor` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `city_id` varchar(255) DEFAULT NULL,
  `datelimit` varchar(255) DEFAULT NULL,
  `memberlimit` varchar(255) DEFAULT NULL,
  `imgsrc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`activity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

#
# Data for table "t_activity"
#

INSERT INTO `t_activity` VALUES (1,'测试活动1',NULL,'描述字段',NULL,NULL,NULL,'进行中','2',NULL,NULL,'1.jpg'),(2,'测试活动2有非常长的名字',NULL,'描述字段',NULL,NULL,NULL,'进行中','2',NULL,NULL,'2.jpg'),(3,'测试活动3',NULL,'描述字段',NULL,NULL,NULL,'进行中','2',NULL,NULL,'3.jpg'),(4,'测试活动4',NULL,'描述字段',NULL,NULL,NULL,'进行中','2',NULL,NULL,'4.jpg'),(5,'测试活动5',NULL,NULL,NULL,NULL,NULL,'已结束','2',NULL,NULL,NULL);

#
# Structure for table "t_activity_order"
#

DROP TABLE IF EXISTS `t_activity_order`;
CREATE TABLE `t_activity_order` (
  `activity_order_id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL,
  `order_time` varchar(255) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `activity_title` varchar(255) DEFAULT NULL,
  `acitivity_disc` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`activity_order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

#
# Data for table "t_activity_order"
#

INSERT INTO `t_activity_order` VALUES (1,1,NULL,1,'测试活动1',NULL,'进行中'),(2,2,NULL,1,'测试活动2有非常长的名字',NULL,'进行中'),(3,3,NULL,1,'测试活动3',NULL,'进行中'),(4,4,NULL,1,'测试活动4 ',NULL,'进行中');

#
# Structure for table "t_city"
#

DROP TABLE IF EXISTS `t_city`;
CREATE TABLE `t_city` (
  `city_id` int(11) NOT NULL AUTO_INCREMENT,
  `city` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

#
# Data for table "t_city"
#

INSERT INTO `t_city` VALUES (1,'广州'),(2,'深圳'),(3,'上海'),(4,'北京');

#
# Structure for table "t_city_zone"
#

DROP TABLE IF EXISTS `t_city_zone`;
CREATE TABLE `t_city_zone` (
  `zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `zone_name` varchar(255) DEFAULT NULL,
  `city_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`zone_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Data for table "t_city_zone"
#

INSERT INTO `t_city_zone` VALUES (1,'福田区','2'),(2,'宝安区','2'),(3,'南山区','2');

#
# Structure for table "t_community"
#

DROP TABLE IF EXISTS `t_community`;
CREATE TABLE `t_community` (
  `community_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `community_type` varchar(255) DEFAULT NULL,
  `context` varchar(255) DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`community_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "t_community"
#


#
# Structure for table "t_customer"
#

DROP TABLE IF EXISTS `t_customer`;
CREATE TABLE `t_customer` (
  `user_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) NOT NULL DEFAULT '',
  `grade` varchar(255) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `cellphone` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `car_id` varchar(50) DEFAULT NULL,
  `recommender_id` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT '待审批',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

#
# Data for table "t_customer"
#

INSERT INTO `t_customer` VALUES (1,'用户C','砖石会员',400,'18677887788','','',NULL,'冻结'),(2,'用户B','普通会员',300,'13577887788',NULL,NULL,NULL,'正常'),(3,'有那个',NULL,NULL,NULL,NULL,NULL,NULL,'待审批'),(4,'新增A',NULL,0,'','','',1,NULL),(5,'新增2','S-VIP',100,'122222222','111@123.com','浙D00001',NULL,NULL),(6,'新增3','null',0,'','','',NULL,'待审批');

#
# Structure for table "t_news"
#

DROP TABLE IF EXISTS `t_news`;
CREATE TABLE `t_news` (
  `news_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `datetime` date DEFAULT NULL,
  PRIMARY KEY (`news_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

#
# Data for table "t_news"
#

INSERT INTO `t_news` VALUES (1,'台风“海鸥”今日登陆海南','新闻内容','2014-09-16'),(2,'开发进度完成50%，孚思科技举国欢庆','内容','2014-09-10');

#
# Structure for table "t_order"
#

DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_name` varchar(255) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_description` varchar(255) DEFAULT NULL,
  `product_seller` int(11) DEFAULT NULL,
  `order_time` datetime DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `order_price` float DEFAULT NULL,
  `order_original_price` float DEFAULT NULL,
  `order_status` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Data for table "t_order"
#

INSERT INTO `t_order` VALUES (1,'测试',1,1,'测试','测试',NULL,NULL,1,100,NULL,NULL,NULL);

#
# Structure for table "t_product"
#

DROP TABLE IF EXISTS `t_product`;
CREATE TABLE `t_product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `end_date_time` date DEFAULT NULL,
  `price` float(5,2) DEFAULT NULL,
  `original_price` float(5,2) DEFAULT NULL,
  `describe` varchar(255) DEFAULT NULL,
  `basic_infor` varchar(2000) DEFAULT NULL,
  `svip_privilege` varchar(255) DEFAULT NULL,
  `imgsrc` varchar(255) DEFAULT NULL,
  `imglist` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

#
# Data for table "t_product"
#

INSERT INTO `t_product` VALUES (1,'K歌9元起',1,2,'2014-09-10 10:00:00','2014-09-30',50.00,300.00,'谁能比我更低价','<p>啊实打实法萨芬</p><p><img src=\"/server/ueditor/upload/image/demo.jpg\" title=\"\" alt=\"demo.jpg\"/></p><p>   撒的发大水撒的发顺丰</p><p>   <img src=\"/server/ueditor/upload/image/demo.jpg\" title=\"\" alt=\"demo.jpg\"/></p>','特权专属','1.jpg','1.jpg;2.jpg'),(2,'澈思叔叔烘培工房',2,2,'2014-09-10 10:00:00','2014-09-10',300.00,150.00,'芒果爆浆泡芙，免费WiFi！无需预约，提供免费WiFi！','<html>',NULL,'2.jpg',NULL),(3,'\r\n人山人海国际美食会',3,2,'2014-09-10 11:00:00','2014-09-10',300.00,150.00,'\r\n单人自助晚餐，免费WiFi，免费停车位！提供免费WiFi！','<html>',NULL,'3.jpg',NULL),(4,'团购4',4,2,'2014-09-10 12:00:00','2014-09-10',300.00,150.00,'描述','<html>',NULL,'4.jpg',NULL),(5,'团购5',1,2,'2014-09-10 13:00:00','2014-09-10',300.00,150.00,'描述','<html>',NULL,'5.jpg',NULL),(6,'团购6',2,2,'2014-09-10 14:00:00','2014-09-10',300.00,150.00,'描述','<html>',NULL,'6.jpg',NULL),(7,'团购7',3,2,'2014-09-10 15:00:00','2014-09-10',300.00,150.00,'描述','<html>',NULL,'7.jpg',NULL);

#
# Structure for table "t_product_evaluation"
#

DROP TABLE IF EXISTS `t_product_evaluation`;
CREATE TABLE `t_product_evaluation` (
  `product_eva_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `score_product` int(11) DEFAULT NULL,
  `eva_content` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`product_eva_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

#
# Data for table "t_product_evaluation"
#

INSERT INTO `t_product_evaluation` VALUES (1,1,1,'2014-09-10 10:12:11',3,' 最好吃的一款披萨，希望优惠折扣更多一点就更好了'),(2,2,1,'2014-10-10 12:12:00',4,'不错~'),(3,3,1,'2014-09-10 10:12:11',1,'一般'),(4,4,1,'2014-09-10 10:12:11',2,'2014-09-10 10:12:11'),(5,5,1,'2014-09-10 10:12:11',5,'地方官'),(6,6,1,'2014-09-10 10:12:11',2,'垃圾');

#
# Structure for table "t_product_notice"
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
# Structure for table "t_product_type"
#

DROP TABLE IF EXISTS `t_product_type`;
CREATE TABLE `t_product_type` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) DEFAULT NULL,
  `father_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

#
# Data for table "t_product_type"
#

INSERT INTO `t_product_type` VALUES (0,'全部',999),(1,'地方美食',0),(2,'休闲娱乐',0),(3,'汽车服务',0),(4,'酒店旅游',0),(5,'摄影写真',0),(6,'都市丽人',0),(7,'教育培训',0),(8,'生活服务',0),(10,'火锅海鲜',1),(11,'自助餐',1),(12,'日韩料理',1),(13,'甜品糕点',1),(14,'中西美食',1),(15,'家常小炒',1),(16,'酒吧KTV',2),(17,'保健按摩',2),(18,'足道浴场',2),(19,'影音欣赏',2),(20,'茶式咖啡馆',2),(21,'运动户外',2),(22,'洗车行',3),(23,'装饰美容',3),(24,'维护保养',3),(25,'二手车行',3),(26,'驾校培训',3),(27,'品牌4S店',3),(28,'景点景区',4),(29,'旅游住宿',4),(30,'摄影影楼',5),(31,'儿童摄影',5),(32,'美容会所',6),(33,'美发美甲',6),(34,'减肥降脂',6),(35,'化妆护肤',6),(36,'儿童培训',7),(37,'成人培训',7),(38,'电子数码',8),(39,'宠物天地',8),(40,'生活日用',8),(41,'建材家装',8),(42,'婚庆采购',8);

#
# Structure for table "t_recommend_product"
#

DROP TABLE IF EXISTS `t_recommend_product`;
CREATE TABLE `t_recommend_product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

#
# Data for table "t_recommend_product"
#

INSERT INTO `t_recommend_product` VALUES (1),(2),(3),(4),(5);

#
# Structure for table "t_seller"
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
  PRIMARY KEY (`user_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `t_seller_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `t_product_type` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "t_seller"
#

INSERT INTO `t_seller` VALUES (2,'2',1,'描述','113.768461,23.023747','2','1.jpg'),(3,'2',2,'描述','113.768461,23.023747','3',NULL),(4,'2',2,'描述','114.043796,22.552997','1',NULL),(5,'2',3,'描述','114.043796,22.552997','2',NULL),(6,'2',3,'描述','114.043796,22.552997','3',NULL),(7,'2',4,'描述','114.043796,22.552997','1',NULL),(8,'2',4,'描述','114.043796,22.552997','2',NULL),(9,'2',5,'描述','114.043796,22.552997','3',NULL),(10,'2',5,'描述','114.043796,22.552997','1',NULL),(11,'1',1,'描述','114.043796,22.552997',NULL,NULL),(12,'1',1,'描述','114.043796,22.552997',NULL,NULL),(13,'1',2,'描述','114.043796,22.552997',NULL,NULL),(14,'1',2,'描述','114.043796,22.552997',NULL,NULL),(15,'1',3,'描述','114.043796,22.552997',NULL,NULL),(16,'1',3,'描述','114.043796,22.552997',NULL,NULL),(17,'1',4,'描述','114.043796,22.552997',NULL,NULL),(18,'1',4,'描述','114.043796,22.552997',NULL,NULL),(19,'1',5,'描述','114.043796,22.552997',NULL,NULL),(20,'1',5,'描述','114.043796,22.552997',NULL,NULL),(21,'2',1,'描述','113.768461,23.023747','1',NULL);

#
# Structure for table "t_seller_evaluation"
#

DROP TABLE IF EXISTS `t_seller_evaluation`;
CREATE TABLE `t_seller_evaluation` (
  `seller_eva_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `score_enviroment` int(11) DEFAULT NULL,
  `score_service` int(11) DEFAULT NULL,
  `eva_content` varchar(255) DEFAULT NULL,
  `seller_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`seller_eva_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

#
# Data for table "t_seller_evaluation"
#

INSERT INTO `t_seller_evaluation` VALUES (1,1,NULL,1,2,'3','3'),(2,2,NULL,2,1,'4','3'),(3,3,NULL,3,3,'2','3'),(4,4,NULL,4,4,'1','3'),(5,5,NULL,5,5,'1','3'),(6,2,NULL,2,2,'4','3');

#
# Structure for table "t_user"
#

DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `user_id` int(11) NOT NULL DEFAULT '0',
  `password` varchar(255) NOT NULL DEFAULT '123456',
  `username` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "t_user"
#

INSERT INTO `t_user` VALUES (0,'123456','admin','ADMIN'),(1,'123456','customer','CUSTOMER'),(2,'123456','seller','SELLER'),(3,'123456','seller2','SELLER'),(4,'123456','seller3','SELLER');

DROP VIEW IF EXISTS `t_view_activity`;
CREATE VIEW `t_view_activity` AS 
  select `copydp`.`t_activity_order`.`activity_id` AS `activity_id`,`copydp`.`t_activity_order`.`activity_title` AS `title`,`copydp`.`t_city`.`city` AS `city`,`copydp`.`t_activity`.`dscr` AS `dscr`,`copydp`.`t_activity`.`imgsrc` AS `imgsrc` from ((`copydp`.`t_activity_order` join `copydp`.`t_activity` on((`copydp`.`t_activity_order`.`activity_id` = `copydp`.`t_activity`.`activity_id`))) join `copydp`.`t_city` on((`copydp`.`t_city`.`city_id` = `copydp`.`t_activity`.`city_id`))) where (`copydp`.`t_activity_order`.`status` = '进行中');

DROP VIEW IF EXISTS `t_view_product`;
CREATE VIEW `t_view_product` AS 
  select `copydp`.`t_product`.`product_id` AS `product_id`,`copydp`.`t_product`.`type_id` AS `type_id`,`copydp`.`t_product`.`name` AS `name`,`copydp`.`t_product`.`imgsrc` AS `imgsrc`,`copydp`.`t_product`.`describe` AS `dscr`,`copydp`.`t_product`.`price` AS `price`,`copydp`.`t_product`.`update_date` AS `update_date`,`copydp`.`t_product`.`original_price` AS `original_price`,`copydp`.`t_city`.`city` AS `city` from ((`copydp`.`t_product` join `copydp`.`t_seller` on((`copydp`.`t_product`.`seller_id` = `copydp`.`t_seller`.`user_id`))) join `copydp`.`t_city` on((`copydp`.`t_seller`.`city_id` = `copydp`.`t_city`.`city_id`))) order by `copydp`.`t_product`.`update_date` desc;

DROP VIEW IF EXISTS `t_view_product_eva`;
CREATE VIEW `t_view_product_eva` AS 
  select `copydp`.`t_product_evaluation`.`product_eva_id` AS `product_eva_id`,`copydp`.`t_product_evaluation`.`datetime` AS `datetime`,`copydp`.`t_product_evaluation`.`score_product` AS `score_product`,`copydp`.`t_product_evaluation`.`eva_content` AS `eva_content`,`copydp`.`t_customer`.`user_name` AS `user_name`,`copydp`.`t_user`.`username` AS `seller_name` from (((`copydp`.`t_product_evaluation` join `copydp`.`t_product` on((`copydp`.`t_product`.`product_id` = `copydp`.`t_product_evaluation`.`product_id`))) join `copydp`.`t_customer` on((`copydp`.`t_product_evaluation`.`customer_id` = `copydp`.`t_customer`.`user_id`))) join `copydp`.`t_user` on((`copydp`.`t_user`.`user_id` = `copydp`.`t_product`.`seller_id`))) order by `copydp`.`t_product_evaluation`.`datetime` desc;

DROP VIEW IF EXISTS `t_view_recommernd`;
CREATE VIEW `t_view_recommernd` AS 
  select `copydp`.`t_recommend_product`.`product_id` AS `product_id`,`copydp`.`t_product`.`name` AS `name`,`copydp`.`t_product`.`imgsrc` AS `imgsrc`,`copydp`.`t_product`.`describe` AS `dscr`,`copydp`.`t_product`.`price` AS `price`,`copydp`.`t_city`.`city` AS `city` from (((`copydp`.`t_recommend_product` join `copydp`.`t_product` on((`copydp`.`t_recommend_product`.`product_id` = `copydp`.`t_product`.`product_id`))) join `copydp`.`t_seller` on((`copydp`.`t_product`.`seller_id` = `copydp`.`t_seller`.`user_id`))) join `copydp`.`t_city` on((`copydp`.`t_seller`.`city_id` = `copydp`.`t_city`.`city_id`)));

DROP VIEW IF EXISTS `t_view_seller`;
CREATE VIEW `t_view_seller` AS 
  select `t_seller`.`user_id` AS `user_id`,`t_seller`.`city_id` AS `city_id`,`t_seller`.`zone_id` AS `zone_id`,`t_seller`.`type_id` AS `type_id`,`t_seller`.`description` AS `description`,`t_seller`.`position` AS `position`,`t_seller`.`img` AS `img`,`t_product_type`.`type_name` AS `type_name`,`t_product_type`.`father_id` AS `father_id`,`t_city`.`city` AS `city`,`t_city_zone`.`zone_name` AS `zone_name`,`t_user`.`password` AS `password`,`t_user`.`username` AS `username`,`t_user`.`role` AS `role` from ((((`t_seller` left join `t_product_type` on((`t_seller`.`type_id` = `t_product_type`.`type_id`))) left join `t_city` on((`t_seller`.`city_id` = `t_city`.`city_id`))) left join `t_city_zone` on(((`t_seller`.`city_id` = `t_city_zone`.`city_id`) and (`t_seller`.`zone_id` = `t_city_zone`.`zone_id`)))) left join `t_user` on((`t_seller`.`user_id` = `t_user`.`user_id`))) where (`t_user`.`role` = 'SELLER');

DROP VIEW IF EXISTS `t_view_seller_eva`;
CREATE VIEW `t_view_seller_eva` AS 
  select `t_seller`.`user_id` AS `user_id`,`t_seller_evaluation`.`seller_eva_id` AS `seller_eva_id`,`t_seller_evaluation`.`customer_id` AS `customer_id`,`t_seller_evaluation`.`datetime` AS `datetime`,`t_seller_evaluation`.`score_enviroment` AS `score_enviroment`,`t_seller_evaluation`.`score_service` AS `score_service`,`t_seller_evaluation`.`eva_content` AS `eva_content`,`t_seller_evaluation`.`seller_id` AS `seller_id`,`t_seller`.`city_id` AS `city_id`,`t_seller`.`type_id` AS `type_id`,`t_seller`.`description` AS `description`,`t_seller`.`position` AS `position`,`t_seller`.`zone_id` AS `zone_id`,`t_seller`.`img` AS `img`,`t_user`.`password` AS `password`,`t_user`.`username` AS `username`,`t_user`.`role` AS `role` from ((`t_seller_evaluation` left join `t_seller` on((`t_seller_evaluation`.`seller_id` = `t_seller`.`user_id`))) left join `t_user` on((`t_seller`.`user_id` = `t_user`.`user_id`)));

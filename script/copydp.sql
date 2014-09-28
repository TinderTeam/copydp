# Host: 127.0.0.1  (Version: 5.1.67-community)
# Date: 2014-09-28 09:34:36
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
  `info` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT '进行中',
  `city_id` varchar(255) DEFAULT NULL,
  `datelimit` datetime DEFAULT NULL,
  `memberlimit` varchar(255) DEFAULT NULL,
  `imgsrc` varchar(255) DEFAULT NULL,
  `point` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`activity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

#
# Data for table "t_activity"
#

INSERT INTO `t_activity` VALUES (1,'测试活动1撒的发的萨菲','2014-09-24 17:29:28','描述字段','深南大道','<p>\r\n\t\t撒的发顺丰</p><p>\r\n\t\t\t</p><p>\t</p>',NULL,'进行中','2','2014-10-1','300','54228ddc8a7e6.jpg','100'),(3,'测试活动3','2014-04-05 00:00:00','描述字段',NULL,NULL,NULL,'已取消','2','2014-10-1','300','11.jpg','20'),(4,'测试活动4','2014-04-05 00:00:00','描述字段',NULL,NULL,NULL,'进行中','2','2014-10-1','30','12.jpg','10'),(5,'测试活动5',NULL,NULL,NULL,NULL,NULL,'进行中','2',NULL,NULL,NULL,NULL),(6,NULL,NULL,NULL,NULL,NULL,NULL,'进行中',NULL,NULL,NULL,NULL,'已下单'),(7,NULL,NULL,NULL,NULL,NULL,NULL,'进行中',NULL,NULL,NULL,NULL,'已下单'),(8,NULL,NULL,NULL,NULL,NULL,NULL,'进行中',NULL,NULL,NULL,NULL,'已下单'),(9,NULL,NULL,NULL,NULL,NULL,NULL,'进行中',NULL,NULL,NULL,NULL,'已下单'),(10,NULL,NULL,'asfdsadf','123213','asdfasdf<img src=\\\"http://127.0.0.1:89/copydp/Public/ueditor/php/upload/20140924/14115474825971.jpg\\\" _src=\\\"http://127.0.0.1:89/copydp/Public/ueditor/php/upload/20140924/14115474825971.jpg\\\"/><p><br/></p>',NULL,'进行中','3','1990-2-3','200',NULL,NULL),(11,NULL,NULL,'asfdsadf','123213','asdfasdf<img src=\\\"http://127.0.0.1:89/copydp/Public/ueditor/php/upload/20140924/14115474825971.jpg\\\" _src=\\\"http://127.0.0.1:89/copydp/Public/ueditor/php/upload/20140924/14115474825971.jpg\\\"/><p><br/></p>',NULL,'进行中','3','1990-2-3','200',NULL,NULL),(12,NULL,NULL,'asfdsadf','123213','asdfasdf<img src=\\\"http://127.0.0.1:89/copydp/Public/ueditor/php/upload/20140924/14115474825971.jpg\\\" _src=\\\"http://127.0.0.1:89/copydp/Public/ueditor/php/upload/20140924/14115474825971.jpg\\\"/><p><br/></p>',NULL,'进行中','3','1990-2-3','200',NULL,NULL),(13,'asdf',NULL,'asdf','asdfsaf','sadfaf<p>\r\n\t\t\t\t\t\t\t\t\t\t\t\t</p>',NULL,'进行中','2','2014-5-4','10',NULL,'12'),(14,'sdf','2014-09-24 16:37:24','asdf','fdsa','',NULL,'进行中','2','safd','1','542282c42f549.jpg','23'),(15,'asdfdsaf','2014-09-24 16:39:35','asdfsadfas','sd4f515','sadfsaf<p>\r\n\t\t\t\t\t\t\t\t\t\t\t\t</p>',NULL,'进行中','1','1950-24-13','30','5422834772f42.jpg','151'),(16,'','2014-09-24 17:11:10','asfdsadf','123213','',NULL,'进行中','3','1990-2-3','200','54228aaee47e2.png',''),(17,'测试活动1','2014-09-24 17:15:28','描述字段 更改','深南大道 更改','<p>更改更改</p>',NULL,'进行中','2','2014-10-1','300','54228bb0b9107.jpg','100'),(18,'测试活动1方式','2014-09-24 17:15:47','描述字段','深南大道','阿萨德飞<p>\r\n\t\t\t</p>',NULL,'进行中','2','2014-10-1','300','54228bc38a9d2.jpg','100'),(19,'测试活动1测试 ','2014-09-24 17:18:41','描述字段','深南大道','爱的色放噶的说法<p>\r\n\t\t\t</p>',NULL,'进行中','2','2014-10-1','300','54228c7152c38.png','100');

#
# Structure for table "t_activity_order"
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
  PRIMARY KEY (`activity_order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "t_activity_order"
#

INSERT INTO `t_activity_order` VALUES ('041411830585',0,4,NULL,NULL,NULL,NULL,NULL,'2014-09-27'),('041411830621',0,4,NULL,NULL,NULL,NULL,NULL,'2014-09-27'),('041411830646',0,4,NULL,NULL,NULL,NULL,NULL,'2014-09-27'),('041411830717',0,4,NULL,NULL,NULL,NULL,NULL,'2014-09-27'),('041411830762',0,4,NULL,NULL,NULL,NULL,NULL,'2014-09-27'),('041411830767',0,4,NULL,NULL,NULL,NULL,NULL,'2014-09-27'),('1211411865862',1,21,'测试活动1撒的发的萨菲',NULL,'54228ddc8a7e6.jpg',300,'2014-10-01','2014-09-28'),('2',2,4,'测试活动2有非常长的名字',NULL,'10.jpg',300,'2014-10-01','2014-04-05'),('341411830795',3,4,'测试活动3',NULL,'11.jpg',300,'2014-10-01','2014-09-27'),('341411830825',3,4,'测试活动3',NULL,'11.jpg',300,'2014-10-01','2014-09-27'),('4',4,4,'测试活动4 ',NULL,'12.jpg',300,'2014-10-01','2014-04-05');

#
# Structure for table "t_city"
#

DROP TABLE IF EXISTS `t_city`;
CREATE TABLE `t_city` (
  `city_id` int(11) NOT NULL AUTO_INCREMENT,
  `city` varchar(255) DEFAULT NULL,
  `x` varchar(255) DEFAULT NULL,
  `y` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

#
# Data for table "t_city"
#

INSERT INTO `t_city` VALUES (1,'广州','113.270855','23.136533'),(2,'深圳','114.063918','22.550326'),(3,'上海','121.491349','31.221002'),(4,'北京','116.399275','39.917545');

#
# Structure for table "t_city_zone"
#

DROP TABLE IF EXISTS `t_city_zone`;
CREATE TABLE `t_city_zone` (
  `zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `zone_name` varchar(255) DEFAULT NULL,
  `city_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`zone_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

#
# Data for table "t_city_zone"
#

INSERT INTO `t_city_zone` VALUES (1,'福田区','2'),(2,'宝安区','2'),(3,'南山区','2'),(4,'荔湾区','1'),(5,'越秀区','1');

#
# Source for table "t_collect"
#

DROP TABLE IF EXISTS `t_collect`;
CREATE TABLE `t_collect` (
  `collect_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`collect_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

#
# Data for table "t_collect"
#

INSERT INTO `t_collect` VALUES (1,4,1),(2,4,2);

#
# Structure for table "t_community"
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

#
# Data for table "t_community"
#

INSERT INTO `t_community` VALUES (1,'南京全面放开限购 广州等取消限购时机仍未到','房介信息',NULL,'2014-09-22',1),(2,'9月房价指数跌回1年前 房企拿地金额为去年1/2','房介信息',NULL,'2014-10-01',2),(3,'应聘信息1','应聘信息',NULL,'2014-10-02',1),(4,'招聘信息','招聘信息',NULL,'2014-09-10',2),(5,'9月房价指数跌回1年前 房企拿地金额为去年1/2','房介信息',NULL,'2014-10-01',3),(6,'9月房价指数跌回1年前 房企拿地金额为去年1/2','房介信息',NULL,'2014-10-01',4),(7,'9月房价指数跌回1年前 房企拿地金额为去年1/2','房介信息',NULL,'2014-10-01',3),(8,'9月房价指数跌回1年前 房企拿地金额为去年1/2','房介信息',NULL,'2014-10-01',2),(9,'9月房价指数跌回1年前 房企拿地金额为去年1/2','房介信息',NULL,'2014-10-01',1),(10,'9月房价指数跌回1年前 房企拿地金额为去年1/2','房介信息',NULL,'2014-10-01',2),(11,'9月房价指数跌回1年前 房企拿地金额为去年1/2','房介信息',NULL,'2014-10-01',3),(12,'9月房价指数跌回1年前 房企拿地金额为去年1/2','房介信息',NULL,'2014-10-01',4),(13,'9月房价指数跌回1年前 房企拿地金额为去年1/2','房介信息',NULL,'2014-10-01',1),(14,'9月房价指数跌回1年前 房企拿地金额为去年1/2','房介信息',NULL,'2014-10-01',1),(15,'9月房价指数跌回1年前 房企拿地金额为去年1/2','房介信息',NULL,'2014-10-01',1),(16,'9月房价指数跌回1年前 房企拿地金额为去年1/2','房介信息',NULL,'2014-10-01',1),(17,'test','招聘信息','customer<p>\r\n\t\t\t\t\t\t\t\t\t\t\t\t</p>','2014-09-27',1),(18,'test','招聘信息','<p>adg</p><p><span style=\\\"text-decoration:underline;\\\">asfds</span></p><p><span style=\\\"text-decoration:underline;\\\">waegadsg<strong></strong></span></p><p><strong>sadfasdf</strong></p><p>\r\n\t\t\t\t\t\t\t\t\t\t\t\t</p>','2014-09-27',1),(19,'test','招聘信息','<p>adg</p><p><span style=\\\"text-decoration:underline;\\\">asfds</span></p><p><span style=\\\"text-decoration:underline;\\\">waegadsg<strong></strong></span></p><p><strong>sadfasdf</strong></p><p>\r\n\t\t\t\t\t\t\t\t\t\t\t\t</p>','2014-09-27',1),(20,'sdfasf','招聘信息','<p>asfadsfas</p><p>asdfsadf</p><p>\r\n\t\t\t\t\t\t\t\t\t\t\t\t</p>','2014-09-27',1);

#
# Structure for table "t_community_discuss"
#

DROP TABLE IF EXISTS `t_community_discuss`;
CREATE TABLE `t_community_discuss` (
  `community_discuss_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `community_id` int(11) DEFAULT NULL,
  `datetime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`community_discuss_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

#
# Data for table "t_community_discuss"
#

INSERT INTO `t_community_discuss` VALUES (1,1,'sadfsdaf ',1,'2014-9-10 19:20:10'),(2,2,'sadfsadf',1,'2014-9-10 19:20:10'),(3,1,'sadfdsaf',1,NULL),(4,1,'dsfsad',1,NULL),(5,1,'sadfdsaf',1,NULL),(6,1,'sadfadsf',1,NULL),(7,1000,'阿萨德发的撒',9,'14-09-23 05:16:18'),(8,1000,'test',9,'14-09-23 05:16:22'),(9,1000,'丰盛的改色的',9,'14-09-23 05:16:35'),(10,1000,'丰盛的改色的',9,'14-09-23 05:16:38'),(11,1000,'test',1,'14-09-23 05:17:00'),(12,1000,'test',1,'14141414-0909-2323 0505:1717:3636'),(13,1000,'test',1,'2014-09-23 17:18:23'),(14,1000,'SDFDS ',12,'2014-09-23 17:22:22'),(15,1000,'ASDGAW',7,'2014-09-23 17:22:47'),(16,4,'撒打发撒打发额我',15,'2014-09-23 17:24:58'),(17,4,'撒打发撒打发额我',15,'2014-09-23 17:25:24'),(18,4,'ASDFSADF ',8,'2014-09-23 17:26:12'),(19,4,'ASDFSADF ',8,'2014-09-23 17:27:10'),(20,4,'ASDFSADF ',8,'2014-09-23 17:27:51'),(21,4,'ASDFSADF ',8,'2014-09-23 17:29:16'),(22,4,'ASDFSADF ',8,'2014-09-23 17:29:53'),(23,4,'ASDFSADF ',8,'2014-09-23 17:30:10'),(24,4,'ASDFSADF ',8,'2014-09-23 17:31:08'),(25,4,'sdfdsf ',15,'2014-09-23 17:32:25'),(26,1,'fsdfasfsaf',17,'2014-09-27 00:34:11'),(27,1000,NULL,NULL,'2014-09-27 00:34:15'),(28,1000,NULL,NULL,'2014-09-27 00:34:17'),(29,1,'asdfasdfaasdfsaf',20,'2014-09-27 00:35:37');

#
# Structure for table "t_customer"
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

INSERT INTO `t_customer` VALUES (4,'S-VIP',400,'18620592480','12@123.com','粤B4546',2,'正常','null'),(5,'VIP',200,'13622882288','aa@qq.com','粤B 1122',1,'待审批','null'),(20,'VIP',0,'','','',0,'正常','null');

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

INSERT INTO `t_order` VALUES ('1','Array×1订单',4,1,'K歌9元起','谁能比我更低价',NULL,'2014-09-24 11:52:12',1,50,300,'已取消',NULL,'1.jpg'),('121411742461','K歌9元起¥50.00×1',2,1,'K歌9元起','谁能比我更低价',NULL,'2014-09-26 22:41:01',1,50,300,'已过期',NULL,NULL),('141411531637','K歌9元起¥50.00×1',4,1,'K歌9元起','谁能比我更低价',2,'2014-09-24 12:07:17',1,50,300,'已使用',NULL,'1.jpg'),('141411531763','K歌9元起¥50.00×1',4,1,'K歌9元起','谁能比我更低价',2,'2014-09-24 12:09:23',1,50,300,'已使用',NULL,'1.jpg'),('2','K歌9元起50.00元×1',4,1,'K歌9元起','谁能比我更低价',2,'2014-09-24 11:53:10',1,50,300,'已使用',NULL,'1.jpg'),('4','1-4-19700101083334',4,1,'K歌9元起','谁能比我更低价',2,'2014-09-24 11:58:18',1,50,300,'已过期',NULL,'1.jpg'),('5','1-4-20140924115858',4,1,'K歌9元起','谁能比我更低价',2,'2014-09-24 11:58:58',1,50,300,'已过期',NULL,'1.jpg'),('6','141411531285',4,1,'K歌9元起','谁能比我更低价',2,'2014-09-24 12:01:25',1,50,300,'已过期',NULL,'1.jpg'),('7','141411531303',4,1,'K歌9元起','谁能比我更低价',2,'2014-09-24 12:01:43',1,50,300,'已取消',NULL,'1.jpg');

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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

#
# Data for table "t_product"
#

INSERT INTO `t_product` VALUES (1,'K歌9元起',1000,2,'2014-09-10 10:00:00','2014-09-10 00:00:00',50.00,300.00,'谁能比我更低价','<p>啊实打实法萨芬</p><p><img src=\"/server/ueditor/upload/image/demo.jpg\" title=\"\" alt=\"demo.jpg\"/></p><p>   撒的发大水撒的发顺丰</p><p>   <img src=\"/server/ueditor/upload/image/demo.jpg\" title=\"\" alt=\"demo.jpg\"/></p>','特权专属','1.jpg','1.jpg;2.jpg','未批准'),(2,'澈思叔叔烘培工房',1000,2,'2014-09-10 10:00:00','2014-09-10 00:00:00',300.00,150.00,'芒果爆浆泡芙，免费WiFi！无需预约，提供免费WiFi！','<html>',NULL,'2.jpg',NULL,'未批准'),(3,'\r\n人山人海国际美食会',1000,3,'2014-09-10 11:00:00','2014-09-10 00:00:00',300.00,150.00,'\r\n单人自助晚餐，免费WiFi，免费停车位！提供免费WiFi！','<html>',NULL,'3.jpg',NULL,'正常'),(4,'团购4',2,3,'2014-09-10 12:00:00','2014-09-10 00:00:00',300.00,150.00,'描述','<html>',NULL,'4.jpg',NULL,'正常'),(5,'团购5',1,7,'2014-09-10 13:00:00','2014-09-10 00:00:00',300.00,150.00,'描述','<html>',NULL,'5.jpg',NULL,'正常'),(6,'团购6',2,7,'2014-09-10 14:00:00','2014-09-10 00:00:00',300.00,150.00,'描述','<html>',NULL,'6.jpg',NULL,'正常'),(7,'团购7',1,7,'2014-09-10 15:00:00','2014-09-10 00:00:00',300.00,150.00,'描述','<html>',NULL,'7.jpg',NULL,'待审核'),(9,'sdgdgs',4,0,'2014-09-26 00:00:00','2014-10-10 00:00:00',234.00,234.00,'sgfd',NULL,'','542511224d04f.jpg',NULL,'待审核'),(10,'sadf',2,0,'2014-09-26 00:00:00','0000-00-00 00:00:00',0.00,0.00,'asdf',NULL,'','542511535c35b.jpg',NULL,'待审核'),(11,'dfgd ',0,0,'2014-09-26 00:00:00','0000-00-00 00:00:00',234.00,234.00,'sdfg',NULL,'',NULL,NULL,'待审核'),(12,'dfgd ',0,0,'2014-09-26 00:00:00','0000-00-00 00:00:00',234.00,234.00,'sdfg',NULL,'',NULL,NULL,'待审核'),(13,'asdf',0,2,'2014-09-26 00:00:00','0000-00-00 00:00:00',0.00,0.00,'',NULL,NULL,NULL,NULL,'待审核'),(14,'asdf',0,2,'2014-09-26 00:00:00','0000-00-00 00:00:00',0.00,0.00,'',NULL,NULL,NULL,NULL,'待审核'),(15,'asdf',0,2,'2014-09-26 00:00:00','0000-00-00 00:00:00',0.00,0.00,'sadf',NULL,'',NULL,NULL,'待审核'),(16,'sadf',0,2,'2014-09-26 00:00:00','0000-00-00 00:00:00',0.00,0.00,'asdf',NULL,'on',NULL,NULL,'待审核'),(17,'sdfasf',0,2,'2014-09-26 00:00:00','0000-00-00 00:00:00',0.00,0.00,'',NULL,'普通',NULL,NULL,'待审核'),(18,'',0,2,'2014-09-26 00:00:00','0000-00-00 00:00:00',0.00,0.00,'',NULL,'普通',NULL,NULL,'待审核'),(19,'5',0,2,'2014-09-26 00:00:00','0000-00-00 00:00:00',0.00,0.00,'',NULL,'普通',NULL,NULL,'待审核'),(20,'',0,2,'2014-09-26 00:00:00','0000-00-00 00:00:00',0.00,0.00,'',NULL,'普通',NULL,NULL,'待审核'),(21,'',0,2,'2014-09-26 00:00:00','0000-00-00 00:00:00',0.00,0.00,'',NULL,'特权专属',NULL,NULL,'待审核'),(22,'saasfd',2,2,'2014-09-26 00:00:00','0190-03-20 00:00:00',123.00,3.00,'asdfasdf',NULL,'普通','54251552123d4.png',NULL,'待审核'),(23,'',0,NULL,'2014-09-26 00:00:00','0000-00-00 00:00:00',0.00,0.00,'',NULL,'普通',NULL,NULL,'待审核'),(24,'',0,NULL,'2014-09-26 00:00:00','0000-00-00 00:00:00',0.00,0.00,'','sadfasdfsa<p>\r\n\t\t\t</p>','普通',NULL,NULL,'待审核'),(25,'',0,NULL,'2014-09-26 00:00:00','0000-00-00 00:00:00',0.00,0.00,'','sadfasdfsa<p>\r\n\t\t\t</p>','普通',NULL,NULL,'待审核');

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
  `order_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`product_eva_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

#
# Data for table "t_product_evaluation"
#

INSERT INTO `t_product_evaluation` VALUES (1,1,1,'2014-09-10 10:12:11',3,' 最好吃的一款披萨，希望优惠折扣更多一点就更好了',NULL),(2,2,1,'2014-10-10 12:12:00',4,'不错~',NULL),(3,3,1,'2014-09-10 10:12:11',1,'一般',NULL),(4,4,1,'2014-09-10 10:12:11',2,'2014-09-10 10:12:11',NULL),(5,5,1,'2014-09-10 10:12:11',5,'地方官',NULL),(6,6,1,'2014-09-10 10:12:11',2,'垃圾',NULL),(7,4,1,'2014-09-26 23:59:36',4,'非常好',1),(8,NULL,NULL,'2014-09-27 00:02:27',4,'asdfdsa',3),(9,4,1,'2014-09-28 08:59:50',2,'',2),(10,NULL,NULL,'2014-09-27 23:15:46',4,'',0),(11,4,1,'2014-09-28 09:00:09',5,'',2147483647);

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
) ENGINE=InnoDB AUTO_INCREMENT=1002 DEFAULT CHARSET=utf8;

#
# Data for table "t_product_type"
#

INSERT INTO `t_product_type` VALUES (1,'餐饮美食',0),(2,'休闲娱乐',0),(3,'汽车服务',0),(4,'酒店旅游',0),(5,'摄影写真',0),(6,'都市丽人',0),(7,'教育培训',0),(8,'生活服务',0),(10,'火锅海鲜',1),(11,'自助餐',1),(12,'日韩料理',1),(13,'甜品糕点',1),(14,'中西美食',1),(15,'家常小炒',1),(16,'酒吧KTV',2),(17,'保健按摩',2),(18,'足道浴场',2),(19,'影音欣赏',2),(20,'茶式咖啡馆',2),(21,'运动户外',2),(22,'洗车行',3),(23,'装饰美容',3),(24,'维护保养',3),(25,'二手车行',3),(26,'驾校培训',3),(27,'品牌4S店',3),(28,'景点景区',4),(29,'旅游住宿',4),(30,'摄影影楼',5),(31,'儿童摄影',5),(32,'美容会所',6),(33,'美发美甲',6),(34,'减肥降脂',6),(35,'化妆护肤',6),(36,'儿童培训',7),(37,'成人培训',7),(38,'电子数码',8),(39,'宠物天地',8),(40,'生活日用',8),(41,'建材家装',8),(42,'婚庆采购',8),(1000,'积分商品',999),(1001,'全部',999);

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
  `info` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `t_seller_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `t_product_type` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "t_seller"
#

INSERT INTO `t_seller` VALUES (2,'2',1,'描述','113.768461,23.023747','2','1.jpg',NULL),(3,'1',2,'描述','113.768461,23.023747','3',NULL,NULL),(4,'2',2,'描述','114.043796,22.552997','1',NULL,NULL),(5,'2',3,'描述','114.043796,22.552997','2',NULL,NULL),(6,'3',3,'描述','114.043796,22.552997','3',NULL,NULL),(7,'4',4,'描述','114.043796,22.552997','1',NULL,NULL),(8,'2',4,'描述','114.043796,22.552997','2',NULL,NULL),(9,'2',5,'描述','114.043796,22.552997','3',NULL,NULL),(10,'2',5,'描述','114.043796,22.552997','1',NULL,NULL),(11,'1',1,'描述','114.043796,22.552997',NULL,NULL,NULL),(12,'1',1,'描述','114.043796,22.552997',NULL,NULL,NULL),(13,'1',2,'描述','114.043796,22.552997',NULL,NULL,NULL),(14,'1',2,'描述','114.043796,22.552997',NULL,NULL,NULL),(15,'1',3,'描述','114.043796,22.552997',NULL,NULL,NULL),(16,'1',3,'描述','114.043796,22.552997',NULL,NULL,NULL),(17,'1',4,'描述','114.043796,22.552997',NULL,NULL,NULL),(18,'1',4,'描述','114.043796,22.552997',NULL,NULL,NULL),(19,'1',5,'描述','114.043796,22.552997',NULL,NULL,NULL),(20,'1',5,'描述','114.043796,22.552997',NULL,NULL,NULL),(21,'2',1,'描述','113.768461,23.023747','1',NULL,NULL),(22,'3',NULL,'asdfsadfasdfasdfasdf',NULL,'',NULL,'asdfasdfasdfas<p>\r\n\t\t\t\t\t\t\t\t\t\t\t\t</p>'),(23,'2',NULL,'概述信息',NULL,'1',NULL,'<p><img src=\\\"http://127.0.0.1:89/copydp/Public/ueditor/php/upload/20140923/14114563858189.jpg\\\" _src=\\\"http://127.0.0.1:89/copydp/Public/ueditor/php/upload/20140923/14114563858189.jpg\\\"/>阿萨德飞大师傅\t\t\t\t\t\t\t\t\t\t\t\t</p>'),(24,'2',NULL,'撒发生地方撒的发生',NULL,'3',NULL,'啊撒发生地方撒的萨菲是<p>\r\n\t\t\t\t\t\t\t\t\t\t\t\t</p>'),(25,'',NULL,'',NULL,'',NULL,''),(26,'2',3,'asdfasdf',NULL,'3',NULL,'阿萨德飞撒的发<p>\r\n\t\t\t\t\t\t\t\t\t\t\t\t</p>'),(27,'3',2,'阿非官方撒旦个','121.464903,31.281263','',NULL,'阿萨德发的撒<p>\r\n\t\t\t\t\t\t\t\t\t\t\t\t</p>'),(28,'2',4,'asdfsadf','114.046096,22.556734','',NULL,'sadfsadf<p>\r\n\t\t\t\t\t\t\t\t\t\t\t\t</p>');

#
# Structure for table "t_seller_evaluation"
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

#
# Data for table "t_seller_evaluation"
#

INSERT INTO `t_seller_evaluation` VALUES (1,1,NULL,1,2,'3','3',NULL),(2,2,NULL,2,1,'4','3',NULL),(3,3,NULL,3,3,'2','3',NULL),(4,4,NULL,4,4,'1','3',NULL),(5,5,NULL,5,5,'1','3',NULL),(6,2,NULL,2,2,'4','3',NULL),(7,4,NULL,NULL,30,NULL,NULL,'1'),(8,4,'2014-09-27 23:18:11',10,10,'太差','2','2'),(9,NULL,'2014-09-27 23:15:42',30,40,'',NULL,'ArrayorderID'),(10,4,'2014-09-28 09:00:10',50,50,'','2','141411531637'),(11,4,'2014-09-28 08:59:45',50,40,'','2','141411531763');

#
# Structure for table "t_sys_config"
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

INSERT INTO `t_sys_config` VALUES ('login_score',202),('order_score',302);

#
# Structure for table "t_user"
#

DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(255) NOT NULL DEFAULT '123456',
  `username` varchar(255) NOT NULL DEFAULT '',
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

#
# Data for table "t_user"
#

INSERT INTO `t_user` VALUES (1,'123456','customer','CUSTOMER'),(2,'123456','seller','SELLER'),(3,'123456','test2','CUSTOMER'),(4,'123456','test1','CUSTOMER'),(5,'123456','test3','CUSTOMER'),(6,'123456','seller1','SELLER'),(7,'123456','seller2','SELLER'),(8,'123456','seller3','SELLER'),(9,'123456','seller4','SELLER'),(10,'123456','seller5','SELLER'),(11,'123456','seller6','SELLER'),(12,'123456','seller7','SELLER'),(13,'123456','seller8','SELLER'),(14,'123456','seller9','SELLER'),(15,'123456','seller10','SELLER'),(16,'123456','seller11','SELLER'),(20,'123456','新增1','CUSTOMER'),(21,'123456','admin','ADMIN'),(22,'123456','asdfasdfasdf','SELLER'),(23,'123456','测试商家','SELLER'),(24,'123456','阿萨德飞撒的发撒地方','SELLER'),(25,'123456','阿萨德飞撒的法萨芬','SELLER'),(26,'123456','啊萨芬的撒地方打算','SELLER'),(27,'123456','啊撒的发的萨菲','SELLER'),(28,'123456','asdfsadf ','SELLER'),(29,'123456','','SELLER');

DROP VIEW IF EXISTS `t_view_activity`;
CREATE VIEW `t_view_activity` AS 
  select `t_activity`.`status` AS `status`,`t_activity`.`activity_id` AS `activity_id`,`t_activity`.`title` AS `title`,`t_city`.`city` AS `city`,`t_activity`.`dscr` AS `dscr`,`t_activity`.`imgsrc` AS `imgsrc`,`t_activity`.`point` AS `point`,`t_activity`.`datelimit` AS `datelimit`,`t_activity`.`memberlimit` AS `memberlimit`,`t_activity`.`address` AS `address`,`t_activity`.`info` AS `info`,`t_activity`.`datetime` AS `datetime`,`t_activity`.`note` AS `note` from (`t_activity` join `t_city` on((`t_city`.`city_id` = `t_activity`.`city_id`)));

#
# Source for view "t_view_collect"
#

DROP VIEW IF EXISTS `t_view_collect`;
CREATE VIEW `t_view_collect` AS 
  select `t_collect`.`collect_id` AS `collect_id`,`t_collect`.`product_id` AS `product_id`,`t_collect`.`customer_id` AS `customer_id`,`t_user`.`username` AS `username`,`t_product`.`imgsrc` AS `imgsrc`,`t_product`.`name` AS `product_name`,`t_product`.`price` AS `price` from ((`t_collect` join `t_product` on((`t_product`.`product_id` = `t_collect`.`product_id`))) join `t_user` on((`t_user`.`user_id` = `t_collect`.`customer_id`)));

#
# Source for view "t_view_community_customer"
#

DROP VIEW IF EXISTS `t_view_community_customer`;
CREATE VIEW `t_view_community_customer` AS 
  select `t_community`.`customer_id` AS `customer_id`,count(`t_community`.`customer_id`) AS `customer_number`,`t_user`.`username` AS `username` from (`t_community` join `t_user` on((`t_user`.`user_id` = `t_community`.`customer_id`))) group by `t_community`.`customer_id` order by 'num';

DROP VIEW IF EXISTS `t_view_community_discuss`;
CREATE VIEW `t_view_community_discuss` AS 
  select `t_community_discuss`.`community_discuss_id` AS `community_discuss_id`,`t_community_discuss`.`community_id` AS `community_id`,`t_community_discuss`.`datetime` AS `datetime`,`t_user`.`user_id` AS `user_id`,`t_user`.`username` AS `username`,`t_community_discuss`.`content` AS `content` from (`t_community_discuss` join `t_user` on((`t_user`.`user_id` = `t_community_discuss`.`user_id`)));

DROP VIEW IF EXISTS `t_view_community_discuss_sum`;
CREATE VIEW `t_view_community_discuss_sum` AS 
  select `t_community_discuss`.`community_id` AS `community_id`,`t_community`.`title` AS `title`,count(`t_community_discuss`.`community_discuss_id`) AS `discuss_num` from (`t_community_discuss` join `t_community` on((`t_community`.`community_id` = `t_community_discuss`.`community_id`))) group by `t_community_discuss`.`community_id`;

DROP VIEW IF EXISTS `t_view_customer`;
CREATE VIEW `t_view_customer` AS 
  select `t_customer`.`user_id` AS `user_id`,`t_customer`.`grade` AS `grade`,`t_customer`.`score` AS `score`,`t_customer`.`cellphone` AS `cellphone`,`t_customer`.`email` AS `email`,`t_customer`.`car_id` AS `car_id`,`t_customer`.`recommender_id` AS `recommender_id`,`t_customer`.`status` AS `status`,`t_customer`.`request` AS `request`,`t_user`.`password` AS `password`,`t_user`.`username` AS `username`,`t_user`.`role` AS `role` from (`t_customer` left join `t_user` on((`t_customer`.`user_id` = `t_user`.`user_id`))) where (`t_user`.`role` = 'CUSTOMER');

DROP VIEW IF EXISTS `t_view_order`;
CREATE VIEW `t_view_order` AS 
  select `t_order`.`order_id` AS `order_id`,`t_order`.`product_name` AS `product_name`,`t_product`.`end_date_time` AS `end_date_time`,`t_order`.`order_time` AS `order_time`,`t_order`.`quantity` AS `quantity`,`t_order`.`order_price` AS `order_price`,`t_user`.`username` AS `username`,`t_product`.`imgsrc` AS `imgsrc`,`t_order`.`order_status` AS `order_status`,`t_product`.`seller_id` AS `seller_id` from ((`t_order` join `t_product` on((`t_product`.`product_id` = `t_order`.`product_id`))) join `t_user` on((`t_user`.`user_id` = `t_order`.`customer_id`)));

DROP VIEW IF EXISTS `t_view_product`;
CREATE VIEW `t_view_product` AS 
  select `t_product`.`product_id` AS `product_id`,`t_product`.`type_id` AS `type_id`,`t_product`.`seller_id` AS `seller_id`,`t_product`.`product_status` AS `product_status`,`t_product`.`end_date_time` AS `end_date_time`,`t_product`.`name` AS `name`,`t_product`.`imgsrc` AS `imgsrc`,`t_product`.`describe` AS `dscr`,`t_product`.`price` AS `price`,`t_product`.`update_date` AS `update_date`,`t_product`.`original_price` AS `original_price`,`t_city`.`city` AS `city`,`t_city`.`city_id` AS `city_id` from ((`t_product` join `t_seller` on((`t_product`.`seller_id` = `t_seller`.`user_id`))) join `t_city` on((`t_seller`.`city_id` = `t_city`.`city_id`))) order by `t_product`.`update_date` desc;

DROP VIEW IF EXISTS `t_view_product_eva`;
CREATE VIEW `t_view_product_eva` AS 
  select `t_product_evaluation`.`product_eva_id` AS `product_eva_id`,`t_user`.`username` AS `user_name`,`t_product_evaluation`.`score_product` AS `score_product`,`t_product_evaluation`.`eva_content` AS `eva_content`,`t_product_evaluation`.`datetime` AS `datetime` from (`t_product_evaluation` join `t_user` on((`t_user`.`user_id` = `t_product_evaluation`.`customer_id`)));

DROP VIEW IF EXISTS `t_view_recommernd`;
CREATE VIEW `t_view_recommernd` AS 
  select `t_recommend_product`.`product_id` AS `product_id`,`t_product`.`name` AS `name`,`t_product`.`imgsrc` AS `imgsrc`,`t_product`.`describe` AS `dscr`,`t_product`.`price` AS `price`,`t_city`.`city` AS `city` from (((`t_recommend_product` join `t_product` on((`t_recommend_product`.`product_id` = `t_product`.`product_id`))) join `t_seller` on((`t_product`.`seller_id` = `t_seller`.`user_id`))) join `t_city` on((`t_seller`.`city_id` = `t_city`.`city_id`)));

DROP VIEW IF EXISTS `t_view_seller`;
CREATE VIEW `t_view_seller` AS 
  select `t_seller`.`user_id` AS `user_id`,`t_seller`.`city_id` AS `city_id`,`t_seller`.`zone_id` AS `zone_id`,`t_seller`.`type_id` AS `type_id`,`t_seller`.`description` AS `description`,`t_seller`.`position` AS `position`,`t_seller`.`img` AS `img`,`t_product_type`.`type_name` AS `type_name`,`t_product_type`.`father_id` AS `father_id`,`t_city`.`city` AS `city`,`t_city_zone`.`zone_name` AS `zone_name`,`t_user`.`password` AS `password`,`t_user`.`username` AS `username`,`t_user`.`role` AS `role` from ((((`t_seller` left join `t_product_type` on((`t_seller`.`type_id` = `t_product_type`.`type_id`))) left join `t_city` on((`t_seller`.`city_id` = `t_city`.`city_id`))) left join `t_city_zone` on(((`t_seller`.`city_id` = `t_city_zone`.`city_id`) and (`t_seller`.`zone_id` = `t_city_zone`.`zone_id`)))) left join `t_user` on((`t_seller`.`user_id` = `t_user`.`user_id`))) where (`t_user`.`role` = 'SELLER');

DROP VIEW IF EXISTS `t_view_seller_eva`;
CREATE VIEW `t_view_seller_eva` AS 
  select `t_seller`.`user_id` AS `user_id`,`t_seller_evaluation`.`seller_eva_id` AS `seller_eva_id`,`t_seller_evaluation`.`customer_id` AS `customer_id`,`t_seller_evaluation`.`datetime` AS `datetime`,`t_seller_evaluation`.`score_environment` AS `score_environment`,`t_seller_evaluation`.`score_service` AS `score_service`,`t_seller_evaluation`.`eva_content` AS `eva_content`,`t_seller_evaluation`.`seller_id` AS `seller_id`,`t_seller`.`city_id` AS `city_id`,`t_seller`.`type_id` AS `type_id`,`t_seller`.`description` AS `description`,`t_seller`.`position` AS `position`,`t_seller`.`zone_id` AS `zone_id`,`t_seller`.`img` AS `img`,`t_user`.`password` AS `password`,`t_user`.`username` AS `username`,`t_user`.`role` AS `role` from ((`t_seller_evaluation` left join `t_seller` on((`t_seller_evaluation`.`seller_id` = `t_seller`.`user_id`))) left join `t_user` on((`t_seller`.`user_id` = `t_user`.`user_id`)));

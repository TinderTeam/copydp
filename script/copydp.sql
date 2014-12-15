# Host: 127.0.0.1  (Version: 5.1.67-community)
# Date: 2014-12-15 16:17:15
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
  `datelimit` varchar(255) DEFAULT NULL,
  `memberlimit` varchar(255) DEFAULT NULL,
  `imgsrc` varchar(255) DEFAULT NULL,
  `point` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`activity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

#
# Data for table "t_activity"
#

INSERT INTO `t_activity` VALUES (1,'测试活动（国庆）','2014-10-01 00:00:00','伟大祖国生日','北京天安门','一起观看升旗仪式',NULL,'已过期','2','2014-10-7','300','10.jpg','50'),(2,'测试活动（演唱会）','2014-10-01 00:00:00','一起参加演唱会吧','某大礼堂','一起参加演唱会',NULL,'已结束','2','2014-10-3','5000','11.jpg','10'),(3,'新活动','2014-11-11 17:37:56','新活动','测试','测试<p>\r\n\t\t\t</p>',NULL,'进行中','1','2014-12-31','5','5461d8f48f51c.jpg','20'),(4,'asdf','2014-11-12 15:17:59','asdf','asdfsaf','asdfasdf<img src=undefined20141112/14157766774245.jpg _src=http://127.0.0.1:89/copydp/Public/ueditor/php/upload/20141112/14157766774245.jpg/><p><br/></p>',NULL,'进行中','2','2014-12-31','12','546309a7893c9.jpg','12'),(5,'123','2014-11-12 15:21:51','123','123213','asfd<img src=http://127.0.0.1:89/copydp/Public/ueditor/php/upload/20141112/14157769091976.jpg _src=http://127.0.0.1:89/copydp/Public/ueditor/php/upload/20141112/14157769091976.jpg/><p><br/></p>',NULL,'进行中','2','2014-12-31','12','54630a8fb7c2f.jpg','123');

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
  `status` varchar(255) DEFAULT '已报名',
  PRIMARY KEY (`activity_order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "t_activity_order"
#

INSERT INTO `t_activity_order` VALUES ('311415699308',3,1,'新活动',NULL,'5461d8f48f51c.jpg',1,'2014-12-31','2014-11-11','取消资格'),('3351415758349',3,35,'新活动',NULL,'5461d8f48f51c.jpg',5,'2014-12-31','2014-11-12','已参加');

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

#
# Data for table "t_city"
#

INSERT INTO `t_city` VALUES (1,'广州','113.270855','23.136533'),(2,'深圳','114.063918','22.550326'),(3,'上海','121.491349','31.221002'),(4,'北京','116.399275','39.917545'),(5,'南京','123','123');

#
# Structure for table "t_city_zone"
#

DROP TABLE IF EXISTS `t_city_zone`;
CREATE TABLE `t_city_zone` (
  `zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `zone_name` varchar(255) DEFAULT NULL,
  `city_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`zone_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

#
# Data for table "t_city_zone"
#

INSERT INTO `t_city_zone` VALUES (1,'福田区','2'),(2,'宝安区','2'),(3,'南山区','2'),(4,'荔湾区','1'),(5,'越秀','1'),(6,'黄埔','1');

#
# Structure for table "t_collect"
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
# Structure for table "t_community"
#

DROP TABLE IF EXISTS `t_community`;
CREATE TABLE `t_community` (
  `community_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `community_type` varchar(255) DEFAULT NULL,
  `context` varchar(5000) DEFAULT NULL,
  `datetime` date DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`community_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

#
# Data for table "t_community"
#

INSERT INTO `t_community` VALUES (15,'asdfasf','应聘信息','<p>asfdsafa<img src=\\\"http://127.0.0.1:89/copydp/Public/ueditor/php/upload/20141112/1415781887234.jpg\\\" _src=\\\"http://127.0.0.1:89/copydp/Public/ueditor/php/upload/20141112/1415781887234.jpg\\\"/></p><p>asdfdsaf<img src=\\\"http://127.0.0.1:89/copydp/Public/ueditor/php/upload/20141112/14157818927061.jpg\\\" _src=\\\"http://127.0.0.1:89/copydp/Public/ueditor/php/upload/20141112/14157818927061.jpg\\\"/></p>','2014-11-12',0),(16,'asdfsaf','招聘信息','asdfsaf<img src=http://127.0.0.1:89/copydp/Public/ueditor/php/upload/20141112/14157819166332.jpg _src=http://127.0.0.1:89/copydp/Public/ueditor/php/upload/20141112/14157819166332.jpg/><p>asdafdsafsa<img src=http://127.0.0.1:89/copydp/Public/ueditor/php/upload/20141112/14157819214804.jpg _src=http://127.0.0.1:89/copydp/Public/ueditor/php/upload/20141112/14157819214804.jpg/></p>','2014-11-12',0);

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

#
# Data for table "t_community_discuss"
#

INSERT INTO `t_community_discuss` VALUES (1,23,'测试回复',1,'2014-09-29 16:08:10'),(2,1000,'未登录匿名回复',1,'2014-09-29 16:08:36'),(3,1,'用户回复',1,'2014-09-29 16:09:25'),(4,1,'dsgaes ',1,'2014-10-09 18:37:17'),(6,0,'回帖',2,'2014-10-15 15:04:55'),(7,0,'回帖',2,'2014-10-15 15:05:23'),(8,0,'回帖',2,'2014-10-15 15:05:56'),(9,0,'回帖',2,'2014-10-15 15:06:15'),(10,0,'回帖',2,'2014-10-15 15:06:34'),(11,0,'回帖',2,'2014-10-15 15:06:50'),(12,0,'回帖',2,'2014-10-15 15:07:11'),(13,0,'回帖',2,'2014-10-15 15:13:02');

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

INSERT INTO `t_customer` VALUES (1,'S-VIP',100,'1861242099.23554','customer1@fuego.cn','粤B28469',NULL,'正常','null','2014-11-11'),(2,'VIP',200,'1862343662.94841','customer2@fuego.cn','粤B89388',NULL,'正常',NULL,'2014-11-11'),(3,'VIP',300,'1869834693.33268','customer3@fuego.cn','粤B78423',NULL,'正常',NULL,'2014-11-11'),(4,'VIP',400,'1863621374.97321','customer4@fuego.cn','粤B33313',NULL,'正常',NULL,NULL),(5,'VIP',500,'1868247745.83444','customer5@fuego.cn','粤B40858',NULL,'正常','null',NULL),(6,'SVIP',600,'1867165343.34196','customer6@fuego.cn','粤B93714',1,'正常',NULL,NULL),(7,'SVIP',700,'1865462745.13117','customer7@fuego.cn','粤B38520',2,'正常',NULL,NULL),(8,'SVIP',800,'1867373196.55985','customer8@fuego.cn','粤B43274',3,'正常',NULL,NULL),(9,'SVIP',900,'1869828938.58878','customer9@fuego.cn','粤B29052',4,'正常',NULL,NULL),(10,'SVIP',1000,'1866204335.03543','customer10@fuego.cn','粤B58789',5,'正常','null',NULL),(26,'VIP',0,'','mxl805@163.com','',NULL,'正常','null',NULL),(35,'VIP',120,'','njl1990@qq.com','',NULL,'冻结','null','2014-11-12');

#
# Structure for table "t_news"
#

DROP TABLE IF EXISTS `t_news`;
CREATE TABLE `t_news` (
  `news_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` varchar(5000) DEFAULT NULL,
  `datetime` date DEFAULT NULL,
  PRIMARY KEY (`news_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

#
# Data for table "t_news"
#

INSERT INTO `t_news` VALUES (5,'asdfsaf',NULL,'2014-11-12'),(6,'ASDassafd','asdfdsaf<p>\r\n\t\t\t\t\t\t\t\t\t\t\t\t</p>','2014-11-12');

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

INSERT INTO `t_order` VALUES ('11351415783959','asdfsaf¥10.00×1',35,11,'asdfsaf','asdfsadf',0,'2014-11-12 17:19:19',1,10,10,'已完成',NULL,'54631a74ae967.jpg'),('211411978414','测试产品（点心）¥5.00×1',1,2,'测试产品（点心）','仅售5元美味担心',0,'2014-09-29 16:13:34',1,5,10,'已使用',NULL,'2.jpg'),('6351415756767','测试产品（积分兑换）¥300.00×1',35,6,'测试产品（积分兑换）','300积分换购，全网超值',NULL,'2014-11-12 09:46:07',1,300,23,'已取消',NULL,NULL),('6351415757289','测试产品（积分兑换）¥300.00×2',35,6,'测试产品（积分兑换）','300积分换购，全网超值',NULL,'2014-11-12 09:54:49',2,300,23,'已取消',NULL,NULL);

#
# Structure for table "t_poll_code"
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

INSERT INTO `t_poll_code` VALUES ('3cSkldzIms','未使用'),('BCeGOjUgWh','未使用'),('DyMzHJV5a6','未使用'),('JiwkrmLOBp','未使用'),('s7HpKeIhMc','未使用'),('s7T113YmWV','未使用'),('XoYkViEakM','未使用'),('yNKV605Nyp','未使用'),('yUZ416vWxt','未使用');

#
# Structure for table "t_privilege"
#

DROP TABLE IF EXISTS `t_privilege`;
CREATE TABLE `t_privilege` (
  `privilege_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) DEFAULT NULL,
  `function` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`privilege_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

#
# Data for table "t_privilege"
#

INSERT INTO `t_privilege` VALUES (0,'0','MEMBER'),(1,'0','SELLER'),(2,'0','ACTIVITY'),(3,'0','COMMUNITY'),(4,'0','SYSTEM'),(5,'0','ORDER'),(12,'25','SELLER');

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

#
# Data for table "t_product"
#

INSERT INTO `t_product` VALUES (1,'[422店通用] 真功夫',1,23,'2014-09-29 00:00:00','2014-10-30 00:00:00',13.00,18.00,'仅售13元，价值19元 冬/香菇鸡腿肉饭+香滑蒸蛋套餐，仅限下午14：00-18：00，19：00-关店，不可用于机场、高铁、火车、公路服务区、会展中心店等分店，无需预约！','<p>\t\t</p><p>真功夫餐饮管理有限公司，被誉为中式快餐品牌，是中国快餐行业前五强中的本土品牌，坚持“营养还是蒸的好”的品牌定位，主营以蒸品为特色的中式快餐。1990年由潘宇海在东莞长安创办，历经初创期、标准化运作期、品牌运作期、资本运作期，实现了由个体企业向现代化企业集团的飞跃。截止2014年3月，真功夫门店数量达570家，遍布全国近40个城市，在中国市场上成为和肯德基、麦当劳鼎足而立的“快餐三巨头。”\t\t\t</p><p>\t</p>','普通','54290ff23a8a9.jpg',NULL,'已过期'),(2,'测试产品（点心）',1,11,'2014-09-29 00:00:00','2014-10-30 00:00:00',5.00,10.00,'仅售5元美味担心','美味点心','普通','2.jpg',NULL,'已过期'),(3,'测试产品（寿司）',1,11,'2014-09-29 00:00:00','2014-10-30 00:00:00',15.00,20.00,'寿司2个仅售15','日式寿司','普通','3.jpg',NULL,'已过期'),(4,'测试产品（KTV）',2,11,'2014-09-02 00:00:00','2014-11-11 00:00:00',121.00,300.00,'121元周末黄金时段包场，送丰富果盘','超长时间时间段18:00-24:00，赠送内容XXXXX','普通','1.jpg',NULL,'已过期'),(5,'测试产品（度假）',2,11,'2014-09-02 00:00:00','2014-11-11 00:00:00',300.00,600.00,'中秋月球度假只要1500元','乘坐神州飞船环游月球','专享','6.jpg',NULL,'正常'),(6,'测试产品（积分兑换）',1000,11,'2014-09-10 00:00:00','2015-01-01 00:00:00',300.00,23.00,'300积分换购，全网超值','换购产品介绍','专享','4.jpg',NULL,'正常'),(7,'新产品',0,21,'2014-12-08 00:00:00','2014-11-12 00:00:00',20.00,10.00,'新产品','dfsgsdg&nbsp;<img src=http://127.0.0.1:89/copydp/Public/ueditor/php/upload/20141208/14180220995001.jpg _src=http://127.0.0.1:89/copydp/Public/ueditor/php/upload/20141208/14180220995001.jpg/><p><br/></p>','普通','5461b11bb4da4.jpg',NULL,'待审核'),(11,'asdfsaf',3,28,'2014-11-12 00:00:00','2014-12-12 00:00:00',10.00,10.00,'asdfsadf','<p><img src=http://127.0.0.1:89/copydp/Public/ueditor/php/upload/20141112/14157809726251.jpg _src=http://127.0.0.1:89/copydp/Public/ueditor/php/upload/20141112/14157809726251.jpg/>\r\n\t\t\t\t\t\t\t\t\t\t\t\t</p><p>asfdsadf<img src=http://127.0.0.1:89/copydp/Public/ueditor/php/upload/20141112/14157809787272.jpg _src=http://127.0.0.1:89/copydp/Public/ueditor/php/upload/20141112/14157809787272.jpg/></p>','普通','54631a74ae967.jpg',NULL,'未批准');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Data for table "t_product_evaluation"
#

INSERT INTO `t_product_evaluation` VALUES (1,35,11,'2014-11-12 17:28:50',4,'asdfs ',2147483647);

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

#
# Data for table "t_recommend_product"
#

INSERT INTO `t_recommend_product` VALUES (2);

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
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `t_seller_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `t_product_type` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "t_seller"
#

INSERT INTO `t_seller` VALUES (11,'2',1,'测试用商家','114.093814,22.563142','1','5429050f6aa08.jpg','测试用商家','test'),(21,'1',16,'深圳XXK　酷麦量贩式KTV是一家大型连锁机构，纯健康娱乐的休闲场所，有专业的管理团队，打造优质的服务，家人聚会、商务应酬、生日派对、公司活动、朋友狂欢，有不同风格的包厢供您选择！发挥您无限的想象空间，酷麦带给您一波波惊喜！放下工作生活压力，快来酷麦放松体验吧！TV','113.150123,23.022696','','5429050f6aa08.jpg','<p>&lt;span style=&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;color:&quot; rgb(51,=&quot;&quot; 51,=&quot;&quot; 51);=&quot;&quot; font-family:=&quot;&quot; tahoma,=&quot;&quot; arial,=&quot;&quot; 宋体,=&quot;&quot; sans-serif;=&quot;&quot; font-size:=&quot;&quot; 14px;=&quot;&quot; line-height:=&quot;&quot; 21px;=&quot;&quot; white-space:=&quot;&quot; normal;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;=&quot;&quot;&gt;　酷麦量贩式KTV是一家大型连锁机构，纯健康娱乐的休闲场所，有专业的管理团队，打造优质的服务，家人聚会、商务应酬、生日派对、公司活动、朋友狂欢，有不同风格的包厢供您选择！发挥您无限的想象空间，酷麦带给您一波波惊喜！放下工作生活压力，快来酷麦放松体验吧！\t\t\t\t\t\t\t\t\t\t\t\t</p>','test'),(22,'2',1,'　京馔烘焙手工吐司来自湾吐司制作世家，100年家族经典创作，京馔吐司创始人是来自台湾的著名饼家，郭元益的侄子，京馔吐司的制作传承了3代人的心血，时间超过100年。由于是手工制作的原因，京馔吐司每天出炉就要5小时左右，每天只做一次，预定、是为了环保、限量、是为了保证品质，售完即止。','114.093814,22.563142','1','54290628c7eb3.jpg','<p><span style=\\\"color: rgb(51, 51, 51); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px; line-height: 21px; white-space: normal;\\\">　京馔烘焙手工吐司来自湾吐司制作世家，100年家族经典创作，京馔吐司创始人是来自台湾的著名饼家，郭元益的侄子，京馔吐司的制作传承了3代人的心血，时间超过100年。由于是手工制作的原因，京馔吐司每天出炉就要5小时左右，每天只做一次，预定、是为了环保、限量、是为了保证品质，售完即止。</span>\r\n\t\t\t\t\t\t\t\t\t\t\t\t</p>','test'),(23,'2',1,'  真功夫餐饮管理有限公司，被誉为中式快餐品牌，是中国快餐行业前五强中的本土品牌，坚持“营养还是蒸的好”的品牌定位，主营以蒸品为特色的中式快餐。1990年由潘宇海在东莞长安创办，历经初创期、标准化运作期、品牌运作期、资本运作期，实现了由个体企业向现代化企业集团的飞跃。截止2014年3月，真功夫门店数量达570家，遍布全国近40个城市，在中国市场上成为和肯德基、麦当劳鼎足而立的“快餐三巨头。”','113.885694,22.581297','2','5429099ff1fa4.jpg','<p><span style=\\\"color: rgb(51, 51, 51); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px; line-height: 21px; white-space: normal;\\\">&nbsp; 真功夫餐饮管理有限公司，被誉为中式快餐品牌，是中国快餐行业前五强中的本土品牌，坚持“营养还是蒸的好”的品牌定位，主营以蒸品为特色的中式快餐。1990年由潘宇海在东莞长安创办，历经初创期、标准化运作期、品牌运作期、资本运作期，实现了由个体企业向现代化企业集团的飞跃。截止2014年3月，真功夫门店数量达570家，遍布全国近40个城市，在中国市场上成为和肯德基、麦当劳鼎足而立的“快餐三巨头。”</span>\r\n\t\t\t\t\t\t\t\t\t\t\t\t</p>','test'),(28,'2',10,'撒的发的撒分','','2',NULL,'<p>阿萨德飞的是</p>',''),(36,'1',8,'',NULL,NULL,NULL,NULL,NULL),(37,'2',17,'asdfsadf','','3','548548b868013.png','<p>asfasdfsdaf<img src=\\\"http://127.0.0.1:89/copydp/Public/ueditor/php/upload/20141208/14180210426139.png\\\" _src=\\\"http://127.0.0.1:89/copydp/Public/ueditor/php/upload/20141208/14180210426139.png\\\"/></p>',NULL),(38,'2',17,'撒是的飞洒发放','114.103012,22.587704','2','5485491417bc9.jpg','<p><img src=\\\"http://127.0.0.1:89/copydp/Public/ueditor/php/upload/20141208/14180211959070.jpg\\\" _src=\\\"http://127.0.0.1:89/copydp/Public/ueditor/php/upload/20141208/14180211959070.jpg\\\"/>阿萨德发大水发</p>',NULL),(39,'2',11,'阿萨德飞的萨菲','114.009876,22.663497','2',NULL,'<p>阿萨德飞阿萨德飞撒地方撒</p><p><img src=\\\"http://127.0.0.1:89/copydp/Public/ueditor/php/upload/20141209/14180957631433.jpg\\\" _src=\\\"http://127.0.0.1:89/copydp/Public/ueditor/php/upload/20141209/14180957631433.jpg\\\"/></p>',NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

#
# Data for table "t_seller_evaluation"
#

INSERT INTO `t_seller_evaluation` VALUES (1,1,'2014-10-09 18:35:50',3,4,'asdfdsaf','0','211411978414'),(2,35,'2014-11-12 17:29:03',2,3,'asdfs ','0','11351415783959');

#
# Structure for table "t_site_config"
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

INSERT INTO `t_site_config` VALUES ('email','email'),('help1','撒的发的是'),('help2','帮助信息'),('help3','帮助信息'),('help4','帮助信息'),('helpC1','撒地方<p>\r\n\t\t\t\t\t\t\t\t\t\t\t\t</p>'),('helpC2','2'),('helpC3','3'),('helpC4','4'),('link1','www.fuego.cn'),('link2','www.baidu.com'),('link3','24'),('link4',''),('linkname1','孚思科技'),('linkname2','百度'),('linkname3','23'),('linkname4',''),('tel','www.fuego.cn'),('time','time');

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

INSERT INTO `t_sys_config` VALUES ('login_score',0),('order_score',0);

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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

#
# Data for table "t_user"
#

INSERT INTO `t_user` VALUES (0,'1234567','admin','ADMIN'),(1,'895528','customer1','CUSTOMER'),(2,'384201','customer2','CUSTOMER'),(3,'578767','customer3','CUSTOMER'),(4,'588611','customer4','CUSTOMER'),(5,'957814','customer5','CUSTOMER'),(6,'142008','customer6','CUSTOMER'),(7,'550471','customer7','CUSTOMER'),(8,'218143','customer8','CUSTOMER'),(9,'200981','customer9','CUSTOMER'),(10,'160493','customer10','CUSTOMER'),(11,'128570','seller1','SELLER'),(12,'478570','seller2','SELLER'),(13,'471194','seller3','SELLER'),(14,'246548','seller4','SELLER'),(15,'119412','seller5','SELLER'),(16,'698809','seller6','SELLER'),(17,'946932','seller7','SELLER'),(18,'278877','seller8','SELLER'),(19,'941955','seller9','SELLER'),(20,'481508','seller10','SELLER'),(21,'123456','ktv','SELLER'),(22,'123456','tusi','SELLER'),(23,'123456','zgf','SELLER'),(25,'123456','testadmin','ADMIN'),(26,'123456','testcustomer1','CUSTOMER'),(28,'123456','test','SELLER'),(29,'123412','test2','SELLER'),(30,'1233455','asdf','SELLER'),(31,'asdfasdf','asdfsadf','SELLER'),(32,'asdfadsf','asdfdasfdasf','SELLER'),(33,'asdfsadfads','sdfaadsfasf','SELLER'),(34,'qwerwqerqwer','wqerqwerqwr','SELLER'),(35,'320000','njl1990','CUSTOMER'),(36,'','','SELLER'),(37,'123456','asdfsdafsadfasf','SELLER'),(38,'123456','的算法的双方各撒旦个撒旦个','SELLER'),(39,'123456','阿萨德发的是','SELLER');

DROP VIEW IF EXISTS `t_view_activity`;
CREATE VIEW `t_view_activity` AS 
  select `t_activity`.`status` AS `status`,`t_activity`.`activity_id` AS `activity_id`,`t_activity`.`title` AS `title`,`t_city`.`city` AS `city`,`t_activity`.`dscr` AS `dscr`,`t_activity`.`imgsrc` AS `imgsrc`,`t_activity`.`point` AS `point`,`t_activity`.`datelimit` AS `datelimit`,`t_activity`.`memberlimit` AS `memberlimit`,`t_activity`.`address` AS `address`,`t_activity`.`info` AS `info`,`t_activity`.`datetime` AS `datetime`,`t_activity`.`note` AS `note` from (`t_activity` join `t_city` on((`t_city`.`city_id` = `t_activity`.`city_id`)));

DROP VIEW IF EXISTS `t_view_activity_order`;
CREATE VIEW `t_view_activity_order` AS 
  select `t_activity_order`.`activity_order_id` AS `activity_order_id`,`t_activity_order`.`activity_id` AS `activity_id`,`t_activity_order`.`activity_title` AS `activity_title`,`t_activity_order`.`status` AS `status`,`t_activity_order`.`datetime` AS `datetime`,`t_user`.`username` AS `username`,`t_customer`.`grade` AS `grade`,`t_customer`.`cellphone` AS `cellphone`,`t_customer`.`email` AS `email` from ((`t_activity_order` join `t_customer` on((`t_customer`.`user_id` = `t_activity_order`.`customer_id`))) join `t_user` on((`t_user`.`user_id` = `t_activity_order`.`customer_id`)));

DROP VIEW IF EXISTS `t_view_community_customer`;
CREATE VIEW `t_view_community_customer` AS 
  select `t_community`.`community_id` AS `community_id`,`t_community`.`title` AS `title`,`t_community`.`community_type` AS `community_type`,`t_community`.`datetime` AS `datetime`,`t_community`.`customer_id` AS `customer_id`,count(`t_community`.`customer_id`) AS `customer_number`,`t_user`.`username` AS `username` from (`t_community` join `t_user` on((`t_user`.`user_id` = `t_community`.`customer_id`))) group by `t_community`.`customer_id` order by 'num';

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
  select `t_order`.`order_id` AS `order_id`,`t_order`.`order_name` AS `order_name`,`t_order`.`customer_id` AS `customer_id`,`t_order`.`product_name` AS `product_name`,`t_product`.`type_id` AS `type_id`,`t_product_type`.`type_name` AS `type_name`,`t_product`.`end_date_time` AS `end_date_time`,`t_order`.`order_time` AS `order_time`,`t_order`.`quantity` AS `quantity`,`t_order`.`order_price` AS `order_price`,`t_user`.`username` AS `username`,`t_product`.`imgsrc` AS `imgsrc`,`t_order`.`order_status` AS `order_status`,`t_product`.`seller_id` AS `seller_id`,`t_view_customer`.`cellphone` AS `cellphone`,`t_view_customer`.`grade` AS `grade` from ((((`t_order` join `t_product` on((`t_product`.`product_id` = `t_order`.`product_id`))) join `t_user` on((`t_user`.`user_id` = `t_order`.`customer_id`))) join `t_view_customer` on((`t_view_customer`.`user_id` = `t_order`.`customer_id`))) join `t_product_type` on((`t_product_type`.`type_id` = `t_product`.`type_id`)));

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
  select `t_seller`.`user_id` AS `user_id`,`t_seller`.`info` AS `info`,`t_seller`.`city_id` AS `city_id`,`t_seller`.`zone_id` AS `zone_id`,`t_seller`.`type_id` AS `type_id`,`t_seller`.`description` AS `description`,`t_seller`.`position` AS `position`,`t_seller`.`img` AS `img`,`t_product_type`.`type_name` AS `type_name`,`t_product_type`.`father_id` AS `father_id`,`t_city`.`city` AS `city`,`t_city_zone`.`zone_name` AS `zone_name`,`t_user`.`password` AS `password`,`t_user`.`username` AS `username`,`t_user`.`role` AS `role` from ((((`t_seller` left join `t_product_type` on((`t_seller`.`type_id` = `t_product_type`.`type_id`))) left join `t_city` on((`t_seller`.`city_id` = `t_city`.`city_id`))) left join `t_city_zone` on(((`t_seller`.`city_id` = `t_city_zone`.`city_id`) and (`t_seller`.`zone_id` = `t_city_zone`.`zone_id`)))) left join `t_user` on((`t_seller`.`user_id` = `t_user`.`user_id`))) where (`t_user`.`role` = 'SELLER');

DROP VIEW IF EXISTS `t_view_zone`;
CREATE VIEW `t_view_zone` AS 
  select `t_city_zone`.`zone_id` AS `zone_id`,`t_city`.`city_id` AS `city_id`,`t_city`.`city` AS `city`,`t_city_zone`.`zone_name` AS `zone_name` from (`t_city_zone` join `t_city` on((`t_city`.`city_id` = `t_city_zone`.`city_id`)));

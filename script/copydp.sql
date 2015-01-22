# Host: 127.0.0.1  (Version: 5.1.70-community)
# Date: 2015-01-22 11:35:42
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
  `info` varchar(5000) DEFAULT NULL,
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

INSERT INTO `t_activity` VALUES (6,'笑谣林会员卡激活','2015-01-08 15:17:30','自2015年1月9日开始，笑谣林如意卡（普卡）将激活。平台后台成功上线。','温州市新城大厦15楼','',NULL,'进行中','7','2015-12-31','999','54ae22ab43c71.png','10');

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

INSERT INTO `t_activity_order` VALUES ('62021420801958',6,202,'笑谣林会员卡激活',NULL,'54ae22ab43c71.png',999,'2015-12-31','2015-01-09','已报名'),('62081420701466',6,208,'笑谣林会员卡激活',NULL,'54ae22ab43c71.png',999,'2015-12-31','2015-01-08','已报名');

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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

#
# Data for table "t_city"
#

INSERT INTO `t_city` VALUES (1,'广州','113.270855','23.136533'),(2,'深圳','114.063918','22.550326'),(3,'上海','121.491349','31.221002'),(4,'北京','116.399275','39.917545'),(7,'温州','120.805943','28.02872'),(9,'嘉兴','120.45','30.46'),(10,'天津','117.12','39.02'),(11,'常州','119.58','31.47'),(12,'台州','121.27','28.41'),(13,'海宁','120.42','30.32'),(14,'合肥','117.17','31.52'),(15,'安庆','117.02','30.31'),(16,'蚌埠','117.21','32.56'),(17,'亳州','115.47','33.52'),(18,'巢湖','117.52','31.36'),(19,'滁州','118.18','32.18'),(20,'阜阳','115.48','32.54'),(21,'贵池','117.28','30.39'),(22,'淮北','116.47','33.57'),(23,'淮南','116.58','32.37'),(24,'黄山','118.18','29.43'),(25,'界首','115.21','33.15'),(26,'六安','116.28','31.44'),(27,'马鞍山','118.28','31.43');

#
# Source for table "t_city_zone"
#

DROP TABLE IF EXISTS `t_city_zone`;
CREATE TABLE `t_city_zone` (
  `zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `zone_name` varchar(255) DEFAULT NULL,
  `city_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`zone_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

#
# Data for table "t_city_zone"
#

INSERT INTO `t_city_zone` VALUES (1,'福田区','2'),(2,'宝安区','2'),(3,'南山区','2'),(4,'荔湾区','1'),(5,'越秀区','1'),(7,'鹿城区','7'),(9,'瓯海区','7'),(10,'龙湾区','7'),(11,'永嘉县','7'),(12,'瑞安市','7'),(13,'乐清市','7'),(14,'文成县','7'),(15,'洞头县','7'),(16,'平阳县','7'),(17,'泰顺县','7'),(18,'苍南县','7');

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
  `context` varchar(5000) DEFAULT NULL,
  `datetime` date DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`community_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

#
# Data for table "t_community"
#

INSERT INTO `t_community` VALUES (26,'加入笑谣林（商家篇）','招聘信息','<p>&nbsp; &nbsp; &nbsp; &nbsp;笑谣林，笑，即，开心。谣，即歌谣，故事。林，即众塔成林。开心，愉悦，正能量，组合一段段正能量的歌谣故事的聚合体，也就是说：众商企一段段激励的过程，汇聚成笑谣林的文化思想。也是文化与商业的融合。相互并进，把握当局，为金融，文化，团队，教育，慈善，农业综合体等等的项目构建成因陀螺网式的立体综合体。\t\t\t\t\t\t\t\t\t\t\t\t</p><p><br/></p><p>&nbsp; &nbsp; &nbsp; &nbsp;<strong>商家如何加入笑谣林？','2014-12-18',1),(42,'人员招聘','招聘信息','<p style=text-align: center; line-height: 32px;><span style=color:#3f3f3f;font-size:16px><strong><span style=font-family: 宋体;>现因公司发展需要诚聘以下精英加盟：</span></strong><strong></strong></span></p><p style=line-height:32px><span style=color:#3f3f3f;font-size:16px><strong><span style=font-family: 宋体;>一、技术部</span></strong><strong></strong></span></p><p style=line-height:32px><span style=color:#3f3f3f;font-size:16px><strong>1. </strong><strong><span style=font-family: 宋体;>网页、</span></strong><strong>APP</strong><strong><span style=font-family: 宋体;>开发制作</span></strong><strong>&nbsp; </strong><strong><span style=font-family: 宋体;>网站维护人员</span></strong><strong>&nbsp; 2</strong><strong><span style=font-family: 宋体;>名</span></strong><strong></strong></span></p><p style=line-height:32px><span style=color:#3f3f3f;font-size:16px><strong><span style=font-family: 宋体;>任职要求：</span></strong><span style=font-family: 宋体;>有一定理论和技术基础，懂网页、</span>APP<span style=font-family: 宋体;>终端设计开发优先。</span></span></p><p style=line-height:32px><span style=color:#3f3f3f;font-size:16px><strong><span style=font-family: 宋体;>薪酬待遇：</span></strong><span style=font-family: 宋体;>实习期底薪</span>2500<span style=font-family: 宋体;>元，午餐补贴</span>400<span style=font-family: 宋体;>元。实习期满视能力保底工资</span>3000<span style=font-family: 宋体;>元以上。公司提供免费住宿、五险一金等福利。</span></span></p><p style=line-height:32px><span style=color:#3f3f3f;font-size:16px>&nbsp;<strong>2. </strong><strong><span style=font-family: 宋体;>平面设计</span></strong><strong>&nbsp; </strong><strong><span style=font-family: 宋体;>网页美工</span></strong><strong>&nbsp; 2</strong><strong><span style=font-family: 宋体;>名</span></strong></span></p><p style=line-height:32px><span style=color:#3f3f3f;font-size:16px><strong></strong></span></p><p style=line-height:32px><span style=color:#3f3f3f;font-size:16px><strong><span style=font-family: 宋体;>任职要求：</span></strong><span style=font-family: 宋体;>有一定的理论和技术基础，懂网页美化、图片处理、印刷设计等优先。</span></span></p><p style=line-height:32px><span style=color:#3f3f3f;font-size:16px><strong><span style=font-family: 宋体;>薪酬待遇：</span></strong><span style=font-family: 宋体;>实习期底薪</span>2500<span style=font-family: 宋体;>元，午餐补贴</span>400<span style=font-family: 宋体;>元。实习期满视能力保底工资</span>3000<span style=font-family: 宋体;>元以上。公司提供免费住宿、五险一金等福利。</span></span></p><p style=line-height:32px><span style=color:#3f3f3f;font-size:16px>&nbsp;<strong>3. </strong><strong><span style=font-family: 宋体;>微网站开发设计</span></strong><strong>&nbsp; 1</strong><strong><span style=font-family: 宋体;>名</span></strong></span></p><p style=line-height:32px><span style=color:#3f3f3f;font-size:16px><strong></strong></span></p><p style=line-height:32px><span style=color:#3f3f3f;font-size:16px><strong><span style=font-family: 宋体;>任职要求：</span></strong><span style=font-family: 宋体;>有一定的理论和技术基础，懂微网站、移动</span>APP<span style=font-family: 宋体;>终端设计开发优先。</span></span></p><p style=line-height:32px><span style=color:#3f3f3f;font-size:16px><strong><span style=font-family: 宋体;>薪酬待遇：</span></strong><span style=font-family: 宋体;>实习期底薪</span>2500<span style=font-family: 宋体;>元，午餐补贴</span>400<span style=font-family: 宋体;>元。实习期满视能力保底工资</span>3000<span style=font-family: 宋体;>元以上。公司提供免费住宿、五险一金等福利。</span></span></p><p style=line-height:32px><span style=color:#3f3f3f;font-size:16px>&nbsp;<strong><span style=font-family: 宋体;>二、市场部</span></strong></span></p><p style=line-height:32px><span style=color:#3f3f3f;font-size:16px><strong></strong></span></p><p style=line-height:32px><span style=color:#3f3f3f;font-size:16px><strong><span style=font-family: 宋体;>市场营销人员</span></strong><strong>&nbsp; 20</strong><strong><span style=font-family: 宋体;>名</span></strong><strong></strong></span></p><p style=line-height:32px><span style=color:#3f3f3f;font-size:16px><strong><span style=font-family: 宋体;>任职要求：</span></strong><span style=font-family: 宋体;>外貌端正，善交际，积极阳光，心里素质好，抗压能力强。</span></span></p><p style=line-height:32px><span style=color:#3f3f3f;font-size:16px><strong><span style=font-family: 宋体;>薪酬待遇：</span></strong><span style=font-family: 宋体;>实习期底薪</span>1500<span style=font-family: 宋体;>元，午餐补贴</span>400<span style=font-family: 宋体;>元，通讯补贴</span>100<span style=font-family: 宋体;>元。实习期满视能力保底工资</span>3000<span style=font-family: 宋体;>元以上。公司提供免费住宿、五险一金等福利。</span></span></p><p style=line-height:32px><span style=color:#3f3f3f;font-size:16px>&nbsp;<strong><span style=font-family: 宋体;>招聘电话：</span></strong><strong>0577</strong><strong><span style=font-family: 宋体;>—</span></strong><strong>8988&nbsp; 8507 &nbsp; &nbsp;</strong></span></p><p style=line-height:32px><strong style=color: rgb(63, 63, 63); font-size: medium;><span style=font-family: 宋体;>负责人：卓先生</span></strong><strong style=color: rgb(63, 63, 63); font-size: medium;>&nbsp; </strong><strong style=color: rgb(63, 63, 63); font-size: medium;><span style=font-family: 宋体;>手机：</span></strong><strong style=color: rgb(63, 63, 63); font-size: medium;>137&nbsp; 3631&nbsp; 7366</strong></p><p style=line-height:32px><span style=font-size:16px><strong><span style=color:#3f3f3f>&nb','2015-01-15',207);

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

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
  `vip_limit_date` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "t_customer"
#

INSERT INTO `t_customer` VALUES (127,'VIP',0,'13588949132','','浙cL9s10',NULL,'正常','null',NULL,NULL),(128,'SVIP',0,'13736317366','','',NULL,'正常','null',NULL,NULL),(186,'VIP',0,'','','',NULL,'已拒绝','null',NULL,NULL),(187,'VIP',0,'15998809102','1006911353@qq.com','',1,'正常','null',NULL,NULL),(188,'S-VIP',4,'13388537607','1205666833@qq.com','浙C1234',NULL,'正常','null','2015-01-08',NULL),(190,'VIP',0,'','','',NULL,'正常','null',NULL,NULL),(191,'VIP',0,'','yuexiaoxiao68@163.com','',NULL,'正常','null',NULL,NULL),(192,'VIP',0,'15657792582','','',NULL,'正常','null',NULL,NULL),(193,'VIP',0,'13868767891','18760609','qr790',NULL,'正常','null',NULL,NULL),(194,'VIP',0,'15857773063','147524752@qq.com','浙C9n306',NULL,'正常','null',NULL,NULL),(198,'VIP',0,'15967433992','lihyue480@163.com','',NULL,'正常','null',NULL,NULL),(199,'VIP',0,'13968985762','993638776','浙C8EG75',NULL,'正常','null',NULL,NULL),(200,'VIP',0,'','','',NULL,'正常','null',NULL,NULL),(201,'VIP',0,'','','',NULL,'正常','null',NULL,NULL),(202,'VIP',2,'13587969186','574782666@qq.com','浙C2685b',NULL,'正常','null','2015-01-09',NULL),(204,'VIP',0,'','','',NULL,'正常','null',NULL,NULL),(208,'VIP',4,'','','',NULL,'正常','null','2015-01-13',NULL),(209,'SVIP',2,'13867768991','','浙C 575D5',NULL,'正常','null','2015-01-11','2016-01-08 00:00:00'),(261,'VIP',0,'15057556760','815045150@qq.com','',NULL,'正常','null',NULL,NULL),(264,'VIP',0,'13868703703','1606857970@qq.com','浙C911Z2',NULL,'正常','null',NULL,NULL),(277,'VIP',0,'','mfkgefm@163.com','',NULL,'待审批','审批',NULL,NULL),(279,'VIP',0,'','','',NULL,'待审批','审批',NULL,NULL),(280,'VIP',0,'','','',NULL,'待审批','审批',NULL,NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

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

INSERT INTO `t_order` VALUES ('131881418621840','123¥123.00×1',188,13,'123','123',189,'2014-12-15 13:37:20',1,123,321,'已作废',NULL,'548e72d3590dc.jpg');

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

INSERT INTO `t_poll_code` VALUES ('9X0ddMrw3L','未使用'),('asCy4a6Noc','未使用'),('dHKrqsYVCb','未使用'),('gdpJG6UVAZ','未使用'),('H0yYWXH35t','未使用'),('hH3DbMStKi','未使用'),('iQYzSXd5Sx','未使用'),('iYB2bk5oGs','未使用'),('jFfeomBqOs','未使用'),('KScF93XMV2','未使用'),('kUMhLMa9Y4','未使用'),('L6EHTuYlrc','未使用'),('lu8CIOxdgY','未使用'),('MMWJCEOloj','未使用'),('OiW4FnEQW0','未使用'),('pvsnw9lFiz','未使用'),('qTQNJlowkS','未使用'),('T9n7lBpZWJ','未使用'),('TK578AN7PR','未使用'),('tLuwvTJwLr','未使用'),('TzsISB0G7Q','未使用'),('UhsMPrw64C','未使用'),('VEJDgDjfwk','未使用'),('VKJQr2aQTd','未使用'),('VmvwDL0gEa','未使用'),('Vz83Gy59Ja','未使用'),('wKfct7q6mj','未使用'),('xDWDtY5vyQ','未使用'),('xQD2qSbUHj','未使用');

#
# Source for table "t_privilege"
#

DROP TABLE IF EXISTS `t_privilege`;
CREATE TABLE `t_privilege` (
  `privilege_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) DEFAULT NULL,
  `function` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`privilege_id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

#
# Data for table "t_privilege"
#

INSERT INTO `t_privilege` VALUES (1,'1','SELLER'),(2,'1','ACTIVITY'),(3,'1','COMMUNITY'),(4,'1','SYSTEM'),(5,'1','ORDER'),(12,'25','SELLER'),(13,'1','MEMBER'),(38,'205','ACTIVITY'),(39,'205','COMMUNITY'),(40,'207','MEMBER'),(41,'207','SELLER'),(42,'207','ACTIVITY'),(43,'207','COMMUNITY'),(44,'207','ORDER'),(48,'58','MEMBER'),(49,'58','SELLER'),(50,'58','ACTIVITY'),(51,'58','COMMUNITY'),(52,'58','ORDER');

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
  `price` float DEFAULT NULL,
  `original_price` float DEFAULT NULL,
  `describe` varchar(255) DEFAULT NULL,
  `basic_infor` varchar(2000) DEFAULT NULL,
  `svip_product_id` varchar(255) DEFAULT NULL,
  `imgsrc` varchar(255) DEFAULT NULL,
  `imglist` varchar(255) DEFAULT NULL,
  `product_status` varchar(255) NOT NULL DEFAULT '待审核',
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8;

#
# Data for table "t_product"
#

INSERT INTO `t_product` VALUES (27,NULL,NULL,NULL,'2015-01-06 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'待审核'),(99,'温州金鹏宾馆—标间A',29,96,'2015-01-08 00:00:00','2015-12-31 00:00:00',328,750,'餐饮业和住宿服务','<p>\t\t</p><p>地址：温州勤奋路58号</p><p>电话：0577-88505265</p><p>\t</p>',NULL,'54ae17fc501a1.jpg',NULL,'正常'),(100,'温州金鹏宾馆—标间B',29,96,'2015-01-08 00:00:00','2015-12-31 00:00:00',298,680,'餐饮业和住宿服务','<p>\t\t</p><p>地址：温州勤奋路58号</p><p>电话：0577-88505265</p><p>\t</p>',NULL,'54ae181540d89.jpg',NULL,'正常'),(104,'温州金鹏宾馆—豪华房',29,96,'2015-01-08 00:00:00','2015-12-31 00:00:00',348,780,'餐饮业和住宿服务','<p>\t\t</p><p>地址：温州勤奋路58号</p><p>电话：0577-88505265</p><p>\t</p>',NULL,'54ae1830b44a9.jpg',NULL,'正常'),(105,'温州金鹏宾馆—行政房',0,96,'2015-01-08 00:00:00','2015-12-31 00:00:00',498,999.99,'餐饮业和住宿服务','<p>\t\t</p><p>地址：温州勤奋路58号</p><p>电话：0577-88505265</p><p>\t</p>',NULL,'54ae1845c34c5.jpg',NULL,'正常'),(107,'下午茶',1,208,'2015-01-08 00:00:00','2015-12-21 00:00:00',0,50,'免费喝下午茶喽！','<p>免费啦！免费啦！下午茶免费啦！</p><p><br/></p><p>地址：温州市新城路新城大厦15楼笑谣林</p><p>电话：0577-8988 8507</p><p></p>',NULL,'54ad40acdd3ba.jpg',NULL,'待审核'),(108,'看电影',2,206,'2015-01-08 00:00:00','2015-12-21 00:00:00',0,100,'笑谣林即将推出免费看电影！敬请期待！','<p>\t\t</p><p>\t\t</p><p>笑谣林即将推出免费看电影！敬请期待！</p><p>\t</p><p>\t</p>',NULL,'54ad4184c0508.jpg',NULL,'正常'),(109,'免费洗车',22,94,'2015-01-07 10:42:04','2016-01-01 00:00:00',0,30,'SVIP尊享每周一次免费洗车','<p>笑谣林高级会员(SVIP)尊享每周一次免费洗车。</p><p>备注：在任何一家笑谣林联盟洗车行均可。</p><p><br/></p><p>咨询热线：400-6866-618</p><p>\r\n\t\t\t</p>','5','54ad45bc1a1df.jpg',NULL,'正常'),(110,'免费洗车',22,97,'2015-01-07 10:42:04','2016-01-01 00:00:00',0,30,'SVIP尊享每周一次免费洗车','<p>笑谣林高级会员(SVIP)尊享每周一次免费洗车。</p><p>备注：在任何一家笑谣林联盟洗车行均可。</p><p><br/></p><p>咨询热线：400-6866-618</p><p>\r\n\t\t\t</p>','5','54ad45bc1a1df.jpg',NULL,'正常'),(111,'免费洗车',22,98,'2015-01-07 10:42:04','2016-01-01 00:00:00',0,30,'SVIP尊享每周一次免费洗车','<p>笑谣林高级会员(SVIP)尊享每周一次免费洗车。</p><p>备注：在任何一家笑谣林联盟洗车行均可。</p><p><br/></p><p>咨询热线：400-6866-618</p><p>\r\n\t\t\t</p>','5','54ad45bc1a1df.jpg',NULL,'正常'),(112,'免费洗车',22,101,'2015-01-07 10:42:04','2016-01-01 00:00:00',0,30,'SVIP尊享每周一次免费洗车','<p>笑谣林高级会员(SVIP)尊享每周一次免费洗车。</p><p>备注：在任何一家笑谣林联盟洗车行均可。</p><p><br/></p><p>咨询热线：400-6866-618</p><p>\r\n\t\t\t</p>','5','54ad45bc1a1df.jpg',NULL,'正常'),(113,'免费洗车',22,130,'2015-01-07 10:42:04','2016-01-01 00:00:00',0,30,'SVIP尊享每周一次免费洗车','<p>笑谣林高级会员(SVIP)尊享每周一次免费洗车。</p><p>备注：在任何一家笑谣林联盟洗车行均可。</p><p><br/></p><p>咨询热线：400-6866-618</p><p>\r\n\t\t\t</p>','5','54ad45bc1a1df.jpg',NULL,'正常'),(114,'免费洗车',22,136,'2015-01-07 10:42:04','2016-01-01 00:00:00',0,30,'SVIP尊享每周一次免费洗车','<p>笑谣林高级会员(SVIP)尊享每周一次免费洗车。</p><p>备注：在任何一家笑谣林联盟洗车行均可。</p><p><br/></p><p>咨询热线：400-6866-618</p><p>\r\n\t\t\t</p>','5','54ad45bc1a1df.jpg',NULL,'正常'),(115,'免费洗车',22,141,'2015-01-07 10:42:04','2016-01-01 00:00:00',0,30,'SVIP尊享每周一次免费洗车','<p>笑谣林高级会员(SVIP)尊享每周一次免费洗车。</p><p>备注：在任何一家笑谣林联盟洗车行均可。</p><p><br/></p><p>咨询热线：400-6866-618</p><p>\r\n\t\t\t</p>','5','54ad45bc1a1df.jpg',NULL,'正常'),(116,'免费洗车',22,146,'2015-01-07 10:42:04','2016-01-01 00:00:00',0,30,'SVIP尊享每周一次免费洗车','<p>笑谣林高级会员(SVIP)尊享每周一次免费洗车。</p><p>备注：在任何一家笑谣林联盟洗车行均可。</p><p><br/></p><p>咨询热线：400-6866-618</p><p>\r\n\t\t\t</p>','5','54ad45bc1a1df.jpg',NULL,'正常'),(117,'免费洗车',22,151,'2015-01-07 10:42:04','2016-01-01 00:00:00',0,30,'SVIP尊享每周一次免费洗车','<p>笑谣林高级会员(SVIP)尊享每周一次免费洗车。</p><p>备注：在任何一家笑谣林联盟洗车行均可。</p><p><br/></p><p>咨询热线：400-6866-618</p><p>\r\n\t\t\t</p>','5','54ad45bc1a1df.jpg',NULL,'正常'),(118,'免费洗车',22,153,'2015-01-07 10:42:04','2016-01-01 00:00:00',0,30,'SVIP尊享每周一次免费洗车','<p>笑谣林高级会员(SVIP)尊享每周一次免费洗车。</p><p>备注：在任何一家笑谣林联盟洗车行均可。</p><p><br/></p><p>咨询热线：400-6866-618</p><p>\r\n\t\t\t</p>','5','54ad45bc1a1df.jpg',NULL,'正常'),(119,'免费洗车',22,154,'2015-01-07 10:42:04','2016-01-01 00:00:00',0,30,'SVIP尊享每周一次免费洗车','<p>笑谣林高级会员(SVIP)尊享每周一次免费洗车。</p><p>备注：在任何一家笑谣林联盟洗车行均可。</p><p><br/></p><p>咨询热线：400-6866-618</p><p>\r\n\t\t\t</p>','5','54ad45bc1a1df.jpg',NULL,'正常'),(120,'免费洗车',22,155,'2015-01-07 10:42:04','2016-01-01 00:00:00',0,30,'SVIP尊享每周一次免费洗车','<p>笑谣林高级会员(SVIP)尊享每周一次免费洗车。</p><p>备注：在任何一家笑谣林联盟洗车行均可。</p><p><br/></p><p>咨询热线：400-6866-618</p><p>\r\n\t\t\t</p>','5','54ad45bc1a1df.jpg',NULL,'正常'),(121,'免费洗车',22,163,'2015-01-07 10:42:04','2016-01-01 00:00:00',0,30,'SVIP尊享每周一次免费洗车','<p>笑谣林高级会员(SVIP)尊享每周一次免费洗车。</p><p>备注：在任何一家笑谣林联盟洗车行均可。</p><p><br/></p><p>咨询热线：400-6866-618</p><p>\r\n\t\t\t</p>','5','54ad45bc1a1df.jpg',NULL,'正常'),(122,'免费洗车',22,180,'2015-01-07 10:42:04','2016-01-01 00:00:00',0,30,'SVIP尊享每周一次免费洗车','<p>笑谣林高级会员(SVIP)尊享每周一次免费洗车。</p><p>备注：在任何一家笑谣林联盟洗车行均可。</p><p><br/></p><p>咨询热线：400-6866-618</p><p>\r\n\t\t\t</p>','5','54ad45bc1a1df.jpg',NULL,'正常'),(123,'免费洗车',22,195,'2015-01-07 10:42:04','2016-01-01 00:00:00',0,30,'SVIP尊享每周一次免费洗车','<p>笑谣林高级会员(SVIP)尊享每周一次免费洗车。</p><p>备注：在任何一家笑谣林联盟洗车行均可。</p><p><br/></p><p>咨询热线：400-6866-618</p><p>\r\n\t\t\t</p>','5','54ad45bc1a1df.jpg',NULL,'正常'),(124,'免费洗车',22,196,'2015-01-07 10:42:04','2016-01-01 00:00:00',0,30,'SVIP尊享每周一次免费洗车','<p>笑谣林高级会员(SVIP)尊享每周一次免费洗车。</p><p>备注：在任何一家笑谣林联盟洗车行均可。</p><p><br/></p><p>咨询热线：400-6866-618</p><p>\r\n\t\t\t</p>','5','54ad45bc1a1df.jpg',NULL,'正常'),(125,'免费洗车',22,197,'2015-01-07 10:42:04','2016-01-01 00:00:00',0,30,'SVIP尊享每周一次免费洗车','<p>笑谣林高级会员(SVIP)尊享每周一次免费洗车。</p><p>备注：在任何一家笑谣林联盟洗车行均可。</p><p><br/></p><p>咨询热线：400-6866-618</p><p>\r\n\t\t\t</p>','5','54ad45bc1a1df.jpg',NULL,'正常'),(126,'免费洗车',22,125,'2015-01-07 10:42:04','2016-01-01 00:00:00',0,30,'SVIP尊享每周一次免费洗车','<p>笑谣林高级会员(SVIP)尊享每周一次免费洗车。</p><p>备注：在任何一家笑谣林联盟洗车行均可。</p><p><br/></p><p>咨询热线：400-6866-618</p><p>\r\n\t\t\t</p>','5','54ad45bc1a1df.jpg',NULL,'正常'),(127,'宏泰大酒店—普标单间',29,106,'2015-01-08 00:00:00','2015-12-31 00:00:00',150,450,'餐饮业和住宿服务','<p>备注：普标加收房费60元/间 标间加收90元/间</p><p>地址：瓯北镇楠江中路313号</p>',NULL,'54ae2ffeb11ee.png',NULL,'正常'),(128,'宏泰大酒店—商务单间',29,106,'2015-01-08 00:00:00','2015-12-31 00:00:00',180,520,'餐饮业和住宿服务','<p>备注：普标加收房费60元/间 标间加收90元/间</p><p>地址：瓯北镇楠江中路313号</p>',NULL,'54ae305bdbef4.png',NULL,'正常'),(129,'宏泰大酒店—商务标间',29,106,'2015-01-08 00:00:00','2015-12-31 00:00:00',180,520,'餐饮业和住宿服务','<p>备注：普标加收房费60元/间 标间加收90元/间</p><p>地址：瓯北镇楠江中路313号</p>',NULL,'54ae309671d9a.png',NULL,'正常'),(130,NULL,NULL,NULL,'2015-01-08 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'待审核'),(131,'下午茶',2,206,'2015-01-08 00:00:00','2015-12-31 00:00:00',0,50,'免费喝下午茶啦！','<p>\t\t</p><p>免费啦！免费啦！下午茶免费啦！</p><p><br/></p><p>地址：温州市新城大厦15楼</p><p>电话：0577-8988 8507</p><p>\r\n\t\t\t</p><p>\t</p>',NULL,'54ae34b972b09.jpg',NULL,'正常'),(132,'温州萱瑜伽会馆—尊享VIP体验2次',32,179,'2015-01-09 00:00:00','2015-12-31 00:00:00',0,200,'瑜伽、健身','<p>备注：并购年卡立减现金200元或赠送一个月的时间（大型活动除外）</p><p>地址：龙霞路金曲家园5栋201室</p>',NULL,'54af8971df90d.png',NULL,'正常'),(133,'永嘉县亚美大酒店—普通单（标）间',29,111,'2015-01-13 00:00:00','2015-12-31 00:00:00',145,218,'餐饮业和住宿服务','<p>\t\t</p><p>地址：永嘉县黄田镇奥康大道东联路602号</p><p>\t</p>',NULL,'54b37135e00bb.png',NULL,'正常'),(134,'苗家山寨瓯北店—店内消费8.8折（鱼头、酒水除外）',1,118,'2015-01-12 00:00:00','2015-12-31 00:00:00',0,0,'餐饮服务','<p>备注：送水果一份，平时活动凭借此卡也可以</p><p>地址：阳光大道商贸城加油站对面</p>',NULL,'54b3720d4d8ed.png',NULL,'正常'),(135,'力道国际健身会所—免费体验一次，其他6折',21,126,'2015-01-12 00:00:00','2015-12-31 00:00:00',0,0,'瑜伽、健身','<p>地址：中楠商业广场4楼</p>',NULL,'54b372e9908ff.png',NULL,'正常'),(136,'力道大家福自选火锅—消费8.8折，满100元送20元',1,133,'2015-01-12 00:00:00','2015-12-31 00:00:00',0,0,'餐饮服务','<p>地址：瓯北龙桥解南路22幢8号</p><p>电话：0577-57663122</p>',NULL,'54b373c1cb6ae.png',NULL,'正常'),(137,'界坑建国农家烧—消费九折，送水果一份',1,134,'2015-01-12 00:00:00','2015-12-31 00:00:00',0,0,'餐饮服务','<p>地址：瓯北罗浮村东湾路38号</p>',NULL,'54b37459b16cb.png',NULL,'正常'),(138,'温州易翔航空商旅服务有限公司—赠送航意价值20元一份',8,139,'2015-01-12 00:00:00','2015-12-31 00:00:00',0,0,'生活服务类','<p>地址：温州鹿城区东游大厦1103室</p><p>电话：0577-56787878&nbsp;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0577-89991111</p>',NULL,'54b374df34a6a.png',NULL,'正常'),(139,'吉田化妆造型艺术艺校—报名课程赠送课程一节',7,236,'2015-01-12 00:00:00','2015-12-31 00:00:00',0,0,'教育培训','<p>\t\t</p><p>备注：消费可享受吉田化妆造型艺术学校提供价值380元的课程体验券（需提前预约）赠送课程双方协议</p><p>地址：温州小南路国鼎大厦409号</p><p>电话：0577-88861512</p><p>\t</p>',NULL,'54b375adda49d.png',NULL,'正常'),(140,'温州天灸堂养生馆—所有项目7折优惠',8,241,'2015-01-12 00:00:00','2015-12-31 00:00:00',0,0,'养生服务','<p>地址：上吕浦锦园7幢106-107室</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 时代广场后门东浦小区3幢111号</p><p>电话：0577-88803362</p>',NULL,'54b376b762240.png',NULL,'正常'),(141,'胖子肉蟹煲瓯北店—菜品8.8折（酒水除外）送38元的鲜锦果汁一扎',1,250,'2015-01-12 00:00:00','2015-12-31 00:00:00',0,0,'餐饮服务','<p>地址：瓯北阳光大道楠江大厦15-18号</p>',NULL,'54b378c429b3f.png',NULL,'正常'),(142,'木黄茶',40,206,'2015-01-17 00:00:00','2015-12-31 00:00:00',240,298,'生活日用','<p>功效：<span style=color: rgb(0, 0, 0); font-family: 宋体; font-size: 14px;>《本草纲目》中记载：性温、味甘平、无毒；通十二经脉，除五脏恶气；益心气、平泻心火、安神、镇静、增智慧、不忘，久饮轻身不老，延年神仙。</span></p><p><span style=color: rgb(0, 0, 0); font-family: 宋体; font-size: 14px;>地址：温州新城大厦15楼C</span></p><p><span style=color: rgb(0, 0, 0); font-family: 宋体; font-size: 14px;>电话：400-6866618</span></p><p><span style=color: rgb(0, 0, 0); font-family: 宋体; font-size: 14px;>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;15563260055</span></p><p></p>',NULL,'54ba0d970ba88.png',NULL,'待审核');

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
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8;

#
# Data for table "t_recommend_product"
#

INSERT INTO `t_recommend_product` VALUES (14),(15),(16),(17),(19),(21),(22),(23),(24),(99),(100),(104),(105),(106),(108),(127),(128),(129),(131),(132),(133),(134),(135),(136),(137),(138),(139),(140),(141);

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
  `qr_code` varchar(255) DEFAULT 'false',
  `seller_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `t_seller_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `t_product_type` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "t_seller"
#

INSERT INTO `t_seller` VALUES (91,'7',29,'凭笑谣林如意卡、民生笑谣林卡可享有：6.5折(除节假日以外)','','11','5487ebde4999c.jpg','<p>地址：上塘镇县前路126号</p><p>电话：0577-67268418</p>','正常','true','永嘉县钱塘世纪大酒店'),(92,'7',36,'凭笑谣林如意卡、民生笑谣林卡可享有：所有乐器一律八折优惠 除雅马哈，琴行双排键 课程体验2节免费','','7','5487ecf3041e0.jpg','<p>地址：温州鹿城区小南路78号</p>','正常','true','温州省鹿城区大南新星琴行'),(93,'7',15,'凭笑谣林如意卡、民生笑谣林卡可享有：8.8折 酒水不打折 反满158元送农家豆腐一份，满308送飘香鸭头一份','','7','54b62e2335195.png','<p>地址：鹿城区站前车东小区金都花园114-117号</p><p>电话：0577-86078099</p>','正常','true','农家湾土菜馆'),(94,'7',22,'凭笑谣林如意卡、民生笑谣林卡可享有：每周免费洗车1次','','7','5487ee97d5e29.jpg','<p>地址：温州市宏源路宏源锦园1.2.3幢105-108室</p>','正常','true','温州新星汽车美容有限公司'),(95,'7',15,'凭笑谣林如意卡、民生笑谣林卡可享有：每周一至每周五中午8.8折  晚上4:30后8.5折 周六周日全天8.5折','','7','5487ef497bc61.jpg','<p>地址：温州市学院西路2-2号</p>','正常','true','温州我家食堂餐饮有限公司'),(96,'7',29,'凭笑谣林如意卡、民生笑谣林卡可享有：标A：原价750元，折后价328元，标B：原价;680元，折扣价：298元，豪华单价：原价780元，折后价：348元，行政单价;原价：1125元，折后价：498','','7','54b0d7c0216f0.png','<p>地址：温州勤奋路58号</p>','正常','true','温州金鹏宾馆'),(97,'7',22,'凭笑谣林如意卡、民生笑谣林卡可享有：每周免费洗车1次','','7','5487f3682d552.jpg','<p>地址：温州新城雁荡西路285号</p>','正常','true','温州新城技术产业开发区优拓汽车美容装潢店'),(98,'7',22,'凭笑谣林如意卡、民生笑谣林卡可享有：每周免费洗车1次','','7','5487f434a09c3.jpg','<p>地址：温州大道上田段中石油加油站内&lt;家乐福超市边上&gt;</p>','正常','true','温州新城技术产业开发区优拓汽车美容装潢店分店'),(99,'7',36,'凭笑谣林如意卡、民生笑谣林卡可享有：乐器培训免费体验两节，乐器（除特价外）全场八折，钢琴品牌，卡瓦依钢琴，长江钢琴，巴特.罗宾逊钢琴，珠江钢琴，查伦钢琴。','','7','54b62b9b49f07.png','<p>地址：车站大道148号</p>','正常','true','声海琴行/艺校'),(100,'7',32,'凭笑谣林如意卡、民生笑谣林卡可享有：剪发八折，烫染七折、欧莱雅护理一次88元','','10','5487f5ca1de19.jpg','<p>地址：龙湾状元中华路</p>','正常','false','名爵理发店'),(101,'7',22,'凭笑谣林如意卡、民生笑谣林卡可享有：每周免费洗车1次（七座以下）','','10','5487f652daaf3.jpg','<p>地址：温州市龙湾区府永宁路宏欣家园10幢110-111</p>','正常','false','忠信汽车卫士'),(103,'7',40,'凭笑谣林如意卡、民生笑谣林卡可享有：1.本中心健康体验项目8.8折优惠。2.参加本中心推出的免费体验项目。3.专家私人定制体检套餐。4.享有畅通体验优先特权。注：不与本中心其他优惠活动同时进行','','11','54b5d859c89ff.png','<p>地址：江北街北段</p><p>电话：0577-67386668</p>','正常','false','永嘉友好综合门诊部有限公司'),(104,'7',32,'凭笑谣林如意卡、民生笑谣林卡可享有：vip年卡的八折优惠','','11','54b36760a97d7.png','<p>地址：永嘉县瓯北镇龙桥新街50号</p><p>电话：0577-21661666</p>','正常','false','永嘉县印莲瑜伽会馆'),(105,'7',29,'凭笑谣林如意卡、民生笑谣林卡可享有：协议价豪华套间588-358 行政单间208-358 普通单间148-208 标间158-208 桑拿浴78-98','','11','54b5dd4381053.png','<p>地址：永嘉县瓯北镇江北街</p>','正常','false','蓝色海湾国际酒店有限公司'),(106,'7',29,'凭笑谣林如意卡、民生笑谣林卡可享有：普标单间150元 商务单间 商务标间180元/间  普标加收房费60元/间 标间加收90元/间','','11','54b0d7f7dcf58.png','<p>地址：瓯北镇楠江中路313号</p>','正常','false','永嘉县宏泰大酒店有限公司'),(107,'7',29,'凭笑谣林如意卡、民生笑谣林卡可享有：花意酒窝vip卡拥有的所有活动折扣','','11','54b5dcf20e233.png','<p>地址：永嘉双塔路1036号</p>','正常','false','锦江花意酒窝大酒店'),(108,'7',29,'凭笑谣林如意卡、民生笑谣林卡可享有：平日享有7-8折的优惠（除节假日以外）','','11','54b360ad29034.png','<p>地址：永嘉县瓯北镇楠江东路215-217号</p><p>电话：0577-66990777</p>','正常','false','温州国贸宾馆清水埠分店'),(109,'7',29,'凭笑谣林如意卡、民生笑谣林卡可享有：平日享有8.5折的优惠（除节假日以外）','','11','5494fd918fb6e.JPG','<p>地址：楠江中路37号</p>','正常','false','大丰宾馆'),(110,'7',29,'凭笑谣林如意卡、民生笑谣林卡可享有：平日享有4.7折（除节假日以外）','','11','54b3612fa7d4d.png','<p>地址：江北街南段皇都宾馆</p><p>电话：0577-67985888</p>','正常','false','永嘉瓯北镇皇都宾馆'),(111,'7',29,'凭笑谣林如意卡、民生笑谣林卡可享有：普通单（标）间145元','','11','54b366e2838fe.png','<p>地址：永嘉县黄田镇奥康大道东联路602号</p>','正常','false','浙江省永嘉县亚美大酒店有限公司'),(112,'7',29,'凭笑谣林如意卡、民生笑谣林卡可享有：平日享有8.5折的优惠（除节假日以外）','','11','54b0d8849d465.png','<p>地址：瓯北晨光路3-5号</p>','正常','false','瓯北晨江宾馆'),(113,'7',29,'凭笑谣林如意卡、民生笑谣林卡可享有：平日享有8.6折的优惠（除节假日以外）','','11','54b36065c0d4e.png','','正常','false','富尔玛宾馆'),(114,'7',29,'凭笑谣林如意卡、民生笑谣林卡可享有：平日享有8.7折的优惠（除节假日以外）','','11','5492465a56e78.jpg','','正常','false','欧莱坊商务宾馆'),(115,'7',29,'凭笑谣林如意卡、民生笑谣林卡可享有：1.享有8.5折的优惠(除节假日以外)2、连续住满十天并送一天（间）','','11','5494fe83b79ef.JPG','<p>地址：创新路10号</p><p>电话：0577-67997888</p>','正常','false','华丰宾馆'),(116,'7',40,'凭笑谣林如意卡、民生笑谣林卡可享有：享有8折优惠','','11','54b364fc8600b.png','<p>地址：双塔路1469号</p>','正常','false','能匠皮具护理'),(117,'7',15,'凭笑谣林如意卡、民生笑谣林卡可享有：店内常规折扣为8.8折，除海鲜之外，另送水果一份','','11','549248fe9672c.jpg','<p>地址：瓯北阳光大道商贸城D幢1号</p>','正常','false','一品家百味小厨'),(118,'7',15,'凭笑谣林如意卡、民生笑谣林卡可享有：店内消费一律8.8折（鱼头、酒水除外）另送水果一份，平时活动凭借此卡也可以','','11','54b363f7c5568.png','<p>地址：阳光大道商贸城加油站对面</p>','正常','true','苗家山寨（瓯北店）'),(119,'7',15,'凭笑谣林如意卡、民生笑谣林卡可享有：店内常规折扣为8.8折，（除酒水饮料之外），另送水果、干果各一份','','11','5495061400538.JPG','<p>地址：瓯北阳光大道商贸城115-117号</p><p>电话：0577-66990358</p>','正常','false','源香湘菜食府'),(120,'7',16,'凭笑谣林如意卡、民生笑谣林卡可享有：锦江量贩ktv的vip活动','','11','549245b92848a.jpg','<p>地址：双塔路1036号</p>','正常','true','锦江量贩ktv'),(121,'7',29,'凭笑谣林如意卡、民生笑谣林卡可享有：8.8折（除节假日以外）','','11','54b360e7664fe.png','<p>地址：富强路1号</p><p>电话：0577-83905555</p>','正常','false','汉庭酒店'),(122,'7',33,'凭笑谣林如意卡、民生笑谣林卡可享有：到本店消费可享有8折优惠。（产品除外）','','11','54b3252b069ad.png','<p>地址：瓯北镇龙桥新街阳光景园38号</p>','正常','false','罗马风情美发会所连锁店'),(123,'7',29,'凭笑谣林如意卡、民生笑谣林卡可享有：在本娱乐会所消费可赠送12支青岛或百威啤酒，瓜子两份','','11','5494fde511fd1.JPG','<p>地址：瓯北人人国际酒店</p>','正常','true','东欧明珠会所（人人酒店）'),(124,'7',29,'凭笑谣林如意卡、民生笑谣林卡可享有：客房标间6折优惠。（除节假日以外）','','11','5492494096e22.jpg','<p>地址：上塘县前路85号</p><p>电话：0577-67220888&nbsp;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0577-67237155</p>','正常','false','永嘉宾馆'),(125,'7',22,'凭笑谣林如意卡、民生笑谣林卡可享有：每周免费洗车1次','','11','549504a7551c1.JPG','<p>地址：瓯北镇永宁路</p><p>电话：0577-67990771</p>','正常','false','永嘉县城市风情装潢护理中心'),(126,'7',21,'凭笑谣林如意卡、民生笑谣林卡可享有：免费消费一次（体验），其他6折优惠','','11','54b3637f237f7.png','<p>地址：中楠商业广场4楼</p>','正常','true','力道国际健身会所'),(130,'7',22,'凭笑谣林如意卡、民生笑谣林卡可享有：每周免费洗车1次，其他费用8.8折','','11','54b325b72cd87.png','<p>地址：永嘉县瓯北镇龙桥东宁苑7幢店面</p>','正常','false','永嘉县秀东汽车修理厂'),(131,'7',17,'凭笑谣林如意卡、民生笑谣林卡可享有：体验产品，健康咨询、服务。营养早餐、五谷杂粮八折','','11','54b32c361681f.png','<p>地址：永嘉县上塘镇</p>','正常','false','温州市康寿健康咨询有限公司'),(132,'7',15,'凭笑谣林如意卡、民生笑谣林卡可享有：入住可享受5折，节假日8折，烤全羊8.5折，买和菜送花生，酒水八折，享受景区门票8折优惠。','','11','54b3641e9fc1c.png','<p>地址：永嘉县楠溪江狮子岩景区</p>','正常','false','楠味一村'),(133,'7',10,'凭笑谣林如意卡、民生笑谣林卡可享有：消费可享受8.8折的优惠，满100元再赠送20元','','11','54b363cb2fb6a.png','<p>地址：瓯北龙桥解南路22幢8号</p><p>电话：0577-57663122</p>','正常','true','力道大家福自选火锅'),(134,'7',15,'凭笑谣林如意卡、民生笑谣林卡可享有：在本店消费可享受九折另送水果一份','','11','54b362795a5e7.png','<p>地址：瓯北罗浮村东湾路38号</p>','正常','false','界坑建国农家烧'),(135,'7',29,'凭笑谣林如意卡、民生笑谣林卡可享有：到本店入住迷你间原价468元，现价210元，行政单价原价555元，现价230元，豪华商务单价598元，现价230元，行政标间658元，现价260元','','11','5492456745f11.jpg','<p>地址：永嘉县瓯北镇双塔路1036号</p>','正常','false','锦江大酒店'),(136,'7',22,'凭笑谣林如意卡、民生笑谣林卡可享有每周免费洗车1次（七座以下）','','7','54b090fa28024.png','<p>地址：黄龙住宅区新世界新家园15幢115-120号</p><p>电话：0577-88766151</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;0577-89777904</p>','正常','true','温州市鹿城区黄龙建网汽车美容店分店'),(137,'7',36,'凭笑谣林如意卡、民生笑谣林卡可享有：1.成人K歌培训2课时、成人吉他速成培训2课时可以免费试听2成人K歌培训每期20课时，学费600元，转发微信优惠50元，3成人吉他培训每期16课时，学费550元，转发微信送吉他一把，每课时45min，每次学习2课时。','','7','54b32d3289eb6.png','<p>地址：鹿城区上徒门二组团30-102</p>','正常','false','温州羽艺艺术培训'),(138,'7',36,'凭笑谣林如意卡、民生笑谣林卡可享有：《小媚琴行》所有乐器八折 除雅马哈钢琴以外 免费体验声乐，古筝、钢琴、葫芦丝半个月','','7','54b32d6ad6506.png','<p>地址：温州市欧洲城华中大厦1幢903号</p>','正常','true','温州市鹿城区双屿小媚琴行'),(139,'7',28,'凭笑谣林如意卡、民生笑谣林卡可享有：所购买的机票，可赠送航意价值20元一份','','7','54b36798ae566.png','<p>地址：温州鹿城区东游大厦1103室</p><p>电话：&nbsp;0577-56787878&nbsp;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;0577-89991111</p>','正常','false','温州易翔航空商旅服务有限公司'),(140,'7',32,'凭笑谣林如意卡、民生笑谣林卡可享有：1。常青肾保项目原价278元，协议价格为178元每次','','7','54b5dcc287b10.png','<p>地址：鹿城区东泉花园2幢6-8号</p>','正常','false','温州市半岛常青堂养生会所'),(141,'7',22,'凭笑谣林如意卡、民生笑谣林卡可享有：每周免费洗车1次（限七楼以下）喷漆、汽车美容、汽车装潢、汽车修理打折8.5折','','7','54b32e0171c54.png','<p>地址：温州大道金鼎花苑旁</p><p>电话：0577-86781509</p>','正常','false','温州市站前车威汽车美容店'),(142,'7',33,'凭笑谣林如意卡、民生笑谣林卡可享有：凭借此卡在本店单项8折 烫加染7折（美发、美容项目）','','7','54b62cbd13c26.png','<p>地址：下吕浦春晖路233号</p>','正常','false','英伦美琪美容美发公馆'),(143,'7',29,'凭笑谣林如意卡、民生笑谣林卡可享有：客房入住6折优惠','','7','5492478920209.jpg','<p>地址：南浦路12号</p>','正常','false','温州市汇丰商务宾馆有限公司'),(144,'7',29,'凭笑谣林如意卡、民生笑谣林卡可享有：在本酒店入住可享受1、客房：4.5折 2、餐饮赠送水果盘一份3、会场：8折','','7','54b630d877f54.png','<p>地址：（九山)游泳桥路9号</p>','正常','false','金球国豪大酒店'),(145,'7',15,'凭笑谣林如意卡、民生笑谣林卡可享有：1、套餐送水果和热饮（奶茶或豆浆）或汤（盖饭不算套餐）2、两混两素套餐15元一份，加送汤，20元起送。','','7','549245db24c67.jpg','<p>地址：清源路119号</p>','正常','false','酷爱简餐'),(146,'7',22,'凭笑谣林如意卡、民生笑谣林卡可享有：每周免费洗车1次（七座以下）','','7','54b32ebe05035.png','<p>地址：温州鹿城区下吕浦车站大道华海广场2-3号楼108号（华夏银行后面）</p>','正常','false','温州市丽景汽车美容维修中心'),(147,'7',20,'凭笑谣林如意卡、民生笑谣林卡可享有：11:00-14:00点1、免费提供柠檬水一杯每人，2、满50元享受8.8折 3、满100元享受8.8折，送可乐/雪碧一杯，4、17:00-19:00点蛮300有1、2两点的优惠同时，满200元享受8.8折的同时还送花生一份5、19:00-22:00满300送可乐/雪碧2杯、花生一份（以上优惠不同其他优惠同时使用），谢绝自带酒水食品，节假日不享受此优惠，店内免费提供wifi 优惠信息按照商家要求随时调整','','7','54b62ddb3fc3c.png','<p>地址：温州市鹿城区瑞德景园A栋101室</p>','正常','false','欧点咖啡'),(148,'7',32,'凭笑谣林如意卡、民生笑谣林卡可享有：局部减肥600元，50次一疗程（加15次）免费。年卡1200元送一支药膏（无数次限制）。药膏买10送1，买15送2，买20送3','','7','54b62d83372f5.png','<p>地址：温州鹿城区黎明西路231号海螺大楼北202室</p>','正常','false','秋华减肥'),(149,'7',29,'凭笑谣林如意卡、民生笑谣林卡可享有：入住酒店可享有标房：208元/天 商务标间（单）278元/天 ，套餐A、378元/套餐B、418元/间，豪华套餐 528元/间','','7','54924727646af.jpg','<p>地址：温州大道1702号（汽车新南站旁边）</p>','正常','false','温州金茂皇冠大酒店'),(150,'7',32,'凭笑谣林如意卡、民生笑谣林卡可享有：体验基础护理两次 （每月两次），免费体验女士胸部或肩颈/男士肾部或肩颈2次，其它产品8.5折优惠','','7','549500ad2e6ad.JPG','<p>地址：黄田街44号</p><p>电话：0577-57991296</p>','正常','false','景俏美容养生会所'),(151,'7',22,'凭笑谣林如意卡、民生笑谣林卡可享有：每周免费洗车1次（七座以下）','','7','54b32fa887ae9.png','<p>地址：温州市龙霞路疗前</p>','正常','false','温州市瓯海区悟田初效汽车装潢美容服务部'),(152,'7',10,'凭笑谣林如意卡、民生笑谣林卡可享有：散客消费九折优惠（不含税点、酒烟），送水果拼盘一份，和菜优惠同店内宣传','','7','54923aeec0811.jpg','<p>地址：温州市法派路38号（车管所北大门对面）</p>','正常','false','阿隆海鲜坊餐饮有限公司'),(153,'7',22,'凭笑谣林如意卡、民生笑谣林卡可享有：每周免费洗车1次','','7','549244d986250.jpg','<p>地址：学院东路金开利花园149号</p>','正常','false','金开立汽车美容服务部'),(154,'7',22,'凭笑谣林如意卡、民生笑谣林卡可享有：每周免费洗车2次','','7','54923b4a2842d.jpg','<p>地址：温州市鹿城区金桥路99-105号</p>','正常','false','车友汇汽车酷装美容'),(155,'7',22,'凭笑谣林如意卡、民生笑谣林卡可享有：每周免费洗车2次','','7','549246e7ac863.jpg','<p>地址：温州市东港路32-42号</p>','正常','false','温州合众汽车快修服务行'),(156,'7',36,'凭笑谣林如意卡、民生笑谣林卡可享有：基础乐理eg:木吉他、爵士鼓、流行声乐、尤克里里、非洲鼓、电吉他、bass、钢琴、MID制作等以上任意课程可免费体验一次','','7','54b3307012920.png','<p>地址：上徒门7组团惠民路108号</p>','正常','false','温州市沸腾琴行'),(157,'7',29,'凭笑谣林如意卡、民生笑谣林卡可享有：入住酒店，客房可享受4.3折的优惠价格，包厢用餐送水果拼盘一份。','','7','549248ba26e92.jpg','<p>地址：温州市南浦路157号</p><p>电话：0577-88018888</p>','正常','false','温州云天楼国际酒店有限公司'),(158,'7',29,'凭笑谣林如意卡、民生笑谣林卡可享有：原价豪华房768元/间，可享受折扣5.5折，门市价1280+10%','','7','54924704ed825.jpg','<p>地址：温州市信河街1号</p>','正常','false','温州华侨饭店'),(159,'7',29,'凭笑谣林如意卡、民生笑谣林卡可享有：1.普通会员客房价格可享受5.5折，网络公开价格为5.5折价格，2、VIP会员客房价格可享受5折折扣，需注册登录后可显示此价格','','7','54b62d0c64265.png','<p>地址：温州东游路4号</p><p>电话：0577-88077777</p>','正常','false','温州新南亚大酒店有限公司'),(160,'7',16,'凭笑谣林如意卡、民生笑谣林卡可享有：进本店消费可享受指定啤酒，买六送六（除节假日以外）','','7','54b5db6cf0b26.png','<p>地址：南唐路2号楼1楼</p>','正常','false','51CLUB酒吧'),(161,'7',16,'凭笑谣林如意卡、民生笑谣林卡可享有：进本店消费可享受八折优惠，并赠送水果拼盘一份。','','7','54b331597bb2b.png','<p>地址：鹿城区南唐风貌北区3号1-6号</p>','正常','false','南塘凌晨啤酒吧（AP）'),(162,'7',20,'凭笑谣林如意卡、民生笑谣林卡可享有：在本店消费可享受八折的优惠','','7','54b3317fe2697.png','<p>地址：南塘街2号楼2-1-7</p>','正常','false','温州市鹿城区南浦哈里茶吧'),(163,'7',22,'凭笑谣林如意卡、民生笑谣林卡可享有：每周免费洗车1次，车辆维修工时费8.5折，配件优惠9.5折','','7','5492476669e1e.jpg','<p>地址：温州市葡萄棚路32号</p>','正常','false','温州市豪邦轿车维修有限公司'),(164,'7',29,'凭笑谣林如意卡、民生笑谣林卡可享有：5.5折-7折的优惠，并赠送迎宾水果一份','','7','549247f9e3c46.jpg','<p>地址：浙江温州市民航路2号</p>','正常','false','温州王朝大酒店'),(165,'7',40,'凭此卡可享受9折优惠','','7',NULL,'<p>地址：鹿城区府学巷119号</p><p>电话：13057712345</p>','冻结','false','\\\"构“服装私人定制'),(166,'7',20,'凭此卡到本店免费品茶，笔法享受超低会员折扣价','','7',NULL,'<p>地址：温州市桥儿头南唐五组团江南茶市12号</p><p>电话：18257766726</p>','冻结','false','最远红茶行'),(167,'7',16,'凭笑谣林如意卡、民生笑谣林卡可享有：在本店消费可享受满雅座最低价，（除本店即使活动外）消费可免费赠送酒水拼盘一份或其他小吃三分（一桌只限消费一次）','','7','54924747cf6e6.jpg','<p>地址：温州市奥戈娱乐有限公司</p>','正常','false','温州市奥戈娱乐有限公司'),(168,'7',15,'凭笑谣林如意卡、民生笑谣林卡可享有：到本店消费可享受8.8折的优惠，并送水果一份，套餐以店家的信息为准','','7','54b3323fd2a52.png','<p>地址：望江东路</p>','正常','false','奶奶私房菜'),(169,'7',17,'凭笑谣林如意卡、民生笑谣林卡可享有：在本店第一次消费可享受瑞典SPA体验价188元/次，并且成为会所会员后，享受会员权限，同时，额外赠送一千元原价消费的项目','','7','54b3325d22a48.png','<p>地址：温州市锦绣路万康商务中心二楼</p><p>电话：0577-85557725</p>','正常','false','温州百惠健康管理中心'),(170,'7',29,'凭笑谣林如意卡、民生笑谣林卡可享有：入住可享受4.5折的优惠，含免费早餐2份。','','7','549246a254232.jpg','<p>地址：温州市温州大道火车站西首（汽车新南站对面）</p><p>电话：0577-86785888&nbsp;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 0577-86785588</p>','正常','false','温州繁东宾馆'),(171,'7',15,'凭此卡消费可享受9折的优惠，订包厢消费可享受免费K歌，消费满一桌大厅可免费提供投影','','7',NULL,'<p>地址：温州市西山东路</p><p>电话：13968960658</p>','冻结','false','温州市胡儿丽娅鹿产品开发有限公司'),(172,'7',20,'凭此卡消费可享受8.5折优惠（指定套餐）指定包厢享受免费欢唱，食品酒水自费，时间按12:00-17:00','','7',NULL,'<p>地址：九山游泳路9号</p><p>电话：13057780819</p>','冻结','false','金秋音乐茶吧'),(173,'7',29,'凭笑谣林如意卡、民生笑谣林卡可享有：入住可享受客房五折优惠，免费上网停车、长途电话','','7','5492453fbfa9d.jpg','<p>地址：温州市欧洲城一期七幢</p><p>电话：0577-88005555</p>','正常','false','金斯顿欧情宾馆'),(174,'7',29,'凭笑谣林如意卡、民生笑谣林卡可享有：入住可享受5-7折的优惠','','7','54924824e45a1.jpg','<p>地址：温州市鹿城区</p><p>电话：400-1205-900</p>','正常','false','温州香格里拉大酒店'),(175,'7',29,'凭笑谣林如意卡、民生笑谣林卡可享有：入住可享受5折的优惠。增值优惠：1.免费享受十二赠一客房券一张，价值798元，2.免费使用康体中心游泳池游泳/单次，3.免费使用康体中心健身房，4.免费赠送当日报纸，5.免费赠送大堂吧冰水1杯，6.中餐厅包厢费全免，7.万豪西餐厅海鲜自助午餐、晚餐优惠20元，8.退房当日可延迟至14:00前办理结账手续，免收额外半天房费。','','7','549247d061d5d.jpg','<p>地址：温州大道2409号</p><p>电话：0577-88089181</p>','正常','false','温州万豪商务大酒店'),(176,'7',15,'凭笑谣林如意卡、民生笑谣林卡可享有：8.8折的优惠','','7','54b333c83c1fa.png','<p>地址：汤家桥北路1688号</p><p>电话：0577-88398772</p>','正常','false','瑞乐缘养生素食'),(177,'7',16,'凭笑谣林如意卡、民生笑谣林卡可享有：啤酒买一送一节假日都送','','7','54950415a7f39.JPG','<p>地址：永嘉瓯北阳光大厦2楼</p>','正常','false','永嘉名人KTV俱乐部有限公司'),(178,'7',32,'凭笑谣林如意卡、民生笑谣林卡可享有：首次免费体验面部护理或身体护理1次（价值198元），会员享受8.8折','','7','54b62b16e1dc1.png','<p>地址：府前街利府大楼9楼</p>','正常','false','瑞珂美容养生馆'),(179,'7',32,'凭笑谣林如意卡、民生笑谣林卡可享有：会馆提供VIP尊享体验两次，价值200元，并购年卡立减现金200元或赠送一个月的时间（大型活动除外）','','10','54b0d814c6238.png','<p>地址：龙霞路金曲家园5栋201室</p>','正常','false','温州萱瑜伽会馆'),(180,'7',22,'凭笑谣林如意卡、民生笑谣林卡可享有：每周免费洗车1次（七座以下），本店另外可快修服务（美容、镀金、镀膜、打膜8折优惠）','','10','54b334b6a8721.png','<p>地址：永中街道普门建中南街</p>','正常','false','一顺汽车美容服务部'),(181,'7',29,'凭笑谣林如意卡、民生笑谣林卡可享有：金卡8.2折的优惠','','10','54b334da3aa1f.png','<p>地址：温州经济开发区钱江路85号</p>','正常','false','温州轩驿酒店管理有限公司'),(182,'7',29,'凭笑谣林如意卡、民生笑谣林卡可享有：入住酒店客房可享受3.9折至5折的优惠','','10','549247a9283b9.jpg','<p>地址：江心西园</p><p>电话：0577-88066666</p>','正常','false','温州市江心海景酒店'),(183,'7',36,'凭笑谣林如意卡、民生笑谣林卡可享有：每人可拥有周卡一张（一周时间随意）办年卡可享有8.8折。','','10','54b3351da34f6.png','<p>地址：状元耐宝路御史桥村委会二楼</p><p>电话：0577-86380509</p>','正常','false','温州市龙湾区国颜艺术培训中心'),(184,'7',29,'凭笑谣林如意卡、民生笑谣林卡可享有：客房的4.5折','','10','5492467f5b15c.jpg','<p>地址：龙湾区永强七道4567号</p>','正常','false','温州滨海五星级酒店'),(185,'7',29,'凭笑谣林如意卡、民生笑谣林卡可享有：4.3折（另加10%的服务费）会议室6折。1.入住当天赠送精美欢迎果篮一份，2.每日免费享用网上冲浪一小时，3.延迟退房至下午两点（视酒店住房情况而而定）4.免费接收传真5.房内免费宽带上网6.免费使用健身房（每房每日限一次，不可累积使用）7.网球场享受八折优惠（不可累积使用）8.商务中心服务九折优惠（长途电话除外）       细则1.订房请提前以传真或电话形式通知客户经理2.如无特殊要求，预订房将保留至当天18:00  3.注满16间夜则免费入住1间夜（以酒店电脑累','','10','549248d9014dc.jpg','<p>地址：龙湾区瑶溪镇</p>','正常','false','瑶溪王朝大酒店'),(189,'7',10,'123',NULL,NULL,NULL,NULL,'冻结','false','z199311172634'),(195,'7',22,'凭笑谣林如意卡、民生笑谣林卡可享有：每周免费洗车1次，本店另外可美容装潢 钣金 喷漆 违章处理 保养 发动机维修','','11','54a23baa22d23.jpg','<p>地址：昌新路11-15号</p>','正常','false','永嘉县瓯北镇中邦汽车服务'),(196,'7',22,'凭笑谣林如意卡、民生笑谣林卡可享有：每周免费洗车1次，本店另外可贴膜、抛光、打蜡音响系统升级，镀膜 封釉。汽车防盗系统 内饰干洗、安装倒车雷达等。划痕处理、喷漆 、专业补胎换胎、以旧换新','','11','54a23c82d705f.jpg','<p>地址：温州市永嘉县瓯北镇创业路30号（创业桥边）</p>','正常','false','靓捷车欲城'),(197,'7',22,'凭笑谣林如意卡、民生笑谣林卡可享有：每周免费洗车1次，本店另外可发动机保养、 钣金 、喷漆、 汽车贴膜、 装潢 、美容','','11','54a23d53033b4.jpg','<p>地址：瓯北中楠广场173-176号</p>','正常','false','永嘉益昌轿车维修有限公司'),(203,'7',20,'',NULL,NULL,NULL,NULL,'正常','true','观自斋'),(206,'7',40,'','','7','54ae2bd8a1044.jpg','<p>&nbsp; &nbsp; &nbsp;笑谣林，笑，即，开心。谣，即歌谣，故事。林，即众塔成林。开心，愉悦，正能量，组合一段段正能量的歌谣故事的聚合体，也就是说：众商企一段段激励的过程，汇聚成笑谣林的文化思想。也是文化与商业的融合。相互并进，把握当局，为金融，文化，团队，教育，慈善，农业综合体等等的项目构建成因陀螺网式的立体综合体。</p><p><br/></p><p>地址：温州市新城大道新城大厦15楼</p><p>电话：400-6866-618</p>','正常','true','笑谣林'),(210,'7',22,'凭笑谣林如意卡、民生笑谣林卡可享有每周免费洗车1次（七座以下）','','7','54b092924800e.png','<p>地址：黄龙住宅农贸市场西3号</p><p>电话：0577-88766151</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0577-89777903</p>','正常','false','温州市鹿城区黄龙建网汽车美容店'),(211,'7',32,'凭笑谣林如意卡、民生笑谣林卡可享有：1。常青肾保项目原价278元，协议价格为178元每次','','7','54b5dbde11200.png','<p>地址：新城嘉和花园，丰源路102号。</p><p>电话：0577-86601518</p>','正常','false','温州市半岛常青堂养生会所丰源店'),(212,'7',32,'凭笑谣林如意卡、民生笑谣林卡可享有：1。常青肾保项目原价278元，协议价格为178元每次','','7','54b5dbed5fd2d.png','<p>地址：双井东泉花园2幢6-8号。</p><p>电话：0577-86600519</p>','正常','false','温州市半岛常青堂养生会所双井店'),(213,'7',32,'凭笑谣林如意卡、民生笑谣林卡可享有：1。常青肾保项目原价278元，协议价格为178元每次','','7','54b5dbfe58e28.png','<p>地址：将军桥勤奋小区1幢201号</p><p>电话：0577-88599535</p>','正常','false','半岛常青将军店'),(214,'7',10,'凭笑谣林如意卡、民生笑谣林卡可享有：散客消费九折优惠（不含税点、酒烟），送水果拼盘一份，和菜优惠同店内宣传','','7','54b0bfd7e0f5d.png','<p>地址：温州市黎明东路49号</p><p>电话：0577-88358008&nbsp;&nbsp;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0577-88359558</p>','正常','false','阿隆海鲜坊餐饮有限公司黎明店'),(215,'7',10,'凭笑谣林如意卡、民生笑谣林卡可享有：散客消费九折优惠（不含税点、酒烟），送水果拼盘一份，和菜优惠同店内宣传','','7','54b0c09cb1202.png','<p>地址：温州市欧洲城餐饮B区</p><p>电话：0577-88859900&nbsp;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0577-88829900</p>','正常','false','阿隆海鲜坊餐饮有限公司洲城店'),(216,'7',10,'凭笑谣林如意卡、民生笑谣林卡可享有：散客消费九折优惠（不含税点、酒烟），送水果拼盘一份，和菜优惠同店内宣传','','7','54b0c16e0b9e1.png','<p>地址：瓯北阳光大道金汇景园101-104</p><p>电话：0577-66991717</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 0577-66991818</p>','正常','false','阿隆海鲜坊餐饮有限公司阳光店'),(217,'7',36,'凭笑谣林如意卡、民生笑谣林卡可享有：乐器培训免费体验两节，乐器（除特价外）全场八折，钢琴品牌，卡瓦依钢琴，长江钢琴，巴特.罗宾逊钢琴，珠江钢琴，查伦钢琴。','','7','54b62be697ebe.png','<p>地址：瑞安市瑞湖路70-80号</p><p>电话：0577-66606000</p>','正常','false','声海琴行/艺校瑞湖店'),(218,'7',36,'凭笑谣林如意卡、民生笑谣林卡可享有：乐器培训免费体验两节，乐器（除特价外）全场八折，钢琴品牌，卡瓦依钢琴，长江钢琴，巴特.罗宾逊钢琴，珠江钢琴，查伦钢琴。','','7','54b62bf58ffae.png','<p>地址：瑞安市安阳罗阳大道14-20号</p><p>电话： 0577-66607000</p>','正常','false','声海琴行/艺校安阳店'),(219,'7',36,'凭笑谣林如意卡、民生笑谣林卡可享有：乐器培训免费体验两节，乐器（除特价外）全场八折，钢琴品牌，卡瓦依钢琴，长江钢琴，巴特.罗宾逊钢琴，珠江钢琴，查伦钢琴。','','7','54b62c027c3cc.png','<p>地址：乐清市双雁路508号</p><p>电话：0577-61607000</p>','正常','false','声海琴行/艺校双雁店'),(220,'7',36,'凭笑谣林如意卡、民生笑谣林卡可享有：乐器培训免费体验两节，乐器（除特价外）全场八折，钢琴品牌，卡瓦依钢琴，长江钢琴，巴特.罗宾逊钢琴，珠江钢琴，查伦钢琴。','','7','54b62c1211e6b.png','<p>地址：温州市横渎南路25号</p><p>电话：0577-88951838</p>','正常','false','声海琴行/艺校横渎店'),(221,'7',36,'凭笑谣林如意卡、民生笑谣林卡可享有：乐器培训免费体验两节，乐器（除特价外）全场八折，钢琴品牌，卡瓦依钢琴，长江钢琴，巴特.罗宾逊钢琴，珠江钢琴，查伦钢琴。','','7','54b62c1ebd91c.png','<p>地址：温州市车站大道云锦大厦A幢501</p><p>电话：0577-88981338</p>','正常','false','声海琴行/艺校云锦店'),(222,'7',36,'凭笑谣林如意卡、民生笑谣林卡可享有：乐器培训免费体验两节，乐器（除特价外）全场八折，钢琴品牌，卡瓦依钢琴，长江钢琴，巴特.罗宾逊钢琴，珠江钢琴，查伦钢琴。','','7','54b62c2d0e472.png','<p>地址：温州市横渎南路工业区1号楼五楼</p><p>电话：0577-88951338</p>','正常','false','声海琴行/艺校横渎南店'),(223,'7',36,'凭笑谣林如意卡、民生笑谣林卡可享有：乐器培训免费体验两节，乐器（除特价外）全场八折，钢琴品牌，卡瓦依钢琴，长江钢琴，巴特.罗宾逊钢琴，珠江钢琴，查伦钢琴。','','7','54b62c3a6382d.png','<p>地址：温州市江滨西路行前大厦c203室</p><p>电话：0577-88993555</p>','正常','false','声海琴行/艺校江滨店'),(224,'7',36,'凭笑谣林如意卡、民生笑谣林卡可享有：乐器培训免费体验两节，乐器（除特价外）全场八折，钢琴品牌，卡瓦依钢琴，长江钢琴，巴特.罗宾逊钢琴，珠江钢琴，查伦钢琴。','','7','54b62c46c1c43.png','<p>地址：瑞安市瑞湖路70-80号</p><p>电话：0577-65800178</p>','正常','false','声海琴行/艺校瑞湖分店'),(225,'7',36,'凭笑谣林如意卡、民生笑谣林卡可享有：乐器培训免费体验两节，乐器（除特价外）全场八折，钢琴品牌，卡瓦依钢琴，长江钢琴，巴特.罗宾逊钢琴，珠江钢琴，查伦钢琴。','','7','54b62c53ecd83.png','<p>地址：瑞安市安阳路星海公寓1-18A</p><p>电话：0577-65851222</p>','正常','false','声海琴行/艺校安阳分店'),(226,'7',36,'凭笑谣林如意卡、民生笑谣林卡可享有：乐器培训免费体验两节，乐器（除特价外）全场八折，钢琴品牌，卡瓦依钢琴，长江钢琴，巴特.罗宾逊钢琴，珠江钢琴，查伦钢琴。','','7','54b62c6025a1e.png','<p>地址：瑞安市海华大厦3B</p><p>电话：0577-66605000</p>','正常','false','声海琴行/艺校海华店'),(227,'7',15,'凭笑谣林如意卡、民生笑谣林卡可享有：消费可享受8.8折，酒水除外，特价菜除外','','7','54b0c48806413.png','<p>地址：府东路682号</p><p>电话：0577-88329977</p>','正常','false','羡江南刘家宴生态酒庄'),(228,'7',22,'凭笑谣林如意卡、民生笑谣林卡可享有：每周免费洗车1次，喷漆、机修、保养、装潢美容打8.5折（洗车协议价15元）','','7','54b0c4e99b645.png','<p>地址：惠民路21号</p>','正常','false','温州市鹿城区南浦荣德汽车美容店'),(229,'7',36,'凭笑谣林如意卡、民生笑谣林卡可享有：进本店消费可享受充值卡送礼品，体验课五折，每位会员到本店消费免费赠送饮品一杯，举办生日派对，寿星送精美礼品一份。','','7','54b0c53e637bb.png','<p>地址：温州市南塘风貌街5号楼西一楼</p><p>电话：0577-88988558</p>','正常','false','米可手工制作工坊'),(230,'7',40,'凭笑谣林如意卡、民生笑谣林卡可享有：在本店消费可享受九折的优惠，并赠送果盘一份','','7','54b63061b0468.png','<p>地址：温州市南塘风貌区2楼2-1-5</p><p>电话：0577-88355588</p>','正常','false','温州南浦兰威士啤酒工坊'),(231,'7',32,'凭笑谣林如意卡、民生笑谣林卡可享有：消费可享受项目8折，充值卡、疗程卡9.8折，产品9折','','7','54b6308f0c440.png','<p>地址：大南门莲花路荷花锦</p>','正常','false','海之灵美美容美体休闲馆'),(232,'7',29,'凭笑谣林如意卡、民生笑谣林卡可享有：入住客房可享受5.5折+10%的优惠，酒店自主可享受9折。','','7','54b0c62c2bf94.png','<p>地址：温州市人民中路1号</p><p>电话：0577-88081875</p>','正常','false','温州国际大酒店有限公司'),(233,'7',32,'凭笑谣林如意卡、民生笑谣林卡可享有：消费可享受1、相应的spa，2、提供相应的优惠券和抵用券。3、及其它的一些互惠互利的','','7','54b0c66f98030.png','<p>地址：温州市汤家桥括苍西路</p><p>电话：0577-88690988</p>','正常','false','玫丽佳人美容连锁机构'),(234,'7',29,'凭笑谣林如意卡、民生笑谣林卡可享有：房价的5折+10%（服务费）','','7','54b0c6aff3603.png','<p>地址：温州马鞍池东路320号</p><p>电话：0577-88278888</p>','正常','false','温州维多利亚大酒店'),(235,'7',15,'凭笑谣林如意卡、民生笑谣林卡可享有：在本店消费可享受8.8折的优惠','','9','54b0c6e7e9687.png','<p>地址：温州市灵昆镇灵昆亚路路口</p><p>电话：0577-86980811</p>','正常','false','温州灵昆农家菜小院'),(236,'7',36,'凭笑谣林如意卡、民生笑谣林卡可享有：消费可享受吉田化妆造型艺术学校提供价值380元的课程体验券（需提前预约）。甲方会员报名吉田化妆造型艺术学校任意课程，可享受免费赠送课程一节（具体课程双方协议）','','7','54b361afb5b02.png','<p>地址：温州小南路国鼎大厦409号</p><p>电话：0577-88861512</p>','正常','false','温州吉田化妆造型艺术艺校'),(237,'7',29,'凭笑谣林如意卡、民生笑谣林卡可享有：在酒店消费可享受3-5折的优惠','','7','54b3665ca39c1.png','<p>地址：温州市车站大道292号</p><p>电话：0577-88885555</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 0577-88885617</p>','正常','false','温州喜来登酒店'),(238,'7',36,'凭笑谣林如意卡、民生笑谣林卡可享有：可免费享受试听任何课程1-3次，报名可立减200-2000元不等优惠','','7','54b3662fdc7ac.png','<p>地址：鹿城区车站大道诚信商厦2幢F层</p><p>电话：0577-56710891</p>','正常','false','惟乐教育'),(239,'7',36,'凭笑谣林如意卡、民生笑谣林卡可享有：消费可享受1、短期课程立减500元优惠，2、报名常规课程可享受立减2000元的优惠，3、凭此卡可免费试听我集团制定的任何课程1-3次，（备注：以上优惠不可同时参加）','','7','54b0c7ec4db5e.png','<p>地址：温州市车站大道人和嘉园2F</p><p>电话：0577-86078977</p>','正常','false','白金汉英语'),(240,'7',22,'凭笑谣林如意卡、民生笑谣林卡可享有：每周免费洗车1次','','7','54b0c8254e1eb.png','<p>地址：春晖路2号</p><p>电话：0577-88666613</p>','正常','false','永隆汽车行'),(241,'7',32,'凭笑谣林如意卡、民生笑谣林卡可享有：所有项目的7折优惠','','7','54b365e2c51ae.png','<p>地址：上吕浦锦园7幢106-107室</p><p>电话：0577-88803362</p>','正常','false','温州天灸堂养生馆'),(242,'7',32,'凭笑谣林如意卡、民生笑谣林卡可享有：所有项目的7折优惠','','7','54b36600b61a4.png','<p>地址：时代广场后门东浦小区3幢111号</p>','正常','false','温州天灸堂养生馆分店'),(243,'7',33,'凭笑谣林如意卡、民生笑谣林卡可享有：洗、剪、吹7.8折，烫、染、护7.8折，美容项目5折（产品除外）','','7','54b362d90b23d.png','<p>地址：吴桥路286号</p><p>电话：0577-88613779</p>','正常','false','金榜美容美发SPA会所'),(244,'7',33,'凭笑谣林如意卡、民生笑谣林卡可享有：洗、剪、吹7.8折，烫、染、护7.8折，美容项目6折（产品除外）','','7','54b362ea3cdb0.png','<p>地址：车站大道447号</p><p>电话：0577-88683188</p>','正常','false','金榜美容美发SPA会所车站店'),(245,'7',33,'凭笑谣林如意卡、民生笑谣林卡可享有：洗、剪、吹7.8折，烫、染、护7.8折，美容项目7折（产品除外）','','7','54b363056b228.png','<p>地址：下吕浦农贸市场二楼</p><p>电话：0577-88397088</p>','正常','false','金榜美容美发SPA会所农贸店'),(246,'7',33,'凭笑谣林如意卡、民生笑谣林卡可享有：洗、剪、吹7.8折，烫、染、护7.8折，美容项目8折（产品除外）','','7','54b36313a51ba.png','<p>地址：双塔路乌龙桥路，交叉口，龙桥大厦正对面</p><p>电话：0577-67960267</p>','正常','false','金榜美容美发SPA会所双塔店'),(247,'7',33,'凭笑谣林如意卡、民生笑谣林卡可享有：美甲（天然纯植物甲油胶儿童孕妇皆适用），2、种睫毛（纯手工天然水貂毛）尊享3折，3、烫睫毛（天然纯植物烫剂）尊享3折，长年有效。','','7','54b35fb432622.png','<p>地址：学院东路369号</p>','正常','false','程丹美容院'),(248,'7',36,'凭笑谣林如意卡、民生笑谣林卡可享有：德国贝希斯坦钢琴入选50个最受欢迎的德国奢侈品牌，原价不打折，现价后可享受9.7折，2、A股上市公司珠江钢琴有限公司的高端方式，三角钢琴，原价最低折扣，对笑谣林现在统一优惠8.8折，其他产品八折。除特价商品','','7','54b3673460c49.png','<p>地址：车站大道1-61号</p>','正常','false','温州艺家琴行有限公司'),(249,'7',16,'凭笑谣林如意卡、民生笑谣林卡可享有：消费ktv包厢可享受九折结算（除节假日以外，不包括香烟），入住客房可房折扣价180元一件（节假日除外）','','11','54b0cddbd7ad7.png','<p>地址：永嘉县环城西路888号</p>','正常','false','永嘉县戎城山庄KTV'),(250,'7',15,'凭笑谣林如意卡、民生笑谣林卡可享有：菜品8.8折（除酒水以外），2、每桌送价值38元的鲜锦果汁一扎','','11','54b365476fdd7.png','<p>地址：瓯北阳光大道楠江大厦15-18号</p>','正常','false','胖子肉蟹煲瓯北店'),(251,'7',22,'凭笑谣林如意卡、民生笑谣林卡可享有：每月免费洗车4次，美容、贴膜、喷漆、轮胎、折扣价8折，（4次之外每次公司补贴10元月结）','','11','54b0ce3c71863.png','<p>地址：上塘镇明珠花园1-5幢102-103号</p>','正常','false','上塘幻影汽车美容中心'),(252,'7',32,'凭笑谣林如意卡、民生笑谣林卡可享有：八折优惠，可与本公司会员卡同时使用','','11','54b0ce83c2c9c.png','<p>地址：温州市永嘉县广场路国大厦</p><p>电话：0577-67225999</p>','正常','false','和元堂养生馆'),(253,'7',20,'凭笑谣林如意卡、民生笑谣林卡可享有：会员免费下午茶和8.5折（指定卡位），普通会员8.5折折扣（除包厢外），包厢消费158元送一泡茶（商家指定茶）','','7','54b5dc54e681e.png','<p>地址：温州市新城宏源路5号（数码城后）</p><p>电话：0577-88928538</p>','正常','false','温州市茶都汇旗舰茶轩有限公司'),(254,'7',37,'凭笑谣林如意卡、民生笑谣林卡可享有：免费提供一周一次（须预约），办理瑜伽会员年卡给予8折优惠，瑜伽教练学员可提供一年三次免费进修','','7','54b0cf30eab47.png','<p>地址：温州市鹿城区划龙桥前路7号老人协会大楼4楼</p><p>电话：0577-86059018</p>','正常','false','温州金火鸟能量养生有限公司（温州国际瑜伽教育学院）'),(255,'7',20,'凭笑谣林如意卡、民生笑谣林卡可享有：普通单间折扣后158元/间，商务单间折扣后178元/间，','','11','54b0cf65655d5.png','','正常','false','温州市拉芳舍时尚宾馆有限公司'),(256,'7',40,'凭笑谣林如意卡、民生笑谣林卡可享有：代驾一律八折','','11','54b0cfb4847cc.png','<p>地址：楠江东路102号</p>','正常','false','永嘉真好代驾有限公司'),(257,'7',20,'凭笑谣林如意卡、民生笑谣林卡可享有：消费可享受8.5折优惠（指定套餐）指定包厢享受免费欢唱，食品酒水自费，时间按12:00-17:00','','7','54b0cffb64012.png','<p>地址：九山游泳路9号</p>','正常','false','金球音乐茶吧'),(258,'7',15,'凭笑谣林如意卡、民生笑谣林卡可享有：消费可享受9折的优惠，订包厢消费可享受免费K歌，消费满一桌大厅可免费提供投影','','7','54b62e87544c3.png','<p>地址：温州市西山东路349号（西山面砖厂鑫特汽修2楼原大门海鲜楼）</p><p>电话：0577-86293768</p>','正常','false','温州市一鹿通餐饮连锁'),(259,'7',20,'凭笑谣林如意卡、民生笑谣林卡可享有：到本店免费品茶，笔法享受超低会员折扣价','','7','54b0d0586f826.png','<p>地址：温州市桥儿头南塘五组团江南茶市12号</p>','冻结','false','醉元红茶行'),(260,'7',40,'凭笑谣林如意卡、民生笑谣林卡可享有：9折优惠','','7','54b0d32928133.png','<p>地址：鹿城区府学巷119号</p>','正常','false','“构”服装私人定制'),(262,'6',25,'5l3Jqs  <a href=\\\"http://yyzlzslmmapd.com/\\\">yyzlzslmmapd</a>, [url=http://hrhjbaxukiwu.com/]hrhjbaxukiwu[/url], [link=http://jphgmgsplufm.com/]jphgmgsplufm[/link], http://uruevyewrycp.com/',NULL,NULL,NULL,NULL,'冻结','false','jwhdtfvr'),(263,'2',41,'Cvq7tL  <a href=\\\"http://mmnnddzoovqv.com/\\\">mmnnddzoovqv</a>, [url=http://mbgeerokcynm.com/]mbgeerokcynm[/url], [link=http://zgjcnmyigktj.com/]zgjcnmyigktj[/link], http://ykxfxwwdfqel.com/',NULL,NULL,NULL,NULL,'冻结','false','ylharvbinlo'),(265,'7',20,'凭笑谣林如意卡、民生笑谣林卡可享有：到本店免费品茶，笔法享受超低会员折扣价','','7','54b5cd243eecb.png','<p>地址：温州市桥儿头南塘五组团江南茶市12号</p>','正常','false','醉元红茶行'),(266,'7',15,'凭笑谣林如意卡、民生笑谣林卡可享有：在陳家食堂享受8折优惠（酒水和快餐不在此内）。不能同时享受其他优惠。','','11','54b5d047dcfc4.png','<p>地址：永嘉县江北街道瓯北商贸城2号楼一层</p><p>电话：0577-67388889</p>','正常','false','陈家食堂'),(267,'7',29,'凭笑谣林如意卡、民生笑谣林卡可享有：到客房签到可享受5折，餐饮，满1000元返还100元，并送菜或果盘一份','','11','54b5d112600b5.png','','正常','false','永嘉县新楠溪江大酒店有限公司'),(268,'7',29,'凭笑谣林如意卡、民生笑谣林卡可享有：一律享受4.5折的特别优惠','','7','54b5d1c56c750.png','<p>地址：鹿城区新城大道新城大厦15楼</p><p>电话：0577-61523333</p>','正常','false','金皇朝宾馆'),(269,'7',15,'凭笑谣林如意卡、民生笑谣林卡可享有：订餐成功赠送时令蔬菜/水果或精美点心任意一份(私人定制，提前预约，在下午两点之前预约）','','7','54b5d258a35cc.png','<p>地址：温州市宽带路1号</p><p>电话：0577-88217979</p>','正常','false','温州鹿城晶品家宴'),(270,'7',22,'凭笑谣林如意卡、民生笑谣林卡可享有：每周免费洗车1次，本店另外可汽车维修、轮胎、抛光打蜡、油釉、美容、装潢、四轮定位等。喷绘、钣金工','','11','54b5d2ff80857.png','<p>地址：永嘉县黄田劳务市场</p>','正常','false','永嘉县黄田朝辉汽车修理厂'),(271,'7',15,'凭笑谣林如意卡、民生笑谣林卡可享有：来本店消费可享受8.8折，（酒水、部分菜品除外）免费水果一份（酒席。宴会除外）','','10','54b5d3971c502.png','<p>地址：温州龙湾经济技术开发区耐和大楼二楼</p><p>电话：0577-866612112</p>','正常','false','湘遇食府'),(272,'7',10,'凭笑谣林如意卡、民生笑谣林卡可享有：烧烤、火锅40元/位（本店消费烧烤、火锅原原价自助餐45元/位）','','11','54b5d3fa2f8f2.png','<p>电话：0577-67982109</p>','正常','false','永嘉县层上香火锅店'),(273,'7',22,'凭笑谣林如意卡、民生笑谣林卡可享有：每周免费洗车一次，镀金一次优惠（300-500元），贴膜享有七折优惠，精品销售8.8折','','','54b5d4d1575b9.png','<p>地址：乐清市乐成镇汇丰路6号</p><p>电话：0577-62562022</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 0577-62562033</p>','正常','false','天驰汽车美容'),(274,'7',15,'凭笑谣林如意卡、民生笑谣林卡可享有：每周吃素食一次，享受自助餐一份，每份（10元），开餐时间中午10:45-12:30，晚餐4:45-6:30','','','54b5d52bca56c.png','<p>地址：乐清市环城西路37号</p>','正常','false','素食缘'),(275,'7',20,'凭笑谣林如意卡、民生笑谣林卡可享有：免费茶20元，赠送一次/人/天，其他消费享受八折优惠','','','54b5d577cb64a.png','<p>地址：乐清市云理43号</p><p>电话：0577-62552127</p>','正常','false','石城茶馆'),(276,'7',17,'凭笑谣林如意卡、民生笑谣林卡可享有：每周免费享受（火罐、电疗、玉骨、红外线照射）一次，推拿理疗原价100元，会员享受8折，太极理经、推拿（国内首创）','','','54b5d5c56f4b3.png','<p>地址：乐清市云浦南路66号</p>','正常','false','郭峰太极推拿玉骨'),(278,'7',40,'',NULL,NULL,NULL,NULL,'正常','false','伯爵梁品');

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

INSERT INTO `t_site_config` VALUES ('email','3053998856@qq.com'),('help1','加入笑谣林（商家篇）'),('help2','加入笑谣林（会员篇）'),('help3',''),('help4',''),('helpC1','<p>笑谣林</p>'),('helpC2','<p style=margin-top: 0px; margin-bottom: 0px; white-space: normal; text-align: center; font-family: Tahoma, sans-serif; line-height: 22.399999618530273px;><span style=color: rgb(0, 0, 0); font-size: medium;>&nbsp; &nbsp; &nbsp; 笑谣林，笑，即，开心。谣，即歌谣，故事。林，即众塔成林'),('helpC3',''),('helpC4',''),('link1','www.xyof.net'),('link2','http://www.xyof.net/copydp/index.php/Seller/seller'),('link3','http://xyof.net/copydp/index.php/Community/cmnty_info?communityID=42'),('link4','http://wzdaily.66wz.com/wzwb/html/2007-04/17/content_5874290.htm'),('linkname1','笑谣林'),('linkname2','联盟商户'),('linkname3','人员招聘'),('linkname4','温州晚报'),('tel','400 6866 618'),('time','09:00-17:00');

#
# Source for table "t_svip_product"
#

DROP TABLE IF EXISTS `t_svip_product`;
CREATE TABLE `t_svip_product` (
  `svip_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `limit_consumption_num` int(10) DEFAULT NULL COMMENT '限制消费次数',
  `limit_consumption_period` varchar(255) DEFAULT NULL COMMENT '限制消费周期',
  `create_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`svip_product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

#
# Data for table "t_svip_product"
#

INSERT INTO `t_svip_product` VALUES (5,1,'每周','2015-01-07 10:42:04');

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
) ENGINE=InnoDB AUTO_INCREMENT=281 DEFAULT CHARSET=utf8;

#
# Data for table "t_user"
#

INSERT INTO `t_user` VALUES (1,'jinyang','admin','ADMIN'),(58,'z199311172634','冰喆','ADMIN'),(91,'123456','世纪酒店','SELLER'),(92,'123456','新星琴行','SELLER'),(93,'123456','农家湾','SELLER'),(94,'123456','新星汽车','SELLER'),(95,'123456','我家食堂','SELLER'),(96,'123456','金鹏宾馆','SELLER'),(97,'123456','优拓汽车','SELLER'),(98,'123456','优拓汽车分店','SELLER'),(99,'123456','声海琴行','SELLER'),(100,'123456','名爵理发','SELLER'),(101,'123456','忠信汽车','SELLER'),(102,'123456','测试1','SELLER'),(103,'123456','友好门诊','SELLER'),(104,'123456','印莲瑜伽','SELLER'),(105,'123456','蓝色海湾','SELLER'),(106,'123456','宏泰酒店','SELLER'),(107,'123456','花意酒窝','SELLER'),(108,'123456','国贸宾馆','SELLER'),(109,'123456','大丰宾馆','SELLER'),(110,'123456','皇都宾馆','SELLER'),(111,'123456','亚美酒店','SELLER'),(112,'123456','晨江宾馆','SELLER'),(113,'123456','富尔玛宾馆','SELLER'),(114,'123456','欧莱坊宾馆','SELLER'),(115,'123456','华丰宾馆','SELLER'),(116,'123456','能匠皮具','SELLER'),(117,'123456','一品家','SELLER'),(118,'123456','苗家山寨','SELLER'),(119,'123456','源香湘菜','SELLER'),(120,'123456','锦江ktv','SELLER'),(121,'123456','汉庭酒店','SELLER'),(122,'123456','罗马风情','SELLER'),(123,'123456','东欧明珠','SELLER'),(124,'123456','永嘉宾馆','SELLER'),(125,'123456','城市风情','SELLER'),(126,'123456','力道健身','SELLER'),(127,'pancai2360598','阿财','CUSTOMER'),(128,'123456','卓建','CUSTOMER'),(129,'123456','永嘉真好代驾有限公司','SELLER'),(130,'123456','秀东汽车','SELLER'),(131,'123456','康寿健康','SELLER'),(132,'123456','楠味一村','SELLER'),(133,'123456','大家福','SELLER'),(134,'123456','建国农家','SELLER'),(135,'123456','锦江酒店','SELLER'),(136,'123456','黄龙建网分店','SELLER'),(137,'123456','羽艺艺术','SELLER'),(138,'123456','小媚琴行','SELLER'),(139,'123456','易翔航空','SELLER'),(140,'123456','半岛常青','SELLER'),(141,'123456','车威汽车','SELLER'),(142,'123456','英伦美琪','SELLER'),(143,'123456','汇丰宾馆','SELLER'),(144,'123456','金球酒店','SELLER'),(145,'123456','酷爱简餐','SELLER'),(146,'123456','丽景汽车','SELLER'),(147,'123456','欧点咖啡','SELLER'),(148,'123456','秋华减肥','SELLER'),(149,'123456','金茂皇冠','SELLER'),(150,'123456','景俏美容','SELLER'),(151,'123456','悟田汽车','SELLER'),(152,'123456','阿隆海鲜','SELLER'),(153,'123456','金开立汽车','SELLER'),(154,'123456','车友汇','SELLER'),(155,'123456','合众汽车','SELLER'),(156,'123456','沸腾琴行','SELLER'),(157,'123456','云天楼','SELLER'),(158,'123456','华侨饭店','SELLER'),(159,'123456','新南亚','SELLER'),(160,'123456','51CLUB酒吧','SELLER'),(161,'123456','凌晨啤酒吧','SELLER'),(162,'123456','南浦哈里','SELLER'),(163,'123456','豪邦轿车','SELLER'),(164,'123456','王朝大酒店','SELLER'),(165,'123456','\\\"构“服装私人定制','SELLER'),(166,'123456','最远红茶行','SELLER'),(167,'123456','奥戈娱乐','SELLER'),(168,'123456','奶奶私房菜','SELLER'),(169,'123456','百惠健康','SELLER'),(170,'123456','繁东宾馆','SELLER'),(171,'123456','胡儿丽娅鹿','SELLER'),(172,'123456','金秋音乐茶吧','SELLER'),(173,'123456','金斯顿欧情','SELLER'),(174,'123456','香格里拉','SELLER'),(175,'123456','万豪酒店','SELLER'),(176,'123456','瑞乐缘','SELLER'),(177,'123456','名人KTV','SELLER'),(178,'123456','瑞珂美容','SELLER'),(179,'123456','萱瑜伽','SELLER'),(180,'123456','一顺汽车','SELLER'),(181,'123456','轩驿酒店','SELLER'),(182,'123456','江心酒店','SELLER'),(183,'123456','国颜艺术','SELLER'),(184,'123456','滨海酒店','SELLER'),(185,'123456','瑶溪王朝','SELLER'),(186,'','','CUSTOMER'),(187,'123456','方亮','CUSTOMER'),(188,'123456','z19931117','CUSTOMER'),(189,'123456','z199311172634','SELLER'),(190,'123456','USER1','CUSTOMER'),(191,'123456','芳小雅','CUSTOMER'),(192,'lc2001','liuchen','CUSTOMER'),(193,'123456','宏观','CUSTOMER'),(194,'25859758','kaisheng','CUSTOMER'),(195,'123456','中邦汽车','SELLER'),(196,'123456','靓捷车欲','SELLER'),(197,'123456','益昌维修','SELLER'),(198,'474248a','lihyue480','CUSTOMER'),(199,'090727','CHEN85','CUSTOMER'),(200,'321321','123123','CUSTOMER'),(201,'321321','1231233','CUSTOMER'),(202,'ren88238825','zjwzyyr','CUSTOMER'),(203,'1234567','观自斋','SELLER'),(204,'1234567','东珠','CUSTOMER'),(205,'581207','何主编','ADMIN'),(206,'000...','笑谣林','SELLER'),(207,'LZZASDZDYY93918','Jessy','ADMIN'),(208,'seantina','Sean','CUSTOMER'),(209,'83722808','阳光轻风','CUSTOMER'),(210,'123456','黄龙建网','SELLER'),(211,'123456','半岛常青丰源店','SELLER'),(212,'123456','半岛常青双井店','SELLER'),(213,'123456','温州市半岛常青堂养生会所将军店','SELLER'),(214,'123456','阿隆海鲜黎明店','SELLER'),(215,'123456','阿隆海鲜欧洲城店','SELLER'),(216,'123456','阿隆海鲜阳光店','SELLER'),(217,'123456','声海琴行瑞湖店','SELLER'),(218,'123456','声海琴行安阳店','SELLER'),(219,'123456','声海琴行双雁店','SELLER'),(220,'123456','声海琴行横渎店','SELLER'),(221,'123456','声海琴行云锦店','SELLER'),(222,'123456','声海琴行横渎南店','SELLER'),(223,'123456','声海琴行江滨店','SELLER'),(224,'123456','声海琴行瑞湖分店','SELLER'),(225,'123456','声海琴行安阳分店','SELLER'),(226,'123456','声海琴行海华店','SELLER'),(227,'123456','刘家宴','SELLER'),(228,'123456','荣德汽车','SELLER'),(229,'123456','米可工坊','SELLER'),(230,'123456','兰威士啤酒','SELLER'),(231,'123456','海之灵','SELLER'),(232,'123456','国际酒店','SELLER'),(233,'123456','玫丽佳人','SELLER'),(234,'123456','维多利亚','SELLER'),(235,'123456','农家菜','SELLER'),(236,'123456','吉田化妆','SELLER'),(237,'123456','喜来登','SELLER'),(238,'123456','惟乐教育','SELLER'),(239,'123456','白金汉','SELLER'),(240,'123456','永隆汽车','SELLER'),(241,'123456','天灸堂','SELLER'),(242,'123456','天灸堂分店','SELLER'),(243,'123456','金榜会所','SELLER'),(244,'123456','金榜会所车站店','SELLER'),(245,'123456','金榜会所农贸店','SELLER'),(246,'123456','金榜会所双塔店','SELLER'),(247,'123456','程丹美容','SELLER'),(248,'123456','艺家琴行','SELLER'),(249,'123456','戎城山庄KTV','SELLER'),(250,'123456','胖子肉蟹煲','SELLER'),(251,'123456','幻影汽车','SELLER'),(252,'123456','和元堂','SELLER'),(253,'123456','茶轩','SELLER'),(254,'123456','国际瑜伽','SELLER'),(255,'123456','拉芳舍','SELLER'),(256,'123456','真好代驾','SELLER'),(257,'123456','金球音乐茶吧','SELLER'),(258,'123456','一鹿通','SELLER'),(259,'123456','醉元和茶','SELLER'),(260,'123456','“构”服装','SELLER'),(261,'88238825','娜莎莎s','CUSTOMER'),(262,'7WSIH','jwhdtfvr','SELLER'),(263,'OQTeRE','ylharvbinlo','SELLER'),(264,'772013','y65231896','CUSTOMER'),(265,'123456','醉元红茶','SELLER'),(266,'123456','陈家食堂','SELLER'),(267,'123456','新楠溪江','SELLER'),(268,'123456','金皇朝','SELLER'),(269,'123456','晶品家宴','SELLER'),(270,'123456','朝辉汽车','SELLER'),(271,'123456','湘遇食府','SELLER'),(272,'123456','层上香','SELLER'),(273,'123456','天驰汽车','SELLER'),(274,'123456','素食缘','SELLER'),(275,'123456','石城茶馆','SELLER'),(276,'123456','郭峰推拿','SELLER'),(277,'112613','mfkgefm','CUSTOMER'),(278,'123456789','美国蓝飘尔','SELLER'),(279,'123','123','CUSTOMER'),(280,'1','1','CUSTOMER');

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
  select `copydp`.`t_activity_order`.`activity_order_id` AS `activity_order_id`,`copydp`.`t_activity_order`.`activity_id` AS `activity_id`,`copydp`.`t_activity_order`.`customer_id` AS `customer_id`,`copydp`.`t_activity_order`.`activity_title` AS `activity_title`,`copydp`.`t_activity_order`.`imgsrc` AS `imgsrc`,`copydp`.`t_activity_order`.`memberlimit` AS `memberlimit`,`copydp`.`t_activity_order`.`datetime` AS `datetime`,`copydp`.`t_activity_order`.`datelimit` AS `datelimit`,`copydp`.`t_activity_order`.`status` AS `status`,`copydp`.`t_activity`.`dscr` AS `activity_disc`,`copydp`.`t_activity`.`status` AS `activity_status`,`copydp`.`t_activity`.`address` AS `activity_address`,`copydp`.`t_activity`.`point` AS `activity_point`,`copydp`.`t_user`.`username` AS `username`,`copydp`.`t_customer`.`grade` AS `grade`,`copydp`.`t_customer`.`cellphone` AS `cellphone`,`copydp`.`t_customer`.`email` AS `email` from (((`copydp`.`t_activity_order` join `copydp`.`t_activity` on((`copydp`.`t_activity`.`activity_id` = `copydp`.`t_activity_order`.`activity_id`))) join `copydp`.`t_customer` on((`copydp`.`t_customer`.`user_id` = `copydp`.`t_activity_order`.`customer_id`))) join `copydp`.`t_user` on((`copydp`.`t_user`.`user_id` = `copydp`.`t_activity_order`.`customer_id`)));

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
  select `copydp`.`t_order`.`order_id` AS `order_id`,`copydp`.`t_order`.`order_name` AS `order_name`,`copydp`.`t_order`.`customer_id` AS `customer_id`,`copydp`.`t_order`.`product_id` AS `product_id`,`copydp`.`t_order`.`product_name` AS `product_name`,`copydp`.`t_order`.`order_time` AS `order_time`,`copydp`.`t_order`.`quantity` AS `quantity`,`copydp`.`t_order`.`order_price` AS `order_price`,`copydp`.`t_order`.`order_status` AS `order_status`,`copydp`.`t_user`.`username` AS `username`,`copydp`.`t_order`.`seller_id` AS `seller_id`,`copydp`.`t_order`.`imgsrc` AS `imgsrc`,`copydp`.`t_order`.`product_description` AS `product_description`,`copydp`.`t_order`.`order_original_price` AS `order_original_price`,`copydp`.`t_order`.`note` AS `note`,`copydp`.`t_product`.`type_id` AS `type_id`,`copydp`.`t_product_type`.`type_name` AS `type_name`,`copydp`.`t_product`.`end_date_time` AS `end_date_time`,`t_view_customer`.`cellphone` AS `cellphone`,`t_view_customer`.`grade` AS `grade` from ((((`copydp`.`t_order` join `copydp`.`t_product` on((`copydp`.`t_product`.`product_id` = `copydp`.`t_order`.`product_id`))) join `copydp`.`t_user` on((`copydp`.`t_user`.`user_id` = `copydp`.`t_order`.`customer_id`))) join `copydp`.`t_view_customer` on((`t_view_customer`.`user_id` = `copydp`.`t_order`.`customer_id`))) join `copydp`.`t_product_type` on((`copydp`.`t_product_type`.`type_id` = `copydp`.`t_product`.`type_id`)));

#
# Source for view "t_view_product"
#

DROP VIEW IF EXISTS `t_view_product`;
CREATE VIEW `t_view_product` AS 
  select `copydp`.`t_product`.`product_id` AS `product_id`,`copydp`.`t_product`.`name` AS `name`,`copydp`.`t_product`.`type_id` AS `type_id`,`copydp`.`t_product`.`seller_id` AS `seller_id`,`copydp`.`t_product`.`update_date` AS `update_date`,`copydp`.`t_product`.`end_date_time` AS `end_date_time`,`copydp`.`t_product`.`price` AS `price`,`copydp`.`t_product`.`original_price` AS `original_price`,`copydp`.`t_product`.`describe` AS `dscr`,`copydp`.`t_product`.`basic_infor` AS `basic_infor`,`copydp`.`t_product`.`svip_product_id` AS `svip_product_id`,`copydp`.`t_product`.`imgsrc` AS `imgsrc`,`copydp`.`t_product`.`imglist` AS `imglist`,`copydp`.`t_product`.`product_status` AS `product_status`,`t_view_seller`.`username` AS `username`,`t_view_seller`.`zone_id` AS `zone_id`,`t_view_seller`.`zone_name` AS `zone_name`,`t_view_seller`.`city` AS `city`,`t_view_seller`.`city_id` AS `city_id` from (`copydp`.`t_product` join `copydp`.`t_view_seller` on((`copydp`.`t_product`.`seller_id` = `t_view_seller`.`user_id`))) order by `copydp`.`t_product`.`update_date` desc;

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
  select `copydp`.`t_seller`.`user_id` AS `user_id`,`copydp`.`t_seller`.`seller_name` AS `seller_name`,`copydp`.`t_seller`.`city_id` AS `city_id`,`copydp`.`t_seller`.`qr_code` AS `qr_code`,`copydp`.`t_seller`.`status` AS `status`,`copydp`.`t_seller`.`zone_id` AS `zone_id`,`copydp`.`t_seller`.`type_id` AS `type_id`,`copydp`.`t_seller`.`description` AS `description`,`copydp`.`t_seller`.`position` AS `position`,`copydp`.`t_seller`.`img` AS `img`,`copydp`.`t_seller`.`info` AS `info`,`copydp`.`t_product_type`.`type_name` AS `type_name`,`copydp`.`t_product_type`.`father_id` AS `father_id`,`copydp`.`t_city`.`city` AS `city`,`copydp`.`t_city_zone`.`zone_name` AS `zone_name`,`copydp`.`t_user`.`password` AS `password`,`copydp`.`t_user`.`username` AS `username`,`copydp`.`t_user`.`role` AS `role` from ((((`copydp`.`t_seller` left join `copydp`.`t_product_type` on((`copydp`.`t_seller`.`type_id` = `copydp`.`t_product_type`.`type_id`))) left join `copydp`.`t_city` on((`copydp`.`t_seller`.`city_id` = `copydp`.`t_city`.`city_id`))) left join `copydp`.`t_city_zone` on(((`copydp`.`t_seller`.`city_id` = `copydp`.`t_city_zone`.`city_id`) and (`copydp`.`t_seller`.`zone_id` = `copydp`.`t_city_zone`.`zone_id`)))) left join `copydp`.`t_user` on((`copydp`.`t_seller`.`user_id` = `copydp`.`t_user`.`user_id`))) where (`copydp`.`t_user`.`role` = 'SELLER');

#
# Source for view "t_view_svip_product"
#

DROP VIEW IF EXISTS `t_view_svip_product`;
CREATE VIEW `t_view_svip_product` AS 
  select `t_view_product`.`name` AS `product_name`,`copydp`.`t_svip_product`.`svip_product_id` AS `svip_product_id`,`copydp`.`t_svip_product`.`limit_consumption_num` AS `limit_consumption_num`,`copydp`.`t_svip_product`.`limit_consumption_period` AS `limit_consumption_period`,`copydp`.`t_svip_product`.`create_datetime` AS `create_datetime`,`copydp`.`t_product_type`.`type_name` AS `type_name`,`t_view_product`.`dscr` AS `dsrc` from ((`copydp`.`t_view_product` join `copydp`.`t_svip_product` on((`copydp`.`t_svip_product`.`svip_product_id` = `t_view_product`.`svip_product_id`))) join `copydp`.`t_product_type` on((`t_view_product`.`type_id` = `copydp`.`t_product_type`.`type_id`))) where (`t_view_product`.`svip_product_id` <> '普通');

#
# Source for view "t_view_svip_product_order"
#

DROP VIEW IF EXISTS `t_view_svip_product_order`;
CREATE VIEW `t_view_svip_product_order` AS 
  select `copydp`.`t_order`.`customer_id` AS `customer_id`,`copydp`.`t_svip_product`.`svip_product_id` AS `svip_product_id`,`copydp`.`t_order`.`order_time` AS `order_time` from ((`copydp`.`t_order` join `copydp`.`t_product` on((`copydp`.`t_product`.`product_id` = `copydp`.`t_order`.`product_id`))) join `copydp`.`t_svip_product` on((`copydp`.`t_svip_product`.`svip_product_id` = `copydp`.`t_product`.`svip_product_id`)));

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

# Host: 192.168.1.105  (Version: 5.1.70-community)
# Date: 2014-09-13 09:44:25
# Generator: MySQL-Front 5.3  (Build 4.155)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "t_product_type"
#

DROP TABLE IF EXISTS `t_product_type`;
CREATE TABLE `t_product_type` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) DEFAULT NULL,
  `father_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

#
# Data for table "t_product_type"
#

/*!40000 ALTER TABLE `t_product_type` DISABLE KEYS */;
INSERT INTO `t_product_type` VALUES (1,'美食',NULL);
INSERT INTO `t_product_type` VALUES (2,'电影',NULL);
INSERT INTO `t_product_type` VALUES(3,'酒店',NULL);
INSERT INTO `t_product_type` VALUES(4,'休闲娱乐',NULL);
INSERT INTO `t_product_type` VALUES(5,'丽人',NULL);
INSERT INTO `t_product_type` VALUES(6,'购物',NULL);
INSERT INTO `t_product_type` VALUES(7,'生活服饰',NULL);
INSERT INTO `t_product_type` VALUES(8,'自助餐',1);
INSERT INTO `t_product_type` VALUES(9,'甜品饮料',1);
INSERT INTO `t_product_type` VALUES(10,'烧烤烤肉',1);
INSERT INTO `t_product_type` VALUES(11,'经济/客栈',3);
INSERT INTO `t_product_type` VALUES(12,'五星/豪华',3);
INSERT INTO `t_product_type` VALUES(13,'KTV',4);
INSERT INTO `t_product_type` VALUES(14,'温泉/浴场',4);
INSERT INTO `t_product_type` VALUES(99,'综合',NULL);
/*!40000 ALTER TABLE `t_product_type` ENABLE KEYS */;

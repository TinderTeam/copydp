# Host: 127.0.0.1  (Version: 5.1.67-community)
# Date: 2015-03-13 17:20:22
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
# Structure for table "t_city"
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
# Structure for table "t_city_zone"
#

DROP TABLE IF EXISTS `t_city_zone`;
CREATE TABLE `t_city_zone` (
  `zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `zone_name` varchar(255) DEFAULT NULL,
  `city_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`zone_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `vip_limit_date` datetime DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
# Structure for table "t_poll_code"
#

DROP TABLE IF EXISTS `t_poll_code`;
CREATE TABLE `t_poll_code` (
  `code` varchar(11) NOT NULL DEFAULT '',
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for table "t_privilege"
#

DROP TABLE IF EXISTS `t_privilege`;
CREATE TABLE `t_privilege` (
  `privilege_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) DEFAULT NULL,
  `function` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`privilege_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

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
  `svip_product_id` varchar(255) DEFAULT NULL,
  `imgsrc` varchar(255) DEFAULT NULL,
  `imglist` varchar(255) DEFAULT NULL,
  `product_status` varchar(255) NOT NULL DEFAULT '待审核',
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=208 DEFAULT CHARSET=utf8;

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
# Structure for table "t_product_notice"
#

DROP TABLE IF EXISTS `t_product_notice`;
CREATE TABLE `t_product_notice` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `orderinfo` varchar(255) DEFAULT NULL,
  `rule` varchar(255) DEFAULT NULL,
  `warning` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=206 DEFAULT CHARSET=utf8;

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
# Structure for table "t_recommend_product"
#

DROP TABLE IF EXISTS `t_recommend_product`;
CREATE TABLE `t_recommend_product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8;

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
  `status` varchar(255) DEFAULT '正常',
  `qr_code` varchar(255) DEFAULT 'false',
  `seller_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `t_seller_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `t_product_type` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

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
# Structure for table "t_svip_product"
#

DROP TABLE IF EXISTS `t_svip_product`;
CREATE TABLE `t_svip_product` (
  `svip_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `limit_consumption_num` int(10) DEFAULT NULL COMMENT '限制消费次数',
  `limit_consumption_period` varchar(255) DEFAULT NULL COMMENT '限制消费周期',
  `create_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`svip_product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

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
# Structure for table "t_user"
#

DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(255) NOT NULL DEFAULT '123456',
  `username` varchar(255) NOT NULL DEFAULT '',
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=266 DEFAULT CHARSET=utf8;

DROP VIEW IF EXISTS `t_view_activity`;
CREATE VIEW `t_view_activity` AS 
  select `copydp`.`t_activity`.`status` AS `status`,`copydp`.`t_activity`.`activity_id` AS `activity_id`,`copydp`.`t_activity`.`title` AS `title`,`copydp`.`t_city`.`city` AS `city`,`copydp`.`t_activity`.`dscr` AS `dscr`,`copydp`.`t_activity`.`imgsrc` AS `imgsrc`,`copydp`.`t_activity`.`point` AS `point`,`copydp`.`t_activity`.`datelimit` AS `datelimit`,`copydp`.`t_activity`.`memberlimit` AS `memberlimit`,`copydp`.`t_activity`.`address` AS `address`,`copydp`.`t_activity`.`info` AS `info`,`copydp`.`t_activity`.`datetime` AS `datetime`,`copydp`.`t_activity`.`note` AS `note` from (`copydp`.`t_activity` join `copydp`.`t_city` on((`copydp`.`t_city`.`city_id` = `copydp`.`t_activity`.`city_id`)));

DROP VIEW IF EXISTS `t_view_activity_order`;
CREATE VIEW `t_view_activity_order` AS 
  select `copydp`.`t_activity_order`.`activity_order_id` AS `activity_order_id`,`copydp`.`t_activity_order`.`activity_id` AS `activity_id`,`copydp`.`t_activity_order`.`activity_title` AS `activity_title`,`copydp`.`t_activity_order`.`status` AS `status`,`copydp`.`t_activity_order`.`datetime` AS `datetime`,`copydp`.`t_user`.`username` AS `username`,`copydp`.`t_customer`.`grade` AS `grade`,`copydp`.`t_customer`.`cellphone` AS `cellphone`,`copydp`.`t_customer`.`email` AS `email` from ((`copydp`.`t_activity_order` join `copydp`.`t_customer` on((`copydp`.`t_customer`.`user_id` = `copydp`.`t_activity_order`.`customer_id`))) join `copydp`.`t_user` on((`copydp`.`t_user`.`user_id` = `copydp`.`t_activity_order`.`customer_id`)));

DROP VIEW IF EXISTS `t_view_community_customer`;
CREATE VIEW `t_view_community_customer` AS 
  select `copydp`.`t_community`.`community_id` AS `community_id`,`copydp`.`t_community`.`title` AS `title`,`copydp`.`t_community`.`community_type` AS `community_type`,`copydp`.`t_community`.`datetime` AS `datetime`,`copydp`.`t_community`.`customer_id` AS `customer_id`,count(`copydp`.`t_community`.`customer_id`) AS `customer_number`,`copydp`.`t_user`.`username` AS `username` from (`copydp`.`t_community` join `copydp`.`t_user` on((`copydp`.`t_user`.`user_id` = `copydp`.`t_community`.`customer_id`))) group by `copydp`.`t_community`.`customer_id` order by 'num';

DROP VIEW IF EXISTS `t_view_community_discuss`;
CREATE VIEW `t_view_community_discuss` AS 
  select `copydp`.`t_community_discuss`.`community_discuss_id` AS `community_discuss_id`,`copydp`.`t_community_discuss`.`community_id` AS `community_id`,`copydp`.`t_community_discuss`.`datetime` AS `datetime`,`copydp`.`t_user`.`user_id` AS `user_id`,`copydp`.`t_user`.`username` AS `username`,`copydp`.`t_community_discuss`.`content` AS `content` from (`copydp`.`t_community_discuss` join `copydp`.`t_user` on((`copydp`.`t_user`.`user_id` = `copydp`.`t_community_discuss`.`user_id`)));

DROP VIEW IF EXISTS `t_view_community_discuss_sum`;
CREATE VIEW `t_view_community_discuss_sum` AS 
  select `copydp`.`t_community_discuss`.`community_id` AS `community_id`,`copydp`.`t_community`.`title` AS `title`,count(`copydp`.`t_community_discuss`.`community_discuss_id`) AS `discuss_num` from (`copydp`.`t_community_discuss` join `copydp`.`t_community` on((`copydp`.`t_community`.`community_id` = `copydp`.`t_community_discuss`.`community_id`))) group by `copydp`.`t_community_discuss`.`community_id`;

DROP VIEW IF EXISTS `t_view_customer`;
CREATE VIEW `t_view_customer` AS 
  select `copydp`.`t_customer`.`user_id` AS `user_id`,`copydp`.`t_customer`.`create_date` AS `create_date`,`copydp`.`t_customer`.`grade` AS `grade`,`copydp`.`t_customer`.`vip_limit_date` AS `vip_limit_date`,`copydp`.`t_customer`.`score` AS `score`,`copydp`.`t_customer`.`cellphone` AS `cellphone`,`copydp`.`t_customer`.`email` AS `email`,`copydp`.`t_customer`.`car_id` AS `car_id`,`copydp`.`t_customer`.`recommender_id` AS `recommender_id`,`copydp`.`t_customer`.`status` AS `status`,`copydp`.`t_customer`.`request` AS `request`,`copydp`.`t_user`.`password` AS `password`,`copydp`.`t_user`.`username` AS `username`,`copydp`.`t_user`.`role` AS `role` from (`copydp`.`t_customer` left join `copydp`.`t_user` on((`copydp`.`t_customer`.`user_id` = `copydp`.`t_user`.`user_id`))) where (`copydp`.`t_user`.`role` = 'CUSTOMER');

DROP VIEW IF EXISTS `t_view_order`;
CREATE VIEW `t_view_order` AS 
  select `copydp`.`t_order`.`order_id` AS `order_id`,`copydp`.`t_order`.`order_name` AS `order_name`,`copydp`.`t_order`.`customer_id` AS `customer_id`,`copydp`.`t_order`.`product_id` AS `product_id`,`copydp`.`t_order`.`product_name` AS `product_name`,`copydp`.`t_order`.`order_time` AS `order_time`,`copydp`.`t_order`.`quantity` AS `quantity`,`copydp`.`t_order`.`order_price` AS `order_price`,`copydp`.`t_order`.`order_status` AS `order_status`,`copydp`.`t_user`.`username` AS `username`,`copydp`.`t_order`.`seller_id` AS `seller_id`,`copydp`.`t_order`.`imgsrc` AS `imgsrc`,`copydp`.`t_order`.`product_description` AS `product_description`,`copydp`.`t_order`.`order_original_price` AS `order_original_price`,`copydp`.`t_order`.`note` AS `note`,`copydp`.`t_product`.`type_id` AS `type_id`,`copydp`.`t_product_type`.`type_name` AS `type_name`,`copydp`.`t_product`.`svip_product_id` AS `svip_product_id`,`copydp`.`t_product`.`end_date_time` AS `end_date_time`,`t_view_customer`.`cellphone` AS `cellphone`,`t_view_customer`.`grade` AS `grade`,`copydp`.`t_seller`.`seller_name` AS `seller_name` from (((((`copydp`.`t_order` left join `copydp`.`t_product` on((`copydp`.`t_product`.`product_id` = `copydp`.`t_order`.`product_id`))) left join `copydp`.`t_user` on((`copydp`.`t_user`.`user_id` = `copydp`.`t_order`.`customer_id`))) left join `copydp`.`t_seller` on((`copydp`.`t_order`.`seller_id` = `copydp`.`t_seller`.`user_id`))) left join `copydp`.`t_view_customer` on((`t_view_customer`.`user_id` = `copydp`.`t_order`.`customer_id`))) left join `copydp`.`t_product_type` on((`copydp`.`t_product_type`.`type_id` = `copydp`.`t_product`.`type_id`)));

DROP VIEW IF EXISTS `t_view_product`;
CREATE VIEW `t_view_product` AS 
  select `copydp`.`t_product`.`product_id` AS `product_id`,`copydp`.`t_product`.`name` AS `name`,`copydp`.`t_product`.`type_id` AS `type_id`,`copydp`.`t_product`.`seller_id` AS `seller_id`,`copydp`.`t_product`.`update_date` AS `update_date`,`copydp`.`t_product`.`end_date_time` AS `end_date_time`,`copydp`.`t_product`.`price` AS `price`,`copydp`.`t_product`.`original_price` AS `original_price`,`copydp`.`t_product`.`describe` AS `dscr`,`copydp`.`t_product`.`basic_infor` AS `basic_infor`,`copydp`.`t_product`.`svip_product_id` AS `svip_product_id`,`copydp`.`t_product`.`imgsrc` AS `imgsrc`,`copydp`.`t_product`.`imglist` AS `imglist`,`copydp`.`t_product`.`product_status` AS `product_status`,`t_view_seller`.`username` AS `username`,`t_view_seller`.`zone_id` AS `zone_id`,`t_view_seller`.`zone_name` AS `zone_name`,`t_view_seller`.`city` AS `city`,`t_view_seller`.`city_id` AS `city_id` from (`copydp`.`t_product` join `copydp`.`t_view_seller` on((`copydp`.`t_product`.`seller_id` = `t_view_seller`.`user_id`))) order by `copydp`.`t_product`.`update_date` desc;

DROP VIEW IF EXISTS `t_view_product_eva`;
CREATE VIEW `t_view_product_eva` AS 
  select `copydp`.`t_product_evaluation`.`product_eva_id` AS `product_eva_id`,`copydp`.`t_user`.`username` AS `user_name`,`copydp`.`t_product_evaluation`.`score_product` AS `score_product`,`copydp`.`t_product_evaluation`.`eva_content` AS `eva_content`,`copydp`.`t_product_evaluation`.`datetime` AS `datetime` from (`copydp`.`t_product_evaluation` join `copydp`.`t_user` on((`copydp`.`t_user`.`user_id` = `copydp`.`t_product_evaluation`.`customer_id`)));

DROP VIEW IF EXISTS `t_view_recommernd`;
CREATE VIEW `t_view_recommernd` AS 
  select `copydp`.`t_recommend_product`.`product_id` AS `product_id`,`copydp`.`t_product`.`name` AS `name`,`copydp`.`t_product`.`imgsrc` AS `imgsrc`,`copydp`.`t_product`.`describe` AS `dscr`,`copydp`.`t_product`.`price` AS `price`,`copydp`.`t_product`.`product_status` AS `product_status`,`copydp`.`t_city`.`city` AS `city` from (((`copydp`.`t_recommend_product` join `copydp`.`t_product` on((`copydp`.`t_recommend_product`.`product_id` = `copydp`.`t_product`.`product_id`))) join `copydp`.`t_seller` on((`copydp`.`t_product`.`seller_id` = `copydp`.`t_seller`.`user_id`))) join `copydp`.`t_city` on((`copydp`.`t_seller`.`city_id` = `copydp`.`t_city`.`city_id`)));

DROP VIEW IF EXISTS `t_view_seller`;
CREATE VIEW `t_view_seller` AS 
  select `copydp`.`t_seller`.`user_id` AS `user_id`,`copydp`.`t_seller`.`seller_name` AS `seller_name`,`copydp`.`t_seller`.`city_id` AS `city_id`,`copydp`.`t_seller`.`qr_code` AS `qr_code`,`copydp`.`t_seller`.`status` AS `status`,`copydp`.`t_seller`.`zone_id` AS `zone_id`,`copydp`.`t_seller`.`type_id` AS `type_id`,`copydp`.`t_seller`.`description` AS `description`,`copydp`.`t_seller`.`position` AS `position`,`copydp`.`t_seller`.`img` AS `img`,`copydp`.`t_seller`.`info` AS `info`,`copydp`.`t_product_type`.`type_name` AS `type_name`,`copydp`.`t_product_type`.`father_id` AS `father_id`,`copydp`.`t_city`.`city` AS `city`,`copydp`.`t_city_zone`.`zone_name` AS `zone_name`,`copydp`.`t_user`.`password` AS `password`,`copydp`.`t_user`.`username` AS `username`,`copydp`.`t_user`.`role` AS `role` from ((((`copydp`.`t_seller` left join `copydp`.`t_product_type` on((`copydp`.`t_seller`.`type_id` = `copydp`.`t_product_type`.`type_id`))) left join `copydp`.`t_city` on((`copydp`.`t_seller`.`city_id` = `copydp`.`t_city`.`city_id`))) left join `copydp`.`t_city_zone` on(((`copydp`.`t_seller`.`city_id` = `copydp`.`t_city_zone`.`city_id`) and (`copydp`.`t_seller`.`zone_id` = `copydp`.`t_city_zone`.`zone_id`)))) left join `copydp`.`t_user` on((`copydp`.`t_seller`.`user_id` = `copydp`.`t_user`.`user_id`))) where (`copydp`.`t_user`.`role` = 'SELLER');

DROP VIEW IF EXISTS `t_view_svip_product`;
CREATE VIEW `t_view_svip_product` AS 
  select `t_view_product`.`name` AS `product_name`,`t_view_product`.`type_id` AS `type_id`,`t_view_product`.`product_status` AS `product_status`,`copydp`.`t_svip_product`.`svip_product_id` AS `svip_product_id`,`copydp`.`t_svip_product`.`limit_consumption_num` AS `limit_consumption_num`,`copydp`.`t_svip_product`.`limit_consumption_period` AS `limit_consumption_period`,`copydp`.`t_svip_product`.`create_datetime` AS `create_datetime`,`copydp`.`t_product_type`.`type_name` AS `type_name`,`t_view_product`.`dscr` AS `dsrc` from ((`copydp`.`t_view_product` left join `copydp`.`t_svip_product` on((`copydp`.`t_svip_product`.`svip_product_id` = `t_view_product`.`svip_product_id`))) join `copydp`.`t_product_type` on((`t_view_product`.`type_id` = `copydp`.`t_product_type`.`type_id`))) where (`t_view_product`.`svip_product_id` <> '普通');

DROP VIEW IF EXISTS `t_view_svip_product_order`;
CREATE VIEW `t_view_svip_product_order` AS 
  select `copydp`.`t_order`.`customer_id` AS `customer_id`,`copydp`.`t_svip_product`.`svip_product_id` AS `svip_product_id`,`copydp`.`t_order`.`order_time` AS `order_time` from ((`copydp`.`t_order` join `copydp`.`t_product` on((`copydp`.`t_product`.`product_id` = `copydp`.`t_order`.`product_id`))) join `copydp`.`t_svip_product` on((`copydp`.`t_svip_product`.`svip_product_id` = `copydp`.`t_product`.`svip_product_id`)));

DROP VIEW IF EXISTS `t_view_zone`;
CREATE VIEW `t_view_zone` AS 
  select `copydp`.`t_city_zone`.`zone_id` AS `zone_id`,`copydp`.`t_city`.`city_id` AS `city_id`,`copydp`.`t_city`.`city` AS `city`,`copydp`.`t_city_zone`.`zone_name` AS `zone_name` from (`copydp`.`t_city_zone` join `copydp`.`t_city` on((`copydp`.`t_city`.`city_id` = `copydp`.`t_city_zone`.`city_id`)));

DROP DATABASE IF EXISTS `copydp`;
CREATE DATABASE `copydp`;
USE `copydp`;

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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

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

DROP TABLE IF EXISTS `t_city`;
CREATE TABLE `t_city` (
  `city_id` int(11) NOT NULL AUTO_INCREMENT,
  `city` varchar(255) DEFAULT NULL,
  `x` varchar(255) DEFAULT NULL,
  `y` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `t_city_zone`;
CREATE TABLE `t_city_zone` (
  `zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `zone_name` varchar(255) DEFAULT NULL,
  `city_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`zone_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `t_collect`;
CREATE TABLE `t_collect` (
  `collect_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`collect_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `t_community`;
CREATE TABLE `t_community` (
  `community_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `community_type` varchar(255) DEFAULT NULL,
  `context` varchar(255) DEFAULT NULL,
  `datetime` date DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`community_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `t_community_discuss`;
CREATE TABLE `t_community_discuss` (
  `community_discuss_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `community_id` int(11) DEFAULT NULL,
  `datetime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`community_discuss_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

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


DROP TABLE IF EXISTS `t_news`;
CREATE TABLE `t_news` (
  `news_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `datetime` date DEFAULT NULL,
  PRIMARY KEY (`news_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `t_product_notice`;
CREATE TABLE `t_product_notice` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `orderinfo` varchar(255) DEFAULT NULL,
  `rule` varchar(255) DEFAULT NULL,
  `warning` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `t_product_type`;
CREATE TABLE `t_product_type` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) DEFAULT NULL,
  `father_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1002 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `t_recommend_product`;
CREATE TABLE `t_recommend_product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

DROP TABLE IF EXISTS `t_sys_config`;
CREATE TABLE `t_sys_config` (
  `key` varchar(255) NOT NULL DEFAULT '',
  `value` int(11) DEFAULT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(255) NOT NULL DEFAULT '123456',
  `username` varchar(255) NOT NULL DEFAULT '',
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP VIEW IF EXISTS `t_view_activity`;
CREATE VIEW `t_view_activity` AS 
  select `t_activity`.`status` AS `status`,`t_activity`.`activity_id` AS `activity_id`,`t_activity`.`title` AS `title`,`t_city`.`city` AS `city`,`t_activity`.`dscr` AS `dscr`,`t_activity`.`imgsrc` AS `imgsrc`,`t_activity`.`point` AS `point`,`t_activity`.`datelimit` AS `datelimit`,`t_activity`.`memberlimit` AS `memberlimit`,`t_activity`.`address` AS `address`,`t_activity`.`info` AS `info`,`t_activity`.`datetime` AS `datetime`,`t_activity`.`note` AS `note` from (`t_activity` join `t_city` on((`t_city`.`city_id` = `t_activity`.`city_id`)));

DROP VIEW IF EXISTS `t_view_activity_order`;
CREATE VIEW `t_view_activity_order` AS 
  select `t_activity_order`.`activity_order_id` AS `activity_order_id`,`t_activity_order`.`activity_id` AS `activity_id`,`t_activity_order`.`activity_title` AS `activity_title`,`t_activity_order`.`status` AS `status`,`t_activity_order`.`datetime` AS `datetime`,`t_user`.`username` AS `username`,`t_customer`.`grade` AS `grade`,`t_customer`.`cellphone` AS `cellphone`,`t_customer`.`email` AS `email` from ((`t_activity_order` join `t_customer` on((`t_customer`.`user_id` = `t_activity_order`.`customer_id`))) join `t_user` on((`t_user`.`user_id` = `t_activity_order`.`customer_id`)));

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

DROP VIEW IF EXISTS `t_view_zone`;
CREATE VIEW `t_view_zone` AS 
  select `t_city_zone`.`zone_id` AS `zone_id`,`t_city`.`city_id` AS `city_id`,`t_city`.`city` AS `city`,`t_city_zone`.`zone_name` AS `zone_name` from (`t_city_zone` join `t_city` on((`t_city`.`city_id` = `t_city_zone`.`city_id`)));

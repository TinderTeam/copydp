
#
# 分类信息
#
INSERT INTO `t_product_type` VALUES (1,'地方美食',NULL);
INSERT INTO `t_product_type` VALUES (2,'休闲娱乐',NULL);
INSERT INTO `t_product_type` VALUES (3,'汽车服务',NULL);
INSERT INTO `t_product_type` VALUES (4,'酒店旅游',NULL);
INSERT INTO `t_product_type` VALUES (5,'摄影写真',NULL);
INSERT INTO `t_product_type` VALUES (6,'都市丽人',NULL);
INSERT INTO `t_product_type` VALUES (7,'教育培训',NULL);
INSERT INTO `t_product_type` VALUES (8,'生活服务',NULL);
INSERT INTO `t_product_type` VALUES (9,'餐饮美食',NULL);
INSERT INTO `t_product_type` VALUES (10,'火锅海鲜',1);
INSERT INTO `t_product_type` VALUES (11,'自助餐',1);
INSERT INTO `t_product_type` VALUES (12,'日韩料理',1);
INSERT INTO `t_product_type` VALUES (13,'甜品糕点',1);
INSERT INTO `t_product_type` VALUES (14,'中西美食',1);
INSERT INTO `t_product_type` VALUES (15,'家常小炒',1);
INSERT INTO `t_product_type` VALUES (16,'酒吧KTV',2);
INSERT INTO `t_product_type` VALUES (17,'保健按摩',2);
INSERT INTO `t_product_type` VALUES (18,'足道浴场',2);
INSERT INTO `t_product_type` VALUES (19,'影音欣赏',2);
INSERT INTO `t_product_type` VALUES (20,'茶式咖啡馆',2);
INSERT INTO `t_product_type` VALUES (21,'运动户外',2);
INSERT INTO `t_product_type` VALUES (22,'洗车行',3);
INSERT INTO `t_product_type` VALUES (23,'装饰美容',3);
INSERT INTO `t_product_type` VALUES (24,'维护保养',3);
INSERT INTO `t_product_type` VALUES (25,'二手车行',3);
INSERT INTO `t_product_type` VALUES (26,'驾校培训',3);
INSERT INTO `t_product_type` VALUES (27,'品牌4S店',3);
INSERT INTO `t_product_type` VALUES (28,'景点景区',4);
INSERT INTO `t_product_type` VALUES (29,'旅游住宿',4);
INSERT INTO `t_product_type` VALUES (30,'摄影影楼',5);
INSERT INTO `t_product_type` VALUES (31,'儿童摄影',5);
INSERT INTO `t_product_type` VALUES (32,'美容会所',6);
INSERT INTO `t_product_type` VALUES (33,'美发美甲',6);
INSERT INTO `t_product_type` VALUES (34,'减肥降脂',6);
INSERT INTO `t_product_type` VALUES (35,'化妆护肤',6);
INSERT INTO `t_product_type` VALUES (36,'儿童培训',7);
INSERT INTO `t_product_type` VALUES (37,'成人培训',7);
INSERT INTO `t_product_type` VALUES (38,'电子数码',8);
INSERT INTO `t_product_type` VALUES (39,'宠物天地',8);
INSERT INTO `t_product_type` VALUES (40,'生活日用',8);
INSERT INTO `t_product_type` VALUES (41,'建材家装',8);
INSERT INTO `t_product_type` VALUES (42,'婚庆采购',8);

#
# 商户信息
#
INSERT INTO `t_seller` VALUES (1,'深圳',1,'描述','(10.10.10)');
INSERT INTO `t_seller` VALUES (2,'深圳',1,'描述','(10.10.10)');
INSERT INTO `t_seller` VALUES (3,'深圳',2,'描述','(10.10.10)');
INSERT INTO `t_seller` VALUES (4,'深圳',2,'描述','(10.10.10)');
INSERT INTO `t_seller` VALUES (5,'深圳',3,'描述','(10.10.10)');
INSERT INTO `t_seller` VALUES (6,'深圳',3,'描述','(10.10.10)');
INSERT INTO `t_seller` VALUES (7,'深圳',4,'描述','(10.10.10)');
INSERT INTO `t_seller` VALUES (8,'深圳',4,'描述','(10.10.10)');
INSERT INTO `t_seller` VALUES (9,'深圳',5,'描述','(10.10.10)');
INSERT INTO `t_seller` VALUES (10,'深圳',5,'描述','(10.10.10)');

INSERT INTO `t_seller` VALUES (11,'广州',1,'描述','(10.10.10)');
INSERT INTO `t_seller` VALUES (12,'广州',1,'描述','(10.10.10)');
INSERT INTO `t_seller` VALUES (13,'广州',2,'描述','(10.10.10)');
INSERT INTO `t_seller` VALUES (14,'广州',2,'描述','(10.10.10)');
INSERT INTO `t_seller` VALUES (15,'广州',3,'描述','(10.10.10)');
INSERT INTO `t_seller` VALUES (16,'广州',3,'描述','(10.10.10)');
INSERT INTO `t_seller` VALUES (17,'广州',4,'描述','(10.10.10)');
INSERT INTO `t_seller` VALUES (18,'广州',4,'描述','(10.10.10)');
INSERT INTO `t_seller` VALUES (19,'广州',5,'描述','(10.10.10)');
INSERT INTO `t_seller` VALUES (20,'广州',5,'描述','(10.10.10)');

#
# 产品信息
#
INSERT INTO `t_product` VALUES (1,'团购1',1,1,'2014-09-10 10:00:00','2014-09-10 10:00:00',100.00,50.00,'描述信息','<html>','特权专属')
,(2,'团购2',2,1,'2014-09-10 10:00:00','2014-09-10 10:00:00',300.00,150.00,'描述','<html>',NULL)
,(3,'团购3',3,1,'2014-09-10 11:00:00','2014-09-10 10:00:00',300.00,150.00,'描述','<html>',NULL)
,(4,'团购4',4,1,'2014-09-10 12:00:00','2014-09-10 10:00:00',300.00,150.00,'描述','<html>',NULL)
,(5,'团购5',1,2,'2014-09-10 13:00:00','2014-09-10 10:00:00',300.00,150.00,'描述','<html>',NULL)
,(6,'团购6',2,2,'2014-09-10 14:00:00','2014-09-10 10:00:00',300.00,150.00,'描述','<html>',NULL)
,(7,'团购7',3,2,'2014-09-10 15:00:00','2014-09-10 10:00:00',300.00,150.00,'描述','<html>',NULL);


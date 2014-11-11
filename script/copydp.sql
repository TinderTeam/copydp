# Host: localhost  (Version: 5.1.70-community)
# Date: 2014-11-11 11:21:48
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

#
# Data for table "t_activity"
#

INSERT INTO `t_activity` VALUES (1,'测试活动（国庆）','2014-10-01 00:00:00','伟大祖国生日','北京天安门','一起观看升旗仪式',NULL,'已结束','2','2014-10-7','300','10.jpg','50'),(2,'测试活动（演唱会）','2014-10-01 00:00:00','一起参加演唱会吧','某大礼堂','一起参加演唱会',NULL,'已结束','2','2014-10-3','5000','11.jpg','10');

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

INSERT INTO `t_activity_order` VALUES ('1111411979163',1,11,'测试活动',NULL,'10.jpg',300,'2014-10-07','2014-09-29','已报名'),('111415544789',1,1,'测试活动（国庆）',NULL,'10.jpg',300,'2014-10-07','2014-11-09','已报名'),('111415545664',1,1,'测试活动（国庆）',NULL,'10.jpg',300,'2014-10-07','2014-11-09','已报名');

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

#
# Data for table "t_city"
#

INSERT INTO `t_city` VALUES (1,'广州','113.270855','23.136533'),(2,'深圳','114.063918','22.550326'),(3,'上海','121.491349','31.221002'),(4,'北京','116.399275','39.917545'),(5,'南京','123123','123123');

#
# Source for table "t_city_zone"
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

#
# Data for table "t_community"
#

INSERT INTO `t_community` VALUES (2,'用户自由发帖','招聘信息','<p>用户发帖</p>','2014-09-29',1);

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

INSERT INTO `t_community_discuss` VALUES (1,23,'测试回复',1,'2014-09-29 16:08:10'),(2,1000,'未登录匿名回复',1,'2014-09-29 16:08:36'),(3,1,'用户回复',1,'2014-09-29 16:09:25'),(4,1,'dsgaes ',1,'2014-10-09 18:37:17'),(6,0,'回帖',2,'2014-10-15 15:04:55'),(7,0,'回帖',2,'2014-10-15 15:05:23'),(8,0,'回帖',2,'2014-10-15 15:05:56'),(9,0,'回帖',2,'2014-10-15 15:06:15'),(10,0,'回帖',2,'2014-10-15 15:06:34'),(11,0,'回帖',2,'2014-10-15 15:06:50'),(12,0,'回帖',2,'2014-10-15 15:07:11'),(13,0,'回帖',2,'2014-10-15 15:13:02');

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

INSERT INTO `t_customer` VALUES (1,'VIP',100,'1861242099.23554','customer1@fuego.cn','粤B28469',NULL,'正常','升级','2014-11-11'),(2,'VIP',200,'1862343662.94841','customer2@fuego.cn','粤B89388',NULL,'正常',NULL,NULL),(3,'VIP',300,'1869834693.33268','customer3@fuego.cn','粤B78423',NULL,'正常',NULL,NULL),(4,'VIP',400,'1863621374.97321','customer4@fuego.cn','粤B33313',NULL,'正常',NULL,NULL),(5,'VIP',500,'1868247745.83444','customer5@fuego.cn','粤B40858',NULL,'待审批',NULL,NULL),(6,'SVIP',600,'1867165343.34196','customer6@fuego.cn','粤B93714',1,'正常',NULL,NULL),(7,'SVIP',700,'1865462745.13117','customer7@fuego.cn','粤B38520',2,'正常',NULL,NULL),(8,'SVIP',800,'1867373196.55985','customer8@fuego.cn','粤B43274',3,'正常',NULL,NULL),(9,'SVIP',900,'1869828938.58878','customer9@fuego.cn','粤B29052',4,'正常',NULL,NULL),(10,'SVIP',1000,'1866204335.03543','customer10@fuego.cn','粤B58789',5,'待审批',NULL,NULL),(51,'VIP',0,'','123@qq.com','',NULL,'待审批','null','2014-11-11'),(52,'VIP',0,'','123@11.com','',NULL,'正常','null','2014-11-11');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Data for table "t_news"
#

INSERT INTO `t_news` VALUES (1,'习近平：有的干部整天琢磨抱谁大腿','<p>　　“一到节假日甚至不是节假日，有些人就到处跑，还带着一大家子，吃好的，住好的，玩好的，大江南北，长城内外，哪儿好就往哪儿去。不少是公款消费……”这是近日由中央文献研究室编辑的《十八大以来重要文献选编》上册中，收录的习近平同志未公开发表过的谈话中的一个片段。该选编中共收录重要文献70篇。其中，习近平文稿24篇，有8篇是首次公开发表，文稿讲话内容包括社会主义制度、反对铺张浪费、纪律作风建设、食品安全、政法工作等重要内容。</p>\r\n\r\n<p><strong>　　1.社会主义制度</strong></p>\r\n\r\n<p><strong>　　在新进中央委员会的委员、候补委员学习贯彻党的十八大精神研讨班上的讲话(2013年1月5日)</strong></p>\r\n\r\n<p><strong>　　全盘否定毛泽东同志会天下大乱</strong></p>\r\n\r\n<p>　　在讲话中，习近平指出，如果当时全盘否定了毛泽东同志，那我们党还能站得住吗？我们国家的社会主义制度还能站得住吗？那就站不住了，站不住就会天下大乱。所以，正确处理改革开放前后的社会主义实践探索的关系，不只是一个历史问题，更主要的是一个政治问题。建议大家把《关于建国以来党的若干历史问题的决议》找出来再看看。</p>\r\n\r\n<p>　　邓小平同志说，巩固和发展社会主义制度，还需要一个很长的历史阶段，需要我们几代人、十几代人、甚至几十代人坚持不懈地努力奋斗。几十代人，那是多么长啊！从孔老夫子到现在也不过七十几代人。这样看问题，充分说明了我们中国共产党人政治上的清醒。</p>\r\n\r\n<p><strong>　　2.反对铺张浪费</strong></p>\r\n\r\n<p><strong> </strong></p>\r\n\r\n<p><strong>　　在新华社《国内动态清样》第二百二十七期《网民呼吁遏制餐饮环节“舌尖上的浪费”》上的批示(2013年1月17日)</strong></p>\r\n\r\n<p><strong> </strong></p>\r\n\r\n<p><strong>　　想起困难群众感觉浪费让人痛心</strong></p>\r\n\r\n<p>　　习近平指出，从文章反映的情况看，餐饮环节上的浪费现象触目惊心。广大干部群众对餐饮浪费等各种浪费行为特别是公款浪费行为反映强烈。联想到我国还有一亿多农村扶贫对象、几千万城市低保人口以及其他为数众多的困难群众，各种浪费现象的严重存在令人十分痛心。浪费之风务必狠刹！要加大宣传引导力度，大力弘扬中华民族勤俭节约的优秀传统，大力宣传节约光荣、浪费可耻的思想观念，努力使厉行节约、反对浪费在全社会蔚然成风。要采取针对性、操作性、指导性强的举措，加强监督检查，鼓励节约，整治浪费。</p>\r\n\r\n<p><strong>　　在人民日报《专家学者对遏制公款吃喝的分析和建议》等材料上的批示(2013年2月22日)</strong></p>\r\n\r\n<p><strong> </strong></p>\r\n\r\n<p><strong>　　厉行节约坚决防止走过场一阵风</strong></p>\r\n\r\n<p>　　中央要求厉行勤俭节约、反对铺张浪费，得到了广大干部群众衷心拥护。后续工作要不断跟上，坚决防止走过场、一阵风，切实做到一抓到底、善始善终。抓而不紧，抓而不实，抓而不常，等于白抓。一段时间以来，社会各方面就此积极建言献策，不少意见值得重视。要梳理采纳合理意见，总结我们自己的经验教训，借鉴国内外有益做法。下一步，关键是要抓住制度建设这个重点，以完善公务接待、财务预算和审计、考核问责、监督保障等制度为抓手，努力建立健全立体式、全方位的制度体系，以刚性的制度约束、严格的制度执行、强有力的监督检查、严厉的惩戒机制，切实遏制公款消费中的各种违规违纪违法现象。</p>\r\n\r\n<p><strong>　　3.食品安全工作</strong></p>\r\n\r\n<p><strong> </strong></p>\r\n\r\n<p><strong>　　在中央农村工作会议上的讲话(2013年12月23日)</strong></p>\r\n\r\n<p><strong> </strong></p>\r\n\r\n<p><strong>　　食品安全长期做不好执政不够格</strong></p>\r\n\r\n<p>　　习近平指出，食品安全社会关注度高，舆论燃点低，一旦出问题，很容易引起公众恐慌，甚至酿成群体性事件。再加上有的事件被舆论过度炒作，不仅重创一个产业，而且弄得老百姓吃啥都不放心。“三鹿奶粉”事件的负面影响至今还没有消除，老百姓还是谈国产奶粉色变，出国出境四处采购婴幼儿奶粉，弄得一些地方对中国人限购。想到这些事，我心情就很沉重。</p>\r\n\r\n<p>　　能不能在食品安全上给老百姓一个满意的交代，是对我们执政能力的重大考验。我们党在中国执政，要是连个食品安全都做不好，还长期做不好的话，有人就会提出够不够格的问题。所以，食品安全问题必须引起高度关注，下最大气力抓好。</p>\r\n\r\n<p><strong>　　4.关于政法工作</strong></p>\r\n\r\n<p><strong> </strong></p>\r\n\r\n<p><strong>　　在中央政法工作会议上的讲话(2014年1月7日)</strong></p>\r\n\r\n<p><strong> </strong></p>\r\n\r\n<p><strong>　　许多案件凭良知就能够明断是非</strong></p>\r\n\r\n<p>　　习近平说，执法不严、司法不公，一个重要原因是少数干警缺乏应有的职业良知。许多案件，不需要多少法律专业知识，凭良知就能明断是非，但一些案件的处理就偏偏弄得是非界限很不清楚。各行各业都要有自己的职业良知，心中一点职业良知都没有，甚至连做人的良知都没有，那怎么可能做好工作呢？政法机关的职业良知，最重要的就是执法为民。</p>\r\n\r\n<p>　　我国是个人情社会，人们的社会联系广泛，上下级、亲戚朋友、老战友、老同事、老同学关系比较融洽，逢事喜欢讲个熟门熟道，但如果人情介入了法律和权力领域，就会带来问题，甚至带来严重问题。</p>\r\n\r\n<p>　　习近平指出，过去讲“有理走遍天下”，现在有理的也到处找人。这从另一角度说明，老百姓要办点事多么不易，不打点打点，不融通融通，不意思意思，就办不成事！这种现象一定要扭转过来！</p>\r\n\r\n<p><strong>　　5.组织纪律工作</strong></p>\r\n\r\n<p><strong> </strong></p>\r\n\r\n<p><strong>　　在十八届中央纪委二次全会上的讲话(2013年1月22日)</strong></p>\r\n\r\n<p><strong> </strong></p>\r\n\r\n<p><strong>　　“封妻荫子”要被百姓戳脊梁骨</strong></p>\r\n\r\n<p>　　身为党员，铁的纪律就必须执行。毛泽东同志说，路线是“王道”，纪律是“霸道”，这两者都不可少。如果党的政治纪律成了摆设，就会形成“破窗效应”，使党的章程、原则、制度、部署丧失严肃性和权威性，党就会沦为各取所需、自行其是的“私人俱乐部”。</p>\r\n\r\n<p>　　如果升学、考公务员、办企业、上项目、晋级、买房子、找工作、演出、出国等各种机会都要靠关系、搞门道，有背景的就能得到更多照顾，没有背景的再有本事也没有机会，就会严重影响社会公平正义。这种情况不纠正，能形成人才辈出、人尽其才的生动局面吗？这个社会还能有发展活力吗？我们党和国家还能生机勃勃向前发展吗？我们共产党人决不能搞封建社会那种“封妻荫子”、“一人得道，鸡犬升天”的腐败之道！否则，群众是要戳脊梁骨的！</p>\r\n\r\n<p><strong>　　在十八届中央纪委三次全会上的讲话(2014年1月14日)</strong></p>\r\n\r\n<p><strong> </strong></p>\r\n\r\n<p><strong>　　方方面面的潜规则越用越灵</strong></p>\r\n\r\n<p>　　改革开放和发展社会主义市场经济，改变了原有的资源配置方式和组织管理模式，越来越多的单位人变成社会人，各种复杂的人际关系和利益关系对党内生活带来不可低估的影响，引发了种种问题，组织观念薄弱、组织涣散就是其中一个需要严肃对待的问题。</p>\r\n\r\n<p>　　比如，有的个人主义、自由主义严重，目无组织纪律，跟组织讨价还价，不服从组织安排；有的党组织和领导干部在处理一些应该由中央和上级组织统一决定的重要问题时，事前不请示、事后不报告，搞先斩后奏、边斩边奏，甚至斩而不奏；有的领导班子既有民主不够、个人说了算问题，也有集中不够问题，班子里各自为政，把分管领域当成“私人领地”，互不买账，互不服气，内耗严重；有的只对领导个人负责而不对组织负责，把上下级关系搞成人身依附关系；有的办事不靠组织而靠熟人、靠关系，形形色色的关系网越织越密，方方面面的潜规则越用越灵；有的党组织对党员、干部疏于管理，缺乏严肃认真的组织生活，等等。</p>\r\n\r\n<p><strong>　　省部级领导离婚再婚要报告</strong></p>\r\n\r\n<p>　　当前，在请示报告制度方面存在不少问题。有的干部目无组织，干了什么、人跑到哪里去了，组织上都不知道，泥牛入海无消息。有事要找他，众里寻他千百度，颇费周折。对不请示报告的干部，党组织要格外注意，可能就是要出问题的前兆。</p>\r\n\r\n<p>　　领导干部个人事项报告制度是请示报告制度的一个重要组成部分，要在一定比例中抽查，如果填的和实际情况不一样，就要说清楚为什么，不能糊弄党组织。省部级领导干部离婚、再婚要不要报告？身边人出现重大问题要不要报告？当然要报，第一时间就要报告，要报告发生了什么事，报告是什么原因。不要突然来了一个网上信息，我们不知真假，再去核实就被动了。光知道没有报告不行，还要问清楚为什么不报告。到了一定程度就要派纪委去了解情况。</p>\r\n\r\n<p><strong>　　有的领导整天琢磨抱谁大腿</strong></p>\r\n\r\n<p>　　需要注意的是，不能把党组织等同于领导干部个人，对党尽忠不是对领导干部个人尽忠，党内不能搞人身依附关系。干部都是党的干部，不是哪个人的家臣。有的干部信奉拉帮结派的“圈子文化”，整天琢磨拉关系、找门路，分析某某是谁的人，某某是谁提拔的，该同谁搞搞关系、套套近乎，看看能抱上谁的大腿。有的领导干部喜欢当家长式的人物，希望别人都唯命是从，认为对自己百依百顺的就是好干部，而对别人、对群众怎么样可以不闻不问，弄得党内生活很不正常。</p>\r\n\r\n<p>　　犯个组织纪律、财经纪律算什么？打个哈哈就过去了！一到节假日甚至不是节假日，有些人就到处跑，还带着一大家子，吃好的，住好的，玩好的，大江南北，长城内外，哪儿好就往哪儿去。不少是公款消费，财政成了他们家的钱包，财政局长成了他们家的管账先生。</p>','2014-10-01');

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

INSERT INTO `t_order` VALUES ('211411978414','测试产品（点心）¥5.00×1',1,2,'测试产品（点心）','仅售5元美味担心',0,'2014-09-29 16:13:34',1,5,10,'已使用',NULL,'2.jpg');

#
# Source for table "t_privilege"
#

DROP TABLE IF EXISTS `t_privilege`;
CREATE TABLE `t_privilege` (
  `privilege_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) DEFAULT NULL,
  `function` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`privilege_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

#
# Data for table "t_product"
#

INSERT INTO `t_product` VALUES (1,'[422店通用] 真功夫',1,23,'2014-09-29 00:00:00','2014-10-30 00:00:00',13.00,18.00,'仅售13元，价值19元 冬/香菇鸡腿肉饭+香滑蒸蛋套餐，仅限下午14：00-18：00，19：00-关店，不可用于机场、高铁、火车、公路服务区、会展中心店等分店，无需预约！','<p>\t\t</p><p>真功夫餐饮管理有限公司，被誉为中式快餐品牌，是中国快餐行业前五强中的本土品牌，坚持“营养还是蒸的好”的品牌定位，主营以蒸品为特色的中式快餐。1990年由潘宇海在东莞长安创办，历经初创期、标准化运作期、品牌运作期、资本运作期，实现了由个体企业向现代化企业集团的飞跃。截止2014年3月，真功夫门店数量达570家，遍布全国近40个城市，在中国市场上成为和肯德基、麦当劳鼎足而立的“快餐三巨头。”\t\t\t</p><p>\t</p>','普通','54290ff23a8a9.jpg',NULL,'正常'),(2,'测试产品（点心）',1,11,'2014-09-29 00:00:00','2014-10-30 00:00:00',5.00,10.00,'仅售5元美味担心','美味点心','普通','2.jpg',NULL,'正常'),(3,'测试产品（寿司）',1,11,'2014-09-29 00:00:00','2014-10-30 00:00:00',15.00,20.00,'寿司2个仅售15','日式寿司','普通','3.jpg',NULL,'正常'),(4,'测试产品（KTV）',2,11,'2014-09-02 00:00:00','2014-11-11 00:00:00',121.00,300.00,'121元周末黄金时段包场，送丰富果盘','超长时间时间段18:00-24:00，赠送内容XXXXX','普通','1.jpg',NULL,'正常'),(5,'测试产品（度假）',2,11,'2014-09-02 00:00:00','2014-11-11 00:00:00',300.00,600.00,'中秋月球度假只要1500元','乘坐神州飞船环游月球','专享','6.jpg',NULL,'正常'),(6,'测试产品（积分兑换）',1000,11,'2014-09-10 00:00:00','2015-01-01 00:00:00',300.00,23.00,'300积分换购，全网超值','换购产品介绍','专享','4.jpg',NULL,'正常');

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

INSERT INTO `t_product_evaluation` VALUES (1,1,2,'2014-10-09 18:35:47',4,'asdfdsaf',2147483647);

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

#
# Data for table "t_recommend_product"
#

INSERT INTO `t_recommend_product` VALUES (1),(2),(3),(4);

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
  PRIMARY KEY (`user_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `t_seller_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `t_product_type` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "t_seller"
#

INSERT INTO `t_seller` VALUES (11,'2',1,'测试用商家','114.093814,22.563142','1','5429050f6aa08.jpg','测试用商家'),(21,'2',16,'深圳XXK　酷麦量贩式KTV是一家大型连锁机构，纯健康娱乐的休闲场所，有专业的管理团队，打造优质的服务，家人聚会、商务应酬、生日派对、公司活动、朋友狂欢，有不同风格的包厢供您选择！发挥您无限的想象空间，酷麦带给您一波波惊喜！放下工作生活压力，快来酷麦放松体验吧！TV','114.268588,22.623471','1','5429050f6aa08.jpg','<p><span style=\\\"color: rgb(51, 51, 51); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px; line-height: 21px; white-space: normal;\\\">　酷麦量贩式KTV是一家大型连锁机构，纯健康娱乐的休闲场所，有专业的管理团队，打造优质的服务，家人聚会、商务应酬、生日派对、公司活动、朋友狂欢，有不同风格的包厢供您选择！发挥您无限的想象空间，酷麦带给您一波波惊喜！放下工作生活压力，快来酷麦放松体验吧！</span>\r\n\t\t\t\t\t\t\t\t\t\t\t\t</p>'),(22,'2',1,'　京馔烘焙手工吐司来自湾吐司制作世家，100年家族经典创作，京馔吐司创始人是来自台湾的著名饼家，郭元益的侄子，京馔吐司的制作传承了3代人的心血，时间超过100年。由于是手工制作的原因，京馔吐司每天出炉就要5小时左右，每天只做一次，预定、是为了环保、限量、是为了保证品质，售完即止。','114.093814,22.563142','1','54290628c7eb3.jpg','<p><span style=\\\"color: rgb(51, 51, 51); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px; line-height: 21px; white-space: normal;\\\">　京馔烘焙手工吐司来自湾吐司制作世家，100年家族经典创作，京馔吐司创始人是来自台湾的著名饼家，郭元益的侄子，京馔吐司的制作传承了3代人的心血，时间超过100年。由于是手工制作的原因，京馔吐司每天出炉就要5小时左右，每天只做一次，预定、是为了环保、限量、是为了保证品质，售完即止。</span>\r\n\t\t\t\t\t\t\t\t\t\t\t\t</p>'),(23,'2',1,'  真功夫餐饮管理有限公司，被誉为中式快餐品牌，是中国快餐行业前五强中的本土品牌，坚持“营养还是蒸的好”的品牌定位，主营以蒸品为特色的中式快餐。1990年由潘宇海在东莞长安创办，历经初创期、标准化运作期、品牌运作期、资本运作期，实现了由个体企业向现代化企业集团的飞跃。截止2014年3月，真功夫门店数量达570家，遍布全国近40个城市，在中国市场上成为和肯德基、麦当劳鼎足而立的“快餐三巨头。”','113.885694,22.581297','2','5429099ff1fa4.jpg','<p><span style=\\\"color: rgb(51, 51, 51); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px; line-height: 21px; white-space: normal;\\\">&nbsp; 真功夫餐饮管理有限公司，被誉为中式快餐品牌，是中国快餐行业前五强中的本土品牌，坚持“营养还是蒸的好”的品牌定位，主营以蒸品为特色的中式快餐。1990年由潘宇海在东莞长安创办，历经初创期、标准化运作期、品牌运作期、资本运作期，实现了由个体企业向现代化企业集团的飞跃。截止2014年3月，真功夫门店数量达570家，遍布全国近40个城市，在中国市场上成为和肯德基、麦当劳鼎足而立的“快餐三巨头。”</span>\r\n\t\t\t\t\t\t\t\t\t\t\t\t</p>');

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

INSERT INTO `t_seller_evaluation` VALUES (1,1,'2014-10-09 18:35:50',3,4,'asdfdsaf','0','211411978414');

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

INSERT INTO `t_site_config` VALUES ('email','email'),('help1','www.baidu.com'),('help2','2'),('help3','3'),('help4','4'),('helpname1','帮助23rsdif'),('helpname2','帮助信息'),('helpname3','帮助信息'),('helpname4','帮助信息'),('link1','www.fuego.cn'),('link2','www.baidu.com'),('link3','24'),('link4',''),('linkname1','孚思科技'),('linkname2','百度'),('linkname3','23'),('linkname4',''),('tel','www.fuego.cn'),('time','time');

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

INSERT INTO `t_sys_config` VALUES ('login_score',0),('order_score',0);

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
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

#
# Data for table "t_user"
#

INSERT INTO `t_user` VALUES (0,'123456','admin','ADMIN'),(1,'895528','customer1','CUSTOMER'),(2,'384201','customer2','CUSTOMER'),(3,'578767','customer3','CUSTOMER'),(4,'588611','customer4','CUSTOMER'),(5,'957814','customer5','CUSTOMER'),(6,'142008','customer6','CUSTOMER'),(7,'550471','customer7','CUSTOMER'),(8,'218143','customer8','CUSTOMER'),(9,'200981','customer9','CUSTOMER'),(10,'160493','customer10','CUSTOMER'),(11,'128570','seller1','SELLER'),(12,'478570','seller2','SELLER'),(13,'471194','seller3','SELLER'),(14,'246548','seller4','SELLER'),(15,'119412','seller5','SELLER'),(16,'698809','seller6','SELLER'),(17,'946932','seller7','SELLER'),(18,'278877','seller8','SELLER'),(19,'941955','seller9','SELLER'),(20,'481508','seller10','SELLER'),(21,'123456','ktv','SELLER'),(22,'123456','tusi','SELLER'),(23,'123456','zgf','SELLER'),(25,'123456','testadmin','ADMIN'),(51,'123456','test','CUSTOMER'),(52,'123123','test1','CUSTOMER');

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
  select `t_activity_order`.`activity_order_id` AS `activity_order_id`,`t_activity_order`.`activity_id` AS `activity_id`,`t_activity_order`.`activity_title` AS `activity_title`,`t_activity_order`.`status` AS `status`,`t_activity_order`.`datetime` AS `datetime`,`t_user`.`username` AS `username`,`t_customer`.`grade` AS `grade`,`t_customer`.`cellphone` AS `cellphone`,`t_customer`.`email` AS `email` from ((`t_activity_order` join `t_customer` on((`t_customer`.`user_id` = `t_activity_order`.`customer_id`))) join `t_user` on((`t_user`.`user_id` = `t_activity_order`.`customer_id`)));

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
  select `t_order`.`order_id` AS `order_id`,`t_order`.`product_name` AS `product_name`,`t_product`.`end_date_time` AS `end_date_time`,`t_order`.`order_time` AS `order_time`,`t_order`.`quantity` AS `quantity`,`t_order`.`order_price` AS `order_price`,`t_user`.`username` AS `username`,`t_product`.`imgsrc` AS `imgsrc`,`t_order`.`order_status` AS `order_status`,`t_product`.`seller_id` AS `seller_id` from ((`t_order` join `t_product` on((`t_product`.`product_id` = `t_order`.`product_id`))) join `t_user` on((`t_user`.`user_id` = `t_order`.`customer_id`)));

#
# Source for view "t_view_product"
#

DROP VIEW IF EXISTS `t_view_product`;
CREATE VIEW `t_view_product` AS 
  select `t_product`.`product_id` AS `product_id`,`t_product`.`type_id` AS `type_id`,`t_product`.`seller_id` AS `seller_id`,`t_product`.`product_status` AS `product_status`,`t_product`.`end_date_time` AS `end_date_time`,`t_product`.`name` AS `name`,`t_product`.`imgsrc` AS `imgsrc`,`t_product`.`describe` AS `dscr`,`t_product`.`price` AS `price`,`t_product`.`update_date` AS `update_date`,`t_product`.`original_price` AS `original_price`,`t_city`.`city` AS `city`,`t_city`.`city_id` AS `city_id` from ((`t_product` join `t_seller` on((`t_product`.`seller_id` = `t_seller`.`user_id`))) join `t_city` on((`t_seller`.`city_id` = `t_city`.`city_id`))) order by `t_product`.`update_date` desc;

#
# Source for view "t_view_product_eva"
#

DROP VIEW IF EXISTS `t_view_product_eva`;
CREATE VIEW `t_view_product_eva` AS 
  select `t_product_evaluation`.`product_eva_id` AS `product_eva_id`,`t_user`.`username` AS `user_name`,`t_product_evaluation`.`score_product` AS `score_product`,`t_product_evaluation`.`eva_content` AS `eva_content`,`t_product_evaluation`.`datetime` AS `datetime` from (`t_product_evaluation` join `t_user` on((`t_user`.`user_id` = `t_product_evaluation`.`customer_id`)));

#
# Source for view "t_view_recommernd"
#

DROP VIEW IF EXISTS `t_view_recommernd`;
CREATE VIEW `t_view_recommernd` AS 
  select `t_recommend_product`.`product_id` AS `product_id`,`t_product`.`name` AS `name`,`t_product`.`imgsrc` AS `imgsrc`,`t_product`.`describe` AS `dscr`,`t_product`.`price` AS `price`,`t_city`.`city` AS `city` from (((`t_recommend_product` join `t_product` on((`t_recommend_product`.`product_id` = `t_product`.`product_id`))) join `t_seller` on((`t_product`.`seller_id` = `t_seller`.`user_id`))) join `t_city` on((`t_seller`.`city_id` = `t_city`.`city_id`)));

#
# Source for view "t_view_seller"
#

DROP VIEW IF EXISTS `t_view_seller`;
CREATE VIEW `t_view_seller` AS 
  select `t_seller`.`user_id` AS `user_id`,`t_seller`.`city_id` AS `city_id`,`t_seller`.`zone_id` AS `zone_id`,`t_seller`.`type_id` AS `type_id`,`t_seller`.`description` AS `description`,`t_seller`.`position` AS `position`,`t_seller`.`img` AS `img`,`t_product_type`.`type_name` AS `type_name`,`t_product_type`.`father_id` AS `father_id`,`t_city`.`city` AS `city`,`t_city_zone`.`zone_name` AS `zone_name`,`t_user`.`password` AS `password`,`t_user`.`username` AS `username`,`t_user`.`role` AS `role` from ((((`t_seller` left join `t_product_type` on((`t_seller`.`type_id` = `t_product_type`.`type_id`))) left join `t_city` on((`t_seller`.`city_id` = `t_city`.`city_id`))) left join `t_city_zone` on(((`t_seller`.`city_id` = `t_city_zone`.`city_id`) and (`t_seller`.`zone_id` = `t_city_zone`.`zone_id`)))) left join `t_user` on((`t_seller`.`user_id` = `t_user`.`user_id`))) where (`t_user`.`role` = 'SELLER');

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

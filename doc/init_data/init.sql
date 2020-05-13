/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 8.0.12 : Database - instantplay
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Data for the table `admin_user` */

insert  into `admin_user`(`id`,`uname`,`ps`,`nickname`,`a_time`,`role_id`,`mobile`) values (1,'mqzhifu','ccaab4e10f59bb6eb95e197c98bb0be1','xiaoz',1588854425,1,NULL),(2,'admin','0abfb6664c312406b7d575178ab2401f','admin',1588854425,1,NULL);

/*Data for the table `agent` */

insert  into `agent`(`id`,`title`,`id_card_num`,`real_name`,`status`,`type`,`address`,`province_code`,`city_code`,`county_code`,`towns_code`,`villages`,`sex`,`pic`,`mobile`,`u_time`,`a_time`,`audit_admin_id`,`audit_time`,`fee_percent`) values (1,'A铺子','152123','王小z',1,1,'财政旧楼',150000,150700,150722,'150722100','莫旗',1,'20200503181859_5541.png','13522536459',1589078283,1589078283,1,1589078283,10);

/*Data for the table `factory` */

insert  into `factory`(`id`,`title`,`category`,`real_name`,`id_card_num`,`a_time`,`status`,`mobile`,`sex`) values (1,'北京中宇华彩展览展示有限公司','代货平台','郝','152123',1588931241,2,'135xxxx4444',1);

/*Data for the table `menu` */

insert  into `menu`(`id`,`pid`,`name`,`ctrl`,`ac`,`dir_name`,`icon`,`is_show`,`sort`) values (1,0,'厂商','','','factory','fa-user',0,4),(2,0,'人群','','','people','fa-gamepad',1,3),(3,0,'产品/商品','','','product','fa-phone-square',1,2),(4,0,'财务','','','finance','fa-database',1,1),(5,0,'系统','','','system','fa-copy',1,0),(6,0,'统计','','','index','fa-sitemap',1,6),(7,0,'代理','','','','fa-user-md',0,0),(8,0,'t','','','','fa-android',0,0),(9,0,'t','','','','fa-pencil-square-o',0,0),(10,0,'t','','','','fa-calendar',0,0),(11,0,'t','','','','fa-envelope',0,0),(12,0,'t','','','','fa-gear',0,0),(13,1,'订单','order','index','','',1,0),(14,1,'提现','withdraw','index','','',1,0),(15,1,'产品','product','index','','',0,0),(16,1,'商品','goods','index','','',0,0),(17,2,'用户','user','index','','',1,0),(18,2,'一级代理','agent','index','','',1,0),(19,2,'二级代理','agent','index','','',1,0),(20,2,'合伙人','agent','index','','',0,0),(21,2,'厂商','factory','index','','',1,0),(22,4,'提现','withdraw','index','','',1,0),(23,6,'汇总','index','index','','',1,0),(25,5,'后台日志','logAdmin','index','','',1,0),(26,5,'菜单','menu','index','','',0,0),(27,5,'角色','role','index','','',1,1),(28,5,'权限/菜单','power','index','','',1,5),(29,5,'验证码','verifiercode','index','','',1,0),(30,3,'产品','product','index','','',1,0),(31,3,'商品','goods','index','','',1,0),(32,3,'首页轮播','banner','index','','',1,0),(33,2,'用户点赞','userProductLiked','index','','',1,0),(34,5,'黑词','blackWord','index','','',1,0),(176,4,'订单','order','index',NULL,'',1,0),(175,5,'短信模板','smsRule','index',NULL,'',1,0),(174,3,'产品分类属性参数','categoryAttrPara','index',NULL,'',1,0),(173,3,'产品分类属性','categoryAttr','index',NULL,'',1,0),(172,3,'产品分类','category','index',NULL,'',1,0),(171,2,'站内信','msg','index',NULL,'',1,0),(170,2,'用户收藏','collect','index',NULL,'',1,0),(169,2,'用户反馈','feedback','index',NULL,'',1,0),(168,5,'图片','image','index',NULL,'',1,0),(167,7,'合伙人','','','','',0,0),(166,2,'用户日志','userLog','index','','',1,0),(165,2,'用户评论','userComment','index','','',1,0),(164,5,'数据库','db','index','','',1,0),(36,5,'大学','university','index','','',1,0),(35,5,'地区','area','index','','',1,0);

/*Data for the table `product_category` */

insert  into `product_category`(`id`,`name`) values (1,'服装'),(2,'化妆品'),(3,'家纺'),(4,'食品'),(5,'生鲜'),(6,'日用百货'),(7,'工艺礼品'),(8,'1688抓取');

/*Data for the table `product_category_attr` */

insert  into `product_category_attr`(`id`,`name`,`pc_id`,`is_no`) values (1,'空属性',1,1),(2,'空属性',2,1),(3,'空属性',3,1),(4,'空属性',4,1),(5,'空属性',5,1),(6,'空属性',6,1),(7,'空属性',7,1),(8,'颜色',1,2),(9,'尺寸',1,2),(10,'款式',1,2),(12,'净含量',2,2),(11,'号码',1,2),(13,'颜色',2,2),(14,'片数',2,2),(15,'版本',2,2),(16,'组合套装',2,2),(17,'床尺寸',3,2),(18,'颜色',3,2),(19,'规格',3,2),(20,'尺寸',3,2),(21,'口味',4,2),(22,'版本',4,2),(23,'颜色',4,2),(24,'净含量',4,2),(25,'版本',5,2),(26,'净含量',5,2),(27,'口味',5,2),(28,'规格',5,2),(29,'重量',5,2),(30,'版本',5,2),(31,'个数',5,2),(32,'颜色',6,2),(33,'颜色',7,2),(34,'版本',7,2),(35,'尺寸',7,2),(36,'制作工艺',7,2),(37,'空属性',8,1);

/*Data for the table `product_category_attr_para` */

insert  into `product_category_attr_para`(`id`,`pca_id`,`name`,`img`) values (1,8,'黑色',NULL),(2,8,'绿色',NULL),(3,8,'黄色',NULL),(4,8,'蓝色',NULL),(5,9,'M',NULL),(6,9,'L',NULL),(7,9,'S',NULL),(8,9,'XL',NULL),(9,9,'XXL',NULL),(10,12,'220ml',NULL),(11,12,'300ml',NULL),(12,4,'1.2床',NULL),(13,4,'1.5床',NULL),(14,4,'1.8床',NULL),(15,5,'200g',NULL),(16,5,'400g',NULL),(17,6,'1',NULL),(18,6,'10',NULL),(19,7,'5',NULL),(20,7,'8',NULL),(21,8,'小号',NULL),(22,8,'中型',NULL),(25,10,'春秋款',NULL),(26,10,'运动款',NULL),(27,12,'400ml',NULL),(28,11,'38',NULL),(29,11,'39',NULL),(30,11,'40',NULL),(31,11,'41',NULL),(32,11,'42',NULL),(33,11,'43',NULL),(34,11,'44',NULL),(35,13,'黑',NULL),(36,13,'黄',NULL),(37,13,'蓝',NULL),(38,13,'绿',NULL),(39,13,'紫',NULL),(40,14,'5',NULL),(41,14,'10',NULL),(42,14,'50',NULL),(43,15,'版本1',NULL),(44,15,'版本2',NULL),(45,16,'A+B',NULL),(46,16,'A+C',NULL),(47,17,'1.2米',NULL),(48,17,'1.5米',NULL),(49,17,'1.8米',NULL),(50,17,'2米',NULL),(51,18,'黄',NULL),(52,18,'绿',NULL),(53,19,'规格1',NULL),(54,19,'规格2',NULL),(55,20,'2x2米',NULL),(56,20,'4x4米',NULL),(57,21,'酸',NULL),(58,21,'甜',NULL),(59,21,'苦',NULL),(60,21,'辣',NULL),(61,21,'酸爽',NULL),(62,22,'版本1',NULL),(63,22,'版本2',NULL),(64,23,'棕色',NULL),(65,23,'咖啡',NULL),(66,23,'宝石蓝',NULL),(67,24,'300g',NULL),(68,24,'500g',NULL),(69,24,'1000g',NULL),(70,25,'版本1',NULL),(71,25,'版本2',NULL),(72,26,'1KG',NULL),(73,26,'2KG',NULL),(74,26,'10KG',NULL),(75,27,'辛辣',NULL),(76,28,'混搭',NULL),(77,28,'规格1',NULL),(78,28,'规格2',NULL),(79,29,'1cm',NULL),(80,29,'10cm',NULL),(81,29,'100cm',NULL),(82,30,'版本1',NULL),(83,30,'版本2',NULL),(84,31,'10',NULL),(85,31,'300',NULL),(86,31,'500',NULL),(87,32,'永恒绿',NULL),(88,32,'自然白',NULL),(89,33,'中国红',NULL),(90,33,'幻夜黑',NULL),(91,33,'极光',NULL),(92,33,'罗兰紫',NULL),(93,33,'珍珠白',NULL),(94,34,'版本1',NULL),(95,34,'版本2',NULL),(96,35,'尺寸1',NULL),(97,35,'尺寸2',NULL),(98,36,'铜',NULL),(99,36,'钢',NULL),(100,36,'铁',NULL);

/*Data for the table `roles` */

insert  into `roles`(`id`,`name`,`power`) values (1,'admin','all');

/*Data for the table `sms_rule` */

insert  into `sms_rule`(`id`,`title`,`content`,`type`,`day_times`,`period`,`period_times`,`third_id`) values (1,'登陆','验证码为：#code# 用于登录/注册开心小游戏，5分钟后失效，如非本人操作请忽略',1,10,60,1,294664),(2,'绑定','验证码为：#code# 用于绑定开心小游戏，5分钟后失效， 如非本人操作请忽略',1,10,60,1,302720),(3,'注册','您的验证码为#code#',1,10,60,1,294664),(4,'找回密码','您的验证码为#code#',1,10,60,1,303613),(5,'报警','#errInfo#',2,NULL,NULL,NULL,NULL),(6,'设置密码','验证码为：#code#  用于设置开心小游戏登录密码，5分钟后失效，如非本人操作请忽略',1,10,60,1,302723),(7,'PC端登陆','您的验证码为#code#',1,10,60,1,303614),(8,'实名认证','验证码为：#code# 用于认证开心小游戏，5分钟后失效，如非本人操作请忽略',1,10,60,1,302727);

/*Data for the table `user` */

insert  into `user`(`id`,`uname`,`nickname`,`sex`,`realname`,`mobile`,`email`,`birthday`,`a_time`,`avatar`,`type`,`experience`,`point`,`coin`,`third_uid`,`consume_total`,`order_num`,`status`,`province_code`,`city_code`,`county_code`,`town_code`,`id_card_num`) values (1,'system','系统管理员',2,'xiaoz','13000000000','78878296@qq.com',1589078283,1589078283,'0',3,0,0,0,'0',0,0,1,0,0,0,0,'');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

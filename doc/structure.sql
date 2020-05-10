-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: instantplay
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin_log`
--

DROP TABLE IF EXISTS `admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cate` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '多级菜单，分类',
  `sub` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '多级菜单，子分类',
  `ctrl` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '控制器',
  `ac` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '方法',
  `a_time` int(11) DEFAULT NULL COMMENT '添加时间',
  `ip` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'IP地址',
  `request` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '请求参数',
  `admin_uid` int(11) DEFAULT NULL COMMENT '管理员ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='后台管理员操作日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `admin_user`
--

DROP TABLE IF EXISTS `admin_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `admin_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varbinary(50) DEFAULT NULL COMMENT '姓名',
  `ps` varbinary(50) DEFAULT NULL COMMENT '密码',
  `nickname` varbinary(50) DEFAULT NULL COMMENT '昵称',
  `a_time` int(11) DEFAULT NULL COMMENT '添加时间',
  `role_id` int(11) DEFAULT NULL COMMENT '角色',
  `mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '手机号',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='管理员';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `agent`
--

DROP TABLE IF EXISTS `agent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `agent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '店面名称',
  `id_card_num` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '身份证码',
  `real_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '真实姓名',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1未审批2已通过3拒绝',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1一级代理2二级代理',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '详细地址',
  `province_id` int(11) NOT NULL DEFAULT '0' COMMENT '省',
  `city_id` int(11) NOT NULL DEFAULT '0' COMMENT '市',
  `county_id` int(11) NOT NULL DEFAULT '0' COMMENT '县',
  `towns_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '乡镇',
  `villages` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '村',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1男2女',
  `pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '店面照片',
  `mobile` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机号',
  `u_time` int(11) NOT NULL DEFAULT '0',
  `a_time` int(11) NOT NULL DEFAULT '0',
  `audit_admin_id` int(11) NOT NULL DEFAULT '0' COMMENT '审核人',
  `audit_time` int(11) NOT NULL DEFAULT '0' COMMENT '审核通过时间',
  `fee_percent` int(11) NOT NULL DEFAULT '0' COMMENT '佣金比例',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='代理人员';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `area_city`
--

DROP TABLE IF EXISTS `area_city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `area_city` (
  `city_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增列',
  `city_code` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '市代码',
  `city_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '市名称',
  `short_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '简称',
  `province_code` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '省代码',
  `lng` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '经度',
  `lat` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '纬度',
  `sort` int(6) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`city_id`),
  KEY `Index_1` (`city_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='城市设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `area_county`
--

DROP TABLE IF EXISTS `area_county`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `area_county` (
  `area_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增列',
  `area_code` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '区代码',
  `city_code` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '父级市代码',
  `area_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '市名称',
  `short_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '简称',
  `lng` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '经度',
  `lat` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '纬度',
  `sort` int(6) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`area_id`),
  KEY `Index_1` (`area_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='地区设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `area_province`
--

DROP TABLE IF EXISTS `area_province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `area_province` (
  `prvince_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增列',
  `province_code` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '省份代码',
  `province_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '省份名称',
  `short_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '简称',
  `lng` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '经度',
  `lat` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '纬度',
  `sort` int(6) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`prvince_id`),
  KEY `Index_1` (`province_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='省份设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `area_street`
--

DROP TABLE IF EXISTS `area_street`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `area_street` (
  `street_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增列',
  `street_code` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '街道代码',
  `area_code` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '父级区代码',
  `street_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '街道名称',
  `short_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '简称',
  `lng` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '经度',
  `lat` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '纬度',
  `sort` int(6) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`street_id`),
  KEY `Index_1` (`street_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='街道设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `banner`
--

DROP TABLE IF EXISTS `banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) DEFAULT NULL COMMENT '1产品跳转',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '标题',
  `pid` int(11) DEFAULT NULL COMMENT '推荐的产品',
  `pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图片地址',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='首页-轮播图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `black_word`
--

DROP TABLE IF EXISTS `black_word`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `black_word` (
  `id` int(11) NOT NULL COMMENT 'ID',
  `name` char(100) DEFAULT NULL COMMENT '名称',
  `type` tinyint(1) DEFAULT NULL COMMENT '类型',
  `sub_type` tinyint(1) DEFAULT NULL COMMENT '二级类型'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='敏感词、过滤替换';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `factory`
--

DROP TABLE IF EXISTS `factory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `factory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '工厂名',
  `category` varchar(255) DEFAULT NULL COMMENT '主营产品',
  `real_name` varchar(255) DEFAULT NULL COMMENT '法人真实姓名',
  `id_card_num` varchar(20) DEFAULT NULL COMMENT '身份证号',
  `a_time` int(11) DEFAULT NULL COMMENT '注册时间',
  `status` tinyint(1) DEFAULT NULL COMMENT '1等待审核2已通过3拒绝',
  `mobile` varchar(15) DEFAULT NULL COMMENT '手机号',
  `sex` tinyint(1) DEFAULT NULL COMMENT '1男2女',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='厂商';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `goods`
--

DROP TABLE IF EXISTS `goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL COMMENT '产品ID',
  `type` tinyint(4) NOT NULL COMMENT '类型,预留',
  `status` tinyint(4) NOT NULL COMMENT '状态1已上架2已下架',
  `a_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `u_time` int(11) NOT NULL DEFAULT '0' COMMENT '最后更新时间',
  `product_attr_ids` varchar(255) NOT NULL COMMENT 'SKU属性',
  `third_id` varchar(100) NOT NULL COMMENT '3方ID,可获取详细信息',
  `stock` int(11) NOT NULL DEFAULT '0' COMMENT '库存数，-1忽略',
  `is_del` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1未删除2已删除',
  `sale_price` int(11) NOT NULL DEFAULT '0' COMMENT '销售价格-单位-分',
  `original_price` int(11) NOT NULL DEFAULT '0' COMMENT '原价-分',
  `use_max_point` tinyint(4) NOT NULL DEFAULT '0' COMMENT '可使用最多积分0关闭',
  `pay_type` varchar(50) NOT NULL COMMENT '支付类型1微信2支付宝',
  `use_max_coin` int(11) DEFAULT '0' COMMENT '可使用最多金币数0关闭',
  `use_coupon_types` tinyint(4) DEFAULT '0' COMMENT '可以使用优惠卷种类0关闭',
  `order_price_zero` tinyint(4) DEFAULT '0' COMMENT '0忽略1可以2不可以',
  `admin_id` int(11) DEFAULT '0' COMMENT '添加者ID',
  `source` tinyint(1) DEFAULT NULL COMMENT '来源',
  `is_search` tinyint(4) DEFAULT NULL COMMENT '支持搜索引擎收录',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `haulage` int(11) NOT NULL DEFAULT '0' COMMENT '运费',
  `order_total` int(11) NOT NULL DEFAULT '0' COMMENT '用户购买订单数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `id_num`
--

DROP TABLE IF EXISTS `id_num`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `id_num` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `addr` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '归属地-市',
  `number` int(6) NOT NULL COMMENT '号码段',
  `s` tinyint(1) NOT NULL DEFAULT '0',
  `str` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '归属地-县',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='身份证-号码段-归属地';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `index_rotation`
--

DROP TABLE IF EXISTS `index_rotation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `index_rotation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pic_src` varchar(255) DEFAULT NULL,
  `location` tinyint(1) DEFAULT NULL COMMENT '位置',
  `link` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='首页轮播图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ip`
--

DROP TABLE IF EXISTS `ip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ip` (
  `StartIP` char(15) DEFAULT '',
  `EndIP` char(15) DEFAULT '',
  `Country` char(255) DEFAULT NULL,
  `Local` char(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ip';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(4) DEFAULT NULL COMMENT '父级ID',
  `name` varchar(50) DEFAULT NULL,
  `ctrl` varchar(50) DEFAULT NULL,
  `ac` varchar(50) DEFAULT NULL,
  `dir_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '有值代表，是>2级菜单',
  `icon` varchar(50) NOT NULL,
  `is_show` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否显示(1显示0不显示)',
  `sort` int(4) NOT NULL DEFAULT '0' COMMENT '菜单权重',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='后台-菜单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mobile`
--

DROP TABLE IF EXISTS `mobile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mobile` (
  `mid` int(8) NOT NULL AUTO_INCREMENT,
  `mnum` int(8) NOT NULL COMMENT '号码段',
  `mpla` varchar(200) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL COMMENT '归属地',
  PRIMARY KEY (`mid`),
  KEY `mnum` (`mnum`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk COMMENT='手机号码段归属地';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `msg`
--

DROP TABLE IF EXISTS `msg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `msg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_uid` int(11) DEFAULT NULL COMMENT '发送者用户',
  `to_uid` varchar(255) NOT NULL COMMENT '接收者uid',
  `title` varchar(200) DEFAULT NULL COMMENT '标题',
  `type` tinyint(2) DEFAULT NULL COMMENT '1 P2P,2 S2P',
  `content` text COMMENT '内容',
  `a_time` int(11) DEFAULT NULL COMMENT '添加时间',
  `to_del` tinyint(1) DEFAULT NULL COMMENT '接收者删除1是2否',
  `from_del` tinyint(1) DEFAULT NULL COMMENT '发送者删除1是2否',
  `is_read` tinyint(1) DEFAULT NULL COMMENT '接收者1已读2未读',
  `category` tinyint(1) DEFAULT NULL COMMENT '1关注的人普通送消息2陌生人消息3我关注别人4别人关注我5系统PUSH游戏动态6关注的人游戏邀请7我分享游戏邀请',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='站内信';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `no` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '归属产品ID',
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品ID',
  `price` int(11) NOT NULL DEFAULT '0' COMMENT '单位:分',
  `pay_type` tinyint(2) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1未支付2已支付3已发货4已签收5已退款',
  `uid` int(1) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `address_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户-收货地址ID',
  `express_no` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '快递单号',
  `agent_uid` int(11) NOT NULL DEFAULT '0' COMMENT '代理ID',
  `address_agent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '代理-收货地址',
  `a_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `pay_time` int(11) NOT NULL DEFAULT '0' COMMENT '支付时间',
  `agent_withdraw_money_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1未操作2已提取',
  `factory_withdraw_money_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1未操作2已提取',
  `num` int(11) NOT NULL DEFAULT '0' COMMENT '数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `subtitle` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '副标题',
  `desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '描述',
  `brand` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '品牌',
  `attribute` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品参数',
  `notice` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '购买须知',
  `category_id` int(11) NOT NULL DEFAULT '0' COMMENT '分类ID',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1下架2上架',
  `a_time` int(11) NOT NULL DEFAULT '0',
  `lables` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标签组',
  `is_search` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1不支持2支持',
  `admin_id` int(11) NOT NULL DEFAULT '0',
  `pv` int(11) NOT NULL DEFAULT '0',
  `uv` int(11) NOT NULL DEFAULT '0',
  `recommend` tinyint(1) NOT NULL DEFAULT '2' COMMENT '1是2否,推荐',
  `pic` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品描述图',
  `lowest_price` int(11) NOT NULL DEFAULT '0' COMMENT '取商品中最低的价格，单位:分',
  `factory_uid` int(11) NOT NULL DEFAULT '0' COMMENT '工厂Id',
  `desc_attr` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品描述的详细参数',
  `spider_source_type` tinyint(1) NOT NULL COMMENT '抓取来源1平台自己2:1688',
  `spider_source_pid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '抓取来源-产品ID',
  `sort` int(11) NOT NULL DEFAULT '1' COMMENT '排序',
  `category_attr_null` tinyint(4) NOT NULL DEFAULT '2' COMMENT '1是2否',
  `goods_total` int(11) NOT NULL DEFAULT '0' COMMENT '包含总商品数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='产品分类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product_category_attr`
--

DROP TABLE IF EXISTS `product_category_attr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product_category_attr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `pc_id` int(11) DEFAULT NULL COMMENT '产品类型ID',
  `is_no` tinyint(1) DEFAULT NULL COMMENT '空属性，特殊分类属性，1是2否',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='产品分类-型号';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product_category_attr_para`
--

DROP TABLE IF EXISTS `product_category_attr_para`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product_category_attr_para` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pca_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='一个产品分类属性值对应的参数';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product_lables`
--

DROP TABLE IF EXISTS `product_lables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product_lables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product_link_category_attr`
--

DROP TABLE IF EXISTS `product_link_category_attr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product_link_category_attr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `pca_id` int(11) DEFAULT NULL,
  `pc_id` int(11) DEFAULT NULL,
  `pcap_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='一个产品关联产品分类属性';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product_pic`
--

DROP TABLE IF EXISTS `product_pic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product_pic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_uid` int(11) DEFAULT NULL,
  `a_time` int(11) DEFAULT NULL,
  `src` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product_tb`
--

DROP TABLE IF EXISTS `product_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product_tb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `desc` text,
  `attr` text,
  `a_time` int(11) DEFAULT NULL,
  `data_config` text,
  `data_detail` text,
  `tb_link` varchar(255) DEFAULT NULL,
  `category_attr` varchar(255) DEFAULT NULL,
  `category_attr_para` text,
  `price` text,
  `box_img` text,
  `offerid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varbinary(50) DEFAULT NULL,
  `power` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='后台角色';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sms_rule`
--

DROP TABLE IF EXISTS `sms_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sms_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `content` varchar(255) DEFAULT NULL COMMENT '内容',
  `type` tinyint(1) DEFAULT NULL COMMENT '1正常2报警',
  `day_times` int(11) DEFAULT NULL COMMENT '一天最多发送次数',
  `period` int(11) DEFAULT NULL COMMENT '周期时间，秒',
  `period_times` int(11) DEFAULT NULL COMMENT '周期时间内，发送次数',
  `third_id` int(11) DEFAULT NULL COMMENT '3方模板ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='短信发送规则限制';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `university`
--

DROP TABLE IF EXISTS `university`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `university` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `no` varchar(20) DEFAULT NULL COMMENT '学校标识码',
  `dep` varchar(100) DEFAULT NULL COMMENT '主管部门',
  `type` varchar(50) DEFAULT NULL COMMENT '民办/中外合',
  `city` varchar(100) DEFAULT NULL COMMENT '所在城市',
  `name` varchar(255) DEFAULT NULL COMMENT '大学名称',
  `province` varchar(50) DEFAULT NULL COMMENT '所在省',
  `level` varchar(50) DEFAULT NULL COMMENT '专/本',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='全国-大学';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nickname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未知1男2女',
  `realname` varbinary(50) NOT NULL,
  `mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `birthday` int(11) NOT NULL,
  `a_time` int(11) NOT NULL DEFAULT '0',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1普通2一级代理2二级代理3合伙人',
  `experience` int(11) NOT NULL DEFAULT '0' COMMENT '经验值',
  `point` int(11) NOT NULL DEFAULT '0' COMMENT '积分',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '金币',
  `third_uid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_address`
--

DROP TABLE IF EXISTS `user_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country` int(11) DEFAULT NULL COMMENT '国家',
  `province` int(11) DEFAULT NULL COMMENT '省',
  `city` int(11) DEFAULT NULL COMMENT '市',
  `county` int(11) DEFAULT NULL COMMENT '县',
  `address` varchar(255) DEFAULT NULL COMMENT '详细地址',
  `is_default` tinyint(1) DEFAULT NULL COMMENT '默认0否1是',
  `uid` int(11) DEFAULT NULL COMMENT '用户ID',
  `cellphone` varchar(20) DEFAULT NULL COMMENT '手机号',
  `name` varchar(50) DEFAULT NULL COMMENT '收货人姓名',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_collection`
--

DROP TABLE IF EXISTS `user_collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_collection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `a_time` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_log`
--

DROP TABLE IF EXISTS `user_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `a_time` int(11) DEFAULT NULL,
  `ctrl` varchar(50) DEFAULT NULL,
  `ac` varchar(50) DEFAULT NULL,
  `request` text COMMENT '请求参数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户行为日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `verifier_code`
--

DROP TABLE IF EXISTS `verifier_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `verifier_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(6) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL COMMENT '1正常2已验证3失效',
  `a_time` int(11) DEFAULT NULL,
  `type` tinyint(1) DEFAULT NULL COMMENT '1手机2邮箱',
  `uid` int(11) DEFAULT NULL,
  `expire_time` int(11) DEFAULT NULL,
  `rule_id` tinyint(1) DEFAULT NULL COMMENT '1手机回密码2邮箱找回密码3绑定邮箱4绑定手机',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='短信/邮件，验证码';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `withdraw_money`
--

DROP TABLE IF EXISTS `withdraw_money`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `withdraw_money` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL COMMENT '1/2级代理用户ID',
  `price` int(11) DEFAULT NULL,
  `orders_ids` varchar(255) DEFAULT NULL,
  `a_time` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL COMMENT '1待审批1通过2拒绝',
  `memo` text COMMENT '备注',
  `type` tinyint(1) DEFAULT NULL COMMENT '1一级代理2二级代理3合伙人4厂商',
  `u_time` int(11) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL COMMENT '工厂ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='提现';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-10 17:03:10

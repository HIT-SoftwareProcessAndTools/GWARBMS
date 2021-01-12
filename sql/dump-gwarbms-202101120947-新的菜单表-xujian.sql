-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: gwarbms
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `t_menu`
--

DROP TABLE IF EXISTS `t_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_menu` (
  `MENU_ID` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单/按钮ID',
  `PARENT_ID` bigint NOT NULL COMMENT '上级菜单ID',
  `MENU_NAME` varchar(50) NOT NULL COMMENT '菜单/按钮名称',
  `URL` varchar(50) DEFAULT NULL COMMENT '菜单URL',
  `PERMS` text COMMENT '权限标识',
  `ICON` varchar(50) DEFAULT NULL COMMENT '图标',
  `TYPE` char(2) NOT NULL COMMENT '类型 0菜单 1按钮',
  `ORDER_NUM` bigint DEFAULT NULL COMMENT '排序',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`MENU_ID`) USING BTREE,
  KEY `t_menu_parent_id` (`PARENT_ID`),
  KEY `t_menu_menu_id` (`MENU_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=234 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='菜单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_menu`
--

LOCK TABLES `t_menu` WRITE;
/*!40000 ALTER TABLE `t_menu` DISABLE KEYS */;
INSERT INTO `t_menu` VALUES (1,0,'系统管理','','','layui-icon-setting','0',3,'2017-12-27 16:39:07','2020-11-30 18:42:34'),(3,1,'用户管理','/system/user','user:view','','0',1,'2017-12-27 16:47:13','2019-12-04 16:46:50'),(4,1,'角色管理','/system/role','role:view','','0',2,'2017-12-27 16:48:09','2019-06-13 08:57:19'),(5,1,'菜单管理','/system/menu','menu:view','','0',3,'2017-12-27 16:48:57','2019-06-13 08:57:34'),(6,1,'部门管理','/system/dept','dept:view','','0',4,'2017-12-27 16:57:33','2019-06-14 19:56:00'),(8,0,'在线用户','/monitor/online','online:view','layui-icon-alert','0',4,'2017-12-27 16:59:33','2020-12-05 13:21:00'),(11,3,'新增用户',NULL,'user:add',NULL,'1',NULL,'2017-12-27 17:02:58',NULL),(12,3,'修改用户',NULL,'user:update',NULL,'1',NULL,'2017-12-27 17:04:07',NULL),(13,3,'删除用户',NULL,'user:delete',NULL,'1',NULL,'2017-12-27 17:04:58',NULL),(14,4,'新增角色',NULL,'role:add',NULL,'1',NULL,'2017-12-27 17:06:38',NULL),(15,4,'修改角色',NULL,'role:update',NULL,'1',NULL,'2017-12-27 17:06:38',NULL),(16,4,'删除角色',NULL,'role:delete',NULL,'1',NULL,'2017-12-27 17:06:38',NULL),(17,5,'新增菜单',NULL,'menu:add',NULL,'1',NULL,'2017-12-27 17:08:02',NULL),(18,5,'修改菜单',NULL,'menu:update',NULL,'1',NULL,'2017-12-27 17:08:02',NULL),(19,5,'删除菜单',NULL,'menu:delete',NULL,'1',NULL,'2017-12-27 17:08:02',NULL),(20,6,'新增部门',NULL,'dept:add',NULL,'1',NULL,'2017-12-27 17:09:24',NULL),(21,6,'修改部门',NULL,'dept:update',NULL,'1',NULL,'2017-12-27 17:09:24',NULL),(22,6,'删除部门',NULL,'dept:delete',NULL,'1',NULL,'2017-12-27 17:09:24',NULL),(23,8,'踢出用户',NULL,'user:kickout',NULL,'1',NULL,'2017-12-27 17:11:13',NULL),(160,3,'密码重置',NULL,'user:password:reset',NULL,'1',NULL,'2019-06-13 08:40:13',NULL),(161,3,'导出Excel',NULL,'user:export',NULL,'1',NULL,'2019-06-13 08:40:34',NULL),(162,4,'导出Excel',NULL,'role:export',NULL,'1',NULL,'2019-06-13 14:29:00','2019-06-13 14:29:11'),(163,5,'导出Excel',NULL,'menu:export',NULL,'1',NULL,'2019-06-13 14:29:32',NULL),(164,6,'导出Excel',NULL,'dept:export',NULL,'1',NULL,'2019-06-13 14:29:59',NULL),(197,0,'订单管理','','order:view','layui-icon-filedone','0',0,'2020-07-29 14:02:14','2020-12-04 22:48:21'),(198,204,'新增订单',NULL,'orders:create',NULL,'1',NULL,'2020-07-29 14:02:35','2020-12-05 00:11:24'),(199,204,'提交订单',NULL,'orders:submit',NULL,'1',NULL,'2020-07-29 14:04:17','2020-12-04 23:47:02'),(200,204,'审批订单',NULL,'orders:audit',NULL,'1',NULL,'2020-07-29 14:04:43',NULL),(201,204,'完成收款',NULL,'orders:pay',NULL,'1',NULL,'2020-07-29 14:05:10',NULL),(203,197,'零售订单','/system/order','order:view','','0',1,'2020-07-29 14:06:48','2020-12-06 10:10:23'),(204,197,'批发订单','/system/order/wholesale','orders:view','','0',2,'2020-07-29 14:07:38','2020-11-30 20:06:37'),(205,0,'货品管理','/system/goods','goods:view','layui-icon-gift','0',2,'2020-07-29 14:09:46','2020-11-30 18:42:19'),(206,205,'新增货品',NULL,'goods:create',NULL,'1',NULL,'2020-07-29 14:10:49','2020-11-26 10:14:03'),(207,205,'修改货品',NULL,'goods:update',NULL,'1',NULL,'2020-07-29 14:11:20','2020-11-30 19:43:25'),(210,205,'删除货品','','goods:delete','','1',NULL,'2020-07-29 17:01:49','2020-11-30 19:43:12'),(212,0,'客户管理','/system/customer/','customer:view','layui-icon-team','0',1,'2020-07-29 22:37:50','2020-11-30 18:42:12'),(213,212,'新增客户',NULL,'customer:create',NULL,'1',NULL,'2020-07-29 22:38:45',NULL),(214,212,'修改客户',NULL,'customer:update',NULL,'1',NULL,'2020-07-29 22:39:20','2020-07-29 23:57:52'),(215,212,'删除客户',NULL,'customer:delete',NULL,'1',NULL,'2020-07-29 22:40:16',NULL),(218,0,'仓库管理','','storage:view','layui-icon-home','0',NULL,'2020-12-04 22:32:20',NULL),(219,218,'仓库总览','/system/storage','storage:view','','0',0,'2020-12-04 22:33:54',NULL),(220,219,'新增仓库',NULL,'storage:create',NULL,'1',NULL,'2020-12-04 22:35:52','2020-12-04 22:37:43'),(221,219,'修改仓库',NULL,'storage:update',NULL,'1',NULL,'2020-12-04 22:36:24','2020-12-04 22:37:51'),(222,219,'删除仓库',NULL,'storage:delete',NULL,'1',NULL,'2020-12-04 22:37:07',NULL),(223,218,'库存记录','/system/record','record:view','','0',1,'2020-12-04 22:40:48',NULL),(224,223,'新货入库',NULL,'record:create',NULL,'1',NULL,'2020-12-04 22:42:16',NULL),(225,223,'货品出库',NULL,'record:out',NULL,'1',NULL,'2020-12-04 22:43:27',NULL),(226,223,'已有货品入库',NULL,'record:update',NULL,'1',NULL,'2020-12-04 22:44:39',NULL),(227,223,'货品转移',NULL,'record:trans',NULL,'1',NULL,'2020-12-04 22:45:04',NULL),(228,204,'修改订单',NULL,'orders:update',NULL,'1',NULL,'2020-12-05 00:00:26',NULL),(229,204,'删除订单',NULL,'orders:delete',NULL,'1',NULL,'2020-12-05 00:01:25',NULL),(230,203,'新增订单',NULL,'order:retail',NULL,'1',NULL,'2020-12-06 10:08:57',NULL),(231,204,'订单退货',NULL,'orders:return',NULL,'1',NULL,'2020-12-11 13:50:26',NULL),(232,204,'单期收款',NULL,'orders:payone',NULL,'1',NULL,'2020-12-11 13:50:51',NULL),(233,212,'设定积分规则',NULL,'customer:pointsRule',NULL,'1',NULL,'2021-01-11 23:05:59',NULL);
/*!40000 ALTER TABLE `t_menu` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-12  9:47:56

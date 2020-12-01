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
-- Table structure for table `t_order_retail`
--

DROP TABLE IF EXISTS `t_order_retail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_order_retail` (
  `order_id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '零售单号',
  `customer_name` varchar(100) NOT NULL COMMENT '客户姓名',
  `customer_phone` varchar(100) NOT NULL COMMENT '客户电话',
  `order_price` double NOT NULL COMMENT '零售单价格',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_order_retail`
--

LOCK TABLES `t_order_retail` WRITE;
/*!40000 ALTER TABLE `t_order_retail` DISABLE KEYS */;
INSERT INTO `t_order_retail` VALUES (1,'xx','11111111111',11,'2020-12-01 20:33:44');
/*!40000 ALTER TABLE `t_order_retail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_retail_goods`
--

DROP TABLE IF EXISTS `t_retail_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_retail_goods` (
  `order_id` bigint unsigned NOT NULL COMMENT '零售单号',
  `goods_id` bigint unsigned NOT NULL COMMENT '商品编号',
  KEY `t_retail_goods_goods_id` (`goods_id`) USING BTREE,
  KEY `t_retail_goods_order_id` (`order_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_retail_goods`
--

LOCK TABLES `t_retail_goods` WRITE;
/*!40000 ALTER TABLE `t_retail_goods` DISABLE KEYS */;
INSERT INTO `t_retail_goods` VALUES (1,2),(1,2),(1,2);
/*!40000 ALTER TABLE `t_retail_goods` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-01 23:15:54

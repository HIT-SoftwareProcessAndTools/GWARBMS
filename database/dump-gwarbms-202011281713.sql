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
-- Table structure for table `ordertable`
--

DROP TABLE IF EXISTS `ordertable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordertable` (
  `ORDER_ID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `SALES_ID` bigint unsigned DEFAULT NULL,
  `CUSTOMER_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `CUSTOMER_PHONE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `VEHICLE_ID` bigint unsigned DEFAULT NULL,
  `PRICE` bigint unsigned DEFAULT NULL,
  `STATUS` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`ORDER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordertable`
--

LOCK TABLES `ordertable` WRITE;
/*!40000 ALTER TABLE `ordertable` DISABLE KEYS */;
INSERT INTO `ordertable` VALUES (1,'2020-07-27 12:00:00.0',8,'zhangsan','15034659998',52,120000,'æªå®¡æ ¸'),(2,'2020-07-27 14:31:09.09',1,'lisi','12345678911',11,202222,'å·²å®¡æ ¸'),(3,'2020-07-27 14:34:05.596',2,'wangwu','12379845632',22,3333333,'å·²ä»æ¬¾'),(4,'2020-07-27 14:46:48.76',3,'xxx','12345679811',22,200000,'å·²äº¤ä»'),(5,'2020-07-27 14:50:00.442',211,'sss','12345678955',11,200000,'å·²å½æ¡£'),(6,'2020-07-27 15:32:05.114',22,'qwer','12230000222',33,666666,'å¾å®¡æ ¸'),(7,'2020-07-27 16:51:21.797',7,'fff','15022223333',12,250000,'å·²å®¡æ ¸'),(8,'2020-07-28 10:37:09.805',15,'aaaaa','15533336666',88,150000,'å·²å½æ¡£'),(9,'2020-07-28 14:15:45.125',11,'22','12300000000',11,200000,'å·²å®¡æ ¸'),(10,'2020-07-28 19:19:26.75',4,'oppo','15233002255',11,200000,'å·²å½æ¡£'),(11,'2020-07-28 20:22:24.597',5,'aann','15236589562',11,20000,'å¾å®¡æ ¸'),(12,'2020-07-28 20:24:38.948',22,'aasds','15165322156',33,200000,'å¾å®¡æ ¸');
/*!40000 ALTER TABLE `ordertable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_blob_triggers`
--

DROP TABLE IF EXISTS `qrtz_blob_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_blob_triggers`
--

LOCK TABLES `qrtz_blob_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_blob_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_blob_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_calendars`
--

DROP TABLE IF EXISTS `qrtz_calendars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_calendars`
--

LOCK TABLES `qrtz_calendars` WRITE;
/*!40000 ALTER TABLE `qrtz_calendars` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_calendars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_cron_triggers`
--

DROP TABLE IF EXISTS `qrtz_cron_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(200) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_cron_triggers`
--

LOCK TABLES `qrtz_cron_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_cron_triggers` DISABLE KEYS */;
INSERT INTO `qrtz_cron_triggers` VALUES ('FEBS_Scheduler','TASK_1','DEFAULT','0/1 * * * * ?','Asia/Shanghai'),('FEBS_Scheduler','TASK_11','DEFAULT','0/5 * * * * ?','Asia/Shanghai'),('FEBS_Scheduler','TASK_2','DEFAULT','0/10 * * * * ?','Asia/Shanghai'),('FEBS_Scheduler','TASK_3','DEFAULT','0/1 * * * * ?','Asia/Shanghai'),('GWARBMS_Scheduler','TASK_1','DEFAULT','0/1 * * * * ?','Asia/Shanghai'),('GWARBMS_Scheduler','TASK_11','DEFAULT','0/5 * * * * ?','Asia/Shanghai'),('GWARBMS_Scheduler','TASK_2','DEFAULT','0/10 * * * * ?','Asia/Shanghai'),('GWARBMS_Scheduler','TASK_3','DEFAULT','0/1 * * * * ?','Asia/Shanghai');
/*!40000 ALTER TABLE `qrtz_cron_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_fired_triggers`
--

DROP TABLE IF EXISTS `qrtz_fired_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint NOT NULL,
  `SCHED_TIME` bigint NOT NULL,
  `PRIORITY` int NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_fired_triggers`
--

LOCK TABLES `qrtz_fired_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_fired_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_fired_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_job_details`
--

DROP TABLE IF EXISTS `qrtz_job_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_job_details`
--

LOCK TABLES `qrtz_job_details` WRITE;
/*!40000 ALTER TABLE `qrtz_job_details` DISABLE KEYS */;
INSERT INTO `qrtz_job_details` VALUES ('FEBS_Scheduler','TASK_1','DEFAULT',NULL,'cc.mrbird.febs.job.util.ScheduleJob','0','0','0','0',_binary '¬\í\0sr\0org.quartz.JobDataMap°è¿©°\Ë\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap\è\Ãû\Å](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap\æ.­(v\n\Î\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\rJOB_PARAM_KEYsr\0cc.mrbird.febs.job.entity.JobR¬£\0L\0beanNamet\0Ljava/lang/String;L\0\ncreateTimet\0Ljava/util/Date;L\0cronExpressionq\0~\0	L\0jobIdt\0Ljava/lang/Long;L\0\nmethodNameq\0~\0	L\0paramsq\0~\0	L\0remarkq\0~\0	L\0statusq\0~\0	xpt\0testTasksr\0java.util.DatehjKYt\0\0xpw\0\0a\Æ\ëppxt\0\r0/1 * * * * ?sr\0java.lang.Long;\äÌ#\ß\0J\0valuexr\0java.lang.Number¬\à\0\0xp\0\0\0\0\0\0\0t\0testt\0mrbirdt\0\Zæåä»»å¡è°åº¦æµè¯~~t\01x\0'),('FEBS_Scheduler','TASK_11','DEFAULT',NULL,'cc.mrbird.febs.job.util.ScheduleJob','0','0','0','0',_binary '¬\í\0sr\0org.quartz.JobDataMap°è¿©°\Ë\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap\è\Ãû\Å](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap\æ.­(v\n\Î\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\rJOB_PARAM_KEYsr\0cc.mrbird.febs.job.entity.JobR¬£\0L\0beanNamet\0Ljava/lang/String;L\0\ncreateTimet\0Ljava/util/Date;L\0cronExpressionq\0~\0	L\0jobIdt\0Ljava/lang/Long;L\0\nmethodNameq\0~\0	L\0paramsq\0~\0	L\0remarkq\0~\0	L\0statusq\0~\0	xpt\0testTasksr\0java.util.DatehjKYt\0\0xpw\0\0a\Ð¬Pxt\0\r0/5 * * * * ?sr\0java.lang.Long;\äÌ#\ß\0J\0valuexr\0java.lang.Number¬\à\0\0xp\0\0\0\0\0\0\0t\0test2pt\0æµè¯å¼å¸¸t\01x\0'),('FEBS_Scheduler','TASK_2','DEFAULT',NULL,'cc.mrbird.febs.job.util.ScheduleJob','0','0','0','0',_binary '¬\í\0sr\0org.quartz.JobDataMap°è¿©°\Ë\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap\è\Ãû\Å](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap\æ.­(v\n\Î\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\rJOB_PARAM_KEYsr\0cc.mrbird.febs.job.entity.JobR¬£\0L\0beanNamet\0Ljava/lang/String;L\0\ncreateTimet\0Ljava/util/Date;L\0cronExpressionq\0~\0	L\0jobIdt\0Ljava/lang/Long;L\0\nmethodNameq\0~\0	L\0paramsq\0~\0	L\0remarkq\0~\0	L\0statusq\0~\0	xpt\0testTasksr\0java.util.DatehjKYt\0\0xpw\0\0a\Ç2xt\00/10 * * * * ?sr\0java.lang.Long;\äÌ#\ß\0J\0valuexr\0java.lang.Number¬\à\0\0xp\0\0\0\0\0\0\0t\0test1pt\0æ åä»»å¡è°åº¦æµè¯t\01x\0'),('FEBS_Scheduler','TASK_3','DEFAULT',NULL,'cc.mrbird.febs.job.util.ScheduleJob','0','0','0','0',_binary '¬\í\0sr\0org.quartz.JobDataMap°è¿©°\Ë\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap\è\Ãû\Å](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap\æ.­(v\n\Î\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\rJOB_PARAM_KEYsr\0cc.mrbird.febs.job.entity.JobR¬£\0L\0beanNamet\0Ljava/lang/String;L\0\ncreateTimet\0Ljava/util/Date;L\0cronExpressionq\0~\0	L\0jobIdt\0Ljava/lang/Long;L\0\nmethodNameq\0~\0	L\0paramsq\0~\0	L\0remarkq\0~\0	L\0statusq\0~\0	xpt\0testTasksr\0java.util.DatehjKYt\0\0xpw\0\0aÏ¹¦xt\0\r0/1 * * * * ?sr\0java.lang.Long;\äÌ#\ß\0J\0valuexr\0java.lang.Number¬\à\0\0xp\0\0\0\0\0\0\0t\0testt\0hello worldt\0+æåä»»å¡è°åº¦æµè¯,æ¯éä¸ç§è§¦åt\01x\0'),('GWARBMS_Scheduler','TASK_1','DEFAULT',NULL,'cn.edu.hit.spat.job.util.ScheduleJob','0','0','0','0',_binary '¬\í\0sr\0org.quartz.JobDataMap°è¿©°\Ë\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap\è\Ãû\Å](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap\æ.­(v\n\Î\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\rJOB_PARAM_KEYsr\0cn.edu.hit.spat.job.entity.JobR¬£\0L\0beanNamet\0Ljava/lang/String;L\0\ncreateTimet\0Ljava/util/Date;L\0cronExpressionq\0~\0	L\0jobIdt\0Ljava/lang/Long;L\0\nmethodNameq\0~\0	L\0paramsq\0~\0	L\0remarkq\0~\0	L\0statusq\0~\0	xpt\0testTasksr\0java.util.DatehjKYt\0\0xpw\0\0a\Æ\ëppxt\0\r0/1 * * * * ?sr\0java.lang.Long;\äÌ#\ß\0J\0valuexr\0java.lang.Number¬\à\0\0xp\0\0\0\0\0\0\0t\0testt\0mrbirdt\0\Zæåä»»å¡è°åº¦æµè¯~~t\01x\0'),('GWARBMS_Scheduler','TASK_11','DEFAULT',NULL,'cn.edu.hit.spat.job.util.ScheduleJob','0','0','0','0',_binary '¬\í\0sr\0org.quartz.JobDataMap°è¿©°\Ë\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap\è\Ãû\Å](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap\æ.­(v\n\Î\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\rJOB_PARAM_KEYsr\0cn.edu.hit.spat.job.entity.JobR¬£\0L\0beanNamet\0Ljava/lang/String;L\0\ncreateTimet\0Ljava/util/Date;L\0cronExpressionq\0~\0	L\0jobIdt\0Ljava/lang/Long;L\0\nmethodNameq\0~\0	L\0paramsq\0~\0	L\0remarkq\0~\0	L\0statusq\0~\0	xpt\0testTasksr\0java.util.DatehjKYt\0\0xpw\0\0a\Ð¬Pxt\0\r0/5 * * * * ?sr\0java.lang.Long;\äÌ#\ß\0J\0valuexr\0java.lang.Number¬\à\0\0xp\0\0\0\0\0\0\0t\0test2pt\0æµè¯å¼å¸¸t\01x\0'),('GWARBMS_Scheduler','TASK_2','DEFAULT',NULL,'cn.edu.hit.spat.job.util.ScheduleJob','0','0','0','0',_binary '¬\í\0sr\0org.quartz.JobDataMap°è¿©°\Ë\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap\è\Ãû\Å](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap\æ.­(v\n\Î\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\rJOB_PARAM_KEYsr\0cn.edu.hit.spat.job.entity.JobR¬£\0L\0beanNamet\0Ljava/lang/String;L\0\ncreateTimet\0Ljava/util/Date;L\0cronExpressionq\0~\0	L\0jobIdt\0Ljava/lang/Long;L\0\nmethodNameq\0~\0	L\0paramsq\0~\0	L\0remarkq\0~\0	L\0statusq\0~\0	xpt\0testTasksr\0java.util.DatehjKYt\0\0xpw\0\0a\Ç2xt\00/10 * * * * ?sr\0java.lang.Long;\äÌ#\ß\0J\0valuexr\0java.lang.Number¬\à\0\0xp\0\0\0\0\0\0\0t\0test1pt\0æ åä»»å¡è°åº¦æµè¯t\01x\0'),('GWARBMS_Scheduler','TASK_3','DEFAULT',NULL,'cn.edu.hit.spat.job.util.ScheduleJob','0','0','0','0',_binary '¬\í\0sr\0org.quartz.JobDataMap°è¿©°\Ë\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap\è\Ãû\Å](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap\æ.­(v\n\Î\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\rJOB_PARAM_KEYsr\0cn.edu.hit.spat.job.entity.JobR¬£\0L\0beanNamet\0Ljava/lang/String;L\0\ncreateTimet\0Ljava/util/Date;L\0cronExpressionq\0~\0	L\0jobIdt\0Ljava/lang/Long;L\0\nmethodNameq\0~\0	L\0paramsq\0~\0	L\0remarkq\0~\0	L\0statusq\0~\0	xpt\0testTasksr\0java.util.DatehjKYt\0\0xpw\0\0aÏ¹¦xt\0\r0/1 * * * * ?sr\0java.lang.Long;\äÌ#\ß\0J\0valuexr\0java.lang.Number¬\à\0\0xp\0\0\0\0\0\0\0t\0testt\0hello worldt\0+æåä»»å¡è°åº¦æµè¯,æ¯éä¸ç§è§¦åt\01x\0');
/*!40000 ALTER TABLE `qrtz_job_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_locks`
--

DROP TABLE IF EXISTS `qrtz_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_locks`
--

LOCK TABLES `qrtz_locks` WRITE;
/*!40000 ALTER TABLE `qrtz_locks` DISABLE KEYS */;
INSERT INTO `qrtz_locks` VALUES ('FEBS_Scheduler','STATE_ACCESS'),('FEBS_Scheduler','TRIGGER_ACCESS'),('GWARBMS_Scheduler','STATE_ACCESS'),('GWARBMS_Scheduler','TRIGGER_ACCESS');
/*!40000 ALTER TABLE `qrtz_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_paused_trigger_grps`
--

DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_paused_trigger_grps`
--

LOCK TABLES `qrtz_paused_trigger_grps` WRITE;
/*!40000 ALTER TABLE `qrtz_paused_trigger_grps` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_paused_trigger_grps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_scheduler_state`
--

DROP TABLE IF EXISTS `qrtz_scheduler_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint NOT NULL,
  `CHECKIN_INTERVAL` bigint NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_scheduler_state`
--

LOCK TABLES `qrtz_scheduler_state` WRITE;
/*!40000 ALTER TABLE `qrtz_scheduler_state` DISABLE KEYS */;
INSERT INTO `qrtz_scheduler_state` VALUES ('FEBS_Scheduler','DESKTOP-SCQM16L1606459601845',1606460205091,15000),('GWARBMS_Scheduler','DESKTOP-SCQM16L1606470023367',1606470311502,15000);
/*!40000 ALTER TABLE `qrtz_scheduler_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_simple_triggers`
--

DROP TABLE IF EXISTS `qrtz_simple_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint NOT NULL,
  `REPEAT_INTERVAL` bigint NOT NULL,
  `TIMES_TRIGGERED` bigint NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_simple_triggers`
--

LOCK TABLES `qrtz_simple_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_simple_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_simple_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_simprop_triggers`
--

DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int DEFAULT NULL,
  `INT_PROP_2` int DEFAULT NULL,
  `LONG_PROP_1` bigint DEFAULT NULL,
  `LONG_PROP_2` bigint DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_simprop_triggers`
--

LOCK TABLES `qrtz_simprop_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_simprop_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_simprop_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_triggers`
--

DROP TABLE IF EXISTS `qrtz_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint DEFAULT NULL,
  `PREV_FIRE_TIME` bigint DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint NOT NULL,
  `END_TIME` bigint DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_triggers`
--

LOCK TABLES `qrtz_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_triggers` DISABLE KEYS */;
INSERT INTO `qrtz_triggers` VALUES ('FEBS_Scheduler','TASK_1','DEFAULT','TASK_1','DEFAULT',NULL,1606351991000,-1,5,'PAUSED','CRON',1606351991000,0,NULL,2,_binary '¬\í\0sr\0org.quartz.JobDataMap°è¿©°\Ë\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap\è\Ãû\Å](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap\æ.­(v\n\Î\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\rJOB_PARAM_KEYsr\0cc.mrbird.febs.job.entity.JobR¬£\0L\0beanNamet\0Ljava/lang/String;L\0\ncreateTimet\0Ljava/util/Date;L\0cronExpressionq\0~\0	L\0jobIdt\0Ljava/lang/Long;L\0\nmethodNameq\0~\0	L\0paramsq\0~\0	L\0remarkq\0~\0	L\0statusq\0~\0	xpt\0testTasksr\0java.util.DatehjKYt\0\0xpw\0\0a\Æ\ëppxt\0\r0/1 * * * * ?sr\0java.lang.Long;\äÌ#\ß\0J\0valuexr\0java.lang.Number¬\à\0\0xp\0\0\0\0\0\0\0t\0testt\0mrbirdt\0\Zæåä»»å¡è°åº¦æµè¯~~t\01x\0'),('FEBS_Scheduler','TASK_11','DEFAULT','TASK_11','DEFAULT',NULL,1606351995000,-1,5,'PAUSED','CRON',1606351991000,0,NULL,2,_binary '¬\í\0sr\0org.quartz.JobDataMap°è¿©°\Ë\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap\è\Ãû\Å](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap\æ.­(v\n\Î\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\rJOB_PARAM_KEYsr\0cc.mrbird.febs.job.entity.JobR¬£\0L\0beanNamet\0Ljava/lang/String;L\0\ncreateTimet\0Ljava/util/Date;L\0cronExpressionq\0~\0	L\0jobIdt\0Ljava/lang/Long;L\0\nmethodNameq\0~\0	L\0paramsq\0~\0	L\0remarkq\0~\0	L\0statusq\0~\0	xpt\0testTasksr\0java.util.DatehjKYt\0\0xpw\0\0a\Ð¬Pxt\0\r0/5 * * * * ?sr\0java.lang.Long;\äÌ#\ß\0J\0valuexr\0java.lang.Number¬\à\0\0xp\0\0\0\0\0\0\0t\0test2pt\0æµè¯å¼å¸¸t\01x\0'),('FEBS_Scheduler','TASK_2','DEFAULT','TASK_2','DEFAULT',NULL,1606352000000,-1,5,'PAUSED','CRON',1606351991000,0,NULL,2,_binary '¬\í\0sr\0org.quartz.JobDataMap°è¿©°\Ë\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap\è\Ãû\Å](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap\æ.­(v\n\Î\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\rJOB_PARAM_KEYsr\0cc.mrbird.febs.job.entity.JobR¬£\0L\0beanNamet\0Ljava/lang/String;L\0\ncreateTimet\0Ljava/util/Date;L\0cronExpressionq\0~\0	L\0jobIdt\0Ljava/lang/Long;L\0\nmethodNameq\0~\0	L\0paramsq\0~\0	L\0remarkq\0~\0	L\0statusq\0~\0	xpt\0testTasksr\0java.util.DatehjKYt\0\0xpw\0\0a\Ç2xt\00/10 * * * * ?sr\0java.lang.Long;\äÌ#\ß\0J\0valuexr\0java.lang.Number¬\à\0\0xp\0\0\0\0\0\0\0t\0test1pt\0æ åä»»å¡è°åº¦æµè¯t\01x\0'),('FEBS_Scheduler','TASK_3','DEFAULT','TASK_3','DEFAULT',NULL,1606351991000,-1,5,'PAUSED','CRON',1606351991000,0,NULL,2,_binary '¬\í\0sr\0org.quartz.JobDataMap°è¿©°\Ë\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap\è\Ãû\Å](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap\æ.­(v\n\Î\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\rJOB_PARAM_KEYsr\0cc.mrbird.febs.job.entity.JobR¬£\0L\0beanNamet\0Ljava/lang/String;L\0\ncreateTimet\0Ljava/util/Date;L\0cronExpressionq\0~\0	L\0jobIdt\0Ljava/lang/Long;L\0\nmethodNameq\0~\0	L\0paramsq\0~\0	L\0remarkq\0~\0	L\0statusq\0~\0	xpt\0testTasksr\0java.util.DatehjKYt\0\0xpw\0\0aÏ¹¦xt\0\r0/1 * * * * ?sr\0java.lang.Long;\äÌ#\ß\0J\0valuexr\0java.lang.Number¬\à\0\0xp\0\0\0\0\0\0\0t\0testt\0hello worldt\0+æåä»»å¡è°åº¦æµè¯,æ¯éä¸ç§è§¦åt\01x\0'),('GWARBMS_Scheduler','TASK_1','DEFAULT','TASK_1','DEFAULT',NULL,1606443359000,-1,5,'PAUSED','CRON',1606443359000,0,NULL,2,_binary '¬\í\0sr\0org.quartz.JobDataMap°è¿©°\Ë\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap\è\Ãû\Å](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap\æ.­(v\n\Î\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\rJOB_PARAM_KEYsr\0cn.edu.hit.spat.job.entity.JobR¬£\0L\0beanNamet\0Ljava/lang/String;L\0\ncreateTimet\0Ljava/util/Date;L\0cronExpressionq\0~\0	L\0jobIdt\0Ljava/lang/Long;L\0\nmethodNameq\0~\0	L\0paramsq\0~\0	L\0remarkq\0~\0	L\0statusq\0~\0	xpt\0testTasksr\0java.util.DatehjKYt\0\0xpw\0\0a\Æ\ëppxt\0\r0/1 * * * * ?sr\0java.lang.Long;\äÌ#\ß\0J\0valuexr\0java.lang.Number¬\à\0\0xp\0\0\0\0\0\0\0t\0testt\0mrbirdt\0\Zæåä»»å¡è°åº¦æµè¯~~t\01x\0'),('GWARBMS_Scheduler','TASK_11','DEFAULT','TASK_11','DEFAULT',NULL,1606443360000,-1,5,'PAUSED','CRON',1606443359000,0,NULL,2,_binary '¬\í\0sr\0org.quartz.JobDataMap°è¿©°\Ë\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap\è\Ãû\Å](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap\æ.­(v\n\Î\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\rJOB_PARAM_KEYsr\0cn.edu.hit.spat.job.entity.JobR¬£\0L\0beanNamet\0Ljava/lang/String;L\0\ncreateTimet\0Ljava/util/Date;L\0cronExpressionq\0~\0	L\0jobIdt\0Ljava/lang/Long;L\0\nmethodNameq\0~\0	L\0paramsq\0~\0	L\0remarkq\0~\0	L\0statusq\0~\0	xpt\0testTasksr\0java.util.DatehjKYt\0\0xpw\0\0a\Ð¬Pxt\0\r0/5 * * * * ?sr\0java.lang.Long;\äÌ#\ß\0J\0valuexr\0java.lang.Number¬\à\0\0xp\0\0\0\0\0\0\0t\0test2pt\0æµè¯å¼å¸¸t\01x\0'),('GWARBMS_Scheduler','TASK_2','DEFAULT','TASK_2','DEFAULT',NULL,1606443360000,-1,5,'PAUSED','CRON',1606443359000,0,NULL,2,_binary '¬\í\0sr\0org.quartz.JobDataMap°è¿©°\Ë\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap\è\Ãû\Å](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap\æ.­(v\n\Î\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\rJOB_PARAM_KEYsr\0cn.edu.hit.spat.job.entity.JobR¬£\0L\0beanNamet\0Ljava/lang/String;L\0\ncreateTimet\0Ljava/util/Date;L\0cronExpressionq\0~\0	L\0jobIdt\0Ljava/lang/Long;L\0\nmethodNameq\0~\0	L\0paramsq\0~\0	L\0remarkq\0~\0	L\0statusq\0~\0	xpt\0testTasksr\0java.util.DatehjKYt\0\0xpw\0\0a\Ç2xt\00/10 * * * * ?sr\0java.lang.Long;\äÌ#\ß\0J\0valuexr\0java.lang.Number¬\à\0\0xp\0\0\0\0\0\0\0t\0test1pt\0æ åä»»å¡è°åº¦æµè¯t\01x\0'),('GWARBMS_Scheduler','TASK_3','DEFAULT','TASK_3','DEFAULT',NULL,1606443359000,-1,5,'PAUSED','CRON',1606443359000,0,NULL,2,_binary '¬\í\0sr\0org.quartz.JobDataMap°è¿©°\Ë\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap\è\Ãû\Å](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap\æ.­(v\n\Î\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\rJOB_PARAM_KEYsr\0cn.edu.hit.spat.job.entity.JobR¬£\0L\0beanNamet\0Ljava/lang/String;L\0\ncreateTimet\0Ljava/util/Date;L\0cronExpressionq\0~\0	L\0jobIdt\0Ljava/lang/Long;L\0\nmethodNameq\0~\0	L\0paramsq\0~\0	L\0remarkq\0~\0	L\0statusq\0~\0	xpt\0testTasksr\0java.util.DatehjKYt\0\0xpw\0\0aÏ¹¦xt\0\r0/1 * * * * ?sr\0java.lang.Long;\äÌ#\ß\0J\0valuexr\0java.lang.Number¬\à\0\0xp\0\0\0\0\0\0\0t\0testt\0hello worldt\0+æåä»»å¡è°åº¦æµè¯,æ¯éä¸ç§è§¦åt\01x\0');
/*!40000 ALTER TABLE `qrtz_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_customer`
--

DROP TABLE IF EXISTS `t_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_customer` (
  `CUSTOMER_ID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `GENDER` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `PHONE` bigint unsigned NOT NULL,
  PRIMARY KEY (`CUSTOMER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_customer`
--

LOCK TABLES `t_customer` WRITE;
/*!40000 ALTER TABLE `t_customer` DISABLE KEYS */;
INSERT INTO `t_customer` VALUES (4,'å¼ ä¸','0',15322223334);
/*!40000 ALTER TABLE `t_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_data_permission_test`
--

DROP TABLE IF EXISTS `t_data_permission_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_data_permission_test` (
  `FIELD1` varchar(20) NOT NULL,
  `FIELD2` varchar(20) NOT NULL,
  `FIELD3` varchar(20) NOT NULL,
  `FIELD4` varchar(20) NOT NULL,
  `DEPT_ID` int NOT NULL,
  `CREATE_TIME` datetime NOT NULL,
  `ID` int NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ç¨æ·æéæµè¯';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_data_permission_test`
--

LOCK TABLES `t_data_permission_test` WRITE;
/*!40000 ALTER TABLE `t_data_permission_test` DISABLE KEYS */;
INSERT INTO `t_data_permission_test` VALUES ('å°ç±³','å°ç±³10Pro','4999','çç ç½',1,'2020-04-14 15:00:38',1),('è¾è®¯','é»é²¨æ¸¸æææº3','3799','é ç²ç°',2,'2020-04-14 15:01:36',2),('åä¸º','åä¸ºP30','3299','å¤©ç©ºä¹å¢',1,'2020-04-14 15:03:11',3),('åä¸º','åä¸ºP40Pro','6488','äº®é»è²',3,'2020-04-14 15:04:31',4),('vivo','Vivo iQOO 3','3998','æåæ©',4,'2020-04-14 15:05:55',5),('ä¸å ','ä¸å 7T','3199','å°éè',5,'2020-04-14 15:06:53',6),('ä¸æ','ä¸æGalaxy S10','4098','æµ©çç½',6,'2020-04-14 15:08:25',7),('è¹æ','iPhone 11 pro max','9198','æå¤ç»¿',4,'2020-04-14 15:09:20',8);
/*!40000 ALTER TABLE `t_data_permission_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_dept`
--

DROP TABLE IF EXISTS `t_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_dept` (
  `DEPT_ID` bigint NOT NULL AUTO_INCREMENT COMMENT 'é¨é¨ID',
  `PARENT_ID` bigint NOT NULL COMMENT 'ä¸çº§é¨é¨ID',
  `DEPT_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'é¨é¨åç§°',
  `ORDER_NUM` bigint DEFAULT NULL COMMENT 'æåº',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT 'åå»ºæ¶é´',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT 'ä¿®æ¹æ¶é´',
  PRIMARY KEY (`DEPT_ID`) USING BTREE,
  KEY `t_dept_parent_id` (`PARENT_ID`),
  KEY `t_dept_dept_name` (`DEPT_NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='é¨é¨è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_dept`
--

LOCK TABLES `t_dept` WRITE;
/*!40000 ALTER TABLE `t_dept` DISABLE KEYS */;
INSERT INTO `t_dept` VALUES (1,0,'å¼åé¨',1,'2019-06-14 20:56:41',NULL),(2,1,'å¼åä¸é¨',1,'2019-06-14 20:58:46',NULL),(3,1,'å¼åäºé¨',2,'2019-06-14 20:58:56',NULL),(4,0,'éè´­é¨',2,'2019-06-14 20:59:56',NULL),(5,0,'è´¢å¡é¨',3,'2019-06-14 21:00:08',NULL),(6,0,'éå®é¨',4,'2019-06-14 21:00:15',NULL),(7,0,'å·¥ç¨é¨',5,'2019-06-14 21:00:42',NULL),(8,0,'è¡æ¿é¨',6,'2019-06-14 21:00:49',NULL),(9,0,'äººåèµæºé¨',8,'2019-06-14 21:01:14','2019-06-14 21:01:34'),(10,0,'ç³»ç»é¨',7,'2019-06-14 21:01:31',NULL);
/*!40000 ALTER TABLE `t_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_eximport`
--

DROP TABLE IF EXISTS `t_eximport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_eximport` (
  `FIELD1` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'å­æ®µ1',
  `FIELD2` int NOT NULL COMMENT 'å­æ®µ2',
  `FIELD3` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'å­æ®µ3',
  `CREATE_TIME` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Excelå¯¼å¥å¯¼åºæµè¯';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_eximport`
--

LOCK TABLES `t_eximport` WRITE;
/*!40000 ALTER TABLE `t_eximport` DISABLE KEYS */;
INSERT INTO `t_eximport` VALUES ('å­æ®µ1',1,'mrbird0@gmail.com','2019-06-13 03:14:06'),('å­æ®µ1',2,'mrbird1@gmail.com','2019-06-13 03:14:06'),('å­æ®µ1',3,'mrbird2@gmail.com','2019-06-13 03:14:06'),('å­æ®µ1',4,'mrbird3@gmail.com','2019-06-13 03:14:06'),('å­æ®µ1',5,'mrbird4@gmail.com','2019-06-13 03:14:06'),('å­æ®µ1',6,'mrbird5@gmail.com','2019-06-13 03:14:06'),('å­æ®µ1',7,'mrbird6@gmail.com','2019-06-13 03:14:06'),('å­æ®µ1',8,'mrbird7@gmail.com','2019-06-13 03:14:06'),('å­æ®µ1',9,'mrbird8@gmail.com','2019-06-13 03:14:06'),('å­æ®µ1',10,'mrbird9@gmail.com','2019-06-13 03:14:06'),('å­æ®µ1',11,'mrbird10@gmail.com','2019-06-13 03:14:06'),('å­æ®µ1',12,'mrbird11@gmail.com','2019-06-13 03:14:06'),('å­æ®µ1',13,'mrbird12@gmail.com','2019-06-13 03:14:06'),('å­æ®µ1',14,'mrbird13@gmail.com','2019-06-13 03:14:06'),('å­æ®µ1',15,'mrbird14@gmail.com','2019-06-13 03:14:06'),('å­æ®µ1',16,'mrbird15@gmail.com','2019-06-13 03:14:06'),('å­æ®µ1',17,'mrbird16@gmail.com','2019-06-13 03:14:06'),('å­æ®µ1',18,'mrbird17@gmail.com','2019-06-13 03:14:06'),('å­æ®µ1',19,'mrbird18@gmail.com','2019-06-13 03:14:06'),('å­æ®µ1',20,'mrbird19@gmail.com','2019-06-13 03:14:06');
/*!40000 ALTER TABLE `t_eximport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_generator_config`
--

DROP TABLE IF EXISTS `t_generator_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_generator_config` (
  `id` int NOT NULL COMMENT 'ä¸»é®',
  `author` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ä½è',
  `base_package` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'åºç¡åå',
  `entity_package` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'entityæä»¶å­æ¾è·¯å¾',
  `mapper_package` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'mapperæä»¶å­æ¾è·¯å¾',
  `mapper_xml_package` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'mapper xmlæä»¶å­æ¾è·¯å¾',
  `service_package` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'servcieæä»¶å­æ¾è·¯å¾',
  `service_impl_package` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'serviceImplæä»¶å­æ¾è·¯å¾',
  `controller_package` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'controlleræä»¶å­æ¾è·¯å¾',
  `is_trim` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'æ¯å¦å»é¤åç¼ 1æ¯ 0å¦',
  `trim_value` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'åç¼åå®¹',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='ä»£ç çæéç½®è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_generator_config`
--

LOCK TABLES `t_generator_config` WRITE;
/*!40000 ALTER TABLE `t_generator_config` DISABLE KEYS */;
INSERT INTO `t_generator_config` VALUES (1,'MrBird','cc.mrbird.febs.gen','entity','mapper','mapper','service','service.impl','controller','1','t_');
/*!40000 ALTER TABLE `t_generator_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_goods`
--

DROP TABLE IF EXISTS `t_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_goods` (
  `GOODS_ID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) NOT NULL,
  `PRICE` bigint unsigned NOT NULL,
  `INVENTORY` bigint unsigned NOT NULL,
  PRIMARY KEY (`GOODS_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='è´§ç©è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_goods`
--

LOCK TABLES `t_goods` WRITE;
/*!40000 ALTER TABLE `t_goods` DISABLE KEYS */;
INSERT INTO `t_goods` VALUES (1,'é®ç',200,10);
/*!40000 ALTER TABLE `t_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_job`
--

DROP TABLE IF EXISTS `t_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_job` (
  `JOB_ID` bigint NOT NULL AUTO_INCREMENT COMMENT 'ä»»å¡id',
  `BEAN_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'spring beanåç§°',
  `METHOD_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'æ¹æ³å',
  `PARAMS` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'åæ°',
  `CRON_EXPRESSION` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'cronè¡¨è¾¾å¼',
  `STATUS` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ä»»å¡ç¶æ  0ï¼æ­£å¸¸  1ï¼æå',
  `REMARK` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'å¤æ³¨',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT 'åå»ºæ¶é´',
  PRIMARY KEY (`JOB_ID`) USING BTREE,
  KEY `t_job_create_time` (`CREATE_TIME`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='å®æ¶ä»»å¡è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_job`
--

LOCK TABLES `t_job` WRITE;
/*!40000 ALTER TABLE `t_job` DISABLE KEYS */;
INSERT INTO `t_job` VALUES (1,'testTask','test','mrbird','0/1 * * * * ?','1','æåä»»å¡è°åº¦æµè¯~~','2018-02-24 16:26:14'),(2,'testTask','test1',NULL,'0/10 * * * * ?','1','æ åä»»å¡è°åº¦æµè¯','2018-02-24 17:06:23'),(3,'testTask','test','hello world','0/1 * * * * ?','1','æåä»»å¡è°åº¦æµè¯,æ¯éä¸ç§è§¦å','2018-02-26 09:28:26'),(11,'testTask','test2',NULL,'0/5 * * * * ?','1','æµè¯å¼å¸¸','2018-02-26 11:15:30');
/*!40000 ALTER TABLE `t_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_job_log`
--

DROP TABLE IF EXISTS `t_job_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_job_log` (
  `LOG_ID` bigint NOT NULL AUTO_INCREMENT COMMENT 'ä»»å¡æ¥å¿id',
  `JOB_ID` bigint NOT NULL COMMENT 'ä»»å¡id',
  `BEAN_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'spring beanåç§°',
  `METHOD_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'æ¹æ³å',
  `PARAMS` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'åæ°',
  `STATUS` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ä»»å¡ç¶æ    0ï¼æå    1ï¼å¤±è´¥',
  `ERROR` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT 'å¤±è´¥ä¿¡æ¯',
  `TIMES` decimal(11,0) DEFAULT NULL COMMENT 'èæ¶(åä½ï¼æ¯«ç§)',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT 'åå»ºæ¶é´',
  PRIMARY KEY (`LOG_ID`) USING BTREE,
  KEY `t_job_log_create_time` (`CREATE_TIME`)
) ENGINE=MyISAM AUTO_INCREMENT=2562 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='è°åº¦æ¥å¿è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_job_log`
--

LOCK TABLES `t_job_log` WRITE;
/*!40000 ALTER TABLE `t_job_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_job_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_log`
--

DROP TABLE IF EXISTS `t_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_log` (
  `ID` bigint NOT NULL AUTO_INCREMENT COMMENT 'æ¥å¿ID',
  `USERNAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'æä½ç¨æ·',
  `OPERATION` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT 'æä½åå®¹',
  `TIME` decimal(11,0) DEFAULT NULL COMMENT 'èæ¶',
  `METHOD` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT 'æä½æ¹æ³',
  `PARAMS` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT 'æ¹æ³åæ°',
  `IP` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'æä½èIP',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT 'åå»ºæ¶é´',
  `location` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'æä½å°ç¹',
  PRIMARY KEY (`ID`) USING BTREE,
  KEY `t_log_create_time` (`CREATE_TIME`)
) ENGINE=MyISAM AUTO_INCREMENT=1250 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='æä½æ¥å¿è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_log`
--

LOCK TABLES `t_log` WRITE;
/*!40000 ALTER TABLE `t_log` DISABLE KEYS */;
INSERT INTO `t_log` VALUES (1011,'MrBird','æ°å¢èå/æé®',39,'cc.mrbird.febs.system.controller.MenuController.addMenu()',' menu: \"Menu(menuId=179, parentId=0, menuName=è®¢åç®¡ç, url=, perms=, icon=layui-icon-filedone, type=0, orderNum=null, createTime=Sun Jul 26 17:39:33 CST 2020, modifyTime=null)\"','192.168.137.1','2020-07-26 17:39:34','åç½IP|0|0|åç½IP|åç½IP'),(1012,'MrBird','æ°å¢èå/æé®',46,'cc.mrbird.febs.system.controller.MenuController.addMenu()',' menu: \"Menu(menuId=180, parentId=179, menuName=æ°å¢è®¢å, url=, perms=, icon=layui-icon-file-add, type=0, orderNum=null, createTime=Sun Jul 26 17:41:25 CST 2020, modifyTime=null)\"','192.168.137.1','2020-07-26 17:41:25','åç½IP|0|0|åç½IP|åç½IP'),(1013,'MrBird','æ°å¢èå/æé®',47,'cc.mrbird.febs.system.controller.MenuController.addMenu()',' menu: \"Menu(menuId=181, parentId=179, menuName=å®¡æ¹è®¢å, url=, perms=, icon=layui-icon-fileprotect, type=0, orderNum=null, createTime=Sun Jul 26 17:42:50 CST 2020, modifyTime=null)\"','192.168.137.1','2020-07-26 17:42:51','åç½IP|0|0|åç½IP|åç½IP'),(1014,'MrBird','æ°å¢èå/æé®',26,'cc.mrbird.febs.system.controller.MenuController.addMenu()',' menu: \"Menu(menuId=182, parentId=179, menuName=å½æ¡£è®¢å, url=, perms=, icon=layui-icon-reconciliation, type=0, orderNum=null, createTime=Sun Jul 26 17:43:42 CST 2020, modifyTime=null)\"','192.168.137.1','2020-07-26 17:43:42','åç½IP|0|0|åç½IP|åç½IP'),(1015,'MrBird','æ°å¢èå/æé®',19,'cc.mrbird.febs.system.controller.MenuController.addMenu()',' menu: \"Menu(menuId=183, parentId=181, menuName=éå®å®¡æ¹, url=null, perms=, icon=null, type=1, orderNum=null, createTime=Sun Jul 26 17:44:13 CST 2020, modifyTime=null)\"','192.168.137.1','2020-07-26 17:44:13','åç½IP|0|0|åç½IP|åç½IP'),(1016,'MrBird','ä¿®æ¹èå/æé®',20,'cc.mrbird.febs.system.controller.MenuController.updateMenu()',' menu: \"Menu(menuId=183, parentId=181, menuName=éå®å®¡æ ¸, url=null, perms=, icon=null, type=1, orderNum=null, createTime=null, modifyTime=Sun Jul 26 17:44:24 CST 2020)\"','192.168.137.1','2020-07-26 17:44:25','åç½IP|0|0|åç½IP|åç½IP'),(1017,'MrBird','æ°å¢èå/æé®',9,'cc.mrbird.febs.system.controller.MenuController.addMenu()',' menu: \"Menu(menuId=184, parentId=181, menuName=è´¢å¡å®¡æ ¸, url=null, perms=, icon=null, type=1, orderNum=null, createTime=Sun Jul 26 17:44:43 CST 2020, modifyTime=null)\"','192.168.137.1','2020-07-26 17:44:43','åç½IP|0|0|åç½IP|åç½IP'),(1018,'MrBird','æ°å¢èå/æé®',13,'cc.mrbird.febs.system.controller.MenuController.addMenu()',' menu: \"Menu(menuId=185, parentId=181, menuName=äº¤ä»å®¡æ ¸, url=null, perms=, icon=null, type=1, orderNum=null, createTime=Sun Jul 26 17:45:04 CST 2020, modifyTime=null)\"','192.168.137.1','2020-07-26 17:45:04','åç½IP|0|0|åç½IP|åç½IP'),(1019,'MrBird','ä¿®æ¹è§è²',119,'cc.mrbird.febs.system.controller.RoleController.updateRole()',' role: \"Role(roleId=1, roleName=ç³»ç»ç®¡çå, remark=ç³»ç»ç®¡çåï¼æ¥ææææä½æé ^_^, createTime=null, modifyTime=Sun Jul 26 17:45:53 CST 2020, menuIds=179,180,181,183,184,185,182,1,3,13,11,12,160,161,4,162,14,15,16,5,163,17,18,19,6,164,20,21,22,2,8,23,10,24,170,136,171,172,127,128,129,131,175,101,102,103,104,105,106,107,108,173,109,110,174,137,138,165,139,166,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125,167,168,169,178)\"','192.168.137.1','2020-07-26 17:45:53','åç½IP|0|0|åç½IP|åç½IP'),(1020,'MrBird','ä¿®æ¹èå/æé®',18,'cc.mrbird.febs.system.controller.MenuController.updateMenu()',' menu: \"Menu(menuId=180, parentId=179, menuName=æ°å¢è®¢å, url=, perms=, icon=layui-icon-file-add, type=0, orderNum=1, createTime=null, modifyTime=Sun Jul 26 17:46:25 CST 2020)\"','192.168.137.1','2020-07-26 17:46:25','åç½IP|0|0|åç½IP|åç½IP'),(1021,'MrBird','ä¿®æ¹èå/æé®',20,'cc.mrbird.febs.system.controller.MenuController.updateMenu()',' menu: \"Menu(menuId=182, parentId=179, menuName=å½æ¡£è®¢å, url=, perms=, icon=layui-icon-reconciliation, type=0, orderNum=2, createTime=null, modifyTime=Sun Jul 26 17:46:34 CST 2020)\"','192.168.137.1','2020-07-26 17:46:35','åç½IP|0|0|åç½IP|åç½IP'),(1022,'MrBird','ä¿®æ¹èå/æé®',22,'cc.mrbird.febs.system.controller.MenuController.updateMenu()',' menu: \"Menu(menuId=181, parentId=179, menuName=å®¡æ¹è®¢å, url=, perms=, icon=layui-icon-fileprotect, type=0, orderNum=3, createTime=null, modifyTime=Sun Jul 26 17:46:41 CST 2020)\"','192.168.137.1','2020-07-26 17:46:41','åç½IP|0|0|åç½IP|åç½IP'),(1023,'MrBird','ä¿®æ¹èå/æé®',22,'cc.mrbird.febs.system.controller.MenuController.updateMenu()',' menu: \"Menu(menuId=181, parentId=179, menuName=å®¡æ¹è®¢å, url=, perms=, icon=layui-icon-fileprotect, type=0, orderNum=2, createTime=null, modifyTime=Sun Jul 26 17:46:50 CST 2020)\"','192.168.137.1','2020-07-26 17:46:51','åç½IP|0|0|åç½IP|åç½IP'),(1024,'MrBird','ä¿®æ¹èå/æé®',20,'cc.mrbird.febs.system.controller.MenuController.updateMenu()',' menu: \"Menu(menuId=182, parentId=179, menuName=å½æ¡£è®¢å, url=, perms=, icon=layui-icon-reconciliation, type=0, orderNum=3, createTime=null, modifyTime=Sun Jul 26 17:46:57 CST 2020)\"','192.168.137.1','2020-07-26 17:46:58','åç½IP|0|0|åç½IP|åç½IP'),(1025,'MrBird','æ°å¢è§è²',27,'cc.mrbird.febs.system.controller.RoleController.addRole()',' role: \"Role(roleId=81, roleName=éå®äººå, remark=è½¦è¾éå®, createTime=Sun Jul 26 18:20:03 CST 2020, modifyTime=null, menuIds=180)\"','192.168.137.1','2020-07-26 18:20:04','åç½IP|0|0|åç½IP|åç½IP'),(1026,'MrBird','æ°å¢ç¨æ·',28,'cc.mrbird.febs.system.controller.UserController.addUser()',' user: \"User(userId=8, username=zhangsan, password=92dac726ea92d5bdd01eab9aef544c95, deptId=6, email=12345@asd.com, mobile=13911112222, status=1, createTime=Sun Jul 26 18:21:47 CST 2020, modifyTime=null, lastLoginTime=null, sex=0, avatar=default.jpg, theme=black, isTab=1, description=, deptName=null, createTimeFrom=null, createTimeTo=null, roleId=81, roleName=null, deptIds=null)\"','192.168.137.1','2020-07-26 18:21:47','åç½IP|0|0|åç½IP|åç½IP'),(1027,'MrBird','ä¿®æ¹è§è²',36,'cc.mrbird.febs.system.controller.RoleController.updateRole()',' role: \"Role(roleId=81, roleName=éå®äººå, remark=è½¦è¾éå®, createTime=null, modifyTime=Sun Jul 26 18:26:05 CST 2020, menuIds=179,180)\"','192.168.137.1','2020-07-26 18:26:05','åç½IP|0|0|åç½IP|åç½IP'),(1028,'MrBird','ä¿®æ¹èå/æé®',16,'cc.mrbird.febs.system.controller.MenuController.updateMenu()',' menu: \"Menu(menuId=180, parentId=179, menuName=æ°å¢è®¢å, url=, perms=user:view, icon=layui-icon-file-add, type=0, orderNum=1, createTime=null, modifyTime=Sun Jul 26 18:43:26 CST 2020)\"','192.168.137.1','2020-07-26 18:43:26','åç½IP|0|0|åç½IP|åç½IP'),(1029,'MrBird','ä¿®æ¹èå/æé®',10,'cc.mrbird.febs.system.controller.MenuController.updateMenu()',' menu: \"Menu(menuId=180, parentId=179, menuName=æ°å¢è®¢å, url=/system/user, perms=user:view, icon=layui-icon-file-add, type=0, orderNum=1, createTime=null, modifyTime=Sun Jul 26 18:43:58 CST 2020)\"','192.168.137.1','2020-07-26 18:43:58','åç½IP|0|0|åç½IP|åç½IP'),(1030,'MrBird','ä¿®æ¹èå/æé®',15,'cc.mrbird.febs.system.controller.MenuController.updateMenu()',' menu: \"Menu(menuId=180, parentId=179, menuName=æ°å¢è®¢å, url=/system/order, perms=user:view, icon=layui-icon-file-add, type=0, orderNum=1, createTime=null, modifyTime=Sun Jul 26 18:52:30 CST 2020)\"','192.168.137.1','2020-07-26 18:52:30','åç½IP|0|0|åç½IP|åç½IP'),(1031,'MrBird','ä¿®æ¹èå/æé®',12,'cc.mrbird.febs.system.controller.MenuController.updateMenu()',' menu: \"Menu(menuId=180, parentId=179, menuName=æ°å¢è®¢å, url=/system/order, perms=order:view, icon=layui-icon-file-add, type=0, orderNum=1, createTime=null, modifyTime=Sun Jul 26 18:52:59 CST 2020)\"','192.168.137.1','2020-07-26 18:53:00','åç½IP|0|0|åç½IP|åç½IP'),(1032,'MrBird','ä¿®æ¹èå/æé®',42,'cc.mrbird.febs.system.controller.MenuController.updateMenu()',' menu: \"Menu(menuId=180, parentId=179, menuName=æ°å¢è®¢å, url=/system/order, perms=order:create, icon=layui-icon-file-add, type=0, orderNum=1, createTime=null, modifyTime=Sun Jul 26 19:44:01 CST 2020)\"','192.168.137.1','2020-07-26 19:44:02','åç½IP|0|0|åç½IP|åç½IP'),(1033,'MrBird','ä¿®æ¹èå/æé®',22,'cc.mrbird.febs.system.controller.MenuController.updateMenu()',' menu: \"Menu(menuId=181, parentId=179, menuName=å®¡æ¹è®¢å, url=, perms=order:approve, icon=layui-icon-fileprotect, type=0, orderNum=2, createTime=null, modifyTime=Sun Jul 26 19:44:41 CST 2020)\"','192.168.137.1','2020-07-26 19:44:42','åç½IP|0|0|åç½IP|åç½IP'),(1034,'MrBird','ä¿®æ¹èå/æé®',14,'cc.mrbird.febs.system.controller.MenuController.updateMenu()',' menu: \"Menu(menuId=182, parentId=179, menuName=å½æ¡£è®¢å, url=, perms=order:archive, icon=layui-icon-reconciliation, type=0, orderNum=3, createTime=null, modifyTime=Sun Jul 26 19:44:55 CST 2020)\"','192.168.137.1','2020-07-26 19:44:56','åç½IP|0|0|åç½IP|åç½IP'),(1035,'MrBird','ä¿®æ¹èå/æé®',17,'cc.mrbird.febs.system.controller.MenuController.updateMenu()',' menu: \"Menu(menuId=180, parentId=179, menuName=æ°å¢è®¢å, url=/system/order, perms=order:view, icon=layui-icon-file-add, type=0, orderNum=1, createTime=null, modifyTime=Sun Jul 26 19:53:42 CST 2020)\"','192.168.137.1','2020-07-26 19:53:42','åç½IP|0|0|åç½IP|åç½IP'),(1036,'MrBird','ä¿®æ¹èå/æé®',17,'cc.mrbird.febs.system.controller.MenuController.updateMenu()',' menu: \"Menu(menuId=179, parentId=0, menuName=è®¢åç®¡ç, url=, perms=order:view, icon=layui-icon-filedone, type=0, orderNum=null, createTime=null, modifyTime=Sun Jul 26 19:58:42 CST 2020)\"','192.168.137.1','2020-07-26 19:58:43','åç½IP|0|0|åç½IP|åç½IP'),(1037,'MrBird','ä¿®æ¹èå/æé®',9,'cc.mrbird.febs.system.controller.MenuController.updateMenu()',' menu: \"Menu(menuId=180, parentId=179, menuName=æ°å¢è®¢å, url=/system/order, perms=order:create, icon=layui-icon-file-add, type=0, orderNum=1, createTime=null, modifyTime=Sun Jul 26 19:59:11 CST 2020)\"','192.168.137.1','2020-07-26 19:59:12','åç½IP|0|0|åç½IP|åç½IP'),(1038,'MrBird','æ°å¢è®¢å',57,'cc.mrbird.febs.system.controller.OrderController.createOrder()',' order: \"Order(orderId=2, salesId=13, customerName=lisi, customerPhone=12345678912, vehicleId=11, price=202222, createTime=Mon Jul 27 14:31:09 CST 2020, createTimeFrom=null, createTimeTo=null)\"','192.168.137.1','2020-07-27 14:31:09','åç½IP|0|0|åç½IP|åç½IP'),(1039,'MrBird','æ°å¢è®¢å',20,'cc.mrbird.febs.system.controller.OrderController.createOrder()',' order: \"Order(orderId=3, salesId=22, customerName=wangwu, customerPhone=12379845632, vehicleId=22, price=3333333, createTime=Mon Jul 27 14:34:05 CST 2020, createTimeFrom=null, createTimeTo=null)\"','192.168.137.1','2020-07-27 14:34:06','åç½IP|0|0|åç½IP|åç½IP'),(1040,'MrBird','æ°å¢è®¢å',57,'cc.mrbird.febs.system.controller.OrderController.createOrder()',' order: \"Order(orderId=4, salesId=22, customerName=xxx, customerPhone=12345679811, vehicleId=22, price=200000, createTime=Mon Jul 27 14:46:48 CST 2020, createTimeFrom=null, createTimeTo=null)\"','192.168.137.1','2020-07-27 14:46:49','åç½IP|0|0|åç½IP|åç½IP'),(1041,'MrBird','æ°å¢è®¢å',66,'cc.mrbird.febs.system.controller.OrderController.createOrder()',' order: \"Order(orderId=5, salesId=211, customerName=sss, customerPhone=12345678955, vehicleId=11, price=200000, createTime=Mon Jul 27 14:50:00 CST 2020, createTimeFrom=null, createTimeTo=null)\"','192.168.137.1','2020-07-27 14:50:01','åç½IP|0|0|åç½IP|åç½IP'),(1042,'MrBird','æ°å¢è®¢å',36,'cc.mrbird.febs.system.controller.OrderController.createOrder()',' order: \"Order(orderId=6, salesId=22, customerName=qwer, customerPhone=12230000222, vehicleId=33, price=666666, createTime=Mon Jul 27 15:32:05 CST 2020, createTimeFrom=null, createTimeTo=null)\"','192.168.137.1','2020-07-27 15:32:05','åç½IP|0|0|åç½IP|åç½IP'),(1043,'MrBird','æ°å¢è®¢å',31,'cc.mrbird.febs.system.controller.OrderController.createOrder()',' order: \"Order(orderId=7, salesId=null, customerName=, customerPhone=, vehicleId=null, price=null, createTime=Mon Jul 27 16:51:21 CST 2020, createTimeFrom=null, createTimeTo=null)\"','192.168.137.1','2020-07-27 16:51:22','åç½IP|0|0|åç½IP|åç½IP'),(1044,'MrBird','æ°å¢è®¢å',58,'cc.mrbird.febs.system.controller.OrderController.createOrder()',' order: \"Order(orderId=8, salesId=15, customerName=aaaaa, customerPhone=15533336666, vehicleId=88, price=150000, createTime=Tue Jul 28 10:37:09 CST 2020, status=å¾å®¡æ ¸, createTimeFrom=null, createTimeTo=null)\"','192.168.137.1','2020-07-28 10:37:10','åç½IP|0|0|åç½IP|åç½IP'),(1045,'MrBird','ä¿®æ¹è®¢å',56,'cc.mrbird.febs.system.controller.OrderController.updateUser()',' order: \"Order(orderId=1, salesId=11, customerName=zhangsan, customerPhone=15034659999, vehicleId=52, price=120000, createTime=null, status=å¾å®¡æ ¸, createTimeFrom=null, createTimeTo=null)\"','192.168.137.1','2020-07-28 12:53:15','åç½IP|0|0|åç½IP|åç½IP'),(1046,'MrBird','ä¿®æ¹èå/æé®',40,'cc.mrbird.febs.system.controller.MenuController.updateMenu()',' menu: \"Menu(menuId=181, parentId=179, menuName=å®¡æ¹è®¢å, url=/system/order, perms=order:approve, icon=layui-icon-fileprotect, type=0, orderNum=2, createTime=null, modifyTime=Tue Jul 28 14:01:45 CST 2020)\"','192.168.137.1','2020-07-28 14:01:46','åç½IP|0|0|åç½IP|åç½IP'),(1047,'MrBird','ä¿®æ¹èå/æé®',13,'cc.mrbird.febs.system.controller.MenuController.updateMenu()',' menu: \"Menu(menuId=182, parentId=179, menuName=å½æ¡£è®¢å, url=/system/order, perms=order:archive, icon=layui-icon-reconciliation, type=0, orderNum=3, createTime=null, modifyTime=Tue Jul 28 14:01:51 CST 2020)\"','192.168.137.1','2020-07-28 14:01:51','åç½IP|0|0|åç½IP|åç½IP'),(1048,'MrBird','æ°å¢è®¢å',73,'cc.mrbird.febs.system.controller.OrderController.createOrder()',' order: \"Order(orderId=9, salesId=11, customerName=22, customerPhone=12300000000, vehicleId=11, price=200000, createTime=Tue Jul 28 14:15:45 CST 2020, status=å¾å®¡æ ¸, createTimeFrom=null, createTimeTo=null)\"','192.168.137.1','2020-07-28 14:15:45','åç½IP|0|0|åç½IP|åç½IP'),(1049,'MrBird','ä¿®æ¹è®¢å',19,'cc.mrbird.febs.system.controller.OrderController.updateUser()',' order: \"Order(orderId=1, salesId=11, customerName=zhangsan, customerPhone=15034659998, vehicleId=52, price=120000, createTime=null, status=å¾å®¡æ ¸, createTimeFrom=null, createTimeTo=null)\"','192.168.137.1','2020-07-28 14:16:26','åç½IP|0|0|åç½IP|åç½IP'),(1050,'MrBird','ä¿®æ¹èå/æé®',13,'cc.mrbird.febs.system.controller.MenuController.updateMenu()',' menu: \"Menu(menuId=180, parentId=179, menuName=æ°å¢è®¢å, url=/system/order/create, perms=order:create, icon=layui-icon-file-add, type=0, orderNum=1, createTime=null, modifyTime=Tue Jul 28 14:18:27 CST 2020)\"','192.168.137.1','2020-07-28 14:18:28','åç½IP|0|0|åç½IP|åç½IP'),(1051,'MrBird','ä¿®æ¹èå/æé®',18,'cc.mrbird.febs.system.controller.MenuController.updateMenu()',' menu: \"Menu(menuId=181, parentId=179, menuName=å®¡æ¹è®¢å, url=/system/order/approve, perms=order:approve, icon=layui-icon-fileprotect, type=0, orderNum=2, createTime=null, modifyTime=Tue Jul 28 14:18:53 CST 2020)\"','192.168.137.1','2020-07-28 14:18:54','åç½IP|0|0|åç½IP|åç½IP'),(1052,'MrBird','ä¿®æ¹èå/æé®',18,'cc.mrbird.febs.system.controller.MenuController.updateMenu()',' menu: \"Menu(menuId=182, parentId=179, menuName=å½æ¡£è®¢å, url=/system/order/archive, perms=order:archive, icon=layui-icon-reconciliation, type=0, orderNum=3, createTime=null, modifyTime=Tue Jul 28 14:19:03 CST 2020)\"','192.168.137.1','2020-07-28 14:19:03','åç½IP|0|0|åç½IP|åç½IP'),(1053,'MrBird','ä¿®æ¹èå/æé®',20,'cc.mrbird.febs.system.controller.MenuController.updateMenu()',' menu: \"Menu(menuId=179, parentId=0, menuName=è®¢åç®¡ç, url=/system/order/, perms=order:view, icon=layui-icon-filedone, type=0, orderNum=null, createTime=null, modifyTime=Tue Jul 28 14:19:44 CST 2020)\"','192.168.137.1','2020-07-28 14:19:45','åç½IP|0|0|åç½IP|åç½IP'),(1054,'MrBird','å®¡æ¹è®¢å',90,'cc.mrbird.febs.system.controller.OrderController.approveOrder()',' orderIds: \"7\"','192.168.137.1','2020-07-28 14:34:22','åç½IP|0|0|åç½IP|åç½IP'),(1055,'MrBird','æ°å¢è§è²',27,'cc.mrbird.febs.system.controller.RoleController.addRole()',' role: \"Role(roleId=82, roleName=éå®ç»ç, remark=è´è´£ç®¡çéå®äººååè®¢åå®¡æ¹, createTime=Tue Jul 28 14:41:50 CST 2020, modifyTime=null, menuIds=179,180,181,183)\"','192.168.137.1','2020-07-28 14:41:51','åç½IP|0|0|åç½IP|åç½IP'),(1056,'MrBird','ä¿®æ¹è§è²',33,'cc.mrbird.febs.system.controller.RoleController.updateRole()',' role: \"Role(roleId=82, roleName=éå®ç»ç, remark=è´è´£ç®¡çéå®äººååè®¢åå®¡æ¹, createTime=null, modifyTime=Tue Jul 28 14:42:04 CST 2020, menuIds=179,180,181,183,182)\"','192.168.137.1','2020-07-28 14:42:05','åç½IP|0|0|åç½IP|åç½IP'),(1057,'MrBird','æ°å¢è§è²',27,'cc.mrbird.febs.system.controller.RoleController.addRole()',' role: \"Role(roleId=83, roleName=è´¢å¡ä¼è®¡, remark=è´è´£å®¡æ ¸è´¦ååè®¢åæ ¡å¯¹, createTime=Tue Jul 28 14:42:58 CST 2020, modifyTime=null, menuIds=179,181,184)\"','192.168.137.1','2020-07-28 14:42:59','åç½IP|0|0|åç½IP|åç½IP'),(1058,'MrBird','ä¿®æ¹è§è²',27,'cc.mrbird.febs.system.controller.RoleController.updateRole()',' role: \"Role(roleId=81, roleName=éå®äººå, remark=è½¦è¾éå®, createTime=null, modifyTime=Tue Jul 28 14:43:06 CST 2020, menuIds=179,180,182)\"','192.168.137.1','2020-07-28 14:43:07','åç½IP|0|0|åç½IP|åç½IP'),(1059,'MrBird','ä¿®æ¹è§è²',24,'cc.mrbird.febs.system.controller.RoleController.updateRole()',' role: \"Role(roleId=81, roleName=éå®äººå, remark=è½¦è¾éå®, createTime=null, modifyTime=Tue Jul 28 14:43:32 CST 2020, menuIds=179,180,185)\"','192.168.137.1','2020-07-28 14:43:33','åç½IP|0|0|åç½IP|åç½IP'),(1060,'MrBird','ä¿®æ¹èå/æé®',36,'cc.mrbird.febs.system.controller.MenuController.updateMenu()',' menu: \"Menu(menuId=181, parentId=179, menuName=å®¡æ¹è®¢å, url=/system/order/approve, perms=order:approve:manager, icon=layui-icon-fileprotect, type=0, orderNum=2, createTime=null, modifyTime=Tue Jul 28 16:17:49 CST 2020)\"','192.168.137.1','2020-07-28 16:17:49','åç½IP|0|0|åç½IP|åç½IP'),(1061,'MrBird','ä¿®æ¹èå/æé®',12,'cc.mrbird.febs.system.controller.MenuController.updateMenu()',' menu: \"Menu(menuId=185, parentId=181, menuName=äº¤ä»å®¡æ ¸, url=null, perms=order:approve:sales, icon=null, type=1, orderNum=null, createTime=null, modifyTime=Tue Jul 28 16:19:09 CST 2020)\"','192.168.137.1','2020-07-28 16:19:10','åç½IP|0|0|åç½IP|åç½IP'),(1062,'MrBird','ä¿®æ¹èå/æé®',10,'cc.mrbird.febs.system.controller.MenuController.updateMenu()',' menu: \"Menu(menuId=184, parentId=181, menuName=è´¢å¡å®¡æ ¸, url=null, perms=order:approve:accounting, icon=null, type=1, orderNum=null, createTime=null, modifyTime=Tue Jul 28 16:19:20 CST 2020)\"','192.168.137.1','2020-07-28 16:19:21','åç½IP|0|0|åç½IP|åç½IP'),(1063,'MrBird','ä¿®æ¹èå/æé®',24,'cc.mrbird.febs.system.controller.MenuController.updateMenu()',' menu: \"Menu(menuId=183, parentId=181, menuName=éå®å®¡æ ¸, url=null, perms=order:approve:manager, icon=null, type=1, orderNum=null, createTime=null, modifyTime=Tue Jul 28 16:19:25 CST 2020)\"','192.168.137.1','2020-07-28 16:19:26','åç½IP|0|0|åç½IP|åç½IP'),(1064,'MrBird','ä¿®æ¹èå/æé®',10,'cc.mrbird.febs.system.controller.MenuController.updateMenu()',' menu: \"Menu(menuId=183, parentId=181, menuName=ç»çå®¡æ ¸, url=null, perms=order:approve:manager, icon=null, type=1, orderNum=null, createTime=null, modifyTime=Tue Jul 28 16:19:34 CST 2020)\"','192.168.137.1','2020-07-28 16:19:35','åç½IP|0|0|åç½IP|åç½IP'),(1065,'MrBird','ä¿®æ¹èå/æé®',17,'cc.mrbird.febs.system.controller.MenuController.updateMenu()',' menu: \"Menu(menuId=185, parentId=181, menuName=éå®å®¡æ ¸, url=null, perms=order:approve:sales, icon=null, type=1, orderNum=null, createTime=null, modifyTime=Tue Jul 28 16:19:46 CST 2020)\"','192.168.137.1','2020-07-28 16:19:46','åç½IP|0|0|åç½IP|åç½IP'),(1066,'MrBird','ä¿®æ¹èå/æé®',19,'cc.mrbird.febs.system.controller.MenuController.updateMenu()',' menu: \"Menu(menuId=181, parentId=179, menuName=å®¡æ¹è®¢å, url=/system/order/approve, perms=order:approve, icon=layui-icon-fileprotect, type=0, orderNum=2, createTime=null, modifyTime=Tue Jul 28 16:20:00 CST 2020)\"','192.168.137.1','2020-07-28 16:20:00','åç½IP|0|0|åç½IP|åç½IP'),(1067,'MrBird','ä¿®æ¹èå/æé®',17,'cc.mrbird.febs.system.controller.MenuController.updateMenu()',' menu: \"Menu(menuId=181, parentId=179, menuName=å®¡æ¹è®¢å, url=/system/order/approve, perms=, icon=layui-icon-fileprotect, type=0, orderNum=2, createTime=null, modifyTime=Tue Jul 28 16:20:27 CST 2020)\"','192.168.137.1','2020-07-28 16:20:27','åç½IP|0|0|åç½IP|åç½IP'),(1068,'MrBird','ä¿®æ¹èå/æé®',18,'cc.mrbird.febs.system.controller.MenuController.updateMenu()',' menu: \"Menu(menuId=181, parentId=179, menuName=å®¡æ¹è®¢å, url=/system/order/approve, perms=order:approve:manager, icon=layui-icon-fileprotect, type=0, orderNum=2, createTime=null, modifyTime=Tue Jul 28 16:21:02 CST 2020)\"','192.168.137.1','2020-07-28 16:21:03','åç½IP|0|0|åç½IP|åç½IP'),(1069,'MrBird','ä¿®æ¹èå/æé®',15,'cc.mrbird.febs.system.controller.MenuController.updateMenu()',' menu: \"Menu(menuId=181, parentId=179, menuName=å®¡æ¹è®¢å, url=/system/order/approve, perms=order:approve, icon=layui-icon-fileprotect, type=0, orderNum=2, createTime=null, modifyTime=Tue Jul 28 16:21:11 CST 2020)\"','192.168.137.1','2020-07-28 16:21:11','åç½IP|0|0|åç½IP|åç½IP'),(1070,'MrBird','å®¡æ¹è®¢å',43,'cc.mrbird.febs.system.controller.OrderController.managerApproveOrder()',' orderIds: \"8\"','192.168.137.1','2020-07-28 16:28:20','åç½IP|0|0|åç½IP|åç½IP'),(1071,'MrBird','å®¡æ¹è®¢å',10,'cc.mrbird.febs.system.controller.OrderController.managerApproveOrder()',' orderIds: \"8\"','192.168.137.1','2020-07-28 16:28:44','åç½IP|0|0|åç½IP|åç½IP'),(1072,'MrBird','å®¡æ¹è®¢å',99,'cc.mrbird.febs.system.controller.OrderController.managerApproveOrder()',' orderIds: \"8\"','192.168.137.1','2020-07-28 16:33:15','åç½IP|0|0|åç½IP|åç½IP'),(1073,'MrBird','å®¡æ¹è®¢å',28,'cc.mrbird.febs.system.controller.OrderController.accountingApproveOrder()',' orderIds: \"8\"','192.168.137.1','2020-07-28 16:33:19','åç½IP|0|0|åç½IP|åç½IP'),(1074,'MrBird','å®¡æ¹è®¢å',25,'cc.mrbird.febs.system.controller.OrderController.salesApproveOrder()',' orderIds: \"8\"','192.168.137.1','2020-07-28 16:33:24','åç½IP|0|0|åç½IP|åç½IP'),(1075,'MrBird','ä¿®æ¹è§è²',47,'cc.mrbird.febs.system.controller.RoleController.updateRole()',' role: \"Role(roleId=83, roleName=è´¢å¡ä¼è®¡, remark=è´è´£å®¡æ ¸è´¦ååè®¢åæ ¡å¯¹, createTime=null, modifyTime=Tue Jul 28 16:38:56 CST 2020, menuIds=179,181,184)\"','192.168.137.1','2020-07-28 16:38:57','åç½IP|0|0|åç½IP|åç½IP'),(1076,'MrBird','ä¿®æ¹è§è²',40,'cc.mrbird.febs.system.controller.RoleController.updateRole()',' role: \"Role(roleId=83, roleName=è´¢å¡ä¼è®¡, remark=è´è´£å®¡æ ¸è´¦ååä»æ¬¾æ ¡å¯¹, createTime=null, modifyTime=Tue Jul 28 16:39:20 CST 2020, menuIds=179,181,184)\"','192.168.137.1','2020-07-28 16:39:20','åç½IP|0|0|åç½IP|åç½IP'),(1077,'MrBird','å½æ¡£è®¢å',97,'cc.mrbird.febs.system.controller.OrderController.archiveOrder()',' orderIds: \"8\"','192.168.137.1','2020-07-28 19:02:50','åç½IP|0|0|åç½IP|åç½IP'),(1078,'MrBird','å½æ¡£è®¢å',25,'cc.mrbird.febs.system.controller.OrderController.archiveOrder()',' orderIds: \"4\"','192.168.137.1','2020-07-28 19:03:02','åç½IP|0|0|åç½IP|åç½IP'),(1079,'MrBird','å½æ¡£è®¢å',24,'cc.mrbird.febs.system.controller.OrderController.archiveOrder()',' orderIds: \"1\"','192.168.137.1','2020-07-28 19:03:18','åç½IP|0|0|åç½IP|åç½IP'),(1080,'MrBird','æ°å¢è®¢å',31,'cc.mrbird.febs.system.controller.OrderController.createOrder()',' order: \"Order(orderId=10, salesId=15, customerName=oppo, customerPhone=15233002255, vehicleId=11, price=200000, createTime=Tue Jul 28 19:19:26 CST 2020, status=å¾å®¡æ ¸, createTimeFrom=null, createTimeTo=null)\"','192.168.137.1','2020-07-28 19:19:27','åç½IP|0|0|åç½IP|åç½IP'),(1081,'MrBird','ç»çå®¡æ¹è®¢å',23,'cc.mrbird.febs.system.controller.OrderController.managerApproveOrder()',' orderIds: \"10\"','192.168.137.1','2020-07-28 19:19:49','åç½IP|0|0|åç½IP|åç½IP'),(1082,'MrBird','è´¢å¡å®¡æ¹è®¢å',24,'cc.mrbird.febs.system.controller.OrderController.accountingApproveOrder()',' orderIds: \"10\"','192.168.137.1','2020-07-28 19:20:08','åç½IP|0|0|åç½IP|åç½IP'),(1083,'MrBird','éå®å®¡æ¹è®¢å',15,'cc.mrbird.febs.system.controller.OrderController.salesApproveOrder()',' orderIds: \"10\"','192.168.137.1','2020-07-28 19:20:20','åç½IP|0|0|åç½IP|åç½IP'),(1084,'MrBird','å½æ¡£è®¢å',25,'cc.mrbird.febs.system.controller.OrderController.archiveOrder()',' orderIds: \"10\"','192.168.137.1','2020-07-28 19:20:25','åç½IP|0|0|åç½IP|åç½IP'),(1085,'MrBird','ä¿®æ¹è®¢å',15,'cc.mrbird.febs.system.controller.OrderController.updateUser()',' order: \"Order(orderId=1, salesId=12, customerName=zhangsan, customerPhone=15034659998, vehicleId=52, price=120000, createTime=null, status=å¾å®¡æ ¸, createTimeFrom=null, createTimeTo=null)\"','192.168.137.1','2020-07-28 20:13:58','åç½IP|0|0|åç½IP|åç½IP'),(1086,'MrBird','æ°å¢è®¢å',48,'cc.mrbird.febs.system.controller.OrderController.createOrder()',' order: \"Order(orderId=11, salesId=123, customerName=aann, customerPhone=, vehicleId=11, price=20000, createTime=Tue Jul 28 20:22:24 CST 2020, status=å¾å®¡æ ¸, createTimeFrom=null, createTimeTo=null)\"','192.168.137.1','2020-07-28 20:22:25','åç½IP|0|0|åç½IP|åç½IP'),(1087,'MrBird','æ°å¢è®¢å',19,'cc.mrbird.febs.system.controller.OrderController.createOrder()',' order: \"Order(orderId=12, salesId=null, customerName=, customerPhone=, vehicleId=null, price=null, createTime=Tue Jul 28 20:24:38 CST 2020, status=å¾å®¡æ ¸, createTimeFrom=null, createTimeTo=null)\"','192.168.137.1','2020-07-28 20:24:39','åç½IP|0|0|åç½IP|åç½IP'),(1088,'MrBird','æ°å¢è®¢å',16,'cc.mrbird.febs.system.controller.OrderController.createOrder()',' order: \"Order(orderId=13, salesId=null, customerName=, customerPhone=, vehicleId=null, price=null, createTime=Tue Jul 28 20:25:01 CST 2020, status=å¾å®¡æ ¸, createTimeFrom=null, createTimeTo=null)\"','192.168.137.1','2020-07-28 20:25:02','åç½IP|0|0|åç½IP|åç½IP'),(1089,'MrBird','æ°å¢èå/æé®',22,'cc.mrbird.febs.system.controller.MenuController.addMenu()',' menu: \"Menu(menuId=186, parentId=0, menuName=è½¦è¾ç®¡ç, url=, perms=, icon=layui-icon-car, type=0, orderNum=null, createTime=Tue Jul 28 21:46:09 CST 2020, modifyTime=null)\"','192.168.137.1','2020-07-28 21:46:09','åç½IP|0|0|åç½IP|åç½IP'),(1090,'MrBird','ä¿®æ¹èå/æé®',24,'cc.mrbird.febs.system.controller.MenuController.updateMenu()',' menu: \"Menu(menuId=186, parentId=0, menuName=è½¦è¾ç®¡ç, url=system/vehicle, perms=, icon=layui-icon-car, type=0, orderNum=null, createTime=null, modifyTime=Tue Jul 28 21:46:35 CST 2020)\"','192.168.137.1','2020-07-28 21:46:36','åç½IP|0|0|åç½IP|åç½IP'),(1091,'MrBird','ä¿®æ¹èå/æé®',12,'cc.mrbird.febs.system.controller.MenuController.updateMenu()',' menu: \"Menu(menuId=186, parentId=0, menuName=è½¦è¾ç®¡ç, url=system/vehicle/, perms=, icon=layui-icon-car, type=0, orderNum=null, createTime=null, modifyTime=Tue Jul 28 21:46:42 CST 2020)\"','192.168.137.1','2020-07-28 21:46:42','åç½IP|0|0|åç½IP|åç½IP'),(1092,'MrBird','ä¿®æ¹è§è²',98,'cc.mrbird.febs.system.controller.RoleController.updateRole()',' role: \"Role(roleId=1, roleName=ç³»ç»ç®¡çå, remark=ç³»ç»ç®¡çåï¼æ¥ææææä½æé ^_^, createTime=null, modifyTime=Tue Jul 28 22:01:17 CST 2020, menuIds=179,180,181,183,184,185,182,186,1,3,13,160,161,11,12,4,162,14,15,16,5,163,17,18,19,6,164,20,21,22,2,8,23,10,24,170,136,171,172,127,128,129,131,175,101,102,103,104,105,106,107,108,173,109,110,174,137,138,165,139,166,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125,167,168,169,178)\"','192.168.137.1','2020-07-28 22:01:17','åç½IP|0|0|åç½IP|åç½IP'),(1093,'MrBird','æ°å¢èå/æé®',23,'cc.mrbird.febs.system.controller.MenuController.addMenu()',' menu: \"Menu(menuId=187, parentId=0, menuName=æ°å¢è½¦è¾, url=system/vehicle/create, perms=vehicle:create, icon=, type=0, orderNum=null, createTime=Tue Jul 28 22:42:20 CST 2020, modifyTime=null)\"','192.168.137.1','2020-07-28 22:42:20','åç½IP|0|0|åç½IP|åç½IP'),(1094,'MrBird','æ°å¢èå/æé®',11,'cc.mrbird.febs.system.controller.MenuController.addMenu()',' menu: \"Menu(menuId=188, parentId=0, menuName=ä¿å»è½¦è¾, url=system/vehicle/maintenance, perms=vehicle:maintenance, icon=, type=0, orderNum=null, createTime=Tue Jul 28 22:43:26 CST 2020, modifyTime=null)\"','192.168.137.1','2020-07-28 22:43:26','åç½IP|0|0|åç½IP|åç½IP'),(1095,'MrBird','ä¿®æ¹è§è²',49,'cc.mrbird.febs.system.controller.RoleController.updateRole()',' role: \"Role(roleId=1, roleName=ç³»ç»ç®¡çå, remark=ç³»ç»ç®¡çåï¼æ¥ææææä½æé ^_^, createTime=null, modifyTime=Tue Jul 28 22:45:34 CST 2020, menuIds=179,180,181,183,184,185,182,186,187,188,1,3,13,161,11,12,160,4,162,14,15,16,5,163,17,18,19,6,164,20,21,22,2,8,23,10,24,170,136,171,172,127,128,129,131,175,101,102,103,104,105,106,107,108,173,109,110,174,137,138,165,139,166,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125,167,168,169,178)\"','192.168.137.1','2020-07-28 22:45:35','åç½IP|0|0|åç½IP|åç½IP'),(1096,'MrBird','ä¿®æ¹èå/æé®',20,'cc.mrbird.febs.system.controller.MenuController.updateMenu()',' menu: \"Menu(menuId=186, parentId=0, menuName=è½¦è¾ç®¡ç, url=system/vehicle/, perms=vehicle:view, icon=layui-icon-car, type=0, orderNum=null, createTime=null, modifyTime=Tue Jul 28 22:48:24 CST 2020)\"','192.168.137.1','2020-07-28 22:48:25','åç½IP|0|0|åç½IP|åç½IP'),(1097,'MrBird','ä¿®æ¹èå/æé®',26,'cc.mrbird.febs.system.controller.MenuController.updateMenu()',' menu: \"Menu(menuId=186, parentId=0, menuName=è½¦è¾ç®¡ç, url=/system/vehicle/, perms=vehicle:view, icon=layui-icon-car, type=0, orderNum=null, createTime=null, modifyTime=Tue Jul 28 23:08:41 CST 2020)\"','192.168.137.1','2020-07-28 23:08:42','åç½IP|0|0|åç½IP|åç½IP'),(1098,'MrBird','ä¿®æ¹èå/æé®',20,'cc.mrbird.febs.system.controller.MenuController.updateMenu()',' menu: \"Menu(menuId=187, parentId=186, menuName=æ°å¢è½¦è¾, url=/system/vehicle/create, perms=vehicle:create, icon=, type=0, orderNum=null, createTime=null, modifyTime=Tue Jul 28 23:10:03 CST 2020)\"','192.168.137.1','2020-07-28 23:10:04','åç½IP|0|0|åç½IP|åç½IP'),(1099,'MrBird','ä¿®æ¹èå/æé®',10,'cc.mrbird.febs.system.controller.MenuController.updateMenu()',' menu: \"Menu(menuId=188, parentId=186, menuName=ä¿å»è½¦è¾, url=/system/vehicle/maintenance, perms=vehicle:maintenance, icon=, type=0, orderNum=null, createTime=null, modifyTime=Tue Jul 28 23:10:08 CST 2020)\"','192.168.137.1','2020-07-28 23:10:08','åç½IP|0|0|åç½IP|åç½IP'),(1100,'MrBird','æ°å¢ç¨æ·',50,'cc.mrbird.febs.system.controller.UserController.addUser()',' user: \"User(userId=9, username=beiyan, password=67c721ec501e9ae880dc517f9c74e9e2, deptId=2, email=beiyan@qq.com, mobile=15034654506, status=1, createTime=Wed Jul 29 09:42:39 CST 2020, modifyTime=null, lastLoginTime=null, sex=2, avatar=default.jpg, theme=black, isTab=1, description=æµè¯ç®¡çåè´¦å·, deptName=null, createTimeFrom=null, createTimeTo=null, roleId=1, roleName=null, deptIds=null)\"','192.168.137.1','2020-07-29 09:42:39','åç½IP|0|0|åç½IP|åç½IP'),(1101,'MrBird','æ°å¢è½¦è¾',55,'cc.mrbird.febs.system.controller.VehicleController.createVehicle()',' vehicle: \"Vehicle(vehicleId=1, type=suv, color=ç½è², deadWeight=1500, manufactureDate=Wed Jul 29 11:29:27 CST 2020, lowestPrice=200000, status=0, maintenanceTimes=10, manufactureDateFrom=null, manufactureDateTo=null)\"','192.168.137.1','2020-07-29 11:29:28','åç½IP|0|0|åç½IP|åç½IP'),(1102,'MrBird','å é¤èå/æé®',47,'cc.mrbird.febs.system.controller.MenuController.deleteMenus()',' menuIds: \"185\"','192.168.137.1','2020-07-29 13:09:25','åç½IP|0|0|åç½IP|åç½IP'),(1103,'MrBird','å é¤èå/æé®',18,'cc.mrbird.febs.system.controller.MenuController.deleteMenus()',' menuIds: \"184\"','192.168.137.1','2020-07-29 13:09:31','åç½IP|0|0|åç½IP|åç½IP'),(1104,'MrBird','å é¤èå/æé®',29,'cc.mrbird.febs.system.controller.MenuController.deleteMenus()',' menuIds: \"183\"','192.168.137.1','2020-07-29 13:09:38','åç½IP|0|0|åç½IP|åç½IP'),(1105,'MrBird','ä¿®æ¹èå/æé®',23,'cc.mrbird.febs.system.controller.MenuController.updateMenu()',' menu: \"Menu(menuId=179, parentId=0, menuName=å¬å¸ç®¡ç, url=/system/order/, perms=order:view, icon=layui-icon-filedone, type=0, orderNum=null, createTime=null, modifyTime=Wed Jul 29 13:10:39 CST 2020)\"','192.168.137.1','2020-07-29 13:10:40','åç½IP|0|0|åç½IP|åç½IP'),(1106,'MrBird','ä¿®æ¹èå/æé®',22,'cc.mrbird.febs.system.controller.MenuController.updateMenu()',' menu: \"Menu(menuId=180, parentId=179, menuName=è®¢åç®¡ç, url=/system/order/, perms=order:view, icon=layui-icon-file-add, type=0, orderNum=1, createTime=null, modifyTime=Wed Jul 29 13:13:07 CST 2020)\"','192.168.137.1','2020-07-29 13:13:07','åç½IP|0|0|åç½IP|åç½IP'),(1107,'MrBird','ä¿®æ¹èå/æé®',10,'cc.mrbird.febs.system.controller.MenuController.updateMenu()',' menu: \"Menu(menuId=179, parentId=0, menuName=å¬å¸ç®¡ç, url=, perms=, icon=layui-icon-home, type=0, orderNum=null, createTime=null, modifyTime=Wed Jul 29 13:15:27 CST 2020)\"','192.168.137.1','2020-07-29 13:15:28','åç½IP|0|0|åç½IP|åç½IP'),(1108,'MrBird','ä¿®æ¹èå/æé®',17,'cc.mrbird.febs.system.controller.MenuController.updateMenu()',' menu: \"Menu(menuId=180, parentId=179, menuName=è®¢åç®¡ç, url=/system/order/, perms=order:view, icon=layui-icon-filedone, type=0, orderNum=1, createTime=null, modifyTime=Wed Jul 29 13:16:23 CST 2020)\"','192.168.137.1','2020-07-29 13:16:23','åç½IP|0|0|åç½IP|åç½IP'),(1109,'MrBird','ä¿®æ¹è§è²',69,'cc.mrbird.febs.system.controller.RoleController.updateRole()',' role: \"Role(roleId=1, roleName=ç³»ç»ç®¡çå, remark=ç³»ç»ç®¡çåï¼æ¥ææææä½æé ^_^, createTime=null, modifyTime=Wed Jul 29 13:18:02 CST 2020, menuIds=179,186,187,188,180,181,182,1,3,13,160,161,11,12,4,162,14,15,16,5,163,17,18,19,6,164,20,21,22,2,8,23,10,24,170,136,171,172,127,128,129,131,175,101,102,173,103,104,105,106,107,108,109,110,174,137,138,165,139,166,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125,167,168,169,178)\"','192.168.137.1','2020-07-29 13:18:02','åç½IP|0|0|åç½IP|åç½IP'),(1110,'MrBird','æ°å¢èå/æé®',18,'cc.mrbird.febs.system.controller.MenuController.addMenu()',' menu: \"Menu(menuId=189, parentId=0, menuName=ç»çå®¡æ¹, url=null, perms=order:approve:manager, icon=null, type=1, orderNum=null, createTime=Wed Jul 29 13:23:53 CST 2020, modifyTime=null)\"','192.168.137.1','2020-07-29 13:23:53','åç½IP|0|0|åç½IP|åç½IP'),(1111,'MrBird','ä¿®æ¹è§è²',65,'cc.mrbird.febs.system.controller.RoleController.updateRole()',' role: \"Role(roleId=1, roleName=ç³»ç»ç®¡çå, remark=ç³»ç»ç®¡çåï¼æ¥ææææä½æé ^_^, createTime=null, modifyTime=Wed Jul 29 13:24:58 CST 2020, menuIds=179,186,187,188,180,181,189,182,1,3,13,160,161,11,12,4,162,14,15,16,5,163,17,18,19,6,164,20,21,22,2,8,23,10,24,170,136,171,172,127,128,129,131,175,101,102,103,104,105,106,107,108,173,109,110,174,137,138,165,139,166,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125,167,168,169,178)\"','192.168.137.1','2020-07-29 13:24:59','åç½IP|0|0|åç½IP|åç½IP'),(1112,'MrBird','ä¿®æ¹èå/æé®',10,'cc.mrbird.febs.system.controller.MenuController.updateMenu()',' menu: \"Menu(menuId=189, parentId=181, menuName=å®¡æ¹, url=null, perms=order:approve:manager, icon=null, type=1, orderNum=null, createTime=null, modifyTime=Wed Jul 29 13:39:38 CST 2020)\"','192.168.137.1','2020-07-29 13:39:39','åç½IP|0|0|åç½IP|åç½IP'),(1113,'MrBird','ä¿®æ¹èå/æé®',18,'cc.mrbird.febs.system.controller.MenuController.updateMenu()',' menu: \"Menu(menuId=189, parentId=180, menuName=ç»çå®¡æ¹, url=null, perms=order:approve:manager, icon=null, type=1, orderNum=null, createTime=null, modifyTime=Wed Jul 29 13:40:52 CST 2020)\"','192.168.137.1','2020-07-29 13:40:53','åç½IP|0|0|åç½IP|åç½IP'),(1114,'MrBird','æ°å¢èå/æé®',8,'cc.mrbird.febs.system.controller.MenuController.addMenu()',' menu: \"Menu(menuId=190, parentId=180, menuName=æ°å¢è®¢å, url=null, perms=order:create, icon=null, type=1, orderNum=null, createTime=Wed Jul 29 13:41:29 CST 2020, modifyTime=null)\"','192.168.137.1','2020-07-29 13:41:29','åç½IP|0|0|åç½IP|åç½IP'),(1115,'MrBird','æ°å¢èå/æé®',18,'cc.mrbird.febs.system.controller.MenuController.addMenu()',' menu: \"Menu(menuId=191, parentId=180, menuName=è´¢å¡å®¡æ¹, url=null, perms=order:approve:accounting, icon=null, type=1, orderNum=null, createTime=Wed Jul 29 13:42:37 CST 2020, modifyTime=null)\"','192.168.137.1','2020-07-29 13:42:37','åç½IP|0|0|åç½IP|åç½IP'),(1116,'MrBird','æ°å¢èå/æé®',17,'cc.mrbird.febs.system.controller.MenuController.addMenu()',' menu: \"Menu(menuId=192, parentId=180, menuName=äº¤ä»å®¡æ¹, url=null, perms=order:approve:sales, icon=null, type=1, orderNum=null, createTime=Wed Jul 29 13:43:27 CST 2020, modifyTime=null)\"','192.168.137.1','2020-07-29 13:43:27','åç½IP|0|0|åç½IP|åç½IP'),(1117,'MrBird','ä¿®æ¹è§è²',47,'cc.mrbird.febs.system.controller.RoleController.updateRole()',' role: \"Role(roleId=1, roleName=ç³»ç»ç®¡çå, remark=ç³»ç»ç®¡çåï¼æ¥ææææä½æé ^_^, createTime=null, modifyTime=Wed Jul 29 13:43:49 CST 2020, menuIds=179,186,187,188,180,189,190,191,192,181,182,1,3,13,161,11,12,160,4,162,14,15,16,5,163,17,18,19,6,164,20,21,22,2,8,23,10,24,170,136,171,172,127,128,129,131,175,101,102,103,104,105,106,107,108,173,109,110,174,137,138,165,139,166,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125,167,168,169,178)\"','192.168.137.1','2020-07-29 13:43:50','åç½IP|0|0|åç½IP|åç½IP'),(1118,'MrBird','ä¿®æ¹èå/æé®',16,'cc.mrbird.febs.system.controller.MenuController.updateMenu()',' menu: \"Menu(menuId=187, parentId=186, menuName=æ°å¢è½¦è¾, url=/system/vehicle/create, perms=vehicle:create, icon=, type=0, orderNum=1, createTime=null, modifyTime=Wed Jul 29 13:45:50 CST 2020)\"','192.168.137.1','2020-07-29 13:45:50','åç½IP|0|0|åç½IP|åç½IP'),(1119,'MrBird','ä¿®æ¹èå/æé®',9,'cc.mrbird.febs.system.controller.MenuController.updateMenu()',' menu: \"Menu(menuId=188, parentId=186, menuName=ä¿å»è½¦è¾, url=/system/vehicle/maintenance, perms=vehicle:maintenance, icon=, type=0, orderNum=3, createTime=null, modifyTime=Wed Jul 29 13:45:58 CST 2020)\"','192.168.137.1','2020-07-29 13:45:59','åç½IP|0|0|åç½IP|åç½IP'),(1120,'MrBird','æ°å¢èå/æé®',6,'cc.mrbird.febs.system.controller.MenuController.addMenu()',' menu: \"Menu(menuId=193, parentId=186, menuName=åºå®è½¦è¾, url=, perms=vehicle:sale, icon=, type=0, orderNum=2, createTime=Wed Jul 29 13:46:34 CST 2020, modifyTime=null)\"','192.168.137.1','2020-07-29 13:46:35','åç½IP|0|0|åç½IP|åç½IP'),(1121,'MrBird','å é¤èå/æé®',24,'cc.mrbird.febs.system.controller.MenuController.deleteMenus()',' menuIds: \"187\"','192.168.137.1','2020-07-29 13:49:06','åç½IP|0|0|åç½IP|åç½IP'),(1122,'MrBird','æ°å¢èå/æé®',6,'cc.mrbird.febs.system.controller.MenuController.addMenu()',' menu: \"Menu(menuId=194, parentId=186, menuName=æ°å¢è½¦è¾, url=null, perms=vehicle:create, icon=null, type=1, orderNum=null, createTime=Wed Jul 29 13:49:27 CST 2020, modifyTime=null)\"','192.168.137.1','2020-07-29 13:49:28','åç½IP|0|0|åç½IP|åç½IP'),(1123,'MrBird','ä¿®æ¹è§è²',54,'cc.mrbird.febs.system.controller.RoleController.updateRole()',' role: \"Role(roleId=1, roleName=ç³»ç»ç®¡çå, remark=ç³»ç»ç®¡çåï¼æ¥ææææä½æé ^_^, createTime=null, modifyTime=Wed Jul 29 13:49:50 CST 2020, menuIds=179,186,187,188,180,189,190,191,192,181,182,1,3,13,161,11,12,160,4,162,14,15,16,5,163,17,18,19,6,164,20,21,22,2,8,23,10,24,170,136,171,172,127,128,129,131,175,101,102,103,104,105,106,107,108,173,109,110,174,137,138,165,139,166,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125,167,168,169,178)\"','192.168.137.1','2020-07-29 13:49:50','åç½IP|0|0|åç½IP|åç½IP'),(1124,'MrBird','ä¿®æ¹è§è²',47,'cc.mrbird.febs.system.controller.RoleController.updateRole()',' role: \"Role(roleId=1, roleName=ç³»ç»ç®¡çå, remark=ç³»ç»ç®¡çåï¼æ¥ææææä½æé ^_^, createTime=null, modifyTime=Wed Jul 29 13:50:13 CST 2020, menuIds=179,186,194,193,188,180,189,190,191,192,181,182,1,3,13,160,161,11,12,4,162,14,15,16,5,163,17,18,19,6,164,20,21,22,2,8,23,10,24,170,136,171,172,127,128,129,131,175,101,102,103,104,105,106,107,108,173,109,110,174,137,138,165,139,166,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125,167,168,169,178)\"','192.168.137.1','2020-07-29 13:50:13','åç½IP|0|0|åç½IP|åç½IP'),(1125,'MrBird','æ°å¢èå/æé®',17,'cc.mrbird.febs.system.controller.MenuController.addMenu()',' menu: \"Menu(menuId=195, parentId=180, menuName=ä¿®æ¹è®¢å, url=null, perms=order:update, icon=null, type=1, orderNum=null, createTime=Wed Jul 29 13:57:58 CST 2020, modifyTime=null)\"','192.168.137.1','2020-07-29 13:57:59','åç½IP|0|0|åç½IP|åç½IP'),(1126,'MrBird','ä¿®æ¹èå/æé®',15,'cc.mrbird.febs.system.controller.MenuController.updateMenu()',' menu: \"Menu(menuId=195, parentId=180, menuName=ä¿®æ¹è®¢å, url=null, perms=order:approve, icon=null, type=1, orderNum=null, createTime=null, modifyTime=Wed Jul 29 13:58:43 CST 2020)\"','192.168.137.1','2020-07-29 13:58:43','åç½IP|0|0|åç½IP|åç½IP'),(1127,'MrBird','å é¤èå/æé®',46,'cc.mrbird.febs.system.controller.MenuController.deleteMenus()',' menuIds: \"179,195\"','192.168.137.1','2020-07-29 13:59:36','åç½IP|0|0|åç½IP|åç½IP'),(1128,'MrBird','æ°å¢èå/æé®',9,'cc.mrbird.febs.system.controller.MenuController.addMenu()',' menu: \"Menu(menuId=196, parentId=0, menuName=å¬å¸ç®¡ç, url=, perms=, icon=layui-icon-home, type=0, orderNum=null, createTime=Wed Jul 29 14:01:31 CST 2020, modifyTime=null)\"','192.168.137.1','2020-07-29 14:01:32','åç½IP|0|0|åç½IP|åç½IP'),(1129,'MrBird','æ°å¢èå/æé®',15,'cc.mrbird.febs.system.controller.MenuController.addMenu()',' menu: \"Menu(menuId=197, parentId=196, menuName=è®¢åç®¡ç, url=/system/order/, perms=order:view, icon=layui-icon-filedone, type=0, orderNum=1, createTime=Wed Jul 29 14:02:14 CST 2020, modifyTime=null)\"','192.168.137.1','2020-07-29 14:02:14','åç½IP|0|0|åç½IP|åç½IP'),(1130,'MrBird','æ°å¢èå/æé®',7,'cc.mrbird.febs.system.controller.MenuController.addMenu()',' menu: \"Menu(menuId=198, parentId=197, menuName=æ°å¢è®¢å, url=null, perms=order:create, icon=null, type=1, orderNum=null, createTime=Wed Jul 29 14:02:35 CST 2020, modifyTime=null)\"','192.168.137.1','2020-07-29 14:02:35','åç½IP|0|0|åç½IP|åç½IP'),(1131,'MrBird','æ°å¢èå/æé®',13,'cc.mrbird.febs.system.controller.MenuController.addMenu()',' menu: \"Menu(menuId=199, parentId=197, menuName=ç»çå®¡æ¹, url=null, perms=order:approve:manager, icon=null, type=1, orderNum=null, createTime=Wed Jul 29 14:04:16 CST 2020, modifyTime=null)\"','192.168.137.1','2020-07-29 14:04:17','åç½IP|0|0|åç½IP|åç½IP'),(1132,'MrBird','æ°å¢èå/æé®',21,'cc.mrbird.febs.system.controller.MenuController.addMenu()',' menu: \"Menu(menuId=200, parentId=197, menuName=è´¢å¡å®¡æ¹, url=null, perms=order:approve:accounting, icon=null, type=1, orderNum=null, createTime=Wed Jul 29 14:04:43 CST 2020, modifyTime=null)\"','192.168.137.1','2020-07-29 14:04:43','åç½IP|0|0|åç½IP|åç½IP'),(1133,'MrBird','æ°å¢èå/æé®',17,'cc.mrbird.febs.system.controller.MenuController.addMenu()',' menu: \"Menu(menuId=201, parentId=197, menuName=äº¤ä»å®¡æ¹, url=null, perms=order:approve:sales, icon=null, type=1, orderNum=null, createTime=Wed Jul 29 14:05:10 CST 2020, modifyTime=null)\"','192.168.137.1','2020-07-29 14:05:10','åç½IP|0|0|åç½IP|åç½IP'),(1134,'MrBird','æ°å¢èå/æé®',16,'cc.mrbird.febs.system.controller.MenuController.addMenu()',' menu: \"Menu(menuId=202, parentId=197, menuName=å½æ¡£è®¢å, url=null, perms=order:archive, icon=null, type=1, orderNum=null, createTime=Wed Jul 29 14:05:41 CST 2020, modifyTime=null)\"','192.168.137.1','2020-07-29 14:05:41','åç½IP|0|0|åç½IP|åç½IP'),(1135,'MrBird','æ°å¢èå/æé®',17,'cc.mrbird.febs.system.controller.MenuController.addMenu()',' menu: \"Menu(menuId=203, parentId=197, menuName=å®¡æ¹è®¢å, url=/system/order/approve, perms=order:approve, icon=, type=0, orderNum=null, createTime=Wed Jul 29 14:06:47 CST 2020, modifyTime=null)\"','192.168.137.1','2020-07-29 14:06:48','åç½IP|0|0|åç½IP|åç½IP'),(1136,'MrBird','æ°å¢èå/æé®',8,'cc.mrbird.febs.system.controller.MenuController.addMenu()',' menu: \"Menu(menuId=204, parentId=197, menuName=å½æ¡£è®¢å, url=/system/order/archive, perms=order:archive, icon=, type=0, orderNum=null, createTime=Wed Jul 29 14:07:38 CST 2020, modifyTime=null)\"','192.168.137.1','2020-07-29 14:07:38','åç½IP|0|0|åç½IP|åç½IP'),(1137,'MrBird','å é¤èå/æé®',17,'cc.mrbird.febs.system.controller.MenuController.deleteMenus()',' menuIds: \"202\"','192.168.137.1','2020-07-29 14:07:53','åç½IP|0|0|åç½IP|åç½IP'),(1138,'MrBird','æ°å¢èå/æé®',18,'cc.mrbird.febs.system.controller.MenuController.addMenu()',' menu: \"Menu(menuId=205, parentId=196, menuName=è½¦è¾ç®¡ç, url=/system/vehicle, perms=vehicle:view, icon=layui-icon-car, type=0, orderNum=2, createTime=Wed Jul 29 14:09:46 CST 2020, modifyTime=null)\"','192.168.137.1','2020-07-29 14:09:46','åç½IP|0|0|åç½IP|åç½IP'),(1139,'MrBird','æ°å¢èå/æé®',16,'cc.mrbird.febs.system.controller.MenuController.addMenu()',' menu: \"Menu(menuId=206, parentId=205, menuName=æ°å¢è½¦è¾, url=null, perms=vehicle:create, icon=null, type=1, orderNum=null, createTime=Wed Jul 29 14:10:49 CST 2020, modifyTime=null)\"','192.168.137.1','2020-07-29 14:10:49','åç½IP|0|0|åç½IP|åç½IP'),(1140,'MrBird','æ°å¢èå/æé®',16,'cc.mrbird.febs.system.controller.MenuController.addMenu()',' menu: \"Menu(menuId=207, parentId=205, menuName=åºå®è½¦è¾, url=null, perms=vehicle:sale, icon=null, type=1, orderNum=null, createTime=Wed Jul 29 14:11:20 CST 2020, modifyTime=null)\"','192.168.137.1','2020-07-29 14:11:20','åç½IP|0|0|åç½IP|åç½IP'),(1141,'MrBird','æ°å¢èå/æé®',16,'cc.mrbird.febs.system.controller.MenuController.addMenu()',' menu: \"Menu(menuId=208, parentId=205, menuName=ä¿å»è½¦è¾, url=null, perms=vehicle:maintenance, icon=null, type=1, orderNum=null, createTime=Wed Jul 29 14:12:54 CST 2020, modifyTime=null)\"','192.168.137.1','2020-07-29 14:12:54','åç½IP|0|0|åç½IP|åç½IP'),(1142,'MrBird','ä¿®æ¹è§è²',49,'cc.mrbird.febs.system.controller.RoleController.updateRole()',' role: \"Role(roleId=1, roleName=ç³»ç»ç®¡çå, remark=ç³»ç»ç®¡çåï¼æ¥ææææä½æé ^_^, createTime=null, modifyTime=Wed Jul 29 14:13:24 CST 2020, menuIds=196,197,198,199,200,201,203,204,205,206,207,208,1,3,13,11,12,160,161,4,14,15,16,162,5,163,17,18,19,6,164,20,21,22,2,8,23,10,170,24,136,171,172,127,128,129,131,175,101,102,103,104,105,106,107,108,173,109,110,174,137,138,165,139,166,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125,167,168,169,178)\"','192.168.137.1','2020-07-29 14:13:24','åç½IP|0|0|åç½IP|åç½IP'),(1143,'MrBird','æ°å¢è½¦è¾',20,'cc.mrbird.febs.system.controller.VehicleController.createVehicle()',' vehicle: \"Vehicle(vehicleId=2, type=suv, color=é»è², deadWeight=1400, manufactureDate=Wed Jul 29 14:27:09 CST 2020, lowestPrice=190000, status=0, maintenanceTimes=10, manufactureDateFrom=null, manufactureDateTo=null)\"','192.168.137.1','2020-07-29 14:27:09','åç½IP|0|0|åç½IP|åç½IP'),(1144,'MrBird','æ°å¢è½¦è¾',18,'cc.mrbird.febs.system.controller.VehicleController.createVehicle()',' vehicle: \"Vehicle(vehicleId=3, type=suv, color=å®è, deadWeight=1600, manufactureDate=Wed Jul 29 14:31:32 CST 2020, lowestPrice=300000, status=0, maintenanceTimes=20, manufactureDateFrom=null, manufactureDateTo=null)\"','192.168.137.1','2020-07-29 14:31:32','åç½IP|0|0|åç½IP|åç½IP'),(1145,'MrBird','ä¿®æ¹èå/æé®',33,'cc.mrbird.febs.system.controller.MenuController.updateMenu()',' menu: \"Menu(menuId=207, parentId=205, menuName=ä¿®æ¹æå é¤è½¦è¾, url=null, perms=vehicle:modify, icon=null, type=1, orderNum=null, createTime=null, modifyTime=Wed Jul 29 15:03:50 CST 2020)\"','192.168.137.1','2020-07-29 15:03:50','åç½IP|0|0|åç½IP|åç½IP'),(1146,'MrBird','æ°å¢è½¦è¾',47,'cc.mrbird.febs.system.controller.VehicleController.createVehicle()',' vehicle: \"Vehicle(vehicleId=4, type=å°åè½¦, color=ç½è², deadWeight=1000, manufactureDate=Wed Jul 29 15:54:51 CST 2020, lowestPrice=30000, status=0, maintenanceTimes=5, manufactureDateFrom=null, manufactureDateTo=null)\"','192.168.137.1','2020-07-29 15:54:52','åç½IP|0|0|åç½IP|åç½IP'),(1147,'MrBird','å é¤è½¦è¾',44,'cc.mrbird.febs.system.controller.VehicleController.deleteVehicles()',' vehicleIds: \"1\"','192.168.137.1','2020-07-29 16:02:43','åç½IP|0|0|åç½IP|åç½IP'),(1148,'MrBird','å é¤è½¦è¾',1,'cc.mrbird.febs.system.controller.VehicleController.deleteVehicles()',' vehicleIds: \"1\"','192.168.137.1','2020-07-29 16:03:03','åç½IP|0|0|åç½IP|åç½IP'),(1149,'MrBird','å é¤è½¦è¾',3,'cc.mrbird.febs.system.controller.VehicleController.deleteVehicles()',' vehicleIds: \"3\"','192.168.137.1','2020-07-29 16:03:40','åç½IP|0|0|åç½IP|åç½IP'),(1150,'MrBird','å é¤è½¦è¾',8,'cc.mrbird.febs.system.controller.VehicleController.deleteVehicles()',' vehicleIds: \"2\"','192.168.137.1','2020-07-29 16:03:44','åç½IP|0|0|åç½IP|åç½IP'),(1151,'MrBird','æ°å¢èå/æé®',30,'cc.mrbird.febs.system.controller.MenuController.addMenu()',' menu: \"Menu(menuId=209, parentId=205, menuName=åºå®è½¦è¾, url=null, perms=vehicle:sale, icon=null, type=1, orderNum=null, createTime=Wed Jul 29 16:38:21 CST 2020, modifyTime=null)\"','192.168.137.1','2020-07-29 16:38:21','åç½IP|0|0|åç½IP|åç½IP'),(1152,'MrBird','ä¿®æ¹è§è²',105,'cc.mrbird.febs.system.controller.RoleController.updateRole()',' role: \"Role(roleId=1, roleName=ç³»ç»ç®¡çå, remark=ç³»ç»ç®¡çåï¼æ¥ææææä½æé ^_^, createTime=null, modifyTime=Wed Jul 29 16:38:34 CST 2020, menuIds=196,197,199,200,201,203,204,198,205,206,207,208,209,1,3,13,11,12,160,161,4,14,15,16,162,5,163,17,18,19,6,164,20,21,22,2,8,23,10,170,24,136,171,172,127,128,129,131,175,101,102,103,104,105,106,107,108,173,109,110,174,137,138,165,139,166,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125,167,168,169,178)\"','192.168.137.1','2020-07-29 16:38:35','åç½IP|0|0|åç½IP|åç½IP'),(1153,'MrBird','åºå®è½¦è¾',44,'cc.mrbird.febs.system.controller.VehicleController.saleVehicles()',' vehicleIds: \"1\"','192.168.137.1','2020-07-29 16:38:52','åç½IP|0|0|åç½IP|åç½IP'),(1154,'MrBird','ä¿å»è½¦è¾',27,'cc.mrbird.febs.system.controller.VehicleController.maintenanceVehicles()',' vehicleIds: \"1\"','192.168.137.1','2020-07-29 16:39:02','åç½IP|0|0|åç½IP|åç½IP'),(1155,'MrBird','å é¤è½¦è¾',21,'cc.mrbird.febs.system.controller.VehicleController.deleteVehicles()',' vehicleId: \"4\"','192.168.137.1','2020-07-29 16:39:15','åç½IP|0|0|åç½IP|åç½IP'),(1156,'MrBird','æ°å¢èå/æé®',70,'cc.mrbird.febs.system.controller.MenuController.addMenu()',' menu: \"Menu(menuId=210, parentId=205, menuName=åºå®è½¦è¾, url=system/vehicle/sale, perms=, icon=, type=0, orderNum=null, createTime=Wed Jul 29 17:01:48 CST 2020, modifyTime=null)\"','192.168.137.1','2020-07-29 17:01:49','åç½IP|0|0|åç½IP|åç½IP'),(1157,'MrBird','æ°å¢èå/æé®',11,'cc.mrbird.febs.system.controller.MenuController.addMenu()',' menu: \"Menu(menuId=211, parentId=205, menuName=ä¿å»è½¦è¾, url=system/vehicle/maintenance, perms=, icon=, type=0, orderNum=null, createTime=Wed Jul 29 17:02:17 CST 2020, modifyTime=null)\"','192.168.137.1','2020-07-29 17:02:18','åç½IP|0|0|åç½IP|åç½IP'),(1158,'MrBird','ä¿®æ¹èå/æé®',26,'cc.mrbird.febs.system.controller.MenuController.updateMenu()',' menu: \"Menu(menuId=210, parentId=205, menuName=åºå®è½¦è¾, url=/system/vehicle/sale, perms=, icon=, type=0, orderNum=null, createTime=null, modifyTime=Wed Jul 29 17:02:32 CST 2020)\"','192.168.137.1','2020-07-29 17:02:33','åç½IP|0|0|åç½IP|åç½IP'),(1159,'MrBird','å é¤èå/æé®',31,'cc.mrbird.febs.system.controller.MenuController.deleteMenus()',' menuIds: \"209\"','192.168.137.1','2020-07-29 17:02:45','åç½IP|0|0|åç½IP|åç½IP'),(1160,'MrBird','ä¿®æ¹èå/æé®',10,'cc.mrbird.febs.system.controller.MenuController.updateMenu()',' menu: \"Menu(menuId=210, parentId=205, menuName=åºå®è½¦è¾, url=/system/vehicle/sale, perms=vehicle:sale, icon=, type=0, orderNum=1, createTime=null, modifyTime=Wed Jul 29 17:02:52 CST 2020)\"','192.168.137.1','2020-07-29 17:02:53','åç½IP|0|0|åç½IP|åç½IP'),(1161,'MrBird','å é¤èå/æé®',16,'cc.mrbird.febs.system.controller.MenuController.deleteMenus()',' menuIds: \"208\"','192.168.137.1','2020-07-29 17:03:09','åç½IP|0|0|åç½IP|åç½IP'),(1162,'MrBird','ä¿®æ¹èå/æé®',16,'cc.mrbird.febs.system.controller.MenuController.updateMenu()',' menu: \"Menu(menuId=211, parentId=205, menuName=ä¿å»è½¦è¾, url=system/vehicle/maintenance, perms=vehicle:maintenance, icon=, type=0, orderNum=2, createTime=null, modifyTime=Wed Jul 29 17:03:21 CST 2020)\"','192.168.137.1','2020-07-29 17:03:21','åç½IP|0|0|åç½IP|åç½IP'),(1163,'MrBird','ä¿®æ¹è§è²',78,'cc.mrbird.febs.system.controller.RoleController.updateRole()',' role: \"Role(roleId=1, roleName=ç³»ç»ç®¡çå, remark=ç³»ç»ç®¡çåï¼æ¥ææææä½æé ^_^, createTime=null, modifyTime=Wed Jul 29 17:03:49 CST 2020, menuIds=196,197,199,200,201,203,204,198,205,206,207,210,211,1,3,13,161,11,12,160,4,162,14,15,16,5,163,17,18,19,6,164,20,21,22,2,8,23,10,24,170,136,171,172,127,128,129,131,175,101,102,103,104,105,106,107,108,173,109,110,174,137,138,165,139,166,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125,167,168,169,178)\"','192.168.137.1','2020-07-29 17:03:49','åç½IP|0|0|åç½IP|åç½IP'),(1164,'MrBird','åºå®è½¦è¾',17,'cc.mrbird.febs.system.controller.VehicleController.saleVehicles()',' vehicleIds: \"2\"','192.168.137.1','2020-07-29 17:10:50','åç½IP|0|0|åç½IP|åç½IP'),(1165,'MrBird','åºå®è½¦è¾',31,'cc.mrbird.febs.system.controller.VehicleController.saleVehicles()',' vehicleIds: \"1,2,3\"','192.168.137.1','2020-07-29 17:14:54','åç½IP|0|0|åç½IP|åç½IP'),(1166,'MrBird','ä¿®æ¹èå/æé®',17,'cc.mrbird.febs.system.controller.MenuController.updateMenu()',' menu: \"Menu(menuId=211, parentId=205, menuName=ä¿å»è½¦è¾, url=/system/vehicle/maintenance, perms=vehicle:maintenance, icon=, type=0, orderNum=2, createTime=null, modifyTime=Wed Jul 29 17:16:47 CST 2020)\"','192.168.137.1','2020-07-29 17:16:48','åç½IP|0|0|åç½IP|åç½IP'),(1167,'MrBird','ä¿å»è½¦è¾',28,'cc.mrbird.febs.system.controller.VehicleController.maintenanceVehicles()',' vehicleIds: \"1\"','192.168.137.1','2020-07-29 17:16:58','åç½IP|0|0|åç½IP|åç½IP'),(1168,'MrBird','ä¿å»è½¦è¾',41,'cc.mrbird.febs.system.controller.VehicleController.maintenanceVehicles()',' vehicleIds: \"1,2,3\"','192.168.137.1','2020-07-29 17:17:03','åç½IP|0|0|åç½IP|åç½IP'),(1169,'MrBird','æ°å¢èå/æé®',31,'cc.mrbird.febs.system.controller.MenuController.addMenu()',' menu: \"Menu(menuId=212, parentId=196, menuName=å®¢æ·ç®¡ç, url=/system/customer/, perms=customer:view, icon=layui-icon-team, type=0, orderNum=3, createTime=Wed Jul 29 22:37:50 CST 2020, modifyTime=null)\"','192.168.137.1','2020-07-29 22:37:50','åç½IP|0|0|åç½IP|åç½IP'),(1170,'MrBird','æ°å¢èå/æé®',18,'cc.mrbird.febs.system.controller.MenuController.addMenu()',' menu: \"Menu(menuId=213, parentId=212, menuName=æ°å¢å®¢æ·, url=null, perms=customer:create, icon=null, type=1, orderNum=null, createTime=Wed Jul 29 22:38:45 CST 2020, modifyTime=null)\"','192.168.137.1','2020-07-29 22:38:45','åç½IP|0|0|åç½IP|åç½IP'),(1171,'MrBird','æ°å¢èå/æé®',20,'cc.mrbird.febs.system.controller.MenuController.addMenu()',' menu: \"Menu(menuId=214, parentId=212, menuName=ä¿®æ¹ç¨æ·, url=null, perms=customer:update, icon=null, type=1, orderNum=null, createTime=Wed Jul 29 22:39:20 CST 2020, modifyTime=null)\"','192.168.137.1','2020-07-29 22:39:20','åç½IP|0|0|åç½IP|åç½IP'),(1172,'MrBird','æ°å¢èå/æé®',18,'cc.mrbird.febs.system.controller.MenuController.addMenu()',' menu: \"Menu(menuId=215, parentId=212, menuName=å é¤å®¢æ·, url=null, perms=customer:delete, icon=null, type=1, orderNum=null, createTime=Wed Jul 29 22:40:15 CST 2020, modifyTime=null)\"','192.168.137.1','2020-07-29 22:40:16','åç½IP|0|0|åç½IP|åç½IP'),(1173,'MrBird','ä¿®æ¹è§è²',77,'cc.mrbird.febs.system.controller.RoleController.updateRole()',' role: \"Role(roleId=1, roleName=ç³»ç»ç®¡çå, remark=ç³»ç»ç®¡çåï¼æ¥ææææä½æé ^_^, createTime=null, modifyTime=Wed Jul 29 22:40:28 CST 2020, menuIds=196,197,203,200,199,198,201,204,205,206,207,210,211,212,213,214,215,1,3,11,12,13,161,160,4,14,162,15,16,5,163,17,18,19,6,20,21,22,164,2,8,23,10,24,170,136,172,171,127,128,129,131,175,101,102,103,104,105,106,107,108,173,109,174,110,137,138,165,139,166,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125,169,168,167,178)\"','192.168.137.1','2020-07-29 22:40:29','åç½IP|0|0|åç½IP|åç½IP'),(1174,'MrBird','æ°å¢å®¢æ·',89,'cc.mrbird.febs.system.controller.CustomerController.createCustomer()',' customer: \"Customer(customerId=1, name=å¼ ä¸, gender=0, phone=15533334444, purchasingDate=Wed Jul 29 13:44:11 CST 2020, vehicleId=11, purchasingDateFrom=null, purchasingDateTo=null)\"','192.168.137.1','2020-07-29 23:19:39','åç½IP|0|0|åç½IP|åç½IP'),(1175,'MrBird','æ°å¢å®¢æ·',12,'cc.mrbird.febs.system.controller.CustomerController.createCustomer()',' customer: \"Customer(customerId=2, name=æå, gender=1, phone=12333335555, purchasingDate=Wed Jul 29 12:33:16 CST 2020, vehicleId=22, purchasingDateFrom=null, purchasingDateTo=null)\"','192.168.137.1','2020-07-29 23:25:56','åç½IP|0|0|åç½IP|åç½IP'),(1176,'MrBird','æ°å¢å®¢æ·',12,'cc.mrbird.febs.system.controller.CustomerController.createCustomer()',' customer: \"Customer(customerId=3, name=çäº, gender=0, phone=12654789632, purchasingDate=Sat Jul 11 12:00:00 CST 2020, vehicleId=22, purchasingDateFrom=null, purchasingDateTo=null)\"','192.168.137.1','2020-07-29 23:27:30','åç½IP|0|0|åç½IP|åç½IP'),(1177,'MrBird','æ°å¢è½¦è¾',50,'cc.mrbird.febs.system.controller.VehicleController.createVehicle()',' vehicle: \"Vehicle(vehicleId=5, type=å°åè½¦, color=ç½è², deadWeight=10000, manufactureDate=Wed Jul 29 23:32:21 CST 2020, lowestPrice=40000, status=0, maintenanceTimes=6, manufactureDateFrom=null, manufactureDateTo=null)\"','192.168.137.1','2020-07-29 23:32:21','åç½IP|0|0|åç½IP|åç½IP'),(1178,'MrBird','å é¤å®¢æ·',58,'cc.mrbird.febs.system.controller.CustomerController.deleteCustomers()',' customerIds: \"2\"','192.168.137.1','2020-07-29 23:54:54','åç½IP|0|0|åç½IP|åç½IP'),(1179,'MrBird','å é¤å®¢æ·',12,'cc.mrbird.febs.system.controller.CustomerController.deleteCustomers()',' customerIds: \"1,3\"','192.168.137.1','2020-07-29 23:56:22','åç½IP|0|0|åç½IP|åç½IP'),(1180,'MrBird','æ°å¢å®¢æ·',11,'cc.mrbird.febs.system.controller.CustomerController.createCustomer()',' customer: \"Customer(customerId=4, name=å¼ ä¸, gender=0, phone=15322223333, purchasingDate=Wed Jul 29 11:11:11 CST 2020, vehicleId=22, purchasingDateFrom=null, purchasingDateTo=null)\"','192.168.137.1','2020-07-29 23:56:54','åç½IP|0|0|åç½IP|åç½IP'),(1181,'MrBird','ä¿®æ¹èå/æé®',21,'cc.mrbird.febs.system.controller.MenuController.updateMenu()',' menu: \"Menu(menuId=214, parentId=212, menuName=ä¿®æ¹å®¢æ·, url=null, perms=customer:update, icon=null, type=1, orderNum=null, createTime=null, modifyTime=Wed Jul 29 23:57:51 CST 2020)\"','192.168.137.1','2020-07-29 23:57:52','åç½IP|0|0|åç½IP|åç½IP'),(1182,'MrBird','ä¿®æ¹å®¢æ·',44,'cc.mrbird.febs.system.controller.CustomerController.updateCustomer()',' customer: \"Customer(customerId=4, name=å¼ ä¸, gender=null, phone=15322223334, purchasingDate=null, vehicleId=22, purchasingDateFrom=null, purchasingDateTo=null)\"','192.168.137.1','2020-07-30 00:09:40','åç½IP|0|0|åç½IP|åç½IP'),(1183,'MrBird','ä¿®æ¹å®¢æ·',7,'cc.mrbird.febs.system.controller.CustomerController.updateCustomer()',' customer: \"Customer(customerId=4, name=å¼ ä¸, gender=null, phone=15322223334, purchasingDate=null, vehicleId=22, purchasingDateFrom=null, purchasingDateTo=null)\"','192.168.137.1','2020-07-30 00:09:53','åç½IP|0|0|åç½IP|åç½IP'),(1184,'MrBird','æ°å¢å®¢æ·',55,'cc.mrbird.febs.system.controller.CustomerController.createCustomer()',' customer: \"Customer(customerId=5, name=çäº, gender=0, phone=12345678900, purchasingDate=Thu Jul 30 10:00:03 CST 2020, vehicleId=22, purchasingDateFrom=null, purchasingDateTo=null)\"','192.168.137.1','2020-07-30 00:15:22','åç½IP|0|0|åç½IP|åç½IP'),(1185,'MrBird','ä¿®æ¹å®¢æ·',20,'cc.mrbird.febs.system.controller.CustomerController.updateCustomer()',' customer: \"Customer(customerId=5, name=çäº, gender=null, phone=12345678901, purchasingDate=null, vehicleId=22, purchasingDateFrom=null, purchasingDateTo=null)\"','192.168.137.1','2020-07-30 00:15:40','åç½IP|0|0|åç½IP|åç½IP'),(1186,'MrBird','å é¤å®¢æ·',18,'cc.mrbird.febs.system.controller.CustomerController.deleteCustomers()',' customerIds: \"5\"','192.168.137.1','2020-07-30 00:15:44','åç½IP|0|0|åç½IP|åç½IP'),(1187,'MrBird','ä¿®æ¹è®¢å',56,'cc.mrbird.febs.system.controller.OrderController.updateOrder()',' order: \"Order(orderId=2, salesId=13, customerName=lisi, customerPhone=12345678911, vehicleId=11, price=202222, createTime=null, status=null, createTimeFrom=null, createTimeTo=null)\"','192.168.137.1','2020-07-30 09:08:07','åç½IP|0|0|åç½IP|åç½IP'),(1188,'MrBird','ä¿®æ¹è§è²',88,'cc.mrbird.febs.system.controller.RoleController.updateRole()',' role: \"Role(roleId=1, roleName=ç³»ç»ç®¡çå, remark=ç³»ç»ç®¡çåï¼æ¥ææææä½æé ^_^, createTime=null, modifyTime=Thu Jul 30 09:16:14 CST 2020, menuIds=196,197,203,200,199,198,201,204,205,206,207,210,211,212,213,215,1,3,11,12,13,161,160,4,14,162,15,16,5,163,17,18,19,6,20,21,22,164,2,8,23,10,24,170,136,172,171,127,128,129,131,175,101,102,103,104,105,106,107,108,173,109,174,110,137,138,165,139,166,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125,169,168,167,178)\"','192.168.137.1','2020-07-30 09:16:15','åç½IP|0|0|åç½IP|åç½IP'),(1189,'MrBird','ä¿®æ¹è§è²',64,'cc.mrbird.febs.system.controller.RoleController.updateRole()',' role: \"Role(roleId=1, roleName=ç³»ç»ç®¡çå, remark=ç³»ç»ç®¡çåï¼æ¥ææææä½æé ^_^, createTime=null, modifyTime=Thu Jul 30 09:26:33 CST 2020, menuIds=196,197,203,200,199,198,201,204,205,206,207,210,211,212,213,214,215,1,3,11,12,13,161,160,4,14,162,15,16,5,163,17,18,19,6,20,21,22,164,2,8,23,10,24,170,136,172,171,127,128,129,131,175,101,102,103,104,105,106,107,108,173,109,174,110,137,138,165,139,166,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125,169,168,167,178)\"','192.168.137.1','2020-07-30 09:26:33','åç½IP|0|0|åç½IP|åç½IP'),(1190,'MrBird','ä¿å»è½¦è¾',83,'cc.mrbird.febs.system.controller.VehicleController.maintenanceVehicles()',' vehicleIds: \"3\"','192.168.137.1','2020-07-30 09:55:45','åç½IP|0|0|åç½IP|åç½IP'),(1191,'MrBird','åºå®è½¦è¾',23,'cc.mrbird.febs.system.controller.VehicleController.saleVehicles()',' vehicleIds: \"1\"','192.168.137.1','2020-07-30 10:00:15','åç½IP|0|0|åç½IP|åç½IP'),(1192,'MrBird','åºå®è½¦è¾',19,'cc.mrbird.febs.system.controller.VehicleController.saleVehicles()',' vehicleIds: \"2\"','192.168.137.1','2020-07-30 10:00:18','åç½IP|0|0|åç½IP|åç½IP'),(1193,'MrBird','åºå®è½¦è¾',21,'cc.mrbird.febs.system.controller.VehicleController.saleVehicles()',' vehicleIds: \"5\"','192.168.137.1','2020-07-30 10:00:21','åç½IP|0|0|åç½IP|åç½IP'),(1194,'MrBird','å½æ¡£è®¢å',76,'cc.mrbird.febs.system.controller.OrderController.archiveOrder()',' orderIds: \"4\"','192.168.137.1','2020-07-30 10:08:21','åç½IP|0|0|åç½IP|åç½IP'),(1195,'MrBird','ä¿®æ¹è§è²',41,'cc.mrbird.febs.system.controller.RoleController.updateRole()',' role: \"Role(roleId=81, roleName=éå®äººå, remark=è½¦è¾éå®, createTime=null, modifyTime=Thu Jul 30 11:41:11 CST 2020, menuIds=196,197,198,201,205,210,211,212,213)\"','192.168.137.1','2020-07-30 11:41:11','åç½IP|0|0|åç½IP|åç½IP'),(1196,'MrBird','ä¿®æ¹è§è²',65,'cc.mrbird.febs.system.controller.RoleController.updateRole()',' role: \"Role(roleId=1, roleName=ç³»ç»ç®¡çå, remark=ç³»ç»ç®¡çåï¼æ¥ææææä½æé ^_^, createTime=null, modifyTime=Thu Jul 30 11:51:50 CST 2020, menuIds=196,197,203,200,199,198,201,204,205,206,207,210,212,213,214,215,1,3,11,12,13,161,160,4,14,162,15,16,5,163,17,18,19,6,20,21,22,164,2,8,23,10,24,170,136,172,171,127,128,129,131,175,101,102,103,104,105,106,107,108,173,109,174,110,137,138,165,139,166,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125,169,168,167,178)\"','192.168.137.1','2020-07-30 11:51:51','åç½IP|0|0|åç½IP|åç½IP'),(1197,'MrBird','ä¿®æ¹è§è²',57,'cc.mrbird.febs.system.controller.RoleController.updateRole()',' role: \"Role(roleId=1, roleName=ç³»ç»ç®¡çå, remark=ç³»ç»ç®¡çåï¼æ¥ææææä½æé ^_^, createTime=null, modifyTime=Thu Jul 30 11:52:45 CST 2020, menuIds=196,197,203,200,199,198,201,204,205,206,207,210,211,212,213,214,215,1,3,11,12,13,161,160,4,14,162,15,16,5,163,17,18,19,6,20,21,22,164,2,8,23,10,24,170,136,172,171,127,128,129,131,175,101,102,103,104,105,106,107,108,173,109,174,110,137,138,165,139,166,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125,169,168,167,178)\"','192.168.137.1','2020-07-30 11:52:46','åç½IP|0|0|åç½IP|åç½IP'),(1198,'MrBird','æ°å¢èå/æé®',18,'cc.mrbird.febs.system.controller.MenuController.addMenu()',' menu: \"Menu(menuId=216, parentId=205, menuName=ä¿å»æé®, url=null, perms=, icon=null, type=1, orderNum=null, createTime=Thu Jul 30 11:54:13 CST 2020, modifyTime=null)\"','192.168.137.1','2020-07-30 11:54:14','åç½IP|0|0|åç½IP|åç½IP'),(1199,'MrBird','ä¿®æ¹èå/æé®',19,'cc.mrbird.febs.system.controller.MenuController.updateMenu()',' menu: \"Menu(menuId=216, parentId=205, menuName=ä¿å»æé®, url=null, perms=vehicle:maintenance, icon=null, type=1, orderNum=null, createTime=null, modifyTime=Thu Jul 30 11:54:30 CST 2020)\"','192.168.137.1','2020-07-30 11:54:30','åç½IP|0|0|åç½IP|åç½IP'),(1200,'MrBird','ä¿®æ¹è§è²',64,'cc.mrbird.febs.system.controller.RoleController.updateRole()',' role: \"Role(roleId=1, roleName=ç³»ç»ç®¡çå, remark=ç³»ç»ç®¡çåï¼æ¥ææææä½æé ^_^, createTime=null, modifyTime=Thu Jul 30 11:54:43 CST 2020, menuIds=196,197,201,200,199,198,203,204,205,206,207,216,210,211,212,213,214,215,1,3,11,12,13,161,160,4,14,162,15,16,5,163,17,18,19,6,20,21,22,164,2,8,23,10,24,170,136,172,171,127,128,129,131,175,101,102,103,104,105,106,107,108,173,109,174,110,137,138,165,139,166,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125,169,168,167,178)\"','192.168.137.1','2020-07-30 11:54:44','åç½IP|0|0|åç½IP|åç½IP'),(1201,'MrBird','ä¿®æ¹è§è²',28,'cc.mrbird.febs.system.controller.RoleController.updateRole()',' role: \"Role(roleId=81, roleName=éå®äººå, remark=è½¦è¾éå®, createTime=null, modifyTime=Thu Jul 30 11:54:58 CST 2020, menuIds=196,197,201,198,205,216,210,211,212,213)\"','192.168.137.1','2020-07-30 11:54:58','åç½IP|0|0|åç½IP|åç½IP'),(1202,'MrBird','ä¿®æ¹è§è²',26,'cc.mrbird.febs.system.controller.RoleController.updateRole()',' role: \"Role(roleId=81, roleName=éå®äººå, remark=è½¦è¾éå®, createTime=null, modifyTime=Thu Jul 30 11:55:50 CST 2020, menuIds=196,197,201,198,205,206,207,216,210,211,212,213)\"','192.168.137.1','2020-07-30 11:55:51','åç½IP|0|0|åç½IP|åç½IP'),(1203,'MrBird','å é¤èå/æé®',31,'cc.mrbird.febs.system.controller.MenuController.deleteMenus()',' menuIds: \"216\"','192.168.137.1','2020-07-30 11:56:22','åç½IP|0|0|åç½IP|åç½IP'),(1204,'MrBird','ä¿®æ¹è§è²',29,'cc.mrbird.febs.system.controller.RoleController.updateRole()',' role: \"Role(roleId=81, roleName=éå®äººå, remark=è½¦è¾éå®, createTime=null, modifyTime=Thu Jul 30 11:56:46 CST 2020, menuIds=196,197,198,201,205,206,210,211,212,213)\"','192.168.137.1','2020-07-30 11:56:46','åç½IP|0|0|åç½IP|åç½IP'),(1205,'MrBird','ä¿®æ¹è§è²',25,'cc.mrbird.febs.system.controller.RoleController.updateRole()',' role: \"Role(roleId=81, roleName=éå®äººå, remark=è½¦è¾éå®, createTime=null, modifyTime=Thu Jul 30 11:57:12 CST 2020, menuIds=196,197,198,201,205,207,210,211,212,213)\"','192.168.137.1','2020-07-30 11:57:13','åç½IP|0|0|åç½IP|åç½IP'),(1206,'MrBird','ä¿®æ¹è§è²',96,'cc.mrbird.febs.system.controller.RoleController.updateRole()',' role: \"Role(roleId=81, roleName=éå®äººå, remark=è½¦è¾éå®, createTime=null, modifyTime=Thu Jul 30 11:59:10 CST 2020, menuIds=196,197,198,201,205,210,211,212,213)\"','192.168.137.1','2020-07-30 11:59:11','åç½IP|0|0|åç½IP|åç½IP'),(1207,'zhangsan','ä¿å»è½¦è¾',31,'cc.mrbird.febs.system.controller.VehicleController.maintenanceVehicles()',' vehicleIds: \"2\"','0:0:0:0:0:0:0:1','2020-07-30 11:59:36','åç½IP|0|0|åç½IP|åç½IP'),(1208,'MrBird','æ°å¢èå/æé®',25,'cc.mrbird.febs.system.controller.MenuController.addMenu()',' menu: \"Menu(menuId=217, parentId=196, menuName=ä¸ç»©ç»è®¡, url=, perms=achivement, icon=layui-icon-linechart, type=0, orderNum=null, createTime=Thu Jul 30 14:05:08 CST 2020, modifyTime=null)\"','192.168.137.1','2020-07-30 14:05:09','åç½IP|0|0|åç½IP|åç½IP'),(1209,'MrBird','ä¿®æ¹è§è²',78,'cc.mrbird.febs.system.controller.RoleController.updateRole()',' role: \"Role(roleId=1, roleName=ç³»ç»ç®¡çå, remark=ç³»ç»ç®¡çåï¼æ¥ææææä½æé ^_^, createTime=null, modifyTime=Thu Jul 30 14:05:19 CST 2020, menuIds=196,217,197,201,200,199,198,203,204,205,206,207,210,211,212,213,214,215,1,3,11,12,13,161,160,4,14,162,15,16,5,163,17,18,19,6,20,21,22,164,2,8,23,10,24,170,136,172,171,127,128,129,131,175,101,102,103,104,105,106,107,108,173,109,174,110,137,138,165,139,166,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125,169,168,167,178)\"','192.168.137.1','2020-07-30 14:05:19','åç½IP|0|0|åç½IP|åç½IP'),(1210,'MrBird','ä¿®æ¹èå/æé®',25,'cc.mrbird.febs.system.controller.MenuController.updateMenu()',' menu: \"Menu(menuId=217, parentId=196, menuName=ä¸ç»©ç»è®¡, url=, perms=achivement, icon=layui-icon-linechart, type=0, orderNum=4, createTime=null, modifyTime=Thu Jul 30 14:05:38 CST 2020)\"','192.168.137.1','2020-07-30 14:05:39','åç½IP|0|0|åç½IP|åç½IP'),(1211,'MrBird','ä¿®æ¹èå/æé®',17,'cc.mrbird.febs.system.controller.MenuController.updateMenu()',' menu: \"Menu(menuId=217, parentId=196, menuName=ä¸ç»©ç»è®¡, url=/system/achievement/, perms=achivement, icon=layui-icon-linechart, type=0, orderNum=4, createTime=null, modifyTime=Thu Jul 30 14:06:27 CST 2020)\"','192.168.137.1','2020-07-30 14:06:28','åç½IP|0|0|åç½IP|åç½IP'),(1212,'MrBird','ä¿®æ¹èå/æé®',10,'cc.mrbird.febs.system.controller.MenuController.updateMenu()',' menu: \"Menu(menuId=217, parentId=196, menuName=ä¸ç»©ç»è®¡, url=/system/achievement/, perms=achivement:view, icon=layui-icon-linechart, type=0, orderNum=4, createTime=null, modifyTime=Thu Jul 30 14:08:15 CST 2020)\"','192.168.137.1','2020-07-30 14:08:15','åç½IP|0|0|åç½IP|åç½IP'),(1213,'MrBird','ä¿®æ¹èå/æé®',17,'cc.mrbird.febs.system.controller.MenuController.updateMenu()',' menu: \"Menu(menuId=217, parentId=196, menuName=ä¸ç»©ç»è®¡, url=/system/achievement/, perms=achievement:view, icon=layui-icon-linechart, type=0, orderNum=4, createTime=null, modifyTime=Thu Jul 30 14:08:45 CST 2020)\"','192.168.137.1','2020-07-30 14:08:46','åç½IP|0|0|åç½IP|åç½IP'),(1214,'MrBird','ä¿®æ¹è§è²',65,'cc.mrbird.febs.system.controller.RoleController.updateRole()',' role: \"Role(roleId=82, roleName=éå®ç»ç, remark=è´è´£ç®¡çéå®äººååè®¢åå®¡æ¹, createTime=null, modifyTime=Thu Jul 30 20:11:06 CST 2020, menuIds=196,197,199,198,203,204,205,206,207,210,211,212,213,214,215,217)\"','192.168.137.1','2020-07-30 20:11:06','åç½IP|0|0|åç½IP|åç½IP'),(1215,'MrBird','ä¿®æ¹è§è²',27,'cc.mrbird.febs.system.controller.RoleController.updateRole()',' role: \"Role(roleId=83, roleName=è´¢å¡ä¼è®¡, remark=è´è´£å®¡æ ¸è´¦ååä»æ¬¾æ ¡å¯¹, createTime=null, modifyTime=Thu Jul 30 20:11:18 CST 2020, menuIds=196,197,200,203)\"','192.168.137.1','2020-07-30 20:11:19','åç½IP|0|0|åç½IP|åç½IP'),(1216,'MrBird','ä¿®æ¹è§è²',33,'cc.mrbird.febs.system.controller.RoleController.updateRole()',' role: \"Role(roleId=81, roleName=éå®äººå, remark=è½¦è¾éå®, createTime=null, modifyTime=Thu Jul 30 20:12:02 CST 2020, menuIds=196,197,201,198,205,210,211,212,213)\"','192.168.137.1','2020-07-30 20:12:02','åç½IP|0|0|åç½IP|åç½IP'),(1217,'MrBird','å é¤è®¢å',33,'cc.mrbird.febs.system.controller.OrderController.deleteOrders()',' orderIds: \"13\"','192.168.137.1','2020-07-31 10:15:37','åç½IP|0|0|åç½IP|åç½IP'),(1218,'MrBird','æ°å¢è®¢å',67,'cc.mrbird.febs.system.controller.OrderController.createOrder()',' order: \"Order(orderId=14, salesId=3, customerName=zzz, customerPhone=12536489000, vehicleId=2, price=22222222, createTime=Fri Jul 31 13:27:37 CST 2020, status=å¾å®¡æ ¸, createTimeFrom=null, createTimeTo=null)\"','192.168.137.1','2020-07-31 13:27:37','åç½IP|0|0|åç½IP|åç½IP'),(1219,'MrBird','ä¿®æ¹è®¢å',89,'cc.mrbird.febs.system.controller.OrderController.updateOrder()',' order: \"Order(orderId=14, salesId=3, customerName=zzz, customerPhone=12536489000, vehicleId=111, price=22222222, createTime=null, status=null, createTimeFrom=null, createTimeTo=null)\"','192.168.137.1','2020-07-31 13:27:54','åç½IP|0|0|åç½IP|åç½IP'),(1220,'MrBird','å é¤è®¢å',48,'cc.mrbird.febs.system.controller.OrderController.deleteOrders()',' orderIds: \"14\"','192.168.137.1','2020-07-31 13:28:04','åç½IP|0|0|åç½IP|åç½IP'),(1221,'MrBird','ç»çå®¡æ¹è®¢å',47,'cc.mrbird.febs.system.controller.OrderController.managerApproveOrder()',' orderIds: \"1\"','192.168.137.1','2020-07-31 13:28:47','åç½IP|0|0|åç½IP|åç½IP'),(1222,'MrBird','è´¢å¡å®¡æ¹è®¢å',68,'cc.mrbird.febs.system.controller.OrderController.accountingApproveOrder()',' orderIds: \"1\"','192.168.137.1','2020-07-31 13:28:52','åç½IP|0|0|åç½IP|åç½IP'),(1223,'MrBird','éå®å®¡æ¹è®¢å',38,'cc.mrbird.febs.system.controller.OrderController.salesApproveOrder()',' orderIds: \"1\"','192.168.137.1','2020-07-31 13:28:59','åç½IP|0|0|åç½IP|åç½IP'),(1224,'MrBird','å½æ¡£è®¢å',30,'cc.mrbird.febs.system.controller.OrderController.archiveOrder()',' orderIds: \"1\"','192.168.137.1','2020-07-31 13:29:07','åç½IP|0|0|åç½IP|åç½IP'),(1225,'MrBird','åºå®è½¦è¾',35,'cc.mrbird.febs.system.controller.VehicleController.saleVehicles()',' vehicleIds: \"3\"','192.168.137.1','2020-07-31 13:29:25','åç½IP|0|0|åç½IP|åç½IP'),(1226,'MrBird','ä¿å»è½¦è¾',42,'cc.mrbird.febs.system.controller.VehicleController.maintenanceVehicles()',' vehicleIds: \"3\"','192.168.137.1','2020-07-31 13:29:30','åç½IP|0|0|åç½IP|åç½IP'),(1227,'MrBird','ä¿å»è½¦è¾',51,'cc.mrbird.febs.system.controller.VehicleController.maintenanceVehicles()',' vehicleIds: \"3\"','192.168.137.1','2020-07-31 13:29:35','åç½IP|0|0|åç½IP|åç½IP'),(1228,'MrBird','ä¿®æ¹èå/æé®',45,'cc.mrbird.febs.system.controller.MenuController.updateMenu()',' menu: \"Menu(menuId=203, parentId=197, menuName=å®¡æ¹è®¢å, url=/system/order/approve, perms=order:approve, icon=, type=0, orderNum=1, createTime=null, modifyTime=Fri Jul 31 13:53:09 CST 2020)\"','192.168.137.1','2020-07-31 13:53:10','åç½IP|0|0|åç½IP|åç½IP'),(1229,'MrBird','ä¿®æ¹èå/æé®',9,'cc.mrbird.febs.system.controller.MenuController.updateMenu()',' menu: \"Menu(menuId=204, parentId=197, menuName=å½æ¡£è®¢å, url=/system/order/archive, perms=order:archive, icon=, type=0, orderNum=2, createTime=null, modifyTime=Fri Jul 31 13:53:15 CST 2020)\"','192.168.137.1','2020-07-31 13:53:16','åç½IP|0|0|åç½IP|åç½IP'),(1230,'MrBird','å½æ¡£è®¢å',24,'cc.mrbird.febs.system.controller.OrderController.archiveOrder()',' orderIds: \"4\"','192.168.137.1','2020-07-31 13:54:52','åç½IP|0|0|åç½IP|åç½IP'),(1231,'MrBird','å é¤è§è²',40,'cc.mrbird.febs.system.controller.RoleController.deleteRoles()',' roleIds: \"83,82,81\"','192.168.43.143','2020-11-26 08:55:19','åç½IP|0|0|åç½IP|åç½IP'),(1232,'MrBird','æ°å¢è§è²',19,'cc.mrbird.febs.system.controller.RoleController.addRole()',' role: \"Role(roleId=84, roleName=åºä¸», remark=åºä¸», createTime=Thu Nov 26 08:57:44 CST 2020, modifyTime=null, menuIds=196,197,212,213,214,215)\"','192.168.43.143','2020-11-26 08:57:45','åç½IP|0|0|åç½IP|åç½IP'),(1233,'MrBird','ä¿®æ¹èå/æé®',47,'cc.mrbird.febs.system.controller.MenuController.updateMenu()',' menu: \"Menu(menuId=205, parentId=196, menuName=è´§ç©ç®¡ç, url=/system/goods, perms=goods:view, icon=layui-icon-car, type=0, orderNum=2, createTime=null, modifyTime=Thu Nov 26 09:06:56 CST 2020)\"','192.168.43.143','2020-11-26 09:06:56','åç½IP|0|0|åç½IP|åç½IP'),(1234,'MrBird','ä¿®æ¹èå/æé®',9,'cc.mrbird.febs.system.controller.MenuController.updateMenu()',' menu: \"Menu(menuId=206, parentId=205, menuName=æ°å¢è´§ç©, url=null, perms=vehicle:create, icon=null, type=1, orderNum=null, createTime=null, modifyTime=Thu Nov 26 09:07:11 CST 2020)\"','192.168.43.143','2020-11-26 09:07:12','åç½IP|0|0|åç½IP|åç½IP'),(1235,'MrBird','ä¿®æ¹èå/æé®',18,'cc.mrbird.febs.system.controller.MenuController.updateMenu()',' menu: \"Menu(menuId=207, parentId=205, menuName=ä¿®æ¹æå é¤è´§ç©, url=null, perms=vehicle:modify, icon=null, type=1, orderNum=null, createTime=null, modifyTime=Thu Nov 26 09:07:54 CST 2020)\"','192.168.43.143','2020-11-26 09:07:55','åç½IP|0|0|åç½IP|åç½IP'),(1236,'MrBird','ä¿®æ¹èå/æé®',8,'cc.mrbird.febs.system.controller.MenuController.updateMenu()',' menu: \"Menu(menuId=210, parentId=205, menuName=åºå®è´§ç©, url=/system/goods/sale, perms=goods:sale, icon=, type=0, orderNum=1, createTime=null, modifyTime=Thu Nov 26 09:08:18 CST 2020)\"','192.168.43.143','2020-11-26 09:08:18','åç½IP|0|0|åç½IP|åç½IP'),(1237,'MrBird','å é¤èå/æé®',24,'cc.mrbird.febs.system.controller.MenuController.deleteMenus()',' menuIds: \"211\"','192.168.43.143','2020-11-26 09:08:29','åç½IP|0|0|åç½IP|åç½IP'),(1238,'MrBird','ä¿®æ¹èå/æé®',9,'cc.mrbird.febs.system.controller.MenuController.updateMenu()',' menu: \"Menu(menuId=205, parentId=196, menuName=è´§åç®¡ç, url=/system/goods, perms=goods:view, icon=layui-icon-car, type=0, orderNum=2, createTime=null, modifyTime=Thu Nov 26 09:10:36 CST 2020)\"','192.168.43.143','2020-11-26 09:10:36','åç½IP|0|0|åç½IP|åç½IP'),(1239,'MrBird','ä¿®æ¹èå/æé®',16,'cc.mrbird.febs.system.controller.MenuController.updateMenu()',' menu: \"Menu(menuId=206, parentId=205, menuName=æ°å¢è´§å, url=null, perms=vehicle:create, icon=null, type=1, orderNum=null, createTime=null, modifyTime=Thu Nov 26 09:10:43 CST 2020)\"','192.168.43.143','2020-11-26 09:10:43','åç½IP|0|0|åç½IP|åç½IP'),(1240,'MrBird','ä¿®æ¹èå/æé®',17,'cc.mrbird.febs.system.controller.MenuController.updateMenu()',' menu: \"Menu(menuId=207, parentId=205, menuName=ä¿®æ¹æå é¤è´§å, url=null, perms=vehicle:modify, icon=null, type=1, orderNum=null, createTime=null, modifyTime=Thu Nov 26 09:10:52 CST 2020)\"','192.168.43.143','2020-11-26 09:10:53','åç½IP|0|0|åç½IP|åç½IP'),(1241,'MrBird','ä¿®æ¹èå/æé®',15,'cc.mrbird.febs.system.controller.MenuController.updateMenu()',' menu: \"Menu(menuId=210, parentId=205, menuName=åºå®è´§å, url=/system/goods/sale, perms=goods:sale, icon=, type=0, orderNum=1, createTime=null, modifyTime=Thu Nov 26 09:11:03 CST 2020)\"','192.168.43.143','2020-11-26 09:11:03','åç½IP|0|0|åç½IP|åç½IP'),(1242,'MrBird','ä¿®æ¹èå/æé®',29,'cc.mrbird.febs.system.controller.MenuController.updateMenu()',' menu: \"Menu(menuId=207, parentId=205, menuName=ä¿®æ¹æå é¤è´§å, url=null, perms=goods:modify, icon=null, type=1, orderNum=null, createTime=null, modifyTime=Thu Nov 26 10:13:54 CST 2020)\"','172.20.88.167','2020-11-26 10:13:55','åç½IP|0|0|åç½IP|åç½IP'),(1243,'MrBird','ä¿®æ¹èå/æé®',9,'cc.mrbird.febs.system.controller.MenuController.updateMenu()',' menu: \"Menu(menuId=206, parentId=205, menuName=æ°å¢è´§å, url=null, perms=goods:create, icon=null, type=1, orderNum=null, createTime=null, modifyTime=Thu Nov 26 10:14:03 CST 2020)\"','172.20.88.167','2020-11-26 10:14:03','åç½IP|0|0|åç½IP|åç½IP'),(1244,'MrBird','æ°å¢è½¦è¾',28,'cc.mrbird.febs.system.controller.GoodsController.createGoods()',' goods: \"Goods(goodsId=1, name=é®ç, price=200, inventory=10)\"','172.20.88.167','2020-11-26 10:27:29','åç½IP|0|0|åç½IP|åç½IP'),(1245,'MrBird','ä¿®æ¹èå/æé®',18,'cc.mrbird.febs.system.controller.MenuController.updateMenu()',' menu: \"Menu(menuId=205, parentId=0, menuName=è´§åç®¡ç, url=/system/goods, perms=goods:view, icon=layui-icon-car, type=0, orderNum=null, createTime=null, modifyTime=Thu Nov 26 10:38:28 CST 2020)\"','172.20.88.167','2020-11-26 10:38:29','åç½IP|0|0|åç½IP|åç½IP'),(1246,'MrBird','ä¿®æ¹èå/æé®',8,'cc.mrbird.febs.system.controller.MenuController.updateMenu()',' menu: \"Menu(menuId=205, parentId=0, menuName=è´§åç®¡ç, url=/system/goods, perms=goods:view, icon=layui-icon-car, type=0, orderNum=1, createTime=null, modifyTime=Thu Nov 26 10:38:47 CST 2020)\"','172.20.88.167','2020-11-26 10:38:48','åç½IP|0|0|åç½IP|åç½IP'),(1247,'MrBird','ä¿®æ¹èå/æé®',8,'cc.mrbird.febs.system.controller.MenuController.updateMenu()',' menu: \"Menu(menuId=205, parentId=0, menuName=è´§åç®¡ç, url=/system/goods, perms=goods:view, icon=layui-icon-car, type=0, orderNum=0, createTime=null, modifyTime=Thu Nov 26 10:39:01 CST 2020)\"','172.20.88.167','2020-11-26 10:39:01','åç½IP|0|0|åç½IP|åç½IP'),(1248,'MrBird','ä¿®æ¹èå/æé®',17,'cc.mrbird.febs.system.controller.MenuController.updateMenu()',' menu: \"Menu(menuId=212, parentId=0, menuName=å®¢æ·ç®¡ç, url=/system/customer/, perms=customer:view, icon=layui-icon-team, type=0, orderNum=1, createTime=null, modifyTime=Thu Nov 26 10:46:47 CST 2020)\"','172.20.88.167','2020-11-26 10:46:47','åç½IP|0|0|åç½IP|åç½IP'),(1249,'MrBird','ä¿®æ¹èå/æé®',19,'cc.mrbird.febs.system.controller.MenuController.updateMenu()',' menu: \"Menu(menuId=212, parentId=0, menuName=å®¢æ·ç®¡ç, url=/system/customer/, perms=customer:view, icon=layui-icon-team, type=0, orderNum=0, createTime=null, modifyTime=Thu Nov 26 10:46:59 CST 2020)\"','172.20.88.167','2020-11-26 10:46:59','åç½IP|0|0|åç½IP|åç½IP');
/*!40000 ALTER TABLE `t_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_login_log`
--

DROP TABLE IF EXISTS `t_login_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_login_log` (
  `ID` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `USERNAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ç¨æ·å',
  `LOGIN_TIME` datetime NOT NULL COMMENT 'ç»å½æ¶é´',
  `LOCATION` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'ç»å½å°ç¹',
  `IP` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'IPå°å',
  `SYSTEM` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'æä½ç³»ç»',
  `BROWSER` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'æµè§å¨',
  PRIMARY KEY (`ID`) USING BTREE,
  KEY `t_login_log_login_time` (`LOGIN_TIME`)
) ENGINE=MyISAM AUTO_INCREMENT=157 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='ç»å½æ¥å¿è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_login_log`
--

LOCK TABLES `t_login_log` WRITE;
/*!40000 ALTER TABLE `t_login_log` DISABLE KEYS */;
INSERT INTO `t_login_log` VALUES (70,'mrbird','2020-07-21 15:33:05','åç½IP|0|0|åç½IP|åç½IP','192.168.160.1','Windows 10','Chrome 83'),(71,'mrbird','2020-07-21 15:45:15','åç½IP|0|0|åç½IP|åç½IP','127.0.0.1','Windows 10','Chrome 83'),(72,'mrbird','2020-07-21 15:53:37','åç½IP|0|0|åç½IP|åç½IP','127.0.0.1','Windows 10','Chrome 83'),(73,'mrbird','2020-07-26 17:25:35','åç½IP|0|0|åç½IP|åç½IP','192.168.137.1','Windows 10','Chrome 83'),(74,'zhangsan','2020-07-26 18:25:28','åç½IP|0|0|åç½IP|åç½IP','192.168.137.1','Windows 10','Chrome 83'),(75,'mrbird','2020-07-26 18:25:49','åç½IP|0|0|åç½IP|åç½IP','192.168.137.1','Windows 10','Chrome 83'),(76,'zhangsan','2020-07-26 18:26:20','åç½IP|0|0|åç½IP|åç½IP','192.168.137.1','Windows 10','Chrome 83'),(77,'mrbird','2020-07-26 18:27:43','åç½IP|0|0|åç½IP|åç½IP','192.168.137.1','Windows 10','Chrome 83'),(78,'mrbird','2020-07-27 11:51:34','åç½IP|0|0|åç½IP|åç½IP','192.168.137.1','Windows 10','Chrome 83'),(79,'mrbird','2020-07-27 14:17:14','åç½IP|0|0|åç½IP|åç½IP','192.168.137.1','Windows 10','Chrome 83'),(80,'mrbird','2020-07-27 22:11:19','åç½IP|0|0|åç½IP|åç½IP','192.168.137.1','Windows 10','Chrome 83'),(81,'mrbird','2020-07-28 09:08:05','åç½IP|0|0|åç½IP|åç½IP','192.168.137.1','Windows 10','Chrome 83'),(82,'mrbird','2020-07-28 14:01:08','åç½IP|0|0|åç½IP|åç½IP','192.168.137.1','Windows 10','Chrome 83'),(83,'mrbird','2020-07-28 14:22:32','åç½IP|0|0|åç½IP|åç½IP','192.168.137.1','Windows 10','Chrome 83'),(84,'zhangsan','2020-07-28 16:15:17','åç½IP|0|0|åç½IP|åç½IP','127.0.0.1','Windows 10','Chrome 83'),(85,'mrbird','2020-07-28 18:36:43','åç½IP|0|0|åç½IP|åç½IP','192.168.137.1','Windows 10','Chrome 83'),(86,'mrbird','2020-07-28 19:18:17','åç½IP|0|0|åç½IP|åç½IP','192.168.137.1','Windows 10','Chrome 83'),(87,'mrbird','2020-07-28 19:18:52','åç½IP|0|0|åç½IP|åç½IP','192.168.137.1','Windows 10','Chrome 83'),(88,'mrbird','2020-07-28 21:44:54','åç½IP|0|0|åç½IP|åç½IP','192.168.137.1','Windows 10','Chrome 84'),(89,'mrbird','2020-07-29 09:40:03','åç½IP|0|0|åç½IP|åç½IP','192.168.137.1','Windows 10','Chrome 84'),(90,'beiyan','2020-07-29 09:46:13','ä¸­å½|åå|å±±è¥¿ç|æä¸­å¸|èé','60.223.188.27','Linux','Chrome 77'),(91,'beiyan','2020-07-29 09:59:44','ä¸­å½|åä¸|æµæ±ç|æ­å·å¸|ç§»å¨','117.148.171.72','Linux','Chrome 77'),(92,'beiyan','2020-07-29 10:01:09','åç½IP|0|0|åç½IP|åç½IP','183.236.67.139, 14.116.144.205','Linux','Chrome 57'),(93,'beiyan','2020-07-29 10:03:49','ä¸­å½|åå|å±±è¥¿ç|æä¸­å¸|èé','60.223.132.110','Linux','Chrome 78'),(94,'mrbird','2020-07-29 20:09:26','åç½IP|0|0|åç½IP|åç½IP','192.168.137.1','Windows 10','Chrome 84'),(95,'mrbird','2020-07-29 22:36:49','åç½IP|0|0|åç½IP|åç½IP','192.168.137.1','Windows 10','Chrome 84'),(96,'mrbird','2020-07-30 08:56:44','åç½IP|0|0|åç½IP|åç½IP','192.168.137.1','Windows 10','Chrome 84'),(97,'zhangsan','2020-07-30 11:40:36','åç½IP|0|0|åç½IP|åç½IP','127.0.0.1','Windows 10','Chrome 84'),(98,'zhangsan','2020-07-30 13:19:52','åç½IP|0|0|åç½IP|åç½IP','127.0.0.1','Windows 10','Chrome 84'),(99,'mrbird','2020-07-30 13:45:46','åç½IP|0|0|åç½IP|åç½IP','192.168.137.1','Windows 10','Chrome 84'),(100,'mrbird','2020-07-30 15:35:45','ä¸­å½|åä¸|ç¦å»ºç|æ³å·å¸|ç§»å¨','112.47.211.43','Windows 10','Chrome 84'),(101,'mrbird','2020-07-30 16:00:07','åç½IP|0|0|åç½IP|åç½IP','192.168.137.1','Windows 10','Chrome 84'),(102,'mrbird','2020-07-30 18:54:27','åç½IP|0|0|åç½IP|åç½IP','192.168.137.1','Windows 10','Chrome 84'),(103,'mrbird','2020-07-30 22:53:23','åç½IP|0|0|åç½IP|åç½IP','192.168.137.1','Windows 10','Chrome 84'),(104,'mrbird','2020-07-31 09:50:39','åç½IP|0|0|åç½IP|åç½IP','192.168.137.1','Windows 10','Chrome 84'),(105,'zhangsan','2020-07-31 11:50:32','åç½IP|0|0|åç½IP|åç½IP','127.0.0.1','Windows 10','Chrome 84'),(106,'mrbird','2020-07-31 13:26:55','åç½IP|0|0|åç½IP|åç½IP','192.168.137.1','Windows 10','Chrome 84'),(107,'zhangsan','2020-07-31 13:30:25','åç½IP|0|0|åç½IP|åç½IP','127.0.0.1','Windows 10','Chrome 84'),(108,'mrbird','2020-11-25 22:56:32',NULL,'192.168.43.143','Windows 10','Chrome 87'),(109,'mrbird','2020-11-25 23:11:05',NULL,'192.168.43.143','Windows 10','Chrome 87'),(110,'mrbird','2020-11-25 23:39:56',NULL,'192.168.43.143','Windows 10','Chrome 87'),(111,'mrbird','2020-11-26 08:43:54','åç½IP|0|0|åç½IP|åç½IP','192.168.43.143','Windows 10','Chrome 87'),(112,'mrbird','2020-11-26 08:54:19','åç½IP|0|0|åç½IP|åç½IP','192.168.43.143','Windows 10','Chrome 87'),(113,'mrbird','2020-11-26 09:19:48','åç½IP|0|0|åç½IP|åç½IP','172.20.88.167','Windows 10','Chrome 87'),(114,'mrbird','2020-11-26 09:32:33','åç½IP|0|0|åç½IP|åç½IP','172.20.88.167','Windows 10','Chrome 87'),(115,'mrbird','2020-11-26 09:36:36','åç½IP|0|0|åç½IP|åç½IP','172.20.88.167','Windows 10','Chrome 87'),(116,'mrbird','2020-11-26 09:55:02','åç½IP|0|0|åç½IP|åç½IP','172.20.88.167','Windows 10','Chrome 87'),(117,'mrbird','2020-11-26 09:57:35','åç½IP|0|0|åç½IP|åç½IP','172.20.88.167','Windows 10','Chrome 87'),(118,'mrbird','2020-11-26 10:01:39','åç½IP|0|0|åç½IP|åç½IP','172.20.88.167','Windows 10','Chrome 87'),(119,'mrbird','2020-11-26 10:03:50','åç½IP|0|0|åç½IP|åç½IP','172.20.88.167','Windows 10','Chrome 87'),(120,'mrbird','2020-11-26 10:05:03','åç½IP|0|0|åç½IP|åç½IP','172.20.88.167','Windows 10','Chrome 87'),(121,'mrbird','2020-11-26 10:22:46','åç½IP|0|0|åç½IP|åç½IP','172.20.88.167','Windows 10','Chrome 87'),(122,'mrbird','2020-11-26 10:27:12','åç½IP|0|0|åç½IP|åç½IP','172.20.88.167','Windows 10','Chrome 87'),(123,'mrbird','2020-11-26 10:53:32','åç½IP|0|0|åç½IP|åç½IP','172.20.88.167','Windows 10','Chrome 87'),(124,'mrbird','2020-11-26 11:02:56','åç½IP|0|0|åç½IP|åç½IP','172.20.88.167','Windows 10','Chrome 87'),(125,'mrbird','2020-11-26 12:09:23','åç½IP|0|0|åç½IP|åç½IP','172.20.88.167','Windows 10','Chrome 87'),(126,'mrbird','2020-11-27 10:49:46','åç½IP|0|0|åç½IP|åç½IP','192.168.43.143','Windows 10','Chrome 87'),(127,'mrbird','2020-11-27 10:54:50','åç½IP|0|0|åç½IP|åç½IP','192.168.43.143','Windows 10','Chrome 87'),(128,'mrbird','2020-11-27 10:55:55','åç½IP|0|0|åç½IP|åç½IP','192.168.43.143','Windows 10','Chrome 87'),(129,'mrbird','2020-11-27 14:09:20','åç½IP|0|0|åç½IP|åç½IP','192.168.43.143','Windows 10','Chrome 87'),(130,'mrbird','2020-11-27 14:11:03','åç½IP|0|0|åç½IP|åç½IP','192.168.43.143','Windows 10','Chrome 87'),(131,'mrbird','2020-11-27 14:17:29','åç½IP|0|0|åç½IP|åç½IP','192.168.43.143','Windows 10','Chrome 87'),(132,'mrbird','2020-11-27 14:24:22','åç½IP|0|0|åç½IP|åç½IP','192.168.43.143','Windows 10','Chrome 87'),(133,'mrbird','2020-11-27 14:34:53','åç½IP|0|0|åç½IP|åç½IP','192.168.43.143','Windows 10','Chrome 87'),(134,'mrbird','2020-11-27 14:36:34','åç½IP|0|0|åç½IP|åç½IP','192.168.43.143','Windows 10','Chrome 87'),(135,'mrbird','2020-11-27 14:45:08','åç½IP|0|0|åç½IP|åç½IP','192.168.43.143','Windows 10','Chrome 87'),(136,'mrbird','2020-11-27 14:46:56','åç½IP|0|0|åç½IP|åç½IP','192.168.43.143','Windows 10','Chrome 87'),(137,'mrbird','2020-11-27 14:57:25','åç½IP|0|0|åç½IP|åç½IP','192.168.43.143','Windows 10','Chrome 87'),(138,'mrbird','2020-11-27 15:05:56','åç½IP|0|0|åç½IP|åç½IP','192.168.43.143','Windows 10','Chrome 87'),(139,'mrbird','2020-11-27 15:08:28','åç½IP|0|0|åç½IP|åç½IP','192.168.43.143','Windows 10','Chrome 87'),(140,'mrbird','2020-11-27 15:16:33','åç½IP|0|0|åç½IP|åç½IP','192.168.43.143','Windows 10','Chrome 87'),(141,'mrbird','2020-11-27 15:22:17','åç½IP|0|0|åç½IP|åç½IP','192.168.43.143','Windows 10','Chrome 87'),(142,'mrbird','2020-11-27 15:28:52','åç½IP|0|0|åç½IP|åç½IP','192.168.43.143','Windows 10','Chrome 87'),(143,'mrbird','2020-11-27 15:31:35','åç½IP|0|0|åç½IP|åç½IP','192.168.43.143','Windows 10','Chrome 87'),(144,'mrbird','2020-11-27 15:33:32','åç½IP|0|0|åç½IP|åç½IP','192.168.43.143','Windows 10','Chrome 87'),(145,'mrbird','2020-11-27 15:40:46','åç½IP|0|0|åç½IP|åç½IP','192.168.43.143','Windows 10','Chrome 87'),(146,'mrbird','2020-11-27 15:44:25','åç½IP|0|0|åç½IP|åç½IP','192.168.43.143','Windows 10','Chrome 87'),(147,'mrbird','2020-11-27 15:58:35','åç½IP|0|0|åç½IP|åç½IP','192.168.43.143','Windows 10','Chrome 87'),(148,'mrbird','2020-11-27 16:00:56','åç½IP|0|0|åç½IP|åç½IP','192.168.43.143','Windows 10','Chrome 87'),(149,'mrbird','2020-11-27 16:05:17','åç½IP|0|0|åç½IP|åç½IP','192.168.43.143','Windows 10','Chrome 87'),(150,'mrbird','2020-11-27 16:06:06','åç½IP|0|0|åç½IP|åç½IP','192.168.43.143','Windows 10','Chrome 87'),(151,'mrbird','2020-11-27 16:07:17','åç½IP|0|0|åç½IP|åç½IP','192.168.43.143','Windows 10','Chrome 87'),(152,'mrbird','2020-11-27 16:36:37','åç½IP|0|0|åç½IP|åç½IP','192.168.43.143','Windows 10','Chrome 87'),(153,'mrbird','2020-11-27 16:47:13','åç½IP|0|0|åç½IP|åç½IP','192.168.43.143','Windows 10','Chrome 87'),(154,'mrbird','2020-11-27 16:54:11','åç½IP|0|0|åç½IP|åç½IP','192.168.43.143','Windows 10','Chrome 87'),(155,'mrbird','2020-11-27 17:08:08','åç½IP|0|0|åç½IP|åç½IP','192.168.43.143','Windows 10','Chrome 87'),(156,'mrbird','2020-11-27 17:40:37','åç½IP|0|0|åç½IP|åç½IP','192.168.43.143','Windows 10','Chrome 87');
/*!40000 ALTER TABLE `t_login_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_menu`
--

DROP TABLE IF EXISTS `t_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_menu` (
  `MENU_ID` bigint NOT NULL AUTO_INCREMENT COMMENT 'èå/æé®ID',
  `PARENT_ID` bigint NOT NULL COMMENT 'ä¸çº§èåID',
  `MENU_NAME` varchar(50) NOT NULL COMMENT 'èå/æé®åç§°',
  `URL` varchar(50) DEFAULT NULL COMMENT 'èåURL',
  `PERMS` text COMMENT 'æéæ è¯',
  `ICON` varchar(50) DEFAULT NULL COMMENT 'å¾æ ',
  `TYPE` char(2) NOT NULL COMMENT 'ç±»å 0èå 1æé®',
  `ORDER_NUM` bigint DEFAULT NULL COMMENT 'æåº',
  `CREATE_TIME` datetime NOT NULL COMMENT 'åå»ºæ¶é´',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT 'ä¿®æ¹æ¶é´',
  PRIMARY KEY (`MENU_ID`) USING BTREE,
  KEY `t_menu_parent_id` (`PARENT_ID`),
  KEY `t_menu_menu_id` (`MENU_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=218 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='èåè¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_menu`
--

LOCK TABLES `t_menu` WRITE;
/*!40000 ALTER TABLE `t_menu` DISABLE KEYS */;
INSERT INTO `t_menu` VALUES (1,0,'ç³»ç»ç®¡ç',NULL,NULL,'layui-icon-setting','0',1,'2017-12-27 16:39:07',NULL),(2,0,'ç³»ç»çæ§','','','layui-icon-alert','0',2,'2017-12-27 16:45:51','2019-06-13 11:20:40'),(3,1,'ç¨æ·ç®¡ç','/system/user','user:view','','0',1,'2017-12-27 16:47:13','2019-12-04 16:46:50'),(4,1,'è§è²ç®¡ç','/system/role','role:view','','0',2,'2017-12-27 16:48:09','2019-06-13 08:57:19'),(5,1,'èåç®¡ç','/system/menu','menu:view','','0',3,'2017-12-27 16:48:57','2019-06-13 08:57:34'),(6,1,'é¨é¨ç®¡ç','/system/dept','dept:view','','0',4,'2017-12-27 16:57:33','2019-06-14 19:56:00'),(8,2,'å¨çº¿ç¨æ·','/monitor/online','online:view','','0',1,'2017-12-27 16:59:33','2019-06-13 14:30:31'),(10,2,'ç³»ç»æ¥å¿','/monitor/log','log:view','','0',2,'2017-12-27 17:00:50','2019-06-13 14:30:37'),(11,3,'æ°å¢ç¨æ·',NULL,'user:add',NULL,'1',NULL,'2017-12-27 17:02:58',NULL),(12,3,'ä¿®æ¹ç¨æ·',NULL,'user:update',NULL,'1',NULL,'2017-12-27 17:04:07',NULL),(13,3,'å é¤ç¨æ·',NULL,'user:delete',NULL,'1',NULL,'2017-12-27 17:04:58',NULL),(14,4,'æ°å¢è§è²',NULL,'role:add',NULL,'1',NULL,'2017-12-27 17:06:38',NULL),(15,4,'ä¿®æ¹è§è²',NULL,'role:update',NULL,'1',NULL,'2017-12-27 17:06:38',NULL),(16,4,'å é¤è§è²',NULL,'role:delete',NULL,'1',NULL,'2017-12-27 17:06:38',NULL),(17,5,'æ°å¢èå',NULL,'menu:add',NULL,'1',NULL,'2017-12-27 17:08:02',NULL),(18,5,'ä¿®æ¹èå',NULL,'menu:update',NULL,'1',NULL,'2017-12-27 17:08:02',NULL),(19,5,'å é¤èå',NULL,'menu:delete',NULL,'1',NULL,'2017-12-27 17:08:02',NULL),(20,6,'æ°å¢é¨é¨',NULL,'dept:add',NULL,'1',NULL,'2017-12-27 17:09:24',NULL),(21,6,'ä¿®æ¹é¨é¨',NULL,'dept:update',NULL,'1',NULL,'2017-12-27 17:09:24',NULL),(22,6,'å é¤é¨é¨',NULL,'dept:delete',NULL,'1',NULL,'2017-12-27 17:09:24',NULL),(23,8,'è¸¢åºç¨æ·',NULL,'user:kickout',NULL,'1',NULL,'2017-12-27 17:11:13',NULL),(24,10,'å é¤æ¥å¿',NULL,'log:delete',NULL,'1',NULL,'2017-12-27 17:11:45','2019-06-06 05:56:40'),(101,0,'ä»»å¡è°åº¦',NULL,NULL,'layui-icon-time-circle','0',3,'2018-02-24 15:52:57',NULL),(102,101,'å®æ¶ä»»å¡','/job/job','job:view','','0',1,'2018-02-24 15:53:53','2018-04-25 09:05:12'),(103,102,'æ°å¢ä»»å¡',NULL,'job:add',NULL,'1',NULL,'2018-02-24 15:55:10',NULL),(104,102,'ä¿®æ¹ä»»å¡',NULL,'job:update',NULL,'1',NULL,'2018-02-24 15:55:53',NULL),(105,102,'å é¤ä»»å¡',NULL,'job:delete',NULL,'1',NULL,'2018-02-24 15:56:18',NULL),(106,102,'æåä»»å¡',NULL,'job:pause',NULL,'1',NULL,'2018-02-24 15:57:08',NULL),(107,102,'æ¢å¤ä»»å¡',NULL,'job:resume',NULL,'1',NULL,'2018-02-24 15:58:21',NULL),(108,102,'ç«å³æ§è¡ä»»å¡',NULL,'job:run',NULL,'1',NULL,'2018-02-24 15:59:45',NULL),(109,101,'è°åº¦æ¥å¿','/job/log','job:log:view','','0',2,'2018-02-24 16:00:45','2019-06-09 02:48:19'),(110,109,'å é¤æ¥å¿',NULL,'job:log:delete',NULL,'1',NULL,'2018-02-24 16:01:21',NULL),(115,0,'å¶ä»æ¨¡å',NULL,NULL,'layui-icon-gift','0',5,'2019-05-27 10:18:07',NULL),(116,115,'Apexå¾è¡¨','','',NULL,'0',2,'2019-05-27 10:21:35',NULL),(117,116,'çº¿æ§å¾è¡¨','/others/apex/line','apex:line:view',NULL,'0',1,'2019-05-27 10:24:49',NULL),(118,115,'é«å¾·å°å¾','/others/map','map:view','','0',3,'2019-05-27 17:13:12','2019-06-12 15:33:00'),(119,116,'é¢ç§¯å¾è¡¨','/others/apex/area','apex:area:view',NULL,'0',2,'2019-05-27 18:49:22',NULL),(120,116,'æ±å½¢å¾è¡¨','/others/apex/column','apex:column:view',NULL,'0',3,'2019-05-27 18:51:33',NULL),(121,116,'é·è¾¾å¾è¡¨','/others/apex/radar','apex:radar:view',NULL,'0',4,'2019-05-27 18:56:05',NULL),(122,116,'æ¡å½¢å¾è¡¨','/others/apex/bar','apex:bar:view',NULL,'0',5,'2019-05-27 18:57:02',NULL),(123,116,'æ··åå¾è¡¨','/others/apex/mix','apex:mix:view','','0',6,'2019-05-27 18:58:04','2019-06-06 02:55:23'),(125,115,'å¯¼å¥å¯¼åº','/others/eximport','others:eximport:view','','0',4,'2019-05-27 19:01:57','2019-06-13 01:20:14'),(126,132,'ç³»ç»å¾æ ','/others/febs/icon','febs:icons:view','','0',4,'2019-05-27 19:03:18','2019-06-06 03:05:26'),(127,2,'è¯·æ±è¿½è¸ª','/monitor/httptrace','httptrace:view','','0',6,'2019-05-27 19:06:38','2019-06-13 14:36:43'),(128,2,'ç³»ç»ä¿¡æ¯',NULL,NULL,NULL,'0',7,'2019-05-27 19:08:23',NULL),(129,128,'JVMä¿¡æ¯','/monitor/jvm','jvm:view','','0',1,'2019-05-27 19:08:50','2019-06-13 14:36:51'),(131,128,'æå¡å¨ä¿¡æ¯','/monitor/server','server:view','','0',3,'2019-05-27 19:10:07','2019-06-13 14:37:04'),(132,115,'FEBSç»ä»¶','','',NULL,'0',1,'2019-05-27 19:13:54',NULL),(133,132,'è¡¨åç»ä»¶','/others/febs/form','febs:form:view',NULL,'0',1,'2019-05-27 19:14:45',NULL),(134,132,'FEBSå·¥å·','/others/febs/tools','febs:tools:view','','0',3,'2019-05-29 10:11:22','2019-06-12 13:21:27'),(135,132,'è¡¨åç»å','/others/febs/form/group','febs:formgroup:view',NULL,'0',2,'2019-05-29 10:16:19',NULL),(136,2,'ç»å½æ¥å¿','/monitor/loginlog','loginlog:view','','0',3,'2019-05-29 15:56:15','2019-06-13 14:35:56'),(137,0,'ä»£ç çæ','',NULL,'layui-icon-verticalright','0',4,'2019-06-03 15:35:58',NULL),(138,137,'çæéç½®','/generator/configure','generator:configure:view',NULL,'0',1,'2019-06-03 15:38:36',NULL),(139,137,'ä»£ç çæ','/generator/generator','generator:view','','0',2,'2019-06-03 15:39:15','2019-06-13 14:31:38'),(159,132,'å¶ä»ç»ä»¶','/others/febs/others','others:febs:others','','0',5,'2019-06-12 07:51:08','2019-06-12 07:51:40'),(160,3,'å¯ç éç½®',NULL,'user:password:reset',NULL,'1',NULL,'2019-06-13 08:40:13',NULL),(161,3,'å¯¼åºExcel',NULL,'user:export',NULL,'1',NULL,'2019-06-13 08:40:34',NULL),(162,4,'å¯¼åºExcel',NULL,'role:export',NULL,'1',NULL,'2019-06-13 14:29:00','2019-06-13 14:29:11'),(163,5,'å¯¼åºExcel',NULL,'menu:export',NULL,'1',NULL,'2019-06-13 14:29:32',NULL),(164,6,'å¯¼åºExcel',NULL,'dept:export',NULL,'1',NULL,'2019-06-13 14:29:59',NULL),(165,138,'ä¿®æ¹éç½®',NULL,'generator:configure:update',NULL,'1',NULL,'2019-06-13 14:32:09','2019-06-13 14:32:20'),(166,139,'çæä»£ç ',NULL,'generator:generate',NULL,'1',NULL,'2019-06-13 14:32:51',NULL),(167,125,'æ¨¡æ¿ä¸è½½',NULL,'eximport:template',NULL,'1',NULL,'2019-06-13 14:33:37',NULL),(168,125,'å¯¼åºExcel',NULL,'eximport:export',NULL,'1',NULL,'2019-06-13 14:33:57',NULL),(169,125,'å¯¼å¥Excel',NULL,'eximport:import',NULL,'1',NULL,'2019-06-13 14:34:19',NULL),(170,10,'å¯¼åºExcel',NULL,'log:export',NULL,'1',NULL,'2019-06-13 14:34:55',NULL),(171,136,'å é¤æ¥å¿',NULL,'loginlog:delete',NULL,'1',NULL,'2019-06-13 14:35:27','2019-06-13 14:36:08'),(172,136,'å¯¼åºExcel',NULL,'loginlog:export',NULL,'1',NULL,'2019-06-13 14:36:26',NULL),(173,102,'å¯¼åºExcel',NULL,'job:export',NULL,'1',NULL,'2019-06-13 14:37:25',NULL),(174,109,'å¯¼åºExcel',NULL,'job:log:export',NULL,'1',NULL,'2019-06-13 14:37:46','2019-06-13 14:38:02'),(175,2,'Swaggerææ¡£','/monitor/swagger','swagger:view','','0',8,'2019-08-18 17:25:36','2019-08-18 17:25:59'),(178,115,'æ°æ®æé','/others/datapermission','others:datapermission','','0',5,'2020-04-29 09:34:25',NULL),(196,0,'å¬å¸ç®¡ç','','','layui-icon-home','0',NULL,'2020-07-29 14:01:32',NULL),(197,196,'è®¢åç®¡ç','/system/order/','order:view','layui-icon-filedone','0',1,'2020-07-29 14:02:14',NULL),(198,197,'æ°å¢è®¢å',NULL,'order:create',NULL,'1',NULL,'2020-07-29 14:02:35',NULL),(199,197,'ç»çå®¡æ¹',NULL,'order:approve:manager',NULL,'1',NULL,'2020-07-29 14:04:17',NULL),(200,197,'è´¢å¡å®¡æ¹',NULL,'order:approve:accounting',NULL,'1',NULL,'2020-07-29 14:04:43',NULL),(201,197,'äº¤ä»å®¡æ¹',NULL,'order:approve:sales',NULL,'1',NULL,'2020-07-29 14:05:10',NULL),(203,197,'å®¡æ¹è®¢å','/system/order/approve','order:approve','','0',1,'2020-07-29 14:06:48','2020-07-31 13:53:10'),(204,197,'å½æ¡£è®¢å','/system/order/archive','order:archive','','0',2,'2020-07-29 14:07:38','2020-07-31 13:53:16'),(205,0,'è´§åç®¡ç','/system/goods','goods:view','layui-icon-car','0',0,'2020-07-29 14:09:46','2020-11-26 10:39:01'),(206,205,'æ°å¢è´§å',NULL,'goods:create',NULL,'1',NULL,'2020-07-29 14:10:49','2020-11-26 10:14:03'),(207,205,'ä¿®æ¹æå é¤è´§å',NULL,'goods:modify',NULL,'1',NULL,'2020-07-29 14:11:20','2020-11-26 10:13:55'),(210,205,'åºå®è´§å','','goods:sale','','1',NULL,'2020-07-29 17:01:49','2020-11-26 09:11:03'),(212,0,'å®¢æ·ç®¡ç','/system/customer/','customer:view','layui-icon-team','0',0,'2020-07-29 22:37:50','2020-11-26 10:46:59'),(213,212,'æ°å¢å®¢æ·',NULL,'customer:create',NULL,'1',NULL,'2020-07-29 22:38:45',NULL),(214,212,'ä¿®æ¹å®¢æ·',NULL,'customer:update',NULL,'1',NULL,'2020-07-29 22:39:20','2020-07-29 23:57:52'),(215,212,'å é¤å®¢æ·',NULL,'customer:delete',NULL,'1',NULL,'2020-07-29 22:40:16',NULL),(217,196,'ä¸ç»©ç»è®¡','/system/achievement/','achievement:view','layui-icon-linechart','0',4,'2020-07-30 14:05:09','2020-07-30 14:08:46');
/*!40000 ALTER TABLE `t_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_role`
--

DROP TABLE IF EXISTS `t_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_role` (
  `ROLE_ID` bigint NOT NULL AUTO_INCREMENT COMMENT 'è§è²ID',
  `ROLE_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'è§è²åç§°',
  `REMARK` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'è§è²æè¿°',
  `CREATE_TIME` datetime NOT NULL COMMENT 'åå»ºæ¶é´',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT 'ä¿®æ¹æ¶é´',
  PRIMARY KEY (`ROLE_ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='è§è²è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_role`
--

LOCK TABLES `t_role` WRITE;
/*!40000 ALTER TABLE `t_role` DISABLE KEYS */;
INSERT INTO `t_role` VALUES (1,'ç³»ç»ç®¡çå','ç³»ç»ç®¡çåï¼æ¥ææææä½æé ^_^','2019-06-14 16:23:11','2020-07-30 14:05:19'),(2,'æ³¨åè´¦æ·','æ³¨åè´¦æ·ï¼æ¥ææ¥çï¼æ°å¢æéï¼æ°å¢ç¨æ·é¤å¤ï¼åå¯¼åºExcelæé','2019-06-14 16:00:15','2019-08-18 17:36:02'),(77,'Redisçæ§å','è´è´£Redisæ¨¡å','2019-06-14 20:49:22',NULL),(78,'ç³»ç»çæ§å','è´è´£æ´ä¸ªç³»ç»çæ§æ¨¡å','2019-06-14 20:50:07',NULL),(79,'è·æ¹äººå','è´è´£ä»»å¡è°åº¦è·æ¹æ¨¡å','2019-06-14 20:51:02',NULL),(80,'å¼åäººå','æ¥æä»£ç çææ¨¡åçæé','2019-06-14 20:51:26',NULL),(84,'åºä¸»','åºä¸»','2020-11-26 08:57:45',NULL);
/*!40000 ALTER TABLE `t_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_role_menu`
--

DROP TABLE IF EXISTS `t_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_role_menu` (
  `ROLE_ID` bigint NOT NULL COMMENT 'è§è²ID',
  `MENU_ID` bigint NOT NULL COMMENT 'èå/æé®ID',
  KEY `t_role_menu_menu_id` (`MENU_ID`),
  KEY `t_role_menu_role_id` (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='è§è²èåå³èè¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_role_menu`
--

LOCK TABLES `t_role_menu` WRITE;
/*!40000 ALTER TABLE `t_role_menu` DISABLE KEYS */;
INSERT INTO `t_role_menu` VALUES (77,2),(78,2),(78,8),(78,23),(78,10),(78,24),(78,170),(78,136),(78,171),(78,172),(78,127),(78,128),(78,129),(78,131),(79,101),(79,102),(79,103),(79,104),(79,105),(79,106),(79,107),(79,108),(79,173),(79,109),(79,110),(79,174),(80,137),(80,138),(80,165),(80,139),(80,166),(2,1),(2,3),(2,161),(2,4),(2,14),(2,162),(2,5),(2,17),(2,163),(2,6),(2,20),(2,164),(2,2),(2,8),(2,10),(2,170),(2,136),(2,172),(2,127),(2,128),(2,129),(2,131),(2,175),(2,101),(2,102),(2,173),(2,109),(2,174),(2,137),(2,138),(2,139),(2,115),(2,132),(2,133),(2,135),(2,134),(2,126),(2,159),(2,116),(2,117),(2,119),(2,120),(2,121),(2,122),(2,123),(2,118),(2,125),(2,167),(2,168),(2,169),(2,178),(1,196),(1,217),(1,197),(1,201),(1,200),(1,199),(1,198),(1,203),(1,204),(1,205),(1,206),(1,207),(1,210),(1,212),(1,213),(1,214),(1,215),(1,1),(1,3),(1,11),(1,12),(1,13),(1,161),(1,160),(1,4),(1,14),(1,162),(1,15),(1,16),(1,5),(1,163),(1,17),(1,18),(1,19),(1,6),(1,20),(1,21),(1,22),(1,164),(1,2),(1,8),(1,23),(1,10),(1,24),(1,170),(1,136),(1,172),(1,171),(1,127),(1,128),(1,129),(1,131),(1,175),(1,101),(1,102),(1,103),(1,104),(1,105),(1,106),(1,107),(1,108),(1,173),(1,109),(1,174),(1,110),(1,137),(1,138),(1,165),(1,139),(1,166),(1,115),(1,132),(1,133),(1,135),(1,134),(1,126),(1,159),(1,116),(1,117),(1,119),(1,120),(1,121),(1,122),(1,123),(1,118),(1,125),(1,169),(1,168),(1,167),(1,178),(84,196),(84,197),(84,212),(84,213),(84,214),(84,215);
/*!40000 ALTER TABLE `t_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user`
--

DROP TABLE IF EXISTS `t_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_user` (
  `USER_ID` bigint NOT NULL AUTO_INCREMENT COMMENT 'ç¨æ·ID',
  `USERNAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ç¨æ·å',
  `PASSWORD` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'å¯ç ',
  `DEPT_ID` bigint DEFAULT NULL COMMENT 'é¨é¨ID',
  `EMAIL` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'é®ç®±',
  `MOBILE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'èç³»çµè¯',
  `STATUS` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ç¶æ 0éå® 1ææ',
  `CREATE_TIME` datetime NOT NULL COMMENT 'åå»ºæ¶é´',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT 'ä¿®æ¹æ¶é´',
  `LAST_LOGIN_TIME` datetime DEFAULT NULL COMMENT 'æè¿è®¿é®æ¶é´',
  `SSEX` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'æ§å« 0ç· 1å¥³ 2ä¿å¯',
  `IS_TAB` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'æ¯å¦å¼å¯tabï¼0å³é­ 1å¼å¯',
  `THEME` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'ä¸»é¢',
  `AVATAR` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'å¤´å',
  `DESCRIPTION` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'æè¿°',
  PRIMARY KEY (`USER_ID`) USING BTREE,
  KEY `t_user_username` (`USERNAME`),
  KEY `t_user_mobile` (`MOBILE`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='ç¨æ·è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user`
--

LOCK TABLES `t_user` WRITE;
/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;
INSERT INTO `t_user` VALUES (1,'MrBird','cb62ad1497597283961545d608f80241',1,'mrbird@qq.com','17788888888','1','2019-06-14 20:39:22','2019-12-04 16:47:11','2020-11-27 17:40:38','0','1','black','cnrhVkzwxjPwAaCfPbdc.png','ææ¯å¸æ¯ä½èã'),(2,'Scott','1d685729d113cfd03872f154939bee1c',10,'scott@gmail.com','17722222222','1','2019-06-14 20:55:53','2019-06-14 21:05:43','2019-08-18 17:36:18','0','1','black','gaOngJwsRYRaVAuXXcmB.png','ææ¯scottã'),(3,'Reina','1461afff857c02afbfb768aa3771503d',4,'Reina@hotmail.com','17711111111','0','2019-06-14 21:07:38','2019-06-14 21:09:06','2019-06-14 21:08:26','1','1','black','5997fedcc7bd4cffbd350b40d1b5b987.jpg','ç±äºå¬æ¬¾ç§ç¨ï¼å·²è¢«å°ç¦ã'),(4,'Micaela','9f2daa2c7bed6870fcbb5b9a51d6300e',10,'Micaela@163.com','17733333333','1','2019-06-14 21:10:13','2019-06-14 21:11:26','2019-06-14 21:10:37','0','0','white','20180414165909.jpg','æå«ç±³åæ'),(5,'Jana','176679b77b3c3e352bd3b30ddc81083e',8,'Jana@126.com','17744444444','1','2019-06-14 21:12:16','2019-06-14 21:12:52','2019-06-14 21:12:32','1','1','white','20180414165821.jpg','å¤§å®¶å¥½ï¼æå«ç®å¨'),(6,'Georgie','dffc683378cdaa015a0ee9554c532225',3,'Georgie@qq.com','17766666666','0','2019-06-14 21:15:09','2019-06-14 21:16:25','2019-06-14 21:16:11','2','0','black','BiazfanxmamNRoxxVxka.png','çäº§æ§è¡rm -rf *ï¼è´¦å·å°ç¦T T'),(7,'Margot','31379841b9f4bfde22b8b40471e9a6ce',9,'Margot@qq.com','13444444444','1','2019-06-14 21:17:53','2019-06-14 21:18:59','2019-06-14 21:18:07','1','1','white','20180414165834.jpg','å¤§å®¶å¥½æå«çæ'),(8,'zhangsan','92dac726ea92d5bdd01eab9aef544c95',6,'12345@asd.com','13911112222','1','2020-07-26 18:21:47',NULL,'2020-07-31 13:30:28','0','1','black','default.jpg',''),(9,'beiyan','67c721ec501e9ae880dc517f9c74e9e2',2,'beiyan@qq.com','15034654506','1','2020-07-29 09:42:39',NULL,'2020-07-29 10:03:58','2','1','black','default.jpg','æµè¯ç®¡çåè´¦å·');
/*!40000 ALTER TABLE `t_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user_data_permission`
--

DROP TABLE IF EXISTS `t_user_data_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_user_data_permission` (
  `USER_ID` bigint NOT NULL,
  `DEPT_ID` bigint NOT NULL,
  PRIMARY KEY (`USER_ID`,`DEPT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ç¨æ·æ°æ®æéå³èè¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user_data_permission`
--

LOCK TABLES `t_user_data_permission` WRITE;
/*!40000 ALTER TABLE `t_user_data_permission` DISABLE KEYS */;
INSERT INTO `t_user_data_permission` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(2,1),(2,2),(3,4),(4,5);
/*!40000 ALTER TABLE `t_user_data_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user_role`
--

DROP TABLE IF EXISTS `t_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_user_role` (
  `USER_ID` bigint NOT NULL COMMENT 'ç¨æ·ID',
  `ROLE_ID` bigint NOT NULL COMMENT 'è§è²ID',
  KEY `t_user_role_user_id` (`USER_ID`),
  KEY `t_user_role_role_id` (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='ç¨æ·è§è²å³èè¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user_role`
--

LOCK TABLES `t_user_role` WRITE;
/*!40000 ALTER TABLE `t_user_role` DISABLE KEYS */;
INSERT INTO `t_user_role` VALUES (1,1),(2,2),(3,77),(4,78),(5,79),(6,80),(7,78),(7,79),(7,80),(9,1);
/*!40000 ALTER TABLE `t_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'gwarbms'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-28 17:13:05

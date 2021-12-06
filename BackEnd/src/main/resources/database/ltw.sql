-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: btlltw
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `coach`
--

DROP TABLE IF EXISTS `coach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coach` (
  `id` int NOT NULL AUTO_INCREMENT,
  `plate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `manufacturer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `capacity` int NOT NULL,
  `years_of_use` float NOT NULL,
  `last_maintenance_day` date NOT NULL,
  `is_active` tinyint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coach`
--

LOCK TABLES `coach` WRITE;
/*!40000 ALTER TABLE `coach` DISABLE KEYS */;
INSERT INTO `coach` VALUES (1,'29A88698','Universe','Hyundai',45,7,'2021-10-14',1),(2,'29C83201','Wenda','Samco',45,6,'2021-10-26',1),(3,'29C41935','Aero Space','Hyundai',45,4,'2021-05-30',1),(4,'29F93714','Universe','Hino',45,8,'2021-08-02',1),(5,'29D58770','Tracomeco','Hyundai',45,4,'2021-03-21',1),(6,'29B73168','Universe','Hyundai',45,3,'2021-05-09',1),(7,'29C30766','Wenda','Samco',45,3,'2021-03-24',1),(8,'29C88568','Aero Space','Hyundai',45,3,'2021-11-01',1),(9,'29D88682','Universe','Hino',45,3,'2021-06-16',1),(10,'29D81939','Tracomeco','Hyundai',45,9,'2021-08-11',1),(11,'29B79417','Universe','Hyundai',45,7,'2021-11-01',1),(12,'29F52477','Wenda','Samco',45,6,'2021-01-24',1),(13,'29A91132','Aero Space','Hyundai',45,4,'2021-01-13',1),(14,'29E62545','Universe','Hino',45,4,'2021-11-07',1),(15,'29C43469','Tracomeco','Hyundai',45,5,'2021-03-15',1),(16,'29D54233','Isuzu Samco','Hyundai',29,7,'2021-09-13',1),(17,'29F63136','Kinglong','Thaco',29,6,'2021-06-10',1),(18,'29F88090','COUNTY LIMOUSINE','Hyundai',29,4,'2021-10-11',1),(19,'29F54282','COUNTY','Thaco',29,9,'2021-09-17',1),(20,'29E40395','VIP','Thaco',29,4,'2021-10-22',1),(21,'29A87191','Isuzu Samco','Hyundai',29,4,'2021-08-09',1),(22,'29D31295','Kinglong','Thaco',29,4,'2021-03-24',1),(23,'29C71097','COUNTY LIMOUSINE','Hyundai',29,3,'2021-09-20',1),(24,'29F37488','COUNTY','Thaco',29,3,'2021-01-24',1),(25,'29D77266','VIP','Thaco',29,3,'2021-11-17',1),(26,'29B42956','Isuzu Samco','Hyundai',29,3,'2021-11-15',1),(27,'29E61756','Kinglong','Thaco',29,3,'2020-12-15',1),(28,'29A38378','COUNTY LIMOUSINE','Hyundai',29,5,'2020-12-22',1),(29,'29B66433','COUNTY','Thaco',29,8,'2021-11-13',1),(30,'29C35217','VIP','Thaco',29,5,'2021-07-28',1),(31,'29E41872','Hiace','Toyota',16,5,'2020-12-12',1),(32,'29A75329','Transit','Ford',16,7,'2021-06-22',1),(33,'29C85664','Hiace','Toyota',16,8,'2021-07-31',1),(34,'29C40631','Transit','Ford',16,5,'2021-02-01',1),(35,'29E81937','Hiace','Toyota',16,6,'2021-07-15',1),(36,'29D68557','Transit','Ford',16,7,'2021-08-24',1);
/*!40000 ALTER TABLE `coach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coach_turn`
--

DROP TABLE IF EXISTS `coach_turn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coach_turn` (
  `id` int NOT NULL AUTO_INCREMENT,
  `passenger_amount` int NOT NULL,
  `ticket_price` float(255,0) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `grade_salary` float(255,0) NOT NULL,
  `coach_id` int NOT NULL,
  `route_id` int NOT NULL,
  `driver_id` int NOT NULL,
  `driver_asistant_id` int NOT NULL,
  `is_active` tinyint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_lx` (`driver_id`) USING BTREE,
  KEY `fk_px` (`driver_asistant_id`) USING BTREE,
  KEY `fk_xk` (`coach_id`) USING BTREE,
  KEY `fk_tx` (`route_id`) USING BTREE,
  CONSTRAINT `fk_lx` FOREIGN KEY (`driver_id`) REFERENCES `driver` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_px` FOREIGN KEY (`driver_asistant_id`) REFERENCES `driver` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_tx` FOREIGN KEY (`route_id`) REFERENCES `route` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_xk` FOREIGN KEY (`coach_id`) REFERENCES `coach` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coach_turn`
--

LOCK TABLES `coach_turn` WRITE;
/*!40000 ALTER TABLE `coach_turn` DISABLE KEYS */;
INSERT INTO `coach_turn` VALUES (1,35,100000,'2021-01-01 08:00:00','2021-01-01 10:00:00',2,3,17,25,3,1),(2,24,300000,'2021-01-04 12:00:00','2021-01-04 20:00:00',4,25,7,7,25,1),(3,18,100000,'2021-01-07 10:00:00','2021-01-07 12:00:00',2,21,19,12,2,1),(4,32,100000,'2021-01-10 07:00:00','2021-01-10 09:00:00',2,10,16,3,10,1),(5,33,100000,'2021-01-13 12:00:00','2021-01-13 14:00:00',2,12,19,18,9,1),(6,22,300000,'2021-01-16 09:00:00','2021-01-16 17:00:00',4,21,4,3,22,1),(7,27,200000,'2021-01-19 07:00:00','2021-01-19 11:00:00',3,20,11,24,14,1),(8,21,300000,'2021-01-22 10:00:00','2021-01-22 18:00:00',4,17,7,7,5,1),(9,34,100000,'2021-01-25 09:00:00','2021-01-25 11:00:00',2,7,15,3,8,1),(10,35,200000,'2021-01-28 07:00:00','2021-01-28 11:00:00',3,11,12,12,3,1),(11,19,300000,'2021-01-31 10:00:00','2021-01-31 18:00:00',4,24,4,6,14,1),(12,34,300000,'2021-02-03 09:00:00','2021-02-03 17:00:00',4,12,2,19,2,1),(13,20,300000,'2021-02-06 10:00:00','2021-02-06 18:00:00',4,22,8,7,9,1),(14,43,100000,'2021-02-09 07:00:00','2021-02-09 09:00:00',2,12,19,18,17,1),(15,35,300000,'2021-02-12 10:00:00','2021-02-12 18:00:00',4,1,6,5,7,1),(16,14,300000,'2021-02-15 12:00:00','2021-02-15 20:00:00',4,36,3,8,14,1),(17,26,200000,'2021-02-18 08:00:00','2021-02-18 12:00:00',3,21,12,10,21,1),(18,11,300000,'2021-02-21 09:00:00','2021-02-21 17:00:00',4,31,8,13,8,1),(19,10,300000,'2021-02-24 09:00:00','2021-02-24 17:00:00',4,33,2,21,15,1),(20,27,300000,'2021-02-27 08:00:00','2021-02-27 16:00:00',4,28,2,14,19,1),(21,21,100000,'2021-03-02 11:00:00','2021-03-02 13:00:00',2,21,19,18,7,1),(22,41,300000,'2021-03-05 10:00:00','2021-03-05 18:00:00',4,6,1,17,16,1),(23,17,100000,'2021-03-08 08:00:00','2021-03-08 10:00:00',2,29,17,18,10,1),(24,44,200000,'2021-03-11 08:00:00','2021-03-11 12:00:00',3,11,11,7,24,1),(25,32,200000,'2021-03-14 09:00:00','2021-03-14 13:00:00',3,10,12,13,22,1),(26,15,200000,'2021-03-17 08:00:00','2021-03-17 12:00:00',3,30,10,1,23,1),(27,20,100000,'2021-03-20 09:00:00','2021-03-20 11:00:00',2,21,19,12,8,1),(28,25,200000,'2021-03-23 11:00:00','2021-03-23 15:00:00',3,21,14,22,10,1),(29,10,200000,'2021-03-26 08:00:00','2021-03-26 12:00:00',3,31,10,9,13,1),(30,19,200000,'2021-03-29 09:00:00','2021-03-29 13:00:00',3,17,12,8,24,1),(31,20,100000,'2021-04-01 11:00:00','2021-04-01 13:00:00',2,30,18,13,17,1),(32,23,300000,'2021-04-04 08:00:00','2021-04-04 16:00:00',4,21,6,18,16,1),(33,31,100000,'2021-04-07 11:00:00','2021-04-07 13:00:00',2,10,17,20,19,1),(34,44,200000,'2021-04-10 07:00:00','2021-04-10 11:00:00',3,11,13,22,11,1),(35,15,200000,'2021-04-13 12:00:00','2021-04-13 16:00:00',3,18,9,22,16,1),(36,31,200000,'2021-04-16 12:00:00','2021-04-16 16:00:00',3,13,13,10,13,1),(37,13,100000,'2021-04-19 12:00:00','2021-04-19 14:00:00',2,31,17,6,11,1),(38,14,200000,'2021-04-22 11:00:00','2021-04-22 15:00:00',3,36,10,3,20,1),(39,25,300000,'2021-04-25 08:00:00','2021-04-25 16:00:00',4,21,6,10,21,1),(40,32,100000,'2021-04-28 08:00:00','2021-04-28 10:00:00',2,6,19,3,17,1),(41,12,300000,'2021-05-01 12:00:00','2021-05-01 20:00:00',4,31,1,12,22,1),(42,16,200000,'2021-05-04 12:00:00','2021-05-04 16:00:00',3,36,13,6,19,1),(43,26,200000,'2021-05-07 08:00:00','2021-05-07 12:00:00',3,29,10,1,22,1),(44,43,300000,'2021-05-10 09:00:00','2021-05-10 17:00:00',4,15,5,1,19,1),(45,11,100000,'2021-05-13 09:00:00','2021-05-13 11:00:00',2,33,17,14,1,1),(46,23,300000,'2021-05-16 11:00:00','2021-05-16 19:00:00',4,30,5,16,14,1),(47,30,200000,'2021-05-19 09:00:00','2021-05-19 13:00:00',3,10,12,1,20,1),(48,16,200000,'2021-05-22 10:00:00','2021-05-22 14:00:00',3,26,12,17,13,1),(49,37,200000,'2021-05-25 08:00:00','2021-05-25 12:00:00',3,8,14,2,23,1),(50,30,200000,'2021-05-28 11:00:00','2021-05-28 15:00:00',3,9,10,8,24,1),(51,16,100000,'2021-05-31 07:00:00','2021-05-31 09:00:00',2,36,15,20,9,1),(52,29,100000,'2021-06-03 10:00:00','2021-06-03 12:00:00',2,22,16,15,13,1),(53,16,100000,'2021-06-06 07:00:00','2021-06-06 09:00:00',2,32,18,21,11,1),(54,16,300000,'2021-06-09 08:00:00','2021-06-09 16:00:00',4,19,7,8,12,1),(55,41,200000,'2021-06-12 09:00:00','2021-06-12 13:00:00',3,8,13,9,6,1),(56,25,100000,'2021-06-15 07:00:00','2021-06-15 09:00:00',2,22,19,11,4,1),(57,27,300000,'2021-06-18 12:00:00','2021-06-18 20:00:00',4,26,5,23,4,1),(58,14,100000,'2021-06-21 12:00:00','2021-06-21 14:00:00',2,36,20,2,19,1),(59,39,300000,'2021-06-24 09:00:00','2021-06-24 17:00:00',4,3,8,21,14,1),(60,24,200000,'2021-06-27 11:00:00','2021-06-27 15:00:00',3,28,10,18,4,1),(61,16,100000,'2021-06-30 10:00:00','2021-06-30 12:00:00',2,21,19,24,14,1),(62,22,300000,'2021-07-03 11:00:00','2021-07-03 19:00:00',4,30,8,10,2,1),(63,44,300000,'2021-07-06 10:00:00','2021-07-06 18:00:00',4,8,2,2,24,1),(64,34,200000,'2021-07-09 09:00:00','2021-07-09 13:00:00',3,3,14,2,25,1),(65,40,300000,'2021-07-12 11:00:00','2021-07-12 19:00:00',4,4,4,6,1,1),(66,35,100000,'2021-07-15 08:00:00','2021-07-15 10:00:00',2,2,18,9,1,1),(67,30,100000,'2021-07-18 08:00:00','2021-07-18 10:00:00',2,7,18,25,4,1),(68,18,200000,'2021-07-21 11:00:00','2021-07-21 15:00:00',3,30,9,19,24,1),(69,42,100000,'2021-07-24 08:00:00','2021-07-24 10:00:00',2,15,20,2,16,1),(70,45,100000,'2021-07-27 08:00:00','2021-07-27 10:00:00',2,4,19,11,21,1),(71,45,300000,'2021-07-30 08:00:00','2021-07-30 16:00:00',4,9,7,12,21,1),(72,43,300000,'2021-08-02 11:00:00','2021-08-02 19:00:00',4,12,4,22,14,1),(73,15,300000,'2021-08-05 10:00:00','2021-08-05 18:00:00',4,16,4,5,24,1),(74,41,100000,'2021-08-08 11:00:00','2021-08-08 13:00:00',2,7,15,7,3,1),(75,35,200000,'2021-08-11 09:00:00','2021-08-11 13:00:00',3,8,14,12,21,1),(76,44,300000,'2021-08-14 12:00:00','2021-08-14 20:00:00',4,15,3,3,15,1),(77,40,300000,'2021-08-17 11:00:00','2021-08-17 19:00:00',4,5,3,22,17,1),(78,40,300000,'2021-08-20 10:00:00','2021-08-20 18:00:00',4,5,4,21,11,1),(79,33,100000,'2021-08-23 11:00:00','2021-08-23 13:00:00',2,6,19,25,13,1),(80,14,200000,'2021-08-26 09:00:00','2021-08-26 13:00:00',3,32,12,13,19,1),(81,10,200000,'2021-08-29 09:00:00','2021-08-29 13:00:00',3,35,13,2,11,1),(82,37,200000,'2021-09-01 11:00:00','2021-09-01 15:00:00',3,9,12,17,20,1),(83,20,300000,'2021-09-04 08:00:00','2021-09-04 16:00:00',4,24,7,14,18,1),(84,29,300000,'2021-09-07 11:00:00','2021-09-07 19:00:00',4,17,5,11,8,1),(85,16,100000,'2021-09-10 11:00:00','2021-09-10 13:00:00',2,22,16,19,22,1),(86,38,100000,'2021-09-13 07:00:00','2021-09-13 09:00:00',2,5,20,12,25,1),(87,15,100000,'2021-09-16 08:00:00','2021-09-16 10:00:00',2,22,17,7,1,1),(88,27,200000,'2021-09-19 10:00:00','2021-09-19 14:00:00',3,25,12,1,20,1),(89,24,100000,'2021-09-22 08:00:00','2021-09-22 10:00:00',2,23,20,17,23,1),(90,26,200000,'2021-09-25 12:00:00','2021-09-25 16:00:00',3,16,13,5,16,1),(91,20,100000,'2021-09-28 12:00:00','2021-09-28 14:00:00',2,21,18,16,4,1),(92,29,300000,'2021-10-01 07:00:00','2021-10-01 15:00:00',4,20,2,11,24,1),(93,45,100000,'2021-10-04 12:00:00','2021-10-04 14:00:00',2,14,18,7,5,1),(94,34,300000,'2021-10-07 11:00:00','2021-10-07 19:00:00',4,5,4,18,2,1),(95,36,300000,'2021-10-10 09:00:00','2021-10-10 17:00:00',4,5,6,24,22,1),(96,38,100000,'2021-10-13 08:00:00','2021-10-13 10:00:00',2,11,18,12,6,1),(97,36,200000,'2021-10-16 11:00:00','2021-10-16 15:00:00',3,3,14,1,17,1),(98,43,300000,'2021-10-19 11:00:00','2021-10-19 19:00:00',4,8,4,5,22,1),(99,31,200000,'2021-10-22 12:00:00','2021-10-22 16:00:00',3,3,11,23,21,1),(100,22,100000,'2021-10-25 10:00:00','2021-10-25 12:00:00',2,25,15,6,16,1),(101,30,200000,'2021-10-28 08:00:00','2021-10-28 12:00:00',3,9,14,11,20,1),(102,24,100000,'2021-10-31 07:00:00','2021-10-31 09:00:00',2,26,15,24,23,1),(103,25,300000,'2021-11-03 09:00:00','2021-11-03 17:00:00',4,27,7,9,20,1),(104,44,300000,'2021-11-06 11:00:00','2021-11-06 19:00:00',4,10,6,21,17,1),(105,20,200000,'2021-11-09 12:00:00','2021-11-09 16:00:00',3,19,9,9,13,1),(106,31,200000,'2021-11-12 12:00:00','2021-11-12 16:00:00',3,15,9,21,9,1),(107,42,100000,'2021-11-15 09:00:00','2021-11-15 11:00:00',2,12,19,10,23,1),(108,17,300000,'2021-11-18 07:00:00','2021-11-18 15:00:00',4,30,1,24,20,1),(109,13,300000,'2021-11-21 09:00:00','2021-11-21 17:00:00',4,34,5,8,7,1),(110,11,200000,'2021-11-24 09:00:00','2021-11-24 13:00:00',3,36,12,16,4,1),(111,28,200000,'2021-11-27 07:00:00','2021-11-27 11:00:00',3,19,9,5,15,1),(112,26,100000,'2021-11-30 12:00:00','2021-11-30 14:00:00',2,22,18,23,5,1),(113,39,100000,'2021-12-03 11:00:00','2021-12-03 13:00:00',2,5,15,19,11,1),(114,37,100000,'2021-12-06 11:00:00','2021-12-06 13:00:00',2,11,20,19,3,1);
/*!40000 ALTER TABLE `coach_turn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complexity`
--

DROP TABLE IF EXISTS `complexity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `complexity` (
  `complexity` int NOT NULL AUTO_INCREMENT,
  `grade_salary` float(255,0) NOT NULL,
  PRIMARY KEY (`complexity`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complexity`
--

LOCK TABLES `complexity` WRITE;
/*!40000 ALTER TABLE `complexity` DISABLE KEYS */;
INSERT INTO `complexity` VALUES (1,2),(2,3),(3,4);
/*!40000 ALTER TABLE `complexity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `driver`
--

DROP TABLE IF EXISTS `driver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `driver` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `id_card` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `driving_license_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `type_of_license` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `birthday` date NOT NULL,
  `experience` int NOT NULL,
  `is_active` tinyint NOT NULL,
  `fixed_salary_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_fsalary` (`fixed_salary_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driver`
--

LOCK TABLES `driver` WRITE;
/*!40000 ALTER TABLE `driver` DISABLE KEYS */;
INSERT INTO `driver` VALUES (1,'Trần Dương Trọng Anh','001078590270','010065617982','D','Hà Nội','1993-04-26',5,1,3),(2,'Hoàng Xuân Đạt','001026652790','010065897617','D','Hà Nội','1992-10-06',8,1,2),(3,'Phạm Việt Đức','001032582645','010069133148','E','Hà Nội','1993-06-25',6,1,4),(4,'Nguyễn Đức Giang','001054340696','010069042138','D','Hà Nội','1992-12-01',8,1,1),(5,'Lê Hoàng Hải','001030135506','010066835441','E','Hà Nội','1994-04-26',7,1,3),(6,'Trần Thiện Hải','001043968313','010066952729','D','Hà Nội','1994-11-25',5,1,2),(7,'Ngô Anh Hiếu','001031050869','010069177118','C','Hà Nội','1993-09-13',6,1,3),(8,'Nguyễn Minh Hiếu','001066970737','010068010643','C','Hà Nội','1993-09-16',8,1,4),(9,'Lê Bá Hoàng','001063376843','010066618735','E','Hà Nội','1992-06-26',6,1,2),(10,'Phạm Việt Hoàng','001041340073','010066177682','C','Hà Nội','1994-08-25',6,1,4),(11,'Triệu Huy Hoàng','001083795454','010066587445','D','Hà Nội','1994-12-11',7,1,1),(12,'Trần Việt Huy','001021861366','010066943558','E','Hà Nội','1995-05-23',7,1,1),(13,'Cao Văn Khang','001037126411','010066643434','E','Hà Nội','1992-07-22',6,1,1),(14,'Nguyễn Đức Lâm','001022637352','010065521276','C','Hà Nội','1993-05-26',6,1,1),(15,'Đặng Quyền Linh','001084966709','010069390760','E','Hà Nội','1995-01-20',6,1,4),(16,'Nguyễn Hoàng Long','001027574654','010067463909','C','Hà Nội','1993-02-12',7,1,2),(17,'Hoàng Văn Mạnh','001051523960','010067662849','C','Hà Nội','1993-02-27',5,1,2),(18,'Khuất Đình Mạnh','001052712652','010069297588','E','Hà Nội','1995-04-10',8,1,4),(19,'Vũ Đình Mạnh','001049663438','010066341823','C','Hà Nội','1993-01-31',6,1,4),(20,'Nguyễn Đức Minh','001085741087','010068385969','E','Hà Nội','1992-11-10',7,1,2),(21,'Trịnh Bình Minh','001071614962','010067763086','C','Hà Nội','1995-06-12',5,1,1),(22,'Nguyễn Duy Nam','001061650959','010065545578','D','Hà Nội','1994-11-04',7,1,1),(23,'Lê Minh Quang','001051759665','010066075541','C','Hà Nội','1994-05-30',6,1,1),(24,'Đoàn Văn Thịnh','001067195732','010066926062','E','Hà Nội','1992-12-14',7,1,2),(25,'Trần Khánh Việt','001037872277','010065952156','E','Hà Nội','1993-02-22',5,1,4);
/*!40000 ALTER TABLE `driver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fixed_salary`
--

DROP TABLE IF EXISTS `fixed_salary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fixed_salary` (
  `id` int NOT NULL AUTO_INCREMENT,
  `grade` float NOT NULL,
  `basic_salary` float NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `grade` (`grade`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fixed_salary`
--

LOCK TABLES `fixed_salary` WRITE;
/*!40000 ALTER TABLE `fixed_salary` DISABLE KEYS */;
INSERT INTO `fixed_salary` VALUES (1,2.2,1500000),(2,2.4,1500000),(3,2.57,1500000),(4,2.68,1500000);
/*!40000 ALTER TABLE `fixed_salary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `route`
--

DROP TABLE IF EXISTS `route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `route` (
  `id` int NOT NULL AUTO_INCREMENT,
  `point_of_departure` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `destination` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `length` float(255,0) NOT NULL,
  `complexity_id` int NOT NULL,
  `is_active` tinyint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_dpt` (`complexity_id`) USING BTREE,
  CONSTRAINT `fk_pdt` FOREIGN KEY (`complexity_id`) REFERENCES `complexity` (`complexity`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `route`
--

LOCK TABLES `route` WRITE;
/*!40000 ALTER TABLE `route` DISABLE KEYS */;
INSERT INTO `route` VALUES (1,'Hà Nội','Sơn La',300,3,1),(2,'Hà Nội','Nghệ An',331,3,1),(3,'Hà Nội','Hà Tĩnh',350,3,1),(4,'Hà Nội','Hà Giang',281,3,1),(5,'Sơn La','Hà Nội',300,3,1),(6,'Nghệ An','Hà Nội',331,3,1),(7,'Hà Tĩnh','Hà Nội',350,3,1),(8,'Hà Giang','Hà Nội',281,3,1),(9,'Hà Nội','Thái Bình',100,2,1),(10,'Hà Nội','Thanh Hóa',160,2,1),(11,'Hà Nội','Ninh Bình',100,2,1),(12,'Thái Bình','Hà Nội',100,2,1),(13,'Thanh Hóa','Hà Nội',160,2,1),(14,'Ninh Bình','Hà Nội',100,2,1),(15,'Hà Nội','Hải Phòng',120,1,1),(16,'Hà Nội','Điện Biên',40,1,1),(17,'Hà Nội','Nam Định',80,1,1),(18,'Hải Phòng','Hà Nội',120,1,1),(19,'Điện Biên','Hà Nội',40,1,1),(20,'Nam Định','Hà Nội',80,1,1);
/*!40000 ALTER TABLE `route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `total_salary`
--

DROP TABLE IF EXISTS `total_salary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `total_salary` (
  `id` int NOT NULL AUTO_INCREMENT,
  `total` float NOT NULL,
  `month` int NOT NULL,
  `year` int NOT NULL,
  `driver_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fK_drive` (`driver_id`) USING BTREE,
  CONSTRAINT `fK_drive` FOREIGN KEY (`driver_id`) REFERENCES `driver` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `total_salary`
--

LOCK TABLES `total_salary` WRITE;
/*!40000 ALTER TABLE `total_salary` DISABLE KEYS */;
/*!40000 ALTER TABLE `total_salary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'test','$2a$12$4JaFwFCbu3pMYuFaVzmILudtwQAaDbsnsREHf9fG7Wc4bjCFAsnzG','luongbeo1332000@@gmail.com');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-06  8:31:54

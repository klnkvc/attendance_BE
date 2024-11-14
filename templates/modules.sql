-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: attendance_lite_module
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `category_modules`
--

DROP TABLE IF EXISTS `category_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_modules` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `uuid` char(36) NOT NULL,
  `name` text NOT NULL,
  `order` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_modules`
--

LOCK TABLES `category_modules` WRITE;
/*!40000 ALTER TABLE `category_modules` DISABLE KEYS */;
INSERT INTO `category_modules` (`id`, `uuid`, `name`, `order`) VALUES (1,'ac0ac954-cd3a-4462-b316-9f3fa2ec6839','Management Attendance',5),(2,'b1980b4f-8813-4817-b8ca-835b50b2e884','Management User',2),(3,'fa25903f-c614-4b5a-8859-6427615f31d0','Management Profile',1),(4,'fdd93b4b-f051-4e28-9658-8398329812c6','Approvals',3),(5,'6a8b8063-6f49-4ddc-9690-f7d0ed5d7d07','Reports',4);
/*!40000 ALTER TABLE `category_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modules`
--

DROP TABLE IF EXISTS `modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modules` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `uuid` char(36) NOT NULL,
  `name` text NOT NULL,
  `order` int NOT NULL,
  `category_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `modules_category_modules_id_fk` (`category_id`),
  CONSTRAINT `modules_category_modules_id_fk` FOREIGN KEY (`category_id`) REFERENCES `category_modules` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modules`
--

LOCK TABLES `modules` WRITE;
/*!40000 ALTER TABLE `modules` DISABLE KEYS */;
INSERT INTO `modules` (`id`, `uuid`, `name`, `order`, `category_id`) VALUES (1,'746e8476-0dbd-490a-86c4-e66308a7ea40','Attendance',1,1),(2,'4a4b87af-6584-41ef-9396-850e7bba1756','Users',1,2),(3,'8829a91b-85dc-400c-82b0-4dcaed595b9f','Attendance History',4,1),(4,'00a5450e-7ada-4f43-95e2-b0e39bac7d6d','Leave Request',3,1),(5,'5cb0c1c8-8126-4d5d-a778-a661742c8b26','Profile',1,3),(7,'22fc5e7f-76c8-41c2-91e0-ae7d6ff90eb2','Leave History',6,1),(9,'37cc9851-a243-4790-8951-4e32cd94046d','WFH Aproval',1,4),(10,'b4d87df1-bc58-435c-8df7-6cf63766466a','Leave Approval',2,4),(11,'fa1e2e9c-2ef6-4241-8a08-a9b8c4f9fbca','WFH Request',2,1),(12,'2746071d-d5ca-496a-8694-87550a622db7','WFH History',5,1),(13,'74865474-6adb-44dd-b4b8-2ebf6b3689fe','Attendance Report',1,5);
/*!40000 ALTER TABLE `modules` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-14  8:47:29

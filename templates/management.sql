-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: attendance_lite_management
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
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendance` (
  `id` char(36) NOT NULL,
  `date` date NOT NULL,
  `clock_in` time NOT NULL,
  `clock_out` time DEFAULT NULL,
  `image_capture` text,
  `wfh_loc` text,
  `logbook` longtext,
  `created_by` char(36) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_by` char(36) NOT NULL,
  `updated_at` datetime NOT NULL,
  `user_id` char(36) NOT NULL,
  `work_type_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `attendance_users_id_fk` (`user_id`),
  KEY `attendance_work_type_id_fk` (`work_type_id`),
  CONSTRAINT `attendance_users_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `attendance_work_type_id_fk` FOREIGN KEY (`work_type_id`) REFERENCES `work_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
INSERT INTO `attendance` (`id`, `date`, `clock_in`, `clock_out`, `image_capture`, `wfh_loc`, `logbook`, `created_by`, `created_at`, `updated_by`, `updated_at`, `user_id`, `work_type_id`) VALUES ('014700a0-bd70-4a2c-88be-82d1b19da693','2024-07-24','10:55:49','10:56:55','1721793349982-webcam-image.jpg','tuyu','Makan Makan','9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-07-24 10:55:49','9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-07-24 10:56:55','9726650b-2ffa-4ba9-b38c-6c1179625e2e',2),('03b3df2b-10ba-4912-a47f-b943ab15658f','2024-10-06','21:25:46','21:26:47','1728224746323-webcam-image.jpg','Rumah','Absensi\nngecek logbook\nnilai assesment initial','a3b3349b-8f0e-4bda-adfa-496ab8139c19','2024-10-06 21:25:46','a3b3349b-8f0e-4bda-adfa-496ab8139c19','2024-10-06 21:26:47','a3b3349b-8f0e-4bda-adfa-496ab8139c19',2),('0442bfbc-f0f6-4e2d-b8df-48f28534fcdc','2024-07-19','09:20:56',NULL,'','','','9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-07-19 09:20:56','9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-07-19 09:20:56','9726650b-2ffa-4ba9-b38c-6c1179625e2e',1),('089afe68-3373-45e6-ad58-a37ebc108008','2024-07-16','08:38:17',NULL,NULL,NULL,NULL,'2d2dfabb-f3bf-48f5-ba26-56c3e3d44aa6','2024-07-16 09:38:33','2d2dfabb-f3bf-48f5-ba26-56c3e3d44aa6','2024-07-16 09:38:35','2d2dfabb-f3bf-48f5-ba26-56c3e3d44aa6',1),('1bcf8bdf-8797-434b-a2dc-7bc4b1f96a37','2024-08-12','20:27:06','20:28:18','1723469226924-webcam-image.jpg','yuio;ihvty6u','8923rpufehuisuo','9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-08-12 20:27:06','9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-08-12 20:28:18','9726650b-2ffa-4ba9-b38c-6c1179625e2e',2),('2b92517b-f291-4cc6-8386-ece7974c31e2','2024-07-21','12:25:45',NULL,'','','','9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-07-21 12:25:45','9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-07-21 12:25:45','9726650b-2ffa-4ba9-b38c-6c1179625e2e',1),('363db6ca-eac0-4196-b4ee-a3ba31846657','2024-09-30','14:14:54','14:15:02','','','','2d2dfabb-f3bf-48f5-ba26-56c3e3d44aa6','2024-09-30 14:14:54','2d2dfabb-f3bf-48f5-ba26-56c3e3d44aa6','2024-09-30 14:15:02','2d2dfabb-f3bf-48f5-ba26-56c3e3d44aa6',1),('470a8466-b965-4ba7-bac5-c9d241587872','2024-10-15','10:12:12','10:12:32','1728961932806-webcam-image.jpg','cafe','mengecek logbook mahasiswa','a3b3349b-8f0e-4bda-adfa-496ab8139c19','2024-10-15 10:12:12','a3b3349b-8f0e-4bda-adfa-496ab8139c19','2024-10-15 10:12:32','a3b3349b-8f0e-4bda-adfa-496ab8139c19',2),('59935271-490d-4f12-b0ff-f01d37184ec8','2024-09-19','19:28:04',NULL,'','','','2d2dfabb-f3bf-48f5-ba26-56c3e3d44aa6','2024-09-19 19:28:04','2d2dfabb-f3bf-48f5-ba26-56c3e3d44aa6','2024-09-19 19:28:04','2d2dfabb-f3bf-48f5-ba26-56c3e3d44aa6',1),('5be25d1c-70f0-4b63-ba97-003fa05a11ae','2024-07-17','15:19:20','15:25:25','Gambar1','Batam','Hari ini menyusun roadmap','9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-07-17 15:19:20','9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-07-17 15:25:25','9726650b-2ffa-4ba9-b38c-6c1179625e2e',2),('81ffb766-75d6-4cfb-bff8-65ff0145a20a','2024-09-26','16:13:18','16:13:28','1727341998272-webcam-image.jpg','bgtynh','fghjjuuu','a3b3349b-8f0e-4bda-adfa-496ab8139c19','2024-09-26 16:13:18','a3b3349b-8f0e-4bda-adfa-496ab8139c19','2024-09-26 16:13:28','a3b3349b-8f0e-4bda-adfa-496ab8139c19',2),('8483887a-df1e-4b2c-823e-0e6e415c3fd4','2024-07-23','16:00:18','16:00:26','1721725218593-webcam-image.jpg','Kantor','Main game','9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-07-23 16:00:18','9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-07-23 16:00:26','9726650b-2ffa-4ba9-b38c-6c1179625e2e',2),('8b391110-a5b6-4706-bef8-fa0c3da06adf','2024-09-19','19:26:55',NULL,'1726748815647-webcam-image.jpg','fjioewjsdjl','','9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-09-19 19:26:55','9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-09-19 19:26:55','9726650b-2ffa-4ba9-b38c-6c1179625e2e',2),('8fb2039d-168e-406a-8e2b-c4f80c6138a8','2024-10-15','10:10:01','10:10:08','','','','2d2dfabb-f3bf-48f5-ba26-56c3e3d44aa6','2024-10-15 10:10:01','2d2dfabb-f3bf-48f5-ba26-56c3e3d44aa6','2024-10-15 10:10:08','2d2dfabb-f3bf-48f5-ba26-56c3e3d44aa6',1),('ada5c334-805c-4859-a71b-e7e635b5c4fb','2024-09-23','14:39:57','14:40:12','1727077197430-webcam-image.jpg','rumah','mentoring','149f9579-4724-4454-bbe9-bf677f1a527d','2024-09-23 14:39:57','149f9579-4724-4454-bbe9-bf677f1a527d','2024-09-23 14:40:12','149f9579-4724-4454-bbe9-bf677f1a527d',2),('bd5495d1-24ec-423b-927d-8b0bb3133a7f','2024-09-18','22:58:53',NULL,'1726675133951-webcam-image.jpg','hkjhkjh','','9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-09-18 22:58:53','9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-09-18 22:58:53','9726650b-2ffa-4ba9-b38c-6c1179625e2e',2),('c6622846-367c-4111-adcf-db32e138e22b','2024-10-06','21:22:42','21:23:19','','','','2d2dfabb-f3bf-48f5-ba26-56c3e3d44aa6','2024-10-06 21:22:42','2d2dfabb-f3bf-48f5-ba26-56c3e3d44aa6','2024-10-06 21:23:19','2d2dfabb-f3bf-48f5-ba26-56c3e3d44aa6',1),('c7e55950-3956-48cd-83a2-ad8b0b176ece','2024-08-15','16:27:18','16:27:20','','','','9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-08-15 16:27:18','9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-08-15 16:27:20','9726650b-2ffa-4ba9-b38c-6c1179625e2e',1),('d800608f-ee5e-4221-b213-8fc07ed49adc','2024-09-23','14:15:58','14:16:30','1727075758661-webcam-image.jpg','gedung 2','adminstrasi','2d2dfabb-f3bf-48f5-ba26-56c3e3d44aa6','2024-09-23 14:15:58','2d2dfabb-f3bf-48f5-ba26-56c3e3d44aa6','2024-09-23 14:16:30','2d2dfabb-f3bf-48f5-ba26-56c3e3d44aa6',2),('df1ff651-1835-47e3-9cac-4f14784bc2e1','2024-06-17','15:18:51','15:25:06','','','','9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-07-17 15:18:51','9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-07-17 15:25:06','9726650b-2ffa-4ba9-b38c-6c1179625e2e',1),('e831a992-d52c-40ef-98bf-f9be33389005','2024-07-17','17:18:56','17:19:32','1721211536707-1.jpg','nongsa','Hari ini menyusun roadmap','9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-07-17 17:18:56','9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-07-17 17:19:32','9726650b-2ffa-4ba9-b38c-6c1179625e2e',2),('eebf0d38-91c3-440b-8a01-3184047c3a02','2024-09-23','14:29:42','14:30:20','1727076582255-webcam-image.jpg','home','kerja pokoknya','a3b3349b-8f0e-4bda-adfa-496ab8139c19','2024-09-23 14:29:42','a3b3349b-8f0e-4bda-adfa-496ab8139c19','2024-09-23 14:30:20','a3b3349b-8f0e-4bda-adfa-496ab8139c19',2),('fb682384-fbfd-4e08-82c1-32071aba035c','2024-09-30','14:19:09','14:19:33','1727680749263-webcam-image.jpg','Dirumah','Mmelakukan Sesi zoom pada siang hari','daef66a2-be5d-42ff-b7db-b670134404b9','2024-09-30 14:19:09','daef66a2-be5d-42ff-b7db-b670134404b9','2024-09-30 14:19:33','daef66a2-be5d-42ff-b7db-b670134404b9',2);
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gender`
--

DROP TABLE IF EXISTS `gender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gender` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gender`
--

LOCK TABLES `gender` WRITE;
/*!40000 ALTER TABLE `gender` DISABLE KEYS */;
INSERT INTO `gender` (`id`, `name`) VALUES (1,'Man'),(2,'Woman');
/*!40000 ALTER TABLE `gender` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leave`
--

DROP TABLE IF EXISTS `leave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leave` (
  `id` char(36) NOT NULL,
  `destination_city` text,
  `destination_address` longtext,
  `start_date` date DEFAULT NULL,
  `work_date` date DEFAULT NULL,
  `evidence` longtext,
  `desc` longtext,
  `approval` tinyint DEFAULT NULL,
  `created_by` char(36) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_by` char(36) NOT NULL,
  `updated_at` datetime NOT NULL,
  `user_id` char(36) NOT NULL,
  `leave_type_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `leave_leave_type_id_fk` (`leave_type_id`),
  KEY `leave_users_id_fk` (`user_id`),
  CONSTRAINT `leave_leave_type_id_fk` FOREIGN KEY (`leave_type_id`) REFERENCES `leave_type` (`id`),
  CONSTRAINT `leave_users_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave`
--

LOCK TABLES `leave` WRITE;
/*!40000 ALTER TABLE `leave` DISABLE KEYS */;
INSERT INTO `leave` (`id`, `destination_city`, `destination_address`, `start_date`, `work_date`, `evidence`, `desc`, `approval`, `created_by`, `created_at`, `updated_by`, `updated_at`, `user_id`, `leave_type_id`) VALUES ('02b95484-0fef-4502-bb86-a8a5cade1f72','','','2024-07-26','2024-07-28','1721903670101-13.png','fsaklj',2,'9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-07-25 17:34:30','9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-08-13 15:58:53','9726650b-2ffa-4ba9-b38c-6c1179625e2e',2),('0a359916-c9f3-4b8a-b327-fcb940f4c7c5','','','2024-07-31','2024-08-03',NULL,'sakit pinggang',2,'9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-07-25 16:45:52','9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-07-25 16:45:52','9726650b-2ffa-4ba9-b38c-6c1179625e2e',2),('11d75d05-b946-4191-b3dd-6d9f2a8897d0','Batam','Cafe','2024-08-11','2024-08-14',NULL,'',2,'9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-08-12 11:53:28','9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-08-13 15:41:11','9726650b-2ffa-4ba9-b38c-6c1179625e2e',1),('1b6c1038-dfd0-4a8d-960a-82344c0083c9','','','2024-09-26','2024-09-27','1727077325276-xanax_weed-removebg-preview.png','hhh',2,'149f9579-4724-4454-bbe9-bf677f1a527d','2024-09-23 14:42:05','d955319c-f1c0-4efd-80d7-121d0826fe87','2024-09-23 14:42:59','149f9579-4724-4454-bbe9-bf677f1a527d',2),('21fe911a-0a90-4416-8d1c-8cd848d289b7','','','2024-09-27','2024-09-28',NULL,'sakit kepala',0,'2d2dfabb-f3bf-48f5-ba26-56c3e3d44aa6','2024-09-23 14:18:15','2d2dfabb-f3bf-48f5-ba26-56c3e3d44aa6','2024-09-23 14:18:15','2d2dfabb-f3bf-48f5-ba26-56c3e3d44aa6',2),('261c2235-5ae7-4af3-9f40-dc48d368e85d','Tanjung Balai Karimun','Kolong','2024-09-20','2024-09-30',NULL,'',0,'2d2dfabb-f3bf-48f5-ba26-56c3e3d44aa6','2024-09-19 19:36:53','2d2dfabb-f3bf-48f5-ba26-56c3e3d44aa6','2024-09-19 19:36:53','2d2dfabb-f3bf-48f5-ba26-56c3e3d44aa6',1),('38e723ea-780b-42fc-ba6f-dc7ed948f502','Tanjung Balai Karimun','Telaga tujuh','2024-10-08','2024-10-18',NULL,'',1,'a3b3349b-8f0e-4bda-adfa-496ab8139c19','2024-10-06 23:07:21','d955319c-f1c0-4efd-80d7-121d0826fe87','2024-10-06 23:44:23','a3b3349b-8f0e-4bda-adfa-496ab8139c19',1),('3fff4e76-6c78-4c98-af9d-97df5962120a','','','2024-07-26','2024-07-29','1721903715678-14.jpg','fhgvjhbk',0,'9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-07-25 17:35:15','9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-07-25 17:35:15','9726650b-2ffa-4ba9-b38c-6c1179625e2e',2),('41b3084b-f5ef-45b8-84ee-8af4e7f3a43d','','','2024-10-15','2024-10-22',NULL,'Sakit Kepala',1,'a3b3349b-8f0e-4bda-adfa-496ab8139c19','2024-10-06 23:13:23','d955319c-f1c0-4efd-80d7-121d0826fe87','2024-10-07 00:07:15','a3b3349b-8f0e-4bda-adfa-496ab8139c19',2),('51d4df06-762f-40c5-bcd6-9eed925b1198','batam','nongsa','2024-07-31','2024-07-31',NULL,'',0,'9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-07-25 16:41:30','9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-07-25 16:41:30','9726650b-2ffa-4ba9-b38c-6c1179625e2e',1),('5f16a783-4708-4e32-8de8-06321670586f','','','2024-07-31','2024-07-31',NULL,'sakit pinggang',0,'9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-07-25 16:44:02','9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-07-25 16:44:02','9726650b-2ffa-4ba9-b38c-6c1179625e2e',2),('8b173122-b76a-4924-9ef5-e5af84bc756a','','','2024-10-31','2024-11-02','1730338992637-1.jpg','Sakit',0,'2d2dfabb-f3bf-48f5-ba26-56c3e3d44aa6','2024-10-31 08:43:12','2d2dfabb-f3bf-48f5-ba26-56c3e3d44aa6','2024-10-31 08:43:12','2d2dfabb-f3bf-48f5-ba26-56c3e3d44aa6',2),('9c4681ae-36c3-4912-a785-fa44e6c4a481','Singapore','Orchard Road','2024-10-24','2024-10-28',NULL,'',2,'a3b3349b-8f0e-4bda-adfa-496ab8139c19','2024-10-06 23:27:17','d955319c-f1c0-4efd-80d7-121d0826fe87','2024-10-06 23:40:10','a3b3349b-8f0e-4bda-adfa-496ab8139c19',1),('a4cf9c80-37f7-4321-a37b-03d31b6d7a46','','','2024-10-10','2024-10-11','1728233860325-2802637698_8263ccf668.jpg','Sakit gigi',2,'a3b3349b-8f0e-4bda-adfa-496ab8139c19','2024-10-06 23:57:40','d955319c-f1c0-4efd-80d7-121d0826fe87','2024-10-07 00:30:13','a3b3349b-8f0e-4bda-adfa-496ab8139c19',2),('aadb9df1-01b8-45f6-bdfd-2d48f3e102ec','','','2024-09-30','2024-10-17','1727677683811-Cetak_All_Form Pendaftaran Seminar Proposal TA_20.pdf','Karantina mandiri Covid 19',0,'a3b3349b-8f0e-4bda-adfa-496ab8139c19','2024-09-30 13:28:03','a3b3349b-8f0e-4bda-adfa-496ab8139c19','2024-09-30 13:28:03','a3b3349b-8f0e-4bda-adfa-496ab8139c19',2),('b422e617-e064-4547-8ecb-dfbfe42b02e2','','','2024-09-19','2024-09-20',NULL,'Sakit gigi',0,'2d2dfabb-f3bf-48f5-ba26-56c3e3d44aa6','2024-09-19 19:37:27','2d2dfabb-f3bf-48f5-ba26-56c3e3d44aa6','2024-09-19 19:37:27','2d2dfabb-f3bf-48f5-ba26-56c3e3d44aa6',2),('b9fe27b8-82de-41b0-95c9-5e7b5115f64c','bali','bali','2024-07-25','2024-07-26',NULL,'',0,'9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-07-25 17:34:13','9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-07-25 17:34:13','9726650b-2ffa-4ba9-b38c-6c1179625e2e',1),('cfd438a5-5373-4e6f-b326-4af8c64b85e1','','','2024-07-26','2024-07-27',NULL,'drytfgjh',0,'9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-07-25 17:38:41','9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-07-25 17:38:41','9726650b-2ffa-4ba9-b38c-6c1179625e2e',2),('ee5e770c-f034-4f73-8f76-a157d15e1bc5','Singapore','Marina Bay Sands','2024-10-04','2024-10-11',NULL,'',0,'a3b3349b-8f0e-4bda-adfa-496ab8139c19','2024-09-30 13:26:49','a3b3349b-8f0e-4bda-adfa-496ab8139c19','2024-09-30 13:26:49','a3b3349b-8f0e-4bda-adfa-496ab8139c19',1),('ef1c065c-7f51-4c83-a530-6cee3dad5e4e','batam','batam','2024-09-26','2024-09-27',NULL,'',2,'2d2dfabb-f3bf-48f5-ba26-56c3e3d44aa6','2024-09-23 14:17:31','d955319c-f1c0-4efd-80d7-121d0826fe87','2024-09-23 14:32:52','2d2dfabb-f3bf-48f5-ba26-56c3e3d44aa6',1),('f6c385cd-29b2-4815-b55b-79315f5f5502','','','2024-10-17','2024-10-19',NULL,'Demam',2,'a3b3349b-8f0e-4bda-adfa-496ab8139c19','2024-10-06 23:27:32','d955319c-f1c0-4efd-80d7-121d0826fe87','2024-10-07 00:03:57','a3b3349b-8f0e-4bda-adfa-496ab8139c19',2),('ff9f7f0a-fce5-4063-aa46-4cdccb4af1ad','','','2024-10-17','2024-10-20','1728961880154-xanax_weed-removebg-preview.png','Sakit Kepala',0,'2d2dfabb-f3bf-48f5-ba26-56c3e3d44aa6','2024-10-15 10:11:20','2d2dfabb-f3bf-48f5-ba26-56c3e3d44aa6','2024-10-15 10:11:20','2d2dfabb-f3bf-48f5-ba26-56c3e3d44aa6',2),('ffaa4507-567e-44d9-817b-070283c629d4','Batam','Pinang','2024-09-25','2024-09-26',NULL,'',0,'149f9579-4724-4454-bbe9-bf677f1a527d','2024-09-23 14:41:31','149f9579-4724-4454-bbe9-bf677f1a527d','2024-09-23 14:41:31','149f9579-4724-4454-bbe9-bf677f1a527d',1);
/*!40000 ALTER TABLE `leave` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leave_type`
--

DROP TABLE IF EXISTS `leave_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leave_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_type`
--

LOCK TABLES `leave_type` WRITE;
/*!40000 ALTER TABLE `leave_type` DISABLE KEYS */;
INSERT INTO `leave_type` (`id`, `name`) VALUES (1,'Leave'),(2,'Sick');
/*!40000 ALTER TABLE `leave_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `can_read` tinyint DEFAULT NULL,
  `can_create` tinyint DEFAULT NULL,
  `can_update` tinyint DEFAULT NULL,
  `can_delete` tinyint DEFAULT NULL,
  `created_by` char(36) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_by` char(36) NOT NULL,
  `updated_at` datetime NOT NULL,
  `role_id` char(36) NOT NULL,
  `module_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_modules_id_fk` (`module_id`),
  CONSTRAINT `permissions_modules_id_fk` FOREIGN KEY (`module_id`) REFERENCES `attendance_lite_module`.`modules` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` (`id`, `can_read`, `can_create`, `can_update`, `can_delete`, `created_by`, `created_at`, `updated_by`, `updated_at`, `role_id`, `module_id`) VALUES (1,1,1,1,1,'9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-07-18 15:06:21','9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-07-18 15:06:23','a0cff762-aa7b-42b4-9552-c317dbd50703',1),(2,1,1,1,1,'9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-07-18 15:06:21','9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-07-18 15:06:23','a0cff762-aa7b-42b4-9552-c317dbd50703',2),(5,1,1,1,1,'9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-07-18 15:06:21','9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-07-18 15:06:23','a0cff762-aa7b-42b4-9552-c317dbd50703',3),(6,1,1,1,1,'9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-07-18 15:06:21','9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-07-18 15:06:23','a0cff762-aa7b-42b4-9552-c317dbd50703',4),(7,1,1,1,1,'9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-07-18 15:06:21','9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-07-18 15:06:23','a0cff762-aa7b-42b4-9552-c317dbd50703',5),(8,1,1,1,1,'9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-07-18 15:06:21','9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-07-18 15:06:23','a0cff762-aa7b-42b4-9552-c317dbd50703',7),(10,1,1,1,1,'9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-07-18 15:06:21','9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-07-18 15:06:23','a0cff762-aa7b-42b4-9552-c317dbd50703',9),(11,1,1,1,1,'9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-07-18 15:06:21','9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-07-18 15:06:23','a0cff762-aa7b-42b4-9552-c317dbd50703',10),(12,1,1,1,1,'9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-07-18 15:06:21','9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-07-18 15:06:23','a0cff762-aa7b-42b4-9552-c317dbd50703',11),(13,1,1,1,1,'9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-07-18 15:06:21','9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-07-18 15:06:23','a0cff762-aa7b-42b4-9552-c317dbd50703',12),(14,1,1,1,1,'9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-07-18 15:06:21','9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-07-18 15:06:23','a0cff762-aa7b-42b4-9552-c317dbd50703',13),(36,1,1,1,1,'9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-09-16 22:47:13','9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-09-16 22:47:15','bbfb2816-6af4-43f8-beb1-6706f13e82ad',9),(37,1,1,1,1,'9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-09-16 22:47:13','9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-09-16 22:47:15','bbfb2816-6af4-43f8-beb1-6706f13e82ad',10),(38,1,1,1,1,'9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-09-16 22:47:13','9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-09-16 22:47:15','bbfb2816-6af4-43f8-beb1-6706f13e82ad',13),(39,1,1,1,1,'9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-09-16 22:47:13','9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-09-16 22:47:15','92db93ff-0cc3-404d-ac40-53e33a5f17d1',13),(40,1,1,1,1,'9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-09-16 22:47:13','9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-09-16 22:47:15','03e04d48-634d-46c0-b471-e5e8ea89be7d',2),(41,1,1,1,1,'9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-08-19 15:34:25','9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-08-19 15:34:25','d4eec293-c9bc-4c54-9590-36c690299108',1),(54,1,1,1,1,'9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-08-19 15:34:25','9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-08-19 15:34:25','d4eec293-c9bc-4c54-9590-36c690299108',4),(56,1,1,1,1,'9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-08-19 15:34:25','9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-08-19 15:34:25','d4eec293-c9bc-4c54-9590-36c690299108',11);
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` char(36) NOT NULL,
  `name` text,
  `is_delete` tinyint DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` char(36) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `name`, `is_delete`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('03e04d48-634d-46c0-b471-e5e8ea89be7d','admin',0,'9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-08-19 15:31:03','9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-08-19 15:31:04'),('92db93ff-0cc3-404d-ac40-53e33a5f17d1','administration',0,'9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-08-19 15:31:03','9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-08-19 15:31:04'),('a0cff762-aa7b-42b4-9552-c317dbd50703','developer',0,'1','2024-04-28 12:30:43','1','2024-04-28 12:30:43'),('bbfb2816-6af4-43f8-beb1-6706f13e82ad','head of mentor',0,'9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-08-19 15:31:03','9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-08-19 15:31:04'),('d4eec293-c9bc-4c54-9590-36c690299108','employee',0,'2d2dfabb-f3bf-48f5-ba26-56c3e3d44aa6','2024-04-29 07:03:05','2d2dfabb-f3bf-48f5-ba26-56c3e3d44aa6','2024-04-29 07:03:05');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` char(36) NOT NULL,
  `name` text NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone_number` bigint NOT NULL,
  `password` char(60) NOT NULL,
  `photo` longtext,
  `is_active` tinyint NOT NULL,
  `is_delete` tinyint NOT NULL,
  `created_by` char(36) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_by` char(36) NOT NULL,
  `updated_at` datetime NOT NULL,
  `role_id` char(36) NOT NULL,
  `gender_id` int NOT NULL,
  `work_location_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `users_gender_id_fk` (`gender_id`),
  KEY `users_roles_id_fk` (`role_id`),
  KEY `users_work_location_id_fk` (`work_location_id`),
  CONSTRAINT `users_gender_id_fk` FOREIGN KEY (`gender_id`) REFERENCES `gender` (`id`),
  CONSTRAINT `users_roles_id_fk` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `users_work_location_id_fk` FOREIGN KEY (`work_location_id`) REFERENCES `work_location` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `username`, `email`, `phone_number`, `password`, `photo`, `is_active`, `is_delete`, `created_by`, `created_at`, `updated_by`, `updated_at`, `role_id`, `gender_id`, `work_location_id`) VALUES ('149f9579-4724-4454-bbe9-bf677f1a527d','user2','user2','user2@email.com',83344556677,'1111',NULL,1,0,'9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-04-28 19:09:38','9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-09-23 11:21:09','d4eec293-c9bc-4c54-9590-36c690299108',1,2),('205710ef-c29f-491b-b657-593fb3f11086','user10','user10','user10@email.com',83344556677,'1111',NULL,1,0,'9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-04-28 19:09:38','9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-09-23 11:21:09','d4eec293-c9bc-4c54-9590-36c690299108',1,2),('21e37ba5-4abd-4d57-a4ae-5cb915174453','user8','user8','user8@email.com',83344556677,'1111',NULL,1,0,'9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-04-28 19:09:38','9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-09-23 11:21:09','d4eec293-c9bc-4c54-9590-36c690299108',1,2),('2d2dfabb-f3bf-48f5-ba26-56c3e3d44aa6','andi','andi','andi@email.com',8223344554,'1111',NULL,1,0,'9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-04-28 19:07:19','9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-09-19 19:27:22','d4eec293-c9bc-4c54-9590-36c690299108',1,1),('4a956a0d-2d43-4afc-885a-9948a61b0117','user3','user3','user3@email.com',83344556677,'1111',NULL,1,0,'9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-04-28 19:09:38','9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-09-23 11:21:09','d4eec293-c9bc-4c54-9590-36c690299108',1,2),('62cebd35-30e8-4508-a7dc-9bdce430464d','cindy','cindy','cindy@email.com',84455667788,'1111',NULL,1,0,'9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-07-15 21:34:17','9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-07-15 21:34:17','d4eec293-c9bc-4c54-9590-36c690299108',2,1),('663b1f9c-fc38-439d-b82e-1962ba21ad02','dinda','dinda','dinda@email.com',8445666415,'1111',NULL,1,0,'9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-07-23 16:37:18','daef66a2-be5d-42ff-b7db-b670134404b9','2024-09-16 23:02:33','92db93ff-0cc3-404d-ac40-53e33a5f17d1',2,1),('7edff139-0d3a-46df-b227-62bc4a6abcd9','user9','user9','user9@email.com',83344556677,'1111',NULL,1,0,'9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-04-28 19:09:38','9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-09-23 11:21:09','d4eec293-c9bc-4c54-9590-36c690299108',1,2),('8c710f97-f8c8-464b-9110-f59fbedf3cbb','user6','user6','user6@email.com',83344556677,'1111',NULL,1,0,'9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-04-28 19:09:38','9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-09-23 11:21:09','d4eec293-c9bc-4c54-9590-36c690299108',1,2),('8da75e4b-b259-42f8-90cf-b6f8ed890b03','user7','user7','user7@email.com',83344556677,'1111',NULL,1,0,'9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-04-28 19:09:38','9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-09-23 11:21:09','d4eec293-c9bc-4c54-9590-36c690299108',1,2),('9726650b-2ffa-4ba9-b38c-6c1179625e2e','developer','infinitedeveloper','developer@infinitelearning.id',81122334455,'infinite1234',NULL,1,0,'9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-04-28 12:31:16','9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-08-15 16:27:12','a0cff762-aa7b-42b4-9552-c317dbd50703',1,1),('9ce08188-2602-4810-9550-909f5152e527','user4','user4','user4@email.com',83344556677,'1111',NULL,1,0,'9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-04-28 19:09:38','9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-09-23 11:21:09','d4eec293-c9bc-4c54-9590-36c690299108',1,2),('a3b3349b-8f0e-4bda-adfa-496ab8139c19','user1','user1','user1@email.com',83344556677,'1111',NULL,1,0,'9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-04-28 19:09:38','9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-09-23 11:21:09','d4eec293-c9bc-4c54-9590-36c690299108',1,2),('d955319c-f1c0-4efd-80d7-121d0826fe87','anwar','anwar','anwar@email.com',85542336646,'1111',NULL,1,0,'9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-07-27 20:35:36','9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-09-16 22:49:43','bbfb2816-6af4-43f8-beb1-6706f13e82ad',1,2),('daef66a2-be5d-42ff-b7db-b670134404b9','budi','budi','budi@email.com',83344556677,'1111',NULL,0,0,'9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-04-28 19:09:38','9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-09-23 16:13:40','d4eec293-c9bc-4c54-9590-36c690299108',1,1),('f891df5c-0895-40f6-86c7-a777e7307c16','user5','user5','user5@email.com',83344556677,'1111',NULL,1,0,'9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-04-28 19:09:38','9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-09-23 11:21:09','d4eec293-c9bc-4c54-9590-36c690299108',1,2);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wfh`
--

DROP TABLE IF EXISTS `wfh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wfh` (
  `id` char(36) NOT NULL,
  `date` date NOT NULL,
  `location` text NOT NULL,
  `approval` tinyint NOT NULL,
  `created_by` char(36) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_by` char(36) NOT NULL,
  `updated_at` datetime NOT NULL,
  `user_id` char(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wfh_users_id_fk` (`user_id`),
  CONSTRAINT `wfh_users_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wfh`
--

LOCK TABLES `wfh` WRITE;
/*!40000 ALTER TABLE `wfh` DISABLE KEYS */;
INSERT INTO `wfh` (`id`, `date`, `location`, `approval`, `created_by`, `created_at`, `updated_by`, `updated_at`, `user_id`) VALUES ('02d05f79-4a7a-4a35-aaa2-79201440abbb','2024-08-19','aaaa',0,'9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-08-19 09:04:32','9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-08-19 09:18:53','9726650b-2ffa-4ba9-b38c-6c1179625e2e'),('0a7b9bf0-08d3-4abe-a652-da4be14956f4','2024-09-20','Cafe Momo',1,'9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-09-19 19:35:24','9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-09-19 21:29:11','9726650b-2ffa-4ba9-b38c-6c1179625e2e'),('158b050b-186c-4c71-99dd-035913acde0b','2024-09-27','aaaaaa',0,'a3b3349b-8f0e-4bda-adfa-496ab8139c19','2024-09-26 16:16:26','a3b3349b-8f0e-4bda-adfa-496ab8139c19','2024-09-26 16:16:26','a3b3349b-8f0e-4bda-adfa-496ab8139c19'),('24293698-37bc-43e5-a10c-aacf3ac1c3a5','2024-10-24','cafe abang',2,'a3b3349b-8f0e-4bda-adfa-496ab8139c19','2024-10-06 23:26:30','d955319c-f1c0-4efd-80d7-121d0826fe87','2024-10-06 23:33:50','a3b3349b-8f0e-4bda-adfa-496ab8139c19'),('25f9c84e-4a43-4fb5-8b28-ec73d00fe71a','2024-08-19','yuqeiyui',0,'9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-08-19 09:39:50','9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-08-19 09:39:50','9726650b-2ffa-4ba9-b38c-6c1179625e2e'),('26ba6157-3da6-48f3-8900-4f4a9145ffc2','2024-08-09','rumah tetangga',0,'9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-08-09 11:25:16','9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-08-09 21:16:48','9726650b-2ffa-4ba9-b38c-6c1179625e2e'),('53ec86a6-0b75-4276-bef4-f7b1588e065a','2024-08-19','jjjjjj',2,'9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-08-19 09:28:14','9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-08-19 09:28:21','9726650b-2ffa-4ba9-b38c-6c1179625e2e'),('5dbf6f3d-ee3a-4424-a56c-7e531845ffe6','2024-09-26','rumah',2,'149f9579-4724-4454-bbe9-bf677f1a527d','2024-09-23 14:40:35','d955319c-f1c0-4efd-80d7-121d0826fe87','2024-09-23 14:42:31','149f9579-4724-4454-bbe9-bf677f1a527d'),('6dab90fb-1568-43f7-b57c-d5747f04ce6e','2024-09-23','rumah',2,'2d2dfabb-f3bf-48f5-ba26-56c3e3d44aa6','2024-09-19 19:35:48','9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-09-19 21:29:05','2d2dfabb-f3bf-48f5-ba26-56c3e3d44aa6'),('72605a01-fa82-4f9a-8c2b-4bd22caf78e9','2024-10-09','Cafe CW',1,'a3b3349b-8f0e-4bda-adfa-496ab8139c19','2024-10-06 21:32:15','d955319c-f1c0-4efd-80d7-121d0826fe87','2024-10-06 23:34:33','a3b3349b-8f0e-4bda-adfa-496ab8139c19'),('79479895-1f9c-4420-8c4b-dd90e36f3e8b','2024-09-30','Di rumah',2,'daef66a2-be5d-42ff-b7db-b670134404b9','2024-09-30 14:18:21','d955319c-f1c0-4efd-80d7-121d0826fe87','2024-09-30 14:18:35','daef66a2-be5d-42ff-b7db-b670134404b9'),('82f55a87-3d8d-46bf-9ed9-b01a1530606c','2024-08-09','Kamar',0,'9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-08-09 11:24:48','9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-08-09 21:16:50','9726650b-2ffa-4ba9-b38c-6c1179625e2e'),('866f8345-a04a-4a99-8e2f-b19fce2a8364','2024-10-05','Rumah',0,'a3b3349b-8f0e-4bda-adfa-496ab8139c19','2024-09-30 13:26:14','a3b3349b-8f0e-4bda-adfa-496ab8139c19','2024-09-30 13:26:14','a3b3349b-8f0e-4bda-adfa-496ab8139c19'),('956f0087-57ba-475d-a10c-495828230ff6','2024-08-13','yuilukhj',0,'9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-08-13 08:55:50','9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-08-13 11:16:28','9726650b-2ffa-4ba9-b38c-6c1179625e2e'),('ae187710-81b9-4a86-91d0-4ee0a5f38de7','2024-10-02','Cafe',0,'a3b3349b-8f0e-4bda-adfa-496ab8139c19','2024-09-30 13:25:55','a3b3349b-8f0e-4bda-adfa-496ab8139c19','2024-09-30 13:25:55','a3b3349b-8f0e-4bda-adfa-496ab8139c19'),('bb23dffa-1e2a-4bba-8ea9-171f35199270','2024-10-04','Cafe',0,'2d2dfabb-f3bf-48f5-ba26-56c3e3d44aa6','2024-09-30 14:15:31','2d2dfabb-f3bf-48f5-ba26-56c3e3d44aa6','2024-09-30 14:15:31','2d2dfabb-f3bf-48f5-ba26-56c3e3d44aa6'),('c7c1a7f7-1d7e-461a-9153-cec735a23b00','2024-07-31','Rumah',0,'9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-07-28 12:57:38','9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-07-28 12:57:38','9726650b-2ffa-4ba9-b38c-6c1179625e2e'),('eca49fc2-ea23-46f3-a2b4-acf97a10bfd9','2024-09-25','cafe',2,'2d2dfabb-f3bf-48f5-ba26-56c3e3d44aa6','2024-09-23 14:16:53','d955319c-f1c0-4efd-80d7-121d0826fe87','2024-09-23 14:42:26','2d2dfabb-f3bf-48f5-ba26-56c3e3d44aa6'),('fc1d58f2-9211-432d-a058-634e198a7362','2024-10-18','Cafe',0,'2d2dfabb-f3bf-48f5-ba26-56c3e3d44aa6','2024-10-15 10:10:32','2d2dfabb-f3bf-48f5-ba26-56c3e3d44aa6','2024-10-15 10:10:32','2d2dfabb-f3bf-48f5-ba26-56c3e3d44aa6'),('fc2b5156-6210-45c2-9f30-dc4567eb1bff','2024-09-20','fadsf',0,'9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-09-19 21:24:15','9726650b-2ffa-4ba9-b38c-6c1179625e2e','2024-09-19 21:24:15','9726650b-2ffa-4ba9-b38c-6c1179625e2e');
/*!40000 ALTER TABLE `wfh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_location`
--

DROP TABLE IF EXISTS `work_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `work_location` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_location`
--

LOCK TABLES `work_location` WRITE;
/*!40000 ALTER TABLE `work_location` DISABLE KEYS */;
INSERT INTO `work_location` (`id`, `name`) VALUES (1,'onsite'),(2,'remote');
/*!40000 ALTER TABLE `work_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_type`
--

DROP TABLE IF EXISTS `work_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `work_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_type`
--

LOCK TABLES `work_type` WRITE;
/*!40000 ALTER TABLE `work_type` DISABLE KEYS */;
INSERT INTO `work_type` (`id`, `name`) VALUES (1,'Work From Office'),(2,'Work From Home');
/*!40000 ALTER TABLE `work_type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-14  8:47:17

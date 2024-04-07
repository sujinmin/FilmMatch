-- MySQL dump 10.13  Distrib 8.0.35, for Win64 (x86_64)
--
-- Host: localhost    Database: moviedb
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brand` (
  `brand_idx` int NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(255) NOT NULL,
  `brand_description` text,
  `brand_number` varchar(20) DEFAULT NULL,
  `brand_addr` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`brand_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `cart_idx` int NOT NULL AUTO_INCREMENT,
  `mem_idx` int NOT NULL,
  `goods_idx` int DEFAULT NULL,
  `product_count` int DEFAULT NULL,
  `is_deleted` int DEFAULT '0',
  PRIMARY KEY (`cart_idx`),
  KEY `FK_member_TO_cart_1` (`mem_idx`),
  CONSTRAINT `FK_member_TO_cart_1` FOREIGN KEY (`mem_idx`) REFERENCES `member` (`mem_idx`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (29,2,8,1,1),(32,1,10,1,0);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `cate_id` int NOT NULL AUTO_INCREMENT,
  `cate_name` varchar(200) NOT NULL,
  `cate_parent_id` int DEFAULT NULL,
  PRIMARY KEY (`cate_id`),
  KEY `FK_categories_TO_categories_1` (`cate_parent_id`),
  CONSTRAINT `FK_categories_TO_categories_1` FOREIGN KEY (`cate_parent_id`) REFERENCES `categories` (`cate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (100,'문구류',NULL),(101,'필기류',100),(102,'공책',100),(103,'필통',100),(104,'지우개',100),(200,'소장품',NULL),(201,'피규어',200);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods`
--

DROP TABLE IF EXISTS `goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goods` (
  `goods_idx` int NOT NULL AUTO_INCREMENT,
  `mem_idx` int NOT NULL,
  `cate_id` int NOT NULL,
  `goods_name` varchar(255) DEFAULT NULL,
  `goods_contents` text,
  `goods_price` int DEFAULT NULL,
  `goods_Rate` int DEFAULT NULL,
  `goods_quantity` int DEFAULT NULL,
  `release_date` varchar(100) DEFAULT NULL,
  `goods_brand` varchar(100) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `goods_rating` int DEFAULT NULL,
  `goods_reviews` int DEFAULT NULL,
  `goods_availability` tinyint(1) DEFAULT NULL,
  `sale_start_date` varchar(100) DEFAULT NULL,
  `sale_end_date` varchar(100) DEFAULT NULL,
  `able_minors_buy` tinyint(1) NOT NULL,
  `country` varchar(100) DEFAULT NULL,
  `reg_date` datetime DEFAULT NULL,
  `mod_date` datetime DEFAULT NULL,
  PRIMARY KEY (`goods_idx`),
  KEY `FK_member_TO_goods_1` (`mem_idx`),
  KEY `FK_categories_TO_goods_1` (`cate_id`),
  CONSTRAINT `FK_categories_TO_goods_1` FOREIGN KEY (`cate_id`) REFERENCES `categories` (`cate_id`),
  CONSTRAINT `FK_member_TO_goods_1` FOREIGN KEY (`mem_idx`) REFERENCES `member` (`mem_idx`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods`
--

LOCK TABLES `goods` WRITE;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` VALUES (10,1,201,'헤리포터 펜슬','<p>아주 조오오오오오오오오오오오은 핼포텐</p>\r\n\r\n<p><img alt=\"\" src=\"/resources/ckimage/73ffd0eb-3b7c-4069-84a2-70644869257e\" style=\"border-style:solid; border-width:1px; height:300px; width:300px\" /></p>\r\n\r\n<p>아주 조오오오오오오오오오오오은 핼포텐</p>\r\n',1000,1,1,'2024-03-20','테스트','f0ccafa9-33f4-4e93-9879-898a57fc37c5',0,0,0,'2024-03-05','2024-03-29',1,'중국',NULL,'2024-03-29 09:21:40'),(11,1,102,'ㅁㄴㅇㄻㄴㅇㄹ','<p>ㅌㅌㅌㅌㅌ</p>\r\n',1111,111,111,'2024-03-17','11','f4da2130-688b-40b4-8a75-74aa38a9644d',0,0,0,'2024-03-19','2024-03-30',0,'',NULL,'2024-03-29 09:22:03');
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `mem_idx` int NOT NULL AUTO_INCREMENT,
  `mem_name` varchar(100) NOT NULL,
  `mem_id` varchar(100) NOT NULL,
  `mem_pwd` varchar(100) NOT NULL,
  `mem_email` varchar(100) NOT NULL,
  `mem_addr` varchar(100) NOT NULL,
  `mem_ip` varchar(100) NOT NULL,
  `mem_regdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `mem_modifydate` datetime DEFAULT CURRENT_TIMESTAMP,
  `mem_grade` varchar(100) DEFAULT '일반',
  `mem_zipcode` varchar(100) NOT NULL,
  PRIMARY KEY (`mem_idx`),
  UNIQUE KEY `mem_id_UNIQUE` (`mem_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,'John Doe','one','1234','johndoe@example.com','123 Main Street, Cityville','192.168.1.1','2024-03-25 17:11:12','2024-03-25 17:11:12','일반','12345'),(2,'admin','admin','1234','admin@admin.com','fffff','192.168.1.1','2024-03-25 17:11:12','2024-03-25 17:11:12','관리자','12345');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-29  9:24:58

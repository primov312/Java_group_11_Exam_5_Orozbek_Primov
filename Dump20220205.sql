-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: database_products
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brands` (
  `id` int NOT NULL AUTO_INCREMENT,
  `brand` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES (1,'Samsung'),(2,'ASUS'),(3,'Acer');
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category` varchar(100) NOT NULL DEFAULT 'name category',
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_UNIQUE` (`category`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Computers','Компьютеры'),(2,'TV','Телевизоры'),(3,'Smartphones','Смартфоны');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contragent`
--

DROP TABLE IF EXISTS `contragent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contragent` (
  `id` int NOT NULL AUTO_INCREMENT,
  `supplier` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contragent`
--

LOCK TABLES `contragent` WRITE;
/*!40000 ALTER TABLE `contragent` DISABLE KEYS */;
INSERT INTO `contragent` VALUES (1,'Vasya'),(2,'Vitya'),(3,'Viktor');
/*!40000 ALTER TABLE `contragent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `given`
--

DROP TABLE IF EXISTS `given`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `given` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_date` datetime NOT NULL,
  `product_id` int NOT NULL,
  `contragent_id` int NOT NULL,
  `sklad_id` int NOT NULL,
  `qty` decimal(10,3) NOT NULL DEFAULT '0.000',
  PRIMARY KEY (`id`),
  KEY `FK_product_idx` (`product_id`),
  KEY `FK_contragent_2` (`contragent_id`),
  KEY `FK_sklad_3` (`sklad_id`),
  CONSTRAINT `FK_contragent_2` FOREIGN KEY (`contragent_id`) REFERENCES `contragent` (`id`),
  CONSTRAINT `FK_product_3` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `FK_sklad_3` FOREIGN KEY (`sklad_id`) REFERENCES `sklad` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `given`
--

LOCK TABLES `given` WRITE;
/*!40000 ALTER TABLE `given` DISABLE KEYS */;
INSERT INTO `given` VALUES (1,'2022-04-01 12:30:33',1,1,1,100.000),(2,'2022-04-01 12:30:33',2,1,1,100.000),(3,'2022-04-01 12:30:33',3,1,1,200.000),(4,'2022-04-01 12:30:33',4,1,1,300.000),(5,'2022-05-01 12:30:33',5,2,2,400.000),(6,'2022-05-01 12:30:33',6,2,2,500.000),(7,'2022-05-01 12:30:33',7,2,2,600.000),(8,'2022-05-01 12:30:33',8,2,2,700.000),(9,'2022-06-01 12:30:33',9,2,2,800.000),(10,'2022-06-01 12:30:33',9,2,2,700.000),(11,'2022-06-01 12:30:33',1,2,2,600.000),(12,'2022-06-01 12:30:33',2,2,2,500.000);
/*!40000 ALTER TABLE `given` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `brand_id` int DEFAULT NULL,
  `product` varchar(45) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_category_idx` (`category_id`),
  KEY `FK_brand_idx` (`brand_id`),
  CONSTRAINT `FK_brand` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,1,1,'SD-12225',''),(2,2,1,'Smartled G7000',''),(3,3,1,'Galaxy s22+',''),(4,1,2,'ROG 2022',''),(5,2,2,'ULTRA I-7000',''),(6,3,2,'Rogphone 9',''),(7,1,3,'Gamer GG 22',''),(8,2,3,'ULTRA HD 10',''),(9,3,3,'M-13Pro Max','');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sklad`
--

DROP TABLE IF EXISTS `sklad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sklad` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sklad_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sklad`
--

LOCK TABLES `sklad` WRITE;
/*!40000 ALTER TABLE `sklad` DISABLE KEYS */;
INSERT INTO `sklad` VALUES (1,'Sosnovka'),(2,'Alaska'),(3,'Greenland');
/*!40000 ALTER TABLE `sklad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `soderjimoe_skladov`
--

DROP TABLE IF EXISTS `soderjimoe_skladov`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `soderjimoe_skladov` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_date` datetime NOT NULL,
  `sklad_id` int NOT NULL,
  `product_id` int NOT NULL,
  `qty` decimal(10,3) NOT NULL DEFAULT '0.000',
  PRIMARY KEY (`id`),
  KEY `FK_product_idx` (`product_id`),
  KEY `FK_sklad` (`sklad_id`),
  CONSTRAINT `FK_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `FK_sklad` FOREIGN KEY (`sklad_id`) REFERENCES `sklad` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `soderjimoe_skladov`
--

LOCK TABLES `soderjimoe_skladov` WRITE;
/*!40000 ALTER TABLE `soderjimoe_skladov` DISABLE KEYS */;
INSERT INTO `soderjimoe_skladov` VALUES (1,'2022-01-01 12:30:33',1,1,800.000),(2,'2022-01-01 12:30:33',1,2,811.000),(3,'2022-02-01 12:30:33',1,3,833.000),(4,'2022-01-01 12:30:33',1,4,822.000),(5,'2022-03-01 12:30:33',1,5,844.000),(6,'2022-02-01 12:30:33',1,6,855.000),(7,'2022-03-01 12:30:33',1,7,866.000),(8,'2022-04-01 12:30:33',1,8,877.000),(9,'2022-05-01 12:30:33',1,9,888.000),(10,'2022-01-01 12:30:33',2,1,900.000),(11,'2022-02-01 12:30:33',2,2,911.000),(12,'2022-03-01 12:30:33',2,3,922.000),(13,'2022-05-01 12:30:33',2,4,933.000),(14,'2022-04-01 12:30:33',2,5,944.000),(15,'2022-03-01 12:30:33',2,6,955.000),(16,'2022-02-01 12:30:33',2,7,966.000),(17,'2022-01-01 12:30:33',2,8,977.000),(18,'2022-04-01 12:30:33',2,9,988.000),(19,'2022-05-01 12:30:33',3,1,1000.000),(20,'2022-04-01 12:30:33',3,2,1011.000),(21,'2022-03-01 12:30:33',3,3,1022.000),(22,'2022-02-01 12:30:33',3,4,1033.000),(23,'2022-01-01 12:30:33',3,5,1044.000),(24,'2022-05-01 12:30:33',3,6,1055.000),(25,'2022-04-01 12:30:33',3,7,1066.000),(26,'2022-03-01 12:30:33',3,8,1077.000),(27,'2022-02-01 12:30:33',3,9,1088.000);
/*!40000 ALTER TABLE `soderjimoe_skladov` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `took`
--

DROP TABLE IF EXISTS `took`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `took` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_date` datetime NOT NULL,
  `product_id` int NOT NULL,
  `contragent_id` int NOT NULL,
  `sklad_id` int NOT NULL,
  `qty` decimal(10,3) NOT NULL DEFAULT '0.000',
  PRIMARY KEY (`id`),
  KEY `FK_product_idx` (`product_id`),
  KEY `FK_contragent` (`contragent_id`),
  KEY `FK_sklad_2` (`sklad_id`),
  CONSTRAINT `FK_contragent` FOREIGN KEY (`contragent_id`) REFERENCES `contragent` (`id`),
  CONSTRAINT `FK_product_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `FK_sklad_2` FOREIGN KEY (`sklad_id`) REFERENCES `sklad` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `took`
--

LOCK TABLES `took` WRITE;
/*!40000 ALTER TABLE `took` DISABLE KEYS */;
INSERT INTO `took` VALUES (1,'2022-01-01 12:30:33',1,1,1,10.000),(2,'2022-01-01 12:30:33',2,1,1,100.000),(3,'2022-01-01 12:30:33',3,1,1,200.000),(4,'2022-01-01 12:30:33',4,1,1,300.000),(5,'2022-02-01 12:30:33',5,2,2,400.000),(6,'2022-02-01 12:30:33',6,2,2,500.000),(7,'2022-02-01 12:30:33',7,2,2,600.000),(8,'2022-02-01 12:30:33',8,2,2,700.000),(9,'2022-03-01 12:30:33',9,2,2,800.000),(10,'2022-03-01 12:30:33',9,2,2,700.000),(11,'2022-03-01 12:30:33',1,2,2,600.000),(12,'2022-03-01 12:30:33',2,2,2,500.000);
/*!40000 ALTER TABLE `took` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-05 17:31:44

-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: clup_engsw2020
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `idCategory` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) COLLATE utf8_bin NOT NULL,
  `Description` varchar(45) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`idCategory`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Tools','Dolor iusto. Exercitationem?'),(2,'Office','Nesciunt cum. Nemo ratione.'),(3,'Crafts','Aliquid doloribus. Unde enim.'),(4,'Accessories','Quis blanditiis. Aliquid!'),(5,'Clothing','Delectus quo vel fugiat aut;'),(6,'Clothing','Blanditiis repellendus.'),(7,'Books','Unde beatae...'),(8,'Food','Id molestiae. Magni modi.'),(9,'Books','Error nobis nostrum veniam.'),(10,'Audible','Voluptate inventore.'),(11,'Pets','Molestias sunt. Nesciunt.'),(12,'Pharmacy','Voluptates unde ut autem ipsa...'),(13,'Audible','Dolore odit. Praesentium!'),(14,'Pets','Fugiat earum. Laboriosam.'),(15,'Automotive','Rem adipisci.'),(16,'Food','Mollitia corrupti iste.'),(17,'Patio','Perspiciatis quidem.'),(18,'Electronics','Quisquam omnis. Voluptates...'),(19,'Baby','Voluptate eum. Est a.'),(20,'Food','Aliquam iste et aut ad. Illum!'),(21,'Home','Vero esse. Eius laudantium?'),(22,'Toys','Et sit nulla sequi dicta.'),(23,'Audible','At sed nostrum.'),(24,'Games','Incidunt est id ut id.'),(25,'Health','Et voluptatem eos qui.'),(26,'Home','Ut qui rerum. Illum iste.'),(27,'Accessories','Dolores odio molestias. Alias.'),(28,'Jewelry','Voluptates quia nisi non.'),(29,'Games','Repellendus temporibus.'),(30,'Tools','Quisquam laudantium. Est odio.'),(31,'Movies','Nulla laboriosam. Facere.'),(32,'Toys','Sunt deserunt aut optio;'),(33,'Beauty','Ea magni. Praesentium rerum.'),(34,'Outdoors','Consequuntur exercitationem.'),(35,'Music','Animi dolorum.'),(36,'Home','Voluptate eius. Et sit?'),(37,'Pharmacy','Rerum voluptas. Blanditiis.'),(38,'Shoes','Omnis suscipit quasi iusto;'),(39,'Jewelry','Nam est; magni incidunt.'),(40,'Movies','Cum nam aut impedit dolor.'),(41,'Gifts','Nam omnis sunt facere.'),(42,'Beauty','Voluptatem adipisci.'),(43,'Health','Iste magnam. Numquam aperiam!'),(44,'Movies','Adipisci a. Adipisci et.'),(45,'Automotive','Ratione sunt; error eaque.'),(46,'Electronics','Reiciendis dolore. Natus.'),(47,'Accessories','Ea fuga ex.'),(48,'Shoes','Quibusdam labore. Omnis;'),(49,'Jewelry','Voluptatibus aut accusamus et.'),(50,'Music','Et quia. Tempore a.');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-30 14:54:25

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
-- Table structure for table `store`
--

DROP TABLE IF EXISTS `store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store` (
  `idstore` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_bin NOT NULL,
  `description` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `telephoneNumber` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `address` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `city` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `capacity` int DEFAULT NULL,
  `bookableCapacity` int DEFAULT NULL,
  PRIMARY KEY (`idstore`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store`
--

LOCK TABLES `store` WRITE;
/*!40000 ALTER TABLE `store` DISABLE KEYS */;
INSERT INTO `store` VALUES (1,'International Technologies','UA-925461658-7','(702) 195-3344','Ski Hill Circle','Addieville',623,100),(2,'National Software Corp.','AT-395778713-7','(796) 331-3901','Nunting Hill Ct','Pearcy',150,100),(3,'Smart Entertainment Inc.','AU-836678570-2','(625) 364-1736','Riddle Hill Dr','Tullahoma',512,100),(4,'American High-Technologies','MX-184579974-4','(850) 936-6083','Hazelwood Pkwy','Brookport',853,100),(5,'General I-Mobile Corporation','UA-306995623-9','(318) 965-0906','Tree Drive','Addis',543,100),(6,'Special High-Technologies Group','BE-925461659-4','(914) 453-6439','Fox Hill Hwy','Zuni',548,100),(7,'Union Transport Co.','CA-273363065-1','(254) 094-5202','Hill Road','Sanbornville',690,100),(8,'North V-Mobile Inc.','UA-395778714-2','(431) 593-0549','Riddle Hill Drive','Drumright',743,100),(9,'Professional High-Technologies Group','AT-836678571-3','(749) 556-0109','Parkwood Highway','Lost Springs',840,100),(10,'Canadian Data Inc.','AU-488736194-1','(596) 603-0597','Hidden Chapel Hill Way','Hughson',579,100),(11,'Advanced High-Technologies Co.','US-925461660-3','(210) 771-7759','Deepwood Way','Sequoia National Park',737,100),(12,'Union High-Technologies Co.','CH-836678572-3','(356) 593-8571','Church St','Brooks',594,100),(13,'Federal Space Explore Corporation','FR-577519285-0','(565) 755-8691','1239 Prospect Hill Way','Addison',399,100),(14,'Advanced Products Co.','AU-306995624-7','(710) 346-8736','2039 Pine Tree Ct','Lott',882,100),(15,'Professional Fossil Fuel Resources Inc.','GB-184579975-5','(384) 850-4866','697 North Riverview Ct','Hugo',947,100),(16,'Pacific R-Mobile Corp.','JP-488736195-6','(797) 199-6585','3066 East Beachwood Loop','Loudon',918,100),(17,'Flexible Space Research Corporation','JP-925461661-9','(939) 739-0554','548 NE Front Street','Glendale',288,100),(18,'Creative Insurance Inc.','AU-273363066-7','(786) 417-1671','2238 Fox Hill Drive','Dryden',185,100),(19,'Advanced 4G Wireless Corporation','GB-765683344-3','(269) 094-5066','929 Hidden Church Blvd','Pearisburg',122,100),(20,'Australian Space Explore Co.','CA-184579976-8','(840) 588-0731','2571 Cedar Tree Loop','Sand Coulee',521,100),(21,'East 2D Electronic Group','MX-273363067-8','(415) 740-1936','3023 NE Buttonwood Way','Pearl City',252,100),(22,'International High-Technologies Inc.','DE-577519286-5','(360) 951-8277','434 SW Burwood Ct','Glendale Heights',726,100),(23,'Professional High-Technologies Inc.','GB-836678573-3','(473) 072-1782','3450 Farmview Ct','Hugoton',370,100),(24,'Flexible High-Technologies Group','JP-925461662-7','(702) 519-4471','81 Meadowview Avenue','Sand Creek',693,100),(25,'Flexible Fossil Fuel Energy Group','JP-836678574-2','(786) 944-2198','2513 Fox Hill Lane','Pearl River',198,100),(26,'First M-Mobile Inc.','CA-395778715-1','(891) 951-7933','866 White Church Pkwy','Loudonville',597,100),(27,'Pacific Logistic Group','CH-488736196-1','(473) 401-1217','215 West Rockwood Ct','Sand Lake',103,100),(28,'East High-Technologies Co.','JP-184579977-2','(416) 745-1191','3697 Oak Loop','Hulbert',108,100),(29,'Beyond Space Research Corp.','GB-577519287-3','(989) 120-3150','1768 Red Lake Lane','Tully',157,100),(30,'Future Solar Resources Group','MX-925461663-0','(808) 189-2431','2328 East Riverview Lane','Sergeant Bluff',290,100),(31,'Beyond Services Group','US-676900254-3','(931) 650-8132','751 West Ashwood Lane','Du Bois',315,100),(32,'Australian Services Corp.','AU-488736197-4','(504) 459-5581','933 White Burwood Hwy','Pearland',423,100),(33,'City Petroleum Inc.','BE-273363068-2','(241) 287-5818','707 New Town St','Sand Springs',378,100),(34,'Creative Research Corporation','US-306995625-4','(812) 702-0614','472 New Monument Street','Tulsa',419,100),(35,'International Trust Group','AT-395778716-0','(634) 790-4114','1270 Riverview St','Louisa',288,100),(36,'Canadian Financial Experts Group','JP-306995626-0','(143) 360-0969','807 Waterview Loop','Huletts Landing',323,100),(37,'Global Thermal Energy Group','CA-765683345-5','(986) 493-8375','18 Parkwood Hwy','Brookshire',692,100),(38,'North Trust Inc.','FR-836678575-1','(683) 365-6960','2264 Town Way','Addy',621,100),(39,'City Petroleum Corporation','AU-395778717-5','(837) 038-5319','1512 Waterview Cir','Louisburg',240,100),(40,'Creative Insurance Corporation','DE-184579978-9','(342) 558-2151','2249 Deepwood Circle','Glendive',911,100),(41,'General 5G Wireless Inc.','DE-676900255-7','(791) 230-5199','3317 Highland St','Brookston',419,100),(42,'Home High-Technologies Group','AT-765683346-4','(340) 463-6714','966 Sharp Hill Way','Sesser',553,100),(43,'Canadian U-Mobile Group','FR-676900256-8','(432) 506-8997','850 North Pine Tree Blvd','Adel',794,100),(44,'Advanced Industry Group','BE-577519288-3','(303) 134-2491','899 Brentwood Court','Du Quoin',149,100),(45,'Federal Protection Corporation','US-925461664-5','(529) 689-5807','3807 Mountain Parkway','Brooksville',260,100),(46,'Home 3G Wireless Inc.','JP-488736198-0','(438) 303-8502','41 Rock Hill Road','Hull',401,100),(47,'WorldWide Green Energy Inc.','AT-765683347-2','(229) 986-0001','2538 Rock Hill Lane','Louise',911,100),(48,'Domestic Space Explore Group','CA-273363069-3','(142) 613-9153','51 Pine Tree Rd','Glendora',325,100),(49,'North High-Technologies Group','CA-676900257-8','(950) 515-4614','773 Stonewood Ct','Duanesburg',327,100),(50,'Canadian Electricity Group','GB-577519289-9','(970) 307-7148','1065 East Hope Way','Pearlington',638,100);
/*!40000 ALTER TABLE `store` ENABLE KEYS */;
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

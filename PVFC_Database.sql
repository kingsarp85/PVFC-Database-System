-- MySQL dump 10.13  Distrib 9.6.0, for macos26.3 (arm64)
--
-- Host: localhost    Database: PineValleyFC
-- ------------------------------------------------------
-- Server version	9.7.0

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '70321b64-507c-11f1-9a2b-2ed18c4cd64c:1-38';

--
-- Table structure for table `Customer_T`
--

DROP TABLE IF EXISTS `Customer_T`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customer_T` (
  `CustomerID` int NOT NULL,
  `CustomerName` varchar(50) NOT NULL,
  `CustomerAddress` varchar(100) DEFAULT NULL,
  `CustomerCity` varchar(50) DEFAULT NULL,
  `CustomerState` varchar(50) DEFAULT NULL,
  `CustomerPostalCode` varchar(20) DEFAULT NULL,
  `CustomerEmail` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer_T`
--

LOCK TABLES `Customer_T` WRITE;
/*!40000 ALTER TABLE `Customer_T` DISABLE KEYS */;
INSERT INTO `Customer_T` VALUES (1100,'Kwame Mensah','12 Ring Road','Koforidua','Greater Accra','GA100','kwame@gmail.com'),(1101,'Ama Serwaa','45 Lake Road','Kumasi','Ashanti','AK200','ama@gmail.com'),(1102,'John Doe','18 Palm Street','Tamale','Northern','NR300','john@gmail.com'),(1103,'Kingsley Sarpei','20 Oxford Street','Accra','Greater Accra','GA400','safawu@gmail.com'),(1104,'Linda Asante','55 Market Road','Cape Coast','Central','CC500','linda@gmail.com');
/*!40000 ALTER TABLE `Customer_T` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Order_T`
--

DROP TABLE IF EXISTS `Order_T`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Order_T` (
  `OrderID` int NOT NULL,
  `OrderDate` date NOT NULL,
  `CustomerID` int DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `fk_customer` (`CustomerID`),
  CONSTRAINT `fk_customer` FOREIGN KEY (`CustomerID`) REFERENCES `Customer_T` (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Order_T`
--

LOCK TABLES `Order_T` WRITE;
/*!40000 ALTER TABLE `Order_T` DISABLE KEYS */;
INSERT INTO `Order_T` VALUES (2001,'2025-01-10',1100),(2002,'2025-02-15',1101),(2003,'2025-03-20',1102),(2004,'2025-04-05',1103),(2005,'2025-05-01',1104);
/*!40000 ALTER TABLE `Order_T` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrderLine_T`
--

DROP TABLE IF EXISTS `OrderLine_T`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OrderLine_T` (
  `OrderID` int NOT NULL,
  `ProductID` int NOT NULL,
  `OrderedQuantity` int DEFAULT NULL,
  PRIMARY KEY (`OrderID`,`ProductID`),
  KEY `fk_product` (`ProductID`),
  CONSTRAINT `fk_order` FOREIGN KEY (`OrderID`) REFERENCES `Order_T` (`OrderID`),
  CONSTRAINT `fk_product` FOREIGN KEY (`ProductID`) REFERENCES `Product_T` (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderLine_T`
--

LOCK TABLES `OrderLine_T` WRITE;
/*!40000 ALTER TABLE `OrderLine_T` DISABLE KEYS */;
INSERT INTO `OrderLine_T` VALUES (2001,3001,5),(2002,3002,8),(2003,3003,12),(2004,3004,15),(2005,3005,4);
/*!40000 ALTER TABLE `OrderLine_T` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Product_T`
--

DROP TABLE IF EXISTS `Product_T`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Product_T` (
  `ProductID` int NOT NULL,
  `ProductDescription` varchar(100) NOT NULL,
  `ProductFinish` varchar(20) DEFAULT NULL,
  `ProductStandardPrice` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`ProductID`),
  KEY `idx_product_price` (`ProductStandardPrice`),
  CONSTRAINT `chk_finish` CHECK ((`ProductFinish` in (_utf8mb4'Cherry',_utf8mb4'Natural Ash',_utf8mb4'White Ash',_utf8mb4'Red Oak',_utf8mb4'Walnut',_utf8mb4'Pine',_utf8mb4'Maple')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product_T`
--

LOCK TABLES `Product_T` WRITE;
/*!40000 ALTER TABLE `Product_T` DISABLE KEYS */;
INSERT INTO `Product_T` VALUES (3001,'Office Desk','Natural Ash',450.00),(3002,'Executive Chair','Walnut',600.00),(3003,'Bookshelf','Red Oak',350.00),(3004,'Conference Table','Maple',1200.00),(3005,'Wooden Cabinet','Pine',700.00),(3006,'Cherry Dining Table','Cherry',800.00);
/*!40000 ALTER TABLE `Product_T` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-16  9:31:09

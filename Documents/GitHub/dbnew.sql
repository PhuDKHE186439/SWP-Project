CREATE DATABASE  IF NOT EXISTS `trainproject` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `trainproject`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: trainproject
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `AccountID` int NOT NULL AUTO_INCREMENT,
  `PhoneNumber` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Username` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `RoleID` int DEFAULT NULL,
  `PassengerID` int DEFAULT NULL,
  `Status` enum('Active','Banned') NOT NULL DEFAULT 'Active',
  PRIMARY KEY (`AccountID`),
  KEY `RoleID` (`RoleID`),
  KEY `account_ibfk_2` (`PassengerID`),
  CONSTRAINT `account_ibfk_1` FOREIGN KEY (`RoleID`) REFERENCES `role` (`RoleID`),
  CONSTRAINT `account_ibfk_2` FOREIGN KEY (`PassengerID`) REFERENCES `passenger` (`PassengerID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,'555-1234','johnd','password123','himmel@gmail.com',3,1,'Active'),(2,'555-5678','janes','janeSecure','johnsmith@gmail.com',3,2,'Active'),(3,'555-9876','robj','robJ2023','emiya@gmail.com',3,3,'Active'),(4,'555-6543','emilyd','emilyPass456','Phudk@gmail.com',3,4,'Active'),(5,'096-258-2004','admin1','admin1','DungPVHE180060@gmail.com',1,NULL,'Active'),(6,'555-3344-6352','admin2','admin2','admin2@system.com',1,NULL,'Active'),(7,'555-6543','Mana','ManagerTicket','Manager@gmail.com',2,NULL,'Active'),(8,'0967851513','andeptrai','1','maid23344@gmail.com',3,5,'Active'),(9,'123456789','BROS','BROS','BROS@gmail.com',2,NULL,'Active');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compartment`
--

DROP TABLE IF EXISTS `compartment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compartment` (
  `CompartmentID` int NOT NULL,
  `CompartmentNumber` int DEFAULT NULL,
  `TrainID` int DEFAULT NULL,
  PRIMARY KEY (`CompartmentID`),
  KEY `fk_train_idx` (`TrainID`),
  CONSTRAINT `fk_train` FOREIGN KEY (`TrainID`) REFERENCES `train` (`TrainID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compartment`
--

LOCK TABLES `compartment` WRITE;
/*!40000 ALTER TABLE `compartment` DISABLE KEYS */;
INSERT INTO `compartment` VALUES (1,101,1),(2,102,2),(3,103,3);
/*!40000 ALTER TABLE `compartment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `FeedbackID` int NOT NULL,
  `Message` text,
  `PassengerID` int DEFAULT NULL,
  `SubmissionDate` date DEFAULT NULL,
  PRIMARY KEY (`FeedbackID`),
  KEY `PassengerID` (`PassengerID`),
  CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`PassengerID`) REFERENCES `passenger` (`PassengerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (1,'Great service, smooth ride. wow',1,'2024-09-16'),(2,'The seat was uncomfortable. nah',2,'2024-09-16'),(3,'Thật tuyet, cam on bau duc',3,'2023-04-07'),(4,'ok cam on bau duc',3,'2024-09-15'),(5,'qua ok',4,'2024-09-13'),(6,'ok mik xe dat ve lan xau haha',5,'2024-09-13'),(7,'Trải nghiệm tệ hại, không bao giờ có lần sau',1,'2024-08-13'),(8,'Tàu êm ',2,'2024-07-13'),(9,'Ghế êm ái, thoải mái',4,'2024-09-09'),(10,'Chưa được êm lắm',3,'2024-02-13');
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `LocationID` int NOT NULL,
  `LocationName` varchar(45) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`LocationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,'Ha Noi','Main station in Ha Noi'),(2,'Hai Phong','Main station in Hai Phong'),(3,'Da Nang','Main station in Da Nang'),(4,'Ho Chi Minh','Main station in Ho Chi Minh');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `otpquestion`
--

DROP TABLE IF EXISTS `otpquestion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `otpquestion` (
  `AccountID` int DEFAULT NULL,
  `OtpQuestion` text,
  `OtpAnswer` int DEFAULT NULL,
  KEY `AccountID` (`AccountID`),
  CONSTRAINT `otpquestion_ibfk_1` FOREIGN KEY (`AccountID`) REFERENCES `account` (`AccountID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `otpquestion`
--

LOCK TABLES `otpquestion` WRITE;
/*!40000 ALTER TABLE `otpquestion` DISABLE KEYS */;
/*!40000 ALTER TABLE `otpquestion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passenger`
--

DROP TABLE IF EXISTS `passenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passenger` (
  `PassengerID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Age` int DEFAULT NULL,
  `Address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `PhoneNumber` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`PassengerID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passenger`
--

LOCK TABLES `passenger` WRITE;
/*!40000 ALTER TABLE `passenger` DISABLE KEYS */;
INSERT INTO `passenger` VALUES (1,'Himmel','himmel@gmail.com',28,'British','555-1234-4321'),(2,'John Smith','johnsmith@gmail.com',34,'America','555-5678-4321'),(3,'Rin Tohsaka','emiya@gmail.com',22,' Japan','555-9876-4321'),(4,'Dang Khac Phu','Phudk@gmail.com',26,'Viet Nam','555-6543-4321'),(5,'Đỗ Thành An','Dude99@gmail.com',11,'hola','0967851513');
/*!40000 ALTER TABLE `passenger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `PaymentID` int NOT NULL AUTO_INCREMENT,
  `TicketID` int DEFAULT NULL,
  `PaymentMethod` enum('Bank','Digital Wallet') DEFAULT NULL,
  `PaymentDate` date DEFAULT NULL,
  `Amount` double DEFAULT NULL,
  `Fullname` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Phone` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Email` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`PaymentID`),
  KEY `TicketID` (`TicketID`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`TicketID`) REFERENCES `ticket` (`TicketID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,1,'Bank','2024-09-01',150,NULL,NULL,NULL),(2,2,'Digital Wallet','2024-09-01',50,NULL,NULL,NULL),(5,9,'Bank','2024-10-14',100,'nva','0123123','nva123@gmail.com'),(6,10,'Bank','2024-10-14',100,'nnnnn','0123123123','nnn@gmail.com');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `RoleID` int NOT NULL AUTO_INCREMENT,
  `RoleName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`RoleID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Admin'),(2,'TicketManager'),(3,'Passenger');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seat`
--

DROP TABLE IF EXISTS `seat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seat` (
  `SeatID` int NOT NULL,
  `CompartmentID` int DEFAULT NULL,
  `SeatNumber` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `AvailabilityStatus` tinyint(1) DEFAULT NULL,
  `SeatType` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`SeatID`),
  KEY `fk_compartment` (`CompartmentID`),
  CONSTRAINT `fk_compartment` FOREIGN KEY (`CompartmentID`) REFERENCES `compartment` (`CompartmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seat`
--

LOCK TABLES `seat` WRITE;
/*!40000 ALTER TABLE `seat` DISABLE KEYS */;
INSERT INTO `seat` VALUES (1,1,'1',1,'First Class'),(2,1,'2',1,'Economy'),(3,1,'3',1,'First Class'),(4,1,'4',1,'Economy'),(5,3,'2',1,'Economy');
/*!40000 ALTER TABLE `seat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `TicketID` int NOT NULL AUTO_INCREMENT,
  `PassengerID` int DEFAULT NULL,
  `TicketClassID` int DEFAULT NULL,
  `PurchaseDate` date DEFAULT NULL,
  `TicketPrice` double DEFAULT NULL,
  `SeatID` int DEFAULT NULL,
  `TimeArrive` date DEFAULT NULL,
  `status` int DEFAULT NULL,
  `CompartmentID` int DEFAULT NULL,
  `CompartmentNumber` int DEFAULT NULL,
  PRIMARY KEY (`TicketID`),
  KEY `PassengerID` (`PassengerID`),
  KEY `TicketClassID` (`TicketClassID`),
  KEY `SeatID` (`SeatID`),
  KEY `fk_ticket_compartment` (`CompartmentID`),
  CONSTRAINT `fk_ticket_compartment` FOREIGN KEY (`CompartmentID`) REFERENCES `compartment` (`CompartmentID`),
  CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`PassengerID`) REFERENCES `passenger` (`PassengerID`),
  CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`TicketClassID`) REFERENCES `ticketclass` (`TicketClassID`),
  CONSTRAINT `ticket_ibfk_4` FOREIGN KEY (`SeatID`) REFERENCES `seat` (`SeatID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (1,1,1,'2024-09-01',150,1,'2024-09-17',1,1,1),(2,2,2,'2024-09-01',50,2,'2024-09-17',1,1,2),(3,1,1,'2024-10-10',100,1,'2024-10-10',1,1,3),(4,1,1,'2024-10-10',100,2,'2024-10-17',1,1,4),(5,1,1,'2024-10-10',100,3,'2024-10-15',1,1,5),(6,1,1,'2024-10-10',200,5,'2024-10-20',0,2,1),(7,2,1,'2024-10-14',100,5,'2024-10-17',0,1,1),(8,2,1,'2024-10-14',100,5,'2024-10-17',0,1,1),(9,2,1,'2024-10-14',100,5,'2024-10-17',0,1,1),(10,2,1,'2024-10-14',100,4,'2024-10-17',0,1,101);
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticketclass`
--

DROP TABLE IF EXISTS `ticketclass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticketclass` (
  `TicketClassID` int NOT NULL,
  `CategoryName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`TicketClassID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticketclass`
--

LOCK TABLES `ticketclass` WRITE;
/*!40000 ALTER TABLE `ticketclass` DISABLE KEYS */;
INSERT INTO `ticketclass` VALUES (1,'First Class'),(2,'Business Class');
/*!40000 ALTER TABLE `ticketclass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `train`
--

DROP TABLE IF EXISTS `train`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `train` (
  `TrainID` int NOT NULL,
  `TrainScheduleTime` date DEFAULT NULL,
  `TrainName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `NumberOfSeat` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `StartLocationID` int DEFAULT NULL,
  `ArrivalLocationID` int DEFAULT NULL,
  PRIMARY KEY (`TrainID`),
  KEY `StartLocationID` (`StartLocationID`),
  KEY `ArrivalLocationID` (`ArrivalLocationID`),
  CONSTRAINT `train_ibfk_1` FOREIGN KEY (`StartLocationID`) REFERENCES `location` (`LocationID`),
  CONSTRAINT `train_ibfk_2` FOREIGN KEY (`ArrivalLocationID`) REFERENCES `location` (`LocationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `train`
--

LOCK TABLES `train` WRITE;
/*!40000 ALTER TABLE `train` DISABLE KEYS */;
INSERT INTO `train` VALUES (1,'2024-10-17','Express 101','100',1,2),(2,'2024-09-17','Local 202','120',2,3),(3,'2024-10-10','Train 1','130',1,2),(4,'2024-10-11','Train 2','135',1,2),(5,'2024-10-12','Train 3','133',1,2),(6,'2024-10-20','Train 4','90',1,2);
/*!40000 ALTER TABLE `train` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'trainproject'
--

--
-- Dumping routines for database 'trainproject'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-14  2:59:57

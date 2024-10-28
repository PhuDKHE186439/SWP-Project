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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,'9999999989','johnd','$2a$10$1nzaLH/XQvOw2f.t3mxRceEyPdAXUl2XePE3K9zhDWd0V/m9tf3zi','traintravel238@gmail.com',3,1,'Active'),(2,'555-5678','janes','janeSecure','johnsmith@gmail.com',3,2,'Active'),(3,'555-9876','robj','robJ2023','emiya@gmail.com',3,3,'Active'),(4,'555-6543','emilyd','emilyPass456','Phudk@gmail.com',3,4,'Active'),(5,'096-258-2004','admin1','admin1','DungPVHE180060@gmail.com',1,NULL,'Active'),(6,'555-3344-6352','admin2','admin2','admin2@system.com',1,NULL,'Active'),(7,'555-6543','Mana','ManagerTicket','Manager@gmail.com',2,NULL,'Active'),(8,'0967851513','andeptrai','1','maid23344@gmail.com',3,5,'Active'),(9,'123456789','BROS','BROS','BROS@gmail.com',2,NULL,'Active'),(10,'0978750255','AnnaGame','12345678','AnnA@gmail.com',3,6,'Active'),(11,'0123456789','dung','dung','PhuDKHE186439@fpt.edu.vn',3,7,'Active'),(12,'1234567890','abcd','$2a$10$pXBwX/3CCUkyBrUtUlAmBOqEFTc5P89ARt/pKklD..SQnZDY.ot9S','PhuDKHE186439@fpt.edu.vn',3,8,'Active');
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
INSERT INTO `compartment` VALUES (1,101,1),(2,102,2),(3,103,1);
/*!40000 ALTER TABLE `compartment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `FeedbackID` int NOT NULL AUTO_INCREMENT,
  `Message` text,
  `PassengerID` int DEFAULT NULL,
  `SubmissionDate` date DEFAULT NULL,
  `FeedbackType` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`FeedbackID`),
  KEY `PassengerID` (`PassengerID`),
  CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`PassengerID`) REFERENCES `passenger` (`PassengerID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (1,'Great service, smooth ride. wow',1,'2024-09-16','Service'),(2,'The seat was uncomfortable. nah',2,'2024-09-16','Service'),(3,'Thật tuyet, cam on bau duc',3,'2023-04-07','Service'),(4,'ok cam on bau duc',3,'2024-09-15','Service'),(5,'qua ok',4,'2024-09-13','Service'),(6,'ok mik xe dat ve lan xau haha',5,'2024-09-13','Service'),(7,'Trải nghiệm tệ hại, không bao giờ có lần sau',1,'2024-08-13','Service'),(8,'Tàu êm ',2,'2024-07-13','Service'),(9,'Ghế êm ái, thoải mái',4,'2024-09-09','Service'),(10,'Chưa được êm lắm',3,'2024-02-13','Service'),(11,'Hello',3,'2024-10-07','Service'),(12,'Hello',6,'2024-10-07','Service'),(13,'Hello World',6,'2024-10-07','Service'),(14,'This Web is bad',6,'2024-10-12','Service'),(15,'This Web is Bug wverywhere',1,'2024-10-23','Bugs');
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
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text,
  `image` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  CONSTRAINT `news_chk_1` CHECK ((`status` in (1,2)))
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (14,'Tàu hỏa chạy trở lại trên cầu Long Biên và Đuống haha','Các đoàn tàu chở khách, chở hàng chạy trở lại trên cầu Long Biên, cầu Đuống từ chiều 13/9, sau hai ngày dừng do mưa lũ.\r\n\r\nTàu khách LP5 đi Hải Phòng là chuyến đầu tiên qua cầu Long Biên sau khi chạy lại, xuất phát tại ga Hà Nội lúc 15h15. Trong ngày còn có tàu LP8 từ Hải Phòng về ga Long Biên.  Từ ngày 14/9, các tàu trên tuyến Hà Nội - Hải Phòng chạy bình thường qua cầu Long Biên. Hàng ngày ngành đường sắt lập 4 đôi tàu khách xuất phát từ ga Hà Nội hoặc Long Biên đến ga Hải Phòng và ngược lại. Một số đôi tàu hàng từ ga Giáp Bát đến Yên Viên cũng qua cầu Long Biên.\r\n\r\nCác đoàn tàu hàng chạy tuyến Hà Nội - Đồng Đăng qua cầu Đuống cũng vận hành trở lại. Riêng việc khôi phục giao thông đường bộ trên hai cầu vẫn chưa được Sở Giao thông Vận tải Hà Nội thông báo.\r\n\r\nTrước khi đưa hai cầu hoạt động, ngành đường sắt đã kiểm tra, gia cố vị trí trên cầu đảm bảo tàu an toàn. Tàu hàng chạy thử với tốc độ 5 km/h qua hai cầu từ Yên Viên tới ga Long Biên, sau đó nâng tốc độ chạy ngược lại về Yên Viên.\r\n\r\nDo bão lũ, nước sông Hồng, sông Đuống dâng cao, ngành đường sắt dừng chạy tàu qua cầu Long Biên, cầu Đuống từ 8h ngày 10/9. Người và xe cũng không được qua hai cầu này từ chiều và tối cùng ngày.           ','https://i1-vnexpress.vnecdn.net/2024/09/13/z5825972368646-e21cf7475b052d7-8796-9342-1726206291.jpg?w=1020&h=0&q=100&dpr=1&fit=crop&s=HLAQTg0RzRF0kRKzCKEskQ','HA NOi',1,'2024-10-13 13:22:13','2024-10-13 14:48:26'),(15,'Cấm cầu Long Biên','Do nước sông Hồng lên báo động một, UBND TP Hà Nội quyết định cấm tất cả phương tiện qua cầu Long Biên từ 15h hôm nay đến khi đảm bảo an toàn.\r\n\r\nVới lệnh cấm này, người đi bộ, đi xe đạp, xe máy, xe ba bánh không được qua cầu Long Biên nối quận Hoàn Kiếm với Long Biên. 9h cùng ngày, ngành đường sắt dừng tàu hỏa chạy qua cầu Long Biên, đồng nghĩa 5-6 đôi tàu phải dừng lại.\r\n\r\nLũ sông Hồng dâng cao, chiều nay đã lên báo động một 9,5 m (cao nhất là báo động ba). Từ năm 2008 đến nay, lũ sông Hồng tại Hà Nội mới cao như vậy. Việc lưu thông trên các cầu bắc qua sông Hồng được đánh giá là nguy hiểm. Vì thế từ 8h30 sáng, Sở Giao thông Vận tải Hà Nội cấm xe khách, xe hợp đồng, ôtô du lịch trên 9 chỗ, ôtô tải trên 0,5 tấn qua cầu Chương Dương.\r\n\r\nHiện để di chuyển qua sông Hồng, phương tiện có thể đi cầu Chương Dương (cấm xe tải trọng lớn), Thăng Long, Nhật Tân, Vĩnh Tuy, Thanh Trì.\r\n\r\nMột ngày trước, cầu Phong Châu bắc qua sông Hồng trên quốc lộ 32C nối hai huyện Lâm Thao và Tam Nông của Phú Thọ bị sập, trôi hai nhịp thép. Hiện 3 người được cứu, còn nhiều người mất tích.\r\n','https://i1-vnexpress.vnecdn.net/2024/09/10/457449559-976615537483254-8875-8838-7237-1725957535.jpg?w=1020&h=0&q=100&dpr=1&fit=crop&s=VrJwfOz_J3xXhD1YHDqUeQ','HA NOI',1,'2024-10-13 13:23:01','2024-10-13 16:41:45'),(16,'Bị tàu đâm vì say rượu ngã vào đường ray, thắng kiện 90 triệu USD','Lamont Powell giành được khoản bồi thường khổng lồ do toà xác định người lái tàu không kịp thời dừng phương tiện khiến ông ta bị cán, làm đứt một chân, khớp hông và phần lớn cánh tay.\r\n\r\nPowell, 56 tuổi, ở Brooklyn, bị mất khả năng lao động sau vụ việc xảy ra năm 2018, đệ đơn kiện gần một năm sau đó và đến cuối tháng 9 vừa qua mới nhận được phán quyết. Đây là một trong những phán quyết có giá trị lớn nhất chống lại Cơ quan Giao thông vận tải đô thị New York (MTA).\r\n\r\nLuật sư của Powell cho biết dù tự rơi xuống đường ray vì say khướt, Powell xứng đáng nhận được khoản tiền bồi thường khổng lồ vì người lái tàu có nhiều thời gian để tránh va chạm. \"Đây là vấn đề an toàn công cộng. Tai nạn này sẽ không bao giờ xảy ra nếu người điều khiển tàu kịp thời phanh khẩn cấp theo quy định của MTA khi thấy mọi người cảnh báo có người trên đường ray\", luật sư nói.\r\n\r\nPowell ngã xuống đường ray tại ga tàu điện ngầm Broadway Junction vào ngày 30/6/2018 ở Đông New York sau một đêm uống rượu. Theo luật sư, vì Powell ngã ở cuối đường ray cách xa nơi tàu đi vào, người điều khiển có khoảng cách đủ để dừng tàu trước khi tông. Người lái tàu cũng được nhiều hành khách đứng chờ tại nhà ga liên tục vẫy tay cảnh báo khi tàu từ từ vào ga.\r\n\r\nMột cựu kỹ sư MTA làm chứng trước tòa rằng một đoàn tàu chạy với tốc độ khoảng 25 km/h cần khoảng 33 m để dừng lại, còn trong trường hợp này, người điều khiển có khoảng 110 m để dừng tàu trước khi tông vào Powell.\r\n\r\nLuật sư cho biết người điều khiển tàu thừa nhận trước tòa rằng đã nhìn thấy mọi người vẫy tay cảnh báo, nhưng nghĩ nạn nhân \"là một túi rác\", tuy nhiên ngay cả với một túi rác lớn, lẽ ra anh ta vẫn phải kéo phanh.','https://i1-vnexpress.vnecdn.net/2024/10/13/1-6750-1728755323.png?w=1020&h=0&q=100&dpr=1&fit=crop&s=VgnSVKq3rroh7kn1shsoxg','MỸ',1,'2024-10-13 15:15:33','2024-10-13 15:15:33'),(17,'Ngành đường sắt lãi đậm','Ban lãnh đạo SRT cho biết trong quý I, công ty đổi mới về phương thức kinh doanh gồm xây dựng kế hoạch chạy tàu phù hợp, phương án bán vé, giá vé hợp lý. Thêm vào đó, nhu cầu đi lại của hành khách cũng tăng cao, đặc biệt trong và sau dịp Tết nguyên đán.\r\n\r\nTương tự, HRT ghi nhận doanh thu vận tải hành khách và hành lý tăng gần 59 tỷ đồng, đóng góp gần hai phần ba mức tăng trưởng của tổng doanh thu. Ngoài ra, công ty còn có nhiều biện pháp giúp kiểm soát chi phí, nhất là chi phí tài chính.\r\n\r\nChỉ sau ba tháng đầu năm, Đường sắt Hà Nội và Đường sắt Sài Gòn đã hoàn thành vượt kế hoạch lợi nhuận cả năm lần lượt khoảng 2,8 lần và 3 lần. Năm nay, hai doanh nghiệp lo ngại nền kinh tế và thu nhập người dân chưa phục hồi ảnh hưởng đến nhu cầu đi lại, lạm phát tăng, đẩy giá nhiên liệu lên cao. Do đó, họ đề ra kế hoạch kinh doanh rất thận trọng. Riêng SRT còn cho rằng ngành đường sắt dễ bị cạnh tranh bởi các phương tiện khác, đặc biệt là hàng không, trong khi năng lực nội tại của ngành chưa có chuyển biến khả quan.','https://i1-kinhdoanh.vnecdn.net/2024/05/02/tauxeHNSG-11-JPG-1137-1714617275.jpg?w=1020&h=0&q=100&dpr=1&fit=crop&s=XajgJ--U--bE7UmjtMbvPA','DA NANG',1,'2024-10-13 15:17:19','2024-10-13 15:17:19'),(18,'Tàu khách nhiều chặng \'cháy\' vé dịp lễ 30/4','Nhiều tàu khách được tổ chức chạy thêm dịp lễ nhưng nhu cầu đi lại tăng cao khiến một số chặng từ TP HCM, Hà Nội đến các địa điểm du lịch, miền Trung \"cháy vé\".\r\n\r\nNgày 27/4 - cao điểm nhất trước dịp lễ 30/4 ga Sài Gòn nhộn nhịp khách đến. Trong ngày, 13 đoàn tàu rời nhà ga hướng về miền Trung, Bắc, đều kín chỗ.\r\n\r\nĐón chuyến tàu SE22 khởi hành từ nhà ga lúc 11h ngày 27/4 về Đà Nẵng, chị Nguyễn Phương, 33 tuổi, nói đây là lần đầu chị đi nghỉ lễ bằng tàu hoả vì thông thường mua vé máy bay để rút ngắn hành trình. Tuy nhiên, năm nay giá vé máy bay cao, cả gia đình đi rất tốn kém nên cách đây khoảng một tháng chị đã lên mạng đặt mua ba vé tàu, mỗi vé hơn một triệu đồng.\r\n\r\n\"Mức giá này cơ bản vừa túi tiền, kỳ nghỉ này dài ngày nên đi tàu dù tốn nhiều thời gian hơn so với máy bay nhưng vẫn tranh thủ vui chơi được ở nhà\", chị Phương nói, thêm rằng SE22 cũng là đoàn tàu chất lượng cao mới đưa vào khai thác, có nhiều tiện ích nên gia đình khá hào hứng trên hành trình về quê nghỉ lễ.','https://i1-vnexpress.vnecdn.net/2024/04/27/001-JPG-1662-1714225035.jpg?w=1020&h=0&q=100&dpr=1&fit=crop&s=8XPgNqedpxrAZ98_DY_6wQ','TP HCM',1,'2024-10-13 15:18:13','2024-10-13 15:18:13'),(19,'Ga Sài Gòn bán thêm 7.000 vé tàu Tết về miền Trung','Đường sắt tăng thêm khoảng 7.000 vé Tết trên các tàu từ ga Sài Gòn, Dĩ An, Biên Hoà về khu vực miền Trung để đáp ứng nhu cầu đi lại tăng cao.\r\n\r\nTrong đó, khoảng 3.000 vé được bán trên các chặng về ga Tuy Hòa (Phú Yên), Diêu Trì (Bình Định), Quảng Ngãi, Đà Nẵng... từ ngày 9 đến 20/1/2023 (18 đến 29/12 âm lịch). Chặng TP HCM đi Quảng Ngãi đông người đi dịp Tết được bố trí thêm tàu ngày 14, 16 và 18/1/2023 (23, 25, 27/12 âm lịch), đáp ứng khoảng 3.900 chỗ. Trước đó, chỉ sau một tuần mở bán, các chặng trên kín chỗ.','https://i1-vnexpress.vnecdn.net/2022/11/08/khach-di-tau-jpeg-3643-1625722-4010-2786-1667903831.jpg?w=1020&h=0&q=100&dpr=1&fit=crop&s=jpB79brfL_LiRvG3izqRFw','TP HCM',1,'2024-10-13 15:19:03','2024-10-13 15:19:03'),(20,'Phương tiện nào an toàn nhất trong đại dịch?','Một chuyến tàu dường như an toàn hơn máy bay. Các nhà ga có nhiều không gian ngoài trời hơn, có ít điểm tập trung tắc nghẽn vì khách xếp hàng check-in hơn, và không phải làm thủ tục an ninh. Dù vậy, CDC vẫn lưu ý hành khách giữ khoảng cách tối thiểu 2 m với người khác khi đứng hoặc ngồi trên tàu hay xe buýt.\r\n\r\nMột đội nghiên cứu từ Trung Quốc và Anh đã công bố bản phân tích nguy cơ lây nhiễm Covid-19 giữa các hành khách trên tàu. Shengjie Lai, nghiên cứu trưởng của Đại học Southampton, cho rằng: \"Nghiên cứu của chúng tôi cho thấy, dù nguy cơ lây nhiễm Covid-19 gia tăng trên tàu, vị trí ghế ngồi của một người và thời gian di chuyển có thể tạo ra những khác biệt\".\r\n\r\nTàu hỏa vốn có ưu thế hơn phần lớn chuyến bay thương mại, vì không có hàng ghế giữa. Jim Matthews, chủ tịch và CEO của Hiệp hội Hành khách Tàu hỏa, lưu ý rằng một toa tàu thay không khí khoảng 12 đến 15 lần một giờ, và cung cấp khoảng 6,8 kg không khí mới một phút, những quy định về giãn cách xã hội và đeo khẩu trang cũng quan trọng. Do đó, Matthews có lý do để tự tin rằng những biện pháp phòng chống dịch bệnh trên tàu hiệu quả.','https://i1-dulich.vnecdn.net/2020/08/28/tau-hoa-covid-19-5585-1598612842.jpg?w=1020&h=0&q=100&dpr=1&fit=crop&s=gEGWWHtHCmRZPWc7AyeLZw','TP HCM',1,'2024-10-13 15:20:34','2024-10-13 15:21:05'),(23,'Tàu sợi carbon đầu tiên trên thế giới tốc độ 140 km/h','Trung Quốc đạt được cột mốc công nghệ đáng chú ý với tàu chở khách đầu tiên trên thế giới làm hoàn toàn bằng sợi carbon. Mang tên Cetrovo 1.0 hay Carbon Star Rapid Transit, đoàn tàu vừa trình làng tại thành phố Thanh Đảo, tỉnh Sơn Đông, Interesting Engineering hôm 27/6 đưa tin.\r\n\r\nTheo công ty đầu máy tàu hỏa Qingdao Sifang, công ty con của Tập đoàn Xây dựng Đường sắt Trung Quốc (CRCC), Cetrovo 1.0 đã hoàn thành thử nghiệm tại nhà máy và dự kiến bắt đầu hoạt động tại Thanh Đảo cuối năm nay. Phương tiện mới có những lợi thế lớn so với tàu bằng thép truyền thống, hứa hẹn mang đến hành trình êm ái hơn, xanh hơn và hiệu quả hơn cho hành khách.\r\n\r\nBộ khung của Cetrovo 1.0 làm từ vật liệu composite sợi carbon. Vật liệu này gồm những sợi nguyên tử carbon cực nhỏ đan cài với nhau, tạo nên một cấu trúc chắc chắn nhưng cũng rất nhẹ. Qingdao Sifang cho biết, thân và khung tàu lần lượt nhẹ hơn 25% và 50% so với tàu truyền thống. Nhờ đó, tổng trọng lượng của tàu giảm tới 11%.\r\n\r\nĐiều này mang lại nhiều lợi ích, bao gồm giảm mức tiêu thụ năng lượng và giảm làm mòn đường ray. Qingdao Sifang ước tính, mức sử dụng năng lượng của đoàn tàu mới giảm 7%, nhờ đó giảm khoảng 130 tấn khí CO2 thải ra mỗi năm. Mức giảm này tương đương với việc trồng hơn 40 ha cây xanh.\r\n\r\nCetrovo 1.0 không chỉ nhẹ hơn mà còn có thiết kế giúp tăng hiệu suất và sự thoải mái cho hành khách. Tàu có tốc độ tối đa 140 km/h, vượt tốc độ trung bình hiện tại là 80 km/h của tàu chở khách Trung Quốc. Nhờ đó, quá trình vận chuyển sẽ nhanh hơn, giúp giảm tắc nghẽn trong hệ thống giao thông đô thị.\r\n\r\nThêm vào đó, Cetrovo 1.0 hoàn toàn tự động, không cần người lái. Điều này không chỉ tăng hiệu quả hoạt động mà còn mở đường cho sự phát triển của mạng lưới tàu tự hành. Cetrovo 1.0 có thể hoạt động trong những điều kiện khó khăn như nhiệt độ cao và đường dốc, thích ứng được với các khu vực địa lý đa dạng.\r\n\r\nSự thoải mái của hành khách cũng được chú trọng trong phương tiện mới. Trọng lượng nhẹ giúp giảm tiếng ồn và sự rung lắc khi tàu chạy, mang lại hành trình êm ái và yên tĩnh hơn. Ngoài ra, tàu còn có các tính năng an toàn thông minh như hệ thống cảnh báo sớm chống va chạm, hệ thống phát hiện chướng ngại vật có thể tự động dừng tàu trong trường hợp khẩn cấp.','https://i1-vnexpress.vnecdn.net/2024/06/28/tau-carbon-1956-1719546844.jpg?w=1020&h=0&q=100&dpr=1&fit=crop&s=hv3Qj3BhuZj14E7xR36ifQ','TRUNG QUỐC',1,'2024-10-13 18:43:26','2024-10-13 20:33:13'),(24,'Du lịch nội \'không thể chỉ sống nhờ đường bộ, đường sắt\'','Khi giá vé máy bay tăng, du lịch đường bộ, đường sắt lên ngôi, nhưng về lâu dài du lịch nội \"không thể chỉ sống nhờ\" vào hai hình thức này, theo giới chuyên gia.\r\n\r\nÔng Nguyễn Công Hoan, Tổng giám đốc Flamingo Redtours, nhận thấy việc du lịch đường bộ, đường sắt được ưa chuộng khi giá vé máy bay tăng cao \"là điều tốt cho ngành du lịch\". Đường bộ ngày càng thuận lợi nhờ các tuyến cao tốc trong khi đường sắt dần trở thành trải nghiệm, được nhiều người cả trẻ lẫn lớn tuổi yêu thích.\r\n\r\nÔng Hoan nói khách thích đi tàu đêm, nghỉ đêm trên tàu và sáng hôm sau tới nơi. Đây là cách họ tiết kiệm thời gian so với đi máy bay. Loại hình này cũng phù hợp cho các nhóm bạn, gia đình bởi họ có thể dành thời gian vui chơi cùng nhau trên tàu, thay vì \"một chuyến bay nhạt nhẽo\".\r\n\r\nTuy nhiên, đường sắt hay đường bộ đều có nhược điểm khiến công ty lữ hành phải cân nhắc khi làm sản phẩm. Đại diện Flamingo Redtours nói ngành đường sắt chưa \"linh hoạt\" phục vụ và với nhu cầu hiện tại, đường sắt sẽ sớm quá tải. Với những chặng xa như Hà Nội - Đà Nẵng hay Quảng Bình, du khách có thể đi tối, ngủ đêm trên tàu. Nhưng chặng đi vào ban ngày sẽ khó thu hút do khách thường mệt khi đến nơi vào buổi tối.','https://i1-dulich.vnecdn.net/2024/05/17/tauxeHNSG-16-JPG-4810-1715913598.jpg?w=1020&h=0&q=100&dpr=1&fit=crop&s=vqwN_768nOHfbNuFJGHy5A','THẾ GIỚI',1,'2024-10-13 20:33:58','2024-10-13 20:33:58'),(25,'Mở tuyến tàu hỏa du lịch Huế - Đà Nẵng','Ông Hoàng Hải Minh cho rằng cần xây dựng dịch vụ của tuyến đường Huế - Đà Nẵng khác biệt theo hướng đi tàu có trải nghiệm, có dịch vụ du lịch trên cung đường cũng như giữa hai điểm đến Huế và Đà Nẵng, đồng thời góp phần đảm bảo giao thông của người dân giữa hai thành phố.\r\n\r\nTổng công ty Đường sắt Việt Nam đánh giá dịch vụ \"rất phù hợp\" cho đối tượng trải nghiệm cùng gia đình, giúp khách du lịch ngắm phong cảnh núi non, bờ biển... Tuyến tàu này có hai ga Huế và Đà Nẵng đều nằm trong trung tâm thành phố, sẵn lượng lớn khách trong và ngoài nước có nhu cầu di chuyển hai chiều, thuận tiện cho hành khách đi lại.\r\n\r\nTrong năm 2023, Tổng công ty Đường sắt Việt Nam đã đầu tư để cải tạo nội thất, mua mới các trang thiết bị phục vụ hành khách tại ga Huế và ga Đà Nẵng. Nội thất trên tàu cũng được cải tạo, lắp máy điều hòa, không gian thoáng mát. Hệ thống bảng biểu khung nhôm thay bằng các màn hình tivi đời mới, ghế băng đợi tàu đã cũ đã thay bằng các loại ghế mới bằng nhiều chất liệu, hình dạng, kích cỡ theo không gian phòng đợi. Toa khách được lắp đặt hệ thống điện sạc pin điện thoại, bình nước uống miễn phí hoặc tủ bán nước giải khát tự động.\r\n\r\nTổng công ty Đường sắt Việt Nam mong muốn tỉnh Thừa Thiên Huế và thành phố Đà Nẵng ủng hộ để sớm triển khai đoàn tàu du lịch Huế - Đà Nẵng','https://i1-dulich.vnecdn.net/2024/03/01/7d9eb18334199947c008-1842-1709299941.jpg?w=1020&h=0&q=100&dpr=1&fit=crop&s=EZNkJBMkg6FTqjAxQdFNfQ','HUẾ',1,'2024-10-13 20:35:19','2024-10-13 20:35:19'),(26,'Tuyến đường sắt chạy hoàn toàn bằng hydro đầu tiên trên thế giới','Đức trở thành quốc gia đầu tiên trên thế giới khai trương một tuyến đường sắt chạy hoàn toàn bằng hydro hôm 24/8, đánh dấu một bước tiến quan trọng trong lĩnh vực vận tải đường sắt xanh. Cụ thể, 14 đoàn tàu do công ty Alstom của Pháp sản xuất sẽ thay thế các đầu máy diesel trên tuyến đường sắt dài 97 km nối các thành phố Cuxhaven, Bremerhaven, Bremervoerde và Buxtehude gần Hamburg. Tuyến đường sắt đặt mục tiêu giảm khoảng 8 tấn khí thải CO2 mỗi năm.\r\n\r\n1 kg nhiên liệu hydro có thể hoạt động tương tự như khoảng 4,5 kg dầu diesel. Các đoàn tàu hydro không tạo ra khí thải và có tiếng ồn nhỏ, chỉ có hơi nước và nước ngưng tụ thoát ra từ ống xả. Chúng có phạm vi hoạt động 1.000 km, nghĩa là có thể chạy cả ngày chỉ với một bể hydro. Một trạm tiếp nhiên liệu hydro cũng đã được xây ven tuyến đường. Các tàu có thể chạy với tốc độ tối đa 140 km/h, nhưng tốc độ thông thường sẽ thấp hơn, khoảng 80 - 120 km/h.\r\n\r\n\"Di chuyển không phát thải là một trong những mục tiêu quan trọng nhất để đảm bảo tương lai bền vững và Alstom đặt mục tiêu trở thành công ty hàng đầu thế giới về các hệ thống đẩy thay thế dành cho đường sắt. Chúng tôi rất hãnh diện khi đưa công nghệ này vào vận hành hàng loạt trong buổi ra mắt cùng với các đối tác tuyệt vời của mình\", Henri Poupart-Lafarge, CEO kiêm chủ tịch hội đồng quản trị của Alstom, cho biết.\r\n\r\nCác cuộc thử nghiệm thương mại với Coradia iLint, loại tàu do Alstom sản xuất, được thực hiện từ năm 2018. Công ty này đã ký hợp đồng sản xuất tàu ở Đức, Pháp và Italy. Ngoài ra, Alstom cũng bắt đầu nhắm đến thị trường Anh.','https://i1-vnexpress.vnecdn.net/2022/08/25/Tau-hydro-3092-1661398947.jpg?w=1020&h=0&q=100&dpr=1&fit=crop&s=Y3VFCtts2cXV4OmzBoG4-g','ĐỨC',1,'2024-10-13 20:36:25','2024-10-13 20:36:25'),(27,'Triều Tiên xác nhận thử tên lửa đạn đạo phóng từ tàu hỏa','Triều Tiên thông báo phóng hai tên lửa từ bệ phóng trên đường sắt và đánh trúng mục tiêu ở bờ biển phía đông trong diễn tập ngày 14/1.\r\n\r\nHãng thông tấn Triều Tiên (KCNA) ngày 15/1 đưa tin quân đội Triều Tiên tổ chức một cuộc diễn tập phóng tên lửa trước đó một ngày để \"kiểm tra và đánh giá mức độ thành thạo trong các quy trình tác chiến của trung đoàn tên lửa đường sắt\".\r\n\r\nLãnh đạo Triều Tiên Kim Jong-un không thị sát cuộc diễn tập lẫn vụ thử tên lửa đạn đạo phóng từ tàu hỏa. KCNA đưa tin cuộc diễn tập được tổ chức ngay sau khi nhận lệnh từ Bộ Tổng tham mưu quân đội Triều Tiên.\r\n\r\nTrung đoàn tên lửa đường sắt phóng \"hai tên lửa dẫn đường chiến thuật\" đánh chính xác vào mục tiêu ở bờ biển phía đông. \"Trung đoàn đã chứng tỏ khả năng cơ động và tỷ lệ trúng đích cao\", KCNA đưa tin. \"Họ thảo luận về cách thiết lập hệ thống vận hành tên lửa đường sắt phù hợp trên toàn quốc\".\r\n\r\nTriều Tiên lần đầu phóng thử tên lửa đạn đạo từ bệ phóng đường sắt hồi tháng 9/2021. Mẫu tên lửa này được đặt trong khoang toa hàng thông thường, được thiết kế nhằm phản công bất cứ lực lượng nào tấn công Triều Tiên.\r\n\r\nĐây là lần thứ ba Triều Tiên thử tên lửa trong năm 2022 và diễn ra chỉ ba ngày sau vụ thử gần nhất. Trước đó, Triều Tiên ngày 5/1 và 11/1 phóng tên lửa đạn đạo mang phương tiện lướt siêu vượt âm, vũ khí có thể đạt tốc độ cao và khả năng cơ động lớn sau khi phóng, được cho có thể xuyên thủng mọi hệ thống phòng không hiện có.\r\n\r\nVụ thử tên lửa phóng từ tàu hỏa ngày 14/1 diễn ra chỉ vài giờ sau khi Triều Tiên chỉ trích Mỹ theo đuổi các lệnh trừng phạt mới từ Liên Hợp Quốc nhằm vào họ sau loạt vụ thử tên lửa. Triều Tiên gọi đây là hành vi khiêu khích và cảnh báo đáp trả mạnh mẽ.','https://i1-vnexpress.vnecdn.net/2022/01/15/55631871781372565a-Trieu-Tien-3174-1642204789.jpg?w=1020&h=0&q=100&dpr=1&fit=crop&s=84Igo-lyS8ARquh1DImHlQ','TRIỀU TIÊN',1,'2024-10-13 22:31:06','2024-10-13 22:31:06'),(28,'Khách tố bị bỏ đói trên khoang hạng nhất tàu hỏa','Đầu bếp và nhân viên lỡ tàu đã khiến cặp đôi người Anh không được phục vụ bữa ăn theo tiêu chuẩn khoang hạng nhất.\r\n\r\nKriss Dominic cùng bạn gái đã tự thưởng một kỳ nghỉ cuối tuần từ Birmingham (Anh) đến Edinburgh (Scotland) bằng tàu hỏa. Để chuyến đi trọn vẹn nhất, anh quyết định nâng vé lên hạng nhất với mong muốn được trải nghiệm dịch vụ tốt và đồ ăn ngon cho chuyến đi kéo dài 3 tiếng. Tuy nhiên, cặp đôi này đã tố với Mirror rằng họ gần như bị bỏ đói trong chuyến hành trình.\r\n\r\n\"Trên thực tế, sau khi nâng hạng vé, tôi đã có một chỗ ngồi lớn hơn, một tách trà và một vòng bánh mì nướng. Đó không phải là những gì bạn mong đợi và không phải là cách bạn muốn hành trình bắt đầu\", Kriss mỉa mai nói.\r\n\r\nSau khi tàu khởi hành, cặp đôi được người quản lý dịch vụ mời đồ uống, đồng thời người này cũng thông báo rằng một số nhân viên, bao gồm cả đầu bếp, đã lỡ chuyến. \"Anh ta nói với chúng tôi rằng chỉ có anh và một đồng nghiệp khác ở trên tàu\", Kriss thất vọng nói.\r\n\r\nSau đó, người quản lý nói rằng tàu chỉ có thể phục vụ cặp đôi đồ ăn nguội và sẽ không có bữa ăn nóng bổ sung nào. Họ không thể nấu bất cứ thứ gì và chỉ có bánh mì nướng, sữa và một ít ngũ cốc. \"Thật thất vọng khi chúng tôi đã nghĩ mình bỏ tiền ra để có một hành trình xứng đáng trong khoang hạng nhất và nhận được nhiều thứ\", Kriss chia sẻ.','https://i1-dulich.vnecdn.net/2021/09/29/1-DQP-BEM-091219TRAIN-12JPG-9164-1632884620.jpg?w=1020&h=0&q=100&dpr=1&fit=crop&s=1-1iOXkbvpFzrgyp0tF7fA','ANH',1,'2024-10-13 22:32:17','2024-10-13 22:32:17'),(29,'Xe chở học sinh va chạm tàu hỏa','7 học sinh bị thương sau khi ôtô 45 chỗ va chạm với tàu hàng ở nút giao đường sắt qua quận Nam Từ Liêm, lúc 16h ngày 29/9.\r\n\r\nÔtô chở hơn 40 học sinh lớp 4 trường Tiểu học Lý Nam Đế, phường Tây Mỗ, quận Nam Từ Liêm, đang trên đường trở về trường sau buổi học ngoại khóa. Khi đến điểm giao với đường sắt gần cổng làng Miêu Nha, cách trường khoảng 800 m, ôtô va chạm với tàu hàng chạy từ Yên Viên đi Giáp Bát.\r\n\r\n\"Sau tiếng động mạnh cùng tiếng la hét thất thanh, tôi cùng khoảng 10 người chạy ra, lúc này cửa ôtô không mở được. Mọi người lấy gậy sắt cậy cửa, lần lượt đưa các cháu ra ngoài\", nhân chứng tên Minh, 35 tuổi, kể lại.\r\n\r\n7 học sinh được đưa đến Bệnh viện 103 cách đó khoảng 9 km cấp cứu, những em còn lại được đưa về trường. Theo Tổng công ty Đường sắt Việt Nam, 2 cháu bị chấn thương phần mềm, 5 cháu bị choáng, sau khi kiểm tra đều được cho ra viện.','https://i1-vnexpress.vnecdn.net/2020/09/29/tai-nan1-7121-1601380868.jpg?w=1020&h=0&q=100&dpr=1&fit=crop&s=Zj0racXMwa076w7HLcRmbQ','HA NOI',2,'2024-10-13 22:59:03','2024-10-14 04:49:38');
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passenger`
--

LOCK TABLES `passenger` WRITE;
/*!40000 ALTER TABLE `passenger` DISABLE KEYS */;
INSERT INTO `passenger` VALUES (1,'Himmel','traintravel238@gmail.com',2005,'British','0123456789'),(2,'John Smith','johnsmith@gmail.com',34,'America','555-5678-4321'),(3,'Rin Tohsaka','emiya@gmail.com',22,' Japan','555-9876-4321'),(4,'Dang Khac Phu','Phudk@gmail.com',26,'Viet Nam','555-6543-4321'),(5,'Đỗ Thành An','Dude99@gmail.com',11,'hola','0967851513'),(6,'Anna John','AnnGame@gmail.com',2004,'Hoa Lac, Ha Noi','0978750255'),(7,'test','PhuDKHE186439@fpt.edu.vn',1997,'A','0123456789'),(8,'Đặng Khắc Phú','PhuDKHE186439@fpt.edu.vn',2004,'new York','1234567890');
/*!40000 ALTER TABLE `passenger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `PaymentID` int NOT NULL,
  `TicketID` int DEFAULT NULL,
  `PassengerID` int DEFAULT NULL,
  `PaymentMethod` enum('Bank','Digital Wallet') DEFAULT NULL,
  `PaymentDate` date DEFAULT NULL,
  `Amount` double DEFAULT NULL,
  PRIMARY KEY (`PaymentID`),
  KEY `TicketID` (`TicketID`),
  KEY `PassengerID` (`PassengerID`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`TicketID`) REFERENCES `ticket` (`TicketID`),
  CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`PassengerID`) REFERENCES `passenger` (`PassengerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,1,1,'Bank','2024-09-01',150),(2,2,2,'Digital Wallet','2024-09-01',50),(3,3,1,'Digital Wallet','2024-03-01',100),(4,4,1,'Bank','2024-03-01',100);
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
INSERT INTO `role` VALUES (1,'Test'),(2,'TicketManager'),(3,'Passenger');
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
INSERT INTO `seat` VALUES (1,1,'1A',1,'First Class'),(2,2,'2B',1,'Economy'),(3,1,'1B',1,'Economy'),(4,1,'1C',1,'First Class');
/*!40000 ALTER TABLE `seat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sendgmailaccount`
--

DROP TABLE IF EXISTS `sendgmailaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sendgmailaccount` (
  `Gmail` varchar(45) NOT NULL,
  `Password` text,
  PRIMARY KEY (`Gmail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sendgmailaccount`
--

LOCK TABLES `sendgmailaccount` WRITE;
/*!40000 ALTER TABLE `sendgmailaccount` DISABLE KEYS */;
INSERT INTO `sendgmailaccount` VALUES ('traintravel238@gmail.com','xgdwcowsiuhubmfz');
/*!40000 ALTER TABLE `sendgmailaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `TicketID` int NOT NULL,
  `PassengerID` int DEFAULT NULL,
  `TicketClassID` int DEFAULT NULL,
  `PurchaseDate` date DEFAULT NULL,
  `TicketPrice` double DEFAULT NULL,
  `SeatID` int DEFAULT NULL,
  `TimeArrive` date DEFAULT NULL,
  `Status` tinyint DEFAULT '1',
  PRIMARY KEY (`TicketID`),
  KEY `PassengerID` (`PassengerID`),
  KEY `TicketClassID` (`TicketClassID`),
  KEY `SeatID` (`SeatID`),
  CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`PassengerID`) REFERENCES `passenger` (`PassengerID`),
  CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`TicketClassID`) REFERENCES `ticketclass` (`TicketClassID`),
  CONSTRAINT `ticket_ibfk_4` FOREIGN KEY (`SeatID`) REFERENCES `seat` (`SeatID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (1,1,1,'2024-09-01',150,1,'2024-09-17',1),(2,2,2,'2024-09-01',50,2,'2024-09-17',1),(3,1,1,'2024-03-01',100,2,'2024-03-01',1),(4,1,1,'2024-03-01',100,1,'2024-03-01',1);
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
  `NumberOfSeat` int DEFAULT NULL,
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
INSERT INTO `train` VALUES (1,'2024-09-17','Express 101',100,1,2),(2,'2024-09-17','Local 202',120,2,3);
/*!40000 ALTER TABLE `train` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-25 19:41:47

-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: movie_db
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `actors`
--

DROP TABLE IF EXISTS `actors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actors` (
  `aid` int NOT NULL AUTO_INCREMENT,
  `aname` varchar(50) NOT NULL,
  PRIMARY KEY (`aid`),
  UNIQUE KEY `unique_actor_name` (`aname`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actors`
--

LOCK TABLES `actors` WRITE;
/*!40000 ALTER TABLE `actors` DISABLE KEYS */;
INSERT INTO `actors` VALUES (99,'Ben Schwartz'),(93,'Christian Bale'),(96,'Elijah Wood'),(97,'Ian McKellen'),(100,'James Marsden'),(101,'Jim Carry'),(95,'Liam Neeson'),(94,'Michael Caine'),(98,'Orlando Bloom'),(79,'آدریانو تولوزا'),(48,'احمد مهرانفر'),(31,'الناز حبیبی'),(23,'الهه حصاری'),(37,'امید روحانی'),(42,'امیر ارسلان یعقوبی'),(11,'امیر جعفری'),(28,'امیرعلی قلعه‌قوند'),(47,'امین حیایی'),(30,'ایمان صفا'),(32,'بابک کریمی'),(19,'بهرام افشاری'),(45,'پارسیا شکوری‌فر'),(10,'پژمان جمشیدی'),(91,'جواد پولادی'),(17,'حامد وکیلی'),(26,'حسین پاکدل'),(74,'حمید معصومی‌نژاد'),(41,'خشایار راد'),(85,'داوود شیرعلی'),(33,'رضا بای'),(71,'رضا رشیدپور'),(16,'رضا ناجی'),(44,'رهام حیدرعلی'),(4,'روزبه حصاری'),(88,'ریما رامین‌فر'),(76,'ژاله صامتی'),(66,'سارا بهرامی'),(84,'ساعد هدایتی'),(7,'ساقی حاجی پور'),(77,'سام درخشانی'),(82,'سام نوری'),(49,'ستاره پسیانی'),(65,'سعید امیر سلیمانی'),(64,'سعید عظیمی'),(36,'سمانه منیری'),(14,'سها نیاستی'),(15,'سوسن پرور'),(52,'سیاوش چراغی پور'),(83,'سیاوش چراغی‌پور'),(24,'سیاوش طهمورث'),(34,'سید جواد هاشمی'),(61,'سینا غفاری'),(9,'سینا مسعودی'),(55,'شادی خلیلی'),(68,'شبنم قربانی'),(6,'شیرین اسماعیلی'),(21,'صدف اسپهبدی'),(73,'علی اوجی'),(54,'علی مشهدی'),(38,'علیرضا استادی'),(60,'علیرضا حیاتی'),(86,'غلامرضا فرج‌زاده'),(35,'غلامرضا نیکخواه'),(92,'فرج‌الله گل‌سفیدی'),(18,'فرزانه قاسم‌زاده'),(40,'قاسم زارع'),(63,'کاوه مرحمتی'),(53,'کمند امیرسلیمانی'),(78,'گابریلا پتری'),(3,'گلاره عباسی'),(27,'لادن ژاوه‌وند'),(39,'مجید شهریاری'),(1,'محسن تنابنده'),(87,'محسن کیایی'),(56,'محمد نیکبخت'),(80,'محمدجواد جعفرپور'),(5,'محمود جعفری'),(69,'مرتضی تقی‌ زاده'),(90,'مریم وحیدزاده'),(22,'مهدی حسینی‌نیا'),(62,'مهدی ذاکر'),(75,'مهدی هاشمی'),(72,'مهرداد صدیقیان'),(59,'مهرداد فتحی'),(46,'مهری آل‌آقا'),(89,'مه‌لقا باقری'),(43,'میثاق جمشیدی'),(8,'میسا مولوی'),(58,'میلاد آرمند'),(25,'ناهید مسلمی'),(81,'نعیمه نظام‌دوست'),(13,'نگار فروزنده'),(70,'نوشین تبریزی'),(2,'نوید محمدزاده'),(51,'نیلوفر کوخانی'),(29,'هادی کاظمی'),(20,'هوتن شکیبا'),(67,'هومن برق‌نورد'),(57,'یاسر امیری'),(50,'یکتا ناصر'),(12,'یوسف تیموری');
/*!40000 ALTER TABLE `actors` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-02 13:48:51

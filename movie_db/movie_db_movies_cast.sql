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
-- Table structure for table `movies_cast`
--

DROP TABLE IF EXISTS `movies_cast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movies_cast` (
  `mid` int DEFAULT NULL,
  `aid` int DEFAULT NULL,
  `role_in_movie` varchar(50) DEFAULT NULL,
  KEY `aid` (`aid`),
  KEY `movies_cast_ibfk_1` (`mid`),
  CONSTRAINT `movies_cast_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `movies` (`mid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `movies_cast_ibfk_2` FOREIGN KEY (`mid`) REFERENCES `movies` (`mid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies_cast`
--

LOCK TABLES `movies_cast` WRITE;
/*!40000 ALTER TABLE `movies_cast` DISABLE KEYS */;
INSERT INTO `movies_cast` VALUES (2,1,'سیروس وجدان‌دوست'),(2,2,'شاهین صولتی'),(2,3,'شبنم رکابی'),(2,4,'حاجی صاحبی'),(2,5,'قدرت‌الله مددی'),(2,6,'مهری مددی'),(2,7,'مرضیه (مرضی)مددی'),(2,8,'ولی ترکه'),(2,9,'سیاوش وجدان‌دوست'),(1,10,'رضا'),(1,11,'جلال'),(1,12,'پرویز'),(1,13,'نیلوفر همسر رضا'),(1,14,'رز دختر رضا'),(1,15,'مشاور املاک'),(1,16,'مشتری املاک'),(1,17,'مدیر دفتر مستر قلیان'),(1,18,'افعی'),(3,19,'برات امینی'),(3,20,'پرویز لادری'),(3,21,'کوکب'),(3,22,'سیاوش'),(3,23,'پروانه لادری'),(3,24,'یعقوب ایرجی'),(3,25,'خاتون سرمدی'),(3,26,'پزشک'),(3,27,'خانم امینی'),(3,28,'نادر امینی'),(4,19,'اسماعیل عمویی (اسی)'),(4,23,'پری عمویی'),(4,29,'سعید بهمنی'),(4,30,'صفا'),(4,31,'فرنگیس تیموری'),(4,32,'خسروی'),(4,33,NULL),(4,34,'حاج محمد داوودی کیا'),(4,35,'حاج تیمور تیموری'),(4,36,'فتانه'),(4,37,'آقا کرم عمویی'),(4,38,NULL),(4,39,'دکتر'),(4,40,NULL),(4,41,NULL),(4,42,'رضا'),(4,43,'شهرام شب‌پره'),(4,44,'اسماعیل بهمنی'),(4,45,'اسکندر خسروی'),(4,46,'گلاب'),(5,47,NULL),(5,48,'سیروس'),(5,10,'محبوب'),(5,49,'ژیلا'),(5,50,'زن سیروس'),(5,51,NULL),(5,52,'اردشیرخان ساواکی'),(5,38,NULL),(5,53,NULL),(5,54,NULL),(5,55,NULL),(5,56,NULL),(5,57,NULL),(5,58,NULL),(5,59,NULL),(5,60,NULL),(5,61,NULL),(5,62,NULL),(5,63,NULL),(5,64,NULL),(5,65,NULL),(6,19,'جهانگیر غزنوی - پدر جهانگیر'),(6,66,'میشا (همسر جهانگیر)'),(6,67,'دکتر عارف بام (جراح زیبایی)'),(6,68,'ترانه'),(6,69,'نگهبان زندان'),(6,27,'اختر باغی (مادر میشا)'),(6,70,'خواهر مقتول'),(6,71,'خودش (مجری تلویزیون)'),(6,72,'خودش (حضور افتخاری)'),(6,73,'مسئول پشت صحنه'),(6,74,'خبرنگار تلویزیون در ایتالیا'),(6,19,'جهانگیر غزنوی - پدر جهانگیر'),(6,66,'میشا (همسر جهانگیر)'),(6,67,'دکتر عارف بام (جراح زیبایی)'),(6,68,'ترانه'),(6,69,'نگهبان زندان'),(6,27,'اختر باغی (مادر میشا)'),(6,70,'خواهر مقتول'),(6,71,'خودش (مجری تلویزیون)'),(6,72,'خودش (حضور افتخاری)'),(6,73,'مسئول پشت صحنه'),(6,74,'خبرنگار تلویزیون در ایتالیا'),(7,75,'بابک کشکولی'),(7,76,'سوری'),(7,77,'ساسان کریمی'),(7,10,'بهرام کشکولی'),(7,78,'آلیس'),(7,79,'لوئیس'),(7,34,'آرش کلانی'),(7,80,'بهرامی'),(7,81,'فرشته'),(7,82,'رئیس تروریست‌‌ها'),(7,83,'جمشید'),(7,17,'ناصر'),(7,84,'رئیس پلیس'),(7,85,'رئیس پلیس فرودگاه'),(7,86,'دکتر پائولو گومز'),(7,27,'طلعت چپ دست'),(8,10,'رامین قادری'),(8,87,'مسعود مروّجی'),(8,88,'خانم توکلی'),(8,21,'سهیلا توکلی'),(8,89,'ستاره'),(8,35,'پدرزن رامین'),(8,90,'مهتاب'),(8,18,'آرزو دائمی'),(8,91,'کافور'),(8,82,'مشوقی'),(8,92,'ناخدا'),(9,93,'Bruce Wayne'),(9,94,'Alfred'),(9,95,'Ducard'),(12,96,'Frodo'),(12,97,'Gandalf'),(12,98,'Legolas'),(18,99,'Sonic'),(18,100,'Tom'),(18,101,'Dr. Robotnik');
/*!40000 ALTER TABLE `movies_cast` ENABLE KEYS */;
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

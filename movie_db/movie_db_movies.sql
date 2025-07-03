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
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movies` (
  `mid` int NOT NULL AUTO_INCREMENT,
  `mname` varchar(50) NOT NULL,
  `title` text,
  `initial_release` year DEFAULT NULL,
  `rate` float DEFAULT NULL,
  `did` int NOT NULL,
  PRIMARY KEY (`mid`),
  UNIQUE KEY `unique_mname` (`mname`),
  KEY `did` (`did`),
  CONSTRAINT `movies_ibfk_1` FOREIGN KEY (`did`) REFERENCES `directors` (`did`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `movies_chk_1` CHECK (((0 <= `rate`) and (`rate` <= 10)))
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` VALUES (1,'دایناسور','دایناسور فیلم کمدی ایرانی به کارگردانی مسعود اطیابی، تهیه‌کنندگی محمد شایسته و نویسندگی امیر برادران محصول سال ۱۴۰۳ است.',2025,NULL,4),(2,'زودپز','زودپز یک فیلم کمدی به کارگردانی رامبد جوان و تهیه‌کنندگی منصور سهراب‌پور محصول ۱۴۰۲ است که از ۱۷ مهر ۱۴۰۳ در سینماهای ایران اکران شده است. نقش‌های اصلی این فیلم محسن تنابنده و نوید محمدزاده هستند.',2024,4.4,2),(3,'هفتاد سی','هفتاد سی فیلمی کمدی اجتماعی محصول ۱۴۰۲ به کارگردانی بهرام افشاری و تهیه‌کنندگی سید ابراهیم عامریان و نویسندگی حمزه صالحی است. این فیلم اولین فیلم بهرام افشاری در مقام کارگردان است. افشاری به همراه هوتن شکیبا نرده‌اند.[۱][۲][۳][۴] اکران فیلم از ۷ آذر ۱۴۰۳ در سینماهای ایران آغاز شد و توانست با فروش بیش از ۳۶۰ میلیارد تومان، پرفروش‌ترین فیلم سینمای ایران لقب بگیرد.',2024,4.9,3),(4,'فسیل','فسیل فیلم کمدی-درام ایرانی به کارگردانی کریم امینی، نویسندگی حمزه صالحی و تهیه‌کنندگی سید ابراهیم عامریان محصول سال ۱۳۹۹ است. فسیل با بازی بهرام افشاری، هادی کاظمی و ایمان صفا روایت سه دوست است که پیش از انقلاب ۱۳۵۷ در یک گروه موسیقی مشغول به کارند. این فیلم از ۲۴ اسفند ۱۴۰۱ تا ۲۹ اسفند ۱۴۰۲ در سینماهای ایران اکران شد[۱] و با جذب بیش از ۷ میلیون و ۴۸۷ هزار مخاطب، پربیننده‌ترین فیلم سینمای ایران در سال اول اکران است.',2023,5.4,1),(5,'کوکتل مولوتوف','کوکتل مولوتف فیلمی ایرانی در ژانر کمدی محصول ۱۴۰۲ به کارگردانی حسین امیری دوماری و نویسندگی احمد رفیع‌زاده است. داستان این فیلم در دهه ۱۳۵۰ جریان دارد، این فیلم از ۱۵ اسفند ۱۴۰۳ اکران شد.',2025,4.1,5),(6,'سال گربه','سال گربه فیلم ایرانی در ژانر کمدی به کارگردانی و نویسندگی مصطفی تقی‌زاده و تهیه‌کنندگی سعید خانی محصول سال ۱۴۰۲ است که از ۲۲ فروردین ۱۴۰۳ در سینماهای ایران اکران شد.',2024,3.3,6),(7,'تگزاس3','تگزاس ۳ فیلمی ایرانی در ژانر کمدی اکشن به کارگردانی سید مسعود اطیابی، تهیه‌کنندگی سید ابراهیم عامریان و نویسندگی حمزه صالحی محصول سال ۱۴۰۳ است. این فیلم دنبالهٔ تگزاس ۱ و تگزاس ۲ است. این فیلم در ۸ خرداد ۱۴۰۳ در سینماهای ایران اکران شده است.',2024,3.7,4),(8,'هتل','هتل فیلم کمدی اسکروبال ایرانی محصول سال ۱۴۰۲ به کارگردانی مسعود اطیابی و تهیه‌کنندگی محمد شایسته است. هتل با بازی پژمان جمشیدی و محسن کیایی داستان دو زوج را روایت می‌کند که در سفر به کیش دچار چالش‌های کمدی می‌شوند.اکران فیلم از ۵ مهر تا ۲۹ اسفند ۱۴۰۲ در سینماهای ایران انجام شد. هتل توانست با فروش ۲۷۷ میلیارد تومان و جذب بیش از ۶ میلیون و ۲۴۶ هزار مخاطب، پس از فیلم فسیل و هفتاد سی سومین فیلم پرفروش سینمای ایران شود.',2023,4.9,4),(9,'Batman Begins','بتمن آغاز می‌کند (به انگلیسی: Batman Begins) فیلمی ابرقهرمانی محصول سال ۲۰۰۵ به کارگردانی کریستوفر نولان و نویسندگی نولان و دیوید اس. گویر است. این فیلم بر پایهٔ شخصیت بتمن دی‌سی کامیکس است و کریستین بیل در نقش بروس وین / بتمن، به همراه مایکل کین، لیام نیسون، کیتی هلمز، گری اولدمن، کیلین مورفی، تام ویلکینسون، روتخر هاور، کن واتانابه و مورگان فریمن در آن به ایفای نقش پرداختند. این فیلم، که بازراه‌اندازی مجموعه فیلم‌های بتمن به حساب می‌آید، داستان زندگی بروس وین را از مرگ پدر و مادرش تا داستان تبدیل شدنش به بتمن و مبارزه‌اش با رأس‌الغول و مترسک که قصد وارد کردن گاتهام سیتی به هرج و مرج را دارند، روایت می‌کند.',2005,8.2,7),(10,'The Dark Knight',NULL,2008,NULL,7),(11,'The Dark Knight Rises',NULL,2012,NULL,7),(12,'The Lord of the Rings: The Fellowship of the Ring',NULL,2001,NULL,8),(13,'The Lord of the Rings: The Two Towers',NULL,2002,NULL,8),(14,'The Lord of the Rings: The Return of the King',NULL,2003,NULL,8),(15,'The Hobbit: An Unexpected Journey',NULL,2012,NULL,8),(16,'The Hobbit: The Desolation of Smaug',NULL,2013,NULL,8),(17,'The Hobbit: The Battle of the Five Armies',NULL,2014,NULL,8),(18,'Sonic the Hedgehog',NULL,2020,NULL,9),(19,'Sonic the Hedgehog 2',NULL,2022,NULL,9),(20,'Sonic the Hedgehog 3',NULL,2024,NULL,9);
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
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

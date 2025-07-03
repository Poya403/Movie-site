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
-- Table structure for table `movie_images`
--

DROP TABLE IF EXISTS `movie_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie_images` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mid` int NOT NULL,
  `img_url` varchar(255) NOT NULL,
  `caption` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`),
  CONSTRAINT `movie_images_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `movies` (`mid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_images`
--

LOCK TABLES `movie_images` WRITE;
/*!40000 ALTER TABLE `movie_images` DISABLE KEYS */;
INSERT INTO `movie_images` VALUES (1,1,'https://honardl.com/wp-content/uploads/2025/03/%D8%AF%D8%A7%DB%8C%D9%86%D8%A7%D8%B3%D9%88%D8%B1.jpg',NULL),(2,2,'https://upload.wikimedia.org/wikipedia/fa/7/7b/Zodpaz_poster.jpg',NULL),(3,3,'https://upload.wikimedia.org/wikipedia/fa/0/0b/HaftadSee.jpg',NULL),(4,4,'https://upload.wikimedia.org/wikipedia/fa/thumb/a/a7/Fossil_Poster.jpg/500px-Fossil_Poster.jpg',NULL),(5,5,'https://media.chtn.ir/d/2025/03/05/3/771880.jpg?ts=1741179147000',NULL),(6,6,'https://armandaily.ir/wp-content/uploads/2025/04/%D8%B3%D8%A7%D9%84-%DA%AF%D8%B1%D8%A8%D9%87.jpg',NULL),(7,7,'https://upload.wikimedia.org/wikipedia/fa/thumb/f/fb/Texas_3_poster.jpg/500px-Texas_3_poster.jpg',NULL),(8,8,'https://upload.wikimedia.org/wikipedia/fa/thumb/8/8a/Hotel_2023_film_poster.jpg/375px-Hotel_2023_film_poster.jpg',NULL),(9,9,'https://upload.wikimedia.org/wikipedia/en/a/af/Batman_Begins_Poster.jpg',NULL),(10,10,'https://upload.wikimedia.org/wikipedia/en/1/1c/The_Dark_Knight_%282008_film%29.jpg',NULL),(11,11,'https://upload.wikimedia.org/wikipedia/en/8/83/Dark_knight_rises_poster.jpg',NULL),(12,12,'https://upload.wikimedia.org/wikipedia/en/f/fb/Lord_Rings_Fellowship_Ring.jpg',NULL),(13,13,'https://upload.wikimedia.org/wikipedia/en/a/a1/Lord_Rings_Two_Towers.jpg',NULL),(14,14,'https://upload.wikimedia.org/wikipedia/en/4/48/Lord_Rings_Return_King.jpg',NULL),(15,15,'https://upload.wikimedia.org/wikipedia/en/b/b3/The_Hobbit-_An_Unexpected_Journey.jpeg',NULL),(16,16,'https://upload.wikimedia.org/wikipedia/en/4/4f/The_Hobbit_-_The_Desolation_of_Smaug_theatrical_poster.jpg',NULL),(17,17,'https://upload.wikimedia.org/wikipedia/en/e/e7/The_Hobbit_-_The_Battle_of_the_Five_Armies.png',NULL),(18,18,'https://upload.wikimedia.org/wikipedia/en/4/45/Sonic_the_Hedgehog_film_poster.jpg',NULL),(19,19,'https://upload.wikimedia.org/wikipedia/en/0/0c/Sonic_2_US_Cover.jpg',NULL),(20,20,'https://upload.wikimedia.org/wikipedia/en/0/07/Sonic3-box-us-225.jpg',NULL);
/*!40000 ALTER TABLE `movie_images` ENABLE KEYS */;
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

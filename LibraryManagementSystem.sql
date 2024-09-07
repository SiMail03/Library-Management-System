-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: library_management_system
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `author`
--
/*Project done by: Ismail Dedic, Faris Hasanbasic, Amer Jusic, Faruk Kadic*/;

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author` (
  `author_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `nationality` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES (1,'Ivo','Andric','Bosnian'),(2,'Mesa','Selimovic','Bosnian'),(3,'Mak','Dizdar','Bosnian'),(4,'Dzevad','Karahasan','Bosnian'),(5,'George','Orwell','British'),(6,'Harper','Lee','American'),(7,'J.K.','Rowling','British'),(8,'F. Scott','Fitzgerald','American'),(9,'Gabriel','Garcia Marquez','Colombian'),(10,'Leo','Tolstoy','Russian');
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `book_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `genre` varchar(50) DEFAULT NULL,
  `published_year` int DEFAULT NULL,
  `author_id` int DEFAULT NULL,
  `publisher_id` int DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `available_copies` int DEFAULT NULL,
  PRIMARY KEY (`book_id`),
  KEY `author_id` (`author_id`),
  KEY `publisher_id` (`publisher_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `book_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `author` (`author_id`),
  CONSTRAINT `book_ibfk_2` FOREIGN KEY (`publisher_id`) REFERENCES `publisher` (`publisher_id`),
  CONSTRAINT `book_ibfk_3` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (1,'Na Drini cuprija','Fiction',1945,1,1,2,5),(2,'Dervis i smrt','Philosophy',1966,2,2,4,3),(3,'Kameni spavac','Poetry',1966,3,3,3,4),(4,'Sara i Serafina','Fiction',1999,4,2,1,2),(5,'1984','Science Fiction',1949,5,4,5,8),(6,'To Kill a Mockingbird','Classic',1960,6,5,2,4),(7,'Harry Potter and the Philosopher\'s Stone','Fantasy',1997,7,6,6,10),(8,'The Great Gatsby','Classic',1925,8,7,2,7),(9,'One Hundred Years of Solitude','Fiction',1967,9,8,1,6),(10,'War and Peace','Historical Fiction',1869,10,8,7,5);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrowing`
--

DROP TABLE IF EXISTS `borrowing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `borrowing` (
  `borrowing_id` int NOT NULL AUTO_INCREMENT,
  `book_id` int DEFAULT NULL,
  `member_id` int DEFAULT NULL,
  `staff_id` int DEFAULT NULL,
  `borrow_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  PRIMARY KEY (`borrowing_id`),
  KEY `book_id` (`book_id`),
  KEY `member_id` (`member_id`),
  KEY `staff_id` (`staff_id`),
  CONSTRAINT `borrowing_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`),
  CONSTRAINT `borrowing_ibfk_2` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`),
  CONSTRAINT `borrowing_ibfk_3` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrowing`
--

LOCK TABLES `borrowing` WRITE;
/*!40000 ALTER TABLE `borrowing` DISABLE KEYS */;
INSERT INTO `borrowing` VALUES (1,1,1,1,'2023-05-10','2023-06-10','2023-06-05'),(2,2,2,2,'2023-04-15','2023-05-15','2023-05-10'),(3,3,3,3,'2023-03-20','2023-04-20','2023-04-18'),(4,4,4,4,'2023-06-01','2023-07-01',NULL),(5,5,5,5,'2023-01-10','2023-02-10','2023-02-05'),(6,6,6,6,'2023-02-15','2023-03-15','2023-03-10'),(7,7,7,7,'2023-03-20','2023-04-20','2023-04-15'),(8,8,8,8,'2023-04-25','2023-05-25','2023-05-20'),(9,9,1,1,'2023-05-30','2023-06-30',NULL),(10,10,2,2,'2023-06-05','2023-07-05',NULL);
/*!40000 ALTER TABLE `borrowing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Fiction'),(2,'Classic'),(3,'Poetry'),(4,'Philosophy'),(5,'Science Fiction'),(6,'Fantasy'),(7,'Historical Fiction');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fine`
--

DROP TABLE IF EXISTS `fine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fine` (
  `fine_id` int NOT NULL AUTO_INCREMENT,
  `borrowing_id` int DEFAULT NULL,
  `amount` decimal(5,2) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  PRIMARY KEY (`fine_id`),
  KEY `borrowing_id` (`borrowing_id`),
  CONSTRAINT `fine_ibfk_1` FOREIGN KEY (`borrowing_id`) REFERENCES `borrowing` (`borrowing_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fine`
--

LOCK TABLES `fine` WRITE;
/*!40000 ALTER TABLE `fine` DISABLE KEYS */;
INSERT INTO `fine` VALUES (1,1,5.00,'2023-06-07'),(2,2,10.00,'2023-05-12'),(3,3,7.50,'2023-04-20'),(4,5,3.00,'2023-02-07'),(5,6,4.50,'2023-03-12'),(6,8,6.75,'2023-05-22');
/*!40000 ALTER TABLE `fine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `librarybranch`
--

DROP TABLE IF EXISTS `librarybranch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `librarybranch` (
  `branch_id` int NOT NULL AUTO_INCREMENT,
  `branch_name` varchar(100) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`branch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `librarybranch`
--

LOCK TABLES `librarybranch` WRITE;
/*!40000 ALTER TABLE `librarybranch` DISABLE KEYS */;
INSERT INTO `librarybranch` VALUES (1,'Centar','Titova 12','387-33-987-654'),(2,'Novi Grad','Alipasina 45','387-33-765-432'),(3,'Stari Grad','Zelenih beretki 1','387-33-123-123');
/*!40000 ALTER TABLE `librarybranch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `member_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `membership_date` date DEFAULT NULL,
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,'Adnan','Mehmedovic','1980-07-15','adnan.mehmedovic@example.com','387-61-234-567','2020-01-01'),(2,'Elma','Hadzic','1990-05-20','elma.hadzic@example.com','387-61-345-678','2019-06-15'),(3,'Haris','Omerovic','1975-12-30','haris.omerovic@example.com','387-61-456-789','2018-03-10'),(4,'Lejla','Hodzic','1985-08-25','lejla.hodzic@example.com','387-61-567-890','2021-11-22'),(5,'Emma','Johnson','1982-09-11','emma.johnson@example.com','387-61-678-901','2020-05-14'),(6,'Liam','Smith','1991-03-22','liam.smith@example.com','387-61-789-012','2019-12-07'),(7,'Ava','Brown','1988-11-30','ava.brown@example.com','387-61-890-123','2021-02-18'),(8,'Noah','Davis','1979-07-05','noah.davis@example.com','387-61-901-234','2018-08-25'),(9,'Ismail','Dedic','2003-03-13','i_dedic@hotmail.com','387-62-707-500','2020-01-01'),(10,'Amer','Jusi?','2003-07-31','jusic.amer18@hotmail.com','387-60-338-9672','2019-06-15');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publisher`
--

DROP TABLE IF EXISTS `publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publisher` (
  `publisher_id` int NOT NULL AUTO_INCREMENT,
  `publisher_name` varchar(100) DEFAULT NULL,
  `contact_email` varchar(100) DEFAULT NULL,
  `contact_phone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`publisher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publisher`
--

LOCK TABLES `publisher` WRITE;
/*!40000 ALTER TABLE `publisher` DISABLE KEYS */;
INSERT INTO `publisher` VALUES (1,'Svjetlost','contact@svjetlost.ba','387-33-123-456'),(2,'Bosanska Knjiga','contact@bosanskaknjiga.ba','387-33-654-321'),(3,'Veselin Maslesa','contact@veselinmaslesa.ba','387-33-111-222'),(4,'Penguin Books','contact@penguinbooks.com','123-456-7890'),(5,'HarperCollins','contact@harpercollins.com','098-765-4321'),(6,'Bloomsbury','contact@bloomsbury.com','111-222-3333'),(7,'Vintage','contact@vintage.com','222-333-4444'),(8,'Random House','contact@randomhouse.com','333-444-5555');
/*!40000 ALTER TABLE `publisher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `reservation_id` int NOT NULL AUTO_INCREMENT,
  `book_id` int DEFAULT NULL,
  `member_id` int DEFAULT NULL,
  `reservation_date` date DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`reservation_id`),
  KEY `book_id` (`book_id`),
  KEY `member_id` (`member_id`),
  CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`),
  CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES (1,4,1,'2023-06-02','Reserved'),(2,1,2,'2023-05-05','Cancelled'),(3,2,3,'2023-04-25','Completed'),(4,3,4,'2023-03-15','Pending'),(5,5,5,'2023-01-20','Completed'),(6,6,6,'2023-02-25','Cancelled'),(7,7,7,'2023-03-30','Reserved'),(8,8,8,'2023-04-15','Completed'),(9,9,1,'2023-05-20','Pending'),(10,10,2,'2023-06-01','Reserved');
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `staff_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  PRIMARY KEY (`staff_id`),
  KEY `branch_id` (`branch_id`),
  CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `librarybranch` (`branch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'Amira','Smajic','Librarian','amira.smajic@example.com','387-33-112-233',1),(2,'Senad','Kovacevic','Assistant Librarian','senad.kovacevic@example.com','387-33-223-344',2),(3,'Jasmina','Basic','Librarian','jasmina.basic@example.com','387-33-334-455',1),(4,'Edin','Kulenovic','Library Manager','edin.kulenovic@example.com','387-33-445-566',2),(5,'Michael','Williams','Librarian','michael.williams@example.com','387-33-556-677',3),(6,'Sophia','Martinez','Assistant Librarian','sophia.martinez@example.com','387-33-667-788',1),(7,'Olivia','Garcia','Library Manager','olivia.garcia@example.com','387-33-778-899',3),(8,'Isabella','Rodriguez','Librarian','isabella.rodriguez@example.com','387-33-889-900',2);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-29 23:37:27

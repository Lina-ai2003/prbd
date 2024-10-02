-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: 172.16.7.85    Database: univer008_Lina
-- ------------------------------------------------------
-- Server version	8.0.39-0ubuntu0.24.04.2

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
-- Table structure for table `director`
--

DROP TABLE IF EXISTS `director`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `director` (
  `#director` int NOT NULL AUTO_INCREMENT,
  `dirname` varchar(25) NOT NULL,
  `facult` varchar(10) NOT NULL,
  PRIMARY KEY (`#director`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `director`
--

LOCK TABLES `director` WRITE;
/*!40000 ALTER TABLE `director` DISABLE KEYS */;
INSERT INTO `director` VALUES (1,'Петров ','ФТП'),(2,'Классов','ИФМИТО'),(3,'Шестаев','ФФК'),(4,'Гейбука','Фп');
/*!40000 ALTER TABLE `director` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `#employee` int NOT NULL,
  `empname` varchar(45) NOT NULL,
  `director_#director` int NOT NULL,
  `posts_postname` varchar(15) NOT NULL,
  PRIMARY KEY (`#employee`),
  KEY `fk_employee_director1_idx` (`director_#director`),
  KEY `fk_employee_posts1_idx` (`posts_postname`),
  CONSTRAINT `fk_employee_director1` FOREIGN KEY (`director_#director`) REFERENCES `director` (`#director`),
  CONSTRAINT `fk_employee_posts1` FOREIGN KEY (`posts_postname`) REFERENCES `posts` (`postname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Крашениннеков',1,'доктор наук'),(2,'Балашов',2,'доцент'),(3,'Розов',3,'кандидат наук'),(4,'Чупин',4,'старший педагог');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_has_subject`
--

DROP TABLE IF EXISTS `employee_has_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_has_subject` (
  `employee_#employee` int NOT NULL,
  `subject_#sabg` int NOT NULL,
  PRIMARY KEY (`employee_#employee`,`subject_#sabg`),
  KEY `fk_employee_has_subject_subject1_idx` (`subject_#sabg`),
  KEY `fk_employee_has_subject_employee1_idx` (`employee_#employee`),
  CONSTRAINT `fk_employee_has_subject_employee1` FOREIGN KEY (`employee_#employee`) REFERENCES `employee` (`#employee`),
  CONSTRAINT `fk_employee_has_subject_subject1` FOREIGN KEY (`subject_#sabg`) REFERENCES `subject` (`#sabg`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_has_subject`
--

LOCK TABLES `employee_has_subject` WRITE;
/*!40000 ALTER TABLE `employee_has_subject` DISABLE KEYS */;
INSERT INTO `employee_has_subject` VALUES (1,1),(2,2),(3,3),(4,4),(1,5),(2,6),(3,7),(4,8);
/*!40000 ALTER TABLE `employee_has_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group`
--

DROP TABLE IF EXISTS `group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group` (
  `#gr` char(10) NOT NULL,
  `napr` mediumtext NOT NULL,
  `profil` mediumtext NOT NULL,
  PRIMARY KEY (`#gr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group`
--

LOCK TABLES `group` WRITE;
/*!40000 ALTER TABLE `group` DISABLE KEYS */;
INSERT INTO `group` VALUES ('001','информатика','в образовании'),('002','математика','дошкольное'),('003','физика','в образовании'),('004','экономика','маркетинг');
/*!40000 ALTER TABLE `group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lessontipe`
--

DROP TABLE IF EXISTS `lessontipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lessontipe` (
  `lessonname` varchar(20) NOT NULL,
  PRIMARY KEY (`lessonname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lessontipe`
--

LOCK TABLES `lessontipe` WRITE;
/*!40000 ALTER TABLE `lessontipe` DISABLE KEYS */;
INSERT INTO `lessontipe` VALUES ('лекция'),('практика'),('семинар');
/*!40000 ALTER TABLE `lessontipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `postname` varchar(15) NOT NULL,
  PRIMARY KEY (`postname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES ('доктор наук'),('доцент'),('кандидат наук'),('старший педагог');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schebule`
--

DROP TABLE IF EXISTS `schebule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schebule` (
  `#week` int NOT NULL,
  `day` char(3) NOT NULL,
  `group_#gr` char(10) NOT NULL,
  `subject_#sabg` int NOT NULL,
  `lessontipe_lessonname` varchar(20) NOT NULL,
  `#room` char(3) NOT NULL,
  PRIMARY KEY (`#week`,`day`,`group_#gr`,`subject_#sabg`,`lessontipe_lessonname`),
  KEY `fk_group_has_subject_subject1_idx` (`subject_#sabg`),
  KEY `fk_group_has_subject_group1_idx` (`group_#gr`),
  KEY `fk_group_has_subject_lessontipe1_idx` (`lessontipe_lessonname`),
  CONSTRAINT `fk_group_has_subject_group1` FOREIGN KEY (`group_#gr`) REFERENCES `group` (`#gr`),
  CONSTRAINT `fk_group_has_subject_lessontipe1` FOREIGN KEY (`lessontipe_lessonname`) REFERENCES `lessontipe` (`lessonname`),
  CONSTRAINT `fk_group_has_subject_subject1` FOREIGN KEY (`subject_#sabg`) REFERENCES `subject` (`#sabg`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schebule`
--

LOCK TABLES `schebule` WRITE;
/*!40000 ALTER TABLE `schebule` DISABLE KEYS */;
INSERT INTO `schebule` VALUES (1,'пн','001',1,'лекция','2'),(2,'вт','001',2,'практика','4'),(3,'ср','002',3,'семинар','8'),(4,'чт','002',4,'практика','2'),(5,'пт','003',5,'лекция','3'),(6,'сб','004',6,'практика','6'),(7,'вс','004',7,'лекция','5');
/*!40000 ALTER TABLE `schebule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `#stud` int NOT NULL,
  `studname` varchar(45) NOT NULL,
  `director_#director` int NOT NULL,
  `group_#gr` char(10) DEFAULT NULL,
  PRIMARY KEY (`#stud`),
  KEY `fk_student_director_idx` (`director_#director`),
  KEY `fk_student_group1_idx` (`group_#gr`),
  CONSTRAINT `fk_student_director` FOREIGN KEY (`director_#director`) REFERENCES `director` (`#director`),
  CONSTRAINT `fk_student_group1` FOREIGN KEY (`group_#gr`) REFERENCES `group` (`#gr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'маша',1,'001'),(2,'даша',1,'001'),(3,'саша',1,'001'),(4,'дима',1,'001'),(5,'артем',2,'002'),(6,'данил',2,'002'),(7,'кирилл',2,'002'),(8,'настя',2,'002'),(9,'лера',3,'003'),(10,'вика',3,'003'),(11,'динис',3,'003'),(12,'лена',3,'003'),(13,'эля',4,'004'),(14,'галя',4,'004'),(15,'александр',4,'004'),(16,'таня',4,'004');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject` (
  `#sabg` int NOT NULL AUTO_INCREMENT,
  `sabjname` varchar(100) DEFAULT NULL,
  `subjinfo` mediumtext,
  PRIMARY KEY (`#sabg`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES (1,'математика','умножение'),(2,'информатика','двоичная системы'),(3,'физра','кросс'),(4,'история','история России'),(5,'химия','сложные элементы'),(6,'литература','горе от ума'),(7,'биология','фотосинтез'),(8,'физика','сила притяжение');
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vedomost`
--

DROP TABLE IF EXISTS `vedomost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vedomost` (
  `date` date NOT NULL,
  `student_#stud` int NOT NULL,
  `employee_#employee` int NOT NULL,
  `subject_#sabg` int NOT NULL,
  `mark` varchar(14) NOT NULL,
  PRIMARY KEY (`date`,`student_#stud`,`employee_#employee`,`subject_#sabg`),
  KEY `fk_student_has_employee_employee1_idx` (`employee_#employee`),
  KEY `fk_student_has_employee_student1_idx` (`student_#stud`),
  KEY `fk_student_has_employee_subject1_idx` (`subject_#sabg`),
  CONSTRAINT `fk_student_has_employee_employee1` FOREIGN KEY (`employee_#employee`) REFERENCES `employee` (`#employee`),
  CONSTRAINT `fk_student_has_employee_student1` FOREIGN KEY (`student_#stud`) REFERENCES `student` (`#stud`),
  CONSTRAINT `fk_student_has_employee_subject1` FOREIGN KEY (`subject_#sabg`) REFERENCES `subject` (`#sabg`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vedomost`
--

LOCK TABLES `vedomost` WRITE;
/*!40000 ALTER TABLE `vedomost` DISABLE KEYS */;
INSERT INTO `vedomost` VALUES ('2024-09-19',13,4,7,'5'),('2024-09-19',14,4,7,'5'),('2024-09-19',15,4,8,'5'),('2024-09-19',16,4,8,'5'),('2024-09-20',9,3,5,'4'),('2024-09-20',10,3,5,'4'),('2024-09-20',11,3,6,'4'),('2024-09-20',12,3,6,'4'),('2024-09-22',5,2,3,'4'),('2024-09-22',6,2,3,'2'),('2024-09-22',7,2,4,'3'),('2024-09-22',8,2,4,'2'),('2024-09-25',1,1,1,'5'),('2024-09-25',2,1,1,'4'),('2024-09-25',3,1,2,'5'),('2024-09-25',4,1,2,'3');
/*!40000 ALTER TABLE `vedomost` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-02 13:20:20

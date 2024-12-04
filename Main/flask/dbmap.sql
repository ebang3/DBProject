-- MySQL dump 10.13  Distrib 9.0.1, for macos14.7 (arm64)
--
-- Host: localhost    Database: dbmap
-- ------------------------------------------------------
-- Server version	9.0.1

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

--
-- Table structure for table `demographics`
--

DROP TABLE IF EXISTS `demographics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `demographics` (
  `DemographicID` int NOT NULL,
  `StateID` int DEFAULT NULL,
  `TotalPopulation` int DEFAULT NULL,
  `AgeDistribution` json DEFAULT NULL,
  `MedianAge` decimal(3,1) DEFAULT NULL,
  `UrbanizationRate` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`DemographicID`),
  KEY `StateID` (`StateID`),
  CONSTRAINT `demographics_ibfk_1` FOREIGN KEY (`StateID`) REFERENCES `states` (`StateID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demographics`
--

LOCK TABLES `demographics` WRITE;
/*!40000 ALTER TABLE `demographics` DISABLE KEYS */;
INSERT INTO `demographics` VALUES (1,1,39455353,'{\"75+\": 7, \"0-18\": 23.5, \"19-34\": 22.5, \"35-54\": 27, \"55-74\": 20}',38.2,94.20),(2,2,28862581,'{\"75+\": 7, \"0-18\": 25.2, \"19-34\": 20.4, \"35-54\": 28.2, \"55-74\": 19.2}',35.9,83.70),(3,3,21339762,'{\"75+\": 8, \"0-18\": 21.3, \"19-34\": 21.1, \"35-54\": 26.8, \"55-74\": 22.8}',42.8,91.50),(4,4,4997675,'{\"65+\": 18.4, \"0-18\": 23.5, \"19-25\": 8.7, \"26-34\": 11.3, \"35-54\": 25.2, \"55-64\": 13.0}',39.6,57.70),(5,5,735951,'{\"65+\": 14.3, \"0-18\": 25.9, \"19-25\": 7.1, \"26-34\": 13.8, \"35-54\": 26.5, \"55-64\": 12.3}',36.5,64.90),(6,6,7079203,'{\"65+\": 19.5, \"0-18\": 22.7, \"19-25\": 8.9, \"26-34\": 12.5, \"35-54\": 24.4, \"55-64\": 12.0}',39.3,89.30),(7,7,3006309,'{\"65+\": 17.9, \"0-18\": 24.3, \"19-25\": 8.7, \"26-34\": 11.6, \"35-54\": 25.0, \"55-64\": 12.5}',38.9,55.50),(8,8,5723176,'{\"65+\": 16.2, \"0-18\": 21.9, \"19-25\": 8.6, \"26-34\": 14.3, \"35-54\": 27.3, \"55-64\": 11.7}',37.9,86.00),(9,9,3605330,'{\"65+\": 19.1, \"0-18\": 21.4, \"19-25\": 7.8, \"26-34\": 11.7, \"35-54\": 25.7, \"55-64\": 14.3}',41.5,86.30),(10,10,981892,'{\"65+\": 21.6, \"0-18\": 21.9, \"19-25\": 7.7, \"26-34\": 10.7, \"35-54\": 24.1, \"55-64\": 14.0}',42.0,82.60),(11,11,10625615,'{\"65+\": 15.5, \"0-18\": 24.6, \"19-25\": 8.7, \"26-34\": 12.4, \"35-54\": 26.5, \"55-64\": 12.3}',37.9,74.10),(12,12,1453498,'{\"65+\": 21.8, \"0-18\": 22.1, \"19-25\": 7.1, \"26-34\": 10.9, \"35-54\": 25.3, \"55-64\": 12.8}',41.4,86.10),(13,13,1811617,'{\"65+\": 17.5, \"0-18\": 25.3, \"19-25\": 8.9, \"26-34\": 11.8, \"35-54\": 25.0, \"55-64\": 11.7}',37.8,69.20),(14,14,12821813,'{\"65+\": 17.5, \"0-18\": 22.9, \"19-25\": 8.5, \"26-34\": 12.2, \"35-54\": 26.1, \"55-64\": 12.8}',39.5,86.90),(15,15,6751340,'{\"65+\": 17.1, \"0-18\": 24.4, \"19-25\": 8.9, \"26-34\": 11.9, \"35-54\": 25.1, \"55-64\": 12.5}',38.3,71.20),(16,16,3179090,'{\"65+\": 18.4, \"0-18\": 24.0, \"19-25\": 8.8, \"26-34\": 11.3, \"35-54\": 24.8, \"55-64\": 12.8}',39.1,63.20),(17,17,2932099,'{\"65+\": 17.6, \"0-18\": 25.0, \"19-25\": 8.9, \"26-34\": 11.8, \"35-54\": 24.5, \"55-64\": 12.1}',37.9,72.30),(18,18,4494141,'{\"65+\": 17.7, \"0-18\": 23.6, \"19-25\": 8.7, \"26-34\": 11.8, \"35-54\": 25.1, \"55-64\": 13.1}',39.2,58.70),(19,19,4657305,'{\"65+\": 17.5, \"0-18\": 24.9, \"19-25\": 8.2, \"26-34\": 11.7, \"35-54\": 25.2, \"55-64\": 12.6}',38.7,71.50),(20,20,1357046,'{\"65+\": 22.8, \"0-18\": 18.4, \"19-25\": 7.1, \"26-34\": 11.2, \"35-54\": 25.3, \"55-64\": 15.2}',44.9,38.60),(21,21,6148545,'{\"65+\": 17.3, \"0-18\": 23.3, \"19-25\": 7.7, \"26-34\": 11.7, \"35-54\": 26.5, \"55-64\": 13.5}',39.8,85.60),(22,22,6991852,'{\"65+\": 18.6, \"0-18\": 20.5, \"19-25\": 8.3, \"26-34\": 12.8, \"35-54\": 26.0, \"55-64\": 13.8}',40.3,91.30),(23,23,10062512,'{\"65+\": 19.2, \"0-18\": 22.2, \"19-25\": 8.7, \"26-34\": 12.0, \"35-54\": 24.4, \"55-64\": 13.5}',40.5,73.50),(24,24,5670472,'{\"65+\": 17.6, \"0-18\": 23.7, \"19-25\": 8.4, \"26-34\": 11.8, \"35-54\": 25.7, \"55-64\": 12.8}',39.1,71.90),(25,25,2967023,'{\"65+\": 17.7, \"0-18\": 24.7, \"19-25\": 8.7, \"26-34\": 10.6, \"35-54\": 25.7, \"55-64\": 12.6}',39.3,46.30),(26,26,6141534,'{\"65+\": 18.3, \"0-18\": 23.3, \"19-25\": 8.5, \"26-34\": 11.9, \"35-54\": 24.9, \"55-64\": 13.0}',39.3,69.50),(27,27,1077978,'{\"65+\": 20.5, \"0-18\": 21.9, \"19-25\": 8.2, \"26-34\": 11.8, \"35-54\": 24.9, \"55-64\": 12.6}',40.6,53.40),(28,28,1951480,'{\"65+\": 17.2, \"0-18\": 25.7, \"19-25\": 9.1, \"26-34\": 11.6, \"35-54\": 24.6, \"55-64\": 11.9}',37.4,73.00),(29,29,3059238,'{\"65+\": 17.5, \"0-18\": 22.6, \"19-25\": 8.0, \"26-34\": 12.8, \"35-54\": 26.6, \"55-64\": 12.5}',39.4,94.10),(30,30,1372175,'{\"65+\": 20.6, \"0-18\": 19.1, \"19-25\": 7.5, \"26-34\": 11.5, \"35-54\": 25.6, \"55-64\": 15.7}',43.4,58.30),(31,31,9234024,'{\"65+\": 17.7, \"0-18\": 22.9, \"19-25\": 7.7, \"26-34\": 11.6, \"35-54\": 26.5, \"55-64\": 13.5}',40.4,93.80),(32,32,2109366,'{\"65+\": 20.4, \"0-18\": 22.8, \"19-25\": 8.3, \"26-34\": 11.6, \"35-54\": 24.6, \"55-64\": 12.3}',39.9,74.50),(33,33,20114745,'{\"65+\": 18.6, \"0-18\": 21.2, \"19-25\": 8.1, \"26-34\": 12.9, \"35-54\": 25.7, \"55-64\": 13.5}',40.2,87.40),(34,34,10367022,'{\"65+\": 17.9, \"0-18\": 22.9, \"19-25\": 8.5, \"26-34\": 11.9, \"35-54\": 25.9, \"55-64\": 12.9}',39.4,66.70),(35,35,773344,'{\"65+\": 17.2, \"0-18\": 24.5, \"19-25\": 9.5, \"26-34\": 13.2, \"35-54\": 24.1, \"55-64\": 11.4}',36.3,61.00),(36,36,11769923,'{\"65+\": 18.7, \"0-18\": 23.1, \"19-25\": 8.2, \"26-34\": 12.1, \"35-54\": 24.8, \"55-64\": 13.1}',39.9,76.30),(37,37,3948136,'{\"65+\": 16.8, \"0-18\": 25.6, \"19-25\": 9.1, \"26-34\": 11.9, \"35-54\": 24.9, \"55-64\": 11.7}',37.1,64.60),(38,38,4207177,'{\"65+\": 19.7, \"0-18\": 20.6, \"19-25\": 8.2, \"26-34\": 12.6, \"35-54\": 26.9, \"55-64\": 12.0}',40.7,80.50),(39,39,12970650,'{\"65+\": 20.1, \"0-18\": 21.6, \"19-25\": 7.8, \"26-34\": 11.7, \"35-54\": 25.1, \"55-64\": 13.7}',41.1,76.50),(40,40,1091949,'{\"65+\": 19.5, \"0-18\": 20.0, \"19-25\": 8.1, \"26-34\": 12.9, \"35-54\": 25.2, \"55-64\": 14.3}',40.8,91.10),(41,41,5078903,'{\"65+\": 19.5, \"0-18\": 22.6, \"19-25\": 8.0, \"26-34\": 11.3, \"35-54\": 25.1, \"55-64\": 13.4}',40.5,67.90),(42,42,881785,'{\"65+\": 18.2, \"0-18\": 25.6, \"19-25\": 8.1, \"26-34\": 11.1, \"35-54\": 24.3, \"55-64\": 12.7}',38.5,57.20),(43,43,6859497,'{\"65+\": 17.6, \"0-18\": 23.1, \"19-25\": 8.4, \"26-34\": 12.5, \"35-54\": 25.6, \"55-64\": 12.8}',39.1,66.20),(44,44,3231370,'{\"65+\": 12.2, \"0-18\": 29.0, \"19-25\": 11.1, \"26-34\": 13.4, \"35-54\": 25.2, \"55-64\": 9.4}',32.3,89.80),(45,45,641637,'{\"65+\": 22.4, \"0-18\": 18.8, \"19-25\": 7.6, \"26-34\": 11.0, \"35-54\": 25.2, \"55-64\": 15.0}',43.7,35.10),(46,46,8582479,'{\"65+\": 17.5, \"0-18\": 23.2, \"19-25\": 8.1, \"26-34\": 12.0, \"35-54\": 26.3, \"55-64\": 13.0}',39.3,75.60),(47,47,7617364,'{\"65+\": 17.2, \"0-18\": 22.3, \"19-25\": 8.1, \"26-34\": 13.6, \"35-54\": 26.9, \"55-64\": 11.9}',38.6,83.40),(48,48,1801049,'{\"65+\": 21.7, \"0-18\": 21.2, \"19-25\": 8.3, \"26-34\": 10.4, \"35-54\": 24.8, \"55-64\": 13.7}',42.8,44.60),(49,49,5871661,'{\"65+\": 19.1, \"0-18\": 22.2, \"19-25\": 8.6, \"26-34\": 11.4, \"35-54\": 24.9, \"55-64\": 13.8}',40.5,67.10),(50,50,576641,'{\"65+\": 19.1, \"0-18\": 23.8, \"19-25\": 7.6, \"26-34\": 12.0, \"35-54\": 24.9, \"55-64\": 12.6}',39.3,62.00);
/*!40000 ALTER TABLE `demographics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diversity`
--

DROP TABLE IF EXISTS `diversity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diversity` (
  `DiversityID` int NOT NULL,
  `StateID` int DEFAULT NULL,
  `RaceEthnicity` json DEFAULT NULL,
  PRIMARY KEY (`DiversityID`),
  KEY `StateID` (`StateID`),
  CONSTRAINT `diversity_ibfk_1` FOREIGN KEY (`StateID`) REFERENCES `states` (`StateID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diversity`
--

LOCK TABLES `diversity` WRITE;
/*!40000 ALTER TABLE `diversity` DISABLE KEYS */;
INSERT INTO `diversity` VALUES (1,1,'{\"Asian\": 15.6, \"Black\": 5.0, \"Other\": 5.6, \"White\": 33.3, \"Hispanic\": 40.6}'),(2,2,'{\"Asian\": 5.6, \"Black\": 11.8, \"Other\": 3.8, \"White\": 38.8, \"Hispanic\": 40.0}'),(3,3,'{\"Asian\": 2.9, \"Black\": 14.2, \"Other\": 5.1, \"White\": 50.3, \"Hispanic\": 27.6}'),(4,4,'{\"Asian\": 1.6, \"Black\": 25.0, \"Other\": 4.2, \"White\": 63.6, \"Hispanic\": 5.8}'),(5,5,'{\"Asian\": 6.1, \"Black\": 2.3, \"Other\": 26.7, \"White\": 57.4, \"Hispanic\": 7.4}'),(6,6,'{\"Asian\": 3.5, \"Black\": 4.4, \"Other\": 8.1, \"White\": 52.3, \"Hispanic\": 31.7}'),(7,7,'{\"Asian\": 1.7, \"Black\": 14.1, \"Other\": 7.8, \"White\": 67.3, \"Hispanic\": 9.2}'),(8,8,'{\"Asian\": 3.2, \"Black\": 3.6, \"Other\": 5.7, \"White\": 64.7, \"Hispanic\": 22.7}'),(9,9,'{\"Asian\": 4.7, \"Black\": 9.8, \"Other\": 5.3, \"White\": 61.4, \"Hispanic\": 18.7}'),(10,10,'{\"Asian\": 4.3, \"Black\": 21.3, \"Other\": 5.2, \"White\": 58.2, \"Hispanic\": 11.1}'),(11,11,'{\"Asian\": 4.5, \"Black\": 30.4, \"Other\": 5.2, \"White\": 48.8, \"Hispanic\": 11.1}'),(12,12,'{\"Asian\": 36.6, \"Black\": 1.4, \"Other\": 32.4, \"White\": 19.8, \"Hispanic\": 9.8}'),(13,13,'{\"Asian\": 1.4, \"Black\": 0.8, \"Other\": 5.6, \"White\": 78.4, \"Hispanic\": 13.8}'),(14,14,'{\"Asian\": 6.0, \"Black\": 12.8, \"Other\": 4.1, \"White\": 58.0, \"Hispanic\": 19.1}'),(15,15,'{\"Asian\": 2.6, \"Black\": 8.7, \"Other\": 4.6, \"White\": 75.2, \"Hispanic\": 8.8}'),(16,16,'{\"Asian\": 2.3, \"Black\": 3.6, \"Other\": 4.1, \"White\": 82.6, \"Hispanic\": 7.4}'),(17,17,'{\"Asian\": 2.6, \"Black\": 4.8, \"Other\": 5.7, \"White\": 73.0, \"Hispanic\": 13.7}'),(18,18,'{\"Asian\": 1.4, \"Black\": 7.1, \"Other\": 4.8, \"White\": 81.9, \"Hispanic\": 4.8}'),(19,19,'{\"Asian\": 1.7, \"Black\": 29.8, \"Other\": 5.4, \"White\": 56.0, \"Hispanic\": 7.1}'),(20,20,'{\"Asian\": 0.9, \"Black\": 1.8, \"Other\": 5.1, \"White\": 90.0, \"Hispanic\": 2.1}'),(21,21,'{\"Asian\": 6.6, \"Black\": 28.8, \"Other\": 5.5, \"White\": 46.4, \"Hispanic\": 12.7}'),(22,22,'{\"Asian\": 7.2, \"Black\": 6.5, \"Other\": 6.6, \"White\": 66.2, \"Hispanic\": 13.5}'),(23,23,'{\"Asian\": 3.3, \"Black\": 13.0, \"Other\": 5.1, \"White\": 72.6, \"Hispanic\": 5.9}'),(24,24,'{\"Asian\": 5.2, \"Black\": 6.8, \"Other\": 5.8, \"White\": 75.7, \"Hispanic\": 6.4}'),(25,25,'{\"Asian\": 0.9, \"Black\": 35.5, \"Other\": 4.8, \"White\": 55.2, \"Hispanic\": 3.6}'),(26,26,'{\"Asian\": 2.0, \"Black\": 10.5, \"Other\": 5.4, \"White\": 76.8, \"Hispanic\": 5.2}'),(27,27,'{\"Asian\": 0.8, \"Black\": 0.5, \"Other\": 10.2, \"White\": 83.9, \"Hispanic\": 4.6}'),(28,28,'{\"Asian\": 2.6, \"Black\": 4.2, \"Other\": 5.0, \"White\": 75.2, \"Hispanic\": 13.0}'),(29,29,'{\"Asian\": 9.1, \"Black\": 8.7, \"Other\": 7.2, \"White\": 44.4, \"Hispanic\": 30.0}'),(30,30,'{\"Asian\": 2.6, \"Black\": 1.2, \"Other\": 4.9, \"White\": 86.5, \"Hispanic\": 4.5}'),(31,31,'{\"Asian\": 10.2, \"Black\": 11.9, \"Other\": 4.6, \"White\": 50.6, \"Hispanic\": 22.7}'),(32,32,'{\"Asian\": 1.7, \"Black\": 1.6, \"Other\": 12.9, \"White\": 36.1, \"Hispanic\": 48.7}'),(33,33,'{\"Asian\": 9.0, \"Black\": 13.2, \"Other\": 5.1, \"White\": 52.8, \"Hispanic\": 19.9}'),(34,34,'{\"Asian\": 3.3, \"Black\": 19.8, \"Other\": 5.6, \"White\": 59.9, \"Hispanic\": 11.4}'),(35,35,'{\"Asian\": 1.4, \"Black\": 2.6, \"Other\": 9.9, \"White\": 81.6, \"Hispanic\": 4.4}'),(36,36,'{\"Asian\": 2.5, \"Black\": 11.7, \"Other\": 5.1, \"White\": 75.8, \"Hispanic\": 4.8}'),(37,37,'{\"Asian\": 2.3, \"Black\": 6.4, \"Other\": 16.5, \"White\": 61.9, \"Hispanic\": 12.9}'),(38,38,'{\"Asian\": 4.5, \"Black\": 1.9, \"Other\": 7.8, \"White\": 71.0, \"Hispanic\": 14.9}'),(39,39,'{\"Asian\": 3.9, \"Black\": 9.9, \"Other\": 4.4, \"White\": 73.0, \"Hispanic\": 8.9}'),(40,40,'{\"Asian\": 3.2, \"Black\": 4.6, \"Other\": 6.2, \"White\": 67.6, \"Hispanic\": 18.2}'),(41,41,'{\"Asian\": 1.7, \"Black\": 24.0, \"Other\": 4.8, \"White\": 62.0, \"Hispanic\": 7.4}'),(42,42,'{\"Asian\": 1.7, \"Black\": 2.4, \"Other\": 11.2, \"White\": 79.6, \"Hispanic\": 5.0}'),(43,43,'{\"Asian\": 1.8, \"Black\": 15.0, \"Other\": 4.4, \"White\": 71.3, \"Hispanic\": 7.5}'),(44,44,'{\"Asian\": 2.5, \"Black\": 1.0, \"Other\": 6.0, \"White\": 74.5, \"Hispanic\": 16.0}'),(45,45,'{\"Asian\": 1.6, \"Black\": 1.3, \"Other\": 5.3, \"White\": 89.2, \"Hispanic\": 2.4}'),(46,46,'{\"Asian\": 7.0, \"Black\": 17.9, \"Other\": 5.7, \"White\": 58.3, \"Hispanic\": 11.1}'),(47,47,'{\"Asian\": 9.9, \"Black\": 3.8, \"Other\": 9.3, \"White\": 62.5, \"Hispanic\": 14.5}'),(48,48,'{\"Asian\": 0.7, \"Black\": 2.6, \"Other\": 4.4, \"White\": 90.2, \"Hispanic\": 2.0}'),(49,49,'{\"Asian\": 2.9, \"Black\": 5.7, \"Other\": 4.5, \"White\": 78.7, \"Hispanic\": 8.1}'),(50,50,'{\"Asian\": 0.6, \"Black\": 0.6, \"Other\": 6.6, \"White\": 81.5, \"Hispanic\": 10.7}');
/*!40000 ALTER TABLE `diversity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `economy`
--

DROP TABLE IF EXISTS `economy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `economy` (
  `EconomyID` int NOT NULL,
  `StateID` int DEFAULT NULL,
  `GrossStateProduct` decimal(10,2) DEFAULT NULL,
  `UnemploymentRate` decimal(4,2) DEFAULT NULL,
  `MedianHouseholdIncome` int DEFAULT NULL,
  `PovertyRate` decimal(4,2) DEFAULT NULL,
  `MajorIndustries` json DEFAULT NULL,
  PRIMARY KEY (`EconomyID`),
  KEY `StateID` (`StateID`),
  CONSTRAINT `economy_ibfk_1` FOREIGN KEY (`StateID`) REFERENCES `states` (`StateID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `economy`
--

LOCK TABLES `economy` WRITE;
/*!40000 ALTER TABLE `economy` DISABLE KEYS */;
INSERT INTO `economy` VALUES (1,1,3944376.00,5.40,95521,12.58,'[\"Information\"]'),(2,2,2636423.00,4.10,75780,14.22,'[\"Manufacturing\"]'),(3,3,1622626.00,3.30,73311,13.34,'[\"Real estate, Rental, and Leasing\"]'),(4,4,306820.00,2.90,62212,15.98,'[\"Manufacturing\"]'),(5,5,68712.00,4.60,88121,10.34,'[\"Mining, Quarrying, and Oil and gas extraction\"]'),(6,6,521027.00,3.60,77315,14.12,'[\"Real estate, Rental, and Leasing\"]'),(7,7,178238.00,3.30,58700,16.08,'[\"Manufacturing\"]'),(8,8,532490.00,4.10,92911,9.78,'[\"Real estate, Rental, and Leasing\"]'),(9,9,347569.00,3.00,91665,9.78,'[\"Finance and Insurance\"]'),(10,10,95414.00,4.00,82174,11.44,'[\"Finance and Insurance\"]'),(11,11,821989.00,3.60,74632,14.28,'[\"Real estate, Rental, and Leasing\"]'),(12,12,109850.00,2.90,95322,9.26,'[\"Real estate, Rental, and Leasing\"]'),(13,13,122047.00,3.70,74942,11.94,'[\"Real estate, Rental, and Leasing\"]'),(14,14,1102071.00,5.30,80306,11.99,'[\"Manufacturing\"]'),(15,15,507424.00,4.40,69477,12.91,'[\"Manufacturing\"]'),(16,16,251481.00,3.00,71433,11.11,'[\"Manufacturing\"]'),(17,17,230727.00,3.40,70333,11.44,'[\"Manufacturing\"]'),(18,18,283273.00,5.00,61118,16.61,'[\"Manufacturing\"]'),(19,19,315827.00,4.10,58229,18.65,'[\"Manufacturing\"]'),(20,20,93145.00,2.90,73733,11.07,'[\"Real estate, Rental, and Leasing\"]'),(21,21,521159.00,3.00,98678,9.02,'[\"Real estate, Rental, and Leasing\"]'),(22,22,750435.00,3.90,99858,9.85,'[\"Professional, Scientific, and Tehcnical Services\"]'),(23,23,670690.00,4.70,69183,13.71,'[\"Manufacturing\"]'),(24,24,480190.00,3.40,85086,9.33,'[\"Manufacturing\"]'),(25,25,148243.00,2.90,54203,19.58,'[\"Manufacturing\"]'),(26,26,430369.00,3.80,68545,13.01,'[\"Manufacturing\"]'),(27,27,72037.00,3.30,70804,12.78,'[\"Real estate, Rental, and Leasing\"]'),(28,28,180930.00,2.70,74590,10.37,'[\"Manufacturing\"]'),(29,29,247105.00,5.70,76364,12.78,'[\"Real estate, Rental, and Leasing\"]'),(30,30,113589.00,2.50,96838,7.42,'[\"Real estate, Rental, and Leasing\"]'),(31,31,817354.00,4.70,99781,9.67,'[\"Real estate, Rental, and Leasing\"]'),(32,32,133490.00,4.30,62268,18.55,'[\"Mining, Quarrying, and Oil and gas extraction\"]'),(33,33,2189391.00,4.40,82095,13.58,'[\"Finance and Insurance\"]'),(34,34,783202.00,3.70,70804,13.98,'[\"Manufacturing\"]'),(35,35,74914.00,2.40,76525,10.53,'[\"Mining, Quarrying, and Oil and gas extraction\"]'),(36,36,890207.00,4.30,67769,13.62,'[\"Manufacturing\"]'),(37,37,259544.00,3.30,62138,15.27,'[\"Mining, Quarrying, and Oil and gas extraction\"]'),(38,38,322887.00,4.00,80160,12.36,'[\"Manufacturing\"]'),(39,39,987638.00,3.40,73824,11.95,'[\"Manufacturing\"]'),(40,40,79040.00,4.60,84972,11.58,'[\"Real estate, Rental, and Leasing\"]'),(41,41,330779.00,4.70,67804,14.68,'[\"Manufacturing\"]'),(42,42,73262.00,1.90,71810,12.81,'[\"Finance and Insurance\"]'),(43,43,534217.00,3.30,67631,14.62,'[\"Manufacturing\"]'),(44,44,279568.00,3.50,93421,9.13,'[\"Manufacturing\"]'),(45,45,44005.00,2.30,81211,10.78,'[\"Real estate, Rental, and Leasing\"]'),(46,46,722502.00,2.90,89931,10.01,'[\"Professional, Scientific, and Tehcnical Services\"]'),(47,47,820074.00,4.70,94605,10.19,'[\"Information\"]'),(48,48,101685.00,4.20,55948,17.10,'[\"Mining, Quarrying, and Oil and gas extraction\"]'),(49,49,422896.00,2.90,74631,10.97,'[\"Manufacturing\"]'),(50,50,51210.00,3.20,72415,10.76,'[\"Mining, Quarrying, and Oil and gas extraction\"]');
/*!40000 ALTER TABLE `economy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regions`
--

DROP TABLE IF EXISTS `regions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `regions` (
  `RegionID` int NOT NULL,
  `RegionName` varchar(50) DEFAULT NULL,
  `StateCount` int DEFAULT NULL,
  PRIMARY KEY (`RegionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regions`
--

LOCK TABLES `regions` WRITE;
/*!40000 ALTER TABLE `regions` DISABLE KEYS */;
INSERT INTO `regions` VALUES (1,'West',13),(2,'South',16),(3,'Southeast',12),(4,'NorthEast',9);
/*!40000 ALTER TABLE `regions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `states` (
  `StateID` int NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Nickname` varchar(50) DEFAULT NULL,
  `Capital` varchar(50) DEFAULT NULL,
  `Size` int DEFAULT NULL,
  `RegionID` int DEFAULT NULL,
  PRIMARY KEY (`StateID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
INSERT INTO `states` VALUES (1,'California','Golden State','Sacramento',163696,1),(2,'Texas','Lone Star State','Austin',268596,2),(3,'Florida','Sunshine State','Tallahassee',65758,3),(4,'Alabama','YellowHammer State','Montgomery',52420,2),(5,'Alaska','Last Frontier','Juneau',665384,1),(6,'Arizona','Grand Canyon State','Pheonix',113990,1),(7,'Arkansas','Natural State','Little Rock',53179,3),(8,'Colorado','Centennial State','Denver',104094,1),(9,'Connecticut','Consitution State','Hartford',5543,4),(10,'Delaware','First State','Dover',2489,2),(11,'Georgia','Peach State','Atlanta',59425,2),(12,'Hawaii','Aloha State','Honolulu',10932,1),(13,'Idaho','Gem State','Boise',83569,1),(14,'Illinois','Prairie State','Springfield',57914,3),(15,'Indiana','Hoosier State','Indianapolis',36420,3),(16,'Iowa','Hawkeye State','Des Moines',56273,3),(17,'Kansas','Sunflower State','Topeka',82278,3),(18,'Kentucky','Bluegrass State','Frankfort',40408,2),(19,'Louisiana','Pelican State','Baton Rouge',52378,2),(20,'Maine','Pine Tree State','Augusta',35380,4),(21,'Maryland','Old Line State','Annapolis',12406,2),(22,'Massachusetts','Bay State','Boston',10554,4),(23,'Michigan','Great Lake State','Lansing',96714,3),(24,'Minnesota','North Star State','Saint Paul',86936,3),(25,'Mississippi','Magnolia State','Jackson',48432,2),(26,'Missouri','Show Me State','Jefferson City',69707,3),(27,'Montana','Treasure State','Helena',147040,3),(28,'Nebraska','Cornhusker State','Lincoln',77348,3),(29,'Nevada','Silver State','Carson City',110572,1),(30,'New Hampshire','Granite State','Concord',9349,4),(31,'New Jersey','Garden State','Trenton',8723,4),(32,'New Mexico','Land of Enchantment','Santa Fe',121590,1),(33,'New York','Empire State','Albany',54555,4),(34,'North Carolina','Tarheel State','Raleigh',53819,2),(35,'North Dakota','Peace Garden State','Bismarck',70698,3),(36,'Ohio','Buckeye State','Columbus',44826,3),(37,'Oklahoma','Sooner State','Oklahoma City',69899,2),(38,'Oregon','Beaver State','Salem',98379,1),(39,'Pennsylvania','Keystone State','Harrisburg',46054,4),(40,'Rhode Island','Ocean State','Providence',1545,4),(41,'South Carolina','Palmetto State','Columbia',32020,2),(42,'South Dakota','Mount Rushmore State','Pierre',77116,3),(43,'Tennessee','Volunteer State','Nashville',42144,2),(44,'Utah','Beehive State','Salt Lake City',84897,1),(45,'Vermont','Green Mountain State','Montpelier',9616,4),(46,'Virginia','Old Dominion','Richmond',42775,2),(47,'Washington','Evergreen State','Olympia',71298,1),(48,'West Virginia','Mountain State','Charleston',24230,2),(49,'Wisconsin','Badger State','Madison',65496,3),(50,'Wyoming','Equality State','Cheyenne',97813,1);
/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-19 13:38:43

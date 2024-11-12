-- MySQL dump 10.13  Distrib 9.0.1, for macos14.7 (arm64)
--
-- Host: localhost    Database: dbmap
-- ------------------------------------------------------
-- Server version	9.0.1
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */
;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */
;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */
;
/*!50503 SET NAMES utf8mb4 */
;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */
;
/*!40103 SET TIME_ZONE='+00:00' */
;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */
;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */
;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */
;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */
;
--
-- Table structure for table `demographics`
--

DROP TABLE IF EXISTS `demographics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */
;
/*!50503 SET character_set_client = utf8mb4 */
;
CREATE TABLE `demographics` (
  `DemographicID` int NOT NULL,
  `StateID` int DEFAULT NULL,
  `TotalPopulation` int DEFAULT NULL,
  `AgeDistribution` json DEFAULT NULL,
  `MedianAge` decimal(3, 1) DEFAULT NULL,
  `UrbanizationRate` decimal(5, 2) DEFAULT NULL,
  PRIMARY KEY (`DemographicID`),
  KEY `StateID` (`StateID`),
  CONSTRAINT `demographics_ibfk_1` FOREIGN KEY (`StateID`) REFERENCES `states` (`StateID`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */
;
--
-- Dumping data for table `demographics`
--

LOCK TABLES `demographics` WRITE;
/*!40000 ALTER TABLE `demographics` DISABLE KEYS */
;
INSERT INTO `demographics`
VALUES (
    1,
    1,
    39538223,
    '{\"75+\": 7, \"0-18\": 23.5, \"19-34\": 22.5, \"35-54\": 27, \"55-74\": 20}',
    36.5,
    95.00
  ),
(
    2,
    2,
    29145505,
    '{\"75+\": 7, \"0-18\": 25.2, \"19-34\": 20.4, \"35-54\": 28.2, \"55-74\": 19.2}',
    35.5,
    85.00
  ),
(
    3,
    3,
    21538187,
    '{\"75+\": 8, \"0-18\": 21.3, \"19-34\": 21.1, \"35-54\": 26.8, \"55-74\": 22.8}',
    42.0,
    91.00
  );
/*!40000 ALTER TABLE `demographics` ENABLE KEYS */
;
UNLOCK TABLES;
--
-- Table structure for table `diversity`
--

DROP TABLE IF EXISTS `diversity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */
;
/*!50503 SET character_set_client = utf8mb4 */
;
CREATE TABLE `diversity` (
  `DiversityID` int NOT NULL,
  `StateID` int DEFAULT NULL,
  `RaceEthnicity` json DEFAULT NULL,
  PRIMARY KEY (`DiversityID`),
  KEY `StateID` (`StateID`),
  CONSTRAINT `diversity_ibfk_1` FOREIGN KEY (`StateID`) REFERENCES `states` (`StateID`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */
;
--
-- Dumping data for table `diversity`
--

LOCK TABLES `diversity` WRITE;
/*!40000 ALTER TABLE `diversity` DISABLE KEYS */
;
INSERT INTO `diversity`
VALUES (
    1,
    1,
    '{\"Asian\": 15.5, \"Black\": 6.5, \"Other\": 2.3, \"White\": 39.4, \"Hispanic\": 39.3}'
  ),
(
    2,
    2,
    '{\"Asian\": 5, \"Black\": 12.5, \"Other\": 1.1, \"White\": 41.2, \"Hispanic\": 40.2}'
  ),
(
    3,
    3,
    '{\"Asian\": 2.9, \"Black\": 16, \"Other\": 1.5, \"White\": 53.3, \"Hispanic\": 26.3}'
  );
/*!40000 ALTER TABLE `diversity` ENABLE KEYS */
;
UNLOCK TABLES;
--
-- Table structure for table `economy`
--

DROP TABLE IF EXISTS `economy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */
;
/*!50503 SET character_set_client = utf8mb4 */
;
CREATE TABLE `economy` (
  `EconomyID` int NOT NULL,
  `StateID` int DEFAULT NULL,
  `GrossStateProduct` decimal(10, 2) DEFAULT NULL,
  `UnemploymentRate` decimal(4, 2) DEFAULT NULL,
  `MedianHouseholdIncome` int DEFAULT NULL,
  `PovertyRate` decimal(4, 2) DEFAULT NULL,
  `MajorIndustries` json DEFAULT NULL,
  PRIMARY KEY (`EconomyID`),
  KEY `StateID` (`StateID`),
  CONSTRAINT `economy_ibfk_1` FOREIGN KEY (`StateID`) REFERENCES `states` (`StateID`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */
;
--
-- Dumping data for table `economy`
--

LOCK TABLES `economy` WRITE;
/*!40000 ALTER TABLE `economy` DISABLE KEYS */
;
INSERT INTO `economy`
VALUES (
    1,
    1,
    3200000.00,
    7.50,
    80000,
    12.00,
    '[\"Technology\", \"Agriculture\", \"Entertainment\"]'
  ),
(
    2,
    2,
    1800000.00,
    6.70,
    64000,
    14.50,
    '[\"Energy\", \"Agriculture\", \"Manufacturing\"]'
  ),
(
    3,
    3,
    1100000.00,
    5.90,
    58000,
    13.00,
    '[\"Tourism\", \"Agriculture\", \"Healthcare\"]'
  );
/*!40000 ALTER TABLE `economy` ENABLE KEYS */
;
UNLOCK TABLES;
--
-- Table structure for table `regions`
--

DROP TABLE IF EXISTS `regions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */
;
/*!50503 SET character_set_client = utf8mb4 */
;
CREATE TABLE `regions` (
  `RegionID` int NOT NULL,
  `RegionName` varchar(50) DEFAULT NULL,
  `StateCount` int DEFAULT NULL,
  PRIMARY KEY (`RegionID`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */
;
--
-- Dumping data for table `regions`
--

LOCK TABLES `regions` WRITE;
/*!40000 ALTER TABLE `regions` DISABLE KEYS */
;
INSERT INTO `regions`
VALUES (1, 'West', 13),
(2, 'South', 16),
(3, 'Southeast', 12);
/*!40000 ALTER TABLE `regions` ENABLE KEYS */
;
UNLOCK TABLES;
--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */
;
/*!50503 SET character_set_client = utf8mb4 */
;
CREATE TABLE `states` (
  `StateID` int NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Nickname` varchar(50) DEFAULT NULL,
  `Capital` varchar(50) DEFAULT NULL,
  `Size` int DEFAULT NULL,
  `RegionID` int DEFAULT NULL,
  PRIMARY KEY (`StateID`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */
;
--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */
;
INSERT INTO `states`
VALUES (
    1,
    'California',
    'Golden State',
    'Sacramento',
    163696,
    1
  ),
(2, 'Texas', 'Lone Star State', 'Austin', 268596, 2),
(
    3,
    'Florida',
    'Sunshine State',
    'Tallahassee',
    65758,
    3
  ),
(
    4,
    'Alabama',
    'YellowHammer State',
    'Montgomery',
    52420,
    2
  ),
(5, 'Alaska', 'Last Frontier', 'Juneau', 665384, 1),
(
    6,
    'Arizona',
    'Grand Canyon State',
    'Pheonix',
    113990,
    1
  ),
(
    7,
    'Arkansas',
    'Natural State',
    'Little Rock',
    53179,
    3
  ),
(
    8,
    'Colorado',
    'Centennial State',
    'Denver',
    104094,
    1
  ),
(
    9,
    'Connecticut',
    'Consitution State',
    'Hartford',
    5543,
    4
  ),
(10, 'Delaware', 'First State', 'Dover', 2489, 2),
(11, 'Georgia', 'Peach State', 'Atlanta', 59425, 2),
(12, 'Hawaii', 'Aloha State', 'Honolulu', 10932, 1),
(13, 'Idaho', 'Gem State', 'Boise', 83569, 1),
(
    14,
    'Illinois',
    'Prairie State',
    'Springfield',
    57914,
    3
  ),
(
    15,
    'Indiana',
    'Hoosier State',
    'Indianapolis',
    36420,
    3
  ),
(16, 'Iowa', 'Hawkeye State', 'Des Moines', 56273, 3),
(17, 'Kansas', 'Sunflower State', 'Topeka', 82278, 3),
(
    18,
    'Kentucky',
    'Bluegrass State',
    'Frankfort',
    40408,
    2
  ),
(
    19,
    'Louisiana',
    'Pelican State',
    'Baton Rouge',
    52378,
    2
  ),
(20, 'Maine', 'Pine Tree State', 'Augusta', 35380, 4),
(
    21,
    'Maryland',
    'Old Line State',
    'Annapolis',
    12406,
    2
  ),
(22, 'Massachusetts', 'Bay State', 'Boston', 10554, 4),
(
    23,
    'Michigan',
    'Great Lake State',
    'Lansing',
    96714,
    3
  ),
(
    24,
    'Minnesota',
    'North Star State',
    'Saint Paul',
    86936,
    3
  ),
(
    25,
    'Mississippi',
    'Magnolia State',
    'Jackson',
    48432,
    2
  ),
(
    26,
    'Missouri',
    'Show Me State',
    'Jefferson City',
    69707,
    3
  ),
(27, 'Montana', 'Treasure State', 'Helena', 147040, 3);
/*!40000 ALTER TABLE `states` ENABLE KEYS */
;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */
;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */
;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */
;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */
;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */
;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */
;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */
;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */
;
-- Dump completed on 2024-11-12 11:21:11
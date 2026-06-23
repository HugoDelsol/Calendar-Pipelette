-- MySQL dump 10.13  Distrib 8.0.43, for Linux (x86_64)
--
-- Host: localhost    Database: gestion_rdv
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `id` int NOT NULL AUTO_INCREMENT,
  `entreprise_id` int NOT NULL,
  `nom` varchar(100) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `informations` text,
  `adresse` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entreprise_id` (`entreprise_id`),
  CONSTRAINT `clients_ibfk_1` FOREIGN KEY (`entreprise_id`) REFERENCES `entreprises` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (5,5,'Marie Dupont','0687654321','marie@gmail.com','2026-06-16 14:40:31','Pose d\'une chaudi├¿re, appartement de tr├¿s mauvais gout !','12 rue de la paix, Grenoble'),(6,5,'Jean Benito','0612345678','jean@gmail.com','2026-06-16 14:49:17','Pose d\'une chaudi├¿re a gaz, belle cave a vin !','28 All├®e de la sapinette, M├®audre'),(8,5,'Hugo','0673927295','hugo.delsol64@gmail.com','2026-06-17 13:20:17','','49 Rue de Champaviotte'),(9,5,'Hugo Delsol','0673927295','hugco.delsol64@gmail.com','2026-06-17 15:04:14',NULL,NULL),(14,7,'Hugo','0673927295','hugo.delsol64@gmail.com','2026-06-19 10:30:15',NULL,'49 Rue de Champaviotte'),(15,7,'Marie Dupont','0637340539','marie@exemple.com','2026-06-19 11:57:49','Adore le saucisson a la truffes',''),(16,7,'testtetss','0619872451','mdarie@exemple.com','2026-06-19 12:01:21',NULL,NULL),(17,7,'mdzd,lzd','0654641616','maru├ºrejr@expekd.com','2026-06-19 12:04:55','dzdddzzd','4412d5zdzdz'),(18,7,'Hugo Delsol','0673927295','hugo0.delsol64@gmail.com','2026-06-19 12:09:00','test','49 Rue de Champaviotte'),(19,5,'Hugo','0673927295','hfugo.delsol64@gmail.com','2026-06-19 21:11:56',NULL,'49 Rue de Champaviotte'),(20,5,'Next','0619789585','marie@exempl.com','2026-06-22 12:05:13','','');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entreprises`
--

DROP TABLE IF EXISTS `entreprises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entreprises` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `mot_de_passe` varchar(255) NOT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `secteur` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `delai_rappel_heures` int NOT NULL DEFAULT '24',
  `reset_token` varchar(255) DEFAULT NULL,
  `reset_token_expiry` datetime DEFAULT NULL,
  `tokens_revoques_avant` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entreprises`
--

LOCK TABLES `entreprises` WRITE;
/*!40000 ALTER TABLE `entreprises` DISABLE KEYS */;
INSERT INTO `entreprises` VALUES (5,'Sanitaire','sanitaire@gmail.com','$2b$10$PGAYM7q0pdZFPO/LKoxYgOWmsYFjvzGWUx6hQNOzvB./ieudekZQK','0612345678','plomberie','2026-06-16 14:23:22',48,NULL,NULL,'2026-06-19 22:31:20'),(7,'Pipelette','pipelette@gmail.com','$2b$10$fcLtLq/.J18l4mbJcAh47OdYYyCsKAJ5MsPWcqwx91KRlaUZNQN6O','0637340539','beaute','2026-06-17 15:06:25',48,NULL,NULL,NULL),(8,'Coupe femme','dzdzd@gmlail.com','$2b$10$sCcb..C1pOu6.bIGkOJt1eli5Wu5HRmwgnF3eD6x/CbqJ/.t3TXea','0679895292','coiffure','2026-06-18 13:50:16',24,NULL,NULL,'2026-06-19 22:33:42'),(9,'hugo','hugo.delsol64@gmail.com','$2b$10$kOBLsXLcaZFG1fxxi7z08uD8YVw9TTDuWJp7MRj9jeSrkRSoX3ASm','0637340539','plomberie','2026-06-18 14:16:01',24,'b2d161d150489bcd33b144bf29ea5f9254ac41d6bcf07cbe2ec58982732585d7','2026-06-19 11:56:50',NULL),(10,'Hugo','dzxxxdzd@gmlail.com','$2b$10$sr6onDjUdFBjeaEiKnwlqepV97eceuK.8HFp5bYkJ3c1U8SiTFufq','0673927295','medical','2026-06-19 14:12:13',24,NULL,NULL,NULL),(11,'dsdsds','pipelebtte@gmail.com','$2b$10$.E3UVXEGujVMVUhGAc5izOzkEdhga9QyTTWnGNPVXnyryHu8a7gJy','585757','electricite','2026-06-19 20:06:41',48,NULL,NULL,NULL);
/*!40000 ALTER TABLE `entreprises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fermetures_exceptionnelles`
--

DROP TABLE IF EXISTS `fermetures_exceptionnelles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fermetures_exceptionnelles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `entreprise_id` int NOT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  `motif` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entreprise_id` (`entreprise_id`),
  CONSTRAINT `fermetures_exceptionnelles_ibfk_1` FOREIGN KEY (`entreprise_id`) REFERENCES `entreprises` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fermetures_exceptionnelles`
--

LOCK TABLES `fermetures_exceptionnelles` WRITE;
/*!40000 ALTER TABLE `fermetures_exceptionnelles` DISABLE KEYS */;
INSERT INTO `fermetures_exceptionnelles` VALUES (2,5,'2026-08-03','2026-08-28',''),(5,5,'2026-06-19','2026-06-29',''),(6,7,'2026-06-19','2026-06-26','');
/*!40000 ALTER TABLE `fermetures_exceptionnelles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horaires_ouverture`
--

DROP TABLE IF EXISTS `horaires_ouverture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `horaires_ouverture` (
  `id` int NOT NULL AUTO_INCREMENT,
  `entreprise_id` int NOT NULL,
  `jour_semaine` tinyint NOT NULL,
  `heure_debut` time NOT NULL,
  `heure_fin` time NOT NULL,
  PRIMARY KEY (`id`),
  KEY `entreprise_id` (`entreprise_id`),
  CONSTRAINT `horaires_ouverture_ibfk_1` FOREIGN KEY (`entreprise_id`) REFERENCES `entreprises` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horaires_ouverture`
--

LOCK TABLES `horaires_ouverture` WRITE;
/*!40000 ALTER TABLE `horaires_ouverture` DISABLE KEYS */;
INSERT INTO `horaires_ouverture` VALUES (5,5,1,'08:00:00','17:00:00'),(6,5,2,'08:00:00','12:00:00'),(7,5,2,'14:00:00','17:00:00'),(8,5,3,'08:00:00','17:00:00'),(9,5,4,'08:00:00','17:00:00'),(10,5,5,'05:00:00','16:00:00'),(11,7,5,'10:00:00','13:00:00'),(12,7,5,'14:00:00','16:00:00'),(14,7,1,'08:00:00','18:00:00');
/*!40000 ALTER TABLE `horaires_ouverture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rappel_templates`
--

DROP TABLE IF EXISTS `rappel_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rappel_templates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `entreprise_id` int NOT NULL,
  `service_id` int DEFAULT NULL,
  `titre` varchar(255) NOT NULL,
  `message` text,
  `delai_jours` int NOT NULL,
  `actif` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `entreprise_id` (`entreprise_id`),
  KEY `service_id` (`service_id`),
  CONSTRAINT `rappel_templates_ibfk_1` FOREIGN KEY (`entreprise_id`) REFERENCES `entreprises` (`id`) ON DELETE CASCADE,
  CONSTRAINT `rappel_templates_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rappel_templates`
--

LOCK TABLES `rappel_templates` WRITE;
/*!40000 ALTER TABLE `rappel_templates` DISABLE KEYS */;
INSERT INTO `rappel_templates` VALUES (1,5,10,'R├®vision annuelle chaudi├¿re Gaz','Bonjour, un an s\'est ├®coul├® depuis l\'installation de votre chaudi├¿re. Pour garantir votre s├®curit├® et optimiser ses performances, nous vous recommandons de programmer votre r├®vision annuelle. N\'h├®sitez pas ├á nous contacter !',365,1,'2026-06-18 13:26:07'),(2,7,NULL,'Rappel rehaussement de cils','Bonjour, cela fait 6 semaines que vous avez effectue votre rehaussement de cils. Il est temps de renouveler votre soin pour garder un regard sublime ! Prenez rendez-vous des maintenant.',42,1,'2026-06-18 13:40:50'),(3,5,11,'R├®vision annuelle chaudi├¿re Fuel','Bonjour, un an s\'est ├®coul├® depuis l\'installation de votre chaudi├¿re. Pour garantir votre s├®curit├® et optimiser ses performances, nous vous recommandons de programmer votre r├®vision annuelle. N\'h├®sitez pas ├á nous contacter !',365,1,'2026-06-18 14:41:36'),(5,5,7,'dzdz','dzdzd',1,1,'2026-06-19 22:12:29');
/*!40000 ALTER TABLE `rappel_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rappels_programmes`
--

DROP TABLE IF EXISTS `rappels_programmes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rappels_programmes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `entreprise_id` int NOT NULL,
  `client_id` int NOT NULL,
  `rdv_id` int DEFAULT NULL,
  `titre` varchar(255) NOT NULL,
  `message` text,
  `date_rappel` date NOT NULL,
  `envoye` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `entreprise_id` (`entreprise_id`),
  KEY `client_id` (`client_id`),
  KEY `rdv_id` (`rdv_id`),
  CONSTRAINT `rappels_programmes_ibfk_1` FOREIGN KEY (`entreprise_id`) REFERENCES `entreprises` (`id`) ON DELETE CASCADE,
  CONSTRAINT `rappels_programmes_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE,
  CONSTRAINT `rappels_programmes_ibfk_3` FOREIGN KEY (`rdv_id`) REFERENCES `rendez_vous` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rappels_programmes`
--

LOCK TABLES `rappels_programmes` WRITE;
/*!40000 ALTER TABLE `rappels_programmes` DISABLE KEYS */;
INSERT INTO `rappels_programmes` VALUES (1,5,8,18,'R├®vision annuelle chaudi├¿re Fuel','Bonjour, un an s\'est ├®coul├® depuis l\'installation de votre chaudi├¿re. Pour garantir votre s├®curit├® et optimiser ses performances, nous vous recommandons de programmer votre r├®vision annuelle. N\'h├®sitez pas ├á nous contacter !','2027-06-18',0,'2026-06-19 14:49:44'),(2,5,5,16,'R├®vision annuelle chaudi├¿re Gaz','Bonjour, un an s\'est ├®coul├® depuis l\'installation de votre chaudi├¿re. Pour garantir votre s├®curit├® et optimiser ses performances, nous vous recommandons de programmer votre r├®vision annuelle. N\'h├®sitez pas ├á nous contacter !','2027-06-19',0,'2026-06-19 14:49:47');
/*!40000 ALTER TABLE `rappels_programmes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rendez_vous`
--

DROP TABLE IF EXISTS `rendez_vous`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rendez_vous` (
  `id` int NOT NULL AUTO_INCREMENT,
  `entreprise_id` int NOT NULL,
  `client_id` int NOT NULL,
  `service_id` int NOT NULL,
  `date_heure` datetime NOT NULL,
  `statut` enum('confirme','annule','termine') DEFAULT 'confirme',
  `rappel_envoye` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `entreprise_id` (`entreprise_id`),
  KEY `client_id` (`client_id`),
  KEY `service_id` (`service_id`),
  CONSTRAINT `rendez_vous_ibfk_1` FOREIGN KEY (`entreprise_id`) REFERENCES `entreprises` (`id`) ON DELETE CASCADE,
  CONSTRAINT `rendez_vous_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE,
  CONSTRAINT `rendez_vous_ibfk_3` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rendez_vous`
--

LOCK TABLES `rendez_vous` WRITE;
/*!40000 ALTER TABLE `rendez_vous` DISABLE KEYS */;
INSERT INTO `rendez_vous` VALUES (2,5,5,7,'2026-06-18 09:00:00','termine',1,'2026-06-17 07:57:04'),(3,5,6,8,'2026-06-18 10:00:00','termine',1,'2026-06-17 08:17:13'),(4,5,5,7,'2026-06-17 10:00:00','termine',0,'2026-06-17 09:54:34'),(5,5,6,8,'2026-06-17 15:00:00','termine',1,'2026-06-17 09:55:14'),(11,5,5,7,'2026-11-26 10:00:00','confirme',0,'2026-06-17 12:35:44'),(13,5,5,8,'2026-07-24 09:00:00','confirme',0,'2026-06-17 13:26:49'),(14,5,5,7,'2026-06-26 13:00:00','confirme',0,'2026-06-17 14:30:56'),(15,5,5,8,'2026-06-30 10:00:00','confirme',0,'2026-06-17 14:38:17'),(16,5,5,7,'2026-06-19 08:00:00','termine',1,'2026-06-17 14:38:40'),(17,5,8,8,'2026-06-30 14:00:00','confirme',0,'2026-06-17 14:51:00'),(18,5,8,8,'2026-06-18 14:00:00','termine',1,'2026-06-17 15:03:05'),(19,5,9,8,'2026-06-23 10:00:00','termine',1,'2026-06-17 15:04:14'),(22,7,15,9,'2026-06-19 15:00:00','confirme',1,'2026-06-19 11:57:49'),(23,7,16,9,'2026-06-26 12:00:00','confirme',0,'2026-06-19 12:01:21'),(24,7,17,9,'2026-06-26 11:00:00','confirme',0,'2026-06-19 12:04:55'),(25,7,18,9,'2026-06-26 14:00:00','confirme',0,'2026-06-19 12:09:00'),(26,5,20,11,'2026-11-25 15:00:00','confirme',0,'2026-06-22 12:05:13'),(27,5,5,7,'2027-12-01 08:00:00','confirme',0,'2026-06-22 12:11:22'),(28,5,19,7,'2028-08-11 14:00:00','confirme',0,'2026-06-22 13:10:24');
/*!40000 ALTER TABLE `rendez_vous` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services` (
  `id` int NOT NULL AUTO_INCREMENT,
  `entreprise_id` int NOT NULL,
  `nom` varchar(100) NOT NULL,
  `duree_minutes` int NOT NULL,
  `prix` decimal(10,2) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `entreprise_id` (`entreprise_id`),
  CONSTRAINT `services_ibfk_1` FOREIGN KEY (`entreprise_id`) REFERENCES `entreprises` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (7,5,'Installation Chaudi├¿re Gaz',60,199.00,''),(8,5,'Installation Chaudi├¿re Fuel',120,280.00,''),(9,7,'R├®haussement de Cils',60,40.00,''),(10,5,'R├®vision Chaudi├¿re Gaz',60,99.00,''),(11,5,'R├®vision Chaudi├¿re Fuel',120,199.00,'');
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-22 14:07:40

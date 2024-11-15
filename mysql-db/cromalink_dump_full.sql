-- MySQL dump 10.13  Distrib 9.0.1, for Linux (x86_64)
--
-- Host: localhost    Database: cromalink_db
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
-- Current Database: `cromalink_db`
--

/*!40000 DROP DATABASE IF EXISTS `cromalink_db`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `cromalink_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `cromalink_db`;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
  `code` char(4) COLLATE utf8mb4_0900_as_cs NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL,
  PRIMARY KEY (`code`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES ('AF','Afganistán'),('AL','Albania'),('DE','Alemania'),('AD','Andorra'),('AO','Angola'),('AI','Anguilla'),('AQ','Antártida'),('AG','Antigua y Barbuda'),('AN','Antillas Holandesas'),('SA','Arabia Saudí'),('DZ','Argelia'),('AR','Argentina'),('AM','Armenia'),('AW','Aruba'),('MK','ARY Macedonia'),('AU','Australia'),('AT','Austria'),('AZ','Azerbaiyán'),('BS','Bahamas'),('BH','Bahréin'),('BD','Bangladesh'),('BB','Barbados'),('BE','Bélgica'),('BZ','Belice'),('BJ','Benin'),('BM','Bermudas'),('BT','Bhután'),('BY','Bielorrusia'),('BO','Bolivia'),('BA','Bosnia y Herzegovina'),('BW','Botsuana'),('BR','Brasil'),('BN','Brunéi'),('BG','Bulgaria'),('BF','Burkina Faso'),('BI','Burundi'),('CV','Cabo Verde'),('KH','Camboya'),('CM','Camerún'),('CA','Canadá'),('TD','Chad'),('CL','Chile'),('CN','China'),('CY','Chipre'),('VA','Ciudad del Vaticano'),('CO','Colombia'),('KM','Comoras'),('CG','Congo'),('KP','Corea del Norte'),('KR','Corea del Sur'),('CI','Costa de Marfil'),('CR','Costa Rica'),('HR','Croacia'),('CU','Cuba'),('DK','Dinamarca'),('DM','Dominica'),('EC','Ecuador'),('EG','Egipto'),('SV','El Salvador'),('AE','Emiratos Árabes Unidos'),('ER','Eritrea'),('SK','Eslovaquia'),('SI','Eslovenia'),('ES','España'),('US','Estados Unidos'),('EE','Estonia'),('ET','Etiopía'),('PH','Filipinas'),('FI','Finlandia'),('FJ','Fiyi'),('FR','Francia'),('GA','Gabón'),('GM','Gambia'),('GE','Georgia'),('GH','Ghana'),('GI','Gibraltar'),('GD','Granada'),('GR','Grecia'),('GL','Groenlandia'),('GP','Guadalupe'),('GU','Guam'),('GT','Guatemala'),('GF','Guayana Francesa'),('GN','Guinea'),('GQ','Guinea Ecuatorial'),('GW','Guinea-Bissau'),('GY','Guyana'),('HT','Haití'),('HN','Honduras'),('HK','Hong Kong'),('HU','Hungría'),('IN','India'),('ID','Indonesia'),('IR','Irán'),('IQ','Iraq'),('IE','Irlanda'),('BV','Isla Bouvet'),('CX','Isla de Navidad'),('NF','Isla Norfolk'),('IS','Islandia'),('KY','Islas Caimán'),('CC','Islas Cocos'),('CK','Islas Cook'),('FO','Islas Feroe'),('GS','Islas Georgias del Sur y Sandwich del Sur'),('AX','Islas Gland'),('HM','Islas Heard y McDonald'),('FK','Islas Malvinas'),('MP','Islas Marianas del Norte'),('MH','Islas Marshall'),('PN','Islas Pitcairn'),('SB','Islas Salomón'),('TC','Islas Turcas y Caicos'),('UM','Islas ultramarinas de Estados Unidos'),('VG','Islas Vírgenes Británicas'),('VI','Islas Vírgenes de los Estados Unidos'),('IL','Israel'),('IT','Italia'),('JM','Jamaica'),('JP','Japón'),('JO','Jordania'),('KZ','Kazajstán'),('KE','Kenia'),('KG','Kirguistán'),('KI','Kiribati'),('KW','Kuwait'),('LA','Laos'),('LS','Lesotho'),('LV','Letonia'),('LB','Líbano'),('LR','Liberia'),('LY','Libia'),('LI','Liechtenstein'),('LT','Lituania'),('LU','Luxemburgo'),('MO','Macao'),('MG','Madagascar'),('MY','Malasia'),('MW','Malawi'),('MV','Maldivas'),('ML','Malí'),('MT','Malta'),('MA','Marruecos'),('MQ','Martinica'),('MU','Mauricio'),('MR','Mauritania'),('YT','Mayotte'),('MX','México'),('FM','Micronesia'),('MD','Moldavia'),('MC','Mónaco'),('MN','Mongolia'),('MS','Montserrat'),('MZ','Mozambique'),('MM','Myanmar'),('NA','Namibia'),('NR','Nauru'),('NP','Nepal'),('NI','Nicaragua'),('NE','Níger'),('NG','Nigeria'),('NU','Niue'),('NO','Noruega'),('NC','Nueva Caledonia'),('NZ','Nueva Zelanda'),('OM','Omán'),('NL','Países Bajos'),('PK','Pakistán'),('PW','Palau'),('PS','Palestina'),('PA','Panamá'),('PG','Papúa Nueva Guinea'),('PY','Paraguay'),('PE','Perú'),('PF','Polinesia Francesa'),('PL','Polonia'),('PT','Portugal'),('PR','Puerto Rico'),('QA','Qatar'),('GB','Reino Unido'),('CF','República Centroafricana'),('CZ','República Checa'),('CD','República Democrática del Congo'),('DO','República Dominicana'),('RE','Reunión'),('RW','Ruanda'),('RO','Rumania'),('RU','Rusia'),('EH','Sahara Occidental'),('WS','Samoa'),('AS','Samoa Americana'),('KN','San Cristóbal y Nevis'),('SM','San Marino'),('PM','San Pedro y Miquelón'),('VC','San Vicente y las Granadinas'),('SH','Santa Helena'),('LC','Santa Lucía'),('ST','Santo Tomé y Príncipe'),('SN','Senegal'),('CS','Serbia y Montenegro'),('SC','Seychelles'),('SL','Sierra Leona'),('SG','Singapur'),('SY','Siria'),('SO','Somalia'),('LK','Sri Lanka'),('SZ','Suazilandia'),('ZA','Sudáfrica'),('SD','Sudán'),('SE','Suecia'),('CH','Suiza'),('SR','Surinam'),('SJ','Svalbard y Jan Mayen'),('TH','Tailandia'),('TW','Taiwán'),('TZ','Tanzania'),('TJ','Tayikistán'),('IO','Territorio Británico del Océano Índico'),('TF','Territorios Australes Franceses'),('TL','Timor Oriental'),('TG','Togo'),('TK','Tokelau'),('TO','Tonga'),('TT','Trinidad y Tobago'),('TN','Túnez'),('TM','Turkmenistán'),('TR','Turquía'),('TV','Tuvalu'),('UA','Ucrania'),('UG','Uganda'),('UY','Uruguay'),('UZ','Uzbekistán'),('VU','Vanuatu'),('VE','Venezuela'),('VN','Vietnam'),('WF','Wallis y Futuna'),('YE','Yemen'),('DJ','Yibuti'),('ZM','Zambia'),('ZW','Zimbabue');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_publications`
--

DROP TABLE IF EXISTS `group_publications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group_publications` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `publication_id` int unsigned NOT NULL,
  `group_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `chk_group_publication_unique` (`publication_id`,`group_id`),
  KEY `group_id` (`group_id`),
  CONSTRAINT `group_publications_ibfk_1` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`id`),
  CONSTRAINT `group_publications_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_publications`
--

LOCK TABLES `group_publications` WRITE;
/*!40000 ALTER TABLE `group_publications` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_publications` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `before_insert_group_publications` BEFORE INSERT ON `group_publications` FOR EACH ROW BEGIN
    IF (SELECT COUNT(*) FROM labels WHERE publication_id = NEW.publication_id) > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La publicación no puede tener etiquetas asociadas antes de ser agregada al grupo.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `groups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8mb4_0900_as_cs NOT NULL,
  `description` text COLLATE utf8mb4_0900_as_cs,
  `hashtag` varchar(20) COLLATE utf8mb4_0900_as_cs NOT NULL,
  `cover_photo` varchar(50) COLLATE utf8mb4_0900_as_cs DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `interest_name` varchar(20) COLLATE utf8mb4_0900_as_cs NOT NULL,
  `is_private` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `hashtag` (`hashtag`),
  KEY `interest_name` (`interest_name`),
  CONSTRAINT `groups_ibfk_1` FOREIGN KEY (`interest_name`) REFERENCES `interest` (`name`),
  CONSTRAINT `chk_groups_created_at` CHECK ((`created_at` <= sysdate())),
  CONSTRAINT `chk_groups_updated_at` CHECK (((`updated_at` <= sysdate()) and (`updated_at` >= `created_at`))),
  CONSTRAINT `chk_hashtag` CHECK (regexp_like(`hashtag`,_utf8mb4'^[a-zA-Z0-9_]+$'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interest`
--

DROP TABLE IF EXISTS `interest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `interest` (
  `name` varchar(20) COLLATE utf8mb4_0900_as_cs NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interest`
--

LOCK TABLES `interest` WRITE;
/*!40000 ALTER TABLE `interest` DISABLE KEYS */;
/*!40000 ALTER TABLE `interest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `labels`
--

DROP TABLE IF EXISTS `labels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `labels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `publication_id` int unsigned NOT NULL,
  `interest_name` varchar(20) COLLATE utf8mb4_0900_as_cs NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `chk_label_unique` (`publication_id`,`interest_name`),
  KEY `interest_name` (`interest_name`),
  CONSTRAINT `labels_ibfk_1` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`id`),
  CONSTRAINT `labels_ibfk_2` FOREIGN KEY (`interest_name`) REFERENCES `interest` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `labels`
--

LOCK TABLES `labels` WRITE;
/*!40000 ALTER TABLE `labels` DISABLE KEYS */;
/*!40000 ALTER TABLE `labels` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `before_insert_labels_max` BEFORE INSERT ON `labels` FOR EACH ROW BEGIN
    IF (SELECT COUNT(*) FROM labels WHERE publication_id = NEW.publication_id) >= 2 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Solo puede haber un máximo de dos etiquetas por publicación.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2016_06_01_000001_create_oauth_auth_codes_table',1),(2,'2016_06_01_000002_create_oauth_access_tokens_table',1),(3,'2016_06_01_000003_create_oauth_refresh_tokens_table',1),(4,'2016_06_01_000004_create_oauth_clients_table',1),(5,'2016_06_01_000005_create_oauth_personal_access_clients_table',1),(6,'2019_12_14_000001_create_personal_access_tokens_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `content` text COLLATE utf8mb4_0900_as_cs NOT NULL,
  `is_read` tinyint(1) DEFAULT '0',
  `timestamp` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_profile` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `client_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_tokens`
--

LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
INSERT INTO `oauth_access_tokens` VALUES ('6d8975a655266d876a82b8a8453950c5bfa0497a2608b96e0ffd5188adc2641e8580b695461ee9f2',1,'9d71f1dc-9d29-4af9-a908-13d84ad58af7',NULL,'[]',0,'2024-11-11 19:11:20','2024-11-11 19:11:20','2024-11-12 16:11:20'),('ec907e4a446d2a7aac7eb7d4f40405fa6d7675063071868b2cf81d2c9c61b544ac46e5d9cc8cfe1d',1,'9d71f1dc-9d29-4af9-a908-13d84ad58af7',NULL,'[]',0,'2024-11-11 19:03:07','2024-11-11 19:03:07','2024-11-12 16:03:07');
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `client_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_auth_codes`
--

LOCK TABLES `oauth_auth_codes` WRITE;
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_clients` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_clients`
--

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
INSERT INTO `oauth_clients` VALUES ('9d71f1dc-9d29-4af9-a908-13d84ad58af7',NULL,'Cromalink API Backoffice Password Grant Client','AOHWJYskKFNrgxUKtIYCZpNIAr4oMmyPJLBKlhtY','users','http://localhost',0,1,0,'2024-11-11 19:02:09','2024-11-11 19:02:09');
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `client_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_personal_access_clients`
--

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_refresh_tokens`
--

LOCK TABLES `oauth_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
INSERT INTO `oauth_refresh_tokens` VALUES ('2923b95134b461fd431b90393cd94f5a8b84bf122cb531d2874a10562e69595a4fda92ca3101fca1','ec907e4a446d2a7aac7eb7d4f40405fa6d7675063071868b2cf81d2c9c61b544ac46e5d9cc8cfe1d',0,'2024-11-26 16:03:07'),('f5a3817473972e34b8c38edfcc998e069bcc007b8ee33da5348d2fd5398505daec0afd17463aecac','6d8975a655266d876a82b8a8453950c5bfa0497a2608b96e0ffd5188adc2641e8580b695461ee9f2',0,'2024-11-26 16:11:20');
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publications`
--

DROP TABLE IF EXISTS `publications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publications` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(60) COLLATE utf8mb4_0900_as_cs NOT NULL,
  `content` text COLLATE utf8mb4_0900_as_cs,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `published_by` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `published_by` (`published_by`),
  CONSTRAINT `publications_ibfk_1` FOREIGN KEY (`published_by`) REFERENCES `user_profile` (`user_id`),
  CONSTRAINT `chk_publications_created_at` CHECK ((`created_at` <= sysdate())),
  CONSTRAINT `chk_publications_updated_at` CHECK (((`updated_at` <= sysdate()) and (`updated_at` >= `created_at`)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publications`
--

LOCK TABLES `publications` WRITE;
/*!40000 ALTER TABLE `publications` DISABLE KEYS */;
/*!40000 ALTER TABLE `publications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reactions`
--

DROP TABLE IF EXISTS `reactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reactions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `publication_id` int unsigned NOT NULL,
  `reaction_by` int unsigned NOT NULL,
  `type` varchar(2) COLLATE utf8mb4_0900_as_cs NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `chk_reactionpub__unique` (`publication_id`,`reaction_by`),
  KEY `reaction_by` (`reaction_by`),
  CONSTRAINT `reactions_ibfk_1` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`id`),
  CONSTRAINT `reactions_ibfk_2` FOREIGN KEY (`reaction_by`) REFERENCES `user_profile` (`user_id`),
  CONSTRAINT `chk_reaction_type` CHECK ((`type` in (_utf8mb4'MG',_utf8mb4'ME',_utf8mb4'MD')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reactions`
--

LOCK TABLES `reactions` WRITE;
/*!40000 ALTER TABLE `reactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `reactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resources`
--

DROP TABLE IF EXISTS `resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resources` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `publication_id` int unsigned NOT NULL,
  `type` varchar(8) COLLATE utf8mb4_0900_as_cs NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_0900_as_cs DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `publication_id` (`publication_id`),
  CONSTRAINT `resources_ibfk_1` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`id`),
  CONSTRAINT `chk_resource_type` CHECK ((`type` in (_utf8mb4'external',_utf8mb4'video',_utf8mb4'audio',_utf8mb4'image')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resources`
--

LOCK TABLES `resources` WRITE;
/*!40000 ALTER TABLE `resources` DISABLE KEYS */;
/*!40000 ALTER TABLE `resources` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `before_insert_resources_max` BEFORE INSERT ON `resources` FOR EACH ROW BEGIN
    IF (SELECT COUNT(*) FROM resources WHERE publication_id = NEW.publication_id) >= 5 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Solo puede haber un máximo de cinco recursos referenciando a la misma publicación.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `social_event_participants`
--

DROP TABLE IF EXISTS `social_event_participants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_event_participants` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `social_event_id` int unsigned NOT NULL,
  `participant_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `chk_participant_unique` (`social_event_id`,`participant_id`),
  KEY `participant_id` (`participant_id`),
  CONSTRAINT `social_event_participants_ibfk_1` FOREIGN KEY (`social_event_id`) REFERENCES `social_events` (`publication_id`),
  CONSTRAINT `social_event_participants_ibfk_2` FOREIGN KEY (`participant_id`) REFERENCES `user_profile` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_event_participants`
--

LOCK TABLES `social_event_participants` WRITE;
/*!40000 ALTER TABLE `social_event_participants` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_event_participants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_events`
--

DROP TABLE IF EXISTS `social_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_events` (
  `publication_id` int unsigned NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL,
  `starts_at` datetime NOT NULL,
  `ends_at` datetime DEFAULT NULL,
  `description` text COLLATE utf8mb4_0900_as_cs,
  `country_code` char(4) COLLATE utf8mb4_0900_as_cs NOT NULL,
  `longitude` decimal(9,6) DEFAULT NULL,
  `latitude` decimal(8,6) DEFAULT NULL,
  PRIMARY KEY (`publication_id`),
  KEY `country_code` (`country_code`),
  CONSTRAINT `social_events_ibfk_1` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`id`),
  CONSTRAINT `social_events_ibfk_2` FOREIGN KEY (`country_code`) REFERENCES `country` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_events`
--

LOCK TABLES `social_events` WRITE;
/*!40000 ALTER TABLE `social_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_admin`
--

DROP TABLE IF EXISTS `user_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_admin` (
  `user_id` int unsigned NOT NULL,
  `first_name` varchar(30) COLLATE utf8mb4_0900_as_cs NOT NULL,
  `last_name` varchar(30) COLLATE utf8mb4_0900_as_cs NOT NULL,
  `role` varchar(10) COLLATE utf8mb4_0900_as_cs NOT NULL,
  `avatar` mediumblob,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `user_admin_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chk_admin_role` CHECK ((`role` in (_utf8mb4'Moderador',_utf8mb4'Admin')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_admin`
--

LOCK TABLES `user_admin` WRITE;
/*!40000 ALTER TABLE `user_admin` DISABLE KEYS */;
INSERT INTO `user_admin` VALUES (1,'Martin','Acosta','Admin',_binary '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yKBHQaTLtMTIp2bsN/T+VX7MNcSMYmREjIk9yRxjP45rF0qXERySBu25zx+P5Vp6ZvSGd5gFgaUjco5J54z6cikMswOpEjLsy3BJHU5POD+P5Vy/iJwJwuSWHcjt0rfciGKSMA7gfvY/L8q5XVCrygrkd8EYxQBW42Yz1pFbaM1GDyKk/h5HSgBu7k9qsxyYcBwfY1XwO9LvygU9u9MCx1BcYByVYetNZtw5JUgYH09KiV+TknB70m75QDxg5BHagBzsSArDIxwTxUJ44INOZsjI4z1A6U0fp6UAHI7fnSZyOlFBNACGkoooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKf/AA0ylJ4xQBND71YJ5B6VWi4HsamB4O/9KBF20fICgE57Z79v51uaa7G2COA8bDlR947ePyrnozsRcEjnPFaVi7CQKoPPHHA6/wD1qBl3U5C6hgrAhcBV55Hc/XJNc1qP31BGGCgfpXU7fOhmy48zI3c9TkjIPTFcxqY/fdMcYApAUyOKATjBJxSZ9KQUwLZiZowR1qscg4qxGxMeSenFRS4bnvQBH070vX602gUAOOMZFIMUn8qTNADjTTRn0ooASiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAliGeKnGCASOQMVDH29qlYhgMfjQBIr8Y43DoTWjp7YK8kn+dZBODxzVuymK8A4NAHTK6lcYVATkADOCcfl/8AWrmdXjZZmLMWyeDiughkRrUjeN4wQx4yB2/KsXW8ttK7dvoKQzGJ4oHWg0CmInXPYn8aY+CfQ0IeKH55oAYfakoNJQAtJRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQA4MacGyMGo6cpAzkZoAXOOlWrUINzSNtIGQpGd3NVM809WGeKAN9Li3ZN0YZCvBBOQefz/8A1VRvn35AIOO4OaqrcfMc5IPBGaV5SwDNgHBI4oArSLtzTKV23MTTaAHA/lQaBjFHagBKSiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigApR34pKKACiiigApc0lFAC5ozSUUAFLSUUALQcYoozQAlFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAf//Z'),(2,'Matias','Rancel','Admin',NULL),(3,'Martín','Lorenzo','Admin',NULL),(4,'Lucas','Sancristobal','Admin',NULL),(5,'Admin','Cromalink','Admin',NULL),(6,'Moderador','Cromalink','Moderador',NULL);
/*!40000 ALTER TABLE `user_admin` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `before_insert_user_admin_not_profile` BEFORE INSERT ON `user_admin` FOR EACH ROW BEGIN
    IF EXISTS (SELECT 1 FROM user_profile WHERE user_id = NEW.user_id) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El usuario ya existe en user_profile y no puede tener un perfil en user_admin.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `before_update_user_admin` BEFORE UPDATE ON `user_admin` FOR EACH ROW BEGIN
    IF EXISTS (SELECT 1 FROM user_profile WHERE user_id = NEW.user_id) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El usuario ya existe en user_profile y no puede tener un perfil en user_admin.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `user_profile`
--

DROP TABLE IF EXISTS `user_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_profile` (
  `user_id` int unsigned NOT NULL,
  `username` varchar(30) COLLATE utf8mb4_0900_as_cs NOT NULL,
  `first_name` varchar(30) COLLATE utf8mb4_0900_as_cs NOT NULL,
  `last_name` varchar(30) COLLATE utf8mb4_0900_as_cs NOT NULL,
  `biography` text COLLATE utf8mb4_0900_as_cs,
  `birth_date` date NOT NULL,
  `country_code` char(4) COLLATE utf8mb4_0900_as_cs NOT NULL,
  `avatar` mediumblob,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`),
  KEY `country_code` (`country_code`),
  CONSTRAINT `user_profile_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_profile_ibfk_2` FOREIGN KEY (`country_code`) REFERENCES `country` (`code`),
  CONSTRAINT `chk_user_profile_username` CHECK (regexp_like(`username`,_utf8mb4'^[a-zA-Z0-9_.]+$'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_profile`
--

LOCK TABLES `user_profile` WRITE;
/*!40000 ALTER TABLE `user_profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_profile` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `before_insert_user_profile_adult` BEFORE INSERT ON `user_profile` FOR EACH ROW BEGIN
    IF NEW.birth_date >= CURDATE() - INTERVAL 18 YEAR THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La fecha de nacimiento debe ser al menos 18 años antes de la fecha actual.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `before_insert_user_profile_not_admin` BEFORE INSERT ON `user_profile` FOR EACH ROW BEGIN
    IF EXISTS (SELECT 1 FROM user_admin WHERE user_id = NEW.user_id) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El usuario ya existe en user_admin y no puede tener un perfil en user_profile.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `before_update_user_profile` BEFORE UPDATE ON `user_profile` FOR EACH ROW BEGIN
    IF NEW.birth_date >= CURDATE() - INTERVAL 18 YEAR THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La fecha de nacimiento debe ser al menos 18 años antes de la fecha actual.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_0900_as_cs NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_0900_as_cs NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `active` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `email_verified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  CONSTRAINT `chk_users_created_at` CHECK ((`created_at` <= sysdate())),
  CONSTRAINT `chk_users_email` CHECK (regexp_like(`email`,_utf8mb4'\\b[\\w.-]+@[\\w.-]+.\\w{2,4}\\b')),
  CONSTRAINT `chk_users_last_login` CHECK (((`last_login` <= sysdate()) or (`last_login` is null))),
  CONSTRAINT `chk_users_password` CHECK (regexp_like(`password`,_utf8mb4'\\$2[a-z]*\\$\\d\\d\\$[\\s\\S]{53}')),
  CONSTRAINT `chk_users_updated_at` CHECK (((`updated_at` <= sysdate()) and (`updated_at` >= `created_at`)))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'ma@acrolix.tech','$2a$10$zQ1mEJqx7.oJ7l1FPQ1evOfMStejKYueromRHIjwSy5qeJmAKc7Ee','2024-11-11 16:11:20',1,'2024-11-11 16:01:52','2024-11-11 16:11:20','2024-11-11 16:01:52'),(2,'mr@acrolix.tech','$2a$10$zQ1mEJqx7.oJ7l1FPQ1evOfMStejKYueromRHIjwSy5qeJmAKc7Ee',NULL,1,'2024-11-11 16:01:52','2024-11-11 16:01:52','2024-11-11 16:01:52'),(3,'ml@acrolix.tech','$2a$10$zQ1mEJqx7.oJ7l1FPQ1evOfMStejKYueromRHIjwSy5qeJmAKc7Ee',NULL,1,'2024-11-11 16:01:52','2024-11-11 16:01:52','2024-11-11 16:01:52'),(4,'ls@acrolix.tech','$2a$10$zQ1mEJqx7.oJ7l1FPQ1evOfMStejKYueromRHIjwSy5qeJmAKc7Ee',NULL,1,'2024-11-11 16:01:52','2024-11-11 16:01:52','2024-11-11 16:01:52'),(5,'test.admin@cromalink.acrolix.tech','$2a$10$zQ1mEJqx7.oJ7l1FPQ1evOfMStejKYueromRHIjwSy5qeJmAKc7Ee',NULL,1,'2024-11-11 16:01:52','2024-11-11 16:01:52','2024-11-11 16:01:52'),(6,'test.mod@cromalink.acrolix.tech','$2a$10$zQ1mEJqx7.oJ7l1FPQ1evOfMStejKYueromRHIjwSy5qeJmAKc7Ee',NULL,1,'2024-11-11 16:01:52','2024-11-11 16:01:52','2024-11-11 16:01:52');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_comment`
--

DROP TABLE IF EXISTS `users_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_comment` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `publication_id` int unsigned NOT NULL,
  `published_by` int unsigned NOT NULL,
  `content` text COLLATE utf8mb4_0900_as_cs NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `publication_id` (`publication_id`),
  KEY `published_by` (`published_by`),
  CONSTRAINT `users_comment_ibfk_1` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`id`),
  CONSTRAINT `users_comment_ibfk_2` FOREIGN KEY (`published_by`) REFERENCES `user_profile` (`user_id`),
  CONSTRAINT `chk_comment_created_at` CHECK ((`created_at` <= sysdate())),
  CONSTRAINT `chk_comment_updated_at` CHECK (((`updated_at` <= sysdate()) and (`updated_at` >= `created_at`)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_comment`
--

LOCK TABLES `users_comment` WRITE;
/*!40000 ALTER TABLE `users_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_followers`
--

DROP TABLE IF EXISTS `users_followers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_followers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `followed_id` int unsigned NOT NULL,
  `follower_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_follower_followed` (`follower_id`,`followed_id`),
  KEY `followed_id` (`followed_id`),
  CONSTRAINT `users_followers_ibfk_1` FOREIGN KEY (`follower_id`) REFERENCES `user_profile` (`user_id`),
  CONSTRAINT `users_followers_ibfk_2` FOREIGN KEY (`followed_id`) REFERENCES `user_profile` (`user_id`),
  CONSTRAINT `chk_follower_followed` CHECK ((`follower_id` <> `followed_id`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_followers`
--

LOCK TABLES `users_followers` WRITE;
/*!40000 ALTER TABLE `users_followers` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_followers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_groups`
--

DROP TABLE IF EXISTS `users_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_groups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  `role` varchar(8) COLLATE utf8mb4_0900_as_cs NOT NULL DEFAULT 'miembro',
  PRIMARY KEY (`id`),
  UNIQUE KEY `chk_users_groups_user_unique` (`group_id`,`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `users_groups_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `users_groups_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user_profile` (`user_id`),
  CONSTRAINT `chk_users_groups_role` CHECK ((`role` in (_utf8mb4'miembro',_utf8mb4'moderador',_utf8mb4'propietario')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_groups`
--

LOCK TABLES `users_groups` WRITE;
/*!40000 ALTER TABLE `users_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_interests`
--

DROP TABLE IF EXISTS `users_interests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_interests` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `interest_name` varchar(20) COLLATE utf8mb4_0900_as_cs NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `chk_user_interest_unique` (`user_id`,`interest_name`),
  KEY `interest_name` (`interest_name`),
  CONSTRAINT `users_interests_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_profile` (`user_id`),
  CONSTRAINT `users_interests_ibfk_2` FOREIGN KEY (`interest_name`) REFERENCES `interest` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_interests`
--

LOCK TABLES `users_interests` WRITE;
/*!40000 ALTER TABLE `users_interests` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_interests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_messages`
--

DROP TABLE IF EXISTS `users_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_messages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` int unsigned NOT NULL,
  `recipient_id` int unsigned NOT NULL,
  `content` text COLLATE utf8mb4_0900_as_cs NOT NULL,
  `timestamp` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `chk_unique_users_messages` (`sender_id`,`recipient_id`,`timestamp`),
  KEY `recipient_id` (`recipient_id`),
  CONSTRAINT `users_messages_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `user_profile` (`user_id`),
  CONSTRAINT `users_messages_ibfk_2` FOREIGN KEY (`recipient_id`) REFERENCES `user_profile` (`user_id`),
  CONSTRAINT `chk_sender_recipient` CHECK ((`sender_id` <> `recipient_id`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_messages`
--

LOCK TABLES `users_messages` WRITE;
/*!40000 ALTER TABLE `users_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'cromalink_db'
--

--
-- Dumping routines for database 'cromalink_db'
--
/*!50003 DROP PROCEDURE IF EXISTS `registrarUsuarioAdmin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `registrarUsuarioAdmin`(
    IN email VARCHAR(255),
    IN password VARCHAR(60),
    IN first_name VARCHAR(30),
    IN last_name VARCHAR(30),
    IN role VARCHAR(10),
    IN active BOOLEAN,
    IN email_verified_at DATETIME
)
BEGIN
    START TRANSACTION;

    INSERT INTO users (email, password, active, email_verified_at) VALUES (email, password , active, email_verified_at);
    SET @last_user_id = LAST_INSERT_ID();
    INSERT INTO user_admin (user_id, first_name, last_name, role) VALUES (@last_user_id, first_name, last_name, role);

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-11 16:30:28

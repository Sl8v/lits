-- MySQL dump 10.13  Distrib 5.5.52, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: downloads
-- ------------------------------------------------------
-- Server version	5.5.52-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP TABLE IF EXISTS `files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

-- CREATE TABLE `files` (
--   `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
--   `path_id` int(11) unsigned NOT NULL,
--   `mime_id` int(11) unsigned NOT NULL,
--   `name` varchar(255) NOT NULL,
--   PRIMARY KEY (`id`),
--   KEY `path_id` (`path_id`),
--   KEY `mime_id` (`mime_id`),
--   CONSTRAINT `files_ibfk_1` FOREIGN KEY (`path_id`) REFERENCES `paths` (`id`),
--   CONSTRAINT `files_ibfk_2` FOREIGN KEY (`mime_id`) REFERENCES `mimes` (`id`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- MIME::Types.each_with_index { |v,m| puts m+1; puts v}  !!!!!!!!!!!!!!!!!!

DROP TABLE IF EXISTS `mimetypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mimetypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formulas`
--

-- LOCK TABLES `formulas` WRITE;
-- /*!40000 ALTER TABLE `formulas` DISABLE KEYS */;
-- INSERT INTO `formulas` VALUES (1,1,'tri_base','base*height/2',2),(2,1,'tri_heron','s=((a+b+c)/2);Math.sqrt(s*(s-a)*(s-b)*(s-c))',3),(3,2,'circle','3.14*radius**2',1),(4,3,'rectangle','height*width',2);
-- /*!40000 ALTER TABLE `formulas` ENABLE KEYS */;
-- UNLOCK TABLES;

--
-- Table structure for table `results`
--

DROP TABLE IF EXISTS `results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `results` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mimetype_id` int(11) unsigned NOT NULL,
  `file_id` int(11) unsigned NOT NULL,
  -- `result` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mimetype_id` (`mimetype_id`),
  KEY `file_id` (`file_id`)
  -- CONSTRAINT `files_ibfk_1` FOREIGN KEY (`mimetype_id`) REFERENCES `mimetypes` (`id`),
  -- CONSTRAINT `files_ibfk_2` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `results`
--

LOCK TABLES `results` WRITE;
/*!40000 ALTER TABLE `results` DISABLE KEYS */;
/*!40000 ALTER TABLE `results` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-09-20  0:28:56

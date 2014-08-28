CREATE DATABASE  IF NOT EXISTS `photography` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `photography`;
-- MySQL dump 10.14  Distrib 5.5.38-MariaDB, for Linux (x86_64)
--
-- Host: zeus.jonathangazeley.com    Database: photography
-- ------------------------------------------------------
-- Server version	5.1.73

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

--
-- Table structure for table `CAMERA`
--

DROP TABLE IF EXISTS `CAMERA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CAMERA` (
  `camera_id` int(11) NOT NULL AUTO_INCREMENT,
  `manufacturer_id` int(11) DEFAULT NULL,
  `model` varchar(45) DEFAULT NULL,
  `mount_id` int(11) DEFAULT NULL,
  `format_id` int(11) DEFAULT NULL,
  `focus_type_id` int(11) DEFAULT NULL,
  `metering` tinyint(1) DEFAULT NULL,
  `coupled_metering` tinyint(1) DEFAULT NULL,
  `metering_pattern_id` int(11) DEFAULT NULL,
  `metering_type_id` int(11) DEFAULT NULL,
  `body_type_id` int(11) DEFAULT NULL,
  `weight` varchar(45) DEFAULT NULL,
  `acquired` date DEFAULT NULL,
  `cost` decimal(6,2) DEFAULT NULL,
  `introduced` smallint(6) DEFAULT NULL,
  `discontinued` smallint(6) DEFAULT NULL,
  `serial` varchar(45) DEFAULT NULL,
  `datecode` varchar(12) DEFAULT NULL,
  `manufactured` smallint(6) DEFAULT NULL,
  `own` tinyint(1) DEFAULT NULL,
  `negative_size_id` int(11) DEFAULT NULL,
  `shutter_type_id` int(11) DEFAULT NULL,
  `cable_release` tinyint(1) DEFAULT NULL,
  `viewfinder_coverage` int(11) DEFAULT NULL,
  `power_drive` tinyint(1) DEFAULT NULL,
  `continuous_fps` decimal(3,1) DEFAULT NULL,
  `video` tinyint(1) DEFAULT NULL,
  `digital` tinyint(1) DEFAULT NULL,
  `fixed_mount` tinyint(1) DEFAULT NULL,
  `lens_id` int(11) DEFAULT NULL,
  `battery_qty` int(11) DEFAULT NULL,
  `battery_type` int(11) DEFAULT NULL,
  `notes` text,
  `lost` date DEFAULT NULL,
  `lost_price` decimal(6,2) DEFAULT NULL,
  `source` varchar(150) DEFAULT NULL,
  `M` tinyint(1) DEFAULT NULL,
  `Av` tinyint(1) DEFAULT NULL,
  `Tv` tinyint(1) DEFAULT NULL,
  `P` tinyint(1) DEFAULT NULL,
  `min_shutter` varchar(6) DEFAULT NULL,
  `max_shutter` varchar(6) DEFAULT NULL,
  `bulb` tinyint(1) DEFAULT NULL,
  `time` tinyint(1) DEFAULT NULL,
  `min_iso` int(11) DEFAULT NULL,
  `max_iso` int(11) DEFAULT NULL,
  `af_points` tinyint(4) DEFAULT NULL,
  `int_flash` tinyint(1) DEFAULT NULL,
  `ext_flash` tinyint(1) DEFAULT NULL,
  `pc_sync` tinyint(1) DEFAULT NULL,
  `hotshoe` tinyint(1) DEFAULT NULL,
  `coldshoe` tinyint(1) DEFAULT NULL,
  `x_sync` varchar(6) DEFAULT NULL,
  `meter_min_ev` tinyint(4) DEFAULT NULL,
  `meter_max_ev` tinyint(4) DEFAULT NULL,
  `condition_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`camera_id`),
  KEY `manufacturer_id` (`manufacturer_id`),
  KEY `body_type_id` (`body_type_id`),
  KEY `fk_body_type` (`body_type_id`),
  KEY `fk_focus_type` (`focus_type_id`),
  KEY `fk_mount` (`mount_id`),
  KEY `fk_format` (`format_id`),
  KEY `fk_manufacturer` (`manufacturer_id`),
  KEY `fk_metering_type` (`metering_type_id`),
  KEY `fk_negative_size_id` (`negative_size_id`),
  KEY `fk_shutter_type_id` (`shutter_type_id`),
  KEY `fk_CAMERA_3_idx` (`condition_id`),
  KEY `fk_CAMERA_3_idx1` (`metering_pattern_id`),
  CONSTRAINT `fk_body_type` FOREIGN KEY (`body_type_id`) REFERENCES `BODY_TYPE` (`body_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_CAMERA_1` FOREIGN KEY (`negative_size_id`) REFERENCES `NEGATIVE_SIZE` (`negative_size_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_CAMERA_2` FOREIGN KEY (`shutter_type_id`) REFERENCES `SHUTTER_TYPE` (`shutter_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_CAMERA_3` FOREIGN KEY (`metering_pattern_id`) REFERENCES `METERING_PATTERN` (`metering_pattern_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_condition` FOREIGN KEY (`condition_id`) REFERENCES `CONDITION` (`condition_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_focus_type` FOREIGN KEY (`focus_type_id`) REFERENCES `FOCUS_TYPE` (`focus_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_format` FOREIGN KEY (`format_id`) REFERENCES `FORMAT` (`format_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_manufacturer` FOREIGN KEY (`manufacturer_id`) REFERENCES `MANUFACTURER` (`manufacturer_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_metering_type` FOREIGN KEY (`metering_type_id`) REFERENCES `METERING_TYPE` (`metering_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_mount` FOREIGN KEY (`mount_id`) REFERENCES `MOUNT` (`mount_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-08-28 23:32:25

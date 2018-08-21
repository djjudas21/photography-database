/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NEGATIVE` (
  `negative_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique ID of this negative',
  `film_id` int(11) DEFAULT NULL COMMENT 'ID of the film that this negative belongs to',
  `frame` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(145) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` datetime DEFAULT NULL COMMENT 'Date & time on which this picture was taken',
  `lens_id` int(11) DEFAULT NULL COMMENT 'ID of lens used to take this picture',
  `shutter_speed` varchar(45) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Shutter speed used to take this picture',
  `aperture` decimal(4,1) DEFAULT NULL COMMENT 'Aperture used to take this picture (numerical part only)',
  `filter_id` int(11) DEFAULT NULL COMMENT 'ID of filter used to take this picture',
  `teleconverter_id` int(11) DEFAULT NULL COMMENT 'ID of teleconverter used to take this picture',
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `mount_adapter_id` int(11) DEFAULT NULL COMMENT 'ID of lens mount adapter used to take this pciture',
  `focal_length` int(11) DEFAULT NULL COMMENT 'If a zoom lens was used, specify the focal length of the lens',
  `latitude` decimal(9,6) DEFAULT NULL COMMENT 'Latitude of the location where the picture was taken',
  `longitude` decimal(9,6) DEFAULT NULL COMMENT 'Longitude of the location where the picture was taken',
  `filename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `flash` tinyint(1) DEFAULT NULL COMMENT 'Whether flash was used',
  `metering_mode` int(11) DEFAULT NULL COMMENT 'MeteringMode ID as defined in EXIF spec',
  `exposure_program` int(11) DEFAULT NULL COMMENT 'ExposureProgram ID as defined in EXIF spec',
  `photographer_id` int(11) DEFAULT NULL COMMENT 'ID of person who took this photograph',
  PRIMARY KEY (`negative_id`),
  KEY `fk_NEGATIVE_1` (`film_id`),
  KEY `fk_NEGATIVE_2` (`lens_id`),
  KEY `fk_NEGATIVE_3` (`filter_id`),
  KEY `fk_NEGATIVE_4` (`teleconverter_id`),
  KEY `fk_NEGATIVE_5` (`mount_adapter_id`),
  KEY `fk_NEGATIVE_6_idx` (`metering_mode`),
  KEY `fk_NEGATIVE_7_idx` (`exposure_program`),
  KEY `fk_NEGATIVE_8_idx` (`photographer_id`),
  KEY `fk_NEGATIVE_9_idx` (`shutter_speed`),
  CONSTRAINT `fk_NEGATIVE_1` FOREIGN KEY (`film_id`) REFERENCES `FILM` (`film_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_NEGATIVE_2` FOREIGN KEY (`lens_id`) REFERENCES `LENS` (`lens_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_NEGATIVE_3` FOREIGN KEY (`filter_id`) REFERENCES `FILTER` (`filter_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_NEGATIVE_4` FOREIGN KEY (`teleconverter_id`) REFERENCES `TELECONVERTER` (`teleconverter_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_NEGATIVE_5` FOREIGN KEY (`mount_adapter_id`) REFERENCES `MOUNT_ADAPTER` (`mount_adapter_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_NEGATIVE_6` FOREIGN KEY (`metering_mode`) REFERENCES `METERING_MODE` (`metering_mode_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_NEGATIVE_7` FOREIGN KEY (`exposure_program`) REFERENCES `EXPOSURE_PROGRAM` (`exposure_program_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_NEGATIVE_8` FOREIGN KEY (`photographer_id`) REFERENCES `PERSON` (`person_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_NEGATIVE_9` FOREIGN KEY (`shutter_speed`) REFERENCES `SHUTTER_SPEED` (`shutter_speed`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Table to catalog negatives (which includes positives/slide too). Negatives are created by cameras, belong to films and can be used to create scans or prints.';
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LENS` (
  `lens_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique ID for this lens',
  `mount_id` int(11) DEFAULT NULL COMMENT 'Denotes the ID of the lens mount, if this is an interchangeable lens',
  `zoom` tinyint(1) DEFAULT NULL COMMENT 'Whether this is a zoom lens',
  `min_focal_length` int(11) DEFAULT NULL COMMENT 'Shortest focal length of this lens, in mm',
  `max_focal_length` int(11) DEFAULT NULL COMMENT 'Longest focal length of this lens, in mm',
  `manufacturer_id` int(11) DEFAULT NULL COMMENT 'ID of the manufacturer of this lens',
  `model` varchar(45) DEFAULT NULL COMMENT 'Model name of this lens',
  `closest_focus` int(11) DEFAULT NULL COMMENT 'The closest focus possible with this lens, in cm',
  `max_aperture` decimal(4,1) DEFAULT NULL COMMENT 'Maximum (widest) aperture available on this lens (numerical part only, e.g. 2.8)',
  `min_aperture` decimal(4,1) DEFAULT NULL COMMENT 'Minimum (narrowest) aperture available on this lens (numerical part only, e.g. 22)',
  `elements` int(11) DEFAULT NULL COMMENT 'Number of optical lens elements',
  `groups` int(11) DEFAULT NULL COMMENT 'Number of optical groups',
  `weight` int(11) DEFAULT NULL COMMENT 'Weight of this lens, in grammes (g)',
  `nominal_min_angle_diag` int(11) DEFAULT NULL COMMENT 'Nominal minimum diagonal field of view from manufacturer''s specs',
  `nominal_max_angle_diag` int(11) DEFAULT NULL COMMENT 'Nominal maximum diagonal field of view from manufacturer''s specs',
  `aperture_blades` int(11) DEFAULT NULL COMMENT 'Number of aperture blades',
  `autofocus` tinyint(1) DEFAULT NULL COMMENT 'Whether this lens has autofocus capability',
  `filter_thread` decimal(4,1) DEFAULT NULL COMMENT 'Diameter of lens filter thread, in mm',
  `magnification` decimal(5,3) DEFAULT NULL COMMENT 'Maximum magnification ratio of the lens, expressed like 0.765',
  `url` varchar(145) DEFAULT NULL COMMENT 'URL to more information about this lens',
  `serial` varchar(45) DEFAULT NULL COMMENT 'Serial number of this lens',
  `date_code` varchar(45) DEFAULT NULL COMMENT 'Date code of this lens, if different from the serial number',
  `introduced` smallint(6) DEFAULT NULL COMMENT 'Year in which this lens model was introduced',
  `discontinued` smallint(6) DEFAULT NULL COMMENT 'Year in which this lens model was discontinued',
  `manufactured` smallint(6) DEFAULT NULL COMMENT 'Year in which this specific lens was manufactured',
  `negative_size_id` int(11) DEFAULT NULL COMMENT 'ID of the negative size which this lens is designed for',
  `acquired` date DEFAULT NULL COMMENT 'Date on which this lens was acquired',
  `cost` decimal(6,2) DEFAULT NULL COMMENT 'Price paid for this lens in local currency units',
  `fixed_mount` tinyint(1) DEFAULT NULL COMMENT 'Whether this is a fixed lens (i.e. on a compact camera)',
  `notes` text COMMENT 'Freeform notes field',
  `own` tinyint(1) DEFAULT NULL COMMENT 'Whether we currently own this lens',
  `lost` date DEFAULT NULL COMMENT 'Date on which lens was lost/sold/disposed',
  `lost_price` decimal(6,2) DEFAULT NULL COMMENT 'Price for which the lens was sold',
  `source` varchar(150) DEFAULT NULL COMMENT 'Place where the lens was acquired from',
  `coating` varchar(45) DEFAULT NULL COMMENT 'Notes about the lens coating type',
  `hood` varchar(45) DEFAULT NULL COMMENT 'Model number of the compatible lens hood',
  `hood_id` int(11) DEFAULT NULL COMMENT 'ID of the hood in the HOOD table',
  `exif_lenstype` varchar(45) DEFAULT NULL COMMENT 'EXIF LensID integer, if this lens has one officially registered. See documentation at http://www.sno.phy.queensu.ca/~phil/exiftool/TagNames/',
  `rectilinear` tinyint(1) DEFAULT NULL COMMENT 'Whether this is a rectilinear lens',
  `length` int(11) DEFAULT NULL COMMENT 'Length of lens in mm',
  `diameter` int(11) DEFAULT NULL COMMENT 'Width of lens in mm',
  `condition_id` int(11) DEFAULT NULL COMMENT 'Denotes the cosmetic condition of the camera',
  `image_circle` int(11) DEFAULT NULL COMMENT 'Diameter of image circle projected by lens, in mm',
  `formula` varchar(45) DEFAULT NULL COMMENT 'Name of the type of lens formula (e.g. Tessar)',
  `shutter_model` varchar(45) DEFAULT NULL COMMENT 'Name of the integrated shutter, if any',
  PRIMARY KEY (`lens_id`),
  KEY `fk_LENS_2` (`manufacturer_id`),
  KEY `fk_LENS_3` (`mount_id`),
  KEY `fk_LENS_4` (`negative_size_id`),
  KEY `fk_LENS_1_idx` (`condition_id`),
  CONSTRAINT `fk_LENS_1` FOREIGN KEY (`condition_id`) REFERENCES `CONDITION` (`condition_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_LENS_2` FOREIGN KEY (`manufacturer_id`) REFERENCES `MANUFACTURER` (`manufacturer_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_LENS_3` FOREIGN KEY (`mount_id`) REFERENCES `MOUNT` (`mount_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_LENS_4` FOREIGN KEY (`negative_size_id`) REFERENCES `NEGATIVE_SIZE` (`negative_size_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
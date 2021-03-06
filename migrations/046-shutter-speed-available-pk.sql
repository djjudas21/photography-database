ALTER TABLE `SHUTTER_SPEED_AVAILABLE`
DROP FOREIGN KEY `fk_SHUTTER_SPEED_AVAILABLE_1`;

ALTER TABLE `SHUTTER_SPEED_AVAILABLE`
ADD PRIMARY KEY (`cameramodel_id`, `shutter_speed`);

ALTER TABLE `SHUTTER_SPEED_AVAILABLE`
ADD CONSTRAINT `fk_SHUTTER_SPEED_AVAILABLE_1`
  FOREIGN KEY (`shutter_speed`)
  REFERENCES `SHUTTER_SPEED` (`shutter_speed`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

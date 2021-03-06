SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `info_series` (
  `Series ID` tinyint NOT NULL,
  `Model` tinyint NOT NULL,
  `Got` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;
/*!50001 DROP TABLE IF EXISTS `info_series`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50001 VIEW `info_series` AS select `SERIES_MEMBER`.`series_id` AS `Series ID`,concat(`CM`.`manufacturer`,' ',`CAMERAMODEL`.`model`) collate utf8mb4_unicode_ci AS `Model`,if(`CAMERA`.`camera_id` is not null,'✓','✗') AS `Got` from (((`SERIES_MEMBER` left join `CAMERAMODEL` on(`SERIES_MEMBER`.`cameramodel_id` = `CAMERAMODEL`.`cameramodel_id`)) left join `MANUFACTURER` `CM` on(`CAMERAMODEL`.`manufacturer_id` = `CM`.`manufacturer_id`)) left join `CAMERA` on(`CAMERA`.`cameramodel_id` = `CAMERAMODEL`.`cameramodel_id`)) where `CAMERAMODEL`.`model` is not null union select `SERIES_MEMBER`.`series_id` AS `Series ID`,concat(`LM`.`manufacturer`,' ',`LENSMODEL`.`model`) collate utf8mb4_unicode_ci AS `Model`,if(`LENS`.`lens_id` is not null,'✓','✗') AS `Got` from (((`SERIES_MEMBER` left join `LENSMODEL` on(`SERIES_MEMBER`.`lensmodel_id` = `LENSMODEL`.`lensmodel_id`)) left join `MANUFACTURER` `LM` on(`LENSMODEL`.`manufacturer_id` = `LM`.`manufacturer_id`)) left join `LENS` on(`LENS`.`lensmodel_id` = `LENSMODEL`.`lensmodel_id`)) where `LENSMODEL`.`model` is not null */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

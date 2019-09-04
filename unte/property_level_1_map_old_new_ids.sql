CREATE TABLE `property_level_1_map_old_new_ids` (
  `old_id_building` int(10) NOT NULL DEFAULT '0',
  `new_id_building` int(1) NOT NULL DEFAULT '0',
  `old_id_area` int(11) DEFAULT NULL COMMENT 'The Id of the area for this building. This is a FK to the table `209_areas`',
  `new_id_area` int(1) NOT NULL DEFAULT '0',
  `external_id` int(10) NOT NULL DEFAULT '0',
  `external_system_id` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `external_table` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `created_by_id` int(11) NOT NULL,
  `tower` varchar(15) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`external_id`,`external_system_id`,`external_table`,`created_by_id`,`tower`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

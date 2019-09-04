CREATE TABLE `groups_areas_map_old_new_ids` (
  `old_id_area` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `new_id_area` int(1) NOT NULL DEFAULT '0',
  `external_id` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `external_system_id` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `external_table` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `created_by_id` int(11) NOT NULL,
  PRIMARY KEY (`external_id`,`external_system_id`,`external_table`,`created_by_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

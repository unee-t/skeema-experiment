CREATE TABLE `property_level_2_map_old_new_ids` (
  `old_system_id_unit` int(10) NOT NULL DEFAULT '0',
  `new_system_id_unit` int(1) NOT NULL DEFAULT '0',
  `external_id` int(10) NOT NULL DEFAULT '0',
  `external_system_id` longtext COLLATE utf8mb4_unicode_520_ci,
  `external_table` longtext COLLATE utf8mb4_unicode_520_ci,
  `created_by_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE `hmlet_level_1_units` (
  `external_id` int(10) NOT NULL DEFAULT '0',
  `external_system_id` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `external_table` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `syst_created_datetime` datetime DEFAULT NULL,
  `creation_system_id` int(11) DEFAULT NULL,
  `created_by_id` int(11) NOT NULL,
  `creation_method` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `is_obsolete` tinyint(1) DEFAULT '0',
  `order` int(10) DEFAULT '0',
  `area_id` int(11) DEFAULT NULL COMMENT 'The Id of the area for this building. This is a FK to the table `209_areas`',
  `area_id_in_source` int(11) DEFAULT NULL COMMENT 'The Id of the area for this building. This is a FK to the table `209_areas`',
  `is_creation_needed_in_unee_t` int(1) NOT NULL DEFAULT '0',
  `do_not_insert` int(1) NOT NULL DEFAULT '0',
  `unee_t_unit_type` longtext COLLATE utf8mb4_unicode_520_ci,
  `designation` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `tower` varchar(15) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `address_1` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `zip_postal_code` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `country_code` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`external_id`,`external_system_id`,`external_table`,`created_by_id`,`tower`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

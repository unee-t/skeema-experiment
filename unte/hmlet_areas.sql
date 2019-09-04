CREATE TABLE `hmlet_areas` (
  `external_id` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `external_system_id` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `external_table` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `syst_created_datetime` timestamp NULL DEFAULT NULL,
  `creation_system_id` int(11) DEFAULT NULL,
  `created_by_id` int(11) NOT NULL,
  `creation_method` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `is_creation_needed_in_unee_t` int(1) NOT NULL DEFAULT '0',
  `is_obsolete` tinyint(1) DEFAULT '0' COMMENT 'is this obsolete?',
  `is_default` tinyint(1) DEFAULT '0' COMMENT 'This is the default value in our systems',
  `order` int(11) DEFAULT NULL COMMENT 'Order in the list',
  `country_code` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'The country code for that legal entity - See table `185_country` for more details on the country',
  `area_name` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'Designation',
  `area_definition` mediumtext COLLATE utf8mb4_unicode_520_ci COMMENT 'Description/help text',
  PRIMARY KEY (`external_id`,`external_system_id`,`external_table`,`created_by_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

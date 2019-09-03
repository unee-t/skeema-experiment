CREATE TABLE `property_groups_countries` (
  `id_country` int(11) NOT NULL AUTO_INCREMENT,
  `syst_created_datetime` timestamp NULL DEFAULT NULL COMMENT 'When was this record created?',
  `creation_system_id` int(11) NOT NULL DEFAULT '1' COMMENT 'What is the id of the system that was used for the creation of the record?',
  `created_by_id` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'The MEFE ID of the user who created this record',
  `syst_updated_datetime` timestamp NULL DEFAULT NULL COMMENT 'When was this record last updated?',
  `update_system_id` int(11) DEFAULT NULL COMMENT 'What is the id of the system that was used for the last update the record?',
  `updated_by_id` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'The MEFE ID of the user who updated this record',
  `is_obsolete` tinyint(1) DEFAULT '0' COMMENT 'is this obsolete?',
  `is_default` tinyint(1) DEFAULT '0' COMMENT 'This is the default value in our systems',
  `is_system` tinyint(1) DEFAULT '1' COMMENT 'identify the records that are used for critical computation routines and that should be considered as critical for the system',
  `order` int(11) NOT NULL DEFAULT '0' COMMENT 'Order in the list',
  `country_code` varchar(10) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'Designation',
  `country_name` varchar(256) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'Description/help text',
  PRIMARY KEY (`id_country`,`country_code`),
  KEY `search_country_codes` (`country_code`),
  KEY `search_country_names` (`country_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci ROW_FORMAT=DYNAMIC;

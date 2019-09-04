CREATE TABLE `ut_unit_types` (
  `id_property_type` int(11) NOT NULL AUTO_INCREMENT COMMENT 'unique id in this table',
  `syst_created_datetime` timestamp NULL DEFAULT NULL COMMENT 'When was this record created?',
  `creation_system_id` int(11) NOT NULL DEFAULT '1' COMMENT 'What is the id of the system that was used for the creation of the record?',
  `created_by_id` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'The MEFE ID of the user who created this record',
  `syst_updated_datetime` timestamp NULL DEFAULT NULL COMMENT 'When was this record last updated?',
  `update_system_id` int(11) DEFAULT NULL COMMENT 'What is the id of the system that was used for the last update the record?',
  `updated_by_id` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'The MEFE ID of the user who updated this record',
  `order` int(11) DEFAULT NULL COMMENT 'Order in the list',
  `is_level_1` tinyint(1) DEFAULT '0' COMMENT 'This apply to Level 1 properties',
  `is_level_2` tinyint(1) DEFAULT '0' COMMENT 'This apply to Level 2 properties',
  `is_level_3` tinyint(1) DEFAULT '0' COMMENT 'This apply to Level 3 properties',
  `is_obsolete` tinyint(1) DEFAULT '0' COMMENT '1 if this is not in use anymore.',
  `designation` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'The designation',
  `description` text COLLATE utf8mb4_unicode_520_ci COMMENT 'Detailed description',
  PRIMARY KEY (`id_property_type`),
  UNIQUE KEY `unique_unee_t_property_type` (`designation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci ROW_FORMAT=DYNAMIC;

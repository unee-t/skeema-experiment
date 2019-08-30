CREATE TABLE `ut_user_role_types` (
  `id_role_type` mediumint(9) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID in this table',
  `syst_created_datetime` timestamp NULL DEFAULT NULL COMMENT 'When was this record created?',
  `creation_system_id` int(11) DEFAULT NULL COMMENT 'What is the id of the system that was used for the creation of the record?',
  `created_by_id` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'The MEFE ID of the user who created this record',
  `syst_updated_datetime` timestamp NULL DEFAULT NULL COMMENT 'When was this record last updated?',
  `update_system_id` int(11) DEFAULT NULL COMMENT 'What is the id of the system that was used for the last update the record?',
  `updated_by_id` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'The MEFE ID of the user who updated this record',
  `order` int(11) DEFAULT NULL COMMENT 'Order in the list',
  `is_obsolete` tinyint(1) DEFAULT '0' COMMENT '1 if this is not in use anymore.',
  `role_type` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'A name for this role type',
  `bz_description` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'A short, generic description that we include each time we create a new BZ unit.',
  `description` mediumtext COLLATE utf8mb4_unicode_520_ci COMMENT 'Detailed description of this group type',
  PRIMARY KEY (`id_role_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

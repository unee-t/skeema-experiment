CREATE TABLE `uneet_enterprise_organizations` (
  `id_organization` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id in this table',
  `syst_created_datetime` timestamp NULL DEFAULT NULL COMMENT 'When was this record created?',
  `creation_system_id` int(11) DEFAULT NULL COMMENT 'What is the id of the sytem that was used for the creation of the record?',
  `creation_method` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'How was this record created',
  `created_by_id` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'The MEFE ID of the user who created this record',
  `syst_updated_datetime` timestamp NULL DEFAULT NULL COMMENT 'When was this record last updated?',
  `update_system_id` int(11) DEFAULT NULL COMMENT 'What is the id of the sytem that was used for the last update the record?',
  `updated_by_id` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'The MEFE ID of the user who updated this record',
  `update_method` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'How was this record updated?',
  `order` smallint(6) unsigned DEFAULT NULL COMMENT 'Order in the list',
  `is_obsolete` tinyint(1) DEFAULT '0' COMMENT '1 is this API key is revoked or obsolete',
  `designation` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'The Name of the organization',
  `description` text COLLATE utf8mb4_unicode_520_ci COMMENT 'Description of the organization',
  PRIMARY KEY (`id_organization`),
  UNIQUE KEY `unique_organization_name` (`designation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

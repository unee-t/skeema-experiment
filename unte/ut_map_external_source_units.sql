CREATE TABLE `ut_map_external_source_units` (
  `id_map` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id in this table',
  `syst_created_datetime` timestamp NULL DEFAULT NULL COMMENT 'When was this record created?',
  `creation_system_id` int(11) DEFAULT NULL COMMENT 'What is the id of the sytem that was used for the creation of the record?',
  `created_by_id` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'The MEFE ID of the user who created this record',
  `creation_method` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'How was this record created',
  `syst_updated_datetime` timestamp NULL DEFAULT NULL COMMENT 'When was this record last updated?',
  `update_system_id` int(11) DEFAULT NULL COMMENT 'What is the id of the sytem that was used for the last update the record?',
  `updated_by_id` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'The MEFE ID of the user who updated this record',
  `update_method` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'How was this record updated?',
  `organization_id` int(11) unsigned NOT NULL COMMENT 'a FK to the table `uneet_enterprise_organizations` The ID of the organization that created this record',
  `is_obsolete` tinyint(1) DEFAULT '0' COMMENT '1 if we need to remove this unit from the mapping',
  `is_update_needed` tinyint(1) DEFAULT '0' COMMENT '1 if we need to propagate that to downstream systens',
  `unee_t_mefe_unit_id` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'The MEFE ID of the unit - a FK to the Mongo Collection unitMetaData',
  `uneet_created_datetime` timestamp NULL DEFAULT NULL COMMENT 'Timestamp when the unit was created',
  `is_mefe_api_success` tinyint(1) DEFAULT '0' COMMENT '1 if this is a success, 0 if not',
  `mefe_api_error_message` text COLLATE utf8mb4_unicode_520_ci COMMENT 'The error message from the MEFE API (if applicable)',
  `is_unee_t_created_by_me` tinyint(1) DEFAULT '0' COMMENT '1 if this user has been created by this or 0 if the user was existing in Unee-T before',
  `unee_t_unit_type` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'Unknown' COMMENT 'The Unee-T type of unit for this property - this MUST be one of the `designation` in the table `ut_unit_types`',
  `uneet_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'The name of the unit in the BZ database',
  `new_record_id` int(11) NOT NULL COMMENT 'The id of the record in the table `property_level_xxx`. This is used in combination with `external_property_type_id` to get more information about the unit',
  `external_property_type_id` int(11) NOT NULL COMMENT 'A FK to the table `ut_property_types`',
  `external_property_id` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'The ID in the table which is the source of truth for the Unee-T unit information',
  `external_system` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'The name of the external source of truth',
  `table_in_external_system` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'The name of the table in the extrenal source of truth where the info is stored',
  `tower` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '1' COMMENT 'If there is more than 1 building, the id for the unique building. Default is 1.',
  PRIMARY KEY (`external_property_id`,`external_system`,`table_in_external_system`,`organization_id`,`tower`,`external_property_type_id`),
  UNIQUE KEY `unique_mefe_unit_id` (`unee_t_mefe_unit_id`),
  KEY `id_map` (`id_map`),
  KEY `unee_t_valid_unit_type_map_units` (`unee_t_unit_type`),
  KEY `property_property_type` (`external_property_type_id`),
  KEY `mefe_unit_organization_id` (`organization_id`),
  CONSTRAINT `mefe_unit_organization_id` FOREIGN KEY (`organization_id`) REFERENCES `uneet_enterprise_organizations` (`id_organization`) ON UPDATE CASCADE,
  CONSTRAINT `property_property_type` FOREIGN KEY (`external_property_type_id`) REFERENCES `ut_property_types` (`id_property_type`) ON UPDATE CASCADE,
  CONSTRAINT `unee_t_valid_unit_type_map_units` FOREIGN KEY (`unee_t_unit_type`) REFERENCES `ut_unit_types` (`designation`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

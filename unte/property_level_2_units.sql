CREATE TABLE `property_level_2_units` (
  `system_id_unit` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique Id in this table',
  `external_id` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'The id of the record in an external system',
  `external_system_id` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'The id of the system which provides the external_system_id',
  `external_table` varbinary(100) NOT NULL COMMENT 'The table in the external system where this record is stored',
  `syst_created_datetime` timestamp NULL DEFAULT NULL COMMENT 'When was this record created?',
  `creation_system_id` int(11) DEFAULT NULL COMMENT 'What is the id of the system that was used for the creation of the record?',
  `created_by_id` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'The MEFE ID of the user who created this record',
  `creation_method` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'How was this record created',
  `syst_updated_datetime` timestamp NULL DEFAULT NULL COMMENT 'When was this record last updated?',
  `update_system_id` int(11) DEFAULT NULL COMMENT 'What is the id of the system that was used for the last update the record?',
  `updated_by_id` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'The MEFE ID of the user who updated this record',
  `update_method` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'How was this record updated?',
  `organization_id` int(11) unsigned NOT NULL COMMENT 'a FK to the table `uneet_enterprise_organizations` The ID of the organization that created this record',
  `activated_by_id` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'The MEFE ID of the user who marked this unit as Active',
  `is_obsolete` tinyint(1) DEFAULT '0' COMMENT '1 if this unit is obsolete',
  `is_creation_needed_in_unee_t` tinyint(1) DEFAULT '0' COMMENT '1 if we need to create this property as a unit in Unee-T',
  `do_not_insert` tinyint(1) DEFAULT '0' COMMENT '1 if we know the record exists in MEFE already and we do NOT need to re-create this in MEFE',
  `unee_t_unit_type` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'The Unee-T type of unit for this property - this MUST be one of the `designation` in the table `ut_unit_types`',
  `building_system_id` int(11) NOT NULL DEFAULT '1' COMMENT 'A FK to the table `property_buildings`',
  `tower` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT '1' COMMENT 'The building in which this unit is (default is 1)',
  `unit_category_id` int(11) DEFAULT NULL COMMENT 'A FK to the table `property_categories`',
  `designation` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'The name of the unit/flat',
  `count_rooms` int(10) DEFAULT NULL COMMENT 'Number of rooms in the unit',
  `unit_id` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'The unique id of this unit in the building',
  `surface` int(10) DEFAULT NULL COMMENT 'The surface of the unit',
  `surface_measurment_unit` varchar(10) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'Either sqm (Square Meters) or sqf (Square Feet)',
  `description` text COLLATE utf8mb4_unicode_520_ci COMMENT 'Description of the unit',
  PRIMARY KEY (`external_id`,`external_system_id`,`external_table`,`organization_id`),
  UNIQUE KEY `unique_id_unit` (`system_id_unit`),
  KEY `unit_building_id` (`building_system_id`),
  KEY `unee_t_valid_unit_type_unit` (`unee_t_unit_type`),
  KEY `property_level_2_organization_id` (`organization_id`),
  CONSTRAINT `property_level_2_organization_id` FOREIGN KEY (`organization_id`) REFERENCES `uneet_enterprise_organizations` (`id_organization`) ON UPDATE CASCADE,
  CONSTRAINT `unee_t_valid_unit_type_unit` FOREIGN KEY (`unee_t_unit_type`) REFERENCES `ut_unit_types` (`designation`) ON UPDATE CASCADE,
  CONSTRAINT `unit_building_id` FOREIGN KEY (`building_system_id`) REFERENCES `property_level_1_buildings` (`id_building`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci ROW_FORMAT=DYNAMIC;

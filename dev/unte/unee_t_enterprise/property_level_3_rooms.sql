CREATE TABLE `property_level_3_rooms` (
  `system_id_room` int(11) NOT NULL AUTO_INCREMENT COMMENT 'unique id in this table',
  `external_id` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'The id of the record in an external system',
  `external_system_id` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'The id of the system which provides the external_system_id',
  `external_table` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'The table in the external system where this record is stored',
  `syst_created_datetime` timestamp NULL DEFAULT NULL COMMENT 'When was this record created?',
  `creation_system_id` int(11) NOT NULL DEFAULT '1' COMMENT 'What is the id of the system that was used for the creation of the record?',
  `created_by_id` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'The MEFE ID of the user who created this record',
  `creation_method` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'How was this record created',
  `syst_updated_datetime` timestamp NULL DEFAULT NULL COMMENT 'When was this record last updated?',
  `update_system_id` int(11) DEFAULT NULL COMMENT 'What is the id of the system that was used for the last update the record?',
  `updated_by_id` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'The MEFE ID of the user who updated this record',
  `update_method` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'How was this record updated?',
  `organization_id` int(11) unsigned NOT NULL COMMENT 'a FK to the table `uneet_enterprise_organizations` The ID of the organization that created this record',
  `is_obsolete` tinyint(1) DEFAULT '0' COMMENT 'Is this an obsolete record',
  `is_creation_needed_in_unee_t` tinyint(1) DEFAULT '0' COMMENT '1 if we need to create this property as a unit in Unee-T',
  `do_not_insert` tinyint(1) DEFAULT '0' COMMENT '1 if we know the record exists in MEFE already and we do NOT need to re-create this in MEFE',
  `unee_t_unit_type` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'The Unee-T type of unit for this property - this MUST be one of the `designation` in the table `ut_unit_types`',
  `system_id_unit` int(11) NOT NULL COMMENT 'A FK to the table `property_unit`',
  `room_type_id` int(11) NOT NULL DEFAULT '1' COMMENT 'The id of the LMB LOI. This is a FK to the table ''db_all_sourcing_dt_4_lmb_loi''',
  `number_of_beds` int(2) DEFAULT NULL COMMENT 'Number of beds in the room',
  `surface` int(10) DEFAULT NULL COMMENT 'The surface of the room',
  `surface_measurment_unit` varchar(10) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'Either sqm (Square Meters) or sqf (Square Feet)',
  `room_designation` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'The designation (name) of the room',
  `room_description` mediumtext COLLATE utf8mb4_unicode_520_ci COMMENT 'Comment (use this to explain teh difference between ipi_calculation and actual)',
  PRIMARY KEY (`external_id`,`external_system_id`,`external_table`,`organization_id`),
  UNIQUE KEY `unique_system_id_room` (`system_id_room`),
  KEY `room_id_flat_id` (`system_id_unit`),
  KEY `room_id_room_type_id` (`room_type_id`),
  KEY `unee_t_valid_unit_type_room` (`unee_t_unit_type`),
  KEY `property_level_3_organization_id` (`organization_id`),
  CONSTRAINT `property_level_3_organization_id` FOREIGN KEY (`organization_id`) REFERENCES `uneet_enterprise_organizations` (`id_organization`) ON UPDATE CASCADE,
  CONSTRAINT `room_id_flat_id` FOREIGN KEY (`system_id_unit`) REFERENCES `property_level_2_units` (`system_id_unit`) ON UPDATE CASCADE,
  CONSTRAINT `unee_t_valid_unit_type_room` FOREIGN KEY (`unee_t_unit_type`) REFERENCES `ut_unit_types` (`designation`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci ROW_FORMAT=DYNAMIC;
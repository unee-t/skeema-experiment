CREATE TABLE `external_map_user_unit_role_permissions_areas` (
  `id_map_user_unit_permissions` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Unique ID in this table',
  `syst_created_datetime` timestamp NULL DEFAULT NULL COMMENT 'When was this record created?',
  `creation_system_id` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'What is the id of the sytem that was used for the creation of the record?',
  `created_by_id` int(11) unsigned NOT NULL COMMENT 'a FK to the table `uneet_enterprise_organizations` The ID of the organization that created this record',
  `creation_method` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'How was this record created',
  `syst_updated_datetime` timestamp NULL DEFAULT NULL COMMENT 'When was this record last updated?',
  `update_system_id` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'What is the id of the sytem that was used for the last update the record?',
  `updated_by_id` int(11) unsigned DEFAULT NULL COMMENT 'a FK to the table `uneet_enterprise_organizations` The ID of the organization that created this record',
  `update_method` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'How was this record updated?',
  `organization_id` int(11) unsigned NOT NULL COMMENT 'a FK to the table `uneet_enterprise_organizations` The ID of the organization that created this record',
  `is_obsolete` tinyint(1) DEFAULT '0' COMMENT 'is this obsolete?',
  `is_update_needed` tinyint(1) DEFAULT '0' COMMENT '1 if Unee-T needs to be updated',
  `unee_t_update_ts` timestamp NULL DEFAULT NULL COMMENT 'The Timestamp when the last Unee-T update has been made',
  `unee_t_mefe_user_id` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'The current Unee-T profile id of the person - this is the value of the field `_id` in the Mongo Collection `users`',
  `unee_t_area_id` int(11) NOT NULL COMMENT 'A FK to the table `property_groups_area`',
  `unee_t_user_type_id` int(11) NOT NULL COMMENT 'A FK to the table `ut_user_types`',
  `unee_t_role_id` mediumint(9) unsigned DEFAULT NULL COMMENT 'FK to the Unee-T BZFE table `ut_role_types` - ID of the Role for this user.',
  `propagate_level_2` tinyint(1) DEFAULT '0' COMMENT '1 if you want to propagate the permissions to all the units in the area',
  `propagate_level_3` tinyint(1) DEFAULT '0' COMMENT '1 if you want to propagate the permissions to all the rooms in all the units in the area',
  PRIMARY KEY (`unee_t_mefe_user_id`,`unee_t_user_type_id`,`unee_t_area_id`,`organization_id`),
  UNIQUE KEY `unique_id_map_user_unit_role_permissions_areas` (`id_map_user_unit_permissions`),
  KEY `ext_map_user_unit_role_permissions_areas_created_by` (`created_by_id`),
  KEY `ext_map_user_unit_role_permissions_areas_updated_by` (`updated_by_id`),
  KEY `ext_map_user_unit_role_permissions_areas_user_type` (`unee_t_user_type_id`),
  KEY `ext_map_user_unit_role_permissions_areas_role` (`unee_t_role_id`),
  KEY `ext_map_user_unit_role_permissions_areas_area_id` (`unee_t_area_id`),
  CONSTRAINT `ext_map_user_unit_role_permissions_areas_area_id` FOREIGN KEY (`unee_t_area_id`) REFERENCES `property_groups_areas` (`id_area`) ON UPDATE CASCADE,
  CONSTRAINT `ext_map_user_unit_role_permissions_areas_created_by` FOREIGN KEY (`created_by_id`) REFERENCES `uneet_enterprise_organizations` (`id_organization`) ON UPDATE CASCADE,
  CONSTRAINT `ext_map_user_unit_role_permissions_areas_role` FOREIGN KEY (`unee_t_role_id`) REFERENCES `ut_user_role_types` (`id_role_type`) ON UPDATE CASCADE,
  CONSTRAINT `ext_map_user_unit_role_permissions_areas_updated_by` FOREIGN KEY (`updated_by_id`) REFERENCES `uneet_enterprise_organizations` (`id_organization`) ON UPDATE CASCADE,
  CONSTRAINT `ext_map_user_unit_role_permissions_areas_user_type` FOREIGN KEY (`unee_t_user_type_id`) REFERENCES `ut_user_types` (`id_unee_t_user_type`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

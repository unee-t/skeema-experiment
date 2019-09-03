CREATE TABLE `ut_map_invitation_type_to_permission_type` (
  `invitation_type_id` smallint(6) unsigned NOT NULL COMMENT 'id of the invitation type in the table `ut_invitation_types`',
  `permission_type_id` smallint(6) unsigned NOT NULL COMMENT 'id of the permission type in the table `ut_permission_types`',
  `created` datetime DEFAULT NULL COMMENT 'creation ts',
  `record_created_by` mediumint(9) unsigned DEFAULT NULL COMMENT 'id of the user who created this user in the bz `profiles` table',
  `is_obsolete` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'This is an obsolete record',
  `comment` mediumtext COLLATE utf8mb4_unicode_520_ci COMMENT 'Any comment',
  PRIMARY KEY (`invitation_type_id`,`permission_type_id`),
  KEY `map_invitation_to_permission_permission_type_id` (`permission_type_id`),
  CONSTRAINT `map_invitation_to_permission_invitation_type_id` FOREIGN KEY (`invitation_type_id`) REFERENCES `ut_invitation_types` (`id_invitation_type`),
  CONSTRAINT `map_invitation_to_permission_permission_type_id` FOREIGN KEY (`permission_type_id`) REFERENCES `ut_permission_types` (`id_permission_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

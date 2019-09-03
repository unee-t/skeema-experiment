CREATE TABLE `ut_permission_types` (
  `id_permission_type` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID in this table',
  `created` datetime DEFAULT NULL COMMENT 'creation ts',
  `order` smallint(6) unsigned DEFAULT NULL COMMENT 'Order in the list',
  `is_obsolete` tinyint(1) DEFAULT '0' COMMENT '1 if this is an obsolete value',
  `group_type_id` mediumint(9) unsigned DEFAULT NULL COMMENT 'The id of the group that grant this permission - a FK to the table ut_group_types',
  `permission_type` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'A name for this role type',
  `permission_scope` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT '4 possible values: GLOBAL: for all units and roles, UNIT: permission for a specific unit, ROLE: permission for a specific role in a specific unit, SPECIAL: special permission (ex: occupant)',
  `permission_category` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'Possible values: ACCESS: group_control, GRANT FLAG: permissions to grant flags, ASK FOR APPROVAL: can ask a specific user to approve a flag, ROLE: a user is in a given role,',
  `is_bless` tinyint(1) DEFAULT '0' COMMENT '1 if this is a permission to grant membership to a given group',
  `bless_id` mediumint(9) unsigned DEFAULT NULL COMMENT 'IF this is a ''blessing'' permission - which permission can this grant',
  `description` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'A short, generic description that we include each time we create a new BZ unit.',
  `detailed_description` mediumtext COLLATE utf8mb4_unicode_520_ci COMMENT 'Detailed description of this group type',
  PRIMARY KEY (`id_permission_type`,`permission_type`),
  KEY `premission_groupe_type` (`group_type_id`),
  CONSTRAINT `premission_groupe_type` FOREIGN KEY (`group_type_id`) REFERENCES `ut_group_types` (`id_group_type`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

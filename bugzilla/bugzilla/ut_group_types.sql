CREATE TABLE `ut_group_types` (
  `id_group_type` mediumint(9) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID in this table',
  `created` datetime DEFAULT NULL COMMENT 'creation ts',
  `order` smallint(6) unsigned DEFAULT NULL COMMENT 'Order in the list',
  `is_obsolete` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'This is an obsolete record',
  `groupe_type` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'A name for this group type',
  `bz_description` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'A short description for BZ which we use when we create the group',
  `description` mediumtext COLLATE utf8mb4_unicode_520_ci COMMENT 'Detailed description of this group type',
  PRIMARY KEY (`id_group_type`,`groupe_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

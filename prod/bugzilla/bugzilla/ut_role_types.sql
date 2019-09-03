CREATE TABLE `ut_role_types` (
  `id_role_type` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID in this table',
  `created` datetime DEFAULT NULL COMMENT 'creation ts',
  `role_type` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'A name for this role type',
  `bz_description` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'A short, generic description that we include each time we create a new BZ unit.',
  `description` mediumtext COLLATE utf8mb4_unicode_520_ci COMMENT 'Detailed description of this group type',
  PRIMARY KEY (`id_role_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

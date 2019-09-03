CREATE TABLE `ut_contractor_types` (
  `id_contractor_type` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID in this table',
  `created` datetime DEFAULT NULL COMMENT 'creation ts',
  `contractor_type` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'A name for this contractor type',
  `bz_description` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'A short, generic description that we include each time we create a new BZ unit.',
  `description` mediumtext COLLATE utf8mb4_unicode_520_ci COMMENT 'Detailed description of this contractor type',
  PRIMARY KEY (`id_contractor_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

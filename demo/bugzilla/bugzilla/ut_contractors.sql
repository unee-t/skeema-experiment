CREATE TABLE `ut_contractors` (
  `id_contractor` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID in this table',
  `created` datetime DEFAULT NULL COMMENT 'creation ts',
  `contractor_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'A name for this contractor',
  `contractor_description` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'A short, generic description that we include each time we create a new BZ contractor.',
  `contractor_details` mediumtext COLLATE utf8mb4_unicode_520_ci COMMENT 'Detailed description of this contractor - This can be built from a SQL Less table and/or the MEFE',
  PRIMARY KEY (`id_contractor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE `ut_db_schema_version` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Unique ID in this table',
  `schema_version` varchar(256) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'The current version of the BZ DB schema for Unee-T',
  `update_datetime` datetime DEFAULT NULL COMMENT 'Timestamp - when this version was implemented in THIS environment',
  `update_script` varchar(256) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'The script which was used to do the db ugrade',
  `comment` mediumtext COLLATE utf8mb4_unicode_520_ci COMMENT 'Comment',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci ROW_FORMAT=DYNAMIC;

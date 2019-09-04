CREATE TABLE `ut_script_log` (
  `id_ut_script_log` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'The id of the record in this table',
  `datetime` datetime DEFAULT NULL COMMENT 'When was this record created',
  `script` longtext COLLATE utf8mb4_unicode_520_ci COMMENT 'The script that was used to create the record',
  `log` mediumtext COLLATE utf8mb4_unicode_520_ci COMMENT 'More information about what we intended to do',
  PRIMARY KEY (`id_ut_script_log`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

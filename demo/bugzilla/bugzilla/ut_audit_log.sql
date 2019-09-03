CREATE TABLE `ut_audit_log` (
  `id_ut_log` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'The id of the record in this table',
  `datetime` datetime DEFAULT NULL COMMENT 'When was this record created',
  `bzfe_table` varchar(256) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'The name of the table that was altered',
  `bzfe_field` varchar(256) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'The name of the field that was altered in the bzfe table',
  `previous_value` longtext COLLATE utf8mb4_unicode_520_ci COMMENT 'The value of the field before the change',
  `new_value` longtext COLLATE utf8mb4_unicode_520_ci COMMENT 'The value of the field after the change',
  `script` longtext COLLATE utf8mb4_unicode_520_ci COMMENT 'The script that was used to create the record',
  `comment` mediumtext COLLATE utf8mb4_unicode_520_ci COMMENT 'More information about what we intended to do',
  PRIMARY KEY (`id_ut_log`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

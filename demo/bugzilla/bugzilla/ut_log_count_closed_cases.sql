CREATE TABLE `ut_log_count_closed_cases` (
  `id_log_closed_case` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Unique id in this table',
  `timestamp` datetime DEFAULT NULL COMMENT 'The timestamp when this record was created',
  `count_closed_cases` int(11) unsigned NOT NULL COMMENT 'The number of closed case at this Datetime',
  `count_total_cases` int(11) unsigned DEFAULT NULL COMMENT 'The total number of cases in Unee-T at this time',
  PRIMARY KEY (`id_log_closed_case`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

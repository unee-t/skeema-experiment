CREATE TABLE `ut_log_count_enabled_units` (
  `id_log_enabled_units` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Unique id in this table',
  `timestamp` datetime DEFAULT NULL COMMENT 'The timestamp when this record was created',
  `count_enabled_units` int(11) unsigned NOT NULL COMMENT 'The number of enabled products/units at this Datetime',
  `count_total_units` int(11) unsigned NOT NULL COMMENT 'The total number of products/units at this Datetime',
  PRIMARY KEY (`id_log_enabled_units`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE `series_data` (
  `series_id` mediumint(9) unsigned NOT NULL,
  `series_date` datetime NOT NULL,
  `series_value` mediumint(9) unsigned NOT NULL,
  UNIQUE KEY `series_data_series_id_idx` (`series_id`,`series_date`),
  CONSTRAINT `fk_series_data_series_id_series_series_id` FOREIGN KEY (`series_id`) REFERENCES `series` (`series_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

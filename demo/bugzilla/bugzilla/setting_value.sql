CREATE TABLE `setting_value` (
  `name` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `value` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `sortindex` smallint(6) unsigned NOT NULL,
  UNIQUE KEY `setting_value_nv_unique_idx` (`name`,`value`),
  UNIQUE KEY `setting_value_ns_unique_idx` (`name`,`sortindex`),
  CONSTRAINT `fk_setting_value_name_setting_name` FOREIGN KEY (`name`) REFERENCES `setting` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

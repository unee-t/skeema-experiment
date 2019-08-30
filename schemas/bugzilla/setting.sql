CREATE TABLE `setting` (
  `name` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `default_value` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `is_enabled` tinyint(4) NOT NULL DEFAULT '1',
  `subclass` varchar(32) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

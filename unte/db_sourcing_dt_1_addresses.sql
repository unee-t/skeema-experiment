CREATE TABLE `db_sourcing_dt_1_addresses` (
  `id_address` int(10) NOT NULL AUTO_INCREMENT,
  `external_id` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'The id of the record in an external system',
  `external_system_id` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'The id of the system which provides the external_system_id',
  `external_table` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'The table in the external system where this record is stored',
  `condo_id` int(10) NOT NULL,
  `tower` varchar(15) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '1',
  `address` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `zip` int(10) DEFAULT NULL,
  `city` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `country_code` varchar(10) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'The unicode country code (FR, SG, EN, etc...). See table `185_country`',
  PRIMARY KEY (`condo_id`,`tower`),
  UNIQUE KEY `id` (`id_address`),
  KEY `condo_id` (`condo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci ROW_FORMAT=DYNAMIC;

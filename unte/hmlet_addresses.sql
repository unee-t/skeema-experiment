CREATE TABLE `hmlet_addresses` (
  `external_id` int(10) NOT NULL DEFAULT '0',
  `external_system_id` longtext COLLATE utf8mb4_unicode_520_ci,
  `external_table` longtext COLLATE utf8mb4_unicode_520_ci,
  `syst_created_datetime` longtext CHARACTER SET latin1,
  `creation_system_id` bigint(20) DEFAULT NULL,
  `created_by_id` bigint(20) DEFAULT NULL,
  `creation_method` longtext COLLATE utf8mb4_unicode_520_ci,
  `building_id` int(1) NOT NULL DEFAULT '0',
  `building_id_source` int(10) NOT NULL,
  `tower` varchar(15) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '1',
  `address_1` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `zip_postal_code` int(10) DEFAULT NULL,
  `state` binary(0) DEFAULT NULL,
  `city` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `country_code` varchar(10) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'The unicode country code (FR, SG, EN, etc...). See table `185_country`',
  PRIMARY KEY (`building_id_source`,`tower`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

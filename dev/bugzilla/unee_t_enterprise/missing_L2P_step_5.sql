CREATE TABLE `missing_L2P_step_5` (
  `building_system_id` int(11) DEFAULT '1' COMMENT 'A FK to the table `property_buildings`',
  `L1P` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'The name of the building',
  `mefe_unit_id` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

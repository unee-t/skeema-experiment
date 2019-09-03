CREATE TABLE `missing_L2P_step_4` (
  `system_id_unit` int(11) NOT NULL DEFAULT '0' COMMENT 'Unique Id in this table',
  `L2P` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'The name of the unit/flat',
  `L1P` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'The name of the building',
  `L1P_unee_t_mefe_unit_id` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'The MEFE ID of the unit - a FK to the Mongo Collection unitMetaData'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

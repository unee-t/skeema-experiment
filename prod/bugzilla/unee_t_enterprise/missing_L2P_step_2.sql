CREATE TABLE `missing_L2P_step_2` (
  `system_id_unit` int(11) NOT NULL DEFAULT '0' COMMENT 'Unique Id in this table',
  `unee_t_mefe_unit_id` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'The MEFE ID of the unit - a FK to the Mongo Collection unitMetaData',
  `L2P` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'The name of the unit/flat'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

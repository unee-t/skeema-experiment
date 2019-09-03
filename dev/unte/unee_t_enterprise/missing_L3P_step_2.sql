CREATE TABLE `missing_L3P_step_2` (
  `system_id_room` int(11) NOT NULL DEFAULT '0' COMMENT 'unique id in this table',
  `unee_t_mefe_unit_id` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'The MEFE ID of the unit - a FK to the Mongo Collection unitMetaData',
  `L3P` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'The designation (name) of the room'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

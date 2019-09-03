CREATE TABLE `log_lambdas` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID in this table',
  `created_datetime` timestamp NULL DEFAULT NULL COMMENT 'Timestamp when this was created',
  `creation_trigger` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `associated_call` varbinary(255) DEFAULT NULL COMMENT 'The name of the procedure that we invoke to call the lambda',
  `mefe_unit_id` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `unit_name` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'The name of the Unit (easire for debugging)',
  `mefe_user_id` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `unee_t_login` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'The Unee-T login for the user (easier for debugging)',
  `payload` mediumtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

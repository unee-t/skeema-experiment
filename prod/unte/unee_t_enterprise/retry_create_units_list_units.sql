CREATE TABLE `retry_create_units_list_units` (
  `unit_creation_request_id` int(11) NOT NULL COMMENT 'Id in this table',
  `created_by_id` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'The MEFE ID of the user who created this record',
  `creation_method` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `uneet_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'The name of the unit in the MEFE',
  `unee_t_unit_type` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'The Unee-T type of unit for this property - this MUST be one of the `designation` in the table `ut_unit_types`',
  `more_info` text COLLATE utf8mb4_unicode_520_ci COMMENT 'detailed description of the building',
  `street_address` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `city` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'The City',
  `state` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'The State',
  `zip_code` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'ZIP or Postal code',
  `country` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'Description/help text'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

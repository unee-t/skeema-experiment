CREATE TABLE `ut_flash_units_with_dummy_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id in this table',
  `created_datetime` datetime DEFAULT NULL COMMENT 'The timestamp when this record was created',
  `updated_datetime` datetime DEFAULT NULL COMMENT 'The timestamp when this record was updated. It is equal to the created_datetime if the record has never been updated',
  `unit_id` smallint(6) DEFAULT NULL COMMENT 'The BZ Product_id for the unit with a dummy role a FK to the table ''products''',
  `role_id` mediumint(9) DEFAULT NULL COMMENT 'The BZ component_id - a FK to the table `components`',
  `role_type_id` smallint(6) DEFAULT NULL COMMENT 'The Ut role type id - a FK to the table ''ut_role_types''',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

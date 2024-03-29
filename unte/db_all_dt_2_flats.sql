CREATE TABLE `db_all_dt_2_flats` (
  `system_id_flat` int(10) NOT NULL AUTO_INCREMENT,
  `external_id` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'The id of the record in an external system',
  `external_system_id` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'The id of the system which provides the external_system_id',
  `external_table` varbinary(255) DEFAULT NULL COMMENT 'The table in the external system where this record is stored',
  `syst_created_datetime` datetime DEFAULT NULL,
  `syst_updated_datetime` datetime DEFAULT NULL,
  `created_by_id` int(10) DEFAULT NULL,
  `updated_by_id` int(10) DEFAULT NULL,
  `activated_by_id` int(10) DEFAULT NULL,
  `is_photo` tinyint(1) DEFAULT '0',
  `is_lmb_contract` tinyint(1) DEFAULT '0',
  `is_not_sce_apt` tinyint(1) DEFAULT '0',
  `is_under_mgt` tinyint(1) DEFAULT '0',
  `is_xtra_sces_only` tinyint(1) DEFAULT '0',
  `is_visited` tinyint(1) DEFAULT '0',
  `is_creation_needed_in_unee_t` tinyint(1) DEFAULT '0' COMMENT '1 if we need to create this property as a unit in Unee-T',
  `uneet_creation_datetime` datetime DEFAULT NULL COMMENT 'Datetime when that unit was created in Unee-T',
  `uneet_id` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'ID of that Unit in Unee-T. This is a the value in the Mongo collection',
  `flat_id` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `condo_id` int(10) NOT NULL,
  `flat_category_id` int(10) DEFAULT NULL,
  `flat_size_id` int(10) DEFAULT NULL,
  `bdr` int(10) DEFAULT NULL,
  `tower` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT '1',
  `unit` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `surface_sqf` int(10) DEFAULT NULL,
  `current_utility_cap` decimal(19,2) DEFAULT NULL COMMENT 'The current amount of the utility cap for this flat',
  `current_list_price` decimal(19,2) DEFAULT NULL COMMENT 'The current list price for this flat',
  `url_to_matterport` varchar(256) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'Introduced in v4.31.0 - field to capture the URL to the matterport virtual visit for this unit.',
  `wifi_name` varchar(256) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `wifi_password` varchar(256) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL COMMENT 'Link to db_sourcing_dt_1_addresses',
  PRIMARY KEY (`system_id_flat`,`flat_id`),
  UNIQUE KEY `Flatid` (`flat_id`),
  KEY `condo_id` (`condo_id`),
  KEY `flat_category` (`flat_category_id`),
  KEY `flat_created_by` (`created_by_id`),
  KEY `flat_updated_by` (`updated_by_id`),
  KEY `flat_activated_by` (`activated_by_id`),
  KEY `flat_flat_size_id` (`flat_size_id`),
  KEY `flat_id_index` (`flat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci ROW_FORMAT=DYNAMIC;

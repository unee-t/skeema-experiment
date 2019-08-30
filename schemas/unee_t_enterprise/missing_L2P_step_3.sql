CREATE TABLE `missing_L2P_step_3` (
  `system_id_unit` int(11) NOT NULL DEFAULT '0' COMMENT 'Unique Id in this table',
  `L2P` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'The name of the unit/flat',
  `designation` varchar(50) COLLATE utf8mb4_unicode_520_ci COMMENT 'The name of the unit/flat',
  `building_system_id` int(11) DEFAULT '1' COMMENT 'A FK to the table `property_buildings`',
  `L1P` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'The name of the building',
  `organization_id` int(11) unsigned NOT NULL COMMENT 'a FK to the table `uneet_enterprise_organizations` The ID of the organization that created this record',
  `external_property_type_id` int(11) NOT NULL COMMENT 'A FK to the table `ut_property_types`',
  `external_property_id` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'The ID in the table which is the source of truth for the Unee-T unit information',
  `external_system` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'The name of the external source of truth',
  `table_in_external_system` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'The name of the table in the extrenal source of truth where the info is stored',
  `tower` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '1' COMMENT 'If there is more than 1 building, the id for the unique building. Default is 1.',
  `unee_t_mefe_unit_id` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'The MEFE ID of the unit - a FK to the Mongo Collection unitMetaData',
  `building_organization_id` int(11) unsigned NOT NULL COMMENT 'a FK to the table `uneet_enterprise_organizations` The ID of the organization that created this record',
  `building_external_id` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'The id of the record in an external system',
  `building_external_system_id` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'The id of the system which provides the external_system_id',
  `building_external_table` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'The table in the external system where this record is stored',
  `building_tower` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '1' COMMENT 'If there is more than 1 building, the id for the unique building. Default is 1.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

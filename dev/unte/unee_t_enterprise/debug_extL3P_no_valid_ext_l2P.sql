CREATE TABLE `debug_extL3P_no_valid_ext_l2P` (
  `extL3P` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'The designation (name) of the room',
  `external_id` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'The id of the record in an external system',
  `system_id_unit` int(11) NOT NULL COMMENT 'A FK to the table `property_unit`',
  `syst_created_datetime` timestamp NULL DEFAULT NULL COMMENT 'When was this record created?',
  `ext_ik_1` int(11) unsigned NOT NULL COMMENT 'a FK to the table `uneet_enterprise_organizations` The ID of the organization that created this record',
  `ext_ik_2` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'The id of the record in an external system',
  `ext_ik_3` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'The id of the system which provides the external_system_id',
  `ext_ik_4` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'The table in the external system where this record is stored'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

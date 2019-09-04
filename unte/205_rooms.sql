CREATE TABLE `205_rooms` (
  `id_room` int(11) NOT NULL AUTO_INCREMENT COMMENT 'unique id in this table',
  `external_id` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'The id of the record in an external system',
  `external_system_id` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'The id of the system which provides the external_system_id',
  `external_table` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'The table in the external system where this record is stored',
  `syst_created_datetime` datetime DEFAULT NULL COMMENT 'When was this record created?',
  `creation_system_id` int(11) NOT NULL DEFAULT '1' COMMENT 'What is the id of the system that was used for the creation of the record?',
  `created_by_id` int(10) DEFAULT NULL COMMENT 'Who created this record (id of the user in the system that was used)?',
  `syst_updated_datetime` datetime DEFAULT NULL COMMENT 'When was this record last updated?',
  `update_system_id` int(11) DEFAULT NULL COMMENT 'What is the id of the system that was used for the last update the record?',
  `updated_by_id` int(10) DEFAULT NULL COMMENT 'Who last upadated this record (id of the user in the system that was used)?',
  `is_creation_needed_in_unee_t` tinyint(1) DEFAULT '0' COMMENT '1 if we need to create this property as a unit in Unee-T',
  `uneet_creation_datetime` datetime DEFAULT NULL COMMENT 'Datetime when that unit was created in Unee-T',
  `uneet_id` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'ID of that Unit in Unee-T. This is a the value in the Mongo collection',
  `system_id_flat` int(10) NOT NULL COMMENT 'id in the flat table',
  `room_type_id` int(11) NOT NULL DEFAULT '1' COMMENT 'The id of the LMB LOI. This is a FK to the table ''db_all_sourcing_dt_4_lmb_loi''',
  `number of beds` int(2) DEFAULT NULL COMMENT 'Number of beds in the room',
  `current_list_price` decimal(19,2) DEFAULT NULL COMMENT 'The current list price for this room',
  `current_utility_share` decimal(19,2) DEFAULT NULL COMMENT 'The amount of the current share of utility for this room in this flat',
  `surface-sqf` int(10) DEFAULT NULL COMMENT 'Room surface in Square feets',
  `surface-sqm` int(10) DEFAULT NULL COMMENT 'Room surface in Square meters',
  `is_obsolete` tinyint(1) DEFAULT '0' COMMENT 'Is this an obsolete record',
  `room_designation` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'The designation (name) of the room',
  `room_description` mediumtext COLLATE utf8mb4_unicode_520_ci COMMENT 'Comment (use this to explain teh difference between ipi_calculation and actual)',
  `bathroom_type_id` int(11) DEFAULT NULL COMMENT 'FK to 223_bathroom_type',
  `bedroom_type_id` int(11) DEFAULT NULL COMMENT 'FK to 224_bedroom_type',
  PRIMARY KEY (`id_room`),
  KEY `room_id_flat_id` (`system_id_flat`),
  KEY `room_id_room_type_id` (`room_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci ROW_FORMAT=DYNAMIC;
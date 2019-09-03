CREATE TABLE `property_types_level_3_rooms` (
  `id_room_type` int(11) NOT NULL AUTO_INCREMENT COMMENT 'The unique id in this table',
  `external_id` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'The id of the record in an external system',
  `external_system_id` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'The id of the system which provides the external_system_id',
  `external_table` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'The table in the external system where this record is stored',
  `creation_system_id` int(11) NOT NULL DEFAULT '1' COMMENT 'What is the id of the system that was used for the creation of the record?',
  `update_system_id` int(11) DEFAULT NULL COMMENT 'What is the id of the system that was used for the last update the record?',
  `is_obsolete` tinyint(1) DEFAULT '0' COMMENT 'is this obsolete?',
  `is_default` tinyint(1) DEFAULT '0' COMMENT 'This is the default value in our systems',
  `order` int(11) NOT NULL COMMENT 'Order in the list',
  `room_type` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'Designation',
  `room_type_definition` mediumtext COLLATE utf8mb4_unicode_520_ci COMMENT 'Description/help text',
  PRIMARY KEY (`id_room_type`,`room_type`),
  KEY `loi_type_creation_system_id` (`creation_system_id`),
  KEY `loi_type_update_system_id` (`update_system_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci ROW_FORMAT=DYNAMIC;

CREATE TABLE `person_genders` (
  `id_person_gender` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Uniquer ID in this table',
  `creation_system_id` int(11) NOT NULL DEFAULT '1' COMMENT 'What is the id of the sytem that was used for the creation of the record?',
  `update_system_id` int(11) DEFAULT NULL COMMENT 'What is the id of the sytem that was used for the last update the record?',
  `is_obsolete` tinyint(1) DEFAULT '0' COMMENT 'is this obsolete?',
  `is_default` tinyint(1) DEFAULT '0' COMMENT 'This is the default value in our systems',
  `is_active` tinyint(1) DEFAULT '0' COMMENT 'This satus is considered as ACTIVE',
  `order` int(11) NOT NULL COMMENT 'Order in the list',
  `person_gender` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'Designation',
  `description` mediumtext COLLATE utf8mb4_unicode_520_ci COMMENT 'Description/help text',
  PRIMARY KEY (`id_person_gender`),
  UNIQUE KEY `unique_gender` (`person_gender`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

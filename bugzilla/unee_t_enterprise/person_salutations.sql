CREATE TABLE `person_salutations` (
  `id_salutation` int(11) NOT NULL AUTO_INCREMENT COMMENT 'unique ID in this table',
  `creation_system_id` int(11) NOT NULL DEFAULT '1' COMMENT 'What is the id of the sytem that was used for the creation of the record?',
  `update_system_id` int(11) DEFAULT NULL COMMENT 'What is the id of the sytem that was used for the update of the record?',
  `is_obsolete` tinyint(1) DEFAULT '0' COMMENT 'is this obsolete?',
  `order` int(10) NOT NULL DEFAULT '0' COMMENT 'Order in the list',
  `salutation` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'Designation',
  `salutation_description` mediumtext COLLATE utf8mb4_unicode_520_ci COMMENT 'Description/help text)',
  PRIMARY KEY (`id_salutation`,`salutation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci ROW_FORMAT=DYNAMIC;

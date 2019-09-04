CREATE TABLE `228_ops_cluster` (
  `id_ops_cluster` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Unique ID in this table',
  `syst_created_datetime` datetime DEFAULT NULL COMMENT 'When was this record created?',
  `creation_system_id` int(11) NOT NULL DEFAULT '1' COMMENT 'What is the id of the system that was used for the creation of the record?',
  `created_by_id` int(10) DEFAULT NULL COMMENT 'Who created this record (id of the user in the system that was used)?',
  `creation_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'How was this record created',
  `syst_updated_datetime` datetime DEFAULT NULL COMMENT 'When was this record last updated?',
  `update_system_id` int(11) DEFAULT NULL COMMENT 'What is the id of the system that was used for the last update the record?',
  `updated_by_id` int(10) DEFAULT NULL COMMENT 'Who last upadated this record (id of the user in the system that was used)?',
  `update_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'How was this record updated?',
  `ops_cluster_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Cluster name',
  `ops_cluster_definition` mediumtext COLLATE utf8mb4_unicode_ci COMMENT 'Description',
  `country_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Country Code',
  PRIMARY KEY (`id_ops_cluster`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `ut_invitation_types` (
  `id_invitation_type` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID in this table',
  `created` datetime DEFAULT NULL COMMENT 'creation ts',
  `order` smallint(6) unsigned DEFAULT NULL COMMENT 'Order in the list',
  `is_active` tinyint(1) DEFAULT '0' COMMENT '1 if this is an active invitation: we have the scripts to process these',
  `invitation_type` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'A name for this invitation type',
  `detailed_description` mediumtext COLLATE utf8mb4_unicode_520_ci COMMENT 'Detailed description of this group type',
  PRIMARY KEY (`id_invitation_type`,`invitation_type`),
  UNIQUE KEY `invitation_type_is_unique` (`invitation_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci ROW_FORMAT=DYNAMIC;

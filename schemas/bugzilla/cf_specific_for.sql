CREATE TABLE `cf_specific_for` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `value` varchar(64) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `sortkey` smallint(6) unsigned NOT NULL DEFAULT '0',
  `isactive` tinyint(4) NOT NULL DEFAULT '1',
  `visibility_value_id` smallint(6) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cf_specific_for_value_idx` (`value`),
  KEY `cf_specific_for_sortkey_idx` (`sortkey`,`value`),
  KEY `cf_specific_for_visibility_value_id_idx` (`visibility_value_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

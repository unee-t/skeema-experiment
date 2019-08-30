CREATE TABLE `bug_status` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `value` varchar(64) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `sortkey` smallint(6) unsigned NOT NULL DEFAULT '0',
  `isactive` tinyint(4) NOT NULL DEFAULT '1',
  `visibility_value_id` smallint(6) unsigned DEFAULT NULL,
  `is_open` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `bug_status_value_idx` (`value`),
  KEY `bug_status_sortkey_idx` (`sortkey`,`value`),
  KEY `bug_status_visibility_value_id_idx` (`visibility_value_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

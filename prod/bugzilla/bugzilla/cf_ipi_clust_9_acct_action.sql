CREATE TABLE `cf_ipi_clust_9_acct_action` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `value` varchar(64) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `sortkey` smallint(6) unsigned NOT NULL DEFAULT '0',
  `isactive` tinyint(4) NOT NULL DEFAULT '1',
  `visibility_value_id` smallint(6) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cf_ipi_clust_9_acct_action_value_idx` (`value`),
  KEY `cf_ipi_clust_9_acct_action_visibility_value_id_idx` (`visibility_value_id`),
  KEY `cf_ipi_clust_9_acct_action_sortkey_idx` (`sortkey`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

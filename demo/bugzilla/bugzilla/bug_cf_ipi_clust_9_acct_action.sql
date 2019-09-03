CREATE TABLE `bug_cf_ipi_clust_9_acct_action` (
  `bug_id` mediumint(9) unsigned NOT NULL,
  `value` varchar(64) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  UNIQUE KEY `bug_cf_ipi_clust_9_acct_action_bug_id_idx` (`bug_id`,`value`),
  KEY `fk_e5fc7a4f159b990bfcdfcaf844d0728b` (`value`),
  CONSTRAINT `fk_bug_cf_ipi_clust_9_acct_action_bug_id_bugs_bug_id` FOREIGN KEY (`bug_id`) REFERENCES `bugs` (`bug_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_e5fc7a4f159b990bfcdfcaf844d0728b` FOREIGN KEY (`value`) REFERENCES `cf_ipi_clust_9_acct_action` (`value`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

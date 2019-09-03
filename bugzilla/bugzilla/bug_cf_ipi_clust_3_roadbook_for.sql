CREATE TABLE `bug_cf_ipi_clust_3_roadbook_for` (
  `bug_id` mediumint(9) unsigned NOT NULL,
  `value` varchar(64) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  UNIQUE KEY `bug_cf_ipi_clust_3_roadbook_for_bug_id_idx` (`bug_id`,`value`),
  KEY `fk_0da76aa50ea9cec77ea8e213c8655f99` (`value`),
  CONSTRAINT `fk_0da76aa50ea9cec77ea8e213c8655f99` FOREIGN KEY (`value`) REFERENCES `cf_ipi_clust_3_roadbook_for` (`value`) ON UPDATE CASCADE,
  CONSTRAINT `fk_bug_cf_ipi_clust_3_roadbook_for_bug_id_bugs_bug_id` FOREIGN KEY (`bug_id`) REFERENCES `bugs` (`bug_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

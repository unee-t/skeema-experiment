CREATE TABLE `bugs_aliases` (
  `alias` varchar(40) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `bug_id` mediumint(9) unsigned DEFAULT NULL,
  UNIQUE KEY `bugs_aliases_alias_idx` (`alias`),
  KEY `bugs_aliases_bug_id_idx` (`bug_id`),
  CONSTRAINT `fk_bugs_aliases_bug_id_bugs_bug_id` FOREIGN KEY (`bug_id`) REFERENCES `bugs` (`bug_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

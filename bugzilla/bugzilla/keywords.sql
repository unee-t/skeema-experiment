CREATE TABLE `keywords` (
  `bug_id` mediumint(9) unsigned NOT NULL,
  `keywordid` smallint(6) unsigned NOT NULL,
  UNIQUE KEY `keywords_bug_id_idx` (`bug_id`,`keywordid`),
  KEY `keywords_keywordid_idx` (`keywordid`),
  CONSTRAINT `fk_keywords_bug_id_bugs_bug_id` FOREIGN KEY (`bug_id`) REFERENCES `bugs` (`bug_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_keywords_keywordid_keyworddefs_id` FOREIGN KEY (`keywordid`) REFERENCES `keyworddefs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

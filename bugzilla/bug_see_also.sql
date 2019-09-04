CREATE TABLE `bug_see_also` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `bug_id` mediumint(9) unsigned NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `class` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `bug_see_also_bug_id_idx` (`bug_id`,`value`),
  CONSTRAINT `fk_bug_see_also_bug_id_bugs_bug_id` FOREIGN KEY (`bug_id`) REFERENCES `bugs` (`bug_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

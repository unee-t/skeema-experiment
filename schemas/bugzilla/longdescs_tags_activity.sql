CREATE TABLE `longdescs_tags_activity` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `bug_id` mediumint(9) unsigned NOT NULL,
  `comment_id` int(11) unsigned DEFAULT NULL,
  `who` mediumint(9) unsigned NOT NULL,
  `bug_when` datetime NOT NULL,
  `added` varchar(24) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `removed` varchar(24) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `longdescs_tags_activity_bug_id_idx` (`bug_id`),
  KEY `fk_longdescs_tags_activity_comment_id_longdescs_comment_id` (`comment_id`),
  KEY `fk_longdescs_tags_activity_who_profiles_userid` (`who`),
  CONSTRAINT `fk_longdescs_tags_activity_bug_id_bugs_bug_id` FOREIGN KEY (`bug_id`) REFERENCES `bugs` (`bug_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_longdescs_tags_activity_comment_id_longdescs_comment_id` FOREIGN KEY (`comment_id`) REFERENCES `longdescs` (`comment_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_longdescs_tags_activity_who_profiles_userid` FOREIGN KEY (`who`) REFERENCES `profiles` (`userid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

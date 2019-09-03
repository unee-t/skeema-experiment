CREATE TABLE `bug_user_last_visit` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(9) unsigned NOT NULL,
  `bug_id` mediumint(9) unsigned NOT NULL,
  `last_visit_ts` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bug_user_last_visit_idx` (`user_id`,`bug_id`),
  KEY `bug_user_last_visit_last_visit_ts_idx` (`last_visit_ts`),
  KEY `fk_bug_user_last_visit_bug_id_bugs_bug_id` (`bug_id`),
  CONSTRAINT `fk_bug_user_last_visit_bug_id_bugs_bug_id` FOREIGN KEY (`bug_id`) REFERENCES `bugs` (`bug_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_bug_user_last_visit_user_id_profiles_userid` FOREIGN KEY (`user_id`) REFERENCES `profiles` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

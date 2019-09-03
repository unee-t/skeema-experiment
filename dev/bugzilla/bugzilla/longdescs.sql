CREATE TABLE `longdescs` (
  `comment_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `bug_id` mediumint(9) unsigned NOT NULL,
  `who` mediumint(9) unsigned NOT NULL,
  `bug_when` datetime NOT NULL,
  `work_time` decimal(7,2) NOT NULL DEFAULT '0.00',
  `thetext` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `isprivate` tinyint(4) NOT NULL DEFAULT '0',
  `already_wrapped` tinyint(4) NOT NULL DEFAULT '0',
  `type` smallint(6) unsigned NOT NULL DEFAULT '0',
  `extra_data` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `longdescs_bug_id_idx` (`bug_id`,`work_time`),
  KEY `longdescs_who_idx` (`who`,`bug_id`),
  KEY `longdescs_bug_when_idx` (`bug_when`),
  CONSTRAINT `fk_longdescs_bug_id_bugs_bug_id` FOREIGN KEY (`bug_id`) REFERENCES `bugs` (`bug_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_longdescs_who_profiles_userid` FOREIGN KEY (`who`) REFERENCES `profiles` (`userid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

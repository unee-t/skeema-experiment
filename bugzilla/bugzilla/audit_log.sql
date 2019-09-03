CREATE TABLE `audit_log` (
  `user_id` mediumint(9) unsigned DEFAULT NULL,
  `class` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `object_id` int(11) unsigned NOT NULL,
  `field` varchar(64) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `removed` longtext COLLATE utf8mb4_unicode_520_ci,
  `added` longtext COLLATE utf8mb4_unicode_520_ci,
  `at_time` datetime NOT NULL,
  KEY `audit_log_class_idx` (`class`,`at_time`),
  KEY `fk_audit_log_user_id_profiles_userid` (`user_id`),
  CONSTRAINT `fk_audit_log_user_id_profiles_userid` FOREIGN KEY (`user_id`) REFERENCES `profiles` (`userid`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

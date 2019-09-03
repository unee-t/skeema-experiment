CREATE TABLE `whine_events` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `owner_userid` mediumint(9) unsigned NOT NULL,
  `subject` varchar(128) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `body` longtext COLLATE utf8mb4_unicode_520_ci,
  `mailifnobugs` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_whine_events_owner_userid_profiles_userid` (`owner_userid`),
  CONSTRAINT `fk_whine_events_owner_userid_profiles_userid` FOREIGN KEY (`owner_userid`) REFERENCES `profiles` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

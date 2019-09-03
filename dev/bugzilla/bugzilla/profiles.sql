CREATE TABLE `profiles` (
  `userid` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `login_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `cryptpassword` varchar(128) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `realname` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `disabledtext` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `disable_mail` tinyint(4) NOT NULL DEFAULT '0',
  `mybugslink` tinyint(4) NOT NULL DEFAULT '1',
  `extern_id` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `is_enabled` tinyint(4) NOT NULL DEFAULT '1',
  `last_seen_date` datetime DEFAULT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `profiles_login_name_idx` (`login_name`),
  UNIQUE KEY `profiles_extern_id_idx` (`extern_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

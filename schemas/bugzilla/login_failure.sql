CREATE TABLE `login_failure` (
  `user_id` mediumint(9) unsigned NOT NULL,
  `login_time` datetime NOT NULL,
  `ip_addr` varchar(40) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  KEY `login_failure_user_id_idx` (`user_id`),
  CONSTRAINT `fk_login_failure_user_id_profiles_userid` FOREIGN KEY (`user_id`) REFERENCES `profiles` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

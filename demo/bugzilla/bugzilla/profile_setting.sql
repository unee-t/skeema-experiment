CREATE TABLE `profile_setting` (
  `user_id` mediumint(9) unsigned NOT NULL,
  `setting_name` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `setting_value` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  UNIQUE KEY `profile_setting_value_unique_idx` (`user_id`,`setting_name`),
  KEY `fk_profile_setting_setting_name_setting_name` (`setting_name`),
  CONSTRAINT `fk_profile_setting_setting_name_setting_name` FOREIGN KEY (`setting_name`) REFERENCES `setting` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_profile_setting_user_id_profiles_userid` FOREIGN KEY (`user_id`) REFERENCES `profiles` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

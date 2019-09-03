CREATE TABLE `user_group_map` (
  `user_id` mediumint(9) unsigned NOT NULL,
  `group_id` mediumint(9) unsigned NOT NULL,
  `isbless` tinyint(4) NOT NULL DEFAULT '0',
  `grant_type` tinyint(4) NOT NULL DEFAULT '0',
  UNIQUE KEY `user_group_map_user_id_idx` (`user_id`,`group_id`,`grant_type`,`isbless`),
  KEY `fk_user_group_map_group_id_groups_id` (`group_id`),
  CONSTRAINT `fk_user_group_map_group_id_groups_id` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_group_map_user_id_profiles_userid` FOREIGN KEY (`user_id`) REFERENCES `profiles` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

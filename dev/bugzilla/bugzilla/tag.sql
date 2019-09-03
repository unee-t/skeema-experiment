CREATE TABLE `tag` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `user_id` mediumint(9) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tag_user_id_idx` (`user_id`,`name`),
  CONSTRAINT `fk_tag_user_id_profiles_userid` FOREIGN KEY (`user_id`) REFERENCES `profiles` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

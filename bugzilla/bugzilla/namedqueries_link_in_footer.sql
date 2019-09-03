CREATE TABLE `namedqueries_link_in_footer` (
  `namedquery_id` mediumint(9) unsigned NOT NULL,
  `user_id` mediumint(9) unsigned NOT NULL,
  UNIQUE KEY `namedqueries_link_in_footer_id_idx` (`namedquery_id`,`user_id`),
  KEY `namedqueries_link_in_footer_userid_idx` (`user_id`),
  CONSTRAINT `fk_namedqueries_link_in_footer_namedquery_id_namedqueries_id` FOREIGN KEY (`namedquery_id`) REFERENCES `namedqueries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_namedqueries_link_in_footer_user_id_profiles_userid` FOREIGN KEY (`user_id`) REFERENCES `profiles` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

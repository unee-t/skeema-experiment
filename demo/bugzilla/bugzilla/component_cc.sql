CREATE TABLE `component_cc` (
  `user_id` mediumint(9) unsigned NOT NULL,
  `component_id` mediumint(9) unsigned NOT NULL,
  UNIQUE KEY `component_cc_user_id_idx` (`component_id`,`user_id`),
  KEY `fk_component_cc_user_id_profiles_userid` (`user_id`),
  CONSTRAINT `fk_component_cc_component_id_components_id` FOREIGN KEY (`component_id`) REFERENCES `components` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_component_cc_user_id_profiles_userid` FOREIGN KEY (`user_id`) REFERENCES `profiles` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

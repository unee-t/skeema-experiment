CREATE TABLE `namedquery_group_map` (
  `namedquery_id` mediumint(9) unsigned NOT NULL,
  `group_id` mediumint(9) unsigned NOT NULL,
  UNIQUE KEY `namedquery_group_map_namedquery_id_idx` (`namedquery_id`),
  KEY `namedquery_group_map_group_id_idx` (`group_id`),
  CONSTRAINT `fk_namedquery_group_map_group_id_groups_id` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_namedquery_group_map_namedquery_id_namedqueries_id` FOREIGN KEY (`namedquery_id`) REFERENCES `namedqueries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

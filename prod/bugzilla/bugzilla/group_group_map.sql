CREATE TABLE `group_group_map` (
  `member_id` mediumint(9) unsigned NOT NULL,
  `grantor_id` mediumint(9) unsigned NOT NULL,
  `grant_type` tinyint(4) NOT NULL DEFAULT '0',
  UNIQUE KEY `group_group_map_member_id_idx` (`member_id`,`grantor_id`,`grant_type`),
  KEY `fk_group_group_map_grantor_id_groups_id` (`grantor_id`),
  KEY `group_group_map_member_id_grant_type_idx` (`member_id`,`grant_type`),
  KEY `group_group_map_grantor_id_grant_type_idx` (`grantor_id`,`grant_type`),
  CONSTRAINT `fk_group_group_map_grantor_id_groups_id` FOREIGN KEY (`grantor_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_group_group_map_member_id_groups_id` FOREIGN KEY (`member_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

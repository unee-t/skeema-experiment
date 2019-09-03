CREATE TABLE `group_control_map` (
  `group_id` mediumint(9) unsigned NOT NULL,
  `product_id` mediumint(9) unsigned NOT NULL,
  `entry` tinyint(4) NOT NULL DEFAULT '0',
  `membercontrol` tinyint(4) NOT NULL DEFAULT '0',
  `othercontrol` tinyint(4) NOT NULL DEFAULT '0',
  `canedit` tinyint(4) NOT NULL DEFAULT '0',
  `editcomponents` tinyint(4) NOT NULL DEFAULT '0',
  `editbugs` tinyint(4) NOT NULL DEFAULT '0',
  `canconfirm` tinyint(4) NOT NULL DEFAULT '0',
  UNIQUE KEY `group_control_map_product_id_idx` (`product_id`,`group_id`),
  KEY `group_control_map_group_id_idx` (`group_id`),
  CONSTRAINT `fk_group_control_map_group_id_groups_id` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_group_control_map_product_id_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

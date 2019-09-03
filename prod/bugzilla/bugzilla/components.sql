CREATE TABLE `components` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `product_id` mediumint(9) unsigned NOT NULL,
  `initialowner` mediumint(9) unsigned NOT NULL,
  `initialqacontact` mediumint(9) unsigned DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `isactive` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `components_product_id_idx` (`product_id`,`name`),
  KEY `components_name_idx` (`name`),
  KEY `fk_components_initialowner_profiles_userid` (`initialowner`),
  KEY `fk_components_initialqacontact_profiles_userid` (`initialqacontact`),
  CONSTRAINT `fk_components_initialowner_profiles_userid` FOREIGN KEY (`initialowner`) REFERENCES `profiles` (`userid`) ON UPDATE CASCADE,
  CONSTRAINT `fk_components_initialqacontact_profiles_userid` FOREIGN KEY (`initialqacontact`) REFERENCES `profiles` (`userid`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_components_product_id_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE `versions` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `value` varchar(64) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `product_id` mediumint(9) unsigned NOT NULL,
  `isactive` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `versions_product_id_idx` (`product_id`,`value`),
  CONSTRAINT `fk_versions_product_id_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

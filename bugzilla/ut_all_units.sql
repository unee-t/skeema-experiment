CREATE TABLE `ut_all_units` (
  `id_record` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` mediumint(9) unsigned NOT NULL COMMENT 'The id in the `products` table',
  PRIMARY KEY (`id_record`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

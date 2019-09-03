CREATE TABLE `longdescs_tags_weights` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(24) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `weight` mediumint(9) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `longdescs_tags_weights_tag_idx` (`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

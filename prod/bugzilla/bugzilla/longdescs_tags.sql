CREATE TABLE `longdescs_tags` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` int(11) unsigned DEFAULT NULL,
  `tag` varchar(24) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `longdescs_tags_idx` (`comment_id`,`tag`),
  CONSTRAINT `fk_longdescs_tags_comment_id_longdescs_comment_id` FOREIGN KEY (`comment_id`) REFERENCES `longdescs` (`comment_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

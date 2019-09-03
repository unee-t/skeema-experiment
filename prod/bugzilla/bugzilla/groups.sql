CREATE TABLE `groups` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `isbuggroup` tinyint(4) NOT NULL,
  `userregexp` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `isactive` tinyint(4) NOT NULL DEFAULT '1',
  `icon_url` text COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `groups_name_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

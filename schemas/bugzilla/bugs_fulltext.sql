CREATE TABLE `bugs_fulltext` (
  `bug_id` mediumint(9) unsigned NOT NULL,
  `short_desc` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comments` longtext COLLATE utf8mb4_unicode_520_ci,
  `comments_noprivate` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`bug_id`),
  FULLTEXT KEY `bugs_fulltext_short_desc_idx` (`short_desc`),
  FULLTEXT KEY `bugs_fulltext_comments_idx` (`comments`),
  FULLTEXT KEY `bugs_fulltext_comments_noprivate_idx` (`comments_noprivate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

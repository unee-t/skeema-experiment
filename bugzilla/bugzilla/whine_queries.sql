CREATE TABLE `whine_queries` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `eventid` mediumint(9) unsigned NOT NULL,
  `query_name` varchar(64) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `sortkey` smallint(6) unsigned NOT NULL DEFAULT '0',
  `onemailperbug` tinyint(4) NOT NULL DEFAULT '0',
  `title` varchar(128) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `whine_queries_eventid_idx` (`eventid`),
  CONSTRAINT `fk_whine_queries_eventid_whine_events_id` FOREIGN KEY (`eventid`) REFERENCES `whine_events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

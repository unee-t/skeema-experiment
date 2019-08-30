CREATE TABLE `whine_schedules` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `eventid` mediumint(9) unsigned NOT NULL,
  `run_day` varchar(32) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `run_time` varchar(32) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `run_next` datetime DEFAULT NULL,
  `mailto` mediumint(9) unsigned NOT NULL,
  `mailto_type` smallint(6) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `whine_schedules_run_next_idx` (`run_next`),
  KEY `whine_schedules_eventid_idx` (`eventid`),
  CONSTRAINT `fk_whine_schedules_eventid_whine_events_id` FOREIGN KEY (`eventid`) REFERENCES `whine_events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

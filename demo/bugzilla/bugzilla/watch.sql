CREATE TABLE `watch` (
  `watcher` mediumint(9) unsigned NOT NULL,
  `watched` mediumint(9) unsigned NOT NULL,
  UNIQUE KEY `watch_watcher_idx` (`watcher`,`watched`),
  KEY `watch_watched_idx` (`watched`),
  CONSTRAINT `fk_watch_watched_profiles_userid` FOREIGN KEY (`watched`) REFERENCES `profiles` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_watch_watcher_profiles_userid` FOREIGN KEY (`watcher`) REFERENCES `profiles` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

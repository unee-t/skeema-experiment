CREATE TABLE `ts_job` (
  `jobid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `funcid` int(11) unsigned NOT NULL,
  `arg` longblob,
  `uniqkey` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `insert_time` int(11) unsigned DEFAULT NULL,
  `run_after` int(11) unsigned NOT NULL,
  `grabbed_until` int(11) unsigned NOT NULL,
  `priority` smallint(6) unsigned DEFAULT NULL,
  `coalesce` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`jobid`),
  UNIQUE KEY `ts_job_funcid_idx` (`funcid`,`uniqkey`),
  KEY `ts_job_run_after_idx` (`run_after`,`funcid`),
  KEY `ts_job_coalesce_idx` (`coalesce`,`funcid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

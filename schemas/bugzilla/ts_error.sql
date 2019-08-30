CREATE TABLE `ts_error` (
  `error_time` int(11) unsigned NOT NULL,
  `jobid` int(11) unsigned NOT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `funcid` int(11) unsigned NOT NULL DEFAULT '0',
  KEY `ts_error_funcid_idx` (`funcid`,`error_time`),
  KEY `ts_error_error_time_idx` (`error_time`),
  KEY `ts_error_jobid_idx` (`jobid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

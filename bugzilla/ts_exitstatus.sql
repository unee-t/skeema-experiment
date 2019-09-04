CREATE TABLE `ts_exitstatus` (
  `jobid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `funcid` int(11) unsigned NOT NULL DEFAULT '0',
  `status` smallint(6) unsigned DEFAULT NULL,
  `completion_time` int(11) unsigned DEFAULT NULL,
  `delete_after` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`jobid`),
  KEY `ts_exitstatus_funcid_idx` (`funcid`),
  KEY `ts_exitstatus_delete_after_idx` (`delete_after`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

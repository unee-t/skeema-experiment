CREATE TABLE `ts_note` (
  `jobid` int(11) unsigned NOT NULL,
  `notekey` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `value` longblob,
  UNIQUE KEY `ts_note_jobid_idx` (`jobid`,`notekey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

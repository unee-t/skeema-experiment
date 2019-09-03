CREATE TABLE `ts_funcmap` (
  `funcid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `funcname` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`funcid`),
  UNIQUE KEY `ts_funcmap_funcname_idx` (`funcname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

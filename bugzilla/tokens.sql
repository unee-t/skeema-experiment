CREATE TABLE `tokens` (
  `userid` mediumint(9) unsigned DEFAULT NULL,
  `issuedate` datetime NOT NULL,
  `token` varchar(16) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `tokentype` varchar(16) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `eventdata` text COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`token`),
  KEY `tokens_userid_idx` (`userid`),
  CONSTRAINT `fk_tokens_userid_profiles_userid` FOREIGN KEY (`userid`) REFERENCES `profiles` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE `logincookies` (
  `cookie` varchar(16) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `userid` mediumint(9) unsigned NOT NULL,
  `ipaddr` varchar(40) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `lastused` datetime NOT NULL,
  PRIMARY KEY (`cookie`),
  KEY `logincookies_lastused_idx` (`lastused`),
  KEY `fk_logincookies_userid_profiles_userid` (`userid`),
  CONSTRAINT `fk_logincookies_userid_profiles_userid` FOREIGN KEY (`userid`) REFERENCES `profiles` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

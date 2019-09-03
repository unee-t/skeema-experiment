CREATE TABLE `quips` (
  `quipid` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `userid` mediumint(9) unsigned DEFAULT NULL,
  `quip` varchar(512) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `approved` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`quipid`),
  KEY `fk_quips_userid_profiles_userid` (`userid`),
  CONSTRAINT `fk_quips_userid_profiles_userid` FOREIGN KEY (`userid`) REFERENCES `profiles` (`userid`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE `uneet_enterprise_settings` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TYPE` int(11) DEFAULT '1',
  `NAME` mediumtext CHARACTER SET utf8,
  `USERNAME` mediumtext CHARACTER SET utf8,
  `COOKIE` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `SEARCH` mediumtext CHARACTER SET utf8,
  `TABLENAME` varchar(300) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

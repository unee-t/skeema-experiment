CREATE TABLE `uneet_enterprise_ugmembers` (
  `UserName` varchar(300) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `GroupID` int(11) NOT NULL,
  PRIMARY KEY (`UserName`(50),`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

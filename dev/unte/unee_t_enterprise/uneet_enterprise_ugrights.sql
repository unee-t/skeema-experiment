CREATE TABLE `uneet_enterprise_ugrights` (
  `TableName` varchar(300) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `GroupID` int(11) NOT NULL,
  `AccessMask` varchar(10) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`TableName`(50),`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

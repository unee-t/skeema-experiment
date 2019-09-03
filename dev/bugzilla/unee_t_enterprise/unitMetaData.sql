CREATE TABLE `unitMetaData` (
  `primary_key` bigint(20) NOT NULL AUTO_INCREMENT,
  `mefe_unit_id` longtext,
  `displayName` longtext,
  `bzId` int(11) DEFAULT NULL,
  `bzName` longtext,
  `createdAt` datetime(3) DEFAULT NULL,
  `creatorId` longtext,
  `unitType` longtext,
  PRIMARY KEY (`primary_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

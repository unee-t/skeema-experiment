CREATE TABLE `manually_created_units` (
  `pilot_user` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `pilotId` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `bzId` smallint(6) NOT NULL AUTO_INCREMENT,
  `bz_name` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `ownerIds` json DEFAULT NULL,
  `ownerIds_dev` json DEFAULT NULL,
  `moreInfo` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `unitType` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `displayName` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `streetAddress` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `zipCode` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`bzId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

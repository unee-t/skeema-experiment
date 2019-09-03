CREATE TABLE `uneet_enterprise_users` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `fullname` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `groupid` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `active` int(11) DEFAULT NULL COMMENT 'is this an active user',
  `organization_id` int(11) unsigned DEFAULT NULL COMMENT 'A FK to the table `uneet_enterprise_organizations` - The ID of the organization for the user',
  PRIMARY KEY (`ID`),
  KEY `user_organization_id` (`organization_id`),
  CONSTRAINT `user_organization_id` FOREIGN KEY (`organization_id`) REFERENCES `uneet_enterprise_organizations` (`id_organization`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE `uneet_enterprise_audit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `datetime` datetime NOT NULL,
  `ip` varchar(40) CHARACTER SET utf8 NOT NULL,
  `user` varchar(300) CHARACTER SET utf8 DEFAULT NULL,
  `table` varchar(300) CHARACTER SET utf8 DEFAULT NULL,
  `action` varchar(250) CHARACTER SET utf8 NOT NULL,
  `description` mediumtext CHARACTER SET utf8,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE `ut_map_contractor_to_user` (
  `contractor_id` int(11) unsigned NOT NULL COMMENT 'id in the table `ut_contractors`',
  `bz_user_id` mediumint(9) unsigned NOT NULL COMMENT 'id in the table `profiles`',
  `created` datetime DEFAULT NULL COMMENT 'creation ts'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

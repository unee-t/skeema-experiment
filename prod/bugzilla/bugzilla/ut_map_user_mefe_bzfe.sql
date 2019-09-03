CREATE TABLE `ut_map_user_mefe_bzfe` (
  `created` datetime DEFAULT NULL COMMENT 'creation ts',
  `record_created_by` mediumint(9) unsigned DEFAULT NULL COMMENT 'id of the user who created this user in the bz `profiles` table',
  `is_obsolete` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'This is an obsolete record',
  `bzfe_update_needed` tinyint(1) DEFAULT '0' COMMENT 'Do we need to update this record in the BZFE - This is to keep track of the user that have been modified in the MEFE but NOT yet in the BZFE',
  `mefe_user_id` varchar(256) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'id of the user in the MEFE',
  `bz_profile_id` mediumint(6) DEFAULT NULL COMMENT 'id of the user in the BZFE',
  `comment` mediumtext COLLATE utf8mb4_unicode_520_ci COMMENT 'Any comment'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

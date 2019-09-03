CREATE TABLE `ut_data_to_add_user_to_a_case` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'The unique ID in this table',
  `mefe_invitation_id` varchar(256) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'The unique Id for the invitation that was generated in MEFE to do the data import',
  `mefe_invitation_id_int_value` int(11) DEFAULT NULL COMMENT 'The INT value for the invitation ID. We use this everywhere in the SELECT invocations.',
  `mefe_invitor_user_id` varchar(256) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'The id of the creator of this unit in the MEFE database',
  `bzfe_invitor_user_id` mediumint(9) unsigned NOT NULL COMMENT 'The BZFE user id who creates this unit. this is a FK to the BZ table ''profiles''',
  `bz_user_id` mediumint(9) unsigned NOT NULL COMMENT 'The userid for the user that will be rfeplcing the dummy user for this role for this unit. This is a FK to the BZ table ''profiles''',
  `bz_case_id` mediumint(9) unsigned NOT NULL COMMENT 'The case id that the user is invited to - This is a FK to the BZ table ''bugs''',
  `bz_created_date` datetime DEFAULT NULL COMMENT 'Date and time when this unit has been created in the BZ databae',
  `comment` mediumtext COLLATE utf8mb4_unicode_520_ci COMMENT 'Any comment',
  PRIMARY KEY (`id`),
  KEY `add_user_to_a_case_invitor_bz_id` (`bzfe_invitor_user_id`),
  KEY `add_user_to_a_case_invitee_bz_id` (`bz_user_id`),
  KEY `add_user_to_a_case_case_id` (`bz_case_id`),
  CONSTRAINT `add_user_to_a_case_case_id` FOREIGN KEY (`bz_case_id`) REFERENCES `bugs` (`bug_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `add_user_to_a_case_invitee_bz_id` FOREIGN KEY (`bz_user_id`) REFERENCES `profiles` (`userid`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `add_user_to_a_case_invitor_bz_id` FOREIGN KEY (`bzfe_invitor_user_id`) REFERENCES `profiles` (`userid`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

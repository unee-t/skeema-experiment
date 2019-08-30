CREATE TABLE `ut_notification_message_new` (
  `notification_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id in this table',
  `created_datetime` datetime DEFAULT NULL COMMENT 'Timestamp when this was created',
  `processed_datetime` datetime DEFAULT NULL COMMENT 'Timestamp when this notification was processed',
  `unit_id` mediumint(9) unsigned DEFAULT NULL COMMENT 'Unit ID - a FK to the BZ table ''products''',
  `case_id` mediumint(9) unsigned DEFAULT NULL COMMENT 'Case ID - a FK to the BZ table ''bugs''',
  `case_title` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'The title for the case - the is the field `short_desc` in the `bugs` table',
  `user_id` mediumint(9) unsigned DEFAULT NULL COMMENT 'User ID - The user who inititated the change - a FK to the BZ table ''profiles''',
  `is_case_description` tinyint(1) DEFAULT NULL COMMENT '1 if this is the FIRST message for a case (the case description)',
  `message_truncated` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'The message, truncated to the first 255 characters',
  `case_reporter_user_id` mediumint(9) unsigned DEFAULT NULL COMMENT 'User ID - BZ user id of the reporter for the case',
  `old_case_assignee_user_id` mediumint(9) unsigned DEFAULT NULL COMMENT 'User ID - BZ user id of the assignee for the case before the change',
  `new_case_assignee_user_id` mediumint(9) unsigned DEFAULT NULL COMMENT 'User ID - BZ user id of the assignee for the case after the change',
  `current_list_of_invitees` longtext COLLATE utf8mb4_unicode_520_ci COMMENT 'comma separated list of user IDs - BZ user ids of the user in cc for this case/bug AFTER the change',
  `current_status` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'The current status of the case/bug',
  `current_resolution` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'The current resolution of the case/bug',
  `current_severity` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'The current severity of the case/bug',
  PRIMARY KEY (`notification_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci ROW_FORMAT=DYNAMIC;

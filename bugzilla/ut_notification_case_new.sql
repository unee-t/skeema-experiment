CREATE TABLE `ut_notification_case_new` (
  `notification_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id in this table',
  `created_datetime` datetime DEFAULT NULL COMMENT 'Timestamp when this was created',
  `processed_datetime` datetime DEFAULT NULL COMMENT 'Timestamp when this notification was processed',
  `unit_id` mediumint(9) unsigned DEFAULT NULL COMMENT 'Unit ID - a FK to the BZ table ''products''',
  `case_id` mediumint(9) unsigned DEFAULT NULL COMMENT 'Case ID - a FK to the BZ table ''bugs''',
  `case_title` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'The title for the case - the is the field `short_desc` in the `bugs` table',
  `reporter_user_id` mediumint(9) unsigned DEFAULT NULL COMMENT 'The BZ profile Id of the reporter for the case',
  `assignee_user_id` mediumint(9) unsigned DEFAULT NULL COMMENT 'The BZ profile ID of the Assignee to the case',
  `current_status` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'The current status of the case/bug',
  `current_resolution` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'The current resolution of the case/bug',
  `current_severity` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'The current severity of the case/bug',
  PRIMARY KEY (`notification_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci ROW_FORMAT=DYNAMIC;

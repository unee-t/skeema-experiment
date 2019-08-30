DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `create_temp_table_to_update_permissions`()
    SQL SECURITY INVOKER
BEGIN
	# We use a temporary table to make sure we do not have duplicates.
		
		# DELETE the temp table if it exists
		DROP TEMPORARY TABLE IF EXISTS `ut_user_group_map_temp`;
		
		# Re-create the temp table
		CREATE TEMPORARY TABLE `ut_user_group_map_temp` (
			`user_id` MEDIUMINT(9) NOT NULL
			, `group_id` MEDIUMINT(9) NOT NULL
			, `isbless` TINYINT(4) NOT NULL DEFAULT 0
			, `grant_type` TINYINT(4) NOT NULL DEFAULT 0,
			KEY `search_user_id` (`user_id`, `group_id`),
			KEY `search_group_id` (`group_id`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci
		;

END//
DELIMITER ;

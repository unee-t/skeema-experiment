DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `create_temp_table_to_update_group_permissions`()
    SQL SECURITY INVOKER
BEGIN

	# DELETE the temp table if it exists
		DROP TEMPORARY TABLE IF EXISTS `ut_group_group_map_temp`;

	# Re-create the temp table
		CREATE TEMPORARY TABLE `ut_group_group_map_temp` (
		`member_id` MEDIUMINT(9) NOT NULL
		, `grantor_id` MEDIUMINT(9) NOT NULL
		, `grant_type` TINYINT(4) NOT NULL DEFAULT 0,
		KEY `search_member_id` (`member_id`),
		KEY `search_grantor_id` (`grantor_id`)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci
		;

END//
DELIMITER ;

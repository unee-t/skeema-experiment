DELIMITER //
CREATE DEFINER=`hmlet_dev_root`@`%` PROCEDURE `ut_retry_create_unit_level_1`()
    SQL SECURITY INVOKER
BEGIN

####################
#
# WARNING!!
# Only run this if you are CERTAIN that the API has failed somehow
#
####################

# Clean slate - remove all data from `retry_create_units_list_units`

	TRUNCATE TABLE `retry_create_units_list_units` ;

# We insert the data we need in the table `retry_create_units_list_units`

	INSERT INTO `retry_create_units_list_units`
		(`unit_creation_request_id`
		, `created_by_id`
		, `creation_method`
		, `uneet_name`
		, `unee_t_unit_type`
		, `more_info`
		, `street_address`
		, `city`
		, `state`
		, `zip_code`
		, `country`
		)
	SELECT
		`unit_creation_request_id`
		, `created_by_id`
		, 'ut_retry_create_unit_level_1' AS `creation_method`
		, `uneet_name`
		, `unee_t_unit_type`
		, `more_info`
		, `street_address`
		, `city`
		, `state`
		, `zip_code`
		, `country`
	FROM `ut_list_unit_id_level_1_failed_creation`
		;

END//
DELIMITER ;

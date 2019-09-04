DELIMITER //
CREATE DEFINER=`admin`@`%` PROCEDURE `ut_retry_assign_user_to_units_error_ownership`()
    SQL SECURITY INVOKER
BEGIN

####################
#
# WARNING!!
# Only run this if you are CERTAIN that the API has failed somehow
#
####################

# Clean slate - remove all data from `retry_assign_user_to_units_list`

	TRUNCATE TABLE `retry_assign_user_to_units_list` ;

# We insert the data we need in the table `retry_assign_user_to_units_list`
# This will trigger a retry of the lambda call

	INSERT INTO `retry_assign_user_to_units_list`
		( `id_map_user_unit_permissions`
		, `syst_created_datetime`
		, `creation_system_id`
		, `created_by_id`
		, `creation_method`
		, `mefe_user_id`
		, `uneet_login_name`
		, `mefe_unit_id`
		, `uneet_name`
		, `unee_t_role_id`
		, `is_occupant`
		, `is_default_assignee`
		, `is_default_invited`
		, `is_unit_owner`
		, `is_public`
		, `can_see_role_landlord`
		, `can_see_role_tenant`
		, `can_see_role_mgt_cny`
		, `can_see_role_agent`
		, `can_see_role_contractor`
		, `can_see_occupant`
		, `is_assigned_to_case`
		, `is_invited_to_case`
		, `is_next_step_updated`
		, `is_deadline_updated`
		, `is_solution_updated`
		, `is_case_resolved`
		, `is_case_blocker`
		, `is_case_critical`
		, `is_any_new_message`
		, `is_message_from_my_role`
		, `is_message_from_tenant`
		, `is_message_from_ll`
		, `is_message_from_occupant`
		, `is_message_from_agent`
		, `is_message_from_mgt_cny`
		, `is_message_from_contractor`
		, `is_new_ir`
		, `is_new_item`
		, `is_item_removed`
		, `is_item_moved`
		)
	SELECT
		`a`.`id_map_user_unit_permissions`
		, `b`.`syst_created_datetime`
		, `b`.`creation_system_id`
		, `b`.`created_by_id`
		, 'ut_retry_assign_user_to_units_error_ownership'
		, `a`.`mefe_user_id`
		, `a`.`uneet_login_name`
		, `a`.`unee_t_unit_id`
		, `a`.`uneet_name`
		, `b`.`unee_t_role_id`
		, `b`.`is_occupant`
		, `b`.`is_default_assignee`
		, `b`.`is_default_invited`
		, `b`.`is_unit_owner`
		, `b`.`is_public`
		, `b`.`can_see_role_landlord`
		, `b`.`can_see_role_tenant`
		, `b`.`can_see_role_mgt_cny`
		, `b`.`can_see_role_agent`
		, `b`.`can_see_role_contractor`
		, `b`.`can_see_occupant`
		, `b`.`is_assigned_to_case`
		, `b`.`is_invited_to_case`
		, `b`.`is_next_step_updated`
		, `b`.`is_deadline_updated`
		, `b`.`is_solution_updated`
		, `b`.`is_case_resolved`
		, `b`.`is_case_blocker`
		, `b`.`is_case_critical`
		, `b`.`is_any_new_message`
		, `b`.`is_message_from_my_role`
		, `b`.`is_message_from_tenant`
		, `b`.`is_message_from_ll`
		, `b`.`is_message_from_occupant`
		, `b`.`is_message_from_agent`
		, `b`.`is_message_from_mgt_cny`
		, `b`.`is_message_from_contractor`
		, `b`.`is_new_ir`
		, `b`.`is_new_item`
		, `b`.`is_item_removed`
		, `b`.`is_item_moved`
	FROM `ut_analysis_errors_not_an_owner_list` AS `a`
		INNER JOIN `ut_map_user_permissions_unit_all` AS `b`
			ON (`a`.`id_map_user_unit_permissions` = `b`.`id_map_user_unit_permissions`)
		;

END//
DELIMITER ;

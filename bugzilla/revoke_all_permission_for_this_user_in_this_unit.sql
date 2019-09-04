DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `revoke_all_permission_for_this_user_in_this_unit`()
    SQL SECURITY INVOKER
BEGIN

	# this procedure needs the following variables:
	#	 - @product_id
	#	 - @bz_user_id

	# We record the name of this procedure for future debugging and audit_log
		SET @script = 'PROCEDURE - revoke_all_permission_for_this_user_in_this_unit';
		SET @timestamp = NOW();

	# We need to get the group_id for this unit

		SET @can_see_time_tracking_group_id = 16;
		SET @can_create_shared_queries_group_id = 17;
		SET @can_tag_comment_group_id = 18;	
	
		SET @create_case_group_id =	(SELECT `group_id` FROM `ut_product_group` WHERE (`product_id` = @product_id AND `group_type_id` = 20));
		SET @can_edit_case_group_id = (SELECT `group_id` FROM `ut_product_group` WHERE (`product_id` = @product_id AND `group_type_id` = 25));
		SET @can_see_cases_group_id = (SELECT `group_id` FROM `ut_product_group` WHERE (`product_id` = @product_id AND `group_type_id` = 28));
	
		SET @can_edit_all_field_case_group_id = (SELECT `group_id` FROM `ut_product_group` WHERE (`product_id` = @product_id AND `group_type_id` = 26));
		
		SET @can_see_unit_in_search_group_id = (SELECT `group_id` FROM `ut_product_group` WHERE (`product_id` = @product_id AND `group_type_id` = 38));

		SET @list_visible_assignees_group_id = (SELECT `group_id` FROM `ut_product_group` WHERE (`product_id` = @product_id AND `group_type_id` = 4));
		SET @see_visible_assignees_group_id = (SELECT `group_id` FROM `ut_product_group` WHERE (`product_id` = @product_id AND `group_type_id` = 5));	

		SET @all_r_flags_group_id = (SELECT `group_id` FROM `ut_product_group` WHERE (`product_id` = @product_id AND `group_type_id` = 18));
		SET @all_g_flags_group_id = (SELECT `group_id` FROM `ut_product_group` WHERE (`product_id` = @product_id AND `group_type_id` = 19));

		SET @group_id_show_to_occupant = (SELECT `group_id` FROM `ut_product_group` WHERE (`product_id` = @product_id AND `group_type_id` = 24));
		SET @group_id_are_users_occupant = (SELECT `group_id` FROM `ut_product_group` WHERE (`product_id` = @product_id AND `group_type_id` = 3));
		SET @group_id_see_users_occupant = (SELECT `group_id` FROM `ut_product_group` WHERE (`product_id` = @product_id AND `group_type_id` = 36));

		SET @group_id_show_to_tenant = (SELECT `group_id` FROM `ut_product_group` WHERE (`product_id` = @product_id AND `group_type_id` = 2 AND `role_type_id` = 1));
		SET @group_id_are_users_tenant = (SELECT `group_id` FROM `ut_product_group` WHERE (`product_id` = @product_id AND `group_type_id` = 22 AND `role_type_id` = 1));
		SET @group_id_see_users_tenant = (SELECT `group_id` FROM `ut_product_group` WHERE (`product_id` = @product_id AND `group_type_id` = 37 AND `role_type_id` = 1));

		SET @group_id_show_to_landlord = (SELECT `group_id` FROM `ut_product_group` WHERE (`product_id` = @product_id AND `group_type_id` = 2 AND `role_type_id` = 2));
		SET @group_id_are_users_landlord = (SELECT `group_id` FROM `ut_product_group` WHERE (`product_id` = @product_id AND `group_type_id` = 22 AND `role_type_id` = 2));
		SET @group_id_see_users_landlord = (SELECT `group_id` FROM `ut_product_group` WHERE (`product_id` = @product_id AND `group_type_id` = 37 AND `role_type_id` = 2));

		SET @group_id_show_to_agent = (SELECT `group_id` FROM `ut_product_group` WHERE (`product_id` = @product_id AND `group_type_id` = 2 AND `role_type_id` = 5));
		SET @group_id_are_users_agent = (SELECT `group_id` FROM `ut_product_group` WHERE (`product_id` = @product_id AND `group_type_id` = 22 AND `role_type_id` = 5));
		SET @group_id_see_users_agent = (SELECT `group_id` FROM `ut_product_group` WHERE (`product_id` = @product_id AND `group_type_id` = 37 AND `role_type_id` = 5));

		SET @group_id_show_to_contractor = (SELECT `group_id` FROM `ut_product_group` WHERE (`product_id` = @product_id AND `group_type_id` = 2 AND `role_type_id` = 3));
		SET @group_id_are_users_contractor = (SELECT `group_id` FROM `ut_product_group` WHERE (`product_id` = @product_id AND `group_type_id` = 22 AND `role_type_id` = 3));
		SET @group_id_see_users_contractor = (SELECT `group_id` FROM `ut_product_group` WHERE (`product_id` = @product_id AND `group_type_id` = 37 AND `role_type_id` = 3));

		SET @group_id_show_to_mgt_cny = (SELECT `group_id` FROM `ut_product_group` WHERE (`product_id` = @product_id AND `group_type_id` = 2 AND `role_type_id` = 4));
		SET @group_id_are_users_mgt_cny = (SELECT `group_id` FROM `ut_product_group` WHERE (`product_id` = @product_id AND `group_type_id` = 22 AND `role_type_id` = 4));
		SET @group_id_see_users_mgt_cny = (SELECT `group_id` FROM `ut_product_group` WHERE (`product_id` = @product_id AND `group_type_id` = 37 AND `role_type_id` = 4));

	# We can now remove all the permissions for this unit.

		DELETE FROM `user_group_map`
			WHERE (
				(`user_id` = @bz_user_id AND `group_id` = @can_see_time_tracking_group_id)
				OR (`user_id` = @bz_user_id AND `group_id` = @can_create_shared_queries_group_id)
				OR (`user_id` = @bz_user_id AND `group_id` = @can_tag_comment_group_id)
				OR (`user_id` = @bz_user_id AND `group_id` = @create_case_group_id)
				OR (`user_id` = @bz_user_id AND `group_id` = @can_edit_case_group_id)
				OR (`user_id` = @bz_user_id AND `group_id` = @can_see_cases_group_id)
				OR (`user_id` = @bz_user_id AND `group_id` = @can_edit_all_field_case_group_id)
				OR (`user_id` = @bz_user_id AND `group_id` = @can_see_unit_in_search_group_id)
				OR (`user_id` = @bz_user_id AND `group_id` = @list_visible_assignees_group_id)
				OR (`user_id` = @bz_user_id AND `group_id` = @see_visible_assignees_group_id)
				OR (`user_id` = @bz_user_id AND `group_id` = @all_r_flags_group_id)
				OR (`user_id` = @bz_user_id AND `group_id` = @all_g_flags_group_id)
				OR (`user_id` = @bz_user_id AND `group_id` = @group_id_show_to_occupant)
				OR (`user_id` = @bz_user_id AND `group_id` = @group_id_are_users_occupant)
				OR (`user_id` = @bz_user_id AND `group_id` = @group_id_see_users_occupant)
				OR (`user_id` = @bz_user_id AND `group_id` = @group_id_show_to_tenant)
				OR (`user_id` = @bz_user_id AND `group_id` = @group_id_are_users_tenant)
				OR (`user_id` = @bz_user_id AND `group_id` = @group_id_see_users_tenant)
				OR (`user_id` = @bz_user_id AND `group_id` = @group_id_show_to_landlord)
				OR (`user_id` = @bz_user_id AND `group_id` = @group_id_are_users_landlord)
				OR (`user_id` = @bz_user_id AND `group_id` = @group_id_see_users_landlord)
				OR (`user_id` = @bz_user_id AND `group_id` = @group_id_show_to_agent)
				OR (`user_id` = @bz_user_id AND `group_id` = @group_id_are_users_agent)
				OR (`user_id` = @bz_user_id AND `group_id` = @group_id_see_users_agent)
				OR (`user_id` = @bz_user_id AND `group_id` = @group_id_show_to_contractor)
				OR (`user_id` = @bz_user_id AND `group_id` = @group_id_are_users_contractor)
				OR (`user_id` = @bz_user_id AND `group_id` = @group_id_see_users_contractor)
				OR (`user_id` = @bz_user_id AND `group_id` = @group_id_show_to_mgt_cny)
				OR (`user_id` = @bz_user_id AND `group_id` = @group_id_are_users_mgt_cny)
				OR (`user_id` = @bz_user_id AND `group_id` = @group_id_see_users_mgt_cny)
				)
				;

		# We also delete from the table `ut_user_group_map_temp`
		# This is needed so we do not re-create the permissions when we invite a new user or create a new unit.

			DELETE FROM `ut_user_group_map_temp`
				WHERE (
					(`user_id` = @bz_user_id AND `group_id` = @can_see_time_tracking_group_id)
					OR (`user_id` = @bz_user_id AND `group_id` = @can_create_shared_queries_group_id)
					OR (`user_id` = @bz_user_id AND `group_id` = @can_tag_comment_group_id)
					OR (`user_id` = @bz_user_id AND `group_id` = @create_case_group_id)
					OR (`user_id` = @bz_user_id AND `group_id` = @can_edit_case_group_id)
					OR (`user_id` = @bz_user_id AND `group_id` = @can_see_cases_group_id)
					OR (`user_id` = @bz_user_id AND `group_id` = @can_edit_all_field_case_group_id)
					OR (`user_id` = @bz_user_id AND `group_id` = @can_see_unit_in_search_group_id)
					OR (`user_id` = @bz_user_id AND `group_id` = @list_visible_assignees_group_id)
					OR (`user_id` = @bz_user_id AND `group_id` = @see_visible_assignees_group_id)
					OR (`user_id` = @bz_user_id AND `group_id` = @all_r_flags_group_id)
					OR (`user_id` = @bz_user_id AND `group_id` = @all_g_flags_group_id)
					OR (`user_id` = @bz_user_id AND `group_id` = @group_id_show_to_occupant)
					OR (`user_id` = @bz_user_id AND `group_id` = @group_id_are_users_occupant)
					OR (`user_id` = @bz_user_id AND `group_id` = @group_id_see_users_occupant)
					OR (`user_id` = @bz_user_id AND `group_id` = @group_id_show_to_tenant)
					OR (`user_id` = @bz_user_id AND `group_id` = @group_id_are_users_tenant)
					OR (`user_id` = @bz_user_id AND `group_id` = @group_id_see_users_tenant)
					OR (`user_id` = @bz_user_id AND `group_id` = @group_id_show_to_landlord)
					OR (`user_id` = @bz_user_id AND `group_id` = @group_id_are_users_landlord)
					OR (`user_id` = @bz_user_id AND `group_id` = @group_id_see_users_landlord)
					OR (`user_id` = @bz_user_id AND `group_id` = @group_id_show_to_agent)
					OR (`user_id` = @bz_user_id AND `group_id` = @group_id_are_users_agent)
					OR (`user_id` = @bz_user_id AND `group_id` = @group_id_see_users_agent)
					OR (`user_id` = @bz_user_id AND `group_id` = @group_id_show_to_contractor)
					OR (`user_id` = @bz_user_id AND `group_id` = @group_id_are_users_contractor)
					OR (`user_id` = @bz_user_id AND `group_id` = @group_id_see_users_contractor)
					OR (`user_id` = @bz_user_id AND `group_id` = @group_id_show_to_mgt_cny)
					OR (`user_id` = @bz_user_id AND `group_id` = @group_id_are_users_mgt_cny)
					OR (`user_id` = @bz_user_id AND `group_id` = @group_id_see_users_mgt_cny)
					)
					;

			# Log the actions of the script.

				SET @script_log_message = CONCAT('We have revoked all the permissions for the bz user #'
										, @bz_user_id
										, '\r\- can_see_time_tracking: 0'
										, '\r\- can_create_shared_queries: 0'
										, '\r\- can_tag_comment: 0'
										, '\r\- can_create_case: 0'
										, '\r\- can_edit_a_case: 0'
										, '\r\- can_see_cases: 0'
										, '\r\- can_edit_all_field_in_a_case_regardless_of_role: 0'
										, '\r\- can_see_unit_in_search: 0'
										, '\r\- user_can_see_publicly_visible: 0'
										, '\r\- user_is_publicly_visible: 0'
										, '\r\- can_ask_to_approve: 0'
										, '\r\- can_approve: 0'
										, '\r\- show_to_occupant: 0'
										, '\r\- are_users_occupant: 0'
										, '\r\- see_users_occupant: 0'
										, '\r\- show_to_tenant: 0'
										, '\r\- are_users_tenant: 0'
										, '\r\- see_users_tenant: 0'
										, '\r\- show_to_landlord: 0'
										, '\r\- are_users_landlord: 0'
										, '\r\- see_users_landlord: 0'
										, '\r\- show_to_agent: 0'
										, '\r\- are_users_agent: 0'
										, '\r\- see_users_agent: 0'
										, '\r\- show_to_contractor: 0'
										, '\r\- are_users_contractor: 0'
										, '\r\- see_users_contractor: 0'
										, '\r\- show_to_mgt_cny: 0'
										, '\r\- are_users_mgt_cny: 0'
										, '\r\- see_users_mgt_cny: 0'
										, '\r\For the product #'
										, @product_id										
										);
			
				INSERT INTO `ut_script_log`
					(`datetime`
					, `script`
					, `log`
					)
					VALUES
					(NOW(), @script, @script_log_message)
					;
				 
			# Cleanup the variables for the log messages
				SET @script_log_message = NULL;
				SET @script = NULL;

END//
DELIMITER ;

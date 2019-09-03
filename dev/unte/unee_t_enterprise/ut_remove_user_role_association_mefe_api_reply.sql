DELIMITER //
CREATE DEFINER=`hmlet_dev_root`@`%` PROCEDURE `ut_remove_user_role_association_mefe_api_reply`()
    SQL SECURITY INVOKER
BEGIN

# This procedure needs the following variables:
#	- @remove_user_from_unit_request_id 
#	- @updated_datetime (a TIMESTAMP)
#	- @mefe_api_error_message

	# We need to capture the MEFE user ID of the updater

		SET @updated_by_id := (SELECT `updated_by_id`
			FROM `ut_map_user_permissions_unit_all` 
			WHERE `id_map_user_unit_permissions` = @remove_user_from_unit_request_id
			);

	# Is it a success or an error?

		SET @is_mefe_api_success := (IF (@mefe_api_error_message = ''
				, 1
				, 0
				)
			);

	# Now we can do the update

		UPDATE `ut_map_user_permissions_unit_all`
		SET 
			`is_update_needed` := 0
			, `syst_updated_datetime` := @updated_datetime
			, `update_system_id` := 2
			, `updated_by_id` := @updated_by_id
			, `unee_t_update_ts` := @updated_datetime
			, `update_method` := 'ut_remove_user_role_association_mefe_api_reply'
			, `is_mefe_api_success` := @is_mefe_api_success
			, `mefe_api_error_message` := @mefe_api_error_message
			WHERE `id_map_user_unit_permissions` = @remove_user_from_unit_request_id
		;

END//
DELIMITER ;

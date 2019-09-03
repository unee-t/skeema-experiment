DELIMITER //
CREATE DEFINER=`hmlet_dev_root`@`%` PROCEDURE `ut_creation_user_mefe_api_reply`()
    SQL SECURITY INVOKER
BEGIN

# This procedure needs the following variables:
#	- @user_creation_request_id
#	- @mefe_user_id
#	- @mefe_user_api_key
#	- @creation_datetime
#	- @is_created_by_me
#	- @mefe_api_error_message

	# We need to capture the MEFE user ID of the updater

		SET @updated_by_id = (SELECT `created_by_id`
			FROM `ut_map_external_source_users` 
			WHERE `id_map` = @user_creation_request_id
			);

	# Is it a success or an error?

		SET @is_mefe_api_success := (IF (@mefe_api_error_message = ''
				, 1
				, 0
				)
			);

	# Now we can do the update

		UPDATE `ut_map_external_source_users`
		SET 
			`unee_t_mefe_user_id` := @mefe_user_id
			, `unee_t_mefe_user_api_key` = @mefe_user_api_key
			, `uneet_created_datetime` := @creation_datetime
			, `is_unee_t_created_by_me` := @is_created_by_me
			, `is_update_needed` := 0
			, `syst_updated_datetime` := NOW()
			, `update_system_id` := 2
			, `updated_by_id` := @updated_by_id
			, `update_method` = 'ut_creation_user_mefe_api_reply'
			, `is_mefe_api_success` := @is_mefe_api_success
			, `mefe_api_error_message` := @mefe_api_error_message
			WHERE `id_map` = @user_creation_request_id
		;

END//
DELIMITER ;

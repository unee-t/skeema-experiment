DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `disable_bugmail`()
    SQL SECURITY INVOKER
BEGIN
	IF (@is_mefe_only_user = 1)
	THEN UPDATE `profiles`
		SET 
			`disable_mail` = 1
		WHERE `userid` = @bz_user_id
		;

		# We record the name of this procedure for future debugging and audit_log
			SET @script = 'PROCEDURE - disable_bugmail';
			SET @timestamp = NOW();

		# Log the actions of the script.
			SET @script_log_message = CONCAT('the bz user #'
									, @bz_user_id
									, ' will NOT receive bugmail'
									);
			
			INSERT INTO `ut_script_log`
				(`datetime`
				, `script`
				, `log`
				)
				VALUES
				(@timestamp, @script, @script_log_message)
				;

		# We log what we have just done into the `ut_audit_log` table
			
			SET @bzfe_table = 'profiles';
			SET @permission_granted = ' will NOT receive bugmail.';

			INSERT INTO `ut_audit_log`
				 (`datetime`
				 , `bzfe_table`
				 , `bzfe_field`
				 , `previous_value`
				 , `new_value`
				 , `script`
				 , `comment`
				 )
				 VALUES
				 (@timestamp ,@bzfe_table, 'disable_mail', 'UNKNOWN', 1, @script, CONCAT('This BZ user id #', @bz_user_id, @permission_granted))
				;
		 
		# Cleanup the variables for the log messages
			SET @script_log_message = NULL;
			SET @bzfe_table = NULL;
			SET @permission_granted = NULL;
	
		# Add this information to the BZ `audit_log` table
			INSERT INTO `audit_log`
				(`user_id`
				, `class`
				, `object_id`
				, `field`
				, `removed`
				, `added`
				, `at_time`
				)
				VALUES
				(@creator_bz_id
				, 'Bugzilla::User'
				, @bz_user_id
				, 'disable_mail'
				, '1'
				, '0'
				, @timestamp
				)
				;

		# Log the actions of the script.
			SET @script_log_message = CONCAT('Update profile activity for user #'
									, @bz_user_id
									);
				
			INSERT INTO `ut_script_log`
				(`datetime`
				, `script`
				, `log`
				)
				VALUES
				(@timestamp, @script, @script_log_message)
				;
		 
		# Cleanup the variables for the log messages
			SET @script_log_message = NULL;
			SET @script = NULL;
			SET @timestamp = NULL;
			SET @bzfe_table = NULL;
			SET @permission_granted = NULL;
END IF ;
END//
DELIMITER ;

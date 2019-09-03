DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `change_case_assignee`()
    SQL SECURITY INVOKER
BEGIN
	IF (@change_case_assignee = 1)
	THEN 

	# We capture the current assignee for the case so that we can log what we did
		SET @current_assignee = (SELECT `assigned_to` FROM `bugs` WHERE `bug_id` = @bz_case_id);
		
	# We also need the login name for the previous assignee and the new assignee
		SET @current_assignee_username = (SELECT `login_name` FROM `profiles` WHERE `userid` = @current_assignee);
		
	# We need the login from the user we are inviting to the case
		SET @invitee_login_name = (SELECT `login_name` FROM `profiles` WHERE `userid` = @bz_user_id);

	# We record the name of this procedure for future debugging and audit_log
		SET @script = 'PROCEDURE - change_case_assignee';
		SET @timestamp = NOW();
		
	# We make the user the assignee for this case:
		UPDATE `bugs`
		SET 
			`assigned_to` = @bz_user_id
			, `delta_ts` = @timestamp
			, `lastdiffed` = @timestamp
		WHERE `bug_id` = @bz_case_id
		;

		# Log the actions of the script.
			SET @script_log_message = CONCAT('the bz user #'
										, @bz_user_id
										, ' is now the assignee for the case #'
										, @bz_case_id
										)
										;
				
			INSERT INTO `ut_script_log`
					(`datetime`
					, `script`
					, `log`
					)
					VALUES
					(@timestamp, @script, @script_log_message)
					;
		
	# Record the change in the Bug history
		INSERT INTO	`bugs_activity`
			(`bug_id` 
			, `who` 
			, `bug_when`
			, `fieldid`
			, `added`
			, `removed`
			)
			VALUES
			(@bz_case_id
			, @creator_bz_id
			, @timestamp
			, 16
			, @invitee_login_name
			, @current_assignee_username
			)
			;

		# Log the actions of the script.
			SET @script_log_message = CONCAT('the case histoy for case #'
										, @bz_case_id
										, ' has been updated: '
										, 'old assignee was: '
										, @current_assignee_username
										, 'new assignee is: '
										, @invitee_login_name
										)
										;
				
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
END IF ;
END//
DELIMITER ;

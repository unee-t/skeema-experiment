DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `add_invitee_in_cc`()
    SQL SECURITY INVOKER
BEGIN
	IF (@add_invitee_in_cc = 1)
	THEN

	# We make the user in CC for this case:
		INSERT INTO `cc`
			(`bug_id`
			,`who`
			) 
			VALUES 
			(@bz_case_id,@bz_user_id);

		# We record the name of this procedure for future debugging and audit_log
			SET @script = 'PROCEDURE - add_invitee_in_cc';
			SET @timestamp = NOW();			
			
		# Log the actions of the script.
			SET @script_log_message = CONCAT('the bz user #'
										, @bz_user_id
										, ' is added as CC for the case #'
										, @bz_case_id
										)
										;
				
			INSERT INTO `ut_script_log`
					(`datetime`
					, `script`
					, `log`
					)
					VALUES
					(NOW(), @script, @script_log_message)
					;

	# Record the change in the Bug history
	# The old value for the audit will always be '' as this is the first time that this user
	# is involved in this case in that unit.
		# We need the invitee login name:
			SET @invitee_login_name = (SELECT `login_name` FROM `profiles` WHERE `userid` = @bz_user_id);
		
		# We can now update the bug activity
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
				, 22
				, @invitee_login_name
				, ''
				)
				;

		# Log the actions of the script.
			SET @script_log_message = CONCAT('the case histoy for case #'
										, @bz_case_id
										, ' has been updated. new user: '
										, @invitee_login_name
										, ' was added in CC to the case.'
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

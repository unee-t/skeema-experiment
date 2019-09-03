DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `user_is_default_assignee_for_cases`()
    SQL SECURITY INVOKER
BEGIN
	# This procedure needs the following objects
	#	- Variables:
	#		- @replace_default_assignee
	#		- @component_id_this_role
	#		- @bz_user_id
	#		- @user_role_desc
	#		- @id_role_type
	#		- @user_pub_name
	#		- @product_id
	#

	# We only do this if this is needed:
	IF (@replace_default_assignee = 1)
	
	THEN

	# We record the name of this procedure for future debugging and audit_log
		SET @script = 'PROCEDURE - user_is_default_assignee_for_cases';
		SET @timestamp = NOW();

	# change the initial owner and initialqa contact to the invited BZ user.
											
		# Get the old values so we can log those
			SET @old_component_initialowner = (SELECT `initialowner` 
										FROM `components` 
										WHERE `id` = @component_id_this_role)
										;
			SET @old_component_initialqacontact = (SELECT `initialqacontact` 
										FROM `components` 
										WHERE `id` = @component_id_this_role)
										;
			SET @old_component_description = (SELECT `description` 
										FROM `components` 
										WHERE `id` = @component_id_this_role)
										;

		# Update the default assignee and qa contact
			UPDATE `components`
			SET 
				`initialowner` = @bz_user_id
				,`initialqacontact` = @bz_user_id
				,`description` = @user_role_desc
				WHERE 
				`id` = @component_id_this_role
				;
					
	# Log the actions of the script.
		SET @script_log_message = CONCAT('The component: '
			, (SELECT IFNULL(@component_id_this_role, 'component_id_this_role is NULL'))
			, ' (for the role_type_id #'
			, (SELECT IFNULL(@id_role_type, 'id_role_type is NULL'))
			, ') has been updated.'
			, '\r\The default user now associated to this role is bz user #'
			, (SELECT IFNULL(@bz_user_id, 'bz_user_id is NULL'))
			, ' (real name: '
			, (SELECT IFNULL(@user_pub_name, 'user_pub_name is NULL'))
			, ') for the unit #' 
			, @product_id
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

	# We update the BZ logs
		INSERT	INTO `audit_log`
			(`user_id`
			,`class`
			,`object_id`
			,`field`
			,`removed`
			,`added`
			,`at_time`
			) 
			VALUES 
			(@creator_bz_id,'Bugzilla::Component',@component_id_this_role,'initialowner',@old_component_initialowner,@bz_user_id,@timestamp)
			, (@creator_bz_id,'Bugzilla::Component',@component_id_this_role,'initialqacontact',@old_component_initialqacontact,@bz_user_id,@timestamp)
			, (@creator_bz_id,'Bugzilla::Component',@component_id_this_role,'description',@old_component_description,@user_role_desc,@timestamp)
			;

	END IF;
END//
DELIMITER ;

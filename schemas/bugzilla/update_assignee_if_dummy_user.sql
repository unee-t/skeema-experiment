DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `update_assignee_if_dummy_user`()
    SQL SECURITY INVOKER
BEGIN
	# check if the user is the first in this role for this unit
	IF (@is_current_assignee_this_role_a_dummy_user = 1)
	# We update the component IF this user is the first in this role
	# IF the user is the first in this role for this unit
	# THEN change the initial owner and initialqa contact to the invited BZ user.

	THEN 
											
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

		# We record the name of this procedure for future debugging and audit_log
			SET @script = 'PROCEDURE - update_assignee_if_dummy_user';
			SET @timestamp = NOW();
				
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
									);
			
			INSERT INTO `ut_script_log`
				(`datetime`
				, `script`
				, `log`
				)
				VALUES
				(@timestamp, @script, @script_log_message)
				;
				
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

		# Update the table 'ut_data_to_replace_dummy_roles' so that we record what we have done
			INSERT INTO `ut_data_to_replace_dummy_roles`
				(`mefe_invitation_id`
				, `mefe_invitor_user_id`
				, `bzfe_invitor_user_id`
				, `bz_unit_id`
				, `bz_user_id`
				, `user_role_type_id`
				, `is_occupant`
				, `is_mefe_user_only`
				, `user_more`
				, `bz_created_date`
				, `comment`
				)
			VALUES 
				(@mefe_invitation_id
				, @mefe_invitor_user_id
				, @creator_bz_id
				, @product_id
				, @bz_user_id
				, @id_role_type
				, @is_occupant
				, @is_mefe_only_user
				, @role_user_more
				, @timestamp
				, CONCAT ('inserted in BZ with the script \''
						, @script
						, '\'\r\ '
						, IFNULL(`comment`, '')
						)
				)
				;
					
		# Cleanup the variables for the log messages:
			SET @script_log_message = NULL;
			SET @script = NULL;
			SET @timestamp = NULL;
END IF ;
END//
DELIMITER ;

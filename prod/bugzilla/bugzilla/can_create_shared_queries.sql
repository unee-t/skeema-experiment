DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `can_create_shared_queries`()
    SQL SECURITY INVOKER
BEGIN

	# This should not change, it was hard coded when we created Unee-T
		# Can create shared queries
		SET @can_create_shared_queries_group_id = 17;

	IF (@can_create_shared_queries = 1)
	THEN INSERT INTO `ut_user_group_map_temp`
				(`user_id`
				,`group_id`
				,`isbless`
				,`grant_type`
				) 
				VALUES 
				(@bz_user_id,@can_create_shared_queries_group_id,0,0)
				;

		# We record the name of this procedure for future debugging and audit_log
				SET @script = 'PROCEDURE - can_create_shared_queries';
				SET @timestamp = NOW();
			
		# Log the actions of the script.
			SET @script_log_message = CONCAT('the bz user #'
									, @bz_user_id
									, ' CAN create shared queries.'
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
			SET @bzfe_table = 'ut_user_group_map_temp';
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
				 (@timestamp ,@bzfe_table, 'user_id', 'UNKNOWN', @bz_user_id, @script, 'Add the BZ user id when we grant the permission to create shared queries')
				 , (@timestamp ,@bzfe_table, 'group_id', 'UNKNOWN', @can_create_shared_queries_group_id, @script, 'Add the BZ group id when we grant the permission to create shared queries')
				 , (@timestamp ,@bzfe_table, 'isbless', 'UNKNOWN', 0, @script, 'user does NOT grant create shared queries permission')
				 , (@timestamp ,@bzfe_table, 'grant_type', 'UNKNOWN', 0, @script, 'user is a member of the group create shared queries')
				 ;
		 
		# Cleanup the variables for the log messages
			SET @script_log_message = NULL;
			SET @script = NULL;
			SET @timestamp = NULL;
			SET @bzfe_table = NULL;
END IF ;
END//
DELIMITER ;

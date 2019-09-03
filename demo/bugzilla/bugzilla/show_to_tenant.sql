DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `show_to_tenant`()
    SQL SECURITY INVOKER
BEGIN
	IF (@id_role_type = 1)
	THEN 
		# Get the information about the group which grant this permission
			SET @group_id_show_to_tenant = (SELECT `group_id` 
				FROM `ut_product_group` 
				WHERE (`product_id` = @product_id 
					AND `group_type_id` = 2 
					AND `role_type_id` = 1)
				)
				;
		
		# Grant the permission
			INSERT INTO `ut_user_group_map_temp`
				(`user_id`
				,`group_id`
				,`isbless`
				,`grant_type`
				) 
				VALUES 
				(@bz_user_id, @group_id_show_to_tenant, 0, 0)
				;

			# We record the name of this procedure for future debugging and audit_log
				SET @script = 'PROCEDURE - show_to_tenant';
				SET @timestamp = NOW();
				
			# Log the actions of the script.
				SET @script_log_message = CONCAT('the bz user #'
										, @bz_user_id
										, ' CAN see case that are limited to tenants'
										, ' for the unit #'
										, @product_id
										, '.'
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
				SET @permission_granted = 'CAN see case that are limited to tenants.';

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
					 (@timestamp ,@bzfe_table, 'user_id', 'UNKNOWN', @bz_user_id, @script, CONCAT('Add the BZ user id when we grant the permission to ', @permission_granted))
					 , (@timestamp ,@bzfe_table, 'group_id', 'UNKNOWN', @group_id_show_to_tenant, @script, CONCAT('Add the BZ group id when we grant the permission to ', @permission_granted))
					 , (@timestamp ,@bzfe_table, 'isbless', 'UNKNOWN', 0, @script, CONCAT('user does NOT grant ',@permission_granted, ' permission'))
					 , (@timestamp ,@bzfe_table, 'grant_type', 'UNKNOWN', 0, @script, CONCAT('user is a member of the group', @permission_granted))
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

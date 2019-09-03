DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `unit_disable_existing`()
    SQL SECURITY INVOKER
BEGIN
	# This procedure needs the following variables:
	#	- @product_id
	# 	- @inactive_when
	#	 - @bz_user_id
	#
	# This procedure will
	#	- Disable an existing unit/BZ product
	#	- Record the action of the script in the ut_log tables.
	#	- Record the chenge in the BZ `audit_log` table
	
	# We record the name of this procedure for future debugging and audit_log
		SET @script = 'PROCEDURE - unit_disable_existing';
		SET @timestamp = NOW();


	# What is the current status of the unit?
		
		SET @current_unit_status = (SELECT `isactive` FROM `products` WHERE `id` = @product_id);

	# Make a unit inactive
		UPDATE `products`
			SET `isactive` = '0'
			WHERE `id` = @product_id
		;
	# Record the actions of this script in the ut_log
		# Log the actions of the script.
			SET @script_log_message = CONCAT('the User #'
									, @bz_user_id
									, ' has made the Unit #'
									, @product_id
									, ' inactive. It is NOT possible to create new cases in this unit.'
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
			
			SET @bzfe_table = 'products';
			
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
				 (@timestamp ,@bzfe_table, 'isactive', @current_unit_status, '0', @script, @script_log_message)
				 ;
		 
		# Cleanup the variables for the log messages
			SET @script_log_message = NULL;
			SET @script = NULL;
			SET @timestamp = NULL;
			SET @bzfe_table = NULL;
	# When we mark a unit as inactive, we need to record this in the `audit_log` table
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
			(@bz_user_id
			, 'Bugzilla::Product'
			, @product_id
			, 'isactive'
			, @current_unit_status
			, '0'
			, @inactive_when
			)
			;			
END//
DELIMITER ;

DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `remove_user_from_default_cc`()
    SQL SECURITY INVOKER
BEGIN
	# This procedure needs the following objects
	#	- Variables:
	#		- @bz_user_id : the BZ user id of the user
	#		- @component_id_this_role: The id of the role in the bz table `components`
	#
	# We delete the record in the table that store default CC information

	# Make sure we have the correct value for the name of this script so the `ut_audit_log_table` has the correct info
		SET @script = 'PROCEDURE remove_user_from_default_cc';

	# We can now do the deletion
		DELETE
		FROM `component_cc`
			WHERE `user_id` = @bz_user_id
				AND `component_id` = @component_id_this_role
		;

	# We get the product id so we can log this properly
		SET @product_id_for_this_procedure = (SELECT `product_id` FROM `components` WHERE `id` = @component_id_this_role);

	# We record the time when	this was done for future debugging and audit_log
			SET @timestamp = NOW();
				
	# Log the actions of the script.
		SET @script_log_message = CONCAT('the bz user #'
								, @bz_user_id
								, ' is NOT in Default CC for the component/role '
								, @component_id_this_role
								, ' for the product/unit '
								, @product_id_for_this_procedure
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
		SET @product_id_for_this_procedure = NULL;
END//
DELIMITER ;

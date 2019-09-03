DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `update_audit_log`()
    SQL SECURITY INVOKER
BEGIN

	# This procedure need the following variables
	#	 - @bzfe_table: the table that was updated
	#	 - @bzfe_field: The fields that were updated
	#	 - @previous_value: The previouso value for the field
	#	 - @new_value: the values captured by the trigger when the new value is inserted.
	#	 - @script: the script that is calling this procedure
	#	 - @comment: a text to give some context ex: "this was created by a trigger xxx"
 
	# When are we doing this?
		SET @timestamp = NOW(); 

	# We update the audit_log table
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
			(@timestamp
			, @bzfe_table
			, @bzfe_field
			, @previous_value
			, @new_value
			, @script
			, @comment
			)
		;

END//
DELIMITER ;

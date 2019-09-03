DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `update_log_count_enabled_units`()
    SQL SECURITY INVOKER
BEGIN
 
	# When are we doing this?
		SET @timestamp = NOW();	

	# Flash Count the total number of Enabled unit at the date of this query
	# Put this in a variable
		SET @count_enabled_units = (SELECT
			 COUNT(`products`.`id`)
		FROM
			`products`
		WHERE `products`.`isactive` = 1)
		;
		
	# Flash Count the total number of ALL cases are the date of this query
	# Put this in a variable
		SET @count_total_units = (SELECT
			 COUNT(`products`.`id`)
		FROM
			`products`
			) 
			;

	# We have everything: insert in the log table
		INSERT INTO `ut_log_count_enabled_units`
			(`timestamp`
			, `count_enabled_units`
			, `count_total_units`
			)
			VALUES
			(@timestamp
			, @count_enabled_units
			, @count_total_units
			)
			;
END//
DELIMITER ;

DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `update_log_count_closed_case`()
    SQL SECURITY INVOKER
BEGIN

	# When are we doing this?
		SET @timestamp = NOW();	

	# Flash Count the total number of CLOSED cases are the date of this query
	# Put this in a variable
		SET @count_closed_cases = (SELECT
			 COUNT(`bugs`.`bug_id`)
		FROM
			`bugs`
			INNER JOIN `bug_status`
				ON (`bugs`.`bug_status` = `bug_status`.`value`)
		WHERE `bug_status`.`is_open` = 0)
		;
		
	# Flash Count the total number of ALL cases are the date of this query
	# Put this in a variable
		SET @count_total_cases = (SELECT
			 COUNT(`bug_id`)
		FROM
			`bugs`
			) 
			;

	# We have everything: insert in the log table
		INSERT INTO `ut_log_count_closed_cases`
			(`timestamp`
			, `count_closed_cases`
			, `count_total_cases`
			)
			VALUES
			(@timestamp
			, @count_closed_cases
			, @count_total_cases
			)
			;
END//
DELIMITER ;

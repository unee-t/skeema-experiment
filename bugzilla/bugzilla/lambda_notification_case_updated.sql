DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `lambda_notification_case_updated`(
	IN notification_type varchar(255)
	, IN bz_source_table varchar(240)
	, IN notification_id varchar(255)
	, IN created_datetime datetime
	, IN unit_id smallint(6)
	, IN case_id mediumint(9)
	, IN case_title varchar(255)
	, IN user_id mediumint(9)
	, IN update_what varchar(255)
	, IN old_value varchar(255)
	, IN new_value varchar(255)
	, IN case_reporter_user_id mediumint(9)
	, IN old_case_assignee_user_id mediumint(9)
	, IN new_case_assignee_user_id mediumint(9)
	, IN current_list_of_invitees mediumtext
	, IN current_status varchar(64)
	, IN current_resolution varchar(64)
	, IN current_severity varchar(64)
	)
    SQL SECURITY INVOKER
BEGIN
	# https://github.com/unee-t/lambda2sns/blob/master/tests/call-lambda-as-root.sh#L5
	#	- DEV/Staging: 812644853088
	#	- Prod: 192458993663
	#	- Demo: 915001051872
	CALL mysql.lambda_async(CONCAT('arn:aws:lambda:ap-southeast-1:192458993663:function:alambda_simple')
		, JSON_OBJECT ('notification_type', notification_type
			, 'bz_source_table', bz_source_table
			, 'notification_id', notification_id
			, 'created_datetime', created_datetime
			, 'unit_id', unit_id
			, 'case_id', case_id
			, 'case_title', case_title
			, 'user_id', user_id
			, 'update_what', update_what
			, 'old_value', old_value
			, 'new_value', new_value
			, 'case_reporter_user_id', case_reporter_user_id
			, 'old_case_assignee_user_id', old_case_assignee_user_id
			, 'new_case_assignee_user_id', new_case_assignee_user_id
			, 'current_list_of_invitees', current_list_of_invitees
			, 'current_status', current_status
			, 'current_resolution', current_resolution
			, 'current_severity', current_severity
			)
		)
		;
END//
DELIMITER ;

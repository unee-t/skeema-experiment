DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `lambda_update_user_profile`(
	IN mefe_api_request_id VARCHAR(255)
	, IN update_user_request_id int(11)
	, IN action_type varchar(255)
	, IN requestor_mefe_user_id varchar(255)
	, IN creator_mefe_user_id varchar(255)
	, IN mefe_user_id varchar(255)
	, IN first_name varchar(255)
	, IN last_name varchar(255)
	, IN phone_number varchar(255)
	, IN mefe_email_address varchar(255)
	, IN bzfe_email_address varchar(255)
	)
    SQL SECURITY INVOKER
BEGIN
		
		# Prepare the CALL argument that was prepared by the trigger
		# https://github.com/unee-t/lambda2sns/blob/master/tests/call-lambda-as-root.sh#L5
		#	- DEV/Staging: 812644853088
		#	- Prod: 192458993663
		#	- Demo: 915001051872

			CALL mysql.lambda_async (CONCAT('arn:aws:lambda:ap-southeast-1:192458993663:function:alambda_simple')
				, JSON_OBJECT(
					'mefeAPIRequestId' , mefe_api_request_id
					, 'updateUserRequestId' , update_user_request_id
					, 'actionType', action_type
					, 'requestorUserId', requestor_mefe_user_id
					, 'creatorId', creator_mefe_user_id
					, 'userId', mefe_user_id
					, 'firstName', first_name
					, 'lastName', last_name
					, 'phoneNumber', phone_number
					, 'emailAddress', mefe_email_address
					, 'bzfeEmailAddress', bzfe_email_address
					)
				)
				;

END//
DELIMITER ;

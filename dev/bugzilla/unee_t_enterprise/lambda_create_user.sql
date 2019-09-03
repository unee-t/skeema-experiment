DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `lambda_create_user`(
	IN mefe_api_request_id VARCHAR(255)
	, IN user_creation_request_id INT(11)
	, IN action_type VARCHAR(255)
	, IN creator_id VARCHAR(255)
	, IN email_address VARCHAR(255)
	, IN first_name VARCHAR(255)
	, IN last_name VARCHAR(255)
	, IN phone_number VARCHAR(255)
	)
    SQL SECURITY INVOKER
BEGIN
		
		# Prepare the CALL argument that was prepared by the trigger
		# https://github.com/unee-t/lambda2sns/blob/master/tests/call-lambda-as-root.sh#L5
		#	- DEV/Staging: 812644853088
		#	- Prod: 192458993663
		#	- Demo: 915001051872

			CALL mysql.lambda_async (CONCAT('arn:aws:lambda:ap-southeast-1:812644853088:function:alambda_simple')
				, JSON_OBJECT(
					'mefeAPIRequestId' , mefe_api_request_id
					, 'userCreationRequestId' , user_creation_request_id
					, 'actionType', action_type
					, 'creatorId', creator_id
					, 'emailAddress', email_address
					, 'firstName', first_name
					, 'lastName', last_name
					, 'phoneNumber', phone_number
					)
				)
				;

END//
DELIMITER ;

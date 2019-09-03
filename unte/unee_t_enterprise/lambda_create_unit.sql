DELIMITER //
CREATE DEFINER=`admin`@`%` PROCEDURE `lambda_create_unit`(
	IN mefe_api_request_id VARCHAR(255)
	, IN unit_creation_request_id INT(11)
	, IN action_type VARCHAR(255)
	, IN creator_id VARCHAR(255)
	, IN uneet_name VARCHAR(255)
	, IN unee_t_unit_type VARCHAR(255)
	, IN more_info VARCHAR(255)
	, IN street_address VARCHAR(255)
	, IN city VARCHAR(255)
	, IN state VARCHAR(255)
	, IN zip_code VARCHAR(255)
	, IN country VARCHAR(255)
	, IN owner_id VARCHAR(255)
	)
    SQL SECURITY INVOKER
BEGIN
		
		# Prepare the CALL argument that was prepared by the trigger
		# https://github.com/unee-t/lambda2sns/blob/master/tests/call-lambda-as-root.sh#L5
		#	- DEV/Staging: 812644853088
		#	- Prod: 192458993663
		#	- Demo: 915001051872

			CALL mysql.lambda_async (CONCAT('arn:aws:lambda:ap-southeast-1:192458993663:function:ut_lambda2sqs_push')
				, JSON_OBJECT(
					'mefeAPIRequestId' , mefe_api_request_id
					, 'unitCreationRequestId' , unit_creation_request_id
					, 'actionType', action_type
					, 'creatorId', creator_id
					, 'name', uneet_name
					, 'type', unee_t_unit_type
					, 'moreInfo', more_info
					, 'streetAddress', street_address
					, 'city', city
					, 'state', state
					, 'zipCode', zip_code
					, 'country', country
					, 'ownerId', owner_id
					)
				)
				;

END//
DELIMITER ;

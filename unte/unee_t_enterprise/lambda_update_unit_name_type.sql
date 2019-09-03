DELIMITER //
CREATE DEFINER=`admin`@`%` PROCEDURE `lambda_update_unit_name_type`(
	IN mefe_api_request_id VARCHAR(255)
	, IN update_unit_request_id int(11)
	, IN action_type varchar(255)
	, IN requestor_user_id varchar(255)
	, IN mefe_unit_id varchar(255)
	, IN creator_id varchar(255)
	, IN unee_t_unit_type varchar(255)
	, IN unee_t_unit_name varchar(255)
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
					, 'updateUnitRequestId' , update_unit_request_id
					, 'actionType', action_type
					, 'requestorUserId', requestor_user_id
					, 'unitId', mefe_unit_id
					, 'creatorId', creator_id
					, 'type', unee_t_unit_type
					, 'name', unee_t_unit_name
					)
				)
				;

END//
DELIMITER ;

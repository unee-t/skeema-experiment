DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `lambda_remove_user_from_unit`(
	IN mefe_api_request_id VARCHAR(255)
	, IN remove_user_from_unit_request_id int(11)
	, IN action_type varchar(255)
	, IN requestor_user_id varchar(255)
	, IN mefe_user_id varchar(255)
	, IN mefe_unit_id varchar(255)
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
					, 'removeUserFromUnitRequestId' , remove_user_from_unit_request_id
					, 'actionType', action_type
					, 'requestorUserId', requestor_user_id
					, 'userId', mefe_user_id
					, 'unitId', mefe_unit_id
					)
				)
				;

END//
DELIMITER ;

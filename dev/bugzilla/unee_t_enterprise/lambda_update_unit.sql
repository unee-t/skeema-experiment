DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `lambda_update_unit`(
	IN mefe_api_request_id VARCHAR(255)
	, IN update_unit_request_id int(11)
	, IN action_type varchar(255)
	, IN requestor_user_id varchar(255)
	, IN mefe_unit_id varchar(255)
	, IN creator_id varchar(255)
	, IN unee_t_unit_type varchar(255)
	, IN unee_t_unit_name varchar(255)
	, IN more_info varchar(255)
	, IN street_address varchar(255)
	, IN city varchar(255)
	, IN state varchar(255)
	, IN zip_code varchar(255)
	, IN country varchar(255)
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
					, 'updateUnitRequestId' , update_unit_request_id
					, 'actionType', action_type
					, 'requestorUserId', requestor_user_id
					, 'unitId', mefe_unit_id
					, 'creatorId', creator_id
					, 'type', unee_t_unit_type
					, 'name', unee_t_unit_name
					, 'moreInfo', more_info
					, 'streetAddress', street_address
					, 'city', city
					, 'state', state
					, 'zipCode', zip_code
					, 'country', country
					)
				)
				;

END//
DELIMITER ;

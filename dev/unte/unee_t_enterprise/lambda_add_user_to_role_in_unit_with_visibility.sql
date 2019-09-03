DELIMITER //
CREATE DEFINER=`hmlet_dev_root`@`%` PROCEDURE `lambda_add_user_to_role_in_unit_with_visibility`(
	IN mefe_api_request_id VARCHAR(255)
	, IN id_map_user_unit_permissions int(11)
	, IN action_type varchar(255)
	, IN requestor_mefe_user_id varchar(255)
	, IN invited_mefe_user_id varchar(255)
	, IN mefe_unit_id varchar(255)
	, IN role_type varchar(255)
	, IN is_occupant boolean
	, IN is_visible boolean
	, IN is_default_assignee boolean
	, IN is_default_invited boolean
	, IN can_see_role_agent boolean
	, IN can_see_role_tenant boolean
	, IN can_see_role_landlord boolean
	, IN can_see_role_mgt_cny boolean
	, IN can_see_role_contractor boolean
	, IN can_see_occupant boolean
	)
    SQL SECURITY INVOKER
BEGIN
		
		# Prepare the CALL argument that was prepared by the trigger
		# https://github.com/unee-t/lambda2sns/blob/master/tests/call-lambda-as-root.sh#L5
		#	- DEV/Staging: 812644853088
		#	- Prod: 192458993663
		#	- Demo: 915001051872

			CALL mysql.lambda_async (CONCAT('arn:aws:lambda:ap-southeast-1:812644853088:function:ut_lambda2sqs_push')
				, JSON_OBJECT(
					'mefeAPIRequestId' , mefe_api_request_id
					, 'idMapUserUnitPermission' , id_map_user_unit_permissions
					, 'actionType', action_type
					, 'requestorUserId', requestor_mefe_user_id
					, 'addedUserId', invited_mefe_user_id
					, 'unitId', mefe_unit_id
					, 'roleType', role_type
					, 'isOccupant', is_occupant
					, 'isVisible', is_visible
					, 'isDefaultAssignee', is_default_assignee
					, 'isDefaultInvited', is_default_invited
					, 'roleVisibility' , JSON_OBJECT('Agent', can_see_role_agent
						, 'Tenant', can_see_role_tenant
						, 'Owner/Landlord', can_see_role_landlord
						, 'Management Company', can_see_role_mgt_cny
						, 'Contractor', can_see_role_contractor
						, 'Occupant', can_see_occupant
						)
					)
				)
				;

END//
DELIMITER ;

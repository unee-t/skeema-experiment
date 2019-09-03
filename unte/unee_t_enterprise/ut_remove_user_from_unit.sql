DELIMITER //
CREATE DEFINER=`admin`@`%` PROCEDURE `ut_remove_user_from_unit`()
    SQL SECURITY INVOKER
BEGIN

# We only do this IF:
#	- The variable @disable_lambda != 1
#	- We have a MEFE unit ID
#	- We have a MEFE user ID
#	- The field `is_obsolete` = 1
#	- We have an `update_system_id`
#	- We have an `updated_by_id`
#	- We have an `update_method`
#	- This is done via an authorized update method
#		- 'ut_delete_user_from_role_in_a_level_1_property'
#		- 'ut_delete_user_from_role_in_a_level_2_property'
#		- 'ut_delete_user_from_role_in_a_level_3_property'
#		- ''
#		- ''

# This procedure needs the following variables:
#	- @unee_t_mefe_id
#	- @unee_t_unit_id
#	- @is_obsolete
#	- @update_method
#	- @update_system_id
#	- @updated_by_id
#	- @disable_lambda != 1

	IF @unee_t_mefe_id IS NOT NULL
		AND @unee_t_unit_id IS NOT NULL
		AND @is_obsolete = 1
		AND (@disable_lambda != 1
			OR @disable_lambda IS NULL)
		AND @update_system_id IS NOT NULL
		AND @updated_by_id IS NOT NULL
		AND (@update_method = 'ut_delete_user_from_role_in_a_level_1_property'
			OR @update_method = 'ut_delete_user_from_role_in_a_level_2_property'
			OR @update_method = 'ut_delete_user_from_role_in_a_level_3_property'
			)
	THEN

			# The specifics

				# What is this trigger (for log_purposes)
					SET @this_procedure_8_7 := 'ut_remove_user_from_unit';

				# What is the procedure associated with this trigger:
					SET @associated_procedure := 'lambda_remove_user_from_unit';
			
			# lambda:
			# https://github.com/unee-t/lambda2sns/blob/master/tests/call-lambda-as-root.sh#L5
			#	- DEV/Staging: 812644853088
			#	- Prod: 192458993663
			#	- Demo: 915001051872

					SET @lambda_key := 192458993663;

				# MEFE API Key:
					SET @key_this_envo := 'ABCDEFG';

		# The variables that we need:

			SET @remove_user_from_unit_request_id := (SELECT `id_map_user_unit_permissions`
				FROM `ut_map_user_permissions_unit_all`
				WHERE `unee_t_mefe_id` = @unee_t_mefe_id
					AND `unee_t_unit_id` = @unee_t_unit_id
				) ;

			SET @action_type := 'DEASSIGN_ROLE' ;

			SET @requestor_user_id := @updated_by_id ;
			
			SET @mefe_user_id := @unee_t_mefe_id ;

			SET @mefe_unit_id := @unee_t_unit_id ;
		
		# We insert the event in the relevant log table

			# Simulate what the Procedure `lambda_add_user_to_role_in_unit_with_visibility` does
			# Make sure to update that if you update the procedure `lambda_add_user_to_role_in_unit_with_visibility`

			# The JSON Object:

				# We need a random ID as a `mefeAPIRequestId`

				SET @mefeAPIRequestId := (SELECT UUID()) ;

				SET @json_object := (
					JSON_OBJECT(
						'mefeAPIRequestId' , @mefeAPIRequestId
						, 'removeUserFromUnitRequestId' , @remove_user_from_unit_request_id
						, 'actionType', @action_type
						, 'requestorUserId', @requestor_user_id
						, 'userId', @mefe_user_id
						, 'unitId', @mefe_unit_id
						)
					)
					;

				# The specific lambda:

					SET @lambda := CONCAT('arn:aws:lambda:ap-southeast-1:'
						, @lambda_key
						, ':function:ut_lambda2sqs_push')
						;
				
				# The specific Lambda CALL:

					SET @lambda_call := CONCAT('CALL mysql.lambda_async'
						, @lambda
						, @json_object
						)
						;

			# Now that we have simulated what the CALL does, we record that

			SET @unit_name := (SELECT `uneet_name`
				FROM `ut_map_external_source_units`
				WHERE `unee_t_mefe_unit_id` = @mefe_unit_id
				);
			SET @unee_t_login := (SELECT `uneet_login_name`
				FROM `ut_map_external_source_users`
				WHERE `unee_t_mefe_user_id` = @mefe_user_id
				);

				INSERT INTO `log_lambdas`
					(`created_datetime`
					, `creation_trigger`
					, `associated_call`
					, `mefe_unit_id`
					, `unit_name`
					, `mefe_user_id`
					, `unee_t_login`
					, `payload`
					)
					VALUES
						(NOW()
						, @this_procedure_8_7
						, @associated_procedure
						, @mefe_unit_id
						, @unit_name
						, @mefe_user_id
						, @unee_t_login
						, @lambda_call
						)
						;

		# We call the Lambda procedure to remove a user from a role in a unit

			CALL `lambda_remove_user_from_unit`(@mefeAPIRequestId
				, @remove_user_from_unit_request_id
				, @action_type
				, @requestor_user_id
				, @mefe_user_id
				, @mefe_unit_id
				)
				;

	END IF;
END//
DELIMITER ;

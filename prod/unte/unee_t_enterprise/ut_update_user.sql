DELIMITER //
CREATE DEFINER=`admin`@`%` PROCEDURE `ut_update_user`()
    SQL SECURITY INVOKER
BEGIN

# This procedure needs to following variables:
#	- @person_id
#	- @requestor_id
#

# We only do this IF:
#	- The variable @disable_lambda != 1
#	- We have a MEFE user ID
#WIP	- There was NO change to the fact that we need to create a Unee-T account
#	- This is done via an authorized insert method:
#WIP		- `ut_person_has_been_updated_and_ut_account_needed`
#		- ''
#		- ''
#

	SET @mefe_user_id_uu_l_1 = (SELECT `unee_t_mefe_user_id`
		FROM `ut_map_external_source_users`
		WHERE `person_id` = @person_id
		) 
		;

	IF @mefe_user_id_uu_l_1 IS NOT NULL
		AND (@disable_lambda != 1
			OR @disable_lambda IS NULL)
	THEN

			# The specifics

				# What is this trigger (for log_purposes)
					SET @this_procedure = 'ut_update_user';

				# What is the procedure associated with this trigger:
					SET @associated_procedure = 'lambda_update_user_profile';
			
			# lambda:
			# https://github.com/unee-t/lambda2sns/blob/master/tests/call-lambda-as-root.sh#L5
			#	- DEV/Staging: 812644853088
			#	- Prod: 192458993663
			#	- Demo: 915001051872

					SET @lambda_key = 192458993663;

				# MEFE API Key:
					SET @key_this_envo = 'ABCDEFG';

		# Define the variables we need:

			SET @update_user_request_id = (SELECT `id_map`
				FROM `ut_map_external_source_users`
				WHERE `person_id` = @person_id
				) 
				;

			SET @action_type = 'EDIT_USER' ;

			SET @requestor_mefe_user_id = @requestor_id ;

			SET @creator_mefe_user_id =  (SELECT `updated_by_id` 
				FROM `persons`
				WHERE `id_person` = @person_id
				)
				;

			SET @first_name = (SELECT `first_name` 
				FROM `ut_user_information_persons`
				WHERE `id_person` = @person_id
				)
				;

			SET @last_name = (SELECT `last_name` 
				FROM `ut_user_information_persons`
				WHERE `id_person` = @person_id
				)
				;

			SET @phone_number = (SELECT `phone_number` 
				FROM `ut_user_information_persons`
				WHERE `id_person` = @person_id
				)
				;

			SET @mefe_email_address = (SELECT `email_address` 
				FROM `ut_user_information_persons`
				WHERE `id_person` = @person_id
				)
				;

			SET @bzfe_email_address = (SELECT `email_address` 
				FROM `ut_user_information_persons`
				WHERE `id_person` = @person_id
				)
				;

			SET @lambda_id = @lambda_key ;
			SET @mefe_api_key = @key_this_envo ;

		# We insert the event in the relevant log table

			# Simulate what the Procedure `lambda_create_user` does
			# Make sure to update that if you update the procedure `lambda_create_user`

			# The JSON Object:

				# We need a random ID as a `mefeAPIRequestId`

				SET @mefeAPIRequestId := (SELECT UUID()) ;

				SET @json_object := (
					JSON_OBJECT(
						'mefeAPIRequestId' , @mefeAPIRequestId
						, 'updateUserRequestId' , @update_user_request_id
						, 'actionType', @action_type
						, 'requestorUserId', @requestor_mefe_user_id
						, 'creatorId', @creator_mefe_user_id
						, 'userId', @mefe_user_id_uu_l_1
						, 'firstName', @first_name
						, 'lastName', @last_name
						, 'phoneNumber', @phone_number
						, 'emailAddress', @mefe_email_address
						, 'bzfeEmailAddress', @bzfe_email_address
						)
					)
					;

				# The specific lambda:

					SET @lambda = CONCAT('arn:aws:lambda:ap-southeast-1:'
						, @lambda_key
						, ':function:alambda_simple')
						;
				
				# The specific Lambda CALL:

					SET @lambda_call = CONCAT('CALL mysql.lambda_async'
						, @lambda
						, @json_object
						)
						;

			# Now that we have simulated what the CALL does, we record that

			SET @unee_t_login := (SELECT `uneet_login_name`
				FROM `ut_map_external_source_users`
				WHERE `unee_t_mefe_user_id` = @mefe_user_id_uu_l_1
				);

				INSERT INTO `log_lambdas`
					(`created_datetime`
					, `creation_trigger`
					, `associated_call`
					, `mefe_unit_id`
					, `mefe_user_id`
					, `unee_t_login`
					, `payload`
					)
					VALUES
						(NOW()
						, @this_procedure
						, @associated_procedure
						, 'n/a'
						, @mefe_user_id_uu_l_1
						, @unee_t_login
						, @lambda_call
						)
						;

		# We call the Lambda procedure to update the user

			CALL `lambda_update_user_profile`(@mefeAPIRequestId
				, @update_user_request_id
				, @action_type
				, @requestor_mefe_user_id
				, @creator_mefe_user_id
				, @mefe_user_id_uu_l_1
				, @first_name
				, @last_name
				, @phone_number
				, @mefe_email_address
				, @bzfe_email_address
				)
				;

	END IF;
END//
DELIMITER ;

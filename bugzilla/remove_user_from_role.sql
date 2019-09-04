DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `remove_user_from_role`()
    SQL SECURITY INVOKER
BEGIN
	# This procedure needs the following objects
	# This procedure is called by the procedure `add_user_to_role_in_unit`
	#	- Variables:
	#		- @remove_user_from_role
	#		- @component_id_this_role
	#		- @product_id
	#		- @bz_user_id
	#		- @bz_user_id_dummy_user_this_role
	#		- @id_role_type
	#		- @this_script
	#		- @creator_bz_id
	#
	#	 - Tables:
	#		 - `ut_user_group_map_temp`

	# We only do this if this is needed:
	IF (@remove_user_from_role = 1)
	THEN
		# The script which call this procedure, should already calls: 
		# 	- `table_to_list_dummy_user_by_environment`;
		# 	- `remove_user_from_default_cc`
		# There is no need to do this again
		#
		# The script 
		#	- resets the permissions for this user for this role for this unit to the default permissions.
		#	 - removes ALL the permissions for this user.
		#	 - IF user is in CC for any case (open AND Closed) in this unit, 
		#	 THEN 
		#	 - un-invite this user to the cases for this unit
		#	 - Record a message in the case to explain what has been done.
		#	- IF user is the current Default assignee for his role for this unit: 
		#		- Option 1: IF there is another 'Real' user in default CC for this role in this unit, 
		#		 then replace the default assignee for this role with	with the oldest created 'real' user in default CC for this role for this unit.
		#		- Option 2: IF there is NO other 'Real' user in Default CC for this role in this unit BUT
		#			There is at least another 'Real' usser in this role for this unit,	
		#			THEN replace the default assignee for this role with	with the oldest created 'real' user in this role for this unit_id.
		#		- Option 3: IF there is NO other 'Real' user in Default CC for this role in this unit
		#			AND IF there are no other 'Real' usser in this role for this unit
		#			THEN replace the default assignee for this role with	with the dummy user for that unit.
		#	- IF the user is the current assignee to one of the cases in this unit
		#		THEN 
		#		- assigns the case to the newly identifed default assignee for the case.
		#	 	- Record a message in the case to explain what has been done.
		#
	 	
			# We record the name of this procedure for future debugging and audit_log
				SET @script = 'PROCEDURE - remove_user_from_role';
				SET @timestamp = NOW();

			# Revoke all permissions for this user in this unit
				# This procedure needs the following objects:
				#	- Variables:
				#		- @product_id
				#		- @bz_user_id
				CALL `revoke_all_permission_for_this_user_in_this_unit`;
			
			# All the permission have been prepared, we can now update the permissions table
			#		- This NEEDS the table 'ut_user_group_map_temp'
				CALL `update_permissions_invited_user`;

			# Make sure we have the correct value for the name of this script so the `ut_audit_log_table` has the correct info
				SET @script = 'PROCEDURE remove_user_from_role';

			# Add a comment to all the cases where:
			#	- the product/unit is the product/unit we are removing the user from
			#	- The user we are removing is in CC/invited to these bugs/cases
			# to let everyone knows what is happening.

				# Which role is this? (we need that to add meaningfull comments)

					SET @user_role_type_this_role = (SELECT `role_type_id` 
						FROM `ut_product_group`
						WHERE (`component_id` = @component_id_this_role)
							AND (`group_type_id` = 22)
						)
						;

					SET @user_role_type_name = (SELECT `role_type`
						FROM `ut_role_types`
						WHERE `id_role_type` = @user_role_type_this_role
						)
						;

				# Prepare the comment

					SET @comment_remove_user_from_case = (CONCAT ('We removed a user in the role '
						, @user_role_type_name 
						, '. This user was un-invited from the case since he has no more role in this unit.'
						)
					)
					;

				# Insert the comment in all the cases we are touching

					INSERT INTO `longdescs`
						(`bug_id`
						, `who`
						, `bug_when`
						, `thetext`
						)
						SELECT
							`cc`.`bug_id`
							, @creator_bz_id
							, @timestamp
							, @comment_remove_user_from_case
							FROM `bugs`
							INNER JOIN `cc` 
								ON (`cc`.`bug_id` = `bugs`.`bug_id`)
							WHERE (`bugs`.`product_id` = @product_id)	
								AND (`cc`.`who` = @bz_user_id)
							;

				# Record the change in the Bug history for all the cases where:
				#	- the product/unit is the product/unit we are removing the user from
				#	- The user we are removing is in CC/invited to these bugs/cases

					INSERT INTO	`bugs_activity`
						(`bug_id` 
						, `who` 
						, `bug_when`
						, `fieldid`
						, `added`
						, `removed`
						)
						SELECT
							`bugs`.`bug_id`
							, @creator_bz_id
							, @timestamp
							, 22
							, NULL
							, @bz_user_id
							FROM `bugs`
							INNER JOIN `cc` 
								ON (`cc`.`bug_id` = `bugs`.`bug_id`)
							WHERE (`bugs`.`product_id` = @product_id)	
								AND (`cc`.`who` = @bz_user_id)
						;

			# We have done what we needed to record the changes and inform users.
			# We can now remove the user invited to (i.e in CC for) any bugs/cases in the given product/unit.

				DELETE `cc`
				FROM
					`cc`
					LEFT JOIN `bugs` 
						ON (`cc`.`bug_id` = `bugs`.`bug_id`)
					WHERE (`bugs`.`product_id` = @product_id)
						AND (`cc`.`who` = @bz_user_id)
					;
		
		# We need to check if the user we are removing is the current default assignee for this role for this unit.

			# What is the current default assignee for this role/component?

				SET @old_component_initialowner = (SELECT `initialowner` 
					FROM `components` 
					WHERE `id` = @component_id_this_role
					)
					;

			# Is it the same as the current user?

				SET @is_user_default_assignee = IF(@old_component_initialowner = @bz_user_id
					, '1'
					, '0'
					)
					;

			# IF needed, then do the change of default assignee.

				IF @is_user_default_assignee = 1
				THEN
				# We need to 
				# 	- Option 1: IF there is another 'Real' user in default CC for this role in this unit, 
				#			then replace the default assignee for this role with	with the oldest created 'real' user in default CC for this role for this unit.
				# 	- Option 2: IF there is NO other 'Real' user in Default CC for this role in this unit BUT
				#			There is at least another 'Real' usser in this role for this unit,	
				#			THEN replace the default assignee for this role with	with the oldest created 'real' user in this role for this unit_id.
				# 	- Option 3: IF there is NO other 'Real' user in Default CC for this role in this unit
				#			AND IF there are no other 'Real' user in this role for this unit
				#			THEN replace the default assignee with the default dummy user for this role in this unit
				# The variables needed for this are
				#	- @bz_user_id_dummy_user_this_role
				# 	- @component_id_this_role
				#	- @id_role_type
				# 	- @this_script
				#	- @product_id
				#	- @creator_bz_id

					# Which scenario are we in?

						# Do we have at least another real user in default CC for the cases created in this role in this unit?

							SET @oldest_default_cc_this_role = (SELECT MIN(`user_id`)
							FROM `component_cc`
								WHERE `component_id` = @component_id_this_role
								)
								;

							SET @assignee_in_option_1 = IFNULL(@oldest_default_cc_this_role, 0);

							#	Are we going to do the change now?
							
								IF @assignee_in_option_1 !=0
								# yes, we can do the change
								THEN
									# We need to capture the old component description to update the bz_audit_log_table

										SET @old_component_description = (SELECT `description` 
											FROM `components` 
											WHERE `id` = @component_id_this_role
											)
											;

									# We use this user ID as the new default assignee for this component/role

										SET @assignee_in_option_1_name = (SELECT `realname` 
											FROM `profiles` 
											WHERE `userid` = @assignee_in_option_1
											)
											;

									# We can now update the default assignee for this component/role

										UPDATE `components`
											SET `initialowner` = @assignee_in_option_1
												,`description` = @assignee_in_option_1_name
											WHERE `id` = @component_id_this_role
											;

									# We remove this user ID from the list of users in Default CC for this role/component

										DELETE FROM `component_cc`
											WHERE `component_id` = @component_id_this_role
												AND `user_id` = @assignee_in_option_1
												;
										
									# We update the BZ logs
										INSERT	INTO `audit_log`
											(`user_id`
											,`class`
											,`object_id`
											,`field`
											,`removed`
											,`added`
											,`at_time`
											) 
											VALUES 
											(@creator_bz_id, 'Bugzilla::Component', @component_id_this_role, 'initialowner', @bz_user_id, @assignee_in_option_1, @timestamp)
											, (@creator_bz_id, 'Bugzilla::Component', @component_id_this_role, 'description', @old_component_description, @assignee_in_option_1_name, @timestamp)
											;

								END IF;

								IF @assignee_in_option_1 = 0
								# We know that we do NOT have any other user in default CC for this role
								# Do we have another 'Real' user in this role for this unit?
								THEN

									# First we need to find that user...
									# What is the group id for all the users in this role in this unit?

										SET @option_2_group_id_this_role = (SELECT `group_id`
											FROM `ut_product_group`
											WHERE `component_id` = @component_id_this_role
												AND `group_type_id` = 22
												)
											;

									# What is the oldest user in this group who is NOT a dummy user?

										SET @oldest_other_user_in_this_role = (SELECT MIN(`user_id`)
											FROM `user_group_map`
											WHERE `group_id` = @option_2_group_id_this_role
											)
											;

										SET @assignee_in_option_2 = IFNULL(@oldest_default_cc_this_role, 0);

									# Are we going to do the change now?

										IF @assignee_in_option_2 != 0
										# We know that we do NOT have any other user in default CC for this role
										# BUT We know we HAVE another user is this role for this unit.
										THEN

											# We need to capture the old component description to update the bz_audit_log_table

												SET @old_component_description = (SELECT `description` 
													FROM `components` 
													WHERE `id` = @component_id_this_role
													)
													;

											# We use this user ID as the new default assignee for this component/role.

												SET @assignee_in_option_2_name = (SELECT `realname` 
													FROM `profiles` 
													WHERE `userid` = @assignee_in_option_2
													)
													;

											# We can now update the default assignee for this component/role

												UPDATE `components`
													SET `initialowner` = @assignee_in_option_2
														,`description` = @assignee_in_option_2_name
													WHERE `id` = @component_id_this_role
													;
												
											# We update the BZ logs
												INSERT	INTO `audit_log`
													(`user_id`
													,`class`
													,`object_id`
													,`field`
													,`removed`
													,`added`
													,`at_time`
													) 
													VALUES 
													(@creator_bz_id, 'Bugzilla::Component', @component_id_this_role, 'initialowner', @bz_user_id, @assignee_in_option_2, @timestamp)
													, (@creator_bz_id, 'Bugzilla::Component', @component_id_this_role, 'description', @old_component_description, @assignee_in_option_2_name, @timestamp)
													;

										END IF;

										IF @assignee_in_option_2 = 0
										# We know that we do NOT have any other user in default CC for this role
										# We know we do NOT have another user is this role for this unit.
										# We need to use the Default dummy user for this role in this unit.
										THEN

											# We need to capture the old component description to update the bz_audit_log_table

												SET @old_component_description = (SELECT `description` 
													FROM `components` 
													WHERE `id` = @component_id_this_role
													)
													;

											# We define the dummy user role description based on the variable @id_role_type
												SET @dummy_user_role_desc = IF(@id_role_type = 1
													, CONCAT('Generic '
														, (SELECT`role_type` FROM `ut_role_types` WHERE `id_role_type` = @id_role_type)
														, ' - THIS SHOULD NOT BE USED UNTIL YOU HAVE ASSOCIATED AN ACTUAL'
														, (SELECT `role_type` FROM `ut_role_types` WHERE `id_role_type` = @id_role_type)
														, ' TO THIS UNIT'
														)
													, IF(@id_role_type = 2
														, CONCAT('Generic '
															, (SELECT `role_type` FROM `ut_role_types` WHERE `id_role_type` = @id_role_type)
															, ' - THIS SHOULD NOT BE USED UNTIL YOU HAVE ASSOCIATED AN ACTUAL'
															, (SELECT `role_type` FROM `ut_role_types` WHERE `id_role_type` = @id_role_type)
															, ' TO THIS UNIT'
															)
														, IF(@id_role_type = 3
															, CONCAT('Generic '
																, (SELECT `role_type` FROM `ut_role_types` WHERE `id_role_type` = @id_role_type)
																, ' - THIS SHOULD NOT BE USED UNTIL YOU HAVE ASSOCIATED AN ACTUAL'
																, (SELECT`role_type` FROM `ut_role_types` WHERE `id_role_type` = @id_role_type)
																, ' TO THIS UNIT'
																)
															, IF(@id_role_type = 4
																, CONCAT('Generic '
																	, (SELECT `role_type` FROM `ut_role_types` WHERE `id_role_type` = @id_role_type)
																	, ' - THIS SHOULD NOT BE USED UNTIL YOU HAVE ASSOCIATED AN ACTUAL'
																	, (SELECT `role_type` FROM `ut_role_types` WHERE `id_role_type` = @id_role_type)
																	, ' TO THIS UNIT'
																	)
																, IF(@id_role_type = 5
																	, CONCAT('Generic '
																		, (SELECT `role_type` FROM `ut_role_types` WHERE `id_role_type` = @id_role_type)
																		, ' - THIS SHOULD NOT BE USED UNTIL YOU HAVE ASSOCIATED AN ACTUAL'
																		, (SELECT `role_type` FROM `ut_role_types` WHERE `id_role_type` = @id_role_type)
																		, ' TO THIS UNIT'
																		)
																	, CONCAT('error in script'
																		, @this_script
																		, 'line ... shit what is it again?'
																		)
																	)
																)
															)
														)
													)
													;

												# We can now do the update

													UPDATE `components`
													SET `initialowner` = @bz_user_id_dummy_user_this_role
														,`description` = @dummy_user_role_desc
														WHERE 
														`id` = @component_id_this_role
														;
															
												# We update the BZ logs
													INSERT	INTO `audit_log`
														(`user_id`
														,`class`
														,`object_id`
														,`field`
														,`removed`
														,`added`
														,`at_time`
														) 
														VALUES 
														(@creator_bz_id, 'Bugzilla::Component', @component_id_this_role, 'initialowner', @bz_user_id, @bz_user_id_dummy_user_this_role, @timestamp)
														, (@creator_bz_id, 'Bugzilla::Component', @component_id_this_role, 'description', @old_component_description, @dummy_user_role_desc, @timestamp)
														;
										END IF;
								END IF;
				END IF;

		# IF the user we removed from this unit is the assignee for a case (Open or Closed) in this unit. 
		# THEN make sure we reset the assignee to the default user for this role in this unit.

			# What is the current initial owner for this role in this unit

				SET @component_initialowner = (SELECT `initialowner`
					FROM `components` 
					WHERE `id` = @component_id_this_role
					)
					;

			# Add a comment to the case to let everyone know what is happening.

				# Which role is this? (we need that to add meaningfull comments)

					SET @user_role_type_this_role = (SELECT `role_type_id` 
						FROM `ut_product_group`
						WHERE (`component_id` = @component_id_this_role)
							AND (`group_type_id` = 22)
						)
						;

					SET @user_role_type_name = (SELECT `role_type`
						FROM `ut_role_types`
						WHERE `id_role_type` = @user_role_type_this_role
						)
						;

				# Prepare the comment:

					SET @comment_change_assignee_for_case = (CONCAT ('We removed a user in the role '
							, @user_role_type_name 
							, '. This user cannot be the assignee for this case anymore since he/she has no more role in this unit. We have assigned this case to the default assignee for this role in this unit'
							)
						)
						;

				# Insert the comment in all the cases we are touchingfor for all the cases where:
				#	- the product/unit is the product/unit we are removing the user from
				#	- The user we are removing is the current assignee for these bugs/cases

					INSERT INTO `longdescs`
						(`bug_id`
						, `who`
						, `bug_when`
						, `thetext`
						)
						SELECT
							`bugs`.`bug_id`
							, @creator_bz_id
							, @timestamp
							, @comment_change_assignee_for_case
							FROM `bugs`
							WHERE (`bugs`.`product_id` = @product_id)	
								AND (`bugs`.`assigned_to` = @bz_user_id)
							;

				# Record the change in the Bug history for all the cases where:
				#	- the product/unit is the product/unit we are removing the user from
				#	- The user we are removing is the current assignee for these bugs/cases

					INSERT INTO	`bugs_activity`
						(`bug_id` 
						, `who` 
						, `bug_when`
						, `fieldid`
						, `added`
						, `removed`
						)
						SELECT
							`bugs`.`bug_id`
							, @creator_bz_id
							, @timestamp
							, 16
							, @component_initialowner
							, @bz_user_id
							FROM `bugs`
							WHERE (`bugs`.`product_id` = @product_id)	
								AND (`bugs`.`assigned_to` = @bz_user_id)
						;

				# We can now update the assignee for all the cases 
				#	- in this unit for this PRODUCT/Unit
				#	- currently assigned to the user we are removing from this unit.

					UPDATE `bugs`
						SET `assigned_to` = @component_initialowner
						WHERE `product_id` = @product_id
							AND `assigned_to` = @bz_user_id
						;			

		# We also need to check if the user we are removing is the current qa user for this role for this unit.

			# Get the initial QA contact for this role/component for this product/unit

				SET @old_component_initialqacontact = (SELECT `initialqacontact` 
					FROM `components` 
					WHERE `id` = @component_id_this_role
					)
					;

			# Check if the current QA contact for all the cases in this product/unit is the user we are removing

 				SET @is_user_qa = IF(@old_component_initialqacontact = @bz_user_id
 					, '1'
					, '0'
					)
					;

 			#IF needed, then do the change of default QA contact.

				IF @is_user_qa = 1
				THEN
					# IF the user is the current qa contact
					# We need to 
					# 	- Option 1: IF there is another 'Real' user in default CC for this role in this unit, 
					#			then replace the default assignee for this role with	with the oldest created 'real' user in default CC for this role for this unit.
					# 	- Option 2: IF there is NO other 'Real' user in Default CC for this role in this unit BUT
					#			There is at least another 'Real' usser in this role for this unit,	
					#			THEN replace the default assignee for this role with	with the oldest created 'real' user in this role for this unit_id.
					# 	- Option 3: IF there is NO other 'Real' user in Default CC for this role in this unit
					#			AND IF there are no other 'Real' user in this role for this unit
					#			THEN replace the default assignee with the default dummy user for this role in this unit
					# The variables needed for this are
					#	- @bz_user_id_dummy_user_this_role
					# 	- @component_id_this_role
					#	- @id_role_type
					# 	- @this_script
					#	- @product_id
					#	- @creator_bz_id

					# Which scenario are we in?

						# Do we have at least another real user in default CC for the cases created in this role in this unit?

							SET @oldest_default_cc_this_role = (SELECT MIN(`user_id`)
								FROM `component_cc`
								WHERE `component_id` = @component_id_this_role
								)
								;

							SET @qa_in_option_1 = IFNULL(@oldest_default_cc_this_role, 0);

							#	Are we going to do the change now?
							
								IF @qa_in_option_1 !=0
								# yes, we can do the change
								THEN
									# We use this user ID as the new default assignee for this component/role

										SET @qa_in_option_1_name = (SELECT `realname` 
											FROM `profiles` 
											WHERE `userid` = @qa_in_option_1
											)
											;

										UPDATE `components`
											SET `initialqacontact` = @qa_in_option_1
											WHERE `id` = @component_id_this_role
											;

									# We log the change in the BZ native audit log
										
										INSERT	INTO `audit_log`
											(`user_id`
											,`class`
											,`object_id`
											,`field`
											,`removed`
											,`added`
											,`at_time`
											) 
											VALUES 
											(@creator_bz_id, 'Bugzilla::Component', @component_id_this_role, 'initialqacontact', @bz_user_id, @qa_in_option_1, @timestamp)
											;

								END IF;

								IF @qa_in_option_1 = 0
								# We know that we do NOT have any other user in default CC for this role
								# Do we have another 'Real' user in this role for this unit?
								THEN

									# First we need to find that user...
									# What is the group id for all the users in this role in this unit?

										SET @option_2_group_id_this_role = (SELECT `group_id`
											FROM `ut_product_group`
											WHERE (`component_id` = @component_id_this_role)
												AND (`group_type_id` = 22)
											)
											;

									# What is the oldest user in this group who is NOT a dummy user?

										SET @oldest_other_user_in_this_role = (SELECT MIN(`user_id`)
											FROM `user_group_map`
											WHERE `group_id` = @option_2_group_id_this_role
											)
											;

										SET @qa_in_option_2 = IFNULL(@oldest_default_cc_this_role, 0);

									# Are we going to do the change now?

										IF @qa_in_option_2 != 0
										# We know that we do NOT have any other user in default CC for this role
										# BUT We know we HAVE another user is this role for this unit.
										THEN

											# We use this user ID as the new default assignee for this component/role.

												SET @qa_in_option_2_name = (SELECT `realname` 
													FROM `profiles` 
													WHERE `userid` = @qa_in_option_2
													)
													;

											# We can now update the default assignee for this component/role

												UPDATE `components`
													SET `initialqacontact` = @qa_in_option_2
													WHERE `id` = @component_id_this_role
													;

											# We log the change in the BZ native audit log
											
												INSERT	INTO `audit_log`
													(`user_id`
													,`class`
													,`object_id`
													,`field`
													,`removed`
													,`added`
													,`at_time`
													) 
													VALUES 
													(@creator_bz_id, 'Bugzilla::Component', @component_id_this_role, 'initialqacontact', @bz_user_id, @qa_in_option_2, @timestamp)
													;

										END IF;

										IF @qa_in_option_2 = 0
										# We know that we do NOT have any other user in default CC for this role
										# We know we do NOT have another user is this role for this unit.
										# We need to use the Default dummy user for this role in this unit.
										THEN

										# We define the dummy user role description based on the variable @id_role_type
											SET @dummy_user_role_desc = IF(@id_role_type = 1
												, CONCAT('Generic '
													, (SELECT`role_type` FROM `ut_role_types` WHERE `id_role_type` = @id_role_type)
													, ' - THIS SHOULD NOT BE USED UNTIL YOU HAVE ASSOCIATED AN ACTUAL'
													, (SELECT `role_type` FROM `ut_role_types` WHERE `id_role_type` = @id_role_type)
													, ' TO THIS UNIT'
													)
												, IF(@id_role_type = 2
													, CONCAT('Generic '
														, (SELECT `role_type` FROM `ut_role_types` WHERE `id_role_type` = @id_role_type)
														, ' - THIS SHOULD NOT BE USED UNTIL YOU HAVE ASSOCIATED AN ACTUAL'
														, (SELECT `role_type` FROM `ut_role_types` WHERE `id_role_type` = @id_role_type)
														, ' TO THIS UNIT'
														)
													, IF(@id_role_type = 3
														, CONCAT('Generic '
															, (SELECT `role_type` FROM `ut_role_types` WHERE `id_role_type` = @id_role_type)
															, ' - THIS SHOULD NOT BE USED UNTIL YOU HAVE ASSOCIATED AN ACTUAL'
															, (SELECT`role_type` FROM `ut_role_types` WHERE `id_role_type` = @id_role_type)
															, ' TO THIS UNIT'
															)
														, IF(@id_role_type = 4
															, CONCAT('Generic '
																, (SELECT `role_type` FROM `ut_role_types` WHERE `id_role_type` = @id_role_type)
																, ' - THIS SHOULD NOT BE USED UNTIL YOU HAVE ASSOCIATED AN ACTUAL'
																, (SELECT `role_type` FROM `ut_role_types` WHERE `id_role_type` = @id_role_type)
																, ' TO THIS UNIT'
																)
															, IF(@id_role_type = 5
																, CONCAT('Generic '
																	, (SELECT `role_type` FROM `ut_role_types` WHERE `id_role_type` = @id_role_type)
																	, ' - THIS SHOULD NOT BE USED UNTIL YOU HAVE ASSOCIATED AN ACTUAL'
																	, (SELECT `role_type` FROM `ut_role_types` WHERE `id_role_type` = @id_role_type)
																	, ' TO THIS UNIT'
																	)
																, CONCAT('error in script'
																	, @this_script
																	, 'line ... shit what is it again?'
																	)
																)
															)
														)
													)
												)
												;

											# We can now do the update

												UPDATE `components`
												SET `initialqacontact` = @bz_user_id_dummy_user_this_role
													WHERE 
													`id` = @component_id_this_role
													;

											# We log the change in the BZ native audit log
											
												INSERT	INTO `audit_log`
													(`user_id`
													,`class`
													,`object_id`
													,`field`
													,`removed`
													,`added`
													,`at_time`
													) 
													VALUES 
													(@creator_bz_id, 'Bugzilla::Component', @component_id_this_role, 'initialqacontact', @bz_user_id, @bz_user_id_dummy_user_this_role, @timestamp)
													;

										END IF;
								END IF;
				END IF;

	# Housekeeping 
	# Clean up the variables we used specifically for this script

		SET @script = NULL;
		SET @timestamp = NULL;

	END IF;

END//
DELIMITER ;

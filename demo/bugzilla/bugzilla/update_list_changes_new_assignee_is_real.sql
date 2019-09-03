DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `update_list_changes_new_assignee_is_real`()
    SQL SECURITY INVOKER
BEGIN

# This procedure Needs the following objects:
#	- @environment
#
			
# Create the view to list all the changes from the audit log when we replaced the dummy tenant with a real user
# This version of the script uses the values for the PROD Environment (everything except 1 or 2 this is in case the environment variabel is omitted)
#
	DROP VIEW IF EXISTS `list_changes_new_assignee_is_real`;
	
	IF @environment = '1'
		THEN
		# We are in the DEV/Staging environment
		# Create the view to list all the changes from the audit log when we replaced the dummy tenant with a real user
		# We use the values for the DEV/Staging environment (1)		
		CREATE VIEW `list_changes_new_assignee_is_real`
			AS
				SELECT `ut_product_group`.`product_id`
					, `audit_log`.`object_id` AS `component_id`
					, `audit_log`.`removed`
					, `audit_log`.`added`
					, `audit_log`.`at_time`
					, `ut_product_group`.`role_type_id`
					FROM `audit_log`
						INNER JOIN `ut_product_group` 
						ON (`audit_log`.`object_id` = `ut_product_group`.`component_id`)
					# If we add one of the BZ user who is NOT a dummy user, then it is a REAL user
					WHERE (`class` = 'Bugzilla::Component'
						AND `field` = 'initialowner'
						AND 
						# The new initial owner is NOT the dummy tenant?
						`audit_log`.`added` <> 96
						AND 
						# The new initial owner is NOT the dummy landlord?
						`audit_log`.`added` <> 94
						AND 				
						# The new initial owner is NOT the dummy contractor?
						`audit_log`.`added` <> 93
						AND 
						# The new initial owner is NOT the dummy Mgt Cny?
						`audit_log`.`added` <> 95
						AND 
						# The new initial owner is NOT the dummy agent?
						`audit_log`.`added` <> 92
						)
					GROUP BY `audit_log`.`object_id`
						, `ut_product_group`.`role_type_id`
					ORDER BY `audit_log`.`at_time` DESC
						, `ut_product_group`.`product_id` ASC
						, `audit_log`.`object_id` ASC
					;
		ELSEIF @environment = '2'
			THEN
			# We are in the Prod environment
			# Create the view to list all the changes from the audit log when we replaced the dummy tenant with a real user
			# We use the values for the Prod environment (2)
			#
			CREATE VIEW `list_changes_new_assignee_is_real`
				AS
					SELECT `ut_product_group`.`product_id`
						, `audit_log`.`object_id` AS `component_id`
						, `audit_log`.`removed`
						, `audit_log`.`added`
						, `audit_log`.`at_time`
						, `ut_product_group`.`role_type_id`
						FROM `audit_log`
							INNER JOIN `ut_product_group` 
							ON (`audit_log`.`object_id` = `ut_product_group`.`component_id`)
						# If we add one of the BZ user who is NOT a dummy user, then it is a REAL user
						WHERE (`class` = 'Bugzilla::Component'
							AND `field` = 'initialowner'
							AND 
							# The new initial owner is NOT the dummy tenant?
							`audit_log`.`added` <> 93
							AND 
							# The new initial owner is NOT the dummy landlord?
							`audit_log`.`added` <> 91
							AND 				
							# The new initial owner is NOT the dummy contractor?
							`audit_log`.`added` <> 90
							AND 
							# The new initial owner is NOT the dummy Mgt Cny?
							`audit_log`.`added` <> 92
							AND 
							# The new initial owner is NOT the dummy agent?
							`audit_log`.`added` <> 89
							)
						GROUP BY `audit_log`.`object_id`
							, `ut_product_group`.`role_type_id`
						ORDER BY `audit_log`.`at_time` DESC
							, `ut_product_group`.`product_id` ASC
							, `audit_log`.`object_id` ASC
						;
		ELSEIF @environment = '3'
			THEN
			# We are in the DEMO environment
			# Create the view to list all the changes from the audit log when we replaced the dummy tenant with a real user
			# We use the values for the DEMO Environment (3)
			#
			CREATE VIEW `list_changes_new_assignee_is_real`
				AS
					SELECT `ut_product_group`.`product_id`
						, `audit_log`.`object_id` AS `component_id`
						, `audit_log`.`removed`
						, `audit_log`.`added`
						, `audit_log`.`at_time`
						, `ut_product_group`.`role_type_id`
						FROM `audit_log`
							INNER JOIN `ut_product_group` 
							ON (`audit_log`.`object_id` = `ut_product_group`.`component_id`)
						# If we add one of the BZ user who is NOT a dummy user, then it is a REAL user
						WHERE (`class` = 'Bugzilla::Component'
							AND `field` = 'initialowner'
							AND 
							# The new initial owner is NOT the dummy tenant?
							`audit_log`.`added` <> 4
							AND 
							# The new initial owner is NOT the dummy landlord?
							`audit_log`.`added` <> 3
							AND 				
							# The new initial owner is NOT the dummy contractor?
							`audit_log`.`added` <> 5
							AND 
							# The new initial owner is NOT the dummy Mgt Cny?
							`audit_log`.`added` <> 6
							AND 
							# The new initial owner is NOT the dummy agent?
							`audit_log`.`added` <> 2
							)
						GROUP BY `audit_log`.`object_id`
							, `ut_product_group`.`role_type_id`
						ORDER BY `audit_log`.`at_time` DESC
							, `ut_product_group`.`product_id` ASC
							, `audit_log`.`object_id` ASC
						;
	END IF;
END//
DELIMITER ;

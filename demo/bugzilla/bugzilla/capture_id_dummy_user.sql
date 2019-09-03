DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `capture_id_dummy_user`()
    SQL SECURITY INVOKER
BEGIN
	
	# What is the default dummy user id for this environment?
	# This procedure needs the following objects:
	#	- Table `ut_temp_dummy_users_for_roles`
	#	- @environment
	#
	# This procedure will return the following variables:
	#	- @bz_user_id_dummy_tenant
	#	- @bz_user_id_dummy_landlord
	#	- @bz_user_id_dummy_contractor
	#	- @bz_user_id_dummy_mgt_cny
	#	- @bz_user_id_dummy_agent
	
		# Get the BZ profile id of the dummy users based on the environment variable
			# Tenant 1
				SET @bz_user_id_dummy_tenant = (SELECT `tenant_id` 
											FROM `ut_temp_dummy_users_for_roles` 
											WHERE `environment_id` = @environment)
											;
				# Landlord 2
				SET @bz_user_id_dummy_landlord = (SELECT `landlord_id` 
											FROM `ut_temp_dummy_users_for_roles` 
											WHERE `environment_id` = @environment)
											;
				
			# Contractor 3
				SET @bz_user_id_dummy_contractor = (SELECT `contractor_id` 
											FROM `ut_temp_dummy_users_for_roles` 
											WHERE `environment_id` = @environment)
											;
				
			# Management company 4
				SET @bz_user_id_dummy_mgt_cny = (SELECT `mgt_cny_id` 
											FROM `ut_temp_dummy_users_for_roles` 
											WHERE `environment_id` = @environment)
											;
				
			# Agent 5
				SET @bz_user_id_dummy_agent = (SELECT `agent_id` 
											FROM `ut_temp_dummy_users_for_roles` 
											WHERE `environment_id` = @environment)
											;

END//
DELIMITER ;

DELIMITER //
CREATE DEFINER=`admin`@`%` PROCEDURE `remove_user_from_role_unit_level_3`()
    SQL SECURITY INVOKER
BEGIN

# This Procedure needs the following variables:
#	- @unee_t_mefe_user_id
#	- @unee_t_mefe_unit_id_l3

		# We delete the relation user/unit in the `ut_map_user_permissions_unit_level_3`

			DELETE `ut_map_user_permissions_unit_level_3` 
			FROM `ut_map_user_permissions_unit_level_3`
				WHERE (`unee_t_mefe_id` = @unee_t_mefe_user_id
					AND `unee_t_unit_id` = @unee_t_mefe_unit_id_l3)
					;

		# We delete the relation user/unit in the table `ut_map_user_permissions_unit_all`

			DELETE `ut_map_user_permissions_unit_all` 
			FROM `ut_map_user_permissions_unit_all`
				WHERE `unee_t_mefe_id` = @unee_t_mefe_user_id
					AND `unee_t_unit_id` = @unee_t_mefe_unit_id_l3
					;

END//
DELIMITER ;

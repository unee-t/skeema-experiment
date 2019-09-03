DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `table_to_list_dummy_user_by_environment`()
    SQL SECURITY INVOKER
BEGIN

	# We create a temporary table to record the ids of the dummy users in each environments:
		/*Table structure for table `ut_temp_dummy_users_for_roles` */
			DROP TEMPORARY TABLE IF EXISTS `ut_temp_dummy_users_for_roles`;

			CREATE TEMPORARY TABLE `ut_temp_dummy_users_for_roles` (
				`environment_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id of the environment',
				`environment_name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
				`tenant_id` int(11) NOT NULL,
				`landlord_id` int(11) NOT NULL,
				`contractor_id` int(11) NOT NULL,
				`mgt_cny_id` int(11) NOT NULL,
				`agent_id` int(11) DEFAULT NULL,
				PRIMARY KEY (`environment_id`)
			) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

		/*Data for the table `ut_temp_dummy_users_for_roles` */
			INSERT INTO `ut_temp_dummy_users_for_roles`(`environment_id`, `environment_name`, `tenant_id`, `landlord_id`, `contractor_id`, `mgt_cny_id`, `agent_id`) values 
				(1,'DEV/Staging', 96, 94, 93, 95, 92),
				(2,'Prod', 93, 91, 90, 92, 89),
				(3,'demo/dev', 4, 3, 5, 6, 2);

END//
DELIMITER ;

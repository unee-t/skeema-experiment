CREATE TABLE `ut_product_group` (
  `product_id` mediumint(9) unsigned NOT NULL COMMENT 'id in the table products - to identify all the groups for a product/unit',
  `component_id` mediumint(9) unsigned DEFAULT NULL COMMENT 'id in the table components - to identify all the groups for a given component/role',
  `group_id` mediumint(9) unsigned NOT NULL COMMENT 'id in the table groups - to map the group to the list in the table `groups`',
  `group_type_id` mediumint(9) unsigned NOT NULL COMMENT 'id in the table ut_group_types - to avoid re-creating the same group for the same product again',
  `role_type_id` smallint(6) unsigned DEFAULT NULL COMMENT 'id in the table ut_role_types - to make sure all similar stakeholder in a unit are made a member of the same group',
  `created_by_id` mediumint(9) unsigned DEFAULT NULL COMMENT 'id in the table ut_profiles',
  `created` datetime DEFAULT NULL COMMENT 'creation ts',
  KEY `ut_product_group_product_id_group_id` (`product_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE `ut_data_to_create_units` (
  `id_unit_to_create` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'The unique ID in this table',
  `mefe_unit_id` varchar(256) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'The id of this unit in the MEFE database',
  `mefe_unit_id_int_value` int(11) unsigned DEFAULT NULL COMMENT 'The INT value for the mefe unit ID. We use this everfywhere in the SELECT invocations.',
  `mefe_creator_user_id` varchar(256) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'The id of the creator of this unit in the MEFE database',
  `bzfe_creator_user_id` mediumint(9) unsigned NOT NULL COMMENT 'The BZFE user id who creates this unit. this is a FK to the BZ table ''profiles''',
  `classification_id` mediumint(9) unsigned NOT NULL COMMENT 'The ID of the classification for this unit - a FK to the BZ table ''classifications''',
  `unit_name` varchar(54) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '' COMMENT 'A name for the unit. We will append the product id and this will be inserted in the product name field of the BZ tabele product which has a max lenght of 64',
  `unit_description_details` varchar(500) COLLATE utf8mb4_unicode_520_ci DEFAULT '' COMMENT 'More information about the unit - this is a free text space',
  `bz_created_date` datetime DEFAULT NULL COMMENT 'Date and time when this unit has been created in the BZ databae',
  `comment` mediumtext COLLATE utf8mb4_unicode_520_ci COMMENT 'Any comment',
  `product_id` mediumint(9) unsigned DEFAULT NULL COMMENT 'The id of the product in the BZ table ''products''. Because this is a record that we will keep even AFTER we deleted the record in the BZ table, this can NOT be a FK.',
  `deleted_datetime` datetime DEFAULT NULL COMMENT 'Timestamp when this was deleted in the BZ db (together with all objects related to this product/unit).',
  `deletion_script` varchar(500) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'The script used to delete this product and all objects related to this product in the BZ database',
  PRIMARY KEY (`id_unit_to_create`),
  UNIQUE KEY `unit_mefe_unit_id_must_be_unique` (`mefe_unit_id`),
  KEY `new_unit_classification_id_must_exist` (`classification_id`),
  KEY `new_unit_unit_creator_bz_id_must_exist` (`bzfe_creator_user_id`),
  KEY `unique_mefe_unit_id_int_value` (`mefe_unit_id_int_value`),
  CONSTRAINT `new_unit_classification_id_must_exist` FOREIGN KEY (`classification_id`) REFERENCES `classifications` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `new_unit_unit_creator_bz_id_must_exist` FOREIGN KEY (`bzfe_creator_user_id`) REFERENCES `profiles` (`userid`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

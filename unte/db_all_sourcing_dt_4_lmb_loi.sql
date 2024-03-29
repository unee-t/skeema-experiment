CREATE TABLE `db_all_sourcing_dt_4_lmb_loi` (
  `id_lmb_loi` int(10) NOT NULL AUTO_INCREMENT,
  `external_id` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'The id of the record in an external system',
  `external_system_id` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'The id of the system which provides the external_system_id',
  `external_table` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'The table in the external system where this record is stored',
  `syst_created_datetime` datetime DEFAULT NULL,
  `syst_updated_datetime` datetime DEFAULT NULL,
  `created_by` int(10) DEFAULT NULL,
  `updated_by` int(10) DEFAULT NULL,
  `is_locked` tinyint(1) DEFAULT '0',
  `is_inactive` tinyint(1) DEFAULT '0',
  `is_renewal` tinyint(1) DEFAULT '0',
  `is_lost` tinyint(1) DEFAULT '0',
  `is_giro_in_place` tinyint(1) DEFAULT '0',
  `is_giro_cancelled` tinyint(1) DEFAULT '0',
  `legal_entity_id` int(11) DEFAULT '1' COMMENT 'The legal entity where this belongs - this is a FK to the table `203_legal_entities`',
  `flat_id` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `agent_id` int(10) DEFAULT NULL,
  `assigned_to` int(10) DEFAULT NULL,
  `finance_assigned_to` int(10) DEFAULT NULL,
  `loi_status_id` int(10) NOT NULL,
  `loi_type_id` int(11) DEFAULT '1' COMMENT 'New in DB v3.25.1 The type of the LOI - a FK to the table 172_loi_types',
  `lost_cause_id` int(10) DEFAULT NULL,
  `lease_start` date DEFAULT NULL,
  `available_from` date DEFAULT NULL,
  `lease_end` date DEFAULT NULL,
  `ask_price` decimal(19,2) DEFAULT NULL,
  `rent_offered` decimal(19,2) DEFAULT NULL,
  `minor_repair_amount` decimal(19,2) DEFAULT NULL,
  `maximum_unoccupied_period` int(11) DEFAULT '30' COMMENT 'The maximum number of days per calendar year that we can have this unit unoccupied as part of this LOI - introduced in db v4.33.0',
  `number_of_rent_suspension_days_ytd` int(11) DEFAULT NULL COMMENT 'The number of unoccupied days that we have deducted from the rent since Jan 1st - introduced in db v4.33.0',
  `lmb_offer_date` date DEFAULT NULL,
  `lmb_requirements` mediumtext COLLATE utf8mb4_unicode_520_ci,
  `reservation_payment` decimal(19,2) DEFAULT NULL,
  `reservation_payment_date` date DEFAULT NULL,
  `agent_commission` decimal(19,2) DEFAULT NULL,
  `deposit_amount_agreed` decimal(19,2) DEFAULT NULL,
  `deposit_amount_paid` decimal(19,2) DEFAULT NULL,
  `deposit_payment_date` date DEFAULT NULL,
  `first_rent_paid` date DEFAULT NULL,
  `rent_paid_on` int(10) DEFAULT NULL,
  `landlord_ok` date DEFAULT NULL,
  `lost_date` date DEFAULT NULL,
  `lost_rent` decimal(19,2) DEFAULT NULL,
  `invoice_entity_id` int(11) DEFAULT NULL COMMENT 'Default for invoicing entity.',
  `offboarding_date` date DEFAULT NULL COMMENT 'Date when unit is prepared to be returned to landlords.',
  PRIMARY KEY (`id_lmb_loi`),
  KEY `deposit_amount_paid` (`deposit_amount_paid`),
  KEY `first_rent_paid` (`first_rent_paid`),
  KEY `flat_id` (`flat_id`),
  KEY `id` (`id_lmb_loi`),
  KEY `loi_status_id` (`loi_status_id`),
  KEY `lost_cause_id` (`lost_cause_id`),
  KEY `loi_created_by` (`created_by`),
  KEY `loi_updated_by` (`updated_by`),
  KEY `lmb_loi_agent_id` (`agent_id`),
  KEY `lmb_loi_assigned_to` (`assigned_to`),
  KEY `lmb_loi_finance_assigned_to` (`finance_assigned_to`),
  KEY `loi_id_legal_entity_id` (`legal_entity_id`),
  KEY `flat_id_index` (`flat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci ROW_FORMAT=DYNAMIC;

CREATE TABLE `db_sourcing_ls_0_loi_status` (
  `id_loi_status` int(10) NOT NULL AUTO_INCREMENT,
  `obsolete` tinyint(1) DEFAULT '0',
  `order` int(10) NOT NULL DEFAULT '0',
  `loi_status` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `is_valid` tinyint(1) DEFAULT '0' COMMENT '1 if this letter was active at some point',
  `is_active` tinyint(1) DEFAULT '0' COMMENT '1 if this we can sell this flat or the rooms within this flat',
  `loi_status_description` mediumtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`id_loi_status`,`loi_status`),
  KEY `id` (`id_loi_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci ROW_FORMAT=DYNAMIC;

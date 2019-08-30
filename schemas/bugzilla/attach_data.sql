CREATE TABLE `attach_data` (
  `id` mediumint(9) unsigned NOT NULL,
  `thedata` longblob NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_attach_data_id_attachments_attach_id` FOREIGN KEY (`id`) REFERENCES `attachments` (`attach_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci MAX_ROWS=100000 AVG_ROW_LENGTH=1000000;

DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `update_bz_fielddefs`()
    SQL SECURITY INVOKER
BEGIN

	# Update the name for the field `bug_id`
	UPDATE `fielddefs`
	SET `description` = 'Case #'
	WHERE `id` = 1;

	# Update the name for the field `classification`
	UPDATE `fielddefs`
	SET `description` = 'Unit Group'
	WHERE `id` = 3;

	# Update the name for the field `product`
	UPDATE `fielddefs`
	SET `description` = 'Unit'
	WHERE `id` = 4;

	# Update the name for the field `rep_platform`
	UPDATE `fielddefs`
	SET `description` = 'Case Category'
	WHERE `id` = 6;

	# Update the name for the field `component`
	UPDATE `fielddefs`
	SET `description` = 'Role'
	WHERE `id` = 15;

	# Update the name for the field `days_elapsed`
	UPDATE `fielddefs`
	SET `description` = 'Days since case changed'
	WHERE `id` = 59;

END//
DELIMITER ;

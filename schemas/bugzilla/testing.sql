DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `testing`()
BEGIN
CALL mysql.lambda_async(CONCAT('arn:aws:lambda:ap-southeast-1:812644853088:function:alambda_simple')
  , CONCAT('{"plb64":"',  TO_BASE64( JSON_OBJECT ('notification_type', 213) ), '"}'))
;
END//
DELIMITER ;

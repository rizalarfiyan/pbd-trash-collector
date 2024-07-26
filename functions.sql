SET GLOBAL log_bin_trust_function_creators = 1;

DELIMITER $$;
  DROP FUNCTION IF EXISTS getUserScore;
CREATE FUNCTION getUserScore(points DECIMAL(10, 2), cartCount INT)
    RETURNS DECIMAL(10, 2)
BEGIN
    RETURN points / cartCount;
END $$;
DELIMITER ;

DELIMITER $$;
  DROP FUNCTION IF EXISTS getTotalActiveGarbageBank;
CREATE FUNCTION getTotalActiveGarbageBank()
    RETURNS INT
BEGIN
    DECLARE total INT;
    SELECT COUNT(garbage_bank_id) INTO total FROM garbage_banks WHERE is_active = TRUE;
    RETURN total;
END $$;
DELIMITER ;

# TODO: update procedure
#   - 0 parameter
#   - 2 parameter
#   - with flow control

DELIMITER $$;
DROP PROCEDURE IF EXISTS insert_carts;
CREATE PROCEDURE insert_carts(IN pUserId INT, IN pGarbageBankId INT, OUT pCartId INT)
BEGIN
    INSERT INTO carts (user_id, garbage_bank_id) VALUES (pUserId, pGarbageBankId);
    SET pCartId = LAST_INSERT_ID();
END $$;
DELIMITER ;

DELIMITER $$;
DROP PROCEDURE IF EXISTS insert_cart_trash;
CREATE PROCEDURE insert_cart_trash(IN pCartId  INT, IN pTrashId INT, IN pWeight DECIMAL(10, 1))
BEGIN
    DECLARE pointPerWeight DECIMAL(10, 1);
    SELECT point_per_weight INTO pointPerWeight FROM trashes WHERE trash_id = pTrashId;
    INSERT INTO cart_trash (cart_id, trash_id, weight, point) VALUES (pCartId, pTrashId, pWeight, pWeight * pointPerWeight);
END $$;
DELIMITER ;


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

DELIMITER $$;
DROP PROCEDURE IF EXISTS insert_verification_forgot_password;
CREATE PROCEDURE insert_verification_forgot_password(IN pUserId  INT, IN pCode VARCHAR(50))
BEGIN
    INSERT INTO verifications (user_id, code, type) VALUES (pUserId, pCode, 'forgot_password');
END $$;
DELIMITER ;

DELIMITER $$;
DROP PROCEDURE IF EXISTS insert_verification_activation;
CREATE PROCEDURE insert_verification_activation(IN pUserId  INT, IN pCode VARCHAR(50))
BEGIN
    INSERT INTO verifications (user_id, code, type) VALUES (pUserId, pCode, 'activation');
END $$;
DELIMITER ;

DELIMITER $$;
DROP PROCEDURE IF EXISTS user_banned;
CREATE PROCEDURE user_banned()
BEGIN
    SELECT * FROM users WHERE status = 'banned';
END $$;
DELIMITER ;

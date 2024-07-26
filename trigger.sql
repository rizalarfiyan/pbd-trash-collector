DELIMITER $$;
DROP TRIGGER IF EXISTS ai_cart_trash;
CREATE TRIGGER ai_cart_trash
    AFTER INSERT
    ON cart_trash
    FOR EACH ROW
BEGIN
    UPDATE carts SET total_point = total_point + NEW.point, total_weight = total_weight + NEW.weight WHERE cart_id = NEW.cart_id;
END $$;
DELIMITER ;

DELIMITER $$;
DROP TRIGGER IF EXISTS bi_verifications;
CREATE TRIGGER bi_verifications
    BEFORE INSERT
    ON verifications
    FOR EACH ROW
BEGIN
    DECLARE userStatus VARCHAR(8);
    SELECT status INTO userStatus FROM users WHERE users.user_id = NEW.user_id;

    IF userStatus = 'banned' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Your account is banned!';
    END IF;

    IF NEW.type = 'activation' AND userStatus = 'active' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Your account is already active!';
    END IF;

    IF NEW.type = 'forgot_password' AND userStatus = 'inactive' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Your account is inactive!';
    END IF;
END $$;
DELIMITER ;

DELIMITER $$;
DROP TRIGGER IF EXISTS bu_carts;
CREATE TRIGGER bu_carts
    BEFORE UPDATE
    ON carts
    FOR EACH ROW
BEGIN
    DECLARE userRole VARCHAR(5);
    SELECT role INTO userRole FROM users WHERE user_id = NEW.approval_by;
    IF userRole NOT IN ('admin', 'staff') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'You don\'t have access to change status!';
    END IF;
END $$;
DELIMITER ;

DELIMITER $$;
DROP TRIGGER IF EXISTS au_carts;
CREATE TRIGGER au_carts
    AFTER UPDATE
    ON carts
    FOR EACH ROW
BEGIN
    IF NEW.status = 'success' THEN
        UPDATE users SET points = points + OLD.total_point, cart_count = cart_count + 1 WHERE user_id = OLD.user_id;
    END IF;
END $$;
DELIMITER ;

DELIMITER $$;
DROP TRIGGER IF EXISTS bd_categories;
CREATE TRIGGER bd_categories
    BEFORE DELETE
    ON categories
    FOR EACH ROW
BEGIN
    DECLARE total INT;
    SELECT DISTINCT count(trash_id) INTO total FROM category_trash WHERE category_id = OLD.category_id;
    IF total > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete this category because it is still used by some trash!';
    END IF;
END $$;
DELIMITER ;

DELIMITER $$;
DROP TRIGGER IF EXISTS ad_categories;
CREATE TRIGGER ad_categories
    AFTER DELETE
    ON categories
    FOR EACH ROW
BEGIN
    INSERT INTO log_categories (category_id, name) VALUES (OLD.category_id, OLD.name);
END $$;
DELIMITER ;

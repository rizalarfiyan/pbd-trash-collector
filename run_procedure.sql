SELECT user_id, email, name, status FROM users WHERE status != 'inactive';
SELECT user_id, email, name, status FROM users where user_id = 2;

CALL insert_verification_forgot_password(3, 'FPcj9ecYurUPPvFSrgYdutZdiMvvEuhLjzQG2CVEwP5x19ygU6');

SELECT verification_id, user_id, code, type FROM verifications WHERE user_id = 3 AND type = 'forgot_password';

SELECT user_id, email, name, status FROM users where status = 'banned';
SELECT user_id, email, name, status FROM users where user_id = 19;

CALL insert_verification_activation(19, 'ppi3x2k0AdJbH4mUB6u9du3kwSpUdwm3xL5qnAq0bfiD0zPA6F');

CALL user_banned();


START TRANSACTION;
    CALL insert_carts(3, 1, @cartId);
    CALL insert_cart_trash(@cartId, 1, 1.5);
    CALL insert_cart_trash(@cartId, 2, 2.5);
    CALL insert_cart_trash(@cartId, 3, 3.5);
COMMIT;

SELECT *
FROM carts;

CALL insert_carts(3, 1, @cartId);

SELECT cart_id, user_id, total_weight, total_point, status FROM carts WHERE cart_id = 1;
CALL insert_cart_trash(1, 1, 1.5);
SELECT cart_id, user_id, total_weight, total_point, status FROM carts WHERE cart_id = 1;


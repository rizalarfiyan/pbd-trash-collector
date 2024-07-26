CREATE USER 'admin'@'localhost' IDENTIFIED BY '#admin123';
CREATE USER 'staff'@'localhost' IDENTIFIED BY '#staff123';
CREATE USER 'user'@'localhost' IDENTIFIED BY '#user1234';

CREATE ROLE 'admin';
CREATE ROLE 'staff';
CREATE ROLE 'user';

GRANT 'admin' TO 'admin'@'localhost';
GRANT 'staff' TO 'staff'@'localhost';
GRANT 'user' TO 'user'@'localhost';

GRANT ALL PRIVILEGES ON trash_collector.* TO 'admin' WITH GRANT OPTION;

GRANT SELECT, INSERT, UPDATE, DELETE ON trash_collector.* TO 'staff';

GRANT SELECT ON trash_collector.carts TO 'user';
GRANT SELECT ON trash_collector.withdraw_points TO 'user';
GRANT SELECT ON trash_collector.garbage_banks TO 'user';
GRANT SELECT ON trash_collector.operation_hours TO 'user';
GRANT SELECT ON trash_collector.categories TO 'user';
GRANT SELECT ON trash_collector.trashes TO 'user';

SHOW GRANTS FOR 'admin'@'localhost';
SHOW GRANTS FOR 'staff'@'localhost';
SHOW GRANTS FOR 'user'@'localhost';

SELECT *
FROM information_schema.user_roles
WHERE user = 'admin'@'localhost';
SELECT *
FROM information_schema.user_roles
WHERE user = 'staff'@'localhost';
SELECT *
FROM information_schema.user_roles
WHERE user = 'user'@'localhost';

DROP DATABASE IF EXISTS trash_collector;
CREATE DATABASE IF NOT EXISTS trash_collector;
USE trash_collector;

DROP TABLE IF EXISTS users;
CREATE TABLE users
(
    user_id    INT PRIMARY KEY AUTO_INCREMENT,
    email      VARCHAR(100) UNIQUE,
    name       VARCHAR(50) NOT NULL,
    password   VARCHAR(100),
    status     ENUM ('active', 'inactive', 'banned'),
    role       ENUM ('admin', 'staff', 'user'),
    points     INT         NOT NULL DEFAULT 0,
    created_at DATETIME,
    updated_at DATETIME
);

DROP TABLE IF EXISTS verifications;
CREATE TABLE verifications
(
    verification_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id         INT                                    NOT NULL,
    code            VARCHAR(50) UNIQUE                     NOT NULL,
    type            ENUM ('activation', 'forgot_password') NOT NULL,
    created_at      DATETIME,
    expired_at      DATETIME
);

DROP TABLE IF EXISTS user_details;
CREATE TABLE user_details
(
    user_id     INT PRIMARY KEY NOT NULL,
    province_id CHAR(2)         NOT NULL,
    regency_id  CHAR(4)         NOT NULL,
    district_id CHAR(6)         NOT NULL,
    village_id  CHAR(10)        NOT NULL,
    address     VARCHAR(255)    NOT NULL DEFAULT '',
    city_born   CHAR(4)         NOT NULL,
    born_date   DATE            NOT NULL,
    gender      ENUM ('male', 'female')
);

DROP TABLE IF EXISTS trashes;
CREATE TABLE trashes
(
    trash_id   INT PRIMARY KEY AUTO_INCREMENT,
    name       VARCHAR(100) NOT NULL,
    point_per_weight DECIMAL(10, 1) NOT NULL DEFAULT 0,
    created_at DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME
);

DROP TABLE IF EXISTS categories;
CREATE TABLE categories
(
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    name        VARCHAR(50) NOT NULL
);

DROP TABLE IF EXISTS log_categories;
CREATE TABLE log_categories
(
    category_id INT PRIMARY KEY NOT NULL,
    name        VARCHAR(50)     NOT NULL,
    deleted_at  DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS category_trash;
CREATE TABLE category_trash
(
    trash_id    INT,
    category_id INT
);

DROP TABLE IF EXISTS carts;
CREATE TABLE carts
(
    cart_id         INT PRIMARY KEY AUTO_INCREMENT,
    user_id         INT            NOT NULL,
    garbage_bank_id INT            NOT NULL,
    total_weight    DECIMAL(10, 1) NOT NULL DEFAULT 0 COMMENT 'in kg',
    total_point     DECIMAL(10, 1) NOT NULL DEFAULT 0,
    created_at      DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at      DATETIME,
    status          ENUM ('pending', 'success', 'failed'),
    approval_by     INT
);

DROP TABLE IF EXISTS cart_trash;
CREATE TABLE cart_trash
(
    cart_id  INT            NOT NULL,
    trash_id INT            NOT NULL,
    weight   DECIMAL(10, 1) NOT NULL DEFAULT 0 COMMENT 'in kg',
    point    DECIMAL(10, 1) NOT NULL DEFAULT 0
);

DROP TABLE IF EXISTS garbage_banks;
CREATE TABLE garbage_banks
(
    garbage_bank_id INT PRIMARY KEY AUTO_INCREMENT,
    province_id     CHAR(2)      NOT NULL,
    regency_id      CHAR(4)      NOT NULL,
    district_id     CHAR(6)      NOT NULL,
    village_id      CHAR(10)     NOT NULL,
    address         VARCHAR(255) NOT NULL DEFAULT '',
    created_at      DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at      DATETIME
);

DROP TABLE IF EXISTS operation_hours;
CREATE TABLE operation_hours
(
    operation_hour_id INT PRIMARY KEY AUTO_INCREMENT,
    garbage_bank_id   INT      NOT NULL,
    day               ENUM ('monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday', 'sunday'),
    open              TIME,
    close             TIME,
    created_at        DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at        DATETIME
);

DROP TABLE IF EXISTS provinces;
CREATE TABLE provinces
(
    province_id CHAR(2) PRIMARY KEY,
    name        VARCHAR(255) NOT NULL
);

DROP TABLE IF EXISTS regencies;
CREATE TABLE regencies
(
    regency_id  CHAR(4) PRIMARY KEY,
    province_id CHAR(2)      NOT NULL,
    name        VARCHAR(255) NOT NULL
);

DROP TABLE IF EXISTS districts;
CREATE TABLE districts
(
    district_id CHAR(6) PRIMARY KEY,
    regency_id  CHAR(4)      NOT NULL,
    name        VARCHAR(255) NOT NULL
);

DROP TABLE IF EXISTS villages;
CREATE TABLE villages
(
    village_id  CHAR(10) PRIMARY KEY,
    district_id CHAR(6)      NOT NULL,
    name        VARCHAR(255) NOT NULL
);

DROP TABLE IF EXISTS withdraw_points;
CREATE TABLE withdraw_points
(
    withdraw_point_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id           INT            NOT NULL,
    point             DECIMAL(10, 1) NOT NULL DEFAULT 0,
    status            ENUM ('pending', 'success', 'failed', 'cancel'),
    approval_by       INT,
    created_at        DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at        DATETIME
);

ALTER TABLE verifications ADD FOREIGN KEY (user_id) REFERENCES users (user_id);
ALTER TABLE user_details ADD FOREIGN KEY (user_id) REFERENCES users (user_id);
ALTER TABLE category_trash ADD FOREIGN KEY (trash_id) REFERENCES trashes (trash_id);
ALTER TABLE category_trash ADD FOREIGN KEY (category_id) REFERENCES categories (category_id);
ALTER TABLE trashes ADD COLUMN point_per_weight DECIMAL(10, 1) NOT NULL DEFAULT 0 AFTER name;
ALTER TABLE carts ADD FOREIGN KEY (user_id) REFERENCES users (user_id);
ALTER TABLE carts ADD FOREIGN KEY (garbage_bank_id) REFERENCES garbage_banks (garbage_bank_id);
ALTER TABLE carts ADD FOREIGN KEY (approval_by) REFERENCES users (user_id);
ALTER TABLE cart_trash ADD FOREIGN KEY (cart_id) REFERENCES carts (cart_id);
ALTER TABLE cart_trash ADD FOREIGN KEY (trash_id) REFERENCES trashes (trash_id);
ALTER TABLE operation_hours ADD FOREIGN KEY (garbage_bank_id) REFERENCES garbage_banks (garbage_bank_id);
ALTER TABLE regencies ADD FOREIGN KEY (province_id) REFERENCES provinces (province_id);
ALTER TABLE districts ADD FOREIGN KEY (regency_id) REFERENCES regencies (regency_id);
ALTER TABLE villages ADD FOREIGN KEY (district_id) REFERENCES districts (district_id);
ALTER TABLE user_details ADD FOREIGN KEY (province_id) REFERENCES provinces (province_id);
ALTER TABLE user_details ADD FOREIGN KEY (regency_id) REFERENCES regencies (regency_id);
ALTER TABLE user_details ADD FOREIGN KEY (district_id) REFERENCES districts (district_id);
ALTER TABLE user_details ADD FOREIGN KEY (village_id) REFERENCES villages (village_id);
ALTER TABLE garbage_banks ADD FOREIGN KEY (province_id) REFERENCES provinces (province_id);
ALTER TABLE garbage_banks ADD FOREIGN KEY (regency_id) REFERENCES regencies (regency_id);
ALTER TABLE garbage_banks ADD FOREIGN KEY (district_id) REFERENCES districts (district_id);
ALTER TABLE garbage_banks ADD FOREIGN KEY (village_id) REFERENCES villages (village_id);
ALTER TABLE withdraw_points ADD FOREIGN KEY (user_id) REFERENCES users (user_id);
ALTER TABLE withdraw_points ADD FOREIGN KEY (approval_by) REFERENCES users (user_id);

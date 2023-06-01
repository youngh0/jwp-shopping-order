CREATE TABLE IF NOT EXISTS product (
    id BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    price INT NOT NULL,
    image_url VARCHAR(255) NOT NULL
    );

CREATE TABLE IF NOT EXISTS member (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL UNIQUE,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
    );

CREATE TABLE IF NOT EXISTS cart_item (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    member_id BIGINT NOT NULL,
    product_id BIGINT NOT NULL,
    quantity INT UNSIGNED NOT NULL
);

CREATE TABLE IF NOT EXISTS `order` (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    member_id BIGINT UNSIGNED NOT NULL,
    total_price INT UNSIGNED NOT NULL,
    payment_price INT UNSIGNED NOT NULL,
    point INT UNSIGNED DEFAULT 0,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS ordered_item (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    order_id BIGINT UNSIGNED NOT NULL,
    product_name VARCHAR(255) NOT NULL,
    product_price INT UNSIGNED NOT NULL,
    product_quantity INT UNSIGNED NOT NULL,
    product_image TEXT NOT NULL
    );

CREATE TABLE IF NOT EXISTS coupon (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    min_amount INT UNSIGNED DEFAULT 0,
    discount_percent DECIMAL(5, 2) CHECK (discount_percent >= 0 AND discount_percent <= 100),
    discount_amount INT UNSIGNED NOT NULL CHECK (discount_amount >= min_amount),
    CONSTRAINT chk_coupon CHECK ((discount_percent = 0 AND discount_amount <> 0) OR (discount_percent <> 0 AND discount_amount = 0))
    );


CREATE TABLE IF NOT EXISTS member_coupon (
    id        BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    member_id BIGINT UNSIGNED NOT NULL,
    coupon_id BIGINT UNSIGNED NOT NULL,
    status    TINYINT DEFAULT 1
);

CREATE TABLE IF NOT EXISTS point_history (
    id        BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    member_id BIGINT UNSIGNED NOT NULL,
    order_id  BIGINT UNSIGNED NOT NULL,
    used_point INT UNSIGNED DEFAULT 0,
    earned_point INT UNSIGNED DEFAULT 0
);

CREATE TABLE IF NOT EXISTS ordered_coupon (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    order_id BIGINT UNSIGNED NOT NULL,
    member_coupon_id BIGINT UNSIGNED NOT NULL
);

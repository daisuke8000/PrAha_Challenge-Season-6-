CREATE DATABASE IF NOT EXISTS development;
USE development;

CREATE TABLE IF NOT EXISTS stores
(
    `id` BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `update_at` TIMESTAMP null ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS customers
(
    `customer_id` BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    `phone_number` VARCHAR(12),
    `is_deleted` BOOLEAN,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `update_at` TIMESTAMP null ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS orders
(
    `order_id` BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `customer_id` BIGINT NOT NULL,
    `amount` INT(10) NOT NULL,
    `is_paid` BOOLEAN,
    `store_id` BIGINT NOT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `update_at` TIMESTAMP null ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY fk_customer_id(customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY fk_store_id(store_id) REFERENCES stores(id)
);

CREATE TABLE IF NOT EXISTS order_items
(
    `order_item_id` BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `order_id` BIGINT NOT NULL,
    `product_id` INT NOT NULL,
    `quantity` INT(10) NOT NULL,
    `is_wasabi` BOOLEAN,
    `rise_id` INT NOT NULL,
    `order_date` DATETIME NOT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `update_at` TIMESTAMP null ON UPDATE CURRENT_TIMESTAMP,
    INDEX(product_id),
    INDEX(rise_id),
    FOREIGN KEY fk_order_id(order_id) REFERENCES orders(order_id)
);

CREATE TABLE IF NOT EXISTS products
(
    `product_id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `genre_id` INT NOT NULL,
    `category_id` INT NOT NULL,
    `name` VARCHAR(100) NOT NULL,
    `price` INT NOT NULL,
    `tax_amount` INT NOT NULL,
    `tax_in_price` INT NOT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `update_at` TIMESTAMP null ON UPDATE CURRENT_TIMESTAMP,
    INDEX(genre_id),
    INDEX(category_id),
    FOREIGN KEY fk_product_id(product_id) REFERENCES order_items(product_id)
);

CREATE TABLE IF NOT EXISTS rises
(
    `rise_id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(10) NOT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `update_at` TIMESTAMP null ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY fk_rise_id(rise_id) REFERENCES order_items(rise_id)
);

CREATE TABLE IF NOT EXISTS genres
(
    `genre_id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `update_at` TIMESTAMP null ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY fk_genre_id(genre_id) REFERENCES products(genre_id)
);

CREATE TABLE IF NOT EXISTS categories
(
    `category_id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `update_at` TIMESTAMP null ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY fk_category_id(category_id) REFERENCES products(category_id)
);
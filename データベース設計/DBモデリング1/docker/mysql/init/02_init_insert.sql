USE development;

-- 外部キー制約　無効化
set FOREIGN_KEY_CHECKS = 0;

-- 投入用データ初期化
TRUNCATE TABLE genres;
TRUNCATE TABLE categories;
TRUNCATE TABLE rises;
TRUNCATE TABLE products;
TRUNCATE TABLE order_items;
TRUNCATE TABLE orders;
TRUNCATE TABLE customers;
TRUNCATE TABLE stores;

-- 外部キー制約　有効化
set FOREIGN_KEY_CHECKS = 1;

-- 投入データ
INSERT INTO stores (name) VALUES ('店舗A');
INSERT INTO customers (
                       name
                       ,phone_number
                       ,is_deleted
                       ) VALUES ('test','09012345678', false);
INSERT INTO orders (
                    customer_id
                    ,amount
                    ,is_paid
                    ,store_id
                    ) VALUES (1,10000, true, 1);
INSERT INTO order_items (
                         order_id
                         ,product_id
                         ,quantity
                         ,is_wasabi
                         ,rise_id
                         ,order_date
                         ) VALUES (1, 1, 10, true, 1, NOW());
INSERT INTO products (
                      genre_id
                      ,category_id
                      ,name
                      ,price
                      ,tax_amount
                      ,tax_in_price
                      ) VALUES (1, 1, '玉子', 108, price * 0.10, price + tax_amount);
INSERT INTO rises (name) VALUES ('標準');
INSERT INTO genres (
                    name
                    ) VALUES ('お好みすし');
INSERT INTO categories (
                    name
                    ) VALUES ('一皿 100円（税別）');

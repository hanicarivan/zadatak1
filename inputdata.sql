INSERT INTO store (name, address, zip) VALUES
('Supermarket A', '123 Main St', '11111'),
('Grocery Store B', '456 Oak St', '22222');

INSERT INTO "user" (email, year_of_birth, household_size, created) VALUES
('user1@example.com', 1960, 0, CURRENT_TIMESTAMP),
('user2@example.com', 1975, 0, CURRENT_TIMESTAMP);

INSERT INTO receipt (user_id, store_id, purchase_date, created, updated) VALUES
(1, 1, '2021-12-15', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(1, 2, '2022-01-10', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(2, 1, '2021-11-20', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(2, 2, '2022-02-05', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO category ("name", is_grocery) VALUES
('Electronics', false),
('Vegetables', true),
('Fruits', true),
('Meat', true);

INSERT INTO product (ean, "name", category_id) VALUES
('1234567890123', 'TV', 1),
('9876543210987', 'Potato', 2),
('4567890123456', 'Banana', 3),
('5678901234567', 'Beef', 4);

INSERT INTO receipt_line (receipt_id, product_id, "count", price, discount) VALUES
(1, 1, 1, 500, NULL),
(1, 2, 10, 10, NULL),

(2, 2, 10, 10, NULL),
(2, 3, 5, 15, NULL),

(3, 2, 10, 10, NULL),
(3, 4, 1, 20, NULL),

(4, 1, 1, 500, NULL),
(4, 4, 10, 20, NULL);

/*RACUN 1
TV X 1 X 500e
POTATO X 10 X 10e = 100e
Racun1 = 600e na grocery 100 iz 2021 za usera 1

RACUN 2
POTATO X 10 X10e = 100e
BANANA X 5 x 15e = 75e
Racun2 = 175e na grocery 175 iz 2022 za usera 1

RACUN 3
POTATO X 10 X 10e = 100e
BEEF X 1 X 20e = 20e
Racun3 = 120e na grocery 120 iz 2021 za usera 2

RACUN 4
TV X 1 X 500e
BEEF X 10 X 20e = 200e
Racun4 = 700e na grocery 200 iz 2022 za usera 2

SVEUKUPNO RACUNI ZA 2022 875, na grocery 375
SVEUKUPNO RACUNI ZA 2021 720, na grocery 220 * 1.1 = 242 (za upit)*/
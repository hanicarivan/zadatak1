INSERT INTO store (name, address, zip) VALUES
('Supermarket A', '123 Main St', '12345'),
('Grocery Store B', '456 Oak St', '67890');

INSERT INTO "user" (email, year_of_birth, household_size, created) VALUES
('user1@example.com', 1990, 2, CURRENT_TIMESTAMP),
('user2@example.com', 1985, 0, CURRENT_TIMESTAMP),
('user3@example.com', 2000, 1, CURRENT_TIMESTAMP);

INSERT INTO receipt (user_id, store_id, purchase_date, created, updated) VALUES
(1, 1, '2021-12-15', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(1, 2, '2022-01-10', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(2, 1, '2021-11-20', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(2, 2, '2022-02-05', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO category ("name", is_grocery) VALUES
('Electronics', false),
('Fruits', true),
('Clothing', false);

INSERT INTO product (ean, "name", category_id) VALUES
('1234567890123', 'TV', 1),
('9876543210987', 'Banana', 2),
('4567890123456', 'Shirt', 3);

INSERT INTO receipt_line (receipt_id, product_id, "count", price, discount) VALUES
(1, 1, 1, 500, NULL),
(1, 2, 3, 10, NULL),
(2, 3, 2, 25, NULL),
(3, 1, 1, 450, NULL),
(4, 2, 5, 15, NULL);

UPDATE receipt_line
SET price = price * 1.09
WHERE receipt_id IN (2, 4);
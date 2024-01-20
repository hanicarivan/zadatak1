SELECT AVG(total_amount) AS average_amount
FROM (
	SELECT receipt.id, SUM(receipt_line."count" * receipt_line.price) AS total_amount
	FROM receipt
	JOIN receipt_line ON receipt.id = receipt_line.receipt_id
	JOIN product ON receipt_line.product_id = product.id
	JOIN category ON product.category_id = category.id
	JOIN "user" ON receipt.user_id = "user".id
	WHERE receipt.purchase_date BETWEEN '2022-01-01' AND '2022-12-31'
	AND "user".household_size = 0
	GROUP BY receipt.id
	HAVING (
		SELECT SUM(receipt_line."count" * receipt_line.price)
		FROM receipt
		JOIN receipt_line ON receipt.id = receipt_line.receipt_id
		JOIN product ON receipt_line.product_id = product.id
		JOIN category ON product.category_id = category.id
		JOIN "user" ON receipt.user_id = "user".id
		WHERE receipt.purchase_date BETWEEN '2022-01-01' AND '2022-12-31'
		AND "user".household_size = 0
		AND category.is_grocery = TRUE
	) * 1.1 < (
		SELECT SUM(receipt_line."count" * receipt_line.price)
		FROM receipt
		JOIN receipt_line ON receipt.id = receipt_line.receipt_id
		JOIN product ON receipt_line.product_id = product.id
		JOIN category ON product.category_id = category.id
		JOIN "user" ON receipt.user_id = "user".id
		WHERE receipt.purchase_date BETWEEN '2021-01-01' AND '2021-12-31'
		AND "user".household_size = 0
		AND category.is_grocery = TRUE
	) 
);
SELECT AVG(total_amount) AS average_amount
FROM (
	SELECT SUM(receipt_line."count" * receipt_line.price) AS total_amount
	FROM "user"
	JOIN receipt ON "user".id = receipt.user_id
	JOIN receipt_line ON receipt.id = receipt_line.receipt_id
	JOIN product ON receipt_line.product_id = product.id
	JOIN category ON product.category_id = category.id
	WHERE receipt.purchase_date BETWEEN '2022-01-01' AND '2022-12-31'
	AND "user".household_size = 0
	AND (
		SELECT SUM(receipt_line."count" * receipt_line.price)
		FROM "user"
		JOIN receipt ON "user".id = receipt.user_id
		JOIN receipt_line ON receipt.id = receipt_line.receipt_id
		JOIN product ON receipt_line.product_id = product.id
		JOIN category ON product.category_id = category.id
		WHERE receipt.purchase_date BETWEEN '2022-01-01' AND '2022-12-31'
		AND "user".household_size = 0
		AND category.is_grocery = true
	) > (
		SELECT SUM(receipt_line."count" * receipt_line.price * 1.1)
		FROM "user"
		JOIN receipt ON "user".id = receipt.user_id
		JOIN receipt_line ON receipt.id = receipt_line.receipt_id
		JOIN product ON receipt_line.product_id = product.id
		JOIN category ON product.category_id = category.id
		WHERE receipt.purchase_date BETWEEN '2021-01-01' AND '2021-12-31'
		AND "user".household_size = 0
		AND category.is_grocery = true
	)
	GROUP BY "user".id
);
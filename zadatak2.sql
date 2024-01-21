SELECT receipt.store_id, AVG(receipt.total_amount) AS avg_amount
FROM (
    SELECT
        receipt.store_id,
        receipt.id,
        SUM(receipt_line."count" * receipt_line.price) AS total_amount
	FROM receipt
    JOIN receipt_line ON receipt.id = receipt_line.receipt_id
    JOIN "user" ON receipt.user_id = "user".id
	WHERE EXTRACT(YEAR FROM CURRENT_DATE) - "user".year_of_birth >= 60
    GROUP BY receipt.store_id, receipt.id
	) AS receipt
GROUP BY receipt.store_id
HAVING COUNT(DISTINCT receipt.id) / COUNT(DISTINCT receipt.store_id) >= 0.2;
WITH uvjet_stariji_od AS (
	SELECT r.store_id, COUNT(DISTINCT "user".id) AS broj_starijih_od_60
	FROM receipt AS r
	JOIN "user" ON r.user_id = "user".id AND "user".year_of_birth < EXTRACT(YEAR FROM CURRENT_DATE) - 60
	GROUP BY r.store_id
	HAVING COUNT(DISTINCT "user".id) / COUNT(DISTINCT r.user_id) >= 0.2
)

SELECT receipt.store_id, AVG(receipt_line.price * receipt_line."count") AS avg_amount
FROM receipt
JOIN receipt_line ON receipt.id = receipt_line.receipt_id
JOIN uvjet_stariji_od ON receipt.store_id = uvjet_stariji_od.store_id
GROUP BY receipt.store_id
ORDER BY receipt.store_id ASC;
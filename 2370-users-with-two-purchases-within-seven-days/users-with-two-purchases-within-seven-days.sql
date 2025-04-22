-- Write your PostgreSQL query statement below
-- Write your PostgreSQL query statement below
WITH CTE1 AS(
    SELECT 
        purchase_id, 
        user_id,
        LEAD(purchase_date) OVER(PARTITION BY user_id ORDER BY purchase_date) - purchase_date AS df
    FROM Purchases)

SELECT DISTINCT user_id
FROM CTE1
WHERE df <=7
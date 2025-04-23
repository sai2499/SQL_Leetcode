-- Write your PostgreSQL query statement below
SELECT user_id, sum(price * quantity) AS spending
FROM Sales
INNER JOIN Product
USING(product_id)
GROUP BY user_id
ORDER BY spending DESC, 
        user_id ASC;
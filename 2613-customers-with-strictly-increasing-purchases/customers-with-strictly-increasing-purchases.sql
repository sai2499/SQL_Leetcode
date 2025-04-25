WITH cte AS (
    SELECT customer_id, 
           EXTRACT(YEAR FROM order_date)::int AS year_date, 
           SUM(price) AS sum
    FROM Orders
    GROUP BY customer_id, EXTRACT(YEAR FROM order_date)
),
cte2 AS (
    SELECT customer_id, 
           GENERATE_SERIES(MIN(year_date), MAX(year_date)) AS year
    FROM cte
    GROUP BY customer_id
),
cte3 AS (
    SELECT c2.customer_id, c2.year AS year_date, COALESCE(c.sum, 0) AS sum
    FROM cte2 c2
    LEFT JOIN cte c
    ON c2.customer_id = c.customer_id 
       AND c2.year = c.year_date
),
cte4 AS (
    SELECT *, 
           LAG(sum) OVER (PARTITION BY customer_id ORDER BY year_date) AS prev_sum
    FROM cte3
),
bad_customers AS (
    SELECT DISTINCT customer_id
    FROM cte4
    WHERE prev_sum IS NOT NULL AND sum <= prev_sum
)
SELECT DISTINCT customer_id
FROM cte3
WHERE customer_id NOT IN (SELECT customer_id FROM bad_customers);

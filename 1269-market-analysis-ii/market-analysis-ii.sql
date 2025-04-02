# Write your MySQL query statement below
with cte as (
    SELECT seller_id,
RANK() OVER (PARTITION BY seller_id ORDER BY order_date) AS ranks,
b.item_brand
FROM Orders a
INNER JOIN Items b
ON a.item_id = b.item_id),
tmp2 AS (
SELECT * FROM cte
WHERE ranks = 2
)

SELECT user_id AS seller_id,
CASE WHEN a.favorite_brand = b.item_brand THEN 'yes' ELSE 'no'
END AS 2nd_item_fav_brand
FROM Users a
LEFT JOIN tmp2 b
ON a.user_id = b.seller_id



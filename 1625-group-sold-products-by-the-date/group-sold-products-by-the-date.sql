# Write your MySQL query statement below
SELECT  t1.sell_date, count(distinct t1.product) as num_sold, group_concat(distinct t1.product) as products
FROM Activities t1 JOIN Activities t2
ON t1.sell_date = t2.sell_date
GROUP BY sell_date
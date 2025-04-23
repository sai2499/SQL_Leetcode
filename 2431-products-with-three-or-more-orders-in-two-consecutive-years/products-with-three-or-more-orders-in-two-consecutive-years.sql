-- Write your PostgreSQL query statement below
with cte as(
    select product_id, TO_CHAR(purchase_date, 'yyyy') as year,
    LAG(TO_CHAR(purchase_date, 'yyyy')) OVER (PARTITION BY product_id ORDER BY TO_CHAR(purchase_date, 'yyyy') ASC)
    from Orders
    group by product_id, TO_CHAR(purchase_date, 'yyyy')
    having count(product_id)>=3)

select distinct product_id 
from cte
where year::integer - lag::integer =1

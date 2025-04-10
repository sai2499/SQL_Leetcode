# Write your MySQL query statement below
with cte as(
select o.order_id, o.order_date, o.customer_id, o.product_id, p.product_name,
dense_rank() over (partition by product_id order by order_date desc) as rnk
from Orders o
left join Products p
on o.product_id = p.product_id)

select product_name, product_id, order_id, order_date
from cte
where rnk =1
ORDER BY product_name,product_id, order_id
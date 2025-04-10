# Write your MySQL query statement below
with cte as(
    select *, row_number() over (partition by customer_id order by order_date desc) as row_val
    from Orders)

select cst.name as customer_name, cst.customer_id, c.order_id, c.order_date
from cte as c
left join Customers as cst
on c.customer_id = cst.customer_id
where row_val <= 3
order by cst.name asc, cst.customer_id asc, c.order_date desc

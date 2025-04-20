-- Write your PostgreSQL query statement below
-- Write your PostgreSQL query statement below

with cte as (
    select customer_id ,
        sum(order_type) as orderSum, 
        count(*) as rc 
        from orders 
        group by customer_id )

select o.order_id,o.customer_id ,o.order_type
from orders o 
inner join cte 
using (customer_id)
where cte.orderSum=0 or (cte.orderSum=cte.rc ) or o.order_type=0


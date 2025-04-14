with cte as(
    select *, 
    ((sum(quantity) over (partition by order_id)) / (count(quantity) over (partition by order_id))) as avg_val, 
    max(quantity) over (partition by order_id) as max_val
    from OrdersDetails)

select order_id
from cte
where quantity = max_val
and max_val > (select max(avg_val) from cte)
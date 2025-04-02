# Write your MySQL query statement below
with cte as(
    select *, rank() over (partition by customer_id order by order_date) as all_del,
    case
        when order_date = customer_pref_delivery_date then "immediate"
        else "schedule"
    end as table_val
    from Delivery
)
select Round((count(customer_id)/(select count(*) from cte where all_del=1))*100,2) as immediate_percentage
from cte
where all_del=1 and table_val = "immediate"



-- Write your PostgreSQL query statement below
with cte as(
    select *, 
        case
            when order_date = customer_pref_delivery_date then 1
            else 0
        end as check_val
    from Delivery)

select order_date,
round((sum(check_val)*100.00)/count(order_date),2) as immediate_percentage
from cte
group by order_date
order by order_date
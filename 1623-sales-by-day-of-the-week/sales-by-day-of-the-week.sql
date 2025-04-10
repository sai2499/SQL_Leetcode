# Write your MySQL query statement below
with cte as(select o.order_id, 
    o.customer_id, 
    o.order_date,
    o.item_id,
    i.item_category,
    o.quantity,
    DAYNAME(o.order_date) as day_name
    from Items i
    left join Orders o
    on i.item_id = o.item_id)

select item_category as CATEGORY, 
        sum(case when day_name = "Monday" then quantity else 0 END) as "MONDAY",
        sum(case when day_name = "Tuesday" then quantity else 0 END) as "TUESDAY",
        sum(case when day_name = "Wednesday" then quantity else 0 END) as "WEDNESDAY",
        sum(case when day_name = "Thursday" then quantity else 0 END) as "THURSDAY",
        sum(case when day_name = "Friday" then quantity else 0 END) as "FRIDAY",
        sum(case when day_name = "Saturday" then quantity else 0 END) as "SATURDAY",
        sum(case when day_name = "Sunday" then quantity else 0 END) as "SUNDAY"
from cte
group by category
order by category
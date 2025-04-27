-- Write your PostgreSQL query statement below

with cte as (
    select
        t1.customer_id,
        t1.transaction_date as dt1,
        t2.transaction_date as dt2,
        t1.amount,
        (t1.transaction_date - row_number() over (partition by t1.customer_id order by t1.transaction_date) * interval '1 day')::date as diff
    from transactions t1
    join transactions t2
    on t1.customer_id = t2.customer_id 
    and t1.transaction_date + interval '1 day' = t2.transaction_date 
    and t1.amount < t2.amount
)

select 
    customer_id,
    min(dt1) as consecutive_start,
    max(dt2) as consecutive_end
from cte
group by customer_id, diff
having count(*) >= 2
order by customer_id;


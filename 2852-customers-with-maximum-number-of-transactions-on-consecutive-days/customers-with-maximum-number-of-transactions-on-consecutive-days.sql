-- Write your PostgreSQL query statement below
with cte as (
    select *, row_number() over (partition by customer_id order by transaction_date) as rnk
    from Transactions
),
cte1 as (
    select *, (transaction_date+(interval '1 day'*(-rnk)))::date as new_date
    from cte
),
cte2 as(
    select customer_id, count(new_date) as cnt
    from cte1
    group by customer_id, new_date
),
cte3 as(
    select *, rank() over (order by cnt desc) as rnks
    from cte2
)
select customer_id
from cte3
where rnks = 1
order by customer_id


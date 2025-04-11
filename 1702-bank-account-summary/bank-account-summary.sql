with cte as 
(Select user_id, credit from Users
union ALL
Select paid_by as user_id, -1*amount as credit from Transactions
union all
Select paid_to as user_id, amount as credit from Transactions)

select c.user_id, u.user_name, sum(c.credit) as credit, 
case
    when sum(c.credit) > 0 then "No"
    else "Yes"
    end as credit_limit_breached
from cte c
join Users u
on c.user_id = u.user_id
group by user_id
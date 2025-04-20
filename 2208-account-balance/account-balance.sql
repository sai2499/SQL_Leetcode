-- Write your PostgreSQL query statement below
with cte as (
        select account_id, day, amount
        from Transactions
        where type = 'Deposit'
        union all
        select account_id, day, -1*amount
        from Transactions
        where type = 'Withdraw')

select account_id, day, sum(amount) over (partition by account_id order by day) as balance
from cte
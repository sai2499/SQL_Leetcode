-- Write your PostgreSQL query statement below
-- with cte as(
-- select *, rank() over (partition by TO_CHAR(day, 'dd/mm/yyyy') order by amount desc) as rnk
-- from Transactions)

select transaction_id 
from (select *, rank() over (partition by TO_CHAR(day, 'dd/mm/yyyy') order by amount desc) as rnk
from Transactions)
where rnk = 1
order by transaction_id

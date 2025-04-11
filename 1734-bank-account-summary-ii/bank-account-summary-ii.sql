# Write your MySQL query statement below
select u.name, sum(t.amount) as balance
from Transactions t
left join Users u
on u.account = t.account
group by name
having sum(amount) > 10000
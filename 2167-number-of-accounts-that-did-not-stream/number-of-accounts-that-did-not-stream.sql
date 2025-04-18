-- Write your PostgreSQL query statement below

select count(c.account_id) as accounts_count
from Subscriptions c
left join Streams s
on s.account_id = c.account_id
and EXTRACT(YEAR FROM end_date) = 2021
and EXTRACT(YEAR FROM stream_date) <> 2021
where s.account_id is not null
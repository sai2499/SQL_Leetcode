# Write your MySQL query statement below
with full_table as
(select id, country, state, amount, date_format(trans_date, '%Y-%m') as month
from transactions t
where state = 'approved'

union all

select trans_id as id, t.country, 'back' as state, t.amount, date_format(c.trans_date, '%Y-%m') as month
from Chargebacks c
left join transactions t
on c.trans_id=t.id
)

SELECT
month,
country,
SUM(case when state='approved' then 1 else 0 end) AS approved_count,
SUM(case when state='approved' then amount else 0 end) AS approved_amount,
SUM(case when state='back' then 1 else 0 end) AS chargeback_count,
SUM(case when state='back' then amount else 0 end) AS chargeback_amount
FROM full_table
GROUP BY month, country
ORDER BY month, country;
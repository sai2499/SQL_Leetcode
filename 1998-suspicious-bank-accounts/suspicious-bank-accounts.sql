-- Write your PostgreSQL query statement below
with cte as(
    select account_id, TO_CHAR(day, 'mm') as mnt_year, sum(amount) as total_amt
    from transactions
    where type = 'Creditor'
    group by account_id, TO_CHAR(day, 'mm')
),
cte2 as(
    select *
    from cte
    join Accounts
    using (account_id)
    where total_amt > max_income)

SELECT a.account_id
FROM cte2 a
JOIN cte2 b
ON a.account_id = b.account_id
AND cast(a.mnt_year as integer) =cast(b.mnt_year as integer)+1
GROUP BY 1
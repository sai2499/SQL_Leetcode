# Write your MySQL query statement below
with distinct_date as (
    select distinct login_date,id
    from Logins
),

date_cal as (
    select id,
        lead(login_date, 4) over(partition by id order by login_date) as n4,
        lead(login_date, 3) over(partition by id order by login_date) as n3,
        lead(login_date, 2) over(partition by id order by login_date) as n2,
        lead(login_date, 1) over(partition by id order by login_date) as n1,
        login_date
    from distinct_date
),

consec_date as (
select id
from date_cal
where datediff(n4, n3)  = 1
and datediff(n3, n2)  = 1
and datediff(n2, n1)  = 1
and datediff(n1, login_date) = 1
)

select distinct a.id, a.name
from consec_date c
left join Accounts a
on c.id = a.id

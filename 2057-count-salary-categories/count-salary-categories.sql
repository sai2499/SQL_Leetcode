-- Write your PostgreSQL query statement below
with cte as(
    select *,
        case
            when income < 20000 then 0
            when income between 20000 and 50000 then 1
            else 2
        end as cat
    from Accounts
)

select 'High Salary' as category, count(cat) as accounts_count from cte where cat = 2
union all
select 'Low Salary' as category, count(cat) as accounts_count from cte where cat = 0
union all
select 'Average Salary' as category, count(cat) as accounts_count from cte where cat = 1
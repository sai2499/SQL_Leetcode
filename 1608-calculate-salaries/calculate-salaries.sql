# Write your MySQL query statement below
with cte as(
    select *, max(salary) over (partition by company_id) as max_sal
    from Salaries
)

select company_id, employee_id, employee_name,
    case
        when max_sal > 1000 and max_sal < 10000 then round((salary-(0.24*salary)),0)
        when max_sal > 10000 then round((salary-(0.49*salary)),0)
        else salary
    end as salary
from cte
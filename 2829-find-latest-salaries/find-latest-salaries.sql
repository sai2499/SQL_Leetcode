-- Write your PostgreSQL query statement below

select 
emp_id, firstname, lastname, salary, department_id
from
(select *, dense_rank() over (partition by emp_id order by salary desc) as rnk 
from Salary) t
where rnk = 1;
-- Write your PostgreSQL query statement below
with cte as(
select distinct *, count(reports_to) over (partition by reports_to) as emp_coount, 
round(avg(age) over (partition by reports_to)) as emp_age
from Employees
where reports_to is not null)

select distinct e.employee_id, e.name, c.emp_coount as reports_count, c.emp_age as average_age
from Employees e
join cte c
on e.employee_id = c.reports_to
order by employee_id
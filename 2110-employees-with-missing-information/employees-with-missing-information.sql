-- Write your PostgreSQL query statement below
with cte as(
    select employee_id from Employees
    where employee_id not in (
    select e.employee_id
    from Employees e
    join Salaries s
    on e.employee_id = s.employee_id)
    union all
    select employee_id from Salaries
    where employee_id not in (
    select e.employee_id
    from Employees e
    join Salaries s
    on e.employee_id = s.employee_id))
select * from cte order by 1
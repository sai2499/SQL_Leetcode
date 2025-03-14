-- Write your PostgreSQL query statement below

WITH tmp AS(
    SELECT
        departmentId, salary,
        DENSE_RANK() OVER (partition by departmentId ORDER BY salary desc) as "rank"
        FROM Employee
)

select d.name as "Department", e.name as "Employee", e.salary as "Salary"
from Employee e
join Department d
on e.departmentId = d.id
where (e.departmentId, e.salary) in (
    SELECT a.departmentId, a.salary
    from tmp a
    where a.rank in (1,2,3)
)
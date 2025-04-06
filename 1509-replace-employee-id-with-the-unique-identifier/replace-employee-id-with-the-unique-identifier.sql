# Write your MySQL query statement below
select unique_id, name
from Employees e
left join EmployeeUNI euni
on e.id = euni.id

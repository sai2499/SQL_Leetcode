# Write your MySQL query statement below
WITH cte AS (SELECT id, salary FROM Employee WHERE id IN (SELECT DISTINCT managerId FROM Employee))



select name as "Employee"
from Employee e 
join cte on
e.managerId = cte.id
where e.salary > cte.salary;

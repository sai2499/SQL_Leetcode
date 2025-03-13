CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
RETURN (
# Write your MySQL query statement below.
WITH tmp AS
(SELECT
e.salary,
DENSE_RANK() OVER (ORDER BY e.salary desc) as 'rank'
FROM Employee e)
SELECT a.salary as getNthHighestSalary
from tmp a
where a.rank = n
limit 1
);
END
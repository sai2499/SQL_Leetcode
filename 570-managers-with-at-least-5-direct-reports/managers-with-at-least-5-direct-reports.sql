-- Write your PostgreSQL query statement below

with cte as(
    SELECT managerId, COUNT(id) AS empcnt
    FROM Employee
    WHERE managerId IS NOT NULL
    GROUP BY managerId
)

select name from Employee where Id in (select managerId from cte where empcnt > 4)
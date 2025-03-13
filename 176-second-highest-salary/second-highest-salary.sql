-- Write your PostgreSQL query statement below
SELECT MAX(E1.SALARY) AS SecondHighestSalary
FROM EMPLOYEE E1 
INNER JOIN EMPLOYEE E2
ON E1.SALARY < E2.SALARY;
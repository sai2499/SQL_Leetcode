-- Write your PostgreSQL query statement below
SELECT distinct e.employee_id , e.department_id 
FROM Employee e
WHERE 
CASE WHEN (SELECT COUNT(*) FROM Employee WHERE employee_id = e.employee_id GROUP BY employee_id) > 1
     THEN primary_flag = 'Y'
     ELSE primary_flag = 'N'
END
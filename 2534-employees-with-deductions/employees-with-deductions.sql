-- Write your PostgreSQL query statement below

WITH worked_hour AS(
    SELECT
        employee_id,
        SUM(CEILING(((EXTRACT(epoch FROM out_time)) - (EXTRACT(epoch FROM in_time)))/60)) AS total_worked_minutes
    FROM
        Logs
    GROUP BY employee_id
)

SELECT
    e.employee_id
FROM
    Employees e
LEFT JOIN
    worked_hour w
ON e.employee_id = w.employee_id
WHERE e.needed_hours > COALESCE(w.total_worked_minutes/60,0)
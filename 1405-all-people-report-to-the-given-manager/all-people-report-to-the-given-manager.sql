WITH recursive cte AS (
    -- Anchor: start with the top-level employee (Boss)
    SELECT employee_id
    FROM Employees
    WHERE manager_id = 1 and employee_id <> 1

    UNION

    -- Recursive: get employees who report to the previous ones
    SELECT e.employee_id
    FROM cte c
    JOIN Employees e ON e.manager_id = c.employee_id
)

SELECT * FROM cte
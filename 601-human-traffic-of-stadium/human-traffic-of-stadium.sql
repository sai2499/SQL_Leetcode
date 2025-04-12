WITH CTE AS (
    SELECT *, id - ROW_NUMBER() OVER(ORDER BY visit_date) AS grp
    FROM Stadium
    WHERE people >= 100
)

SELECT id, visit_date, people
FROM CTE
WHERE grp IN (
    SELECT grp
    FROM CTE
    GROUP BY grp
    HAVING COUNT(grp) >= 3
)
ORDER BY visit_date
;
-- Write your PostgreSQL query statement below
with cte as (
    SELECT first_col, ROW_NUMBER() OVER(ORDER BY first_col ASC) AS r
    FROM Data
),
cte2 as (
    SELECT second_col, ROW_NUMBER() OVER(ORDER BY second_col DESC) AS r
    FROM Data
)

select c.first_col, c1.second_col
from cte c
join cte2 c1
using (r)
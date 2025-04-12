-- Write your PostgreSQL query statement below
with all_calls as (
    select caller_id as id, duration from Calls
    union all
    select callee_id, duration from Calls),
global_avg as (
    select avg(duration) as g_avg from all_calls
)

select c.name as country
from all_calls ac
LEFT JOIN Person p ON ac.id = p.id
LEFT JOIN Country c ON LEFT(p.phone_number,3) = c.country_code
GROUP BY 1
HAVING AVG(duration) > (select g_avg from global_avg)
-- Write your PostgreSQL query statement below
select person_id, name || '(' || LEFT(profession, 1) || ')' as name
from Person
order by person_id desc
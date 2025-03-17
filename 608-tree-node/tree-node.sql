# Write your MySQL query statement below
select id,
    case 
        when p_id is null then "Root"
        WHEN id IN (SELECT p_id FROM Tree)THEN 'Inner'
        else "Leaf"
    END as type
from Tree
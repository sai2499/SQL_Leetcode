# Write your MySQL query statement below
with cte as(
    select business_id ,event_type ,occurrences,
    avg(occurrences) over (partition by event_type) as avg_bus
    from Events)

select business_id
from cte
where occurrences > avg_bus
group by business_id
having count(business_id) > 1

-- Write your PostgreSQL query statement below
with cte as (
    select * from Activity where activity_type = 'start'
),cte2 as(
    select * from Activity where activity_type = 'end'
),cte3 as(
    select c.machine_id, 
        c.process_id, 
        c.activity_type, 
        c.timestamp, 
        c1.activity_type, 
        c1.timestamp,
        c1.timestamp-c.timestamp as diff
    from cte c
    join cte2 c1
    on c.machine_id = c1.machine_id
    and c.process_id = c1.process_id
)

select machine_id, ROUND(CAST((sum(diff)/count(*)) AS NUMERIC),3) as processing_time
from cte3
group by machine_id
order by machine_id desc
-- Write your PostgreSQL query statement below
select request_at as Day,
    ROUND(
        SUM(CASE WHEN status != 'completed' THEN 1 ELSE 0 END) * 1.0 / COUNT(*), 2
    ) AS "Cancellation Rate"
from trips
where 
client_id not in (select users_id from Users where banned = 'Yes' and role = 'client') and 
driver_id not in (select users_id from Users where banned = 'Yes' and role = 'driver') and
request_at between '2013-10-01' and '2013-10-03'
group by request_at
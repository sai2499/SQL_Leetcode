-- Write your PostgreSQL query statement below

select city_id, min(day) as day, degree
from Weather
where (city_id, degree) in (
    select city_id, max(degree) 
    from Weather 
    group by city_id
    order by city_id asc)
group by city_id, degree
-- Write your PostgreSQL query statement below
with cte as(
    select departure_airport as airport, flights_count from flights
    union all
    select arrival_airport as airport, flights_count from flights
), cte2 as(
    select airport, flights_count, sum(flights_count) over (partition by airport) as sum_val
    from cte
)

select distinct airport as airport_id
from cte2
where sum_val in (select max(sum_val) from cte2)

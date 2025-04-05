# Write your MySQL query statement below
select c.country_name, 
    case
        when (sum(weather_state)/count(*)) <= 15 then "Cold"
        when (sum(weather_state)/count(*)) >= 25 then "Hot"
        else "Warm"
        end as "weather_type"
from Countries c
left join Weather w
on c.country_id = w.country_id
where Month(w.day) = 11
group by c.country_id
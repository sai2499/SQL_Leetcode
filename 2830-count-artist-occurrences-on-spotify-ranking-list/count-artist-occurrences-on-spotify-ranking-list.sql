-- Write your PostgreSQL query statement below
select distinct artist, 
count(id) over (partition by artist) as occurrences
from Spotify
order by occurrences desc, artist asc

with cte as (select b.box_id, 
b.apple_count + coalesce(c.apple_count,0) as total_app, 
b.orange_count + coalesce(c.orange_count,0) as total_org
from Boxes b
left join Chests c
using (chest_id))

select sum(total_app) as apple_count, sum(total_org) as orange_count
from cte 

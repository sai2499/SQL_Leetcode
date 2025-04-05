# Write your MySQL query statement below
select ad_id, ifnull(ROUND((sum(action = "Clicked")/ sum(action <> "Ignored"))*100,2),0.0) as ctr
from Ads
group by ad_id
order by ctr desc, ad_id asc
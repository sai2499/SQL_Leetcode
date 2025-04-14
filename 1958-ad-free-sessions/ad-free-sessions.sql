-- Write your PostgreSQL query statement below
select session_id from Playback t1
left join Ads t2
on t1.customer_id = t2.customer_id 
and timestamp between start_time and end_time
where ad_id is null
/* Write your T-SQL query statement below */
with t1 as (
select spend_date, user_id, platform, amount,
count(platform) over (partition by spend_date,user_id) as d_cnt
from spending),

t2 as (
select spend_date, 'mobile' as platform,
    sum(case when platform='mobile' and d_cnt=1 then 1 else 0 end) as total_users,
    sum(case when platform='mobile' and d_cnt=1 then amount else 0 end) as total_amount
from t1
    group by spend_date),

t3 as (
    select spend_date, 'desktop' as platform,
    sum(case when platform='desktop' and d_cnt=1 then 1 else 0 end) as total_users,
    sum(case when platform='desktop' and d_cnt=1 then amount else 0 end) as total_amount
from t1
group by spend_date),

t4 as (
    select spend_date, 'both' as platform,
    sum(case when d_cnt=2 then amount else 0 end) as total_amount,
    count(distinct (case when d_cnt=2 then user_id else null end)) as total_users
from t1
group by spend_date)


select * from t2
union
select * from t3
union
select * from t4
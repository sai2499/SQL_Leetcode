# Write your MySQL query statement below
with Cte as (
    Select question_id, count(*) as c
    from SurveyLog
    where action = "answer"
    group by question_id
)

select question_id as survey_log
from Cte
order by c desc ,survey_log asc
limit 1
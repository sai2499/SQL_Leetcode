-- Write your PostgreSQL query statement below
select s.school_id, coalesce(min(e.score), -1) as score
from Schools s
left join Exam e
on s.capacity >= e.student_count
group by s.school_id
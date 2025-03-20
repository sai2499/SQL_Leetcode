# Write your MySQL query statement below

with cte as(
    select student_id, course_id, grade,
    dense_rank() over (partition by student_id order by grade desc) as rank_val
    from Enrollments
)

select student_id, min(course_id) as course_id, grade
from cte
where rank_val = 1
group by student_id

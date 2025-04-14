-- Write your PostgreSQL query statement below
with cte as(
    select task_id,generate_series(1,subtasks_count) as no_task
    from Tasks
)

select task_id, no_task as subtask_id
from cte
where (task_id, no_task) not in (
    select task_id, subtask_id from Executed
)
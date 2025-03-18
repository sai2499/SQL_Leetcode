# Write your MySQL query statement below
with cte as (
    select department_id,
        DATE_FORMAT(pay_date, '%Y-%m') as sal_month,
        avg(amount) over (partition by extract(MONTH FROM pay_date)) as comp_avg,
        avg(amount) over (partition by department_id, extract(MONTH FROM pay_date)) as dep_avg
        from Salary
        join employee on salary.employee_id = employee.employee_id)

select distinct sal_month as pay_month,
    department_id,
    case
        when comp_avg = dep_avg then 'same'
        when comp_avg > dep_avg then 'lower'
        when comp_avg < dep_avg then 'higher' 
    end as 'comparison'
    from cte
    order by sal_month desc;
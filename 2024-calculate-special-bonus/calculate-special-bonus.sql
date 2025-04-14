 select employee_id , 
   case 
    when mod(employee_id,2) <>0 and left(name,1) <> 'M' then salary 
    else 0
   end as bonus
from employees
order by employee_id;
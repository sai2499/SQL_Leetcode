select 'bull' as word, count(*) as count
from Files
where content ilike '% bull %' 
union
select 'bear' as word, count(*) as count
from Files
where content ilike '% bear %' 
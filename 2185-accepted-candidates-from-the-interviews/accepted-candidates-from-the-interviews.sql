select c.candidate_id
from Rounds r
join Candidates c
using (interview_id)
where c.years_of_exp >= 2
group by c.candidate_id
having sum(score) > 15
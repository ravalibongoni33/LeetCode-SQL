select s.student_id, student_name, s2.subject_name, ifnull(count(e.student_id),0) as attended_exams
from students as s
join subjects as s2
left join examinations as e on s.student_id= e.student_id and s2.subject_name = e.subject_name
group by 1,3
order by 1,3
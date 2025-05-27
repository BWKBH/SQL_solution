select
    s.student_id,
    s.student_name,
    sj.subject_name,
    count(e.subject_name) as "attended_exams"
from
    students as s
cross join
    subjects as sj
left join
    examinations as e
on sj.subject_name = e.subject_name and s.student_id = e.student_id
group by
    s.student_id
    , s.student_name
    , sj.subject_name
    , e.subject_name
order by
    s.student_id
    , sj.subject_name;

select
    b.name as name
    , a.grade
    , b.marks as marks
from
    students b
left outer join grades a
    on (b.marks>=a.min_mark and b.marks<=a.max_mark)
where
    a.grade >= 8
order by
    a.grade desc, b.name asc;

select
    replace(b.name,b.name,null) as name
        , a.grade
        , b.marks as marks
from
    students b
left outer join grades a
    on (b.marks>=a.min_mark and b.marks<=a.max_mark)
where
    a.grade < 8
order by
    a.grade desc
    , b.marks asc;

select
    s.name
from
    (
    students s
    left join packages p
    on
        p.id=s.id
    left join
        friends f
    on
        f.id=s.id
    left join
        packages p2
    on f.friend_id=p2.id
    )
where
    p.salary < p2.salary
order by
    p2.salary asc
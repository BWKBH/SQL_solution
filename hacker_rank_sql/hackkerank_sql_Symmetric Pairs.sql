select
    f1.x
    , f1.y
from
    (
        (
            select
                row_number() over() as r1,x,y
            from
                functions) as f1
            inner join 
            (
                select
                    row_number() over() as r2,x,y
                from
                    functions) as f2
            on f1.r1 <> f2.r2 and f1.x=f2.y and f2.x=f1.y and f1.x<=f1.y
    )
group by
    f1.x
    , f1.y
order by
    f1.x asc
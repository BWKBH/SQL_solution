select 
    group_concat(case when T.occupation="Doctor" then T.name else null end),
    group_concat(case when T.occupation="Professor" then T.name else null end),
    group_concat(case when T.occupation="Singer" then T.name else null end),
    group_concat(case when T.occupation="Actor" then T.name else null end)
from (
        select
        name
        , occupation
        , ROW_number() over(partition by occupation order by name) as "row_number"
        from
            occupations) as T
group by
    T.row_number
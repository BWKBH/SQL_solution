with accum as (
    select
        *
        , sum(weight) over (order by turn) as accum_sum
    from
        queue
)
select 
    person_name
from 
    queue
where turn=
    (
        select 
            max(turn)    
        from
            accum
        where
            accum_sum <= 1000
    )
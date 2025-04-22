with temp as (
    select 
        *
        ,rank() over(order by counted desc) as counted_desc
    from 
        (
        select
            h.hacker_id
            , h.name
            , count(c.challenge_id) as counted
        from
            hackers as h
        right join
            challenges as c
        on h.hacker_id = c.hacker_id
        group by h.hacker_id, h.name
        ) as t
)

select 
    hacker_id
    , name
    , counted as challenges_created
from 
    temp
where counted_desc = 1
    or counted in (
    select 
        counted
    from 
        temp
    group by 
        counted
    having count(*)=1
    )
order by 
    counted desc
    , hacker_id asc


